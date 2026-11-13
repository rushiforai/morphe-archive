package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val MAIN_ACTIVITY = "Lcom/x/android/main/MainActivity;"
private const val SOURCE_WRAPPER = "Lcom/x/compose/theme/j;"
private const val HAZE_STATE_HELPER = "Lcom/x/ui/common/post/b;"
private const val HAZE_EFFECT_OWNER = "Lcom/x/compose/core/o0;"
private const val HAZE_EFFECT_METHOD = "${HAZE_EFFECT_OWNER}->c(Landroidx/compose/ui/Modifier;Ldev/chrisbanes/haze/a1;JLjava/util/List;FZFLdev/chrisbanes/haze/k0;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Landroidx/compose/ui/Modifier;"

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

@Suppress("unused")
val fixNavigationBarHazePatch = bytecodePatch(
    name = "Fix Navigation Bar Haze",
    description = "D3-K1A.11-T2: temporary navigation context diagnostics for native solid Navigation Bar Haze.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var originalRoot: Method? = null
        var originalBottomBar: Method? = null
        var originalTabContent: Method? = null
        var originalTabPush: Method? = null
        var tabAnchor = -1

        val requiredMethods = setOf(
            HAZE_EFFECT_METHOD,
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
        )

        val requiredFields = setOf(
            BOTTOM_START,
            BOTTOM_CENTER,
            BOX_SCOPE_INSTANCE,
            MODIFIER_SINGLETON,
            NAV_INSETS_FIELD,
            TAB_STACK_FIELD,
            BACKSTACK_FIELD,
            "${CHILD_STACK}->a:Lcom/arkivanov/decompose/b;",
            "Lcom/arkivanov/decompose/b;->b:Ljava/lang/Object;",
            "Lcom/x/compose/core/s2;->a:Ljava/lang/Object;",
            "${TAB_CONTENT}->c:Lcom/x/navigation/wd;",
            "${TAB_NAVIGATOR}->h:Lcom/x/navigation/wd;"
        )

        val foundMethods = mutableSetOf<String>()
        val foundFields = mutableSetOf<String>()
        var wrapperVerified = false

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
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

            when (classDef.type.toString()) {
                MAIN_ACTIVITY -> {
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
                foundMethods.containsAll(requiredMethods) &&
                foundFields.containsAll(requiredFields)
        ) {
            "FixNavigationBarHaze: native helpers do not match. " +
                "Missing methods: ${requiredMethods - foundMethods}; " +
                "fields: ${requiredFields - foundFields}"
        }

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
            "serajrNavFeed"
        )

        val injectedFields = setOf(
            "serajrBottomBarVisibleState",
            "serajrFeedActiveState",
            "serajrNavLastStack",
            "serajrNavLastStackValid",
            "serajrNavLastHook",
            "serajrNavLastFeed"
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

        // Native Haze hook.
        // Rendering parameters remain identical to D3-K1A.11-T1.

        addStaticMethod(
            name = HOOK_NAME,
            parameters = listOf(
                "Landroidx/compose/ui/Modifier;",
                "Ldev/chrisbanes/haze/a1;",
                "Landroidx/compose/runtime/Composer;"
            ),
            returnType = "Landroidx/compose/ui/Modifier;",
            registers = 16,
            body = """
                move-object/from16 v0, p0
                move-object/from16 v1, p1

                const-wide/16 v2, 0x0

                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v4

                const/high16 v5, 0x42000000

                invoke-static {}, $GET_STATE_DESCRIPTOR
                move-result-object v6

                invoke-virtual {v6}, $MUTABLE_STATE_GET
                move-result-object v6

                check-cast v6, Ljava/lang/Boolean;
                invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z
                move-result v6

                move v10, v6

                xor-int/lit8 v6, v6, 0x1

                invoke-static {}, $GET_FEED_DESCRIPTOR
                move-result-object v9

                invoke-virtual {v9}, $MUTABLE_STATE_GET
                move-result-object v9

                check-cast v9, Ljava/lang/Boolean;
                invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z
                move-result v9

                and-int/2addr v6, v9

                invoke-static {v10, v9, v6}, $DIAG_HOOK

                const v7, 0x3d4ccccd
                const/4 v8, 0x0
                const/4 v9, 0x0

                move-object/from16 v10, p2

                const/4 v11, 0x0
                const/4 v12, 0x0

                invoke-static/range {v0 .. v12}, $HAZE_EFFECT_METHOD
                move-result-object v0

                return-object v0
            """
        )

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

        // Validated root navigation-inset Spacer.

        mutableRoot.addInstructions(
            spacerIndex + 1,
            """
                sget-object v0, $MODIFIER_SINGLETON
                sget-object v1, $BOTTOM_START
                sget-object v2, $BOX_SCOPE_INSTANCE

                invoke-virtual {v2, v0, v1}, $BOX_ALIGN
                move-result-object v0

                const/high16 v1, 0x3f800000

                invoke-static {v0, v1}, $FILL_WIDTH
                move-result-object v0

                invoke-static {v4}, $NAV_INSETS_FACTORY
                move-result-object v3

                iget-object v3, v3, $NAV_INSETS_FIELD

                invoke-static {v0, v3}, $INSETS_PADDING
                move-result-object v0

                invoke-static {v0, v8, v4}, $HOOK_DESCRIPTOR
                move-result-object p3

                invoke-static {v4, p3}, $SPACER_CALL
            """.trimIndent()
        )

        // Validated root HazeState and source wrapper.

        mutableRoot.removeInstruction(contentIndex)

        mutableRoot.addInstructions(
            contentIndex,
            """
                invoke-static {v4}, $STATE_FACTORY
                move-result-object v8

                new-instance v5, $SOURCE_WRAPPER

                const/16 v6, 0x19

                invoke-direct {v5, v8, p2, v6}, $WRAPPER_CTOR

                const v6, 0x6e3a1b2c

                invoke-static {v6, v5, v4}, $LAMBDA_FACTORY
                move-result-object v5

                invoke-virtual {v5, v4, p3}, $CONTENT_INVOKE
            """.trimIndent()
        )
    }
}
