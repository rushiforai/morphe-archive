package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val MAIN_ACTIVITY = "Lcom/x/android/main/MainActivity;"
private const val SOURCE_WRAPPER = "Lcom/x/compose/theme/j;"
private const val HAZE_STATE_HELPER = "Lcom/x/ui/common/post/b;"
private const val HAZE_EFFECT_OWNER = "Lcom/x/compose/core/o0;"
private const val HAZE_EFFECT_METHOD = "${HAZE_EFFECT_OWNER}->b(Landroidx/compose/ui/Modifier;Ldev/chrisbanes/haze/a1;JLdev/chrisbanes/haze/blur/g0;FZFLdev/chrisbanes/haze/j0;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Landroidx/compose/ui/Modifier;"

private const val ALIGNMENT_OWNER = "Landroidx/compose/ui/b;"
private const val BOTTOM_START = "${ALIGNMENT_OWNER}->g:Landroidx/compose/ui/i;"
private const val BOTTOM_CENTER = "${ALIGNMENT_OWNER}->h:Landroidx/compose/ui/i;"
private const val BOX_SCOPE = "Landroidx/compose/foundation/layout/x;"
private const val BOX_SCOPE_INSTANCE = "${BOX_SCOPE}->a:Landroidx/compose/foundation/layout/x;"
private const val BOX_ALIGN = "${BOX_SCOPE}->a(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/d;)Landroidx/compose/ui/Modifier;"
private const val MODIFIER_SINGLETON = "Landroidx/compose/ui/q;->a:Landroidx/compose/ui/q;"
private const val FILL_WIDTH = "Landroidx/compose/foundation/layout/m3;->g(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;"
private const val NAV_INSETS_FACTORY = "Landroidx/compose/foundation/layout/e;->u(Landroidx/compose/runtime/Composer;)Landroidx/compose/foundation/layout/z3;"
private const val NAV_INSETS_FIELD = "Landroidx/compose/foundation/layout/z3;->e:Landroidx/compose/foundation/layout/c;"
private const val INSETS_PADDING = "Landroidx/compose/foundation/layout/e;->R(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/y3;)Landroidx/compose/ui/Modifier;"
private const val CONTENT_INVOKE = "Landroidx/compose/runtime/internal/g;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
private const val SPACER_CALL = "Landroidx/compose/foundation/layout/e;->d(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)V"
private const val POINTER_INPUT = "Landroidx/compose/ui/input/pointer/g0;->b("
private const val NAV_HANDLER = "Lcom/x/compose/navbars/i;"
private const val STATE_FACTORY = "${HAZE_STATE_HELPER}->f(Landroidx/compose/runtime/Composer;)Ldev/chrisbanes/haze/a1;"
private const val SOURCE_MODIFIER = "${HAZE_STATE_HELPER}->e(Landroidx/compose/ui/Modifier;Ldev/chrisbanes/haze/a1;FI)Landroidx/compose/ui/Modifier;"
private const val LAMBDA_FACTORY = "Landroidx/compose/runtime/internal/h;->e(ILkotlin/Function;Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/internal/g;"
private const val WRAPPER_CTOR = "${SOURCE_WRAPPER}-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V"

private const val HOOK_NAME = "serajrApplyNavigationHaze"
private const val HOOK_DESCRIPTOR = "${MAIN_ACTIVITY}->${HOOK_NAME}(Landroidx/compose/ui/Modifier;Ldev/chrisbanes/haze/a1;Landroidx/compose/runtime/Composer;)Landroidx/compose/ui/Modifier;"

private const val BOTTOM_BAR_OWNER = "Lcom/x/ui/common/t2;"
private const val ANIMATED_VISIBILITY_PREFIX = "Landroidx/compose/animation/q;->h("
private const val BOTTOM_BAR_STATE_PROVIDER_PREFIX = "Lcom/x/ui/common/p2;->a("

private const val MUTABLE_STATE = "Landroidx/compose/runtime/w1;"
private const val MUTABLE_STATE_FACTORY = "Landroidx/compose/runtime/i;->r(Ljava/lang/Object;)${MUTABLE_STATE}"
private const val MUTABLE_STATE_GET = "${MUTABLE_STATE}->getValue()Ljava/lang/Object;"
private const val MUTABLE_STATE_SET = "${MUTABLE_STATE}->setValue(Ljava/lang/Object;)V"

private const val GET_STATE_NAME = "serajrGetBottomBarVisibleState"
private const val GET_STATE_DESCRIPTOR = "${MAIN_ACTIVITY}->${GET_STATE_NAME}()${MUTABLE_STATE}"
private const val WRITE_STATE_NAME = "serajrOnBottomBarVisible"
private const val WRITE_STATE_DESCRIPTOR = "${MAIN_ACTIVITY}->${WRITE_STATE_NAME}(Z)V"

private const val TAB_CONTENT = "Lcom/x/main/tabs/x;"
private const val TAB_NAVIGATOR = "Lcom/x/main/tabs/g;"
private const val CHILD_STACK = "Lcom/arkivanov/decompose/router/stack/a;"
private const val TAB_STACK_FIELD = "${TAB_NAVIGATOR}->p:Lcom/arkivanov/decompose/value/operator/a;"
private const val BACKSTACK_FIELD = "${CHILD_STACK}->b:Ljava/util/List;"

private const val GET_FEED_NAME = "serajrGetFeedActiveState"
private const val GET_FEED_DESCRIPTOR = "${MAIN_ACTIVITY}->${GET_FEED_NAME}()${MUTABLE_STATE}"
private const val WRITE_FEED_NAME = "serajrOnFeedActive"
private const val WRITE_FEED_DESCRIPTOR = "${MAIN_ACTIVITY}->${WRITE_FEED_NAME}(Z)V"

private const val ROOT_OBSERVER = "Lcom/x/android/main/bk1;"
private const val ROOT_STACK_FIELD = "Lcom/x/android/main/u9;->d0:Lcom/arkivanov/decompose/value/b;"
private const val ROOT_CONFIG_FIELD = "Lcom/arkivanov/decompose/b;->a:Ljava/lang/Object;"
private const val ROOT_CHILD_FIELD = "${CHILD_STACK}->a:Lcom/arkivanov/decompose/b;"
private const val ROOT_CHILDREN_FIELD = "${CHILD_STACK}->c:Lcom/arkivanov/decompose/k;"
private const val ROOT_LANDING = "Lcom/x/navigation/xd;"
private const val ROOT_TABS = "Lcom/x/navigation/ir;"
private const val ROOT_STATE_FIELD = "${MAIN_ACTIVITY}->serajrRootContextState:${MUTABLE_STATE}"
private const val GET_ROOT_CONTEXT = "${MAIN_ACTIVITY}->serajrGetRootContextState()${MUTABLE_STATE}"
private const val PUBLISH_ROOT_CONTEXT = "${MAIN_ACTIVITY}->serajrOnRootContext(${CHILD_STACK})V"
private const val LAST_ROOT_CLASS = "${MAIN_ACTIVITY}->serajrNavLastRootClass:Ljava/lang/Class;"

// Haze.
// Keeps the injected Navigation Bar Haze visible behind the native bottom bar.
// Values: false = follow the visibility gate, true = always render.
// Default: true.

// Defines the default maximum blur radius used by the progressive Haze.
// The native progressive shader reduces the radius toward the upper edge.
// Minimum runtime value: 0.0 dp | Maximum: 64.0 dp | Default: 32.0 dp.
// Runtime key: serajr_x_haze_radius.
private const val PROGRESSIVE_BLUR_RADIUS = 32.0f

// Selects the diagnostic magenta replacement for the injected Haze colors.
// Tint alpha is independently configurable at runtime; background retains native opacity.
// Values: 0 = off, 1 = tint, 2 = background, 3 = tint + background.
// Minimum: 0 | Maximum: 3 | Default: 0.
// Runtime key: serajr_x_haze_debug_magenta.
private const val DEBUG_MAGENTA_MODE = 0

// Controls the alpha applied to the injected Haze tint after resolving its color.
// This does not change the background color or the native progressive mask.
// Minimum: 0.0 (transparent) | Maximum: 1.0 (opaque) | Default: 0.75.
// Runtime key: serajr_x_haze_tint_alpha.
private const val DEFAULT_TINT_ALPHA = 0.75f

// Controls the native Haze noise factor for the injected Navigation Bar overlay.
// This changes only the noise amount; it does not modify blur, tint or the mask.
// Minimum: 0.0 (off) | Maximum: 1.0 | Default: 0.05 (validated T4E-T2).
// Runtime key: serajr_x_haze_noise_factor.
private const val DEFAULT_NOISE_FACTOR = 0.05f

// Enables the existing native progressive blur callback.
// Values: false = solid, true = progressive.
// Default: true.
private const val USE_PROGRESSIVE_HAZE = true

private const val USE_PROGRESSIVE_MASK = true
private const val ENABLE_RUNTIME_BLUR_CONTROL = true
private const val NAV_EXTENSION = "Lapp/serajr/extension/navigationbar/PersistentNavigationHaze;"
private const val ON_CREATE_SUPER = "Landroidx/fragment/app/m0;->onCreate(Landroid/os/Bundle;)V"
private const val PROGRESSIVE_MASK_FACTORY = "Lcom/google/firebase/perf/logging/b;->J(Ljava/util/List;FFI)Landroidx/compose/ui/graphics/t0;"
private const val PROGRESSIVE_MASK_SETTER = "Ldev/chrisbanes/haze/blur/l;->c(Landroidx/compose/ui/graphics/v;)V"
private const val MASK_BLACK = "Landroidx/compose/ui/graphics/z;->b:J"
private const val MASK_TRANSPARENT = "Landroidx/compose/ui/graphics/z;->m:J"
private const val MASK_COLOR_CTOR = "Landroidx/compose/ui/graphics/z;-><init>(J)V"
private const val PROGRESSIVE_CALLBACK = "Lcom/x/compose/core/p0;"
private const val PROGRESSIVE_TYPE = "Ldev/chrisbanes/haze/n0;"
private const val PROGRESSIVE_EASING = "Lcom/x/compose/core/s0;->d:Landroidx/compose/animation/core/v;"
private const val PROGRESSIVE_CTOR = "${PROGRESSIVE_TYPE}-><init>(Landroidx/compose/animation/core/a0;JJ)V"
private const val PROGRESSIVE_SETTER = "Ldev/chrisbanes/haze/blur/l;->e(${PROGRESSIVE_TYPE})V"
private const val GET_PROGRESSIVE = "${MAIN_ACTIVITY}->serajrGetNavProgressive()${PROGRESSIVE_CALLBACK}"

// D3-K1A.11-T2: temporary diagnostics.
private const val DIAG_TAG = "SerajrNavHaze"

private const val LAST_STACK_FIELD =
    "${MAIN_ACTIVITY}->serajrNavLastStack:I"
private const val LAST_STACK_VALID_FIELD =
    "${MAIN_ACTIVITY}->serajrNavLastStackValid:I"
private const val LAST_HOOK_FIELD =
    "${MAIN_ACTIVITY}->serajrNavLastHook:I"
private const val LAST_FEED_FIELD =
    "${MAIN_ACTIVITY}->serajrNavLastFeed:I"

private const val DIAG_LOG =
    "${MAIN_ACTIVITY}->serajrNavDiag(Ljava/lang/String;IIII)V"
private const val DIAG_HOOK =
    "${MAIN_ACTIVITY}->serajrNavHook(ZZZ)V"
private const val DIAG_STACK =
    "${MAIN_ACTIVITY}->serajrNavStack(Ljava/lang/Object;Ljava/lang/Object;III)V"
private const val DIAG_PUSH =
    "${MAIN_ACTIVITY}->serajrNavPush(ILjava/lang/Object;)V"
private const val DIAG_FEED =
    "${MAIN_ACTIVITY}->serajrNavFeed(Z)V"

private fun Method.refAt(index: Int): String? =
    (implementation?.instructions?.elementAtOrNull(index)
        as? ReferenceInstruction)?.reference?.toString()

// Resolve the boolean override recorder without relying on obfuscated names.
private fun Method.isNativeBlurRecorder(): Boolean {
    if (!definingClass.startsWith("Ldev/chrisbanes/haze/")) return false
    if (!AccessFlags.PUBLIC.isSet(accessFlags) || AccessFlags.STATIC.isSet(accessFlags)) return false
    if (returnType != "V" || parameterTypes.map { it.toString() } != listOf("Z")) return false
    val impl = implementation ?: return false
    val input = impl.registerCount - 1
    val instructions = impl.instructions.toList()
    val boxing = instructions.filter {
        it.opcode == Opcode.INVOKE_STATIC &&
            (it as? ReferenceInstruction)?.reference?.toString() ==
            "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"
    }
    if (boxing.size != 1) return false
    val call = boxing.single() as? FiveRegisterInstruction ?: return false
    if (call.registerCount != 1 || call.registerC != input) return false
    return instructions.any {
        it.opcode == Opcode.INVOKE_INTERFACE &&
            (it as? ReferenceInstruction)?.reference?.toString() ==
            "Ljava/util/Collection;->add(Ljava/lang/Object;)Z"
    }
}

@Suppress("unused")
val fixNavigationBarHazeExperimentalPatch = bytecodePatch(
    name = "Fix Navigation Bar Haze (Experimental)",
    description = "D3-K1A.11-T5 Global Overlay Fix 1: Scaffold MainContent overlay, T4E-T4 runtime controls.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)
    extendWith("extensions/navigation.mpe")

    execute {
        var originalOnCreate: Method? = null
        var originalRoot: Method? = null
        var originalBottomBar: Method? = null
        var originalTabContent: Method? = null
        var originalTabPush: Method? = null
        var tabAnchor = -1
        val blurRecorders = mutableListOf<Method>()

        val requiredMethods = setOf(
            "Landroidx/compose/foundation/layout/s;->a(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V",
            HAZE_EFFECT_METHOD,
            "Lcom/x/compose/core/m0;->a(Landroidx/compose/runtime/Composer;)J",
            "Lcom/x/compose/core/m0;->b(Landroidx/compose/runtime/Composer;)Z",
            "Landroidx/compose/ui/graphics/z;->b(FJ)J",
            "Ldev/chrisbanes/haze/blur/g0;-><init>(J)V",
            BOX_ALIGN,
            FILL_WIDTH,
            NAV_INSETS_FACTORY,
            INSETS_PADDING,
            SPACER_CALL,
            STATE_FACTORY,
            SOURCE_MODIFIER,
            LAMBDA_FACTORY,
            WRAPPER_CTOR,
            MUTABLE_STATE_FACTORY,
            MUTABLE_STATE_GET,
            MUTABLE_STATE_SET
        ) + (if (USE_PROGRESSIVE_HAZE) setOf(PROGRESSIVE_CTOR, PROGRESSIVE_SETTER) else emptySet()) +
            (if (USE_PROGRESSIVE_HAZE && USE_PROGRESSIVE_MASK)
                setOf(PROGRESSIVE_MASK_FACTORY, PROGRESSIVE_MASK_SETTER, MASK_COLOR_CTOR)
            else emptySet())

        val requiredFields = setOf(
            BOTTOM_START,
            BOTTOM_CENTER,
            BOX_SCOPE_INSTANCE,
            MODIFIER_SINGLETON,
            NAV_INSETS_FIELD,
            TAB_STACK_FIELD,
            BACKSTACK_FIELD,
            ROOT_STACK_FIELD,
            ROOT_CONFIG_FIELD,
            ROOT_CHILDREN_FIELD,
            "${CHILD_STACK}->a:Lcom/arkivanov/decompose/b;",
            "Lcom/arkivanov/decompose/b;->b:Ljava/lang/Object;",
            "Lcom/x/compose/core/s2;->a:Ljava/lang/Object;",
            "${TAB_CONTENT}->c:Lcom/x/navigation/wd;",
            "${TAB_NAVIGATOR}->h:Lcom/x/navigation/wd;"
        ) + (if (USE_PROGRESSIVE_HAZE) setOf(PROGRESSIVE_EASING) else emptySet()) +
            (if (USE_PROGRESSIVE_HAZE && USE_PROGRESSIVE_MASK)
                setOf(MASK_BLACK, MASK_TRANSPARENT) else emptySet())

        val foundMethods = mutableSetOf<String>()
        val foundFields = mutableSetOf<String>()
        var wrapperVerified = false
        val rootRouteTypes = mutableSetOf<String>()

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (ENABLE_RUNTIME_BLUR_CONTROL && method.isNativeBlurRecorder()) blurRecorders.add(method)
                val descriptor = method.toString()
                if (descriptor in requiredMethods) {
                    foundMethods.add(descriptor)
                }
            }

            classDef.fields.forEach { field ->
                val descriptor = field.toString()
                if (descriptor in requiredFields) {
                    foundFields.add(descriptor)
                }
            }

            if (classDef.type.toString() in setOf(ROOT_LANDING, ROOT_TABS)) {
                rootRouteTypes.add(classDef.type.toString())
            }

            when (classDef.type.toString()) {
                MAIN_ACTIVITY -> {
                    originalOnCreate = classDef.methods.singleOrNull {
                        it.name == "onCreate" && it.returnType == "V" &&
                            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
                    }
                    originalRoot = classDef.methods.firstOrNull { method ->
                        method.name == "P" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Z",
                                "Landroidx/compose/runtime/internal/g;",
                                "Landroidx/compose/runtime/Composer;",
                                "I"
                            )
                    }
                }

                SOURCE_WRAPPER -> {
                    wrapperVerified = classDef.methods.any { method ->
                        method.name == "invoke" &&
                            method.implementation?.instructions?.any {
                                (it as? ReferenceInstruction)
                                    ?.reference?.toString() == SOURCE_MODIFIER
                            } == true
                    }
                }

                BOTTOM_BAR_OWNER -> {
                    originalBottomBar =
                        classDef.methods.firstOrNull { method ->
                            method.name == "a" &&
                                method.returnType == "V" &&
                                method.parameterTypes.map { it.toString() } ==
                                listOf(
                                    "Landroidx/compose/runtime/internal/g;",
                                    "Ldev/chrisbanes/haze/a1;",
                                    "Lkotlin/jvm/functions/Function1;",
                                    "Landroidx/compose/ui/Modifier;",
                                    "Landroidx/compose/runtime/internal/g;",
                                    "Z", "Z", "Z",
                                    "Landroidx/compose/runtime/internal/g;",
                                    "Landroidx/compose/runtime/Composer;",
                                    "I"
                                )
                        }
                }

                TAB_NAVIGATOR -> {
                    val candidates = classDef.methods.filter { method ->
                        method.name == "t" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Lcom/x/navigation/fp;",
                                "Lcom/x/main/api/s;",
                                "Z"
                            )
                    }

                    require(candidates.size == 1) {
                        "FixNavigationBarHaze: expected one tab push method."
                    }

                    originalTabPush = candidates.single()
                }

                TAB_CONTENT -> {
                    val candidates =
                        classDef.methods.filter {
                            it.name == "invoke"
                        }.flatMap { method ->
                            val ins = method.implementation
                                ?.instructions?.toList().orEmpty()

                            ins.indices.filter { index ->
                                if (
                                    ins[index].opcode != Opcode.CHECK_CAST ||
                                    method.refAt(index) != CHILD_STACK ||
                                    (ins[index] as? OneRegisterInstruction)
                                        ?.registerA != 1
                                ) return@filter false

                                val start = maxOf(0, index - 12)
                                val refs = (start until index)
                                    .mapNotNull { method.refAt(it) }

                                val field = refs.indexOf(TAB_STACK_FIELD)
                                val adapter = refs.indexOfFirst {
                                    it.contains("thrift/scheme/b;->X(")
                                }
                                val read = refs.indexOfLast {
                                    it.endsWith(
                                        "i3;->getValue()Ljava/lang/Object;"
                                    )
                                }

                                field >= 0 &&
                                    adapter > field &&
                                    read > adapter
                            }.map { method to it }
                        }

                    require(candidates.size == 1) {
                        "FixNavigationBarHaze: expected one active tab ChildStack anchor."
                    }

                    originalTabContent = candidates.single().first
                    tabAnchor = candidates.single().second
                }
            }
        }

        require(
            wrapperVerified &&
                rootRouteTypes.containsAll(setOf(ROOT_LANDING, ROOT_TABS)) &&
                foundMethods.containsAll(requiredMethods) &&
                foundFields.containsAll(requiredFields)
        ) {
            "FixNavigationBarHaze: native helpers do not match. " +
                "Missing methods: ${requiredMethods - foundMethods}; " +
                "fields: ${requiredFields - foundFields}"
        }

        val blurRecorder = if (ENABLE_RUNTIME_BLUR_CONTROL) {
            require(blurRecorders.size == 1) {
                "FixNavigationBarHaze T4D: expected one blur recorder, found ${blurRecorders.map { it.toString() }}"
            }
            val original = blurRecorders.single()
            val mutable = mutableClassDefBy(original.definingClass).methods.single {
                it.toString() == original.toString()
            }
            val input = (mutable.implementation ?: error("T4D: missing recorder body")).registerCount - 1
            require(input in 1..255) { "T4D: invalid blur recorder input register: v$input" }
            mutable to input
        } else null

        val root = originalRoot
            ?: error("FixNavigationBarHaze: MainActivity.P not found.")

        val bottomBar = originalBottomBar
            ?: error("FixNavigationBarHaze: t2.a not found.")

        val tab = originalTabContent
            ?: error("FixNavigationBarHaze: tabs/x.invoke not found.")

        val tabPush = originalTabPush
            ?: error("FixNavigationBarHaze: tabs/g.t not found.")

        val mutableClass = mutableClassDefBy(root.definingClass)

        val mutableRoot = mutableClass.methods.first {
            it.toString() == root.toString()
        }

        val mutableBottomBar =
            mutableClassDefBy(bottomBar.definingClass).methods.first {
                it.toString() == bottomBar.toString()
            }

        val mutableTab =
            mutableClassDefBy(tab.definingClass).methods.first {
                it.toString() == tab.toString()
            }

        val mutableTabPush =
            mutableClassDefBy(tabPush.definingClass).methods.first {
                it.toString() == tabPush.toString()
            }

        val implementation = mutableRoot.implementation
            ?: error("Missing root implementation")

        require(implementation.registerCount == 15)

        val instructions = implementation.instructions.toList()

        val contentCandidates = instructions.indices.filter { index ->
            if (root.refAt(index) != CONTENT_INVOKE) {
                return@filter false
            }

            val call = instructions[index] as? FiveRegisterInstruction
                ?: return@filter false

            call.registerCount == 3 &&
                call.registerC == 12 &&
                call.registerD == 4 &&
                call.registerE == 13 &&
                (index + 1 until minOf(
                    index + 6,
                    instructions.size
                )).any {
                    root.refAt(it) == BOTTOM_CENTER
                }
        }

        require(contentCandidates.size == 1) {
            "FixNavigationBarHaze: expected one root content invocation."
        }

        val contentIndex = contentCandidates.single()

        val spacerCandidates = instructions.indices.filter { index ->
            if (
                root.refAt(index) != SPACER_CALL ||
                index <= contentIndex
            ) return@filter false

            val call = instructions[index] as? FiveRegisterInstruction
                ?: return@filter false

            call.registerCount == 2 &&
                call.registerC == 4 &&
                call.registerD == 13 &&
                (contentIndex + 1 until index).any {
                    root.refAt(it)?.startsWith(POINTER_INPUT) == true
                } &&
                (contentIndex + 1 until index).any {
                    root.refAt(it)?.contains(NAV_HANDLER) == true
                }
        }

        require(spacerCandidates.size == 1)

        val spacerIndex = spacerCandidates.single()

        require(
            spacerIndex - contentIndex < 55 &&
                root.refAt(spacerIndex + 1) ==
                "Landroidx/compose/runtime/o0;->u(Z)V"
        )

        val barIns =
            mutableBottomBar.implementation!!.instructions.toList()

        val visibilityCandidates = barIns.indices.filter { index ->
            if (
                index == 0 ||
                bottomBar.refAt(index)
                    ?.startsWith(ANIMATED_VISIBILITY_PREFIX) != true ||
                barIns[index].opcode != Opcode.INVOKE_STATIC_RANGE
            ) return@filter false

            val range = barIns[index] as? RegisterRangeInstruction
                ?: return@filter false

            val previous = barIns[index - 1]

            range.startRegister == 9 &&
                range.registerCount == 10 &&
                previous.opcode == Opcode.CONST_4 &&
                (previous as? OneRegisterInstruction)?.registerA == 5 &&
                (previous as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
                (index + 1 until minOf(
                    index + 32,
                    barIns.size
                )).any {
                    bottomBar.refAt(it)
                        ?.startsWith(BOTTOM_BAR_STATE_PROVIDER_PREFIX) == true
                }
        }

        require(visibilityCandidates.size == 1) {
            "FixNavigationBarHaze: expected one Bottom Bar visibility anchor."
        }

        val visibilityIndex = visibilityCandidates.single()

        // REA verified these register layouts for X 12.40.1.
        require(
            mutableTab.implementation!!.registerCount == 26 &&
                tabAnchor >= 0
        ) {
            "FixNavigationBarHaze: unexpected tab content register layout."
        }

        require(
            mutableTabPush.implementation!!.registerCount == 11
        ) {
            "FixNavigationBarHaze: unexpected tab push register layout."
        }

        // T5: verify the existing reactive root ChildStack read.
        val rootObserver = mutableClassDefBy(ROOT_OBSERVER).methods.single {
            it.name == "invoke" && it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.map { p -> p.toString() } ==
                listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }
        val observerImpl = rootObserver.implementation
            ?: error("FixNavigationBarHaze T5: missing root observer implementation.")
        val observerIns = observerImpl.instructions.toList()
        require(observerImpl.registerCount == 26 && observerIns.size > 64)
        require(
            observerIns[61].opcode == Opcode.INVOKE_INTERFACE &&
                rootObserver.refAt(61) == "Landroidx/compose/runtime/i3;->getValue()Ljava/lang/Object;" &&
                (observerIns[61] as? FiveRegisterInstruction)?.registerC == 1 &&
                observerIns[62].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (observerIns[62] as? OneRegisterInstruction)?.registerA == 9 &&
                observerIns[63].opcode == Opcode.CHECK_CAST &&
                rootObserver.refAt(63) == CHILD_STACK &&
                (observerIns[63] as? OneRegisterInstruction)?.registerA == 9 &&
                observerIns[64].opcode == Opcode.IGET_OBJECT &&
                rootObserver.refAt(64) == ROOT_CHILDREN_FIELD &&
                (observerIns[64] as? TwoRegisterInstruction)?.registerA == 9 &&
                (observerIns[64] as? TwoRegisterInstruction)?.registerB == 9 &&
                (0 until 61).any { rootObserver.refAt(it) == ROOT_STACK_FIELD }
        ) { "FixNavigationBarHaze T5: unexpected root ChildStack anchor." }

        val injectedMethods = setOf(
            HOOK_NAME,
            GET_STATE_NAME,
            WRITE_STATE_NAME,
            GET_FEED_NAME,
            WRITE_FEED_NAME,
            "serajrNavDiag",
            "serajrNavHook",
            "serajrNavStack",
            "serajrNavPush",
            "serajrNavFeed",
            "serajrGetRootContextState",
            "serajrOnRootContext"
        )

        val injectedFields = setOf(
            "serajrBottomBarVisibleState",
            "serajrFeedActiveState",
            "serajrNavLastStack",
            "serajrNavLastStackValid",
            "serajrNavLastHook",
            "serajrNavLastFeed",
            "serajrRootContextState",
            "serajrNavLastRootClass"
        )

        require(mutableClass.methods.none {
            it.name in injectedMethods
        })

        require(mutableClass.fields.none {
            it.name in injectedFields
        })

        // Shared helper creation.

        fun addStaticField(name: String, type: String) {
            mutableClass.fields.add(
                ImmutableField(
                    MAIN_ACTIVITY,
                    name,
                    type,
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    null
                ).toMutable()
            )
        }

        fun addStaticMethod(
            name: String,
            parameters: List<String>,
            returnType: String,
            registers: Int,
            public: Boolean = false,
            body: String
        ) {
            val visibility = if (public) {
                AccessFlags.PUBLIC.value
            } else {
                AccessFlags.PRIVATE.value
            }

            val method = ImmutableMethod(
                MAIN_ACTIVITY,
                name,
                parameters.map {
                    ImmutableMethodParameter(it, null, null)
                },
                returnType,
                visibility or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(registers)
            ).toMutable()

            method.addInstructions(0, body.trimIndent())
            mutableClass.methods.add(method)
        }

        // T4D: isolated, cached progressive-only callback.
        // Stock p0 instances retain their original invoke path.
        if (USE_PROGRESSIVE_HAZE) {
            require(PROGRESSIVE_BLUR_RADIUS.isFinite() && PROGRESSIVE_BLUR_RADIUS > 0f)
            val callback = mutableClassDefBy(PROGRESSIVE_CALLBACK)
            require(callback.superclass == "Ljava/lang/Object;")
            require("Lkotlin/jvm/functions/Function1;" in callback.interfaces)
            val flag = "${PROGRESSIVE_CALLBACK}->serajrProgressiveOnly:Z"
            require(callback.fields.none { it.name == "serajrProgressiveOnly" })
            require(callback.methods.none { it.name == "<init>" && it.parameterTypes.isEmpty() })
            val invoke = callback.methods.single {
                it.name == "invoke" && it.returnType == "Ljava/lang/Object;" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;")
            }
            val impl = invoke.implementation ?: error("T4D: missing callback implementation")
            require(impl.registerCount == 14 &&
                impl.instructions[0].opcode == Opcode.CHECK_CAST &&
                invoke.refAt(0) == "Ldev/chrisbanes/haze/blur/l;" &&
                (impl.instructions[0] as? OneRegisterInstruction)?.registerA == 13 &&
                impl.instructions[1].opcode == Opcode.SGET_OBJECT &&
                invoke.refAt(1) == "Lcom/x/compose/core/s0;->b:Landroidx/compose/ui/graphics/t0;" &&
                (impl.instructions[1] as? OneRegisterInstruction)?.registerA == 0 &&
                impl.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == PROGRESSIVE_SETTER }
            ) { "T4D: unexpected native callback layout" }
            require(mutableClass.fields.none { it.name == "serajrNavProgressive" })
            require(mutableClass.methods.none { it.name == "serajrGetNavProgressive" })
            callback.fields.add(ImmutableField(PROGRESSIVE_CALLBACK, "serajrProgressiveOnly", "Z",
                AccessFlags.PRIVATE.value, null, null, null).toMutable())
            val maskField = "${PROGRESSIVE_CALLBACK}->serajrProgressiveMask:Landroidx/compose/ui/graphics/t0;"
            if (USE_PROGRESSIVE_MASK) {
                require(callback.fields.none { it.name == "serajrProgressiveMask" })
                callback.fields.add(ImmutableField(PROGRESSIVE_CALLBACK, "serajrProgressiveMask",
                    "Landroidx/compose/ui/graphics/t0;",
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null, null, null).toMutable())
            }
            val ctor = ImmutableMethod(PROGRESSIVE_CALLBACK, "<init>",
                emptyList<ImmutableMethodParameter>(), "V",
                AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
                null, null, MutableMethodImplementation(if (USE_PROGRESSIVE_MASK) 6 else 2)).toMutable()
            ctor.addInstructions(0, """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                const/4 v0, 0x1
                iput-boolean v0, p0, $flag
                ${if (USE_PROGRESSIVE_MASK) {
                    """
                        # Build the inverted linear mask once per cached callback.
                        sget-wide v0, $MASK_BLACK
                        new-instance v2, Landroidx/compose/ui/graphics/z;
                        invoke-direct {v2, v0, v1}, $MASK_COLOR_CTOR
                        sget-wide v0, $MASK_TRANSPARENT
                        new-instance v3, Landroidx/compose/ui/graphics/z;
                        invoke-direct {v3, v0, v1}, $MASK_COLOR_CTOR
                        filled-new-array {v2, v3}, [Landroidx/compose/ui/graphics/z;
                        move-result-object v0
                        invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
                        move-result-object v0
                        invoke-static {}, $NAV_EXTENSION->getNavigationMaskLength()F
                        move-result v1
                        const/4 v2, 0x0
                        const/4 v3, 0x0
                        invoke-static {v0, v1, v2, v3}, $PROGRESSIVE_MASK_FACTORY
                        move-result-object v0
                        iput-object v0, p0, $maskField
                    """.trimIndent()
                } else ""}
                return-void
            """.trimIndent())
            callback.methods.add(ctor)
            invoke.addInstructionsWithLabels(1, """
                iget-boolean v0, p0, $flag
                if-eqz v0, :serajr_progressive_stock
                new-instance v0, $PROGRESSIVE_TYPE
                sget-object v1, $PROGRESSIVE_EASING
                const-wide/32 v2, 0x7f800000
                const-wide/16 v4, 0x0
                invoke-direct/range {v0 .. v5}, $PROGRESSIVE_CTOR
                invoke-interface {p1, v0}, $PROGRESSIVE_SETTER
                ${if (USE_PROGRESSIVE_MASK) {
                    """
                        iget-object v0, p0, $maskField
                        invoke-interface {p1, v0}, $PROGRESSIVE_MASK_SETTER
                    """.trimIndent()
                } else ""}
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """.trimIndent(), ExternalLabel("serajr_progressive_stock", 1))
            val cache = "${MAIN_ACTIVITY}->serajrNavProgressive:${PROGRESSIVE_CALLBACK}"
            addStaticField("serajrNavProgressive", PROGRESSIVE_CALLBACK)
            val maskLengthCache = "${MAIN_ACTIVITY}->serajrNavMaskLength:F"
            addStaticField("serajrNavMaskLength", "F")
            addStaticMethod(
                name = "serajrGetNavProgressive",
                parameters = emptyList(), returnType = PROGRESSIVE_CALLBACK, registers = 2,
                body = """
                    invoke-static {}, $NAV_EXTENSION->getNavigationMaskLength()F
                    move-result v1
                    sget-object v0, $cache
                    if-eqz v0, :progressive_rebuild
                    sget v0, $maskLengthCache
                    cmpl-float v0, v0, v1
                    if-eqz v0, :progressive_ready_cached
                    :progressive_rebuild
                    new-instance v0, $PROGRESSIVE_CALLBACK
                    invoke-direct {v0}, ${PROGRESSIVE_CALLBACK}-><init>()V
                    sput-object v0, $cache
                    sput v1, $maskLengthCache
                    return-object v0
                    :progressive_ready_cached
                    sget-object v0, $cache
                    return-object v0
                """
            )
        }

        // Temporary diagnostic fields.
        // Zero means uninitialized for the encoded state fields.

        addStaticField("serajrNavLastStack", "I")
        addStaticField("serajrNavLastStackValid", "I")
        addStaticField("serajrNavLastHook", "I")
        addStaticField("serajrNavLastFeed", "I")

        // Generic numeric diagnostic logger.

        addStaticMethod(
            name = "serajrNavDiag",
            parameters = listOf(
                "Ljava/lang/String;", "I", "I", "I", "I"
            ),
            returnType = "V",
            registers = 11,
            body = """
                new-instance v0, Ljava/lang/StringBuilder;
                invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

                invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                const-string v1, " a="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v1, " b="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v1, " c="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v1, " d="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1

                const-string v2, "$DIAG_TAG"
                invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                return-void
            """
        )

        // HOOK: deduplicate the packed Boolean triple.
        // Add one so the first invocation is always logged.

        addStaticMethod(
            name = "serajrNavHook",
            parameters = listOf("Z", "Z", "Z"),
            returnType = "V",
            registers = 6,
            body = """
                sget v0, $LAST_HOOK_FIELD

                shl-int/lit8 v1, p0, 0x2
                shl-int/lit8 v2, p1, 0x1
                or-int/2addr v1, v2
                or-int/2addr v1, p2
                add-int/lit8 v1, v1, 0x1

                if-eq v0, v1, :hook_same

                sput v1, $LAST_HOOK_FIELD

                const-string v0, "HOOK"
                const/4 v2, 0x0

                invoke-static {v0, p0, p1, p2, v2}, $DIAG_LOG

                :hook_same
                return-void
            """
        )

        // STACK: observe the exact ChildStack and its active route.
        // Public because tabs/x invokes this method.

        addStaticMethod(
            name = "serajrNavStack",
            parameters = listOf(
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
                "I", "I", "I"
            ),
            returnType = "V",
            registers = 11,
            public = true,
            body = """
                invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
                move-result v0

                sget v1, $LAST_STACK_VALID_FIELD
                if-eqz v1, :stack_changed

                sget v1, $LAST_STACK_FIELD
                if-eq v0, v1, :stack_same

                :stack_changed
                sput v0, $LAST_STACK_FIELD

                const/4 v1, 0x1
                sput v1, $LAST_STACK_VALID_FIELD

                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

                const-string v2, "STACK id="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v2, " size="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v2, " empty="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v2, " tab="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v2, " route="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                if-eqz p1, :stack_noclass

                invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v2
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

                goto :stack_log

                :stack_noclass
                const-string v2, "null"
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                :stack_log
                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1

                const-string v2, "$DIAG_TAG"
                invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                :stack_same
                return-void
            """
        )

        // TAB_PUSH: observe navigation requests.
        // Public because tabs/g invokes this method.

        addStaticMethod(
            name = "serajrNavPush",
            parameters = listOf("I", "Ljava/lang/Object;"),
            returnType = "V",
            registers = 7,
            public = true,
            body = """
                new-instance v0, Ljava/lang/StringBuilder;
                invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

                const-string v1, "TAB_PUSH tab="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                const-string v1, " route="
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                if-eqz p1, :push_noclass

                invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v1
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

                goto :push_log

                :push_noclass
                const-string v1, "null"
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                :push_log
                invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1

                const-string v2, "$DIAG_TAG"
                invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                return-void
            """
        )

        // FEED_PUB: observe published values without reading Compose state.
        // Encoded values: 0 = uninitialized, 1 = false, 2 = true.
        // First publication reports a=-1.

        addStaticMethod(
            name = "serajrNavFeed",
            parameters = listOf("Z"),
            returnType = "V",
            registers = 6,
            body = """
                sget v0, $LAST_FEED_FIELD
                add-int/lit8 v1, p0, 0x1

                if-eq v0, v1, :feed_same

                sput v1, $LAST_FEED_FIELD

                add-int/lit8 v0, v0, -0x1

                const-string v2, "FEED_PUB"
                const/4 v3, 0x0

                invoke-static {v2, v0, p0, v3, v3}, $DIAG_LOG

                :feed_same
                return-void
            """
        )

        // Both snapshot bridges preserve the validated lazy initialization.

        fun addStateBridge(
            fieldName: String,
            getterName: String,
            writerName: String,
            diagnostic: Boolean = false
        ) {
            val field =
                "${MAIN_ACTIVITY}->${fieldName}:${MUTABLE_STATE}"

            val getter =
                "${MAIN_ACTIVITY}->${getterName}()${MUTABLE_STATE}"

            addStaticField(fieldName, MUTABLE_STATE)

            addStaticMethod(
                name = getterName,
                parameters = emptyList(),
                returnType = MUTABLE_STATE,
                registers = 2,
                body = """
                    sget-object v0, $field
                    if-nez v0, :state_ready

                    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-static {v1}, $MUTABLE_STATE_FACTORY
                    move-result-object v0
                    sput-object v0, $field

                    :state_ready
                    return-object v0
                """
            )

            val diagnosticCall = if (diagnostic) {
                "invoke-static {p0}, $DIAG_FEED"
            } else {
                ""
            }

            addStaticMethod(
                name = writerName,
                parameters = listOf("Z"),
                returnType = "V",
                registers = 3,
                public = true,
                body = """
                    $diagnosticCall

                    invoke-static {}, $getter
                    move-result-object v0

                    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v1

                    invoke-virtual {v0, v1}, $MUTABLE_STATE_SET

                    return-void
                """
            )
        }

        addStateBridge(
            "serajrBottomBarVisibleState",
            GET_STATE_NAME,
            WRITE_STATE_NAME
        )

        addStateBridge(
            "serajrFeedActiveState",
            GET_FEED_NAME,
            WRITE_FEED_NAME,
            diagnostic = true
        )

        // T5: one atomic root context state, initialized to OTHER (0).
        addStaticField("serajrRootContextState", MUTABLE_STATE)
        addStaticField("serajrNavLastRootClass", "Ljava/lang/Class;")

        addStaticMethod(
            name = "serajrGetRootContextState",
            parameters = emptyList(),
            returnType = MUTABLE_STATE,
            registers = 2,
            body = """
                sget-object v0, $ROOT_STATE_FIELD
                if-nez v0, :root_state_ready
                const/4 v1, 0x0
                invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v1
                invoke-static {v1}, $MUTABLE_STATE_FACTORY
                move-result-object v0
                sput-object v0, $ROOT_STATE_FIELD
                :root_state_ready
                return-object v0
            """
        )

        // v0 = active configuration, v1 = root context (0/1/2).
        // Publish on every observed snapshot; deduplicate logging only.
        addStaticMethod(
            name = "serajrOnRootContext",
            parameters = listOf(CHILD_STACK),
            returnType = "V",
            registers = 7,
            public = true,
            body = """
                iget-object v0, p0, $ROOT_CHILD_FIELD
                iget-object v0, v0, $ROOT_CONFIG_FIELD
                const/4 v1, 0x0
                instance-of v2, v0, $ROOT_LANDING
                if-eqz v2, :check_tabs
                const/4 v1, 0x1
                goto :publish_root
                :check_tabs
                instance-of v2, v0, $ROOT_TABS
                if-eqz v2, :publish_root
                const/4 v1, 0x2
                :publish_root
                invoke-static {}, $GET_ROOT_CONTEXT
                move-result-object v2
                invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v3
                invoke-virtual {v2, v3}, $MUTABLE_STATE_SET

                invoke-static {}, ${MAIN_ACTIVITY}->serajrNavVersion()V
                if-eqz v0, :root_done
                invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v2
                sget-object v3, $LAST_ROOT_CLASS
                if-eq v2, v3, :root_done
                sput-object v2, $LAST_ROOT_CLASS
                invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
                move-result-object v3
                new-instance v4, Ljava/lang/StringBuilder;
                invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
                const-string v5, "ROOT_CTX route="
                invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v5, " context="
                invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v4
                const-string v5, "$DIAG_TAG"
                invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                :root_done
                return-void
            """
        )

        // T5 Global Overlay Fix 1: compose in the shared Scaffold MainContent Box.
        // Preserve the original MainContent invocation and all native HazeSource logic.
        // This is the selector 0x18 branch of ai.x.grok.ui.droplet.j1.
        val globalContentOwner = "Lai/x/grok/ui/droplet/j1;"
        val globalContent = mutableClassDefBy(globalContentOwner).methods.single {
            it.name == "invoke" && it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.map { p -> p.toString() } ==
                listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }
        val globalImpl = globalContent.implementation
            ?: error("T5: missing shared MainContent wrapper")
        val globalIns = globalImpl.instructions.toList()
        val originalContentCall =
            "Landroidx/compose/runtime/internal/g;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
        val globalAnchors = globalIns.indices.filter { index ->
            if (globalContent.refAt(index) != originalContentCall ||
                globalIns[index].opcode != Opcode.INVOKE_VIRTUAL) return@filter false
            val call = globalIns[index] as? FiveRegisterInstruction ?: return@filter false
            if (call.registerCount != 5 || call.registerC != 0 ||
                call.registerD != 2 || call.registerE != 3 ||
                call.registerF != 1 || call.registerG != 4) return@filter false
            val from = maxOf(0, index - 22)
            val preceding = (from until index).mapNotNull { globalContent.refAt(it) }
            preceding.any { it.startsWith("Lcom/x/compose/core/o0;->d(") } &&
                preceding.any { it.startsWith("Landroidx/compose/foundation/layout/e;->C(") } &&
                index + 1 < globalIns.size &&
                globalIns[index + 1].opcode in
                setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
        }
        require(globalAnchors.size == 1) {
            "T5: expected one selector-0x18 shared Scaffold MainContent invocation; found ${globalAnchors.size}"
        }
        // The verified native branch keeps v15 = HazeState and v1 = Composer.
        // Both are live here, and no invoke result is consumed by the following goto.
        require(globalImpl.registerCount >= 16) {
            "T5: unexpected shared MainContent register layout"
        }
        val overlayName = "serajrComposeFeedNavOverlay"
        require(mutableClass.methods.none { it.name == overlayName })
        addStaticMethod(
            name = overlayName,
            parameters = listOf("Ldev/chrisbanes/haze/a1;", "Landroidx/compose/runtime/Composer;"),
            returnType = "V", registers = 15, public = true,
            body = """
                # No Feed, Bottom Bar or Root Context visibility reads.

                # Preserve the validated geometry before applying Haze.
                sget-object v0, $MODIFIER_SINGLETON
                sget-object v1, $BOTTOM_CENTER
                sget-object v4, $BOX_SCOPE_INSTANCE
                invoke-virtual {v4, v0, v1}, $BOX_ALIGN
                move-result-object v0
                const/high16 v1, 0x3f800000
                invoke-static {v0, v1}, $FILL_WIDTH
                move-result-object v0
                invoke-static {p1}, $NAV_INSETS_FACTORY
                move-result-object v4
                iget-object v4, v4, $NAV_INSETS_FIELD
                invoke-static {v0, v4}, $INSETS_PADDING
                move-result-object v0

                # Stock theme background.
                invoke-static {p1}, Lcom/x/compose/core/m0;->a(Landroidx/compose/runtime/Composer;)J
                move-result-wide v2
                
                # Resolve the tint independently; use the cached runtime tint alpha.
                move-wide v7, v2
                invoke-static {v7, v8}, $NAV_EXTENSION->resolveTintColor(J)J
                move-result-wide v7

                invoke-static {}, $NAV_EXTENSION->getNavigationTintAlpha()F
                move-result v5
                invoke-static {v5, v7, v8}, Landroidx/compose/ui/graphics/z;->b(FJ)J
                move-result-wide v7

                # Resolve background independently from the tint.
                invoke-static {v2, v3}, $NAV_EXTENSION->resolveBackgroundColor(J)J
                move-result-wide v2

                new-instance v4, Ldev/chrisbanes/haze/blur/g0;
                invoke-direct {v4, v7, v8}, Ldev/chrisbanes/haze/blur/g0;-><init>(J)V

                invoke-static {p1}, Lcom/x/compose/core/m0;->b(Landroidx/compose/runtime/Composer;)Z
                move-result v5
                move v6, v5
                move-object v1, p0
                invoke-static {}, $NAV_EXTENSION->getNavigationBlurRadius()F
                move-result v5
                invoke-static {}, $NAV_EXTENSION->getNavigationNoiseFactor()F
                move-result v7
                const/4 v8, 0x0
                ${if (USE_PROGRESSIVE_HAZE) {
                    """
                        invoke-static {}, $GET_PROGRESSIVE
                        move-result-object v9
                    """.trimIndent()
                } else {
                    "const/4 v9, 0x0"
                }}
                move-object v10, p1
                const/4 v11, 0x0
                ${if (USE_PROGRESSIVE_HAZE) "const/16 v12, 0x40" else "const/16 v12, 0xc0"}
                invoke-static/range {v0 .. v12}, $HAZE_EFFECT_METHOD
                move-result-object v0

                const/4 v1, 0x0
                invoke-static {v0, p1, v1}, Landroidx/compose/foundation/layout/s;->a(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V
                return-void
            """
        )
        globalContent.addInstructions(globalAnchors.single() + 1,
            "invoke-static {v15, v1}, ${MAIN_ACTIVITY}->${overlayName}(Ldev/chrisbanes/haze/a1;Landroidx/compose/runtime/Composer;)V")

        // Validated Bottom Bar visibility publication.

        mutableBottomBar.addInstructions(
            visibilityIndex,
            "invoke-static {v10}, $WRITE_STATE_DESCRIPTOR"
        )

        // Diagnostic A: active per-tab ChildStack.
        // REA verified v6 through v10 are available at this anchor.

        mutableTab.addInstructions(
            tabAnchor + 1,
            """
                iget-object v6, v1, $BACKSTACK_FIELD

                invoke-interface {v6}, Ljava/util/List;->size()I
                move-result v8

                invoke-interface {v6}, Ljava/util/List;->isEmpty()Z
                move-result v9

                iget-object v7, v1, ${CHILD_STACK}->a:Lcom/arkivanov/decompose/b;
                iget-object v7, v7, Lcom/arkivanov/decompose/b;->b:Ljava/lang/Object;

                check-cast v7, Lcom/x/compose/core/s2;
                iget-object v7, v7, Lcom/x/compose/core/s2;->a:Ljava/lang/Object;

                iget-object v10, v0, ${TAB_CONTENT}->c:Lcom/x/navigation/wd;
                invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I
                move-result v10

                invoke-static {v1, v7, v8, v9, v10}, $DIAG_STACK

                invoke-static {v9}, $WRITE_FEED_DESCRIPTOR
            """.trimIndent()
        )

        // Diagnostic B: native tab navigation requests.
        // REA verified v1 is available at method entry.

        mutableTabPush.addInstructions(
            0,
            """
                iget-object v1, p0, ${TAB_NAVIGATOR}->h:Lcom/x/navigation/wd;

                invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I
                move-result v1

                invoke-static {v1, p1}, $DIAG_PUSH
            """.trimIndent()
        )

        // T10-B1: root content and root Spacer remain stock.

        // ============================================================
        // D3-K1A.11-T4 — Route and Bar Host Diagnostics
        // ============================================================

        val routeOwner = "Lcom/x/android/main/helpers/j8;"
        val barHostOwner = "Lcom/x/main/b0;"

        val routeFactoryDescriptor =
            "${routeOwner}->a(" +
                "Lcom/x/navigation/fp;" +
                "Lcom/arkivanov/decompose/e;" +
                "Lcom/x/navigation/ip;" +
                ")Lcom/x/compose/core/s2;"

        val barHostDescriptor =
            "${barHostOwner}->h(" +
                "ZZZ" +
                "Lcom/x/main/api/landing/n;" +
                "Lcom/x/navigation/wd;" +
                "Lkotlin/jvm/functions/Function1;" +
                "Landroidx/compose/runtime/internal/g;" +
                "Landroidx/compose/runtime/Composer;" +
                "I)V"

        val diagRouteDescriptor =
            "${MAIN_ACTIVITY}->serajrRoute(" +
                "Lcom/x/navigation/fp;" +
                "Lcom/arkivanov/decompose/e;" +
                "Lcom/x/navigation/ip;" +
                ")V"

        val diagBarHostDescriptor =
            "${MAIN_ACTIVITY}->serajrBarHost(" +
                "Lcom/x/main/api/landing/n;" +
                "Lcom/x/navigation/wd;" +
                ")V"

        val diagVersionDescriptor =
            "${MAIN_ACTIVITY}->serajrNavVersion()V"

        val lastBarField =
            "${MAIN_ACTIVITY}->serajrNavLastBar:I"

        val lastBarValidField =
            "${MAIN_ACTIVITY}->serajrNavLastBarValid:I"

        val versionLoggedField =
            "${MAIN_ACTIVITY}->serajrNavVersionLogged:Z"

        // Resolve both native diagnostic targets.

        val routeCandidates =
            mutableClassDefBy(routeOwner).methods.filter {
                it.toString() == routeFactoryDescriptor
            }

        require(routeCandidates.size == 1) {
            "FixNavigationBarHaze T4: expected one j8.a route factory."
        }

        val mutableRoute = routeCandidates.single()

        val barHostCandidates =
            mutableClassDefBy(barHostOwner).methods.filter {
                it.toString() == barHostDescriptor
            }

        require(barHostCandidates.size == 1) {
            "FixNavigationBarHaze T4: expected one b0.h bar host."
        }

        val mutableBarHost = barHostCandidates.single()

        // Verify register layouts and method access.

        require(
            mutableRoute.implementation?.registerCount == 45 &&
                (mutableRoute.accessFlags and AccessFlags.STATIC.value) == 0
        ) {
            "FixNavigationBarHaze T4: unexpected j8.a register layout."
        }

        require(
            mutableBarHost.implementation?.registerCount == 33 &&
                (mutableBarHost.accessFlags and AccessFlags.STATIC.value) != 0
        ) {
            "FixNavigationBarHaze T4: unexpected b0.h register layout."
        }

        val t4MethodNames = setOf(
            "serajrRoute",
            "serajrBarHost",
            "serajrNavVersion"
        )

        val t4FieldNames = setOf(
            "serajrNavLastBar",
            "serajrNavLastBarValid",
            "serajrNavVersionLogged"
        )

        require(mutableClass.methods.none {
            it.name in t4MethodNames
        }) {
            "FixNavigationBarHaze T4: diagnostic method already exists."
        }

        require(mutableClass.fields.none {
            it.name in t4FieldNames
        }) {
            "FixNavigationBarHaze T4: diagnostic field already exists."
        }

        // ------------------------------------------------------------
        // T4 diagnostic fields
        // ------------------------------------------------------------

        addStaticField("serajrNavLastBar", "I")
        addStaticField("serajrNavLastBarValid", "I")
        addStaticField("serajrNavVersionLogged", "Z")

        // ------------------------------------------------------------
        // VERSION
        //
        // Log the diagnostic revision once per process.
        // No Compose state access.
        // ------------------------------------------------------------

        addStaticMethod(
            name = "serajrNavVersion",
            parameters = emptyList(),
            returnType = "V",
            registers = 2,
            body = """
                sget-boolean v0, $versionLoggedField

                if-nez v0, :version_done

                const/4 v0, 0x1
                sput-boolean v0, $versionLoggedField

                const-string v0, "$DIAG_TAG"
                const-string v1, "D3-K1A.11-T10-B1-T4E-T3 ACTIVE"

                invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                :version_done
                return-void
            """
        )

        // ------------------------------------------------------------
        // BAR
        //
        // Identify the actual navigation shell.
        //
        // p0 = landing host
        // p1 = active tab
        //
        // Deduplicate by host identity and tab ordinal.
        // ------------------------------------------------------------

        addStaticMethod(
            name = "serajrBarHost",
            parameters = listOf(
                "Lcom/x/main/api/landing/n;",
                "Lcom/x/navigation/wd;"
            ),
            returnType = "V",
            registers = 8,
            public = true,
            body = """
                invoke-static {}, $diagVersionDescriptor

                if-eqz p0, :bar_done
                if-eqz p1, :bar_done

                invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
                move-result v0

                invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I
                move-result v1

                add-int/lit8 v1, v1, 0x1
                xor-int/2addr v0, v1

                sget v1, $lastBarValidField
                if-eqz v1, :bar_changed

                sget v1, $lastBarField
                if-eq v1, v0, :bar_done

                :bar_changed

                const/4 v1, 0x1
                sput v1, $lastBarValidField

                sput v0, $lastBarField

                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

                const-string v2, "BAR host="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v0

                invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
                move-result-object v0

                invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                const-string v2, " tab="
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I
                move-result v0

                invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1

                const-string v2, "$DIAG_TAG"

                invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                :bar_done
                return-void
            """
        )

        // ------------------------------------------------------------
        // ROUTE
        //
        // Observe every native child-component creation.
        //
        // p0 = route configuration
        // p1 = component context (unused)
        // p2 = navigation host
        //
        // Intentionally NOT deduplicated.
        // No route contents or identifiers are logged.
        // ------------------------------------------------------------

        addStaticMethod(
            name = "serajrRoute",
            parameters = listOf(
                "Lcom/x/navigation/fp;",
                "Lcom/arkivanov/decompose/e;",
                "Lcom/x/navigation/ip;"
            ),
            returnType = "V",
            registers = 9,
            public = true,
            body = """
                invoke-static {}, $diagVersionDescriptor

                if-eqz p0, :route_done
                if-eqz p2, :route_done

                new-instance v3, Ljava/lang/StringBuilder;
                invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

                const-string v1, "ROUTE route="
                invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v0

                invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
                move-result-object v0

                invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                const-string v1, " host="
                invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                move-result-object v0

                invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
                move-result-object v0

                invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

                invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v3

                const-string v1, "$DIAG_TAG"

                invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                :route_done
                return-void
            """
        )

        // ------------------------------------------------------------
        // Install the ROUTE probe at j8.a entry.
        //
        // Instance method:
        // p1 = v42
        // p2 = v43
        // p3 = v44
        //
        // Range invocation is required.
        // ------------------------------------------------------------

        mutableRoute.addInstructions(
            0,
            "invoke-static/range {p1 .. p3}, $diagRouteDescriptor"
        )

        // ------------------------------------------------------------
        // Install the BAR probe at b0.h entry.
        //
        // Static method:
        // p3 = v27
        // p4 = v28
        //
        // Range invocation is required.
        // ------------------------------------------------------------

        mutableBarHost.addInstructions(
            0,
            "invoke-static/range {p3 .. p4}, $diagBarHostDescriptor"
        )

        // ------------------------------------------------------------
        // Install the version marker at the existing Haze hook.
        //
        // No registers are modified.
        // This also identifies T4 if ROUTE/BAR are never reached.
        // ------------------------------------------------------------

        val t10OverlayCandidates = mutableClass.methods.filter {
            it.toString() == "${MAIN_ACTIVITY}->${overlayName}(Ldev/chrisbanes/haze/a1;Landroidx/compose/runtime/Composer;)V"
        }

        require(t10OverlayCandidates.size == 1) {
            "FixNavigationBarHaze T5: expected one injected global overlay."
        }

        t10OverlayCandidates.single().addInstructions(
            0,
            "invoke-static {}, $diagVersionDescriptor"
        )

        // ============================================================
        // END D3-K1A.11-T4 diagnostics
        // ============================================================


        // T5: publish the active root snapshot without clobbering v9.
        rootObserver.addInstructions(64, "invoke-static {v9}, $PUBLISH_ROOT_CONTEXT")

        // T4D: initialize runtime settings before the main Compose content.
        if (ENABLE_RUNTIME_BLUR_CONTROL) {
            val original = requireNotNull(originalOnCreate) { "T4D: MainActivity.onCreate not found" }
            val onCreate = mutableClass.methods.single { it.toString() == original.toString() }
            val impl = requireNotNull(onCreate.implementation)
            val instructions = impl.instructions.toList()
            val receiver = impl.registerCount - 2
            val superCalls = instructions.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.INVOKE_SUPER_RANGE &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == ON_CREATE_SUPER &&
                    (instruction as? RegisterRangeInstruction)?.let {
                        it.startRegister == receiver && it.registerCount == 2
                    } == true
                ) index else null
            }
            require(superCalls.size == 1) { "T4D: expected one super.onCreate range call" }
            // Use the original receiver directly, including high registers.
            onCreate.addInstructions(superCalls.single() + 1,
                "invoke-static/range {p0 .. p0}, $NAV_EXTENSION->initialize(Landroid/content/Context;)V")
        }

        // T4D: preserve the native decision unless the runtime override is enabled.
        blurRecorder?.let { (method, input) ->
            method.addInstructions(0, """
                invoke-static/range {v$input .. v$input}, $NAV_EXTENSION->resolveBlurEnabled(Z)Z
                move-result v$input
            """.trimIndent())
        }

        // ============================================================
        // END D3-K1A.11-T5
        // ============================================================
        
    }
}
