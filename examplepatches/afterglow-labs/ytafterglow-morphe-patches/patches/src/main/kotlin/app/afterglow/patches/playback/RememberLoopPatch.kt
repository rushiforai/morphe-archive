package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.installAtStartup
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val LOOP = "$EXTENSION_PACKAGE/playback/RememberLoop;"
private const val LOOP_CONTROLLER = "$EXTENSION_PACKAGE/playback/LoopController;"

/** Explicit user loop choices and native watch restoration; automatic resets are untouched. */
internal val rememberLoopHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(videoStatePatch)
    execute {
        val menu = Fingerprint(parameters = listOf(), returnType = "L",
            filters = listOf(resourceLiteral(ResourceType.STRING, "single_loop_menu_item")))
        val host = menu.classDef
        val legacy = Fingerprint(parameters = listOf(), returnType = "V", filters = listOf(
            checkCast(host.type),
            methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = listOf(), returnType = "L",
                location = MatchAfterWithin(8)),
            methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = listOf("I"), returnType = "V",
                location = MatchAfterWithin(8))
        ))
        val getter = legacy.instructionMatches[1].methodReference
        val setter = legacy.instructionMatches[2].methodReference
        require(getter.returnType == setter.definingClass)
        val provider = host.fields.single { it.type == getter.definingClass }
        fun callCount(method: Method): Int = method.implementation?.instructions?.count {
            ((it as? ReferenceInstruction)?.reference as? MethodReference) == setter
        } ?: 0
        val commands = Fingerprint(parameters = listOf("L", "Ljava/util/Map;"), returnType = "V",
            filters = listOf(methodCall(smali = setter.smali)), custom = { method, _ -> callCount(method) == 2 })
        val clicks = Fingerprint(name = "onClick", parameters = listOf("Landroid/view/View;"), returnType = "V",
            filters = listOf(methodCall(smali = setter.smali)), custom = { method, _ -> callCount(method) == 2 })
        val start = Fingerprint(classFingerprint = menu, name = "onStart", parameters = listOf("L"), returnType = "V").method

        host.interfaces.add(LOOP_CONTROLLER)
        host.methods.add(ImmutableMethod(host.type, "afterglow_setLoopMode",
            listOf(ImmutableMethodParameter("I", null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            MutableMethodImplementation(3)).toMutable().apply {
                addInstructions(0, """
                    iget-object v0, p0, ${provider.smali}
                    invoke-interface { v0 }, ${getter.smali}
                    move-result-object v0
                    invoke-interface { v0, p1 }, ${setter.smali}
                    return-void
                """)
            })
        start.addInstruction(0, "invoke-static/range { p0 .. p0 }, $LOOP->setController($LOOP_CONTROLLER)V")

        // The common setter also receives automatic new-video/player-mode resets.
        // Record only the five explicit menu, command and button call sites.
        var recorded = 0
        for (method in listOf(legacy.method, commands.method, clicks.method)) {
            val calls = method.implementation!!.instructions.withIndex().filter {
                ((it.value as? ReferenceInstruction)?.reference as? MethodReference) == setter
            }
            recorded += calls.size
            for ((index, instruction) in calls.asReversed()) {
                require(instruction.opcode == Opcode.INVOKE_INTERFACE)
                val call = instruction as FiveRegisterInstruction
                require(call.registerCount == 2)
                method.replaceInstruction(index,
                    "invoke-static/range { v${call.registerD} .. v${call.registerD} }, $LOOP->onManualChoice(I)V")
                method.addInstruction(index + 1,
                    "invoke-interface { v${call.registerC}, v${call.registerD} }, ${setter.smali}")
            }
        }
        require(recorded == 5) { "Native explicit loop action boundaries changed: $recorded" }
        installAtStartup(LOOP)
        println("Afterglow loop: host ${host.type}, action ${setter.smali}, $recorded user calls")
    }
}
