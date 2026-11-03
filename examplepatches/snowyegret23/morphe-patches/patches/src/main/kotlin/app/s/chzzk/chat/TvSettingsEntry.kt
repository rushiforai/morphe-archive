package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val TV_SETTINGS = "Lapp/s/chzzk/extension/TvSettings;"
private const val COMMUNITY = "Lcom/navercorp/game/android/community/"

internal fun BytecodePatchContext.addTvSettingsEntry() {
    val unit = classDefBy("Lkotlin/Unit;").fields.single { it.type == "Lkotlin/Unit;" }
    mutableClassDefBy(SETTINGS).methods.single { it.name == "kotlinUnit" }.rewrite("""
        sget-object v0, ${unit.smaliReference}
        return-object v0
    """)
    val button = classDefBy("${COMMUNITY}tv/ui/component/SettingButtonKt;").methods.single { it.name == "a" }
    check(button.parameterTypes.size == 11)
    val owner = mutableClassDefBy(TV_SETTINGS)
    val original = owner.methods.single { it.name == "renderEntry" }
    val render = MutableMethod(ImmutableMethod(owner.type, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(12, emptyList(), emptyList(), emptyList())))
    render.addInstructions(0, """
        const-string v0, "Morphe"
        invoke-static {}, $SETTINGS->settingsClick()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Lkotlin/jvm/functions/Function0;
        const/4 v2, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x0
        const/4 v5, 0x0
        const-string v6, "setting_tab_s_chzzk"
        const/4 v7, 0x0
        move-object v8, p0
        check-cast v8, Landroidx/compose/runtime/Composer;
        const/4 v9, 0x6
        const/16 v10, 0xbc
        invoke-static/range {v0 .. v10}, ${button.smaliReference}
        return-void
    """.trimIndent())
    owner.methods.remove(original)
    owner.methods.add(render)
    val menu = mutableClassDefBy("${COMMUNITY}tv/ui/setting/SettingScreenKt;").methods.single { it.name == "c" }
    val items = menu.implementation!!.instructions.withIndex().first {
        it.value.getReference<FieldReference>()?.definingClass == "${COMMUNITY}tv/ui/setting/SettingMenu;"
    }
    menu.addInstructions(items.index, "invoke-static/range {p2 .. p2}, $TV_SETTINGS->renderEntry(Ljava/lang/Object;)V")

    val viewType = "${COMMUNITY}core/feature/feature/player/BasePlayerView;"
    val modelType = "${COMMUNITY}core/feature/feature/player/BasePlayerViewModel;"
    val view = mutableClassDefBy(viewType)
    val model = view.methods.single { it.name == "getViewModel" && it.returnType == modelType }
    owner.methods.single { it.name == "playerModel" }.rewrite("""
        check-cast p0, $viewType
        invoke-virtual {p0}, ${model.smaliReference}
        move-result-object p0
        return-object p0
    """)
    val attached = view.methods.single { it.name == "onAttachedToWindow" }
    val end = attached.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index
    val overlayType = "${COMMUNITY}tv/feature/overlayplayer/OverlayPlayerView;"
    classDefBy(overlayType)
    check(attached.localRegisterCount == 1)
    attached.addInstructionsWithLabels(end, """
        instance-of v0, p0, $overlayType
        if-eqz v0, :not_live_player
        invoke-static/range {p0 .. p0}, $TV_SETTINGS->bindPlayer(Landroid/view/View;)V
        :not_live_player
        nop
    """.trimIndent())
}
