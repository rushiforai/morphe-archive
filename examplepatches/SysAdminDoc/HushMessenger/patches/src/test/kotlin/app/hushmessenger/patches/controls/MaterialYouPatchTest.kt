package app.hushmessenger.patches.controls

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.nio.file.Files
import java.nio.file.Path
import kotlin.io.path.readText
import kotlin.test.*

class MaterialYouPatchTest {
    private val scheme = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;"

    private fun tokenMethod(name: String, token: String, call: String, callOwner: String = token) =
        fixtureMethod("$scheme->$name($token)I", """
            const/4 v0, 0x0
            invoke-static {p1, v0}, LX/33W;->A0j(Ljava/lang/Object;I)V
            invoke-interface {p1}, $callOwner->$call()I
            move-result v0
            return v0
        """.trimIndent(), 3)

    private val integerOverload = fixtureMethod("$scheme->Asy(Ljava/lang/Integer;)I", """
        invoke-virtual {p1}, Ljava/lang/Number;->intValue()I
        move-result v0
        return v0
    """.trimIndent(), 3)

    @Test fun findsTheTokenResolverUnderEveryNamingGroupsNames() {
        // How 346013440, 346013372, 346013423, 346013357 and 346013374 name the method, the token and its call.
        val groups = listOf(
            Triple("DCz", "LX/4r6;", "ApL"),
            Triple("DCt", "LX/4rB;", "ApN"),
            Triple("DEL", "LX/4uQ;", "ApV"),
            Triple("DCy", "LX/4r0;", "ApM"),
            Triple("DCs", "LX/4sy;", "ApJ"),
        )
        for ((name, token, call) in groups) {
            val resolver = tokenMethod(name, token, call)
            assertSame(resolver, listOf(integerOverload, resolver).filter(::isTokenColorMethod).single(), name)
        }
    }

    @Test fun skipsMethodsThatDoNotReadTheColourFromTheirOwnToken() {
        assertFalse(isTokenColorMethod(integerOverload))
        assertFalse(isTokenColorMethod(tokenMethod("DCz", "LX/4r6;", "ApL", callOwner = "LX/9zz;")))
        val withArgument = fixtureMethod("$scheme->DCz(LX/4r6;)I", """
            const/4 v0, 0x1
            invoke-interface {p1, v0}, LX/4r6;->ApL(I)I
            move-result v0
            return v0
        """.trimIndent(), 3)
        assertFalse(isTokenColorMethod(withArgument))
    }

    @Test fun compatReportChecksWhatThePatchRewrites() {
        // scripts/CompatReport.java checks every build for these; a value changed on one side only fails here.
        val report = Path.of("../scripts/CompatReport.java").readText()
        assertContains(report, "DARK_SCHEME = \"$DARK_SCHEME\";")
        assertContains(report, "FDS_COLORS = \"$FDS_COLORS\";")
        fun javaSet(name: String) = assertNotNull(Regex("""$name = Set\.of\((.*?)\);""", RegexOption.DOT_MATCHES_ALL).find(report), name).groupValues[1]
        assertEquals(materialYouSurfaces.keys, javaSet("DARK_SURFACES").split(",").map { it.trim().removePrefix("0x").toLong(16).toInt() }.toSet())
        assertEquals(materialYouColorCalls.keys, Regex("\"([^\"]+)\"").findAll(javaSet("COLOR_CALLS")).map { it.groupValues[1] }.toSet())
    }

    @Test fun onlyClassesWithThemeEditsBecomeMutable(@TempDir temporary: Path) {
        val unrelated = (0 until 300).map { index ->
            ImmutableClassDef.of(fixtureClass("LX/Unrelated$index;", listOf(
                fixtureMethod("LX/Unrelated$index;->run()V", "return-void"))))
        }
        val extension = ImmutableClassDef.of(fixtureClass("Lapp/hushmessenger/extension/Other;", listOf(
            fixtureMethod("Lapp/hushmessenger/extension/Other;->color()I", "const v0, -0xf7f7f7\nreturn v0"))))
        withThemeContext(temporary, themeClasses() + unrelated + extension) { context, resources ->
            materialYouPatch.execute(context)
            unrelated.forEach { assertSame(it, context.classDefBy(it.type)) }
            assertSame(extension, context.classDefBy(extension.type))
            assertTrue(context.classDefBy(DARK_SCHEME) is MutableClass)
            assertTrue(context.classDefBy(FDS_COLORS) is MutableClass)
            assertTrue(context.classDefBy("LX/DarkCheck;") is MutableClass)
            assertTrue(context.classDefBy("LX/ThemeColors;") is MutableClass)
            assertTrue(resources.hasTheme())
        }
    }

    @Test fun missingDarkCheckLeavesAllBytecodeAndCapabilitiesUnchanged(@TempDir temporary: Path) {
        val classes = themeClasses().filter { it.type != "LX/DarkCheck;" }
        withThemeContext(temporary, classes) { context, resources ->
            assertFails { materialYouPatch.execute(context) }
            classes.forEach { assertSame(it, context.classDefBy(it.type)) }
            assertFalse(resources.hasTheme())
        }
    }

    @Test fun missingColorRouteCannotLeaveResolverEditsApplied(@TempDir temporary: Path) {
        val classes = themeClasses().filter { it.type != "LX/ThemeColors;" }
        withThemeContext(temporary, classes) { context, resources ->
            assertFails { materialYouPatch.execute(context) }
            classes.forEach { assertSame(it, context.classDefBy(it.type)) }
            assertFalse(resources.hasTheme())
        }
    }

    @Test fun malformedColorCallCannotLeaveResolverEditsApplied(@TempDir temporary: Path) {
        val classes = themeClasses().filter { it.type != "LX/ThemeColors;" } + ImmutableClassDef.of(
            fixtureClass("LX/ThemeColors;", listOf(fixtureMethod("LX/ThemeColors;->color()I", """
                const-string v0, "#333334"
                invoke-virtual {v0, v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
                move-result v0
                return v0
            """.trimIndent(), flags = 9))))
        withThemeContext(temporary, classes) { context, resources ->
            assertFails { materialYouPatch.execute(context) }
            classes.forEach { assertSame(it, context.classDefBy(it.type)) }
            assertFalse(resources.hasTheme())
        }
    }

    @Test fun rangeColorCallsAreValidatedAndRewritten(@TempDir temporary: Path) {
        for (count in listOf(1, 2)) {
            val classes = themeClasses().filter { it.type != "LX/ThemeColors;" } + ImmutableClassDef.of(
                fixtureClass("LX/ThemeColors;", listOf(fixtureMethod("LX/ThemeColors;->color()I", """
                    const-string v16, "#333334"
                    invoke-static/range {v16 .. v${15 + count}}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
                    move-result v0
                    return v0
                """.trimIndent(), registers = 20, flags = 9))))
            withThemeContext(temporary.resolve("range-$count"), classes) { context, resources ->
                if (count == 1) {
                    materialYouPatch.execute(context)
                    val code = context.classDefBy("LX/ThemeColors;").methods.single().implementation!!.instructions
                    assertTrue(code.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                        ?.reference.toString() == materialYouColorCalls.getValue("Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I") })
                    assertTrue(resources.hasTheme())
                } else {
                    assertFails { materialYouPatch.execute(context) }
                    classes.forEach { assertSame(it, context.classDefBy(it.type)) }
                    assertFalse(resources.hasTheme())
                }
            }
        }
    }

    @Test fun branchesAndFallthroughReturnThroughTheThemeHelper(@TempDir temporary: Path) {
        val routes = mapOf(DARK_SCHEME to "mig(I)I", FDS_COLORS to "fds(I)I", "LX/DarkCheck;" to "darkModeAnswer(Z)Z")
        for (register in listOf(0, 16)) {
            val classes = themeClasses().map { cls ->
                if (cls.type !in routes) cls else {
                    val method = cls.methods.single()
                    val prefix = when (cls.type) {
                        DARK_SCHEME -> "move-object/from16 v1, p1\ninvoke-interface {v1}, LX/Token;->color()I\nmove-result v$register"
                        FDS_COLORS -> "move-object/from16 v1, p0\ninvoke-static {v1}, LX/DarkCheck;->dark(Landroid/content/Context;)Z\nmove-result v$register\nconst v$register, -0xf7f7f7"
                        else -> "const/16 v$register, 0x1"
                    }
                    ImmutableClassDef.of(fixtureClass(cls.type, listOf(fixtureMethod(method.hookId(), prefix + "\n" + """
                        if-eqz v$register, :done
                        packed-switch v$register, :cases
                        goto :done
                        :done
                        return v$register
                        :cases
                        .packed-switch 0x1
                            :done
                        .end packed-switch
                    """.trimIndent(), registers = 20, flags = method.accessFlags))))
                }
            }
            withThemeContext(temporary.resolve("register-$register"), classes) { context, _ ->
                materialYouPatch.execute(context)
                val dex = DexBackedDexFile(Opcodes.forApi(28), java.nio.ByteBuffer.wrap(lifecycleDex(classes.map { context.classDefBy(it.type) })))
                for (cls in dex.classes.filter { it.type in routes }) {
                    val code = cls.methods.single().implementation!!.instructions.toList()
                    val helper = code.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString() ==
                        "Lapp/hushmessenger/extension/MaterialYouTheme;->${routes.getValue(cls.type)}" }
                    assertTrue(helper >= 0)
                    assertEquals(if (register < 16) Opcode.INVOKE_STATIC else Opcode.INVOKE_STATIC_RANGE, code[helper].opcode)
                    assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.RETURN), code.drop(helper + 1).take(2).map { it.opcode })
                    assertEquals(listOf(register, register), code.drop(helper + 1).take(2).map { (it as OneRegisterInstruction).registerA })
                    for (at in code.indices.filter { code[it].opcode == Opcode.IF_EQZ || code[it].opcode == Opcode.GOTO }) {
                        assertEquals(helper, code.branchTarget(at), cls.type)
                    }
                    val switch = code.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH }
                    val payload = code[code.branchTarget(switch)] as SwitchPayload
                    val switchAddress = code.take(switch).sumOf { it.codeUnits }
                    assertEquals(code.take(helper).sumOf { it.codeUnits }, switchAddress + payload.switchElements.single().offset)
                    assertTrue(code[helper - 1] is OffsetInstruction)
                }
            }
        }
    }

    private fun themeClasses() = listOf(
        fixtureClass(DARK_SCHEME, listOf(tokenMethod("DCz", "LX/Token;", "color"))),
        fixtureClass(FDS_COLORS, listOf(fixtureMethod("$FDS_COLORS->A00(Landroid/content/Context;II)I", """
            invoke-static {p0}, LX/DarkCheck;->dark(Landroid/content/Context;)Z
            move-result v0
            const v0, -0xf7f7f7
            return v0
        """.trimIndent(), flags = 9))),
        fixtureClass("LX/DarkCheck;", listOf(fixtureMethod("LX/DarkCheck;->dark(Landroid/content/Context;)Z",
            "const/4 v0, 0x1\nreturn v0", flags = 9))),
        fixtureClass("LX/ThemeColors;", listOf(fixtureMethod("LX/ThemeColors;->color()I", """
            const-string v0, "#333334"
            invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
            move-result v0
            return v0
        """.trimIndent(), flags = 9))),
    ).plus(screenHostClasses()).map(ImmutableClassDef::of)

    private fun withThemeContext(temporary: Path, classes: List<ImmutableClassDef>,
        action: (BytecodePatchContext, ResourcePatchContext) -> Unit) {
        val apk = Path.of("../extensions/messenger/build/intermediates/linked_resources_binary_format/release/" +
            "processReleaseResources/linked-resources-binary-format-release.ap_").toFile()
        val config = PatcherConfig(apk, temporary.toFile())
        val resources = ResourcePatchContext::class.java.getDeclaredConstructor(PatcherConfig::class.java).newInstance(config)
        resources.use {
            ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                .invoke(resources, ResourceMode.RAW_ONLY)
            Files.writeString(temporary.resolve("apk/AndroidManifest.xml"),
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application /></manifest>""")
            val context = BytecodePatchContext::class.java.declaredConstructors.single()
                .newInstance(config, resources.packageMetadata) as BytecodePatchContext
            val patchClasses = Class.forName("app.morphe.patcher.util.PatchClasses")
            BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", patchClasses)
                .invoke(context, patchClasses.getConstructor(Set::class.java).newInstance(classes.toSet()))
            context.use {
                val capability = materialYouPatch.dependencies.filterIsInstance<ResourcePatch>().single()
                capability.execute(resources)
                bundledControls.clear()
                action(context, resources)
            }
        }
    }

    private fun ResourcePatchContext.hasTheme(): Boolean {
        materialYouPatch.dependencies.filterIsInstance<ResourcePatch>().single().finalize(this)
        return document("AndroidManifest.xml").use { doc ->
            val metadata = doc.getElementsByTagName("meta-data")
            (0 until metadata.length).any {
                (metadata.item(it) as Element).getAttribute("android:name") == "hush.feature.material_you"
            }
        }
    }
}
