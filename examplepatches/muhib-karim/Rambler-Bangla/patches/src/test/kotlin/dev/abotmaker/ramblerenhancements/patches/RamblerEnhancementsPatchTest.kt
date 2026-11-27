package dev.abotmaker.ramblerenhancements.patches

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.xml.sax.InputSource
import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory

class RamblerEnhancementsPatchTest {
    @Test
    fun catalogPublishesAllThirteenSingleAppGboardRamblerPatches() {
        val patches = PatchCatalog.morpheRegistrations
        assertEquals(13, patches.size)
        val names = patches.mapNotNull { it.name }.toSet()
        assertEquals(
            setOf(
                "Rambler Bangla Lite Script Policy",
                "Rambler Bangla Phonetic & Multilingual Engine",
                "AMOLED Dark Keyboard",
                "Rambler Toolbar & Revert Extras",
                "Hidden Flags Override",
                "At-Mention & Email Strip Suggestions",
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
                "bangla",
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

    @Test
    fun toolbarAccessPointHooksInjectCatalogAndControllerDelegates() {
        val orderMethod = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Laagb;",
                "m",
                listOf(
                    "Landroid/content/Context;",
                    "Laaiz;",
                    "Lackz;",
                    "Lauco;",
                    "Lauco;",
                ).map {
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        it,
                        emptySet(),
                        null,
                    )
                },
                "Laagb;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    21,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                            com.android.tools.smali.dexlib2.Opcode.CONST_4,
                            0,
                            0,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        val controllerCtor = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Laajh;",
                "<init>",
                listOf("Landroid/content/Context;", "Laalq;").map {
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        it,
                        emptySet(),
                        null,
                    )
                },
                "V",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.CONSTRUCTOR.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    11,
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

        installToolbarAccessPointHooks(
            AccessPointTargets(
                orderFactoryMethod = orderMethod,
                controllerConstructor = controllerCtor,
                immutableSetType = "Lauco;",
                controllerClass = "aajh",
                controllerOrderHelperField = "g",
                controllerRegisterMethod = "g",
                orderHelperClass = "aaia",
                orderHelperCatalogField = "b",
                immutableSetClass = "auco",
                immutableSetCopyMethod = "n",
                descriptorClass = "aadr",
                descriptorBuilderFactoryMethod = "m",
                builderBaseClass = "aadm",
                builderConcreteClass = "aaej",
                builderTokenMethod = "q",
                builderRunnableMethod = "v",
                builderBuildMethod = "b",
                builderIconField = "c",
                builderLabelField = "d",
            ),
        )

        val orderInvokes = orderMethod.implementation!!.instructions
            .filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction>()
            .mapNotNull { it.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference }
        assertTrue(orderInvokes.any { it.name == "includeOrderCatalog" })

        val ctorInsns = controllerCtor.implementation!!.instructions.toList()
        assertEquals(com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC_RANGE, ctorInsns[0].opcode)
        assertEquals(com.android.tools.smali.dexlib2.Opcode.RETURN_VOID, ctorInsns[1].opcode)
        val ctorRef = (ctorInsns[0] as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            .reference as com.android.tools.smali.dexlib2.iface.reference.MethodReference
        assertEquals("afterControllerCreated", ctorRef.name)
    }

    @Test
    fun spacebarTriggerHooksWrapInitialStateWithFiveRegistersAndCaptureExtensionSafely() {
        val agenticCtor = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lkov;",
                "<init>",
                listOf("Landroid/content/Context;", "Lagrh;", "Lagrd;", "Lkwy;", "Lkny;").map {
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        it,
                        emptySet(),
                        null,
                    )
                },
                "V",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.CONSTRUCTOR.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    7,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c(
                            com.android.tools.smali.dexlib2.Opcode.INVOKE_DIRECT,
                            1,
                            1,
                            0,
                            0,
                            0,
                            0,
                            com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(
                                "Ladbc;",
                                "<init>",
                                emptyList(),
                                "V",
                            ),
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        val agenticClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                "Lkov;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                "Ladbc;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                listOf(agenticCtor),
            ),
        )
        val consumeEvent = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lafzt;",
                "m",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Ladan;",
                        emptySet(),
                        null,
                    ),
                ),
                "Z",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    12,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                            com.android.tools.smali.dexlib2.Opcode.CONST_4,
                            0,
                            0,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        val initialState = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lafzt;",
                "em",
                listOf("Laeuj;", "Landroid/view/inputmethod/EditorInfo;").map {
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        it,
                        emptySet(),
                        null,
                    )
                },
                "J",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    3,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l(
                            com.android.tools.smali.dexlib2.Opcode.CONST_WIDE,
                            0,
                            0x10000000000L,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN_WIDE,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        val langPickerClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                "Lafzt;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                "Ladbc;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                listOf(consumeEvent, initialState),
            ),
        )
        val dispatchTouch = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
                "dispatchTouchEvent",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Landroid/view/MotionEvent;",
                        emptySet(),
                        null,
                    ),
                ),
                "Z",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    6,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                            com.android.tools.smali.dexlib2.Opcode.CONST_4,
                            0,
                            1,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            ),
        )
        val softKeyboardViewClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                "Landroid/widget/FrameLayout;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                listOf(dispatchTouch),
            ),
        )
        val agenticTargets = AgenticExtensionTargets(agenticClass, agenticClass.methods.single(), 1)
        val lpConsume = langPickerClass.methods.single { it.name == "m" }
        val lpInit = langPickerClass.methods.single { it.name == "em" }
        val skvDispatch = softKeyboardViewClass.methods.single { it.name == "dispatchTouchEvent" }

        installAgenticCtorStartupHook(agenticTargets)
        installSpacebarTriggerHooks(
            agenticTargets,
            SpacebarTriggerTargets(
                langPickerClass = langPickerClass,
                consumeEventMethod = lpConsume,
                initialStateMethod = lpInit,
                softKeyboardViewClass = softKeyboardViewClass,
                softKeyboardDispatchTouchMethod = skvDispatch,
                eventGetKeyDataMethod = "g",
                eventActionField = "a",
                keyDataCodeField = "d",
                keyDataDataField = "f",
                extGetContextMethod = "ae",
                agenticIsActiveMethod = "aj",
                agenticTriggerMethod = "C",
                agenticClassName = "kov",
                agenticUiManagerField = "c",
                uiManagerGetStateMethod = "h",
            ),
        )

        // Agentic.<init> calls onRamblerStart right after super.<init> and onAgenticExtensionCreated before return-void.
        val ctorInsns = agenticTargets.contextConstructor.implementation!!.instructions.toList()
        val ctorMethodNames = ctorInsns
            .filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction>()
            .mapNotNull { (it.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.name }
        assertEquals(listOf("<init>", "onRamblerStart", "onAgenticExtensionCreated"), ctorMethodNames)
        assertEquals(com.android.tools.smali.dexlib2.Opcode.RETURN_VOID, ctorInsns.last().opcode)

        // consumeEvent calls maybeHandleSpaceLongPress at entry.
        val firstConsume = lpConsume.implementation!!.instructions.first()
            as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
        assertEquals(
            "maybeHandleSpaceLongPress",
            (firstConsume.reference as com.android.tools.smali.dexlib2.iface.reference.MethodReference).name,
        )

        // SoftKeyboardView.dispatchTouchEvent is wrapped branchlessly and delegates to private morpheRamblerStockDispatchTouch.
        val wrappedTouch = softKeyboardViewClass.methods.single { it.name == "dispatchTouchEvent" }
        val stockTouch = softKeyboardViewClass.methods.single { it.name == "morpheRamblerStockDispatchTouch" }
        assertEquals(3, wrappedTouch.implementation!!.registerCount)
        assertEquals(6, stockTouch.implementation!!.registerCount)
        assertTrue((stockTouch.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.PRIVATE.value) != 0)
        val wrappedTouchInvokes = wrappedTouch.implementation!!.instructions
            .filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction>()
            .mapNotNull { (it.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.name }
        assertEquals(listOf("onKeyboardTouchEvent", "morpheRamblerStockDispatchTouch"), wrappedTouchInvokes)

        // getInitialKeyboardState is wrapped with 5 registers and delegates to private morpheRamblerStockInitialState.
        val wrappedInit = langPickerClass.methods.single { it.name == "em" }
        val helperInit = langPickerClass.methods.single { it.name == "morpheRamblerStockInitialState" }
        assertEquals(5, wrappedInit.implementation!!.registerCount)
        assertEquals(3, helperInit.implementation!!.registerCount)
        assertTrue((helperInit.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.PRIVATE.value) != 0)
        val wrappedInvokes = wrappedInit.implementation!!.instructions
            .filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction>()
            .mapNotNull { (it.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.name }
        assertEquals(listOf("shouldClearNoImePickerState", "morpheRamblerStockInitialState"), wrappedInvokes)
    }

    @Test
    fun spacebarTouchWrapperStacksCleanlyWithGboardWuV450ClipboardSelectAllInBothOrders() {
        fun makeSoftKeyboardView(): app.morphe.patcher.util.proxy.mutableTypes.MutableClass {
            val stockDispatch = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
                "dispatchTouchEvent",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Landroid/view/MotionEvent;",
                        emptySet(),
                        null,
                    ),
                ),
                "Z",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    6,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                            com.android.tools.smali.dexlib2.Opcode.CONST_4,
                            0,
                            1,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            )
            return app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
                com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;",
                    com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                    "Landroid/widget/FrameLayout;",
                    emptyList(),
                    null,
                    emptySet(),
                    emptyList(),
                    listOf(stockDispatch),
                ),
            )
        }

        fun applyGboardWuV450ClipboardSelectAllTouchWrapper(
            skvClass: app.morphe.patcher.util.proxy.mutableTypes.MutableClass,
        ) {
            // Reproduces upstream GboardWu v4.5.0 GboardClipboardSelectAllPatch.wrapClipboardSelectAll:
            // renames dispatchTouchEvent -> jasondevClipboardStockTouch and builds the replacement
            // via plain addInstructions(0, ...) containing an internal `:stock` label.
            val target = skvClass.methods.single { it.name == "dispatchTouchEvent" }
            val stockImpl = target.implementation!!
            val helper = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
                com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                    skvClass.type,
                    "jasondevClipboardStockTouch",
                    target.parameters,
                    "Z",
                    com.android.tools.smali.dexlib2.AccessFlags.PRIVATE.value or
                        com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                    target.annotations,
                    target.hiddenApiRestrictions,
                    stockImpl,
                ),
            )
            skvClass.methods.remove(target)
            skvClass.methods.add(helper)
            val wrapper = app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
                com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                    skvClass.type,
                    "dispatchTouchEvent",
                    target.parameters,
                    "Z",
                    target.accessFlags,
                    emptySet(),
                    emptySet(),
                    com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(4),
                ),
            )
            app.morphe.patcher.extensions.InstructionExtensions.run {
                wrapper.addInstructions(
                    0,
                    """
                    invoke-static/range {p0 .. p1}, Ldev/jason/gboardpatches/extension/clipboard/GboardClipboardSelectAllRuntime;->interceptTouch(Ljava/lang/Object;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :stock
                    return v0
                    :stock
                    invoke-direct/range {p0 .. p1}, ${skvClass.type}->jasondevClipboardStockTouch(Landroid/view/MotionEvent;)Z
                    move-result v0
                    return v0
                    """.trimIndent(),
                )
            }
            skvClass.methods.add(wrapper)
        }

        fun runRamblerSpacebarHook(
            skvClass: app.morphe.patcher.util.proxy.mutableTypes.MutableClass,
        ): app.morphe.patcher.util.proxy.mutableTypes.MutableClass {
            val agenticCtor = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lfhv;",
                "<init>",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Landroid/content/Context;",
                        emptySet(),
                        null,
                    ),
                ),
                "V",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.CONSTRUCTOR.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    3,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            )
            val agenticClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
                com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                    "Lfhv;",
                    com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                    "Ljava/lang/Object;",
                    emptyList(),
                    null,
                    emptySet(),
                    emptyList(),
                    listOf(agenticCtor),
                ),
            )
            val consumeEvent = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lpvd;",
                "m",
                listOf(
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        "Lohe;",
                        emptySet(),
                        null,
                    ),
                ),
                "Z",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    6,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                            com.android.tools.smali.dexlib2.Opcode.CONST_4,
                            0,
                            0,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            )
            val initialState = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                "Lpvd;",
                "em",
                listOf("Lfoo;", "Landroid/view/inputmethod/EditorInfo;").map {
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
                        it,
                        emptySet(),
                        null,
                    )
                },
                "J",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or
                    com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                    3,
                    listOf(
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l(
                            com.android.tools.smali.dexlib2.Opcode.CONST_WIDE,
                            0,
                            0x10000000000L,
                        ),
                        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                            com.android.tools.smali.dexlib2.Opcode.RETURN_WIDE,
                            0,
                        ),
                    ),
                    emptyList(),
                    emptyList(),
                ),
            )
            val langPickerClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
                com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                    "Lpvd;",
                    com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
                    "Ljava/lang/Object;",
                    emptyList(),
                    null,
                    emptySet(),
                    emptyList(),
                    listOf(consumeEvent, initialState),
                ),
            )
            installSpacebarTriggerHooks(
                AgenticExtensionTargets(agenticClass, agenticClass.methods.single(), 1),
                SpacebarTriggerTargets(
                    langPickerClass = langPickerClass,
                    consumeEventMethod = langPickerClass.methods.single { it.name == "m" },
                    initialStateMethod = langPickerClass.methods.single { it.name == "em" },
                    softKeyboardViewClass = skvClass,
                    softKeyboardDispatchTouchMethod = skvClass.methods.single { it.name == "dispatchTouchEvent" },
                    eventGetKeyDataMethod = "g",
                    eventActionField = "a",
                    keyDataCodeField = "d",
                    keyDataDataField = "f",
                    extGetContextMethod = "ae",
                    agenticIsActiveMethod = "aj",
                    agenticTriggerMethod = "C",
                    agenticClassName = "fhv",
                    agenticUiManagerField = "c",
                    uiManagerGetStateMethod = "h",
                ),
            )
            return langPickerClass
        }

        fun serializeAndVerifyBranches(
            cls: app.morphe.patcher.util.proxy.mutableTypes.MutableClass,
        ): Map<String, List<Pair<Int, Int>>> {
            val pool = com.android.tools.smali.dexlib2.writer.pool.DexPool(
                com.android.tools.smali.dexlib2.Opcodes.getDefault(),
            )
            pool.internClass(cls)
            val store = com.android.tools.smali.dexlib2.writer.io.MemoryDataStore()
            pool.writeTo(store)
            val dex = com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile(
                com.android.tools.smali.dexlib2.Opcodes.getDefault(),
                com.android.tools.smali.dexlib2.dexbacked.DexBuffer(store.data),
            )
            val serializedCls = dex.classes.single()
            val branchOffsetsByMethod = mutableMapOf<String, List<Pair<Int, Int>>>()
            for (method in serializedCls.methods) {
                val impl = method.implementation ?: continue
                val insns = impl.instructions.toList()
                val validOffsets = mutableSetOf<Int>()
                var addr = 0
                val addrByIdx = IntArray(insns.size)
                for (i in insns.indices) {
                    addrByIdx[i] = addr
                    validOffsets.add(addr)
                    addr += insns[i].codeUnits
                }
                val branches = mutableListOf<Pair<Int, Int>>()
                for (i in insns.indices) {
                    val insn = insns[i]
                    if (insn is com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction) {
                        val offset = insn.codeOffset
                        val pc = addrByIdx[i]
                        assertTrue(
                            "${method.name} @0x${pc.toString(16)} must not have zero branch offset",
                            offset != 0,
                        )
                        val target = pc + offset
                        assertTrue(
                            "${method.name} @0x${pc.toString(16)} target 0x${target.toString(16)} must land on an instruction boundary (valid=$validOffsets)",
                            target in validOffsets,
                        )
                        branches.add(pc to offset)
                    }
                }
                branchOffsetsByMethod[method.name] = branches
            }
            return branchOffsetsByMethod
        }

        // Order 1: GboardWu v4.5.0 runs FIRST, Rambler Enhancements runs SECOND (the reported crash scenario).
        val skvWuFirst = makeSoftKeyboardView()
        applyGboardWuV450ClipboardSelectAllTouchWrapper(skvWuFirst)
        val lpClass = runRamblerSpacebarHook(skvWuFirst)
        val wuFirstBranches = serializeAndVerifyBranches(skvWuFirst)
        assertEquals(emptyList<Pair<Int, Int>>(), wuFirstBranches["dispatchTouchEvent"])
        assertEquals(listOf(4 to 3), wuFirstBranches["morpheRamblerStockDispatchTouch"])

        // Order 2: Rambler Enhancements runs FIRST, GboardWu v4.5.0 runs SECOND.
        val skvRamblerFirst = makeSoftKeyboardView()
        runRamblerSpacebarHook(skvRamblerFirst)
        applyGboardWuV450ClipboardSelectAllTouchWrapper(skvRamblerFirst)
        val ramblerFirstBranches = serializeAndVerifyBranches(skvRamblerFirst)
        assertEquals(listOf(4 to 3), ramblerFirstBranches["dispatchTouchEvent"])
        assertEquals(emptyList<Pair<Int, Int>>(), ramblerFirstBranches["jasondevClipboardStockTouch"])

        // Also verify our hardened getInitialKeyboardState wrapper survives another patch prepending
        // a 3-unit instruction at index 0 (internal `:rambler_stock_initial_state` label shifts cleanly).
        val wrappedInit = lpClass.methods.single { it.name == "em" }
        app.morphe.patcher.extensions.InstructionExtensions.run {
            wrappedInit.addInstructions(0, "invoke-static {}, Ljava/lang/System;->gc()V")
        }
        val lpBranches = serializeAndVerifyBranches(lpClass)
        assertTrue(lpBranches["em"]!!.isNotEmpty())
    }

    private fun parseXml(xml: String) = DocumentBuilderFactory.newInstance().apply {
        isNamespaceAware = true
    }.newDocumentBuilder().parse(InputSource(StringReader(xml)))
}
