package io.github.sabopura.morphe.patches.twitch.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private const val ATTACHED =
    "Lio/github/sabopura/morphe/extension/twitch/app/PlayerAttach;->attached(Ljava/lang/Object;Landroid/view/View;)V"
private const val VIEW_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"

/** Every native player presenter (live, VOD, clip) attaching its player view reports to PlayerAttach. */
internal val playerPresenterHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val base = classesWithStrings("playerStateAndEventDisposable", "followStatusDisposable")
            .uniqueContract("player presenter base class")
        mutableClassDefBy(base).methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.size == 1 && method.instructions.any {
                val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                call?.definingClass == "Landroid/view/View;" && call.name == "addOnLayoutChangeListener"
            }
        }.uniqueContract("player view attach").apply {
            val read = instructions.indexOfFirst {
                val field = (it as? ReferenceInstruction)?.reference as? FieldReference
                it.opcode == Opcode.IGET_OBJECT && field?.definingClass == VIEW_DELEGATE && field.type == "Landroid/view/View;"
            }
            if (read < 0) throw PatchException("Twitch: player view read not found")
            // The view overwrites the delegate parameter, so {p0 .. p1} is the presenter and its view.
            if ((instructions[read] as TwoRegisterInstruction).registerA != implementation!!.registerCount - 1)
                throw PatchException("Twitch: player view is no longer read into the parameter")
            addInstructions(read + 1, "invoke-static/range {p0 .. p1}, $ATTACHED")
        }
    }
}

private const val RETRY = "Lio/github/sabopura/morphe/extension/twitch/app/PlayerRetry;"
private const val CAST_ACTIVITY = "Ltv/twitch/android/shared/chromecast/view/TwitchExpandedControllerActivity;"

private val MethodReference.parameterList get() = parameterTypes.map { it.toString() }

/** The error screen's Retry and Twitch's cast session, for PlayerRetry. */
internal val playerRetryHook = bytecodePatch {
    dependsOn(playerPresenterHook)
    extendWith(TWITCH_EXTENSION)
    execute {
        val presenter = classesWithStrings("playerStateAndEventDisposable", "followStatusDisposable")
            .uniqueContract("player presenter base class")
        val action = classDefBy(
            methodWith("player error screen", "At least one non-null argument is required") { it.returnType == "V" }
                .parameterTypes.last().toString(),
        )
        val retry = action.methods.flatMap { it.implementation?.instructions ?: emptyList() }
            .filter { it.opcode == Opcode.INVOKE_INTERFACE }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .filter { it.returnType == "V" && it.parameterList.toSet() == setOf("Ljava/lang/Integer;", "Z") }
            .distinct().uniqueContract("player Retry call")
        if (retry.definingClass !in presenter.interfaces) throw PatchException("Twitch: Retry is not a player presenter call")
        val arguments = if (retry.parameterList[0] == "Z") "p0, p2, p1" else "p0, p1, p2"
        mutableClassDefBy(RETRY).methods.single { it.name == "retry" && it.parameterTypes.size == 3 }.addInstructions(0, """
            check-cast p0, ${retry.definingClass}
            invoke-interface {$arguments}, $retry
        """)

        val sessions = classDefByStrings("CastSession").map { it.type }.toSet()
        val getter = classDefBy(CAST_ACTIVITY).fields.filter { it.type.startsWith("L") }.mapNotNull { classDefByOrNull(it.type) }.distinctBy { it.type }
            .flatMap { helper -> helper.methods.filter { method ->
                method.parameterTypes.isEmpty() && method.returnType in sessions && (method.implementation?.instructions ?: emptyList()).any {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    call?.returnType == method.returnType && call.definingClass != helper.type
                }
            }.map { helper to it } }
            .uniqueContract("Twitch cast session getter")
        val (helper, method) = getter
        mutableClassDefBy(helper).methods.first { it.name == method.name && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $RETRY->castHelper(Ljava/lang/Object;)V")
        mutableClassDefBy(RETRY).methods.single { it.name == "session" }.addInstructions(0, """
            check-cast p0, ${helper.type}
            invoke-virtual {p0}, ${helper.type}->${method.name}()${method.returnType}
            move-result-object p0
            return-object p0
        """)
    }
}
