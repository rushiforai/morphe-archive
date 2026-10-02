/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.hold

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.media.reelspeed.speedSetters
import app.morphe.patches.facebook.media.taptoplay.FRAGMENT_ACTIVITY
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.MOTION_EVENT
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.media.taptoplay.touchDispatches
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.WeakHashMap

internal const val PATCH = "Hold a reel for 2x"

/**
 * What [reelLiftGuardPatch] found in each patching run, for Hold a reel for 2x, which runs after it
 * and can't find the release listeners again once their flags are hooked.
 */
private val foundAnchors = WeakHashMap<BytecodePatchContext, ReelHoldAnchors>()

/**
 * The hooks Hold a reel for 2x and Keep the reel speed share, put in once whichever is picked: every
 * touch on a Facebook screen, each long-press handler's speed-up path, the release listeners' two
 * flags, and FbGrootPlayer's speed setter, with the extension's speed getter stub filled. On the
 * accounts Facebook gives its own hold, the release listener sits on every reel, hears every lift
 * and puts back the speed the reel was drawn at, so without these a tap took a reel picked at 1.5x
 * back to normal speed (issue #25). The extension's ReelHold says what each answers.
 *
 * Declared before Hold a reel for 2x, whose dependsOn would otherwise read it as null while this
 * file initializes.
 */
internal val reelLiftGuardPatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        val anchors = findReelHoldAnchors()
        synchronized(foundAnchors) { foundAnchors[this] = anchors }
        applyReelLiftGuard(anchors)
    }
}

/**
 * A reel you hold plays at double speed until you let go, through the speed-up Facebook's Reels
 * controls already have behind server flags. See ReelHoldAnchors.kt for where the controls decide,
 * and the extension's ReelHold for each answer.
 *
 * The long-press handlers' speed-up flag, the overlay's check of it before it gives a reel its
 * release listener, the release listeners' two flags and the edge check each hand their answer to
 * the extension on its way out, and so does the read of the hold speed. Each handler tells the
 * extension when it takes the speed-up path, every touch on a Facebook screen when a gesture starts
 * and ends, so the release listener puts the speed back only after a hold, and FbGrootPlayer's
 * speed setter each player and speed it gets, going on with the speed the extension answers: a
 * hold's lift gets the speed the reel played at before the hold, which the extension reads through
 * the player's speed getter, filled into its stub.
 *
 * Off in the default selection: while its switch is on, a hold on a reel speeds it up instead of
 * opening Facebook's long-press menu, which is a choice to make. Picked, its switch starts on.
 *
 * The touch dispatch, the speed-up paths, the release listeners' flags and the speed setter come
 * from [reelLiftGuardPatch], which Keep the reel speed brings too; this patch adds the rest.
 */
@Suppress("unused")
val holdReelFor2xPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Hold a reel for 2x",
    description = "Holding a reel plays it at double speed until you let go. The hold takes the place of " +
        "Facebook's long-press menu, which the reel's more button still opens.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, reelLiftGuardPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // The guard found every anchor, and checked every flag call's answer, before anything changed.
        val anchors = synchronized(foundAnchors) { foundAnchors[this] }
            ?: refuse("the release guard it depends on didn't run first")
        applyReelHoldAnchors(anchors)
        enableStatus("reelHold")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/**
 * The name [reelLiftGuardPatch] refuses under, not Hold's: it has none of its own in the catalog,
 * and Keep the reel speed brings it as often as Hold does, so a refusal names the guard and both.
 */
private const val GUARD = "Reel release guard (Keep the reel speed, Hold a reel for 2x)"

private fun refuseGuard(detail: String): Nothing = throw PatchException("$GUARD: $detail")

/** One method whose flag calls at [calls] hand their answers to [hook]. */
internal class FlagPlan(val method: Method, val hook: String, val calls: List<Int>)

/** What [findReelHoldAnchors] found, for [applyReelHoldAnchors] to change. */
internal class ReelHoldAnchors(
    val config: String,
    val speedUpFlag: String,
    val releaseFlag: String,
    val plans: List<FlagPlan>,
    val edgeCheck: Method,
    val dispatch: Method,
    val speedUpPaths: List<Method>,
    val holdSpeed: Method,
    val setter: Method,
    val speedGetter: Method,
)

/** The long-press handlers and their speed-up paths, the release listeners, the overlay's check, the edge check and the touch dispatch. */
internal fun BytecodePatchContext.findReelHoldAnchors(): ReelHoldAnchors {
    val handlers = classDefByStrings(SPEED_UP_LOG, StringComparisonType.EQUALS).filter(::isLongPressHandler)
    if (handlers.isEmpty()) refuseGuard("no long-press handler holds \"$SPEED_UP_LOG\" and keeps $DISPATCH_DIRECTLY_FIELD")
    val configs = handlers.mapNotNull(::configType).toSet()
    val config = configs.singleOrNull() ?: refuseGuard("the long-press handlers capture ${configs.size} config types")

    // Each handler loads its log name once, on the speed-up path only; the hold starts there.
    val speedUpPaths = handlers.map { handler ->
        val loading = handler.methods.filter { speedUpLoads(it).isNotEmpty() }
        loading.singleOrNull()?.takeIf { speedUpLoads(it).size == 1 }
            ?: refuseGuard("expected the long-press handler ${handler.type} to load \"$SPEED_UP_LOG\" once, found " +
                loading.sumOf { speedUpLoads(it).size })
    }

    val speedUps = handlers.flatMap { handler -> handler.methods.flatMap { flagCalls(it, config).values } }.toSet()
    val speedUpFlag = speedUps.singleOrNull()
        ?: refuseGuard("expected the long-press handlers to ask $config one flag, found ${speedUps.sorted()}")

    val listeners = mutableListOf<ClassDef>()
    classDefForEach { if (isReleaseListener(it) && configType(it) == config) listeners += it }
    if (listeners.isEmpty()) refuseGuard("no release listener keeps $IN_LONG_PRESS_FIELD and $CONFIG_FIELD")
    val releaseFlags = listeners.flatMap { listener -> listener.methods.flatMap { flagsBefore(it, config, speedUpFlag) } }.toSet()
    val releaseFlag = releaseFlags.singleOrNull()
        ?: refuseGuard("expected the release listeners to ask one flag before $speedUpFlag, found ${releaseFlags.sorted()}")

    val lambdas = (handlers + listeners).map { it.type }.toSet()
    val builders = CONTROL_COMPONENTS.flatMap { classDefByStrings(it, StringComparisonType.EQUALS) }
        .distinctBy { it.type }.flatMap { component -> component.methods.filter { makesOneOf(it, lambdas) } }

    // A call whose answer nothing takes decides nothing (Kotlin leaves one in a long-press handler),
    // so only the calls whose answer the next instruction takes are changed.
    fun plan(method: Method, hook: String, flags: Set<String>): FlagPlan? {
        val calls = flagCalls(method, config).filterValues { it in flags }.keys.filter { answerTakenAt(method, it) != null }
        return if (calls.isEmpty()) null else FlagPlan(method, hook, calls.sorted())
    }
    val handlerPlans = handlers.flatMap { it.methods.mapNotNull { m -> plan(m, LONG_PRESS, setOf(speedUpFlag)) } }
    handlers.firstOrNull { handler -> handlerPlans.none { it.method.definingClass == handler.type } }?.let {
        refuseGuard("the long-press handler ${it.type} takes no answer of $speedUpFlag")
    }
    val listenerPlans = listeners.flatMap { it.methods.mapNotNull { m -> plan(m, RELEASE, setOf(speedUpFlag, releaseFlag)) } }
    listeners.firstOrNull { listener -> listenerPlans.none { it.method.definingClass == listener.type } }?.let {
        refuseGuard("the release listener ${it.type} takes the answer of neither flag")
    }
    val builderPlans = builders.mapNotNull { plan(it, SPEED_UP, setOf(speedUpFlag, releaseFlag)) }

    val edgeChecks = handlers.flatMap { handler -> handler.methods.flatMap { edgeChecksCalled(it, config) } }
        .distinctBy { it.toString() }
    val edgeCall = edgeChecks.singleOrNull()
        ?: refuseGuard("expected the long-press handlers to call one edge check, found ${edgeChecks.size}")
    val edgeCheck = classDefByOrNull(edgeCall.definingClass)?.methods?.singleOrNull { isMethod(it, edgeCall) }
        ?: refuseGuard("the edge check $edgeCall has no body in this build")
    if (edgeCheck.implementation!!.instructions.none { it.opcode == Opcode.RETURN }) refuseGuard("the edge check never returns")

    // FbGrootPlayer's speed setter, and the one double both speed-ups read from the config and set it to.
    val plays = classDefByStrings(GROOT_PLAY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }.flatMap(::grootPlays)
    val player = classDefBy(plays.singleOrNull()?.definingClass ?: refuseGuard("expected one player play holding \"$GROOT_PLAY\", found ${plays.size}"))
    val setter = speedSetters(player).singleOrNull() ?: refuseGuard("expected one speed setter in ${player.type}")
    val setterKey = "${player.type}->${setter.name}(F)V"
    val configClass = classDefByOrNull(config) ?: refuseGuard("this build has no $config")
    val configAnswers = configClass.methods.filter { it.parameterTypes.isEmpty() }.map { it.returnType }.toSet()
    val speedReads = SPEED_UP_COMPONENTS.flatMap { classDefByStrings(it, StringComparisonType.EQUALS) }.distinctBy { it.type }
        .flatMap { component -> component.methods.flatMap { holdSpeedReads(it, setterKey, configAnswers) } }
        .distinctBy { it.toString() }
    val speedRead = speedReads.singleOrNull()
        ?: refuseGuard("expected the speed-ups to set the speed from one read of the config, found ${speedReads.map { it.toString() }}")
    val holdSpeed = classDefByOrNull(speedRead.definingClass)?.methods?.singleOrNull { isMethod(it, speedRead) }
        ?: refuseGuard("the hold speed $speedRead has no body in this build")
    if (holdSpeed.implementation!!.instructions.none { it.opcode == Opcode.RETURN_WIDE }) refuseGuard("the hold speed never returns")

    // The player's speed getter, which the release listeners compare with the speed to put back.
    val getterCalls = listeners.flatMap { listener -> listener.methods.flatMap { speedGettersCalled(it, player.type) } }
        .distinctBy { it.toString() }
    val getterCall = getterCalls.singleOrNull()
        ?: refuseGuard("expected the release listeners to read ${player.type}'s speed with one method, found ${getterCalls.map { it.toString() }}")
    val speedGetter = player.methods.singleOrNull { isMethod(it, getterCall) } ?: refuseGuard("the speed getter $getterCall has no body in this build")
    // The extension's stub calls it from outside Facebook's package.
    if (!AccessFlags.PUBLIC.isSet(player.accessFlags) || !AccessFlags.PUBLIC.isSet(speedGetter.accessFlags) ||
        AccessFlags.STATIC.isSet(speedGetter.accessFlags)
    ) {
        refuseGuard("the speed getter $getterCall isn't a public instance method of a public class, so the extension can't call it")
    }

    val activity = classDefByOrNull(FRAGMENT_ACTIVITY) ?: refuseGuard("this build has no $FRAGMENT_ACTIVITY")
    val dispatch = touchDispatches(activity).singleOrNull()
        ?: refuseGuard("expected $FRAGMENT_ACTIVITY to declare one dispatchTouchEvent($MOTION_EVENT)Z")
    return ReelHoldAnchors(config, speedUpFlag, releaseFlag, handlerPlans + listenerPlans + builderPlans, edgeCheck, dispatch,
        speedUpPaths, holdSpeed, setter, speedGetter)
}

/**
 * After each flag call's move-result, the extension's answer in its place, in the same register,
 * which the range form names whatever its number; the branch that follows reads it as Facebook's.
 * Here for the long-press handlers' and the overlay's flags, and before each of the edge check's
 * returns, the same, and before each of the hold speed's, for its register pair. The release
 * listeners' flags and the rest are [applyReelLiftGuard]'s.
 */
internal fun BytecodePatchContext.applyReelHoldAnchors(anchors: ReelHoldAnchors) {
    for (plan in anchors.plans.filter { it.hook != RELEASE }) hookAnswers(plan)
    val edge = mutableClassDefBy(anchors.edgeCheck.definingClass).findMutableMethodOf(anchors.edgeCheck)
    edge.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.map { it.index }
        .asReversed().forEach { index ->
            val register = edge.getInstruction<OneRegisterInstruction>(index).registerA
            edge.addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $ANYWHERE
                    move-result v$register
                """,
            )
        }
    val speed = mutableClassDefBy(anchors.holdSpeed.definingClass).findMutableMethodOf(anchors.holdSpeed)
    speed.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_WIDE }.map { it.index }
        .asReversed().forEach { index ->
            val register = speed.getInstruction<OneRegisterInstruction>(index).registerA
            speed.addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static/range { v$register .. v${register + 1} }, $HOLD_SPEED
                    move-result-wide v$register
                """,
            )
        }
}

/**
 * The release listeners' flag answers through the extension, as [applyReelHoldAnchors] hooks the
 * others. Straight after each handler's "speed_up" load, which falls through to it, a call naming no
 * register. First in the touch dispatch, the event, which the extension only reads, and first in the
 * speed setter, the player and the speed, with the extension's answer in the speed's parameter
 * register. The extension's playerSpeed stub is filled with the player's speed getter.
 */
internal fun BytecodePatchContext.applyReelLiftGuard(anchors: ReelHoldAnchors) {
    // Found before anything changes, like every anchor.
    val player = anchors.speedGetter.definingClass
    val stub = mutableClassDefBy(REEL_HOLD).methods.singleOrNull {
        it.name == PLAYER_SPEED_STUB && it.returnType == "F" && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
    } ?: refuseGuard("$REEL_HOLD has no static F $PLAYER_SPEED_STUB(Ljava/lang/Object;)")
    for (plan in anchors.plans.filter { it.hook == RELEASE }) hookAnswers(plan)
    for (path in anchors.speedUpPaths) {
        val mutable = mutableClassDefBy(path.definingClass).findMutableMethodOf(path)
        mutable.addInstruction(speedUpLoads(mutable).single() + 1, "invoke-static {}, $HELD")
    }
    hookSpeedSetter(anchors.setter)
    stub.addInstructions(
        0,
        """
            check-cast p0, $player
            invoke-virtual/range { p0 .. p0 }, $player->${anchors.speedGetter.name}()F
            move-result p0
            return p0
        """,
    )
    val dispatch = mutableClassDefBy(FRAGMENT_ACTIVITY).findMutableMethodOf(anchors.dispatch)
    val event = dispatch.parameterRegister(0)
    dispatch.addInstruction(0, "invoke-static/range { $event .. $event }, $TOUCH")
}

/**
 * First in FbGrootPlayer's speed setter, the player and the speed, going on with the speed the
 * extension answers in the speed's parameter register. Keep the reel speed's own hook goes after it.
 */
internal fun BytecodePatchContext.hookSpeedSetter(setter: Method) {
    mutableClassDefBy(setter.definingClass).findMutableMethodOf(setter).addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $SPEED_SET
            move-result p1
        """,
    )
}

/** [plan]'s flag answers through its hook, each in its own register, last call first so the indices hold. */
private fun BytecodePatchContext.hookAnswers(plan: FlagPlan) {
    val mutable = mutableClassDefBy(plan.method.definingClass).findMutableMethodOf(plan.method)
    plan.calls.sortedDescending().forEach { call ->
        val register = mutable.getInstruction<OneRegisterInstruction>(call + 1).registerA
        mutable.addInstructions(
            call + 2,
            """
                invoke-static/range { v$register .. v$register }, ${plan.hook}
                move-result v$register
            """,
        )
    }
}
