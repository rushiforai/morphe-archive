package dev.abotmaker.ramblerenhancements.patches

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.xml.sax.InputSource
import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory

class RamblerEnhancementsPatchTest {
    @Test
    fun catalogPublishesAllSevenSingleAppGboardRamblerPatches() {
        val patches = PatchCatalog.morpheRegistrations
        assertEquals(7, patches.size)
        val names = patches.mapNotNull { it.name }.toSet()
        assertEquals(
            setOf(
                "Rambler Waveform Animation",
                "Rambler Custom Instructions",
                "Rambler Personal Dictionary",
                "Rambler Contact Names",
                "Rambler Cursor-Aware Editing",
                "Rambler App Context",
                "Rambler Productivity Tools",
            ),
            names,
        )
        for (patch in patches) {
            // Single-app bundle (only com.google.android.inputmethod.latin) ensures Morphe Manager
            // recognizes it via soleAppByUid and displays "Update available / Repatch" badges on
            // Gboard whenever a new release ships, and named targets expose it in "Need help finding the APK?".
            assertEquals(1, patch.compatibility?.size)
            val gboardCompat = patch.compatibility!!.single()
            assertEquals(GBOARD_PACKAGE, gboardCompat.packageName)
            val targets = gboardCompat.targets
            assertTrue(
                "Patch ${patch.name} should declare stable verified target $VERIFIED_GBOARD_VERSION",
                targets.any { it.version == VERIFIED_GBOARD_VERSION && !it.isExperimental },
            )
            assertTrue(
                "Patch ${patch.name} should declare experimental target $EXPERIMENTAL_GBOARD_VERSION",
                targets.any { it.version == EXPERIMENTAL_GBOARD_VERSION && it.isExperimental },
            )
            assertTrue(
                "Patch ${patch.name} description should note verified 18.5.4 + unverified newer builds",
                patch.description.orEmpty().contains("18.5.4"),
            )
        }
    }

    @Test
    fun manifestRegistrationAndSettingsInjectionAreIdempotent() {
        val manifest = parseXml(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.google.android.inputmethod.latin">
                <application />
            </manifest>
            """.trimIndent(),
        )
        registerSettingsActivity(manifest)
        registerSettingsActivity(manifest)
        ensureLauncherQueries(manifest)
        ensureLauncherQueries(manifest)
        val activities = manifest.documentElement.childElements("application").single().childElements("activity")
        assertEquals(1, activities.size)
        assertEquals("false", activities.single().androidAttr("exported"))
        assertEquals(SETTINGS_ACTIVITY_CLASS, activities.single().androidAttr("name"))
        val queries = manifest.documentElement.childElements("queries")
        assertEquals(1, queries.size)
        assertEquals(1, queries.single().childElements("intent").size)

        val screen = parseXml(
            """
            <PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
                <Preference android:key="rambler_dictionary" />
                <androidx.preference.PreferenceCategory>
                    <Preference android:key="pref_key_jetson_feedback" />
                </androidx.preference.PreferenceCategory>
            </PreferenceScreen>
            """.trimIndent(),
        )
        val allFeatures = RamblerFeature.values().toSet()
        injectExhaustiveJetsonVoicePreferences(screen, allFeatures)
        injectExhaustiveJetsonVoicePreferences(screen, allFeatures)

        // Instructions & app rules is placed first; single Rambler Enhancements category sits above Help and feedback.
        val topChildren = screen.documentElement.childElements()
        assertEquals(
            "rambler_enh_custom_instructions_entry",
            topChildren.first().childElements("Preference").single().androidAttr("key"),
        )
        assertEquals(
            "pref_key_jetson_feedback",
            topChildren.last().childElements("Preference").single().androidAttr("key"),
        )
        assertEquals(0, screen.getElementsByTagName("EditTextPreference").length)
        assertEquals(0, screen.getElementsByTagName("SwitchPreferenceCompat").length)
        val sections = (0 until screen.getElementsByTagName("extra").length).map { idx ->
            (screen.getElementsByTagName("extra").item(idx) as org.w3c.dom.Element)
                .androidAttr("value")
        }
        assertEquals(
            listOf(
                "custom_instructions",
                "waveform",
                "behavior",
                "productivity",
                "dictionary",
                "history",
                "backup",
            ),
            sections,
        )

        // Partial selection only injects the chosen feature's rows (+ universal Backup entry).
        val waveformOnlyScreen = parseXml(
            """
            <PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
                <androidx.preference.PreferenceCategory>
                    <Preference android:key="pref_key_jetson_feedback" />
                </androidx.preference.PreferenceCategory>
            </PreferenceScreen>
            """.trimIndent(),
        )
        injectExhaustiveJetsonVoicePreferences(waveformOnlyScreen, setOf(RamblerFeature.WAVEFORM))
        assertEquals(0, waveformOnlyScreen.getElementsByTagName("EditTextPreference").length)
        assertEquals(0, waveformOnlyScreen.getElementsByTagName("SwitchPreferenceCompat").length)
        val waveformExtras = waveformOnlyScreen.getElementsByTagName("extra")
        assertEquals(2, waveformExtras.length)
        assertEquals("waveform", (waveformExtras.item(0) as org.w3c.dom.Element).androidAttr("value"))
        assertEquals("backup", (waveformExtras.item(1) as org.w3c.dom.Element).androidAttr("value"))

        val voiceScreen = parseXml(
            """
            <PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
                <PreferenceCategory />
            </PreferenceScreen>
            """.trimIndent(),
        )
        injectSettingsEntryPreference(voiceScreen)
        injectSettingsEntryPreference(voiceScreen)
        assertEquals(1, voiceScreen.getElementsByTagName("Preference").length)
    }

    @Test
    fun patchesBundleJsonMatchesMorpheLocalDateTimeSchema() {
        val bundleFile = listOf(
            java.io.File("patches-bundle.json"),
            java.io.File("../patches-bundle.json"),
        ).first { it.isFile }
        val json = com.google.gson.JsonParser.parseString(bundleFile.readText()).asJsonObject
        val createdAt = json.get("created_at").asString
        // Morphe Manager deserializes created_at via java.time.LocalDateTime.parse (no 'Z' or offset!).
        val parsed = java.time.LocalDateTime.parse(createdAt)
        assertTrue(parsed.year >= 2026)
        assertTrue(json.get("download_url").asString.endsWith(".mpp"))
        assertTrue(json.get("version").asString.isNotBlank())
    }

    @Test
    fun dynamicConfigClinitAllocatesRegistersEvenWhenOriginalHadZero() {
        val zeroRegClinit = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
            DYNAMIC_CONFIG_TYPE,
            "<clinit>",
            emptyList(),
            "V",
            com.android.tools.smali.dexlib2.AccessFlags.STATIC.value or
                com.android.tools.smali.dexlib2.AccessFlags.CONSTRUCTOR.value,
            emptySet(),
            emptySet(),
            com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(0),
        )
        val configClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                DYNAMIC_CONFIG_TYPE,
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                "Ljava/lang/Object;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                listOf(zeroRegClinit),
            ),
        )
        val state = RamblerPatchRunState().apply {
            selectedFeatures.addAll(RamblerFeature.values())
        }
        rewriteDynamicConfigClinitOnClass(configClass, state)

        val clinit = configClass.methods.single { it.name == "<clinit>" }
        val impl = clinit.implementation!!
        assertTrue(
            "Expected registerCount >= 1 so v0 passes ART DEX verification, got ${impl.registerCount}",
            impl.registerCount >= 1,
        )
        assertTrue("Expected non-empty <clinit> instructions", impl.instructions.size > 20)
        assertEquals(com.android.tools.smali.dexlib2.Opcode.RETURN_VOID, impl.instructions.last().opcode)
    }

    @Test
    fun helperMethodRetainsTryCatchMetadataForMoveException() {
        val host = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                "Lcom/example/Host;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                "Ljava/lang/Object;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                emptyList(),
            ),
        )
        host.addHelperMethodIfMissing(
            name = "safeCommit",
            parameterTypes = listOf("Ljava/lang/Object;"),
            returnType = "Z",
            accessFlags = com.android.tools.smali.dexlib2.AccessFlags.PRIVATE.value or
                com.android.tools.smali.dexlib2.AccessFlags.STATIC.value,
            registerCount = 3,
            body = """
                :start
                invoke-static {}, $FLAG_RUNTIME_TYPE->isAppendOnlyEnabled()Z
                move-result v0
                if-eqz v0, :commit
                :end
                .catch Ljava/lang/Throwable; {:start .. :end} :failed
                goto :commit
                :failed
                move-exception v0
                :commit
                const/4 v0, 0x1
                return v0
            """,
        )
        val helper = host.methods.single { it.name == "safeCommit" }
        val impl = helper.implementation!!
        assertEquals(1, impl.tryBlocks.size)
        val handler = impl.tryBlocks.single().exceptionHandlers.single()
        assertEquals("Ljava/lang/Throwable;", handler.exceptionType)
        val moveExIndex = impl.instructions.indexOfFirst {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.MOVE_EXCEPTION
        }
        assertTrue("Expected move-exception instruction", moveExIndex > 0)
        assertEquals(
            impl.instructions[moveExIndex].location.codeAddress,
            handler.handlerCodeAddress,
        )
    }

    @Test
    fun flagHookInsertionTargetsFirstPostLoopSnapshotCheckBeforeBranchReusesV0() {
        val dummyField = com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference(
            "Loki;",
            "e",
            "Z",
        )
        val instructions = listOf(
            // 0: arrayLoadIndex (aget-object v8, v8, v7)
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x(
                com.android.tools.smali.dexlib2.Opcode.AGET_OBJECT,
                8,
                8,
                7,
            ),
            // 1: if-eqz v8, +4
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t(
                com.android.tools.smali.dexlib2.Opcode.IF_EQZ,
                8,
                4,
            ),
            // 2: const/4 v5, 1
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                com.android.tools.smali.dexlib2.Opcode.CONST_4,
                5,
                1,
            ),
            // 3: FIRST if-eqz v0 (if (okrVar != null)) -> MUST select this index!
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t(
                com.android.tools.smali.dexlib2.Opcode.IF_EQZ,
                0,
                10,
            ),
            // 4: iget-boolean v0, v10, Loki;.e:Z (reuses v0 inside okrVar != null branch)
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c(
                com.android.tools.smali.dexlib2.Opcode.IGET_BOOLEAN,
                0,
                10,
                dummyField,
            ),
            // 5: SECOND if-eqz v0 (if (this.e)) -> MUST NOT select this!
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t(
                com.android.tools.smali.dexlib2.Opcode.IF_EQZ,
                0,
                4,
            ),
            // 6: placeholder equalsIndex
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                com.android.tools.smali.dexlib2.Opcode.NOP,
            ),
        )
        val chosen = RamblerDynamicResolver.findPostLoopSnapshotCheckIndex(
            instructions = instructions,
            arrayLoadIndex = 0,
            equalsIndex = 6,
            snapshotReg = 0,
        )
        assertEquals(3, chosen)
    }

    @Test
    fun perAppCustomInstructionHookPreservesBranchesTargetingReturnObject() {
        val stockImpl = com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
            11,
            listOf(
                // addr 0 (size 1): const/4 v1, 0
                com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                    com.android.tools.smali.dexlib2.Opcode.CONST_4,
                    1,
                    0,
                ),
                // addr 1 (size 1): const/4 v4, 0
                com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                    com.android.tools.smali.dexlib2.Opcode.CONST_4,
                    4,
                    0,
                ),
                // addr 2 (size 2): if-eqz v4, +3 -> jumps directly to addr 5 (return-object v1)
                com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t(
                    com.android.tools.smali.dexlib2.Opcode.IF_EQZ,
                    4,
                    3,
                ),
                // addr 4 (size 1): const/4 v0, 1 (simulates user_preferences write block)
                com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                    com.android.tools.smali.dexlib2.Opcode.CONST_4,
                    0,
                    1,
                ),
                // addr 5 (size 1): return-object v1
                com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                    com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT,
                    1,
                ),
            ),
            emptyList(),
            emptyList(),
        )
        val method = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lfhv;",
                "t",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Lkth;",
                        emptySet(),
                        null,
                    ),
                ),
                "Landroid/os/Bundle;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                emptySet(),
                emptySet(),
                stockImpl,
            ),
        )
        val retIdx = method.implementation!!.instructions.indexOfLast {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT
        }
        installPerAppCustomInstructionHook(
            SessionBundleTargets(
                bundleMethod = method,
                contextField = "b",
                editorInfoField = "h",
                returnIndicesAndRegisters = listOf(retIdx to 1),
            ),
        )

        val insns = method.implementation!!.instructions
        assertEquals(com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC, insns[0].opcode)
        val applyIdx = insns.indexOfFirst { insn ->
            val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            ref?.name == "applyPerAppCustomInstruction"
        }
        val finalRetIdx = insns.indexOfLast {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT
        }
        assertTrue("Expected applyPerAppCustomInstruction before return-object", applyIdx in 1 until finalRetIdx)
        val branch = insns.first {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.IF_EQZ
        } as com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
        assertEquals(
            "Branch targeting return-object must land on applyPerAppCustomInstruction, not skip over it",
            insns[applyIdx].location.codeAddress,
            branch.target.location.codeAddress,
        )
    }

    @Test
    fun activateHookUsesInvokeStaticRangeForHighRegisterMethods() {
        val highRegMethod = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lfhv;",
                "I",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Landroid/view/inputmethod/EditorInfo;",
                        emptySet(),
                        null,
                    ),
                ),
                "V",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    26,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        installExtensionActivateHook(ActivateHookTargets(highRegMethod, "b"))
        val first = highRegMethod.implementation!!.instructions.first()
        assertEquals(com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC_RANGE, first.opcode)
    }

    @Test
    fun voiceLifecycleStatsHooksInjectZeroArgStaticCallsAtEntry() {
        fun stubMethod(name: String, params: List<String>) =
            app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
                com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                    "Lfhv;",
                    name,
                    params.map {
                        com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                            it,
                            emptySet(),
                            null,
                        )
                    },
                    "V",
                    com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                        9,
                        listOf(
                            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                                com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,
                            ),
                        ),
                        emptyList(),
                        emptyList(),
                    ),
                ),
            )

        val onStart = stubMethod("f", listOf("Lyvx;"))
        val onStop = stubMethod("fH", emptyList())
        installVoiceLifecycleStatsHooks(VoiceLifecycleTargets(onStart, onStop))

        val startFirst = onStart.implementation!!.instructions.first() as
            com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
        val stopFirst = onStop.implementation!!.instructions.first() as
            com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
        assertEquals(com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC, startFirst.opcode)
        assertEquals(com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC, stopFirst.opcode)
        assertEquals(
            "onVoiceStart",
            (startFirst.reference as com.android.tools.smali.dexlib2.iface.reference.MethodReference).name,
        )
        assertEquals(
            "onListeningStop",
            (stopFirst.reference as com.android.tools.smali.dexlib2.iface.reference.MethodReference).name,
        )
    }

    private fun parseXml(xml: String) = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
    }.newDocumentBuilder().parse(InputSource(StringReader(xml)))
}
