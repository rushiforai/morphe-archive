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
// D3-K1A.11-T1: active tab child stack.
private const val TAB_CONTENT = "Lcom/x/main/tabs/x;"
private const val CHILD_STACK = "Lcom/arkivanov/decompose/router/stack/a;"
private const val TAB_STACK_FIELD = "Lcom/x/main/tabs/g;->p:Lcom/arkivanov/decompose/value/operator/a;"
private const val BACKSTACK_FIELD = "${CHILD_STACK}->b:Ljava/util/List;"
private const val GET_FEED_NAME = "serajrGetFeedActiveState"
private const val GET_FEED_DESCRIPTOR = "${MAIN_ACTIVITY}->${GET_FEED_NAME}()${MUTABLE_STATE}"
private const val WRITE_FEED_NAME = "serajrOnFeedActive"
private const val WRITE_FEED_DESCRIPTOR = "${MAIN_ACTIVITY}->${WRITE_FEED_NAME}(Z)V"

private fun Method.refAt(index: Int): String? =
    (implementation?.instructions?.elementAtOrNull(index) as? ReferenceInstruction)?.reference?.toString()

@Suppress("unused")
val fixNavigationBarHazePatch = bytecodePatch(
    name = "Fix Navigation Bar Haze",
    description = "D3-K1A.11-T1: restores native solid Navigation Bar Haze when the active tab is at its root and the Bottom Bar is hidden.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)
    execute {
        var originalRoot: Method? = null
        var originalBottomBar: Method? = null
        var originalTabContent: Method? = null
        var tabAnchor = -1
        val requiredMethods = setOf(HAZE_EFFECT_METHOD, BOX_ALIGN, FILL_WIDTH, NAV_INSETS_FACTORY,
            INSETS_PADDING, SPACER_CALL, STATE_FACTORY, SOURCE_MODIFIER, LAMBDA_FACTORY,
            WRAPPER_CTOR, MUTABLE_STATE_FACTORY, MUTABLE_STATE_GET, MUTABLE_STATE_SET)
        val requiredFields = setOf(BOTTOM_START, BOTTOM_CENTER, BOX_SCOPE_INSTANCE,
            MODIFIER_SINGLETON, NAV_INSETS_FIELD, TAB_STACK_FIELD, BACKSTACK_FIELD)
        val foundMethods = mutableSetOf<String>()
        val foundFields = mutableSetOf<String>()
        var wrapperVerified = false
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val descriptor = method.toString()
                if (descriptor in requiredMethods) foundMethods.add(descriptor)
            }
            classDef.fields.forEach { field ->
                val descriptor = field.toString()
                if (descriptor in requiredFields) foundFields.add(descriptor)
            }
            when (classDef.type.toString()) {
                MAIN_ACTIVITY -> originalRoot = classDef.methods.firstOrNull { method ->
                    method.name == "P" && method.returnType == "V" &&
                        method.parameterTypes.map { it.toString() } == listOf("Z", "Landroidx/compose/runtime/internal/g;", "Landroidx/compose/runtime/Composer;", "I")
                }
                SOURCE_WRAPPER -> wrapperVerified = classDef.methods.any { method ->
                    method.name == "invoke" && method.implementation?.instructions?.any {
                        (it as? ReferenceInstruction)?.reference?.toString() == SOURCE_MODIFIER
                    } == true
                }
                BOTTOM_BAR_OWNER -> originalBottomBar = classDef.methods.firstOrNull { method ->
                    method.name == "a" && method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf(
                        "Landroidx/compose/runtime/internal/g;", "Ldev/chrisbanes/haze/a1;", "Lkotlin/jvm/functions/Function1;", "Landroidx/compose/ui/Modifier;", "Landroidx/compose/runtime/internal/g;", "Z", "Z", "Z", "Landroidx/compose/runtime/internal/g;", "Landroidx/compose/runtime/Composer;", "I")
                }
                TAB_CONTENT -> {
                    val candidates = classDef.methods.filter { it.name == "invoke" }.flatMap { method ->
                        val ins = method.implementation?.instructions?.toList().orEmpty()
                        ins.indices.filter { index ->
                            if (ins[index].opcode != Opcode.CHECK_CAST || method.refAt(index) != CHILD_STACK ||
                                (ins[index] as? OneRegisterInstruction)?.registerA != 1) return@filter false
                            val start = maxOf(0, index - 12)
                            val refs = (start until index).mapNotNull { method.refAt(it) }
                            val field = refs.indexOf(TAB_STACK_FIELD)
                            val adapter = refs.indexOfFirst { it.contains("thrift/scheme/b;->X(") }
                            val read = refs.indexOfLast { it.endsWith("i3;->getValue()Ljava/lang/Object;") }
                            field >= 0 && adapter > field && read > adapter
                        }.map { method to it }
                    }
                    require(candidates.size == 1) { "FixNavigationBarHaze: expected one active tab ChildStack anchor." }
                    originalTabContent = candidates.single().first
                    tabAnchor = candidates.single().second
                }
            }
        }
        require(wrapperVerified && foundMethods.containsAll(requiredMethods) && foundFields.containsAll(requiredFields)) {
            "FixNavigationBarHaze: native helpers do not match. Missing methods: ${requiredMethods - foundMethods}; fields: ${requiredFields - foundFields}"
        }
        val root = originalRoot ?: error("FixNavigationBarHaze: MainActivity.P not found.")
        val bottomBar = originalBottomBar ?: error("FixNavigationBarHaze: t2.a not found.")
        val tab = originalTabContent ?: error("FixNavigationBarHaze: tabs/x.invoke not found.")
        val mutableClass = mutableClassDefBy(root.definingClass)
        val mutableRoot = mutableClass.methods.first { it.toString() == root.toString() }
        val mutableBottomBar = mutableClassDefBy(bottomBar.definingClass).methods.first { it.toString() == bottomBar.toString() }
        val mutableTab = mutableClassDefBy(tab.definingClass).methods.first { it.toString() == tab.toString() }
        val implementation = mutableRoot.implementation ?: error("Missing root implementation")
        require(implementation.registerCount == 15)
        val instructions = implementation.instructions.toList()
        val contentCandidates = instructions.indices.filter { index ->
            if (root.refAt(index) != CONTENT_INVOKE) return@filter false
            val call = instructions[index] as? FiveRegisterInstruction ?: return@filter false
            call.registerCount == 3 && call.registerC == 12 && call.registerD == 4 && call.registerE == 13 &&
                (index + 1 until minOf(index + 6, instructions.size)).any { root.refAt(it) == BOTTOM_CENTER }
        }
        require(contentCandidates.size == 1) { "FixNavigationBarHaze: expected one root content invocation." }
        val contentIndex = contentCandidates.single()
        val spacerCandidates = instructions.indices.filter { index ->
            if (root.refAt(index) != SPACER_CALL || index <= contentIndex) return@filter false
            val call = instructions[index] as? FiveRegisterInstruction ?: return@filter false
            call.registerCount == 2 && call.registerC == 4 && call.registerD == 13 &&
                (contentIndex + 1 until index).any { root.refAt(it)?.startsWith(POINTER_INPUT) == true } &&
                (contentIndex + 1 until index).any { root.refAt(it)?.contains(NAV_HANDLER) == true }
        }
        require(spacerCandidates.size == 1)
        val spacerIndex = spacerCandidates.single()
        require(spacerIndex - contentIndex < 55 && root.refAt(spacerIndex + 1) == "Landroidx/compose/runtime/o0;->u(Z)V")
        val barIns = mutableBottomBar.implementation!!.instructions.toList()
        val visibilityCandidates = barIns.indices.filter { index ->
            if (index == 0 || bottomBar.refAt(index)?.startsWith(ANIMATED_VISIBILITY_PREFIX) != true || barIns[index].opcode != Opcode.INVOKE_STATIC_RANGE) return@filter false
            val range = barIns[index] as? RegisterRangeInstruction ?: return@filter false
            val previous = barIns[index - 1]
            range.startRegister == 9 && range.registerCount == 10 && previous.opcode == Opcode.CONST_4 &&
                (previous as? OneRegisterInstruction)?.registerA == 5 && (previous as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
                (index + 1 until minOf(index + 32, barIns.size)).any { bottomBar.refAt(it)?.startsWith(BOTTOM_BAR_STATE_PROVIDER_PREFIX) == true }
        }
        require(visibilityCandidates.size == 1) { "FixNavigationBarHaze: expected one Bottom Bar visibility anchor." }
        val visibilityIndex = visibilityCandidates.single()
        require(mutableTab.implementation!!.registerCount > 6 && tabAnchor >= 0)
        require(mutableClass.methods.none { it.name in setOf(HOOK_NAME, GET_STATE_NAME, WRITE_STATE_NAME, GET_FEED_NAME, WRITE_FEED_NAME) })
        require(mutableClass.fields.none { it.name in setOf("serajrBottomBarVisibleState", "serajrFeedActiveState") })

        // Both snapshot bridges use the validated lazy initialization pattern.
        fun addStateBridge(fieldName: String, getterName: String, writerName: String) {
            val field = "${MAIN_ACTIVITY}->${fieldName}:${MUTABLE_STATE}"
            val getter = "${MAIN_ACTIVITY}->${getterName}()${MUTABLE_STATE}"
            mutableClass.fields.add(ImmutableField(MAIN_ACTIVITY, fieldName, MUTABLE_STATE,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, null).toMutable())
            val getMethod = ImmutableMethod(MAIN_ACTIVITY, getterName, emptyList(), MUTABLE_STATE,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(2)).toMutable()
            getMethod.addInstructions(0, """
                sget-object v0, $field
                if-nez v0, :state_ready
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v1}, $MUTABLE_STATE_FACTORY
                move-result-object v0
                sput-object v0, $field
                :state_ready
                return-object v0
            """.trimIndent())
            mutableClass.methods.add(getMethod)
            val writeMethod = ImmutableMethod(MAIN_ACTIVITY, writerName,
                listOf(ImmutableMethodParameter("Z", null, null)), "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(3)).toMutable()
            writeMethod.addInstructions(0, """
                invoke-static {}, $getter
                move-result-object v0
                invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                invoke-virtual {v0, v1}, $MUTABLE_STATE_SET
                return-void
            """.trimIndent())
            mutableClass.methods.add(writeMethod)
        }
        addStateBridge("serajrBottomBarVisibleState", GET_STATE_NAME, WRITE_STATE_NAME)
        addStateBridge("serajrFeedActiveState", GET_FEED_NAME, WRITE_FEED_NAME)

        val hook = ImmutableMethod(MAIN_ACTIVITY, HOOK_NAME, listOf(
            ImmutableMethodParameter("Landroidx/compose/ui/Modifier;", null, null),
            ImmutableMethodParameter("Ldev/chrisbanes/haze/a1;", null, null),
            ImmutableMethodParameter("Landroidx/compose/runtime/Composer;", null, null)),
            "Landroidx/compose/ui/Modifier;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null, null, MutableMethodImplementation(16)).toMutable()
        hook.addInstructions(0, """
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
            xor-int/lit8 v6, v6, 0x1
            invoke-static {}, $GET_FEED_DESCRIPTOR
            move-result-object v9
            invoke-virtual {v9}, $MUTABLE_STATE_GET
            move-result-object v9
            check-cast v9, Ljava/lang/Boolean;
            invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z
            move-result v9
            and-int/2addr v6, v9
            const v7, 0x3d4ccccd
            const/4 v8, 0x0
            const/4 v9, 0x0
            move-object/from16 v10, p2
            const/4 v11, 0x0
            const/4 v12, 0x0
            invoke-static/range {v0 .. v12}, $HAZE_EFFECT_METHOD
            move-result-object v0
            return-object v0
        """.trimIndent())
        mutableClass.methods.add(hook)
        mutableBottomBar.addInstructions(visibilityIndex, "invoke-static {v10}, $WRITE_STATE_DESCRIPTOR")
        // REA verified v6 is dead at this anchor in X 12.40.1.
        mutableTab.addInstructions(tabAnchor + 1, """
            iget-object v6, v1, $BACKSTACK_FIELD
            invoke-interface {v6}, Ljava/util/List;->isEmpty()Z
            move-result v6
            invoke-static {v6}, $WRITE_FEED_DESCRIPTOR
        """.trimIndent())
        mutableRoot.addInstructions(spacerIndex + 1, """
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
        """.trimIndent())
        mutableRoot.removeInstruction(contentIndex)
        mutableRoot.addInstructions(contentIndex, """
            invoke-static {v4}, $STATE_FACTORY
            move-result-object v8
            new-instance v5, $SOURCE_WRAPPER
            const/16 v6, 0x19
            invoke-direct {v5, v8, p2, v6}, $WRAPPER_CTOR
            const v6, 0x6e3a1b2c
            invoke-static {v6, v5, v4}, $LAMBDA_FACTORY
            move-result-object v5
            invoke-virtual {v5, v4, p3}, $CONTENT_INVOKE
        """.trimIndent())
    }
}
