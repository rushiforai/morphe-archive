package app.unlimited.sportsnet.patches.scores

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.unlimited.sportsnet.patches.shared.Constants.COMPATIBILITY_SPORTSNET
import app.unlimited.sportsnet.patches.shared.Constants.EXTENSION_PACKAGE
import app.unlimited.sportsnet.patches.shared.originalSignaturePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BUTTON = "$EXTENSION_PACKAGE/ScoresWatchButton;"
private const val COMMON = "Lcom/rogers/sportsnet/ui/scores/compose/common"

/** The two score card banner designs, old and new, and their tap handlers. */
private val BANNER_CLASSES = listOf(
    "$COMMON/BaseScoreCardBannerLayoutKt;",
    "$COMMON/BaseScoreCardBannerContentV2Kt;",
)

private object ContentRepositoryWrapperFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/feature/snplus/model/wrapper/ContentRepositoryWrapper;",
    name = "<init>",
)

private object EntitlementStateFactoryFingerprint : Fingerprint(
    definingClass = "/EntitlementStateFactory;",
    name = "invoke",
    returnType = "Lcom/rogers/sportsnet/feature/snplus/ui/page/data/EntitlementState;",
    parameters = listOf(
        "Lcom/rogers/sportsnet/common/model/ItemSummary;",
        "Lcom/rogers/sportsnet/service/authentication/model/data/UserEntitlementState;",
        "Z",
        "Ljava/lang/String;",
    ),
)

private object ScoresWatchNavCommandFingerprint : Fingerprint(
    definingClass = "/ScoresSegmentViewModel;",
    name = "getNavCommand",
    parameters = listOf("Lcom/rogers/sportsnet/ui/scores/action/WatchSNPlusUIAction;"),
)

private fun MutableMethod.methodCallIndex(from: Int, name: String) =
    (from until instructions.size).firstOrNull {
        ((instructions[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == name
    }

private fun register(value: Int): String {
    if (value > 15) throw PatchException("Register v$value is out of range for this hook")
    return "v$value"
}

/** Shows the banner for every game, with the extension choosing its event id and text. */
private fun MutableMethod.hookBanner() {
    val eventIdCall = methodCallIndex(0, "getSnPlusEventId") ?: throw PatchException("No event id in $name")
    val card = (getInstruction<FiveRegisterInstruction>(eventIdCall)).registerC
    val eventId = getInstruction<OneRegisterInstruction>(eventIdCall + 1).registerA

    val liveCall = methodCallIndex(eventIdCall, "isLiveOrDelayed") ?: throw PatchException("No live check in $name")
    val live = getInstruction<OneRegisterInstruction>(liveCall + 1).registerA

    val textIndex = (liveCall until instructions.size).firstOrNull {
        ((instructions[it] as? ReferenceInstruction)?.reference as? FieldReference)?.name == "sn_banner_cta_text"
    } ?: throw PatchException("No banner text in $name")
    val textCall = methodCallIndex(textIndex, "stringResource") ?: throw PatchException("No text lookup in $name")
    val text = getInstruction<OneRegisterInstruction>(textCall + 1).registerA

    // From last to first, so earlier indices stay valid.
    addInstructions(
        textCall + 2,
        """
            invoke-static {${register(text)}, ${register(eventId)}}, $BUTTON->bannerLabel(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object ${register(text)}
        """
    )
    addInstruction(liveCall + 2, "const/4 ${register(live)}, 0x1")
    addInstructions(
        eventIdCall + 2,
        """
            invoke-static {${register(eventId)}, ${register(card)}}, $BUTTON->bannerEventId(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
            move-result-object ${register(eventId)}
        """
    )
}

/** Makes a banner tap ignore games that are not on Sportsnet+. */
private fun MutableMethod.hookTap() {
    val eventId = parameterTypes.indexOfFirst { it.toString() == "Ljava/lang/String;" }
    addInstructions(
        0,
        """
            invoke-static {p$eventId}, $BUTTON->clickedEventId(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p$eventId
        """
    )
}

@Suppress("unused")
val scoresWatchButtonPatch = bytecodePatch(
    name = "Watch from Scores",
    description = "Shows a watch button on every Scores game: Watch Live while a game is on, " +
        "Watch Full Game once it is over. Games you cannot watch show a lock and the reason.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)
    extendWith("extensions/extension.mpe")

    val autoplay by booleanOption(
        key = "autoplay",
        default = true,
        title = "Start playing",
        description = "Start the game as soon as it opens, instead of showing its Sportsnet+ page first.",
        required = true,
    )

    execute {
        var banners = 0
        BANNER_CLASSES.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                val usesEventId = instructions.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getSnPlusEventId"
                }
                val isTap = method.name.contains("lambda") && method.returnType == "Lkotlin/Unit;" &&
                    method.parameterTypes.map { it.toString() }.containsAll(
                        listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
                    ) && method.parameterTypes.size <= 3
                when {
                    usesEventId && !method.name.contains("lambda") -> { method.hookBanner(); banners++ }
                    isTap -> method.hookTap()
                }
            }
        }
        if (banners != BANNER_CLASSES.size) throw PatchException("Found $banners of ${BANNER_CLASSES.size} banners")

        // Capture the app's content repository and its entitlement checks, for the lock check.
        ContentRepositoryWrapperFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstruction(returnIndex, "invoke-static {p1}, $BUTTON->contentRepository(Ljava/lang/Object;)V")
        }
        EntitlementStateFactoryFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p4}, $BUTTON->entitlementCheck(" +
                "Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/String;)V",
        )

        if (autoplay == true) {
            // The navigation command's defaults mask leaves out autoplay (bit 16) once it is set.
            ScoresWatchNavCommandFingerprint.method.apply {
                val constructor = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
                if (constructor < 0) throw PatchException("Watch navigation not found")
                addInstructions(
                    constructor,
                    """
                        const/4 v5, 0x1
                        const/16 v6, 0x7
                    """
                )
            }
        }
    }
}

private object NavigationManagerFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/ui/navigation/SportsnetNavigationManager;",
    filters = listOf(
        app.morphe.patcher.methodCall(name = "access\$toSNPlusDetailsKey"),
        app.morphe.patcher.methodCall(name = "navigateToTabRootThenRoute"),
    ),
)

@Suppress("unused")
val stayOnScoresPatch = bytecodePatch(
    name = "Stay on Scores when watching",
    description = "Opens games tapped on Scores on top of Scores, so going back from the video " +
        "returns to Scores instead of the Watch tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        val navigateIndex = NavigationManagerFingerprint.instructionMatches.last().index
        NavigationManagerFingerprint.method.apply {
            val call = getInstruction<FiveRegisterInstruction>(navigateIndex)
            replaceInstruction(
                navigateIndex,
                "invoke-static {${register(call.registerC)}, ${register(call.registerD)}, ${register(call.registerE)}}, " +
                    "$EXTENSION_PACKAGE/StayOnScores;->openDetails(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }
    }
}
