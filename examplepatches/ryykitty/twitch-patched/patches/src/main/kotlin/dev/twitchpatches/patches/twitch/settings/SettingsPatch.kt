package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.insertAtReturn
import dev.twitchpatches.patches.twitch.shared.insertBeforeWithLabels
import dev.twitchpatches.patches.twitch.shared.isInstance
import dev.twitchpatches.patches.twitch.shared.reference
import dev.twitchpatches.patches.twitch.shared.uniqueHook
import dev.twitchpatches.patches.twitch.shared.twitchExtensionPatch

internal val settingsPatch = bytecodePatch {
    dependsOn(twitchExtensionPatch, nativeSettingsResourcesPatch)
    execute {
        val hooks = resolveSettingsHooks()
        val application = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter {
            it.name == "onCreate" && it.isInstance(emptyList(), "V") &&
                it.code().any { instruction -> instruction.opcode == Opcode.RETURN_VOID }
        }.uniqueHook("settings application initialization")
        val action = mutableClassDefBy(ACTION)
        val click = action.methods.filter { it.name == "invoke" && it.isInstance(emptyList(), "Ljava/lang/Object;") }
            .uniqueHook("extension settings click")
        val bridgeName = "renderTwitchSettingsEntry"
        if (action.methods.any { it.name == bridgeName }) {
            throw app.morphe.patcher.patch.PatchException("Patch settings: entry bridge already exists.")
        }
        action.interfaces.add(hooks.callback)
        click.code().withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .map { it.index }.asReversed().forEach { index ->
                val register = click.getInstruction<OneRegisterInstruction>(index).registerA
                click.insertAtReturn(index, "sget-object v$register, ${hooks.unit}")
            }
        val bridge = ImmutableMethod(ACTION, bridgeName,
            listOf(ImmutableMethodParameter(hooks.composer, null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(9)).toMutable()
        bridge.addInstructionsWithLabels(0, """
            const-string v0, "Patch settings"
            const/4 v1, 0x0
            sget-object v2, $ACTION->INSTANCE:$ACTION
            invoke-static {}, $SETTINGS->settingsIcon()I
            move-result v3
            const/4 v4, 0x0
            move-object v5, p0
            const/4 v6, 0x0
            const/16 v7, 0x12
            invoke-static/range {v0 .. v7}, ${hooks.row.reference}
            return-void
        """)
        action.methods.add(bridge)
        val group = mutableClassDefBy(hooks.group.definingClass).methods.single { it.reference == hooks.group.reference }
        group.insertBeforeWithLabels(hooks.rowIndex,
            "invoke-static/range {v${hooks.composerRegister} .. v${hooks.composerRegister}}, ${bridge.reference}")
        val app = mutableClassDefBy(application.definingClass).methods.single { it.reference == application.reference }
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.asReversed().forEach {
                app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $SETTINGS->initialize(Landroid/app/Application;)V")
            }
    }
}
