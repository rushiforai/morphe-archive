package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private const val BRIDGE = "Ldev/twitchpatches/extension/ui/UiComposeBridge;"

internal fun BytecodePatchContext.injectClassicHeader(all: List<Method>, owner: MutableClass, row: UiClassicActionContract) {
    val visible = all.filter { it.name == "toString" && it.hasStrings("Visible(channelInfo=", ", chatHeaderUiModel=") }
        .uniqueHook("UI native visible chat header")
    val ui = all.filter { it.name == "toString" && it.hasStrings("ChatHeaderUiModel(chatName=") }
        .uniqueHook("UI native chat header model")
    val uiField = classDefBy(visible.definingClass).fields.filter { it.type == ui.definingClass }.uniqueHook("UI header model field")
    val bind = all.filter { it.isInstance(listOf("Ltv/twitch/android/core/mvp/viewdelegate/ViewDelegateState;"), "V") &&
        it.references().any { ref -> ref.toString() == uiField.toString() } }.uniqueHook("UI native chat header binding")
    val root = bind.references().filterIsInstance<FieldReference>().filter { it.type == "Landroid/view/View;" &&
        it.definingClass != bind.definingClass }.distinctBy { it.toString() }.uniqueHook("UI native chat header view")
    val fields = classDefBy(ui.definingClass).fields
    val title = fields.filter { it.type == "Ltv/twitch/android/core/strings/StringResource;" }.uniqueHook("UI chat header title")
    val extensions = fields.filter { it.type == "Z" }.uniqueHook("UI chat header extension availability")
    val buttonsBase = requireNotNull(classDefBy(row.renderer.parameterTypes[0].toString()).superclass)
    val buttons = fields.filter { it.type == buttonsBase }.uniqueHook("UI chat header action state")
    val hidden = all.filter { it.name == "toString" && it.hasStrings("Hidden") &&
        classDefBy(it.definingClass).superclass == buttonsBase }.uniqueHook("UI hidden chat actions")
    val leaderboard = fields.filter { it.type.startsWith("L") && classDefBy(it.type).methods.any { method ->
        method.name == "isVisible" && method.isInstance(emptyList(), "Z")
    } }.uniqueHook("UI native leaderboard availability")
    val leaderboardVisible = classDefBy(leaderboard.type).methods.filter { it.name == "isVisible" && it.isInstance(emptyList(), "Z") }
        .uniqueHook("UI native leaderboard visibility")
    val rootField = classDefBy(root.definingClass).fields.single { it.name == root.name && it.type == root.type }
    require(listOf(uiField, rootField, title, extensions, buttons, leaderboard).all { AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
        "UI settings: native chat header fields changed."
    }
    val stub = owner.methods.filter { it.name == "renderClassicHeader" }.uniqueHook("UI chat header refresh bridge")
    owner.methods.remove(stub)
    owner.methods.add(nativeReloadMethod(BRIDGE, "renderClassicHeader", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V", 2, """
        check-cast p0, ${bind.definingClass}
        check-cast p1, ${bind.parameterTypes[0]}
        invoke-virtual {p0, p1}, ${bind.reference}
        return-void
    """, static = true))
    val apply = nativeReloadMethod(BRIDGE, "applyClassicHeaderVisibility", listOf(bind.definingClass, bind.parameterTypes[0].toString()), "V", 10, """
        instance-of v0, p1, ${visible.definingClass}
        if-eqz v0, :return
        check-cast p1, ${visible.definingClass}
        iget-object v0, p1, $uiField
        iget-object v1, p0, $root
        iget-object v2, v0, $title
        if-nez v2, :visible
        const-string v2, "hide_leaderboards"
        invoke-static {v2}, $UI_SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v2
        if-nez v2, :extensions
        iget-object v2, v0, $leaderboard
        invoke-virtual {v2}, ${leaderboardVisible.reference}
        move-result v2
        if-nez v2, :visible
        :extensions
        iget-boolean v2, v0, $extensions
        if-eqz v2, :actions
        const-string v2, "hide_channel_extensions"
        invoke-static {v2}, $UI_SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v2
        if-eqz v2, :visible
        :actions
        iget-object v0, v0, $buttons
        instance-of v2, v0, ${hidden.definingClass}
        if-nez v2, :hidden
        instance-of v2, v0, ${row.renderer.parameterTypes[0]}
        if-eqz v2, :visible
        check-cast v0, ${row.renderer.parameterTypes[0]}
        invoke-static {v0}, $BRIDGE->filteredClassicModel(${row.renderer.parameterTypes[0]})${row.renderer.parameterTypes[0]}
        move-result-object v0
        invoke-static {v0}, $BRIDGE->classicActionsEmpty(${row.renderer.parameterTypes[0]})Z
        move-result v0
        if-eqz v0, :visible
        :hidden
        const/16 v0, 0x8
        goto :apply
        :visible
        const/4 v0, 0x0
        :apply
        invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
        :return
        return-void
    """, static = true)
    owner.methods.add(apply)
    val delegate = mutableClassDefBy(bind.definingClass)
    val target = delegate.methods.single { it.reference == bind.reference }
    require(delegate.methods.none { it.name == "twitchPatchBindHeaderOriginal" }) { "UI settings: chat header binding is already wrapped." }
    delegate.methods.remove(target)
    target.name = "twitchPatchBindHeaderOriginal"
    delegate.methods.add(target)
    delegate.methods.add(nativeReloadMethod(bind.definingClass, bind.name, bind.parameterTypes.map { it.toString() }, "V", 2, """
        invoke-static/range {p0 .. p1}, Ldev/twitchpatches/extension/ui/UiClassicHeaderRuntime;->capture(Ljava/lang/Object;Ljava/lang/Object;)V
        invoke-virtual/range {p0 .. p1}, ${target.reference}
        invoke-static/range {p0 .. p1}, ${apply.reference}
        return-void
    """))
}
