package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** 346013440's benefit check cut down: a server flag, then the subscription lookup for CUSTOM_APP_ICON. */
internal val APP_ICON_GATE_BODY = """
    const/4 v3, 0x0
    invoke-static {}, LX/1Aa;->A04()LX/4nI;
    move-result-object v2
    if-eqz v2, :lookup
    const/4 v0, 0x1
    return v0
    :lookup
    const-string v0, "$APP_ICON_BENEFIT"
    invoke-virtual {v3, v0}, LX/1e0;->A02(Ljava/lang/String;)Z
    move-result v0
    return v0
""".trimIndent()

/** The manager's static initializer: icon ids to the start screen and the disabled launcher aliases. */
internal fun appIconAliasMap(type: String) = fixtureMethod("$type-><clinit>()V", """
    const-string v1, "default"
    const-string v0, "$APP_ICON_DEFAULT_ENTRY"
    const-string v1, "dreamy"
    const-string v0, "${APP_ICON_ALIAS_PREFIX}Dreamy"
    const-string v1, "vaporwave"
    const-string v0, "${APP_ICON_ALIAS_PREFIX}Vaporwave"
    return-void
""".trimIndent(), 2, AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)

private const val MANAGER = "LX/7Ya;"
private const val PICKER_GATE = "$MANAGER->A02($FB_USER_SESSION)Z"
private const val SETTING_GATE = "$MANAGER->A03($FB_USER_SESSION)Z"
private const val UNLOCK_CALL = "$SETTINGS->unlockAppIcons()Z"
private const val SET_COMPONENT = "Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V"

class AppIconsTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    private val staticPublic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

    private fun gate(id: String, body: String = APP_ICON_GATE_BODY, flags: Int = staticPublic) = fixtureMethod(id, body, 5, flags)

    private fun manager(vararg gates: MutableMethod, aliases: Boolean = true) =
        fixtureClass(MANAGER, (if (aliases) listOf(appIconAliasMap(MANAGER)) else emptyList()) + gates)

    @Test fun discoveryNeedsTheIconManagersAliasMapAndTheBenefitName() {
        val found = findControls(listOf(manager(gate(PICKER_GATE), gate(SETTING_GATE))), null)
        assertEquals(setOf(PICKER_GATE, SETTING_GATE), found.getValue(APP_ICONS).map { it.hookId() }.toSet())
        validateControls(found, setOf(APP_ICONS))

        // The subscription lookup itself names the benefit too, but it lives outside the icon manager.
        val lookup = fixtureClass("LX/1e0;", listOf(gate("LX/1e0;->A02($FB_USER_SESSION)Z")))
        assertTrue(findControls(listOf(lookup), null).getValue(APP_ICONS).isEmpty())
        for (changed in listOf(
            listOf(manager(gate(PICKER_GATE), gate(SETTING_GATE), aliases = false)),
            listOf(manager(gate(PICKER_GATE), gate(SETTING_GATE, APP_ICON_GATE_BODY.replace(APP_ICON_BENEFIT, "CUSTOM_THEME")))),
            listOf(manager(gate(PICKER_GATE), gate(SETTING_GATE, flags = AccessFlags.PUBLIC.value))),
        )) assertFailsWith<PatchException> { validateControls(findControls(changed, null), setOf(APP_ICONS)) }
    }

    @Test fun onAnswersYesAndOffRunsMessengersOwnCheckUntouched() {
        val method = gate(PICKER_GATE)
        val original = method.implementation!!.instructions.toList()
        method.injectAppIconGate()
        val code = method.implementation!!.instructions.toList()
        assertEquals(UNLOCK_CALL, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), code.take(5).map { it.opcode })
        assertEquals(1, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals(addresses[5], addresses[2] + (code[2] as OffsetInstruction).codeOffset)
        assertEquals(original, code.drop(5))
    }

    @Test fun aChangedBenefitCheckStopsThePatchBeforeAnyEdit() {
        for (method in listOf(
            gate(PICKER_GATE, APP_ICON_GATE_BODY.replace(APP_ICON_BENEFIT, "CUSTOM_THEME")),
            gate(PICKER_GATE, flags = AccessFlags.PUBLIC.value),
            // No local register left for the switch's answer.
            fixtureMethod(PICKER_GATE, "const-string p0, \"$APP_ICON_BENEFIT\"\nconst/4 p0, 0x0\nreturn p0", 1, staticPublic),
        )) {
            val before = method.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { method.injectAppIconGate() }
            assertEquals(before, method.implementation!!.instructions.toList())
        }
    }

    @Test fun everyStockBuildAppliesItsBuiltInIconsThroughOneLocalAliasSwitch() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val families = mutableSetOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val managers = findAppIconManagers(classes)
            assertEquals(1, managers.size, code)
            val manager = classes.single { it.type == managers.single() }
            val gates = manager.methods.filter { it.isAppIconGate() }
            assertEquals(activeProfile.hooks.getValue(APP_ICONS), gates.map { it.hookId() }.toSet(), code)
            families += manager.type
            // Messenger's apply path: enable the chosen alias and disable the rest, with no network call.
            val apply = manager.methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Ljava/lang/String;") && it.returnType == "V" }
            val calls = apply.implementation!!.instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() }
            assertEquals(2, calls.count { it == SET_COMPONENT }, code)
            val aliases = manager.methods.single { it.name == "<clinit>" }.implementation!!.instructions
                .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.filter { it.startsWith(APP_ICON_ALIAS_PREFIX) }
            assertEquals(7, aliases.size, code)
            for (native in gates) {
                val method = MutableMethod(native)
                val before = method.implementation!!.instructions.toList()
                method.injectAppIconGate()
                val after = method.implementation!!.instructions.toList()
                assertEquals(UNLOCK_CALL, (after[0] as ReferenceInstruction).reference.toString(), code)
                assertEquals(before, after.drop(5), code)
            }
        }
        assertEquals(6, families.size)
    }
}
