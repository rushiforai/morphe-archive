package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.addSettingsEntry() {
    val composerType = "Landroidx/compose/runtime/Composer;"
    val screen = mutableClassDefBy("Lcom/navercorp/game/android/community/app/ui/setting/SettingsScreenKt;")
    val row = screen.methods.single {
        it.name == "d" && it.parameterTypeNames == listOf(
            "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function0;", composerType, "I", "I"
        )
    }
    val entry = MutableMethod(ImmutableMethod(
        screen.type, "sChzzkSettings",
        listOf(ImmutableMethodParameter(composerType, emptySet(), null)),
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(10, emptyList(), emptyList(), emptyList())
    ))
    entry.addInstructions(0, """
        const-string v0, "Morphe"
        const-string v1, "채팅과 시청 환경 설정"
        const/4 v2, 0x1
        const/4 v3, 0x0
        const/4 v4, 0x0
        invoke-static {}, $SETTINGS->settingsClick()Ljava/lang/Object;
        move-result-object v5
        check-cast v5, Lkotlin/jvm/functions/Function0;
        move-object v6, p0
        const/4 v7, 0x0
        const/4 v8, 0x0
        invoke-static/range {v0 .. v8}, ${row.smaliReference}
        return-void
    """.trimIndent())
    screen.methods.add(entry)
    val list = mutableClassDefBy("Lu0;").methods.single { method ->
        method.implementation?.instructions?.any {
            it.getReference<StringReference>()?.string == "시청 환경 설정"
        } == true
    }
    val instructions = list.implementation!!.instructions
    val heading = instructions.indexOfFirst {
        it.getReference<StringReference>()?.string == "시청 환경 설정"
    }
    val call = instructions.drop(heading + 1).first {
        it.getReference<MethodReference>()?.let { ref -> ref.definingClass == screen.type && ref.name == "a" } == true
    } as FiveRegisterInstruction
    val composerRegister = call.registerD
    list.addInstructions(heading,
        "invoke-static/range {v$composerRegister .. v$composerRegister}, ${entry.smaliReference}")
    val unit = classDefBy("Lkotlin/Unit;").fields.single { it.type == "Lkotlin/Unit;" }
    mutableClassDefBy(SETTINGS).methods.single { it.name == "kotlinUnit" }.rewrite("""
        sget-object v0, ${unit.smaliReference}
        return-object v0
    """)
}
