package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private const val BRIDGE = "Ldev/twitchpatches/extension/ui/UiComposeBridge;"
private const val ACTION = "Ldev/twitchpatches/extension/ui/UiMenuAction;"

private class PlaybackMenuHeadingFingerprint(optionsTitleId: Long, composer: String) : Fingerprint(
    returnType = "V",
    parameters = listOf(composer, "I"),
    filters = listOf(literal(optionsTitleId)),
)

private object VerticalHeaderSubscribeModelFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf(string("Subscribe(isIconOnly=")),
)

private object VerticalHeaderGiftModelFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf(string("Gift(isIconOnly=")),
)

private class VerticalLeaderboardFingerprint(leaderboardStringId: Long, leaderboardDrawableId: Long) : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(leaderboardStringId),
        literal(leaderboardDrawableId),
    ),
)

internal fun BytecodePatchContext.injectNativeUiMenus(contract: UiCompositionContract) {
    fun Method.resource(name: String) = code().any {
        (it as? WideLiteralInstruction)?.wideLiteral == uiResourceIds[name]
    }
    val title = PlaybackMenuHeadingFingerprint(uiResourceIds.getValue("string/options_title"), contract.composer).originalMethod
    val viewing = classDefBy(title.definingClass).methods.filter { it.resource("string/viewing_options_label") }
        .uniqueHook("native viewing options renderer")
    val row = viewing.references().filterIsInstance<MethodReference>().filter { it.returnType == "V" &&
        it.parameterTypes.size == 10 && it.parameterTypes[0] == "Ljava/lang/String;" &&
        it.parameterTypes[3] == "Z" && it.parameterTypes[7] == contract.composer }
        .distinctBy { it.toString() }.uniqueHook("native playback menu row")
    val action = mutableClassDefBy(ACTION)
    action.interfaces.add(row.parameterTypes[4].toString())
    val menu = nativeReloadMethod(BRIDGE, "nativeMenuHeading", title.parameterTypes.map { it.toString() }, "V", 12, """
        invoke-static/range {p0 .. p1}, ${title.reference}
        const-string v0, "UI settings"
        const/4 v1, 0x0
        const/4 v2, 0x0
        const/4 v3, 0x0
        sget-object v4, $ACTION->INSTANCE:$ACTION
        const/4 v5, 0x0
        const/4 v6, 0x0
        move-object v7, p0
        const/16 v8, 0x6000
        const/16 v9, 0x66
        invoke-static/range {v0 .. v9}, $row
        return-void
    """, static = true)
    val bridge = mutableClassDefBy(BRIDGE)
    bridge.methods.add(menu)
    replaceNativeUiCalls(nativeCallers(title), title.reference, menu)

    val subscribe = VerticalHeaderSubscribeModelFingerprint.originalMethod.definingClass
    val gift = VerticalHeaderGiftModelFingerprint.originalMethod.definingClass
    val base = classDefBy(subscribe).superclass
    require(base == classDefBy(gift).superclass) { "UI settings: header action hierarchy changed." }
    val leaderboard = VerticalLeaderboardFingerprint(
        uiResourceIds.getValue("string/leaderboard"),
        uiResourceIds.getValue("drawable/format_leaderboard"),
    ).originalMethod
    require(leaderboard.parameterTypes.size == 4 && leaderboard.parameterTypes[2].toString() == contract.composer) {
        "UI settings: native vertical leaderboard changed."
    }
    val candidates = classDefBy(leaderboard.definingClass).methods.filter {
        it.references().any { ref -> ref.toString() == leaderboard.reference }
    }
    val support = candidates.flatMap { it.references().filterIsInstance<MethodReference>() }
        .mapNotNull { ref -> classDefByOrNull(ref.definingClass)?.methods?.firstOrNull { it.reference == ref.toString() } }
        .filter { it.parameterTypes.size == 4 && it.parameterTypes[0].toString() == base &&
            it.parameterTypes[2].toString() == contract.composer && it.returnType == "V" }
        .uniqueHook("native vertical header action")
    val header = candidates.filter { it.references().any { ref -> ref.toString() == support.reference } }
        .uniqueHook("native vertical action header")
    val actionWrapper = uiWrapper(support, "verticalHeaderAction", contract, """
        instance-of v1, p0, $subscribe
        if-nez v1, :subscribe
        instance-of v1, p0, $gift
        if-eqz v1, :render
        const-string v1, "vertical_header_hide_gift"
        goto :check
        :subscribe
        const-string v1, "vertical_header_hide_subscribe"
        :check
        invoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z
        move-result v1
        if-nez v1, :done
        :render
    """)
    bridge.methods.add(actionWrapper)
    replaceNativeUiCalls(listOf(header), support.reference, actionWrapper)
    val trophyWrapper = uiWrapper(leaderboard, "verticalHeaderLeaderboard", contract, """
        const-string v1, "vertical_header_hide_leaderboard"
        invoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z
        move-result v1
        if-nez v1, :done
    """)
    bridge.methods.add(trophyWrapper)
    replaceNativeUiCalls(listOf(header), leaderboard.reference, trophyWrapper)
}

internal fun BytecodePatchContext.replaceNativeUiCalls(methods: List<Method>, original: String, replacement: MethodReference) {
    rewriteUiCalls(methods, original, replacement) { source ->
        mutableClassDefBy(source.definingClass).methods.single { it.reference == source.reference }
    }
}
