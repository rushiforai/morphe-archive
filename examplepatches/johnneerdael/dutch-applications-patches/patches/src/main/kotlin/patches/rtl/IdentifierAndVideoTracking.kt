package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun disableIdentifierAndVideoTracking() {
    for (name in listOf("Bitmovin", "Snowplow", "SmartOcto")) {
        val result = "Lnl/rtl/videoplayer/config/${name}AnalyticsConfig;"
        val method = exact("Lnl/rtl/videoplayer/config/VideoAnalyticsConfig;", "get${name}AnalyticsConfig()$result").method
        val code = method.instructions.toList()
        check(code.size == 2 && method.accessFlags == 0x11 && code[0].opcode == Opcode.IGET_OBJECT &&
            code[1].opcode == Opcode.RETURN_OBJECT) { "RTL video analytics getter changed: $name" }
        val register = (code[0] as OneRegisterInstruction).registerA
        val disabled = result.removeSuffix(";") + "\$Disabled;"
        method.replaceInstruction(0, "sget-object v$register, $disabled->INSTANCE:$disabled")
    }
    val id = exact("Lua;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;").method
    check(id.instructions.size == 67 && id.implementation!!.registerCount == 11 && id.accessFlags == 0x11 &&
        id.instructions.toList()[32].opcode == Opcode.IF_EQZ) { "RTL advertising-ID emitter changed" }
    // Native nullable emission completes waiting subscribers and retains normal
    // suspension/Unit behavior, while the identifier lookup at33 never starts.
    id.replaceInstruction(32, BuilderInstruction30t(Opcode.GOTO_32, id.implementation!!.newLabelForIndex(47)))

    val dmoi = exact("Lsy5;", "a(Ljava/util/Map;Lkotlin/jvm/functions/Function1;)V").method
    check(dmoi.instructions.size == 54 && dmoi.implementation!!.registerCount == 7 && dmoi.accessFlags == 0x11)
    change("Lsy5;", "a(Ljava/util/Map;Lkotlin/jvm/functions/Function1;)V", """
        new-instance v0, Ljava/lang/Throwable;
        const-string v1, "DMOI tracking disabled"
        invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V
        new-instance v1, Luka;
        invoke-direct {v1, v0}, Luka;-><init>(Ljava/lang/Throwable;)V
        new-instance v2, Lwka;
        invoke-direct {v2, v1}, Lwka;-><init>(Ljava/lang/Object;)V
        invoke-interface {p2, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
        return-void
    """)
}
