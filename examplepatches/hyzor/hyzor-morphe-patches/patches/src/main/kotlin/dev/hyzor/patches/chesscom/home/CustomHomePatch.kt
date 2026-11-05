package dev.hyzor.patches.chesscom.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOME_LAYOUT = "${Constants.EXTENSION_PACKAGE}/home/HomeLayout;"
/** toString() of the redesigned Home's content (every section of the screen). */
internal object HomeContentToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Content(showOfflineBanner="),
)

/** What the redesigned Home's section classes print. */
private val REDESIGN_SECTIONS = listOf(
    "HeaderSection(", "StatsSection(", "GameHistorySection(", "FriendsSection(", "ChallengesSection(",
    "DailyGameSection(", "ActivityFeedSection(",
)
private const val ACTIVITIES = "Lcom/chess/home/play/RecommendedActivitiesSection;"

@Suppress("unused")
val customHomePatch = bytecodePatch(
    name = "Customize Home screen",
    description = "Choose which tiles and sections the Home screen shows, and the order of the " +
        "tiles.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("customHomePatched")

        // The redesigned Home: its Content receives every section in its constructor.
        val content = HomeContentToStringFingerprint.originalClassDef
        mutableClassDefBy(content).methods.filter { it.name == "<init>" }.maxByOrNull { it.parameterTypes.size }
            ?.apply {
                val hooks = parameterTypes.mapIndexedNotNull { index, parameter ->
                    val type = parameter.toString()
                    val method = when {
                        type == ACTIVITIES -> "recommendedActivities"
                        type == "Ljava/util/List;" -> "onlineNow"
                        sectionPrefix(type) != null -> "section"
                        else -> return@mapIndexedNotNull null
                    }
                    val register = "p${index + 1}"
                    """
                        invoke-static/range { $register .. $register }, $HOME_LAYOUT->$method(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object $register
                        check-cast $register, $type
                    """
                }
                if (hooks.size != REDESIGN_SECTIONS.size + 2) {
                    throw PatchException("Found ${hooks.size} of ${REDESIGN_SECTIONS.size + 2} redesigned Home sections")
                }
                addInstructions(0, hooks.joinToString("\n"))
            } ?: throw PatchException("The redesigned Home content constructor was not found")
    }
}

/** The redesign section a class prints, wherever in its toString the prefix sits. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun sectionPrefix(type: String): String? =
    context.classDefByOrNull { it.type == type }?.methods?.firstOrNull { it.name == "toString" }
        ?.implementation?.instructions
        ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? StringReference }
        ?.firstOrNull { reference -> REDESIGN_SECTIONS.any { reference.string.startsWith(it) } }
        ?.let { reference -> REDESIGN_SECTIONS.first { reference.string.startsWith(it) } }
