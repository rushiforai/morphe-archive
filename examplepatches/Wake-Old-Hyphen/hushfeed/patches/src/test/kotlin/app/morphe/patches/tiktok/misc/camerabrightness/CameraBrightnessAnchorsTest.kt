package app.morphe.patches.tiktok.misc.camerabrightness

import app.morphe.BridgeTypeFlow
import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

private const val EXTENSION = "Lapp/morphe/extension/tiktok/misc/CameraBrightness;"

/**
 * Keep the screen's brightness in the camera (#200), held to every declared build: each of
 * TikTok's two brightness boost starts is one static void method with a free local for the
 * guard, and the two are different methods. Each front flash and fill light is one method with
 * one store of the window's brightness, and the hook puts a typed call in that store's place.
 */
class CameraBrightnessAnchorsTest {
    @Test
    fun `both brightness boost starts are one static void method each with a local for the guard`() {
        Fixtures.forEachDeclared { apk ->
            val methods = methodsOf(apk).toList()
            val starts = listOf(BrightnessBoostStartFingerprint, OldBrightnessBoostStartFingerprint).map { fingerprint ->
                val taken = methods.filter { (classDef, method) -> fingerprint.takes(method, classDef) }
                assertEquals(
                    "${apk.name}: ${fingerprint.javaClass.simpleName} took ${taken.map { "${it.first.type}->${it.second.name}" }}",
                    1,
                    taken.size,
                )
                val start = taken.single().second
                assertTrue("${apk.name}: ${start.name} is not static", AccessFlags.STATIC.isSet(start.accessFlags))
                assertEquals("${apk.name}: ${start.name} returns a value", "V", start.returnType)
                val body = start.implementation!!
                val parameterRegisters = start.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
                assertTrue("${apk.name}: ${start.name} has no local for the guard", body.registerCount - parameterRegisters >= 1)
                "${start.definingClass}->${start.name}"
            }
            assertTrue("${apk.name}: both fingerprints took $starts", starts[0] != starts[1])
        }
    }

    @Test
    fun `each front flash is one method whose one brightness store goes to the switch`() {
        Fixtures.forEachDeclared { apk ->
            val methods = methodsOf(apk).toList()
            val flashes = flashFingerprints.map { fingerprint ->
                val label = "${apk.name}: ${fingerprint.javaClass.simpleName}"
                val taken = methods.filter { (classDef, method) -> fingerprint.takes(method, classDef) }
                assertEquals("$label took ${taken.map { "${it.first.type}->${it.second.name}" }}", 1, taken.size)
                val native = taken.single().second

                val before = native.implementation!!.instructions.toList()
                val storeAt = before.indexOfFirst(::storesBrightness)
                val patched = MutableMethod(native)
                patched.keepFlashBrightness("test")
                val after = patched.implementation!!.instructions.toList()
                val callAt = after.indexOfFirst { it.getReference<MethodReference>()?.name == "setFlashBrightness" }
                assertTrue("$label: no call", callAt >= 0)
                assertTrue("$label: a store is left", after.none(::storesBrightness))

                // The call takes the store's own registers: the parameters, then the level.
                val store = before[storeAt] as TwoRegisterInstruction
                val call = after[callAt] as FiveRegisterInstruction
                assertEquals(Opcode.INVOKE_STATIC, call.opcode)
                assertEquals(EXTENSION, call.getReference<MethodReference>()!!.definingClass)
                assertEquals(listOf(store.registerB, store.registerA), listOf(call.registerC, call.registerD).take(call.registerCount))

                // Everything else is TikTok's, in its own order (the payload's alignment nop can move).
                fun rest(code: List<Instruction>, skip: Int) =
                    code.filterIndexed { index, instruction -> index != skip && instruction.opcode != Opcode.NOP }.map { it.opcode }
                assertEquals("$label: TikTok's code moved", rest(before, storeAt), rest(after, callAt))

                // A branch that landed on the store lands on the call.
                assertEquals("$label: a branch lost its target", branchesOnto(before, storeAt), branchesOnto(after, callAt))
                assertEquals("$label: the hook's types", emptyList<Any>(), BridgeTypeFlow.check(patched))
                "${native.definingClass}->${native.name}"
            }
            assertEquals("${apk.name}: the flashes overlap $flashes", flashes.size, flashes.toSet().size)
            // The avatar camera's store is a branch target, which is why the store is replaced.
            val avatar = methods.single { (classDef, method) -> AvatarFlashOnFingerprint.takes(method, classDef) }.second
            val code = avatar.implementation!!.instructions.toList()
            assertTrue("${apk.name}: nothing branches onto the avatar store", branchesOnto(code, code.indexOfFirst(::storesBrightness)) > 0)
        }
    }

    @Test
    fun `both starts are guarded and the row's flag is set`() {
        val root = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        val source = File(root, "app/morphe/patches/tiktok/misc/camerabrightness/CameraBrightnessPatch.kt").readText()
        assertTrue("the new start is not guarded", source.contains("BrightnessBoostStartFingerprint.method.guardAtEntry("))
        assertTrue("the old start is not guarded", source.contains("OldBrightnessBoostStartFingerprint.method.guardAtEntry("))
        assertTrue("the answer is not the switch's", source.contains("keepScreenBrightness()Z"))
        assertTrue("the flashes are not handed over", source.contains("flashFingerprints.forEach { it.method.keepFlashBrightness(PATCH) }"))
        assertTrue("the row's flag is not set", source.contains("SettingsStatus;->enableCameraBrightness()V"))
    }

    private fun storesBrightness(instruction: Instruction): Boolean {
        if (instruction.opcode != Opcode.IPUT) return false
        val field = instruction.getReference<FieldReference>() ?: return false
        return field.definingClass == "Landroid/view/WindowManager\$LayoutParams;" && field.name == "screenBrightness"
    }

    /** How many branches in [code] land on instruction [target]. */
    private fun branchesOnto(code: List<Instruction>, target: Int): Int {
        val addresses = code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        return code.indices.count { index ->
            val branch = code[index] as? OffsetInstruction
            branch != null && code[index].opcode != Opcode.FILL_ARRAY_DATA &&
                addresses.indexOf(addresses[index] + branch.codeOffset) == target
        }
    }

    private fun methodsOf(apk: File): Sequence<Pair<ClassDef, Method>> {
        val byType = HashMap<String, ClassDef>()
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) byType.putIfAbsent(classDef.type, classDef)
        }
        return byType.values.asSequence().flatMap { classDef -> classDef.methods.asSequence().map { classDef to it } }
    }
}
