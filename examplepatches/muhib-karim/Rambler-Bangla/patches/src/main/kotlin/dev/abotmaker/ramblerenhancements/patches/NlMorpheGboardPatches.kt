/*
 * Rambler Bangla - Gboard 18.5.4 ports of nl-morphe-patches features:
 *   1. AMOLED Dark Keyboard (pure #000000 Material 3 dark surfaces)
 *   2. Rambler Toolbar & Revert Extras (overflow menu, keep rewritten on revert, quick-paste)
 *   3. Hidden Flags Override (native Gboard override-store toggles)
 *
 * Adapted from johninnld/nl-morphe-patches (GPL-3.0). See ATTRIBUTION.md and THIRD-PARTY-NOTICES.md.
 */
package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val AMOLED_DARK_BACKGROUND = "0xff000000"
internal const val AMOLED_DARK_COLOR = -0x1000000
internal const val SETTINGS_CLASS_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerEnhancementsSettings;"
internal const val CLIPBOARD_REORDER_RUNTIME_TYPE =
    "Ldev/abotmaker/ramblerenhancements/RamblerClipboardReorderRuntime;"

private val AMOLED_SURFACE_TOKENS = listOf(
    "color_gm3_surface_dim",
    "color_gm3_surface_container",
    "color_gm3_surface_container_low",
    "color_gm3_surface_container_lowest",
)

@Suppress("unused")
val gboardAmoledDarkKeyboardPatch = bytecodePatch(
    name = "AMOLED Dark Keyboard",
    description = "Adds a live Settings toggle (off by default) to turn Gboard's Material You dark " +
        "keyboard surfaces pure AMOLED black (#000000) while preserving stock dark gray contrast " +
        "whenever turned off, and leaving the light theme, accent colors, and key faces unchanged. " +
        "Ported from nl-morphe-patches for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.AMOLED_DARK_KEYBOARD)
        val targets = resolveAmoledPaletteTargets(this)
        targets.constructor.applyAmoledDarkPalette(
            isLightField = targets.isLightField,
            surfaceFields = targets.surfaceFields,
        )
    }
}

@Suppress("unused")
val gboardClipboardReorderPatch = bytecodePatch(
    name = "Clipboard Drag-to-Reorder",
    description = "Enables tap-and-hold drag-to-reorder on Gboard 18.5.4's clipboard grid/list " +
        "(rearranges within Pinned or Recent and persists across reopens/reboots) while preserving " +
        "stationary long-press Pin/Delete popup, swipe-to-delete with Undo, and a live Settings toggle.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.CLIPBOARD_REORDER)
        val targets = resolveClipboardTouchCallbackTargets(this)
        applyClipboardDragReorder(targets)
    }
}

@Suppress("unused")
val ramblerToolbarExtrasPatch = bytecodePatch(
    name = "Rambler Toolbar & Revert Extras",
    description = "Enables Gboard 18.5.4's floating Rambler toolbar overflow menu, keeps rewritten " +
        "text when reverting from the full transcript, and activates one-tap direct clipboard " +
        "quick-paste. Ported from nl-morphe-patches for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.RAMBLER_EXTRAS)
    }
}

@Suppress("unused")
val gboardHiddenFlagsOverridePatch = bytecodePatch(
    name = "Hidden Flags Override",
    description = "Applies curated Gboard 18.5.4 hidden/beta flags (direct quick-paste chip, " +
        "Rambler toolbar overflow, preserve rewritten on revert, auto parallel retry, toolbar " +
        "entry, UI persistence, emoji skin-tone replacement, email provider completion) through " +
        "Gboard's own OVERRIDE flag store with live toggles inside Settings. Ported from " +
        "nl-morphe-patches for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.HIDDEN_FLAGS)
    }
}

@Suppress("unused")
val ramblerAtMentionSuggestionsPatch = bytecodePatch(
    name = "At-Mention & Email Strip Suggestions",
    description = "Native Gboard suggestion-strip personalized @handle and email domain suggestions: " +
        "renders directly inside Gboard's own themed suggestion bar (zero floating overlay; matches " +
        "AMOLED Dark, Material You, Frosted Glass & Custom Themes), learns typed/sent/dictated " +
        "@mentions (e.g. @grok, @claude) without fixed standalone defaults, supports native " +
        "drag-up-to-remove and Settings add/manage, and stays fail-closed in password/incognito " +
        "fields for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.AT_MENTION_SUGGESTIONS)
    }
}

internal data class AmoledPaletteTargets(
    val constructor: MutableMethod,
    val isLightField: String,
    val surfaceFields: List<String>,
)

internal fun resolveAmoledPaletteTargets(context: BytecodePatchContext): AmoledPaletteTargets {
    val matches = mutableListOf<Pair<ClassDef, Method>>()
    context.classDefForEach { cls ->
        for (method in cls.methods) {
            val insns = method.implementation?.instructions ?: continue
            val strings = mutableSetOf<String>()
            for (insn in insns) {
                val ref = (insn as? ReferenceInstruction)?.reference as? StringReference ?: continue
                if (ref.string in AMOLED_SURFACE_TOKENS) {
                    strings.add(ref.string)
                }
            }
            if (strings.size == AMOLED_SURFACE_TOKENS.size) {
                matches.add(cls to method)
            }
        }
    }
    val (paletteClass, builderMethod) = matches.singleOrNull()
        ?: throw PatchException(
            "FAIL-CLOSED: Expected exactly 1 Material 3 GM3 palette class owning " +
                "$AMOLED_SURFACE_TOKENS, found ${matches.size}",
        )

    // Extract the 4 int field references paired with the 4 surface tokens in builderMethod.
    val builderInsns = builderMethod.implementation!!.instructions.toList()
    val fieldsByToken = linkedMapOf<String, String>()
    for (idx in builderInsns.indices) {
        val str = ((builderInsns[idx] as? ReferenceInstruction)?.reference as? StringReference)?.string
            ?: continue
        if (str !in AMOLED_SURFACE_TOKENS || str in fieldsByToken) continue
        // Look ahead up to 6 instructions for `iget vX, p0, L<cls>;-><field>:I`.
        for (j in (idx + 1) until minOf(idx + 7, builderInsns.size)) {
            val next = builderInsns[j]
            if (next.opcode == Opcode.IGET) {
                val fref = (next as? ReferenceInstruction)?.reference as? FieldReference
                if (fref != null && fref.definingClass == paletteClass.type && fref.type == "I") {
                    fieldsByToken[str] = fref.toString()
                    break
                }
            }
        }
    }
    if (fieldsByToken.size != AMOLED_SURFACE_TOKENS.size) {
        throw PatchException(
            "FAIL-CLOSED: Expected all 4 GM3 surface fields in ${paletteClass.type}, " +
                "resolved ${fieldsByToken.keys}",
        )
    }

    // Locate the unique boolean `isLight` field on the palette class written in <init>(Context, Z)V.
    val mutableClass = context.mutableClassDefBy(paletteClass.type)
    val ctor = mutableClass.methods.singleOrNull { m ->
        m.name == "<init>" &&
            m.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;", "Z") &&
            m.returnType == "V"
    } ?: throw PatchException(
        "FAIL-CLOSED: Missing <init>(Context, Z)V on GM3 palette class ${paletteClass.type}",
    )

    val boolFields = paletteClass.instanceFields.filter { it.type == "Z" }
    val isLightFieldRef = boolFields.singleOrNull()?.let { f ->
        "${paletteClass.type}->${f.name}:Z"
    } ?: throw PatchException(
        "FAIL-CLOSED: Expected 1 boolean isLight field on ${paletteClass.type}, found ${boolFields.size}",
    )

    return AmoledPaletteTargets(
        constructor = ctor,
        isLightField = isLightFieldRef,
        surfaceFields = AMOLED_SURFACE_TOKENS.map { fieldsByToken.getValue(it) },
    )
}

internal fun MutableMethod.applyAmoledDarkPalette(
    isLightField: String,
    surfaceFields: List<String>,
) {
    require(surfaceFields.isNotEmpty()) { "No palette fields to override in $definingClass->$name" }
    val impl = implementation ?: throw PatchException("No instructions in $definingClass->$name")
    val instructions = impl.instructions.toList()
    val alreadyPatched = instructions.any { insn ->
        insn.opcode == Opcode.CONST_HIGH16 &&
            (insn as NarrowLiteralInstruction).narrowLiteral == AMOLED_DARK_COLOR
    }
    if (alreadyPatched) return

    surfaceFields.forEach { field ->
        val writes = instructions.count { insn ->
            insn.opcode == Opcode.IPUT &&
                (insn as? ReferenceInstruction)?.reference?.toString() == field
        }
        if (writes < 1) {
            throw PatchException("FAIL-CLOSED: Could not find stock $field write in $definingClass->$name")
        }
    }

    val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
    if (returns.size != 1) {
        throw PatchException("FAIL-CLOSED: Expected 1 RETURN_VOID in $definingClass->$name, found ${returns.size}")
    }

    val paramRegs = 1 + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val localCount = impl.registerCount - paramRegs
    val scratch = minOf(localCount - 1, 15)
    if (scratch < 0) {
        throw PatchException("FAIL-CLOSED: No local register available in $definingClass->$name")
    }
    // Check that p0 is addressable by 4-bit iget-boolean/iput (p0 <= 15; else move).
    // IMPORTANT: Never read p1 (Context) before return-void — R8 reuses p1 for the int result
    // of context.getColor(...) right before return-void in Gboard 18.5.4's Lrmt;-><init>, which
    // triggers an ART VerifyError if p1 is passed as Context. Always use zero-arg
    // isAmoledDarkKeyboardEnabled()Z instead.
    val p0RegIndex = localCount
    val returnIndex = returns.single()
    val snippet = if (p0RegIndex <= 15) {
        buildString {
            appendLine("iget-boolean v$scratch, p0, $isLightField")
            appendLine("if-nez v$scratch, :amoled_dark_surface_done")
            appendLine(
                "invoke-static {}, $SETTINGS_CLASS_TYPE->isAmoledDarkKeyboardEnabled()Z",
            )
            appendLine("move-result v$scratch")
            appendLine("if-eqz v$scratch, :amoled_dark_surface_done")
            appendLine("const/high16 v$scratch, $AMOLED_DARK_BACKGROUND")
            surfaceFields.forEach { appendLine("iput v$scratch, p0, $it") }
        }
    } else {
        if (localCount < 2) {
            throw PatchException("FAIL-CLOSED: Need 2 low local registers for high p0 in $definingClass->$name")
        }
        buildString {
            appendLine("move-object/from16 v0, p0")
            appendLine("iget-boolean v1, v0, $isLightField")
            appendLine("if-nez v1, :amoled_dark_surface_done")
            appendLine(
                "invoke-static {}, $SETTINGS_CLASS_TYPE->isAmoledDarkKeyboardEnabled()Z",
            )
            appendLine("move-result v1")
            appendLine("if-eqz v1, :amoled_dark_surface_done")
            appendLine("const/high16 v1, $AMOLED_DARK_BACKGROUND")
            surfaceFields.forEach { appendLine("iput v1, v0, $it") }
        }
    }
    addInstructionsWithLabels(
        returnIndex,
        snippet,
        ExternalLabel("amoled_dark_surface_done", getInstruction(returnIndex)),
    )
}

internal data class ClipboardTouchCallbackTargets(
    val callbackClass: MutableClass,
    val superClass: String,
    val adapterFieldRef: String,
    val recyclerViewType: String,
    val viewHolderType: String,
    val getMovementFlagsMethod: MutableMethod,
    val onChildDrawMethod: MutableMethod,
    val isLongPressDragMethod: MutableMethod,
    val onMoveMethod: MutableMethod,
    val clearViewMethodName: String,
    val onSelectedChangedMethodName: String,
)

internal fun resolveClipboardTouchCallbackTargets(
    context: BytecodePatchContext,
): ClipboardTouchCallbackTargets {
    val classesByType = hashMapOf<String, ClassDef>()
    var adapterClassType: String? = null
    context.classDefForEach { cls ->
        classesByType[cls.type] = cls
        val hasTag = cls.methods.any { m ->
            m.implementation?.instructions?.any { insn ->
                ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "com/google/android/apps/inputmethod/libs/clipboard/ClipboardAdapter"
            } == true
        }
        if (hasTag) {
            if (adapterClassType != null && adapterClassType != cls.type) {
                throw PatchException(
                    "FAIL-CLOSED: Multiple ClipboardAdapter classes found: $adapterClassType and ${cls.type}",
                )
            }
            adapterClassType = cls.type
        }
    }
    val resolvedAdapterType = adapterClassType
        ?: throw PatchException("FAIL-CLOSED: Could not find Gboard ClipboardAdapter class")

    val callbackCandidates = classesByType.values.filter { cls ->
        cls.instanceFields.any { it.type == resolvedAdapterType } &&
            cls.methods.any { m ->
                m.returnType == "V" &&
                    m.parameterTypes.size == 7 &&
                    m.parameterTypes[0].toString() == "Landroid/graphics/Canvas;" &&
                    m.parameterTypes[3].toString() == "F" &&
                    m.parameterTypes[4].toString() == "F" &&
                    m.parameterTypes[5].toString() == "I" &&
                    m.parameterTypes[6].toString() == "Z"
            }
    }
    val callbackDef = callbackCandidates.singleOrNull()
        ?: throw PatchException(
            "FAIL-CLOSED: Expected 1 Clipboard ItemTouchHelper.Callback class referencing " +
                "$resolvedAdapterType, found ${callbackCandidates.size}",
        )

    val superType = callbackDef.superclass
        ?: throw PatchException("FAIL-CLOSED: Clipboard callback ${callbackDef.type} has no superclass")
    val adapterField = callbackDef.instanceFields.singleOrNull { it.type == resolvedAdapterType }
        ?: throw PatchException(
            "FAIL-CLOSED: Expected 1 $resolvedAdapterType field on ${callbackDef.type}",
        )
    val onChildDrawDef = callbackDef.methods.single { m ->
        m.returnType == "V" &&
            m.parameterTypes.size == 7 &&
            m.parameterTypes[0].toString() == "Landroid/graphics/Canvas;" &&
            m.parameterTypes[3].toString() == "F" &&
            m.parameterTypes[4].toString() == "F" &&
            m.parameterTypes[5].toString() == "I" &&
            m.parameterTypes[6].toString() == "Z"
    }
    val recyclerType = onChildDrawDef.parameterTypes[1].toString()
    val holderType = onChildDrawDef.parameterTypes[2].toString()

    // Walk up ItemTouchHelper.Callback hierarchy (fqi -> ma -> lw) to resolve clearView & onSelectedChanged.
    var baseDef: ClassDef? = classesByType[superType]
    var clearViewName: String? = null
    var onSelectedName: String? = null
    while (baseDef != null && baseDef.type != "Ljava/lang/Object;") {
        if (clearViewName == null) {
            clearViewName = baseDef.methods.singleOrNull { m ->
                m.returnType == "V" &&
                    m.parameterTypes.map { it.toString() } == listOf(recyclerType, holderType)
            }?.name
        }
        if (onSelectedName == null) {
            onSelectedName = baseDef.methods.singleOrNull { m ->
                m.returnType == "V" &&
                    m.parameterTypes.map { it.toString() } == listOf(holderType, "I")
            }?.name
        }
        if (clearViewName != null && onSelectedName != null) break
        baseDef = baseDef.superclass?.let { classesByType[it] }
    }
    if (clearViewName == null || onSelectedName == null) {
        throw PatchException(
            "FAIL-CLOSED: Could not resolve ItemTouchHelper.Callback clearView ($clearViewName) / " +
                "onSelectedChanged ($onSelectedName) above $superType",
        )
    }

    val mutableCallback = context.mutableClassDefBy(callbackDef.type)
    val getMovementFlags = mutableCallback.methods.singleOrNull { m ->
        m.returnType == "I" &&
            m.parameterTypes.map { it.toString() } == listOf(recyclerType, holderType)
    } ?: throw PatchException("FAIL-CLOSED: Missing getMovementFlags on ${callbackDef.type}")
    val onChildDraw = mutableCallback.methods.single { m ->
        m.name == onChildDrawDef.name && m.parameterTypes.size == 7 && m.returnType == "V"
    }
    val isLongPressDrag = mutableCallback.methods.singleOrNull { m ->
        m.returnType == "Z" && m.parameterTypes.isEmpty()
    } ?: throw PatchException("FAIL-CLOSED: Missing isLongPressDragEnabled on ${callbackDef.type}")
    val onMove = mutableCallback.methods.singleOrNull { m ->
        m.returnType == "Z" &&
            m.parameterTypes.map { it.toString() } == listOf(recyclerType, holderType, holderType)
    } ?: throw PatchException("FAIL-CLOSED: Missing onMove on ${callbackDef.type}")

    return ClipboardTouchCallbackTargets(
        callbackClass = mutableCallback,
        superClass = superType,
        adapterFieldRef = "${callbackDef.type}->${adapterField.name}:$resolvedAdapterType",
        recyclerViewType = recyclerType,
        viewHolderType = holderType,
        getMovementFlagsMethod = getMovementFlags,
        onChildDrawMethod = onChildDraw,
        isLongPressDragMethod = isLongPressDrag,
        onMoveMethod = onMove,
        clearViewMethodName = clearViewName,
        onSelectedChangedMethodName = onSelectedName,
    )
}

internal fun applyClipboardDragReorder(targets: ClipboardTouchCallbackTargets) {
    val owner = targets.callbackClass
    val stockMoveHelper = "ramblerStockMovementFlags"
    val stockDrawHelper = "ramblerStockOnChildDraw"
    if (owner.methods.any { it.name == stockMoveHelper }) {
        return
    }
    val rv = targets.recyclerViewType
    val vh = targets.viewHolderType
    val adapterField = targets.adapterFieldRef
    val superCls = targets.superClass
    val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
    val privateFinal = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value

    // 1. Wrap getMovementFlags(RecyclerView, ViewHolder)I
    val origMoveFlags = targets.getMovementFlagsMethod
    owner.methods.add(
        ImmutableMethod(
            owner.type,
            stockMoveHelper,
            origMoveFlags.parameters,
            origMoveFlags.returnType,
            privateFinal,
            origMoveFlags.annotations,
            origMoveFlags.hiddenApiRestrictions,
            origMoveFlags.implementation,
        ).toMutable(),
    )
    owner.methods.remove(origMoveFlags)
    val wrappedMoveFlags = ImmutableMethod(
        owner.type,
        origMoveFlags.name,
        listOf(
            ImmutableMethodParameter(rv, emptySet(), null),
            ImmutableMethodParameter(vh, emptySet(), null),
        ),
        "I",
        publicFinal,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(5),
    ).toMutable()
    wrappedMoveFlags.addInstructionsWithLabels(
        0,
        """
        invoke-direct {p0, p1, p2}, ${owner.type}->$stockMoveHelper($rv$vh)I
        move-result v0
        iget-object v1, p0, $adapterField
        invoke-static {v1, p2, v0}, $CLIPBOARD_REORDER_RUNTIME_TYPE->computeMovementFlags(Ljava/lang/Object;Ljava/lang/Object;I)I
        move-result v0
        return v0
        """.trimIndent(),
    )
    owner.methods.add(wrappedMoveFlags)

    // 2. Replace isLongPressDragEnabled()Z
    val origLongPress = targets.isLongPressDragMethod
    owner.methods.remove(origLongPress)
    val patchedLongPress = ImmutableMethod(
        owner.type,
        origLongPress.name,
        emptyList(),
        "Z",
        publicFinal,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(2),
    ).toMutable()
    patchedLongPress.addInstructionsWithLabels(
        0,
        """
        iget-object v0, p0, $adapterField
        invoke-static {v0}, $CLIPBOARD_REORDER_RUNTIME_TYPE->isLongPressDragEnabled(Ljava/lang/Object;)Z
        move-result v0
        return v0
        """.trimIndent(),
    )
    owner.methods.add(patchedLongPress)

    // 3. Replace onMove(RecyclerView, ViewHolder, ViewHolder)Z
    val origOnMove = targets.onMoveMethod
    owner.methods.remove(origOnMove)
    val patchedOnMove = ImmutableMethod(
        owner.type,
        origOnMove.name,
        listOf(
            ImmutableMethodParameter(rv, emptySet(), null),
            ImmutableMethodParameter(vh, emptySet(), null),
            ImmutableMethodParameter(vh, emptySet(), null),
        ),
        "Z",
        publicFinal,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(5),
    ).toMutable()
    patchedOnMove.addInstructionsWithLabels(
        0,
        """
        iget-object v0, p0, $adapterField
        invoke-static {v0, p1, p2, p3}, $CLIPBOARD_REORDER_RUNTIME_TYPE->onMove(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v0
        return v0
        """.trimIndent(),
    )
    owner.methods.add(patchedOnMove)

    // 4. Wrap onChildDraw(Canvas, RecyclerView, ViewHolder, F, F, I, Z)V so drag keeps opacity
    //    instead of applying horizontal swipe-to-delete alpha fade.
    val origDraw = targets.onChildDrawMethod
    owner.methods.add(
        ImmutableMethod(
            owner.type,
            stockDrawHelper,
            origDraw.parameters,
            origDraw.returnType,
            privateFinal,
            origDraw.annotations,
            origDraw.hiddenApiRestrictions,
            origDraw.implementation,
        ).toMutable(),
    )
    owner.methods.remove(origDraw)
    val wrappedDraw = ImmutableMethod(
        owner.type,
        origDraw.name,
        listOf(
            ImmutableMethodParameter("Landroid/graphics/Canvas;", emptySet(), null),
            ImmutableMethodParameter(rv, emptySet(), null),
            ImmutableMethodParameter(vh, emptySet(), null),
            ImmutableMethodParameter("F", emptySet(), null),
            ImmutableMethodParameter("F", emptySet(), null),
            ImmutableMethodParameter("I", emptySet(), null),
            ImmutableMethodParameter("Z", emptySet(), null),
        ),
        "V",
        publicFinal,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(10),
    ).toMutable()
    wrappedDraw.addInstructionsWithLabels(
        0,
        """
        const/4 v0, 0x2
        if-ne p6, v0, :rambler_stock_draw
        invoke-super/range {p0 .. p7}, $superCls->${origDraw.name}(Landroid/graphics/Canvas;$rv${vh}FFIZ)V
        iget-object v0, p0, $adapterField
        invoke-static {v0, p3, p4, p5}, $CLIPBOARD_REORDER_RUNTIME_TYPE->onDragDraw(Ljava/lang/Object;Ljava/lang/Object;FF)V
        return-void
        :rambler_stock_draw
        invoke-direct/range {p0 .. p7}, ${owner.type}->$stockDrawHelper(Landroid/graphics/Canvas;$rv${vh}FFIZ)V
        return-void
        """.trimIndent(),
    )
    owner.methods.add(wrappedDraw)

    // 5. Override onSelectedChanged(ViewHolder, I)V
    owner.methods.removeAll {
        it.name == targets.onSelectedChangedMethodName &&
            it.parameterTypes.map { p -> p.toString() } == listOf(vh, "I") &&
            it.returnType == "V"
    }
    val onSelected = ImmutableMethod(
        owner.type,
        targets.onSelectedChangedMethodName,
        listOf(
            ImmutableMethodParameter(vh, emptySet(), null),
            ImmutableMethodParameter("I", emptySet(), null),
        ),
        "V",
        publicFinal,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(4),
    ).toMutable()
    onSelected.addInstructionsWithLabels(
        0,
        """
        invoke-super {p0, p1, p2}, $superCls->${targets.onSelectedChangedMethodName}(${vh}I)V
        iget-object v0, p0, $adapterField
        invoke-static {v0, p1, p2}, $CLIPBOARD_REORDER_RUNTIME_TYPE->onSelectedChanged(Ljava/lang/Object;Ljava/lang/Object;I)V
        return-void
        """.trimIndent(),
    )
    owner.methods.add(onSelected)

    // 6. Override clearView(RecyclerView, ViewHolder)V
    owner.methods.removeAll {
        it.name == targets.clearViewMethodName &&
            it.parameterTypes.map { p -> p.toString() } == listOf(rv, vh) &&
            it.returnType == "V"
    }
    val clearView = ImmutableMethod(
        owner.type,
        targets.clearViewMethodName,
        listOf(
            ImmutableMethodParameter(rv, emptySet(), null),
            ImmutableMethodParameter(vh, emptySet(), null),
        ),
        "V",
        publicFinal,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(4),
    ).toMutable()
    clearView.addInstructionsWithLabels(
        0,
        """
        invoke-super {p0, p1, p2}, $superCls->${targets.clearViewMethodName}($rv$vh)V
        iget-object v0, p0, $adapterField
        invoke-static {v0, p1, p2}, $CLIPBOARD_REORDER_RUNTIME_TYPE->onClearView(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
        return-void
        """.trimIndent(),
    )
    owner.methods.add(clearView)
}
