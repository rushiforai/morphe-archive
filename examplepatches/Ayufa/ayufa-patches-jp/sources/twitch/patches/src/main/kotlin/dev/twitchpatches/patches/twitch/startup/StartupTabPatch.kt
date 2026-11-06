package dev.twitchpatches.patches.twitch.startup

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.TwitchTarget
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.hasStrings
import dev.twitchpatches.patches.twitch.shared.insertAtReturn
import dev.twitchpatches.patches.twitch.shared.isInstance
import dev.twitchpatches.patches.twitch.shared.reference
import dev.twitchpatches.patches.twitch.shared.uniqueHook

private const val SETTINGS = "Ldev/twitchpatches/extension/startup/StartupTabSettings;"
private const val PAGE = "Ltv/twitch/android/models/feed/DiscoveryFeedPage;"
private const val LOCATION = "Ltv/twitch/android/models/feed/FeedLocation;"
private const val LOCATION_PAGE = $$"Ltv/twitch/android/models/feed/DiscoveryFeedPage$FeedLocationPage;"
private const val FOLLOWING_PAGE = $$"Ltv/twitch/android/models/feed/DiscoveryFeedPage$FollowingPage;"
private const val LIVE_LOCATION = $$"Ltv/twitch/android/models/feed/FeedLocation$Live;"
private const val CLIPS_LOCATION = $$"Ltv/twitch/android/models/feed/FeedLocation$Clips;"
private const val CONFIG_KEY = "default_home_page"
private const val BRIDGE_NAME = "twitchPatchesStartupPage"

/**
 * Validates Twitch's default home page provider: the no-arg instance method
 * that reads the "default_home_page" experiment value and returns one of the
 * Following, Live or Clips pages. Cold starts and the bottom navigation's
 * home destination both take their page from this method, while deep links
 * and push notifications carry their own page and never call it. Returns the
 * instruction index and register of every page return in the method.
 */
internal fun defaultHomePageReturns(method: Method): List<Pair<Int, Int>> {
    if (!method.isInstance(emptyList(), PAGE))
        throw PatchException("Startup tab: default home page provider must be a no-arg instance method returning a page")
    val code = method.code()
    fun references(reference: String) = code.any {
        (it as? ReferenceInstruction)?.reference?.toString() == reference
    }
    if (!method.hasStrings(CONFIG_KEY))
        throw PatchException("Startup tab: provider does not read the $CONFIG_KEY value")
    if (!references("$FOLLOWING_PAGE->INSTANCE:$FOLLOWING_PAGE"))
        throw PatchException("Startup tab: provider never returns the Following page")
    if (!references("$LIVE_LOCATION->INSTANCE:$LIVE_LOCATION"))
        throw PatchException("Startup tab: provider never returns the Live page")
    if (!references("$CLIPS_LOCATION->INSTANCE:$CLIPS_LOCATION"))
        throw PatchException("Startup tab: provider never returns the Clips page")
    if (code.none { it.opcode == Opcode.NEW_INSTANCE &&
            (it as? ReferenceInstruction)?.reference?.toString() == LOCATION_PAGE })
        throw PatchException("Startup tab: provider never builds a location page")
    val returns = code.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { (index, instruction) ->
            val register = (instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Startup tab: provider return has no register")
            index to register
        }
    if (returns.isEmpty()) throw PatchException("Startup tab: provider has no page return")
    return returns
}

@Suppress("unused")
val startupTabPatch = bytecodePatch(
    name = "Ayufa: Startup tab",
    description = "Ayufaのカスタムパッチ。アプリ起動時に最初に開くタブ（フォロー／ライブ／クリップ）を、パッチ設定で選べるようにします。",
    default = false,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch)
    execute {
        // The first release hooked the fragment injection's fallback default,
        // but real navigation always passes an explicit page taken from this
        // provider, so that hook could never run. Wrap the provider instead.
        val candidates = classDefByStrings(CONFIG_KEY, StringComparisonType.EQUALS)
            .flatMap { it.methods }
            .filter { it.parameterTypes.isEmpty() && it.returnType == PAGE }
        val matches = candidates.mapNotNull { method ->
            try { method to defaultHomePageReturns(method) } catch (ignored: PatchException) { null }
        }
        val (provider, returns) = matches.uniqueHook("startup tab default home page provider")
        val bridge = startupBridge(provider.definingClass)
        val method = mutableClassDefBy(provider.definingClass).methods.single { it.reference == provider.reference }
        returns.map { it.first }.asReversed().forEach { index ->
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.insertAtReturn(index, """
                invoke-static {v$register}, $bridge
                move-result-object v$register
            """)
        }
        val application = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter {
            it.name == "onCreate" && it.isInstance(emptyList(), "V")
        }.uniqueHook("startup tab settings initialization")
        val app = mutableClassDefBy(application.definingClass).methods.single { it.reference == application.reference }
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $SETTINGS->initialize(Landroid/app/Application;)V")
        }
    }
}

private fun BytecodePatchContext.startupBridge(host: String): String {
    val type = mutableClassDefBy(host)
    if (type.methods.any { it.name == BRIDGE_NAME }) throw PatchException("Startup tab bridge already exists")
    val method = ImmutableMethod(host, BRIDGE_NAME, listOf(ImmutableMethodParameter(PAGE, null, null)), PAGE,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value, null, null,
        MutableMethodImplementation(3)).toMutable()
    method.addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->selectedTab()I
        move-result v0
        if-ltz v0, :original
        const/4 v1, 0x0
        if-ne v0, v1, :not_following
        sget-object v0, $FOLLOWING_PAGE->INSTANCE:$FOLLOWING_PAGE
        return-object v0
        :not_following
        const/4 v1, 0x1
        if-ne v0, v1, :not_live
        new-instance v0, $LOCATION_PAGE
        sget-object v1, $LIVE_LOCATION->INSTANCE:$LIVE_LOCATION
        invoke-direct {v0, v1}, $LOCATION_PAGE-><init>($LOCATION)V
        return-object v0
        :not_live
        const/4 v1, 0x2
        if-ne v0, v1, :original
        new-instance v0, $LOCATION_PAGE
        sget-object v1, $CLIPS_LOCATION->INSTANCE:$CLIPS_LOCATION
        invoke-direct {v0, v1}, $LOCATION_PAGE-><init>($LOCATION)V
        return-object v0
        :original
        return-object p0
    """)
    type.methods.add(method)
    return method.reference
}
