package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_CRICFY_TV
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CRICFY_PKG = "com.cricfytv.sports"
private const val CRICFY_VERSION = "7.4"
private const val CRICFY_CODE = "54"

private const val MAIN_ACTIVITY_TYPE = "Lcom/android/vending/activities/MainActivity;"
private const val ACTIVITY_MAIN_BINDING_TYPE = "Lcom/cricfytv/sports/databinding/ActivityMainBinding;"
private const val TV_TOP_BINDING_TYPE = "Lcom/cricfytv/sports/databinding/TvTopLyBinding;"
private const val SEARCH_VIEW_TYPE = "Landroidx/appcompat/widget/SearchView;"
private const val SEARCH_AUTO_COMPLETE_TYPE = "Landroidx/appcompat/widget/SearchView\$SearchAutoComplete;"
private const val SEARCH_CLICK_ROUTER_TYPE = "Landroidx/appcompat/widget/a;"
private const val SEARCH_IME_RUNNABLE_TYPE = "Landroidx/appcompat/widget/d;"
private const val TV_TOP_CLICK_LISTENER_TYPE = "Lat1;"
private const val NAV_CHANGE_LISTENER_TYPE = "Lht1;"
private const val TV_BACK_CALLBACK_TYPE = "Lit1;"
private const val TV_SEARCH_VIEW_ID = 0x7f0a03ee

private const val HELPER_IS_TV = "ginIssue45IsTv"
private const val HELPER_OPEN_TV_SEARCH = "ginIssue45OpenTvSearch"
private const val HELPER_ON_TEXT_CLICK = "ginIssue45OnTextClick"
private const val HELPER_ON_NAV_CHANGE = "ginIssue45OnNavigation"
private const val HELPER_HIDE_SEARCH = "ginIssue45HideSearch"
private const val HELPER_CAT_MARQUEE = "ginIssue45CatMarquee"
private const val CAT_HOLDER_TYPE = "Lht;"
private const val CAT_TEXT_TYPE = "Lcom/cricfytv/sports/Utf8SafeTextView;"
private const val CAT_BINDING_TYPE = "Lcom/cricfytv/sports/databinding/CatItemBinding;"

private val catHolderCtorFp = Fingerprint(
    definingClass = CAT_HOLDER_TYPE, name = "<init>", returnType = "V",
    parameters = listOf("Lkt;", CAT_BINDING_TYPE),
)

private val activityMainBindFp = Fingerprint(
    definingClass = ACTIVITY_MAIN_BINDING_TYPE,
    name = "bind",
    returnType = ACTIVITY_MAIN_BINDING_TYPE,
    parameters = listOf("Landroid/view/View;"),
)

private val activityMainInitFp = Fingerprint(
    definingClass = ACTIVITY_MAIN_BINDING_TYPE,
    name = "<init>",
    returnType = "V",
)

private val searchViewSetIconifiedFp = Fingerprint(
    definingClass = SEARCH_VIEW_TYPE,
    name = "setIconified",
    returnType = "V",
    parameters = listOf("Z"),
)

private val searchClickRouterFp = Fingerprint(
    definingClass = SEARCH_CLICK_ROUTER_TYPE,
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

private val tvTopClickFp = Fingerprint(
    definingClass = TV_TOP_CLICK_LISTENER_TYPE,
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

private val navChangeFp = Fingerprint(
    definingClass = NAV_CHANGE_LISTENER_TYPE,
    name = "a",
    returnType = "V",
    parameters = listOf("Lod2;", "Ljd2;", "Landroid/os/Bundle;"),
)

private val tvBackFp = Fingerprint(
    definingClass = TV_BACK_CALLBACK_TYPE,
    name = "b",
    returnType = "V",
    parameters = emptyList(),
)

private fun insnMethod(i: Instruction) = (i as? ReferenceInstruction)?.reference as? MethodReference
private fun insnField(i: Instruction) = (i as? ReferenceInstruction)?.reference as? FieldReference
private fun insnType(i: Instruction) = ((i as? ReferenceInstruction)?.reference as? TypeReference)?.type
private fun regA(i: Instruction) = (i as? OneRegisterInstruction)?.registerA
private fun regB(i: Instruction) = (i as? TwoRegisterInstruction)?.registerB

/**
 * Verifies in untouched original DEX that `ActivityMainBinding.bind(View)` resolves ID `0x7f0a03ee`
 * into an `androidx.appcompat.widget.SearchView` and stores that exact constructor argument into
 * `ActivityMainBinding.k`.
 */
private fun BytecodePatchContext.verifyMainSearchBinding() {
    val initInsns = activityMainInitFp.originalMethod.implementation?.instructions?.toList()
        ?: error("Missing ActivityMainBinding.<init>")
    val kPut = initInsns.singleOrNull { ins ->
        val f = insnField(ins)
        ins.opcode == Opcode.IPUT_OBJECT &&
            f?.definingClass == ACTIVITY_MAIN_BINDING_TYPE &&
            f.name == "k" &&
            f.type == SEARCH_VIEW_TYPE
    } ?: error("Missing ActivityMainBinding.k SearchView assignment")
    val kParamSlot = regA(kPut) ?: error("Missing register on ActivityMainBinding.k assignment")

    val bindInsns = activityMainBindFp.originalMethod.implementation?.instructions?.toList()
        ?: error("Missing ActivityMainBinding.bind")
    val idHits = bindInsns.indices.filter { idx ->
        (bindInsns[idx] as? NarrowLiteralInstruction)?.narrowLiteral == TV_SEARCH_VIEW_ID
    }
    check(idHits.size == 1) { "Expected unique 0x7f0a03ee lookup in ActivityMainBinding.bind" }
    val idIdx = idHits.single()
    check(idIdx + 5 < bindInsns.size) { "Truncated ActivityMainBinding.bind around 0x7f0a03ee" }

    val castInsn = bindInsns[idIdx + 4]
    check(castInsn.opcode == Opcode.CHECK_CAST && insnType(castInsn) == SEARCH_VIEW_TYPE) {
        "0x7f0a03ee is not cast to SearchView in ActivityMainBinding.bind"
    }
    val svReg = regA(castInsn) ?: error("Missing SearchView register in ActivityMainBinding.bind")

    val ctorCall = bindInsns.filterIsInstance<RegisterRangeInstruction>().singleOrNull { r ->
        val m = insnMethod(r as Instruction)
        m?.definingClass == ACTIVITY_MAIN_BINDING_TYPE && m.name == "<init>"
    } ?: error("Missing ActivityMainBinding.<init> range call in bind")

    check(ctorCall.startRegister + kParamSlot == svReg) {
        "ActivityMainBinding.bind does not pass 0x7f0a03ee SearchView into field k"
    }
}

/**
 * Verifies the AppCompat `SearchView`, `SearchAutoComplete`, and `d` runnable field/method contracts
 * relied upon by the helpers before any bytecode edit occurs.
 */
private fun BytecodePatchContext.verifySearchViewInternals() {
    val svClass = classDefBy(SEARCH_VIEW_TYPE)
    val eField = svClass.fields.singleOrNull { it.name == "E" && it.type == SEARCH_AUTO_COMPLETE_TYPE }
        ?: error("Missing SearchView.E SearchAutoComplete field")
    check(AccessFlags.PUBLIC.isSet(eField.accessFlags)) { "SearchView.E is not public" }

    val lMethod = svClass.methods.singleOrNull {
        it.name == "l" && it.returnType == "V" && it.parameterTypes.isEmpty()
    } ?: error("Missing SearchView.l()V")
    check(AccessFlags.PUBLIC.isSet(lMethod.accessFlags)) { "SearchView.l()V is not public" }

    val setIconifiedInsns = searchViewSetIconifiedFp.originalMethod.implementation?.instructions?.toList()
        ?: error("Missing SearchView.setIconified(Z)V")
    check(
        setIconifiedInsns.any { ins ->
            val m = insnMethod(ins)
            m?.definingClass == SEARCH_AUTO_COMPLETE_TYPE &&
                m.name == "setImeVisibility" &&
                m.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                m.returnType == "V"
        }
    ) { "SearchView.setIconified(Z)V does not invoke SearchAutoComplete.setImeVisibility(Z)V" }

    val sacClass = classDefBy(SEARCH_AUTO_COMPLETE_TYPE)
    val vField = sacClass.fields.singleOrNull { it.name == "v" && it.type == "Z" }
        ?: error("Missing SearchAutoComplete.v boolean field")
    val wField = sacClass.fields.singleOrNull { it.name == "w" && it.type == SEARCH_IME_RUNNABLE_TYPE }
        ?: error("Missing SearchAutoComplete.w runnable field")
    check(AccessFlags.PUBLIC.isSet(vField.accessFlags) && AccessFlags.PUBLIC.isSet(wField.accessFlags)) {
        "SearchAutoComplete IME fields v/w are not public"
    }

    val imeMethod = sacClass.methods.singleOrNull {
        it.name == "setImeVisibility" &&
            it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Z")
    } ?: error("Missing SearchAutoComplete.setImeVisibility(Z)V")
    check(AccessFlags.PUBLIC.isSet(imeMethod.accessFlags)) {
        "SearchAutoComplete.setImeVisibility(Z)V is not public"
    }

    val runnableClass = classDefBy(SEARCH_IME_RUNNABLE_TYPE)
    check("Ljava/lang/Runnable;" in runnableClass.interfaces) {
        "SearchView IME runnable does not implement Runnable"
    }
}

private fun MutableClass.addIssue45SearchHelpers() {
    check(methods.none { it.name in setOf(HELPER_IS_TV, HELPER_OPEN_TV_SEARCH, HELPER_ON_TEXT_CLICK, HELPER_ON_NAV_CHANGE, HELPER_HIDE_SEARCH, HELPER_CAT_MARQUEE) }) {
        "Issue #45 SearchView helper already exists"
    }

    // 1. Private static TV detector matching CRICFy's own l23.L(Context) TV checks.
    val isTvHelper = ImmutableMethod(
        type,
        HELPER_IS_TV,
        listOf(ImmutableMethodParameter("Landroid/content/Context;", emptySet(), null)),
        "Z",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(4),
    ).toMutable()
    isTvHelper.addInstructionsWithLabels(
        0,
        """
        if-eqz p0, :not_tv
        invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
        move-result-object v0
        if-eqz v0, :check_pm
        invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
        move-result-object v0
        if-eqz v0, :check_pm
        iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
        and-int/lit8 v0, v0, 0xf
        const/4 v1, 0x4
        if-eq v0, v1, :tv
        :check_pm
        invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
        move-result-object v0
        if-eqz v0, :not_tv
        const-string v1, "android.software.leanback"
        invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-nez v1, :tv
        const-string v1, "android.hardware.type.television"
        invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-nez v1, :tv
        const-string v1, "amazon.hardware.fire_tv"
        invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-nez v1, :tv
        const-string v1, "android.hardware.touchscreen"
        invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-nez v1, :not_tv
        const-string v1, "android.software.live_tv"
        invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-nez v1, :tv
        :not_tv
        const/4 v0, 0x0
        return v0
        :tv
        const/4 v0, 0x1
        return v0
        """.trimIndent(),
    )
    check(methods.add(isTvHelper)) { "Cannot add $HELPER_IS_TV" }

    // Category labels spoof focus for marquee; attachment or detachment can
    // disrupt the search editor's IME connection. Use selected marquee state
    // instead on both TV and phones. This changes only this ViewHolder call.
    // The mechanism and rendering behavior still require device testing.
    val catMarqueeHelper = ImmutableMethod(
        type, HELPER_CAT_MARQUEE,
        listOf(ImmutableMethodParameter(CAT_TEXT_TYPE, emptySet(), null),
            ImmutableMethodParameter("Z", emptySet(), null)),
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), MutableMethodImplementation(4),
    ).toMutable()
    catMarqueeHelper.addInstructionsWithLabels(0, """
        if-eqz p0, :done
        if-eqz p1, :stock
        const/4 v0, 0x0
        invoke-virtual {p0, v0}, $CAT_TEXT_TYPE->setKeepMarquee(Z)V
        const/4 v0, 0x1
        invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V
        return-void
        :stock
        invoke-virtual {p0, p1}, $CAT_TEXT_TYPE->setKeepMarquee(Z)V
        :done
        return-void
    """.trimIndent())
    check(methods.add(catMarqueeHelper)) { "Cannot add $HELPER_CAT_MARQUEE" }

    // 2. Stage 1 helper for MainActivity's TV top-bar search button click (Lat1;->onClick).
    // Verifies view ID 0x7f0a03ee, visible state, MainActivity context (unwrapping ContextWrapper),
    // and TV mode; otherwise falls back to stock View.requestFocus().
    val openHelper = ImmutableMethod(
        type,
        HELPER_OPEN_TV_SEARCH,
        listOf(ImmutableMethodParameter(SEARCH_VIEW_TYPE, emptySet(), null)),
        "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(5),
    ).toMutable()
    openHelper.addInstructionsWithLabels(
        0,
        """
        if-eqz p0, :null_view
        invoke-virtual {p0}, Landroid/view/View;->getId()I
        move-result v0
        const v1, 0x7f0a03ee
        if-ne v0, v1, :fallback
        invoke-virtual {p0}, Landroid/view/View;->getVisibility()I
        move-result v0
        if-nez v0, :fallback
        invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v0
        if-eqz v0, :fallback
        invoke-static {v0}, $SEARCH_VIEW_TYPE->$HELPER_IS_TV(Landroid/content/Context;)Z
        move-result v1
        if-eqz v1, :fallback
        move-object v1, v0
        const/16 v2, 0x8
        :unwrap_ctx
        instance-of v3, v1, $MAIN_ACTIVITY_TYPE
        if-nez v3, :ctx_ok
        if-eqz v2, :fallback
        add-int/lit8 v2, v2, -0x1
        instance-of v3, v1, Landroid/content/ContextWrapper;
        if-eqz v3, :fallback
        check-cast v1, Landroid/content/ContextWrapper;
        invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
        move-result-object v1
        if-eqz v1, :fallback
        goto :unwrap_ctx
        :ctx_ok
        const/4 v0, 0x0
        invoke-virtual {p0, v0}, $SEARCH_VIEW_TYPE->setIconified(Z)V
        iget-object v0, p0, $SEARCH_VIEW_TYPE->E:$SEARCH_AUTO_COMPLETE_TYPE
        if-eqz v0, :fallback
        # setIconified(false) invokes the stock focus and setImeVisibility path.
        # Do not post its internal runnable before input-connection creation.
        invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z
        move-result v0
        return v0
        :fallback
        invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z
        move-result v0
        return v0
        :null_view
        const/4 v0, 0x0
        return v0
        """.trimIndent(),
    )
    check(methods.add(openHelper)) { "Cannot add $HELPER_OPEN_TV_SEARCH" }

    // 3. Stage 2 helper for SearchView's internal SearchAutoComplete click router (a.onClick).
    // Preserves stock SearchView.l() unconditionally, then requests the IME on Android TV when
    // remote DPAD_CENTER / OK clicks an already-focused SearchAutoComplete.
    val clickHelper = ImmutableMethod(
        type,
        HELPER_ON_TEXT_CLICK,
        listOf(
            ImmutableMethodParameter(SEARCH_VIEW_TYPE, emptySet(), null),
            ImmutableMethodParameter(SEARCH_AUTO_COMPLETE_TYPE, emptySet(), null),
        ),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        MutableMethodImplementation(5),
    ).toMutable()
    clickHelper.addInstructionsWithLabels(
        0,
        """
        if-eqz p0, :done
        invoke-virtual {p0}, $SEARCH_VIEW_TYPE->l()V
        if-eqz p1, :done
        invoke-virtual {p1}, Landroid/view/View;->isShown()Z
        move-result v0
        if-eqz v0, :done
        invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z
        move-result v0
        if-eqz v0, :done
        invoke-virtual {p1}, Landroid/view/View;->isFocusable()Z
        move-result v0
        if-eqz v0, :done
        invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v0
        invoke-static {v0}, $SEARCH_VIEW_TYPE->$HELPER_IS_TV(Landroid/content/Context;)Z
        move-result v0
        if-eqz v0, :done
        const/4 v0, 0x1
        invoke-virtual {p1, v0}, $SEARCH_AUTO_COMPLETE_TYPE->setImeVisibility(Z)V
        # Stock setImeVisibility leaves a pending request until an input
        # connection exists; do not bypass it by posting the runnable early.
        :done
        return-void
        """.trimIndent(),
    )
    check(methods.add(clickHelper)) { "Cannot add $HELPER_ON_TEXT_CLICK" }

    // Called only from the verified MainActivity navigation listener. The listener's
    // own boolean is the app's TV detection. Preserve the query while merely hiding
    // the keyboard; clear it when navigating to a different app destination.
    val navHelper = ImmutableMethod(
        type, HELPER_ON_NAV_CHANGE,
        listOf(ImmutableMethodParameter(NAV_CHANGE_LISTENER_TYPE, emptySet(), null)),
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), MutableMethodImplementation(4),
    ).toMutable()
    navHelper.addInstructionsWithLabels(0, """
        if-eqz p0, :done
        iget-boolean v0, p0, $NAV_CHANGE_LISTENER_TYPE->a:Z
        if-eqz v0, :done
        iget-object v0, p0, $NAV_CHANGE_LISTENER_TYPE->b:$MAIN_ACTIVITY_TYPE
        if-eqz v0, :done
        invoke-virtual {v0}, $MAIN_ACTIVITY_TYPE->Z()$ACTIVITY_MAIN_BINDING_TYPE
        move-result-object v0
        if-eqz v0, :done
        iget-object v0, v0, $ACTIVITY_MAIN_BINDING_TYPE->k:$SEARCH_VIEW_TYPE
        if-eqz v0, :done
        invoke-virtual {v0}, Landroid/view/View;->getId()I
        move-result v1
        const v2, 0x7f0a03ee
        if-ne v1, v2, :done
        invoke-virtual {v0}, $SEARCH_VIEW_TYPE->getQuery()Ljava/lang/CharSequence;
        move-result-object v1
        invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
        move-result v1
        if-nez v1, :done
        const-string v1, ""
        invoke-virtual {v0, v1}, $SEARCH_VIEW_TYPE->p(Ljava/lang/CharSequence;)V
        :done
        return-void
    """.trimIndent())
    check(methods.add(navHelper)) { "Cannot add $HELPER_ON_NAV_CHANGE" }

    // When the app's TV Back callback explicitly closes the search bar, clear
    // its query through SearchView's own setter before preserving stock hide.
    val hideHelper = ImmutableMethod(
        type, HELPER_HIDE_SEARCH,
        listOf(ImmutableMethodParameter(SEARCH_VIEW_TYPE, emptySet(), null), ImmutableMethodParameter("I", emptySet(), null)),
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), MutableMethodImplementation(4),
    ).toMutable()
    hideHelper.addInstructionsWithLabels(0, """
        if-eqz p0, :done
        const/16 v0, 0x8
        if-ne p1, v0, :stock
        invoke-virtual {p0}, Landroid/view/View;->getId()I
        move-result v0
        const v1, 0x7f0a03ee
        if-ne v0, v1, :stock
        const-string v0, ""
        invoke-virtual {p0, v0}, $SEARCH_VIEW_TYPE->p(Ljava/lang/CharSequence;)V
        :stock
        invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V
        :done
        return-void
    """.trimIndent())
    check(methods.add(hideHelper)) { "Cannot add $HELPER_HIDE_SEARCH" }
}

private fun BytecodePatchContext.patchTvTopSearchOpen() {
    val m = tvTopClickFp.repairedMethod
    val xs = m.instructions.toList()
    check(m.implementation?.registerCount == 7 && xs.size == 139) {
        "Unexpected Lat1;->onClick register/instruction shape; refusing to patch"
    }

    val sites = xs.indices.filter { i ->
        if (i < 25 || i + 1 >= xs.size) false
        else {
            val fPrev = insnField(xs[i - 1])
            val inv = xs[i] as? FiveRegisterInstruction
            val mr = insnMethod(xs[i])
            xs[i - 1].opcode == Opcode.IGET_OBJECT &&
                fPrev?.definingClass == ACTIVITY_MAIN_BINDING_TYPE &&
                fPrev.name == "k" &&
                fPrev.type == SEARCH_VIEW_TYPE &&
                xs[i].opcode == Opcode.INVOKE_VIRTUAL &&
                inv?.registerCount == 1 &&
                inv.registerC == regA(xs[i - 1]) &&
                mr?.definingClass == "Landroid/view/View;" &&
                mr.name == "requestFocus" &&
                mr.parameterTypes.isEmpty() &&
                mr.returnType == "Z" &&
                xs[i + 1].opcode == Opcode.RETURN_VOID
        }
    }
    check(sites.size == 1) { "Expected unique TV SearchView.requestFocus() site in Lat1;->onClick" }
    val site = sites.single()

    // Confirm the surrounding branch is indeed the TvTopLyBinding <-> SearchView toggle block.
    val hasTvTopToggle = (site - 15 until site).any { j ->
        val f = insnField(xs[j])
        xs[j].opcode == Opcode.IGET_OBJECT &&
            f?.definingClass == ACTIVITY_MAIN_BINDING_TYPE &&
            f.name == "l" &&
            f.type == TV_TOP_BINDING_TYPE
    }
    check(hasTvTopToggle) { "Missing TvTopLyBinding toggle context before SearchView.requestFocus()" }

    val svReg = (xs[site] as FiveRegisterInstruction).registerC
    check(svReg < 16) { "SearchView register out of 35c range in Lat1;->onClick" }

    m.replaceInstruction(
        site,
        "invoke-static {v$svReg}, $SEARCH_VIEW_TYPE->$HELPER_OPEN_TV_SEARCH($SEARCH_VIEW_TYPE)Z",
    )
}

private fun BytecodePatchContext.patchSearchAutoCompleteClick() {
    val m = searchClickRouterFp.repairedMethod
    val xs = m.instructions.toList()
    check(m.implementation?.registerCount == 4 && xs.size == 63) {
        "Unexpected SearchView click router shape; refusing to patch"
    }

    val f0 = insnField(xs[0])
    val f1 = insnField(xs[1])
    check(
        xs[0].opcode == Opcode.IGET_OBJECT &&
            f0?.definingClass == SEARCH_CLICK_ROUTER_TYPE &&
            f0.name == "p" &&
            f0.type == SEARCH_VIEW_TYPE &&
            xs[1].opcode == Opcode.IGET_OBJECT &&
            f1?.definingClass == SEARCH_VIEW_TYPE &&
            f1.name == "E" &&
            f1.type == SEARCH_AUTO_COMPLETE_TYPE
    ) { "Unexpected SearchView/SearchAutoComplete field loads in click router" }

    val svReg = regA(xs[0]) ?: error("Missing SearchView reg")
    val sacReg = regA(xs[1]) ?: error("Missing SearchAutoComplete reg")
    check(svReg == 2 && sacReg == 0 && regB(xs[1]) == svReg) {
        "Unexpected click router register allocation"
    }

    // Verify the exact branch target at [22] -> [59], [59] (if-ne v3, v0 -> [61]), [60] SearchView.l(), [61] return-void.
    val pc = xs.runningFold(0) { acc, ins -> acc + ins.codeUnits }
    fun branchDest(idx: Int) = pc[idx] + ((xs[idx] as? OffsetInstruction)?.codeOffset ?: error("Not a branch at $idx"))

    val callL = insnMethod(xs[60])
    val invL = xs[60] as? FiveRegisterInstruction
    check(
        xs[22].opcode == Opcode.IF_NE && branchDest(22) == pc[59] &&
            xs[59].opcode == Opcode.IF_NE && regA(xs[59]) == 3 && regB(xs[59]) == sacReg && branchDest(59) == pc[61] &&
            xs[60].opcode == Opcode.INVOKE_VIRTUAL &&
            invL?.registerCount == 1 && invL.registerC == svReg &&
            callL?.definingClass == SEARCH_VIEW_TYPE &&
            callL.name == "l" &&
            callL.parameterTypes.isEmpty() &&
            callL.returnType == "V" &&
            xs[61].opcode == Opcode.RETURN_VOID
    ) { "Unexpected SearchAutoComplete click branch in SearchView click router" }

    // Ensure none of the intermediate button checks on the path to [59] clobber v0 or v2.
    for (idx in listOf(2, 13, 17, 21)) {
        check(xs[idx].opcode == Opcode.IGET_OBJECT && regA(xs[idx]) == 1) {
            "Unexpected register write at index $idx in SearchView click router"
        }
    }

    m.replaceInstruction(
        60,
        "invoke-static {v$svReg, v$sacReg}, $SEARCH_VIEW_TYPE->$HELPER_ON_TEXT_CLICK($SEARCH_VIEW_TYPE$SEARCH_AUTO_COMPLETE_TYPE)V",
    )
}

private fun BytecodePatchContext.patchNavigationAndBack() {
    val nav = navChangeFp.repairedMethod
    val n = nav.instructions.toList()
    check(nav.implementation?.registerCount == 4 && n.size == 35) {
        "Unexpected CRICFy navigation listener shape"
    }
    check(n[0].opcode == Opcode.SGET_OBJECT &&
        insnField(n[0])?.definingClass == MAIN_ACTIVITY_TYPE &&
        n[2].opcode == Opcode.IGET_BOOLEAN && insnField(n[2])?.definingClass == NAV_CHANGE_LISTENER_TYPE &&
        insnField(n[2])?.name == "a" && n[3].opcode == Opcode.IF_NEZ &&
        n[4].opcode == Opcode.IGET_OBJECT && insnField(n[4])?.name == "b") {
        "Unexpected navigation listener guard/fields"
    }
    val navClass = classDefBy(NAV_CHANGE_LISTENER_TYPE)
    check(navClass.fields.any { it.name == "a" && it.type == "Z" && AccessFlags.PUBLIC.isSet(it.accessFlags) })
    check(navClass.fields.any { it.name == "b" && it.type == MAIN_ACTIVITY_TYPE && AccessFlags.PUBLIC.isSet(it.accessFlags) })
    val setQuery = classDefBy(SEARCH_VIEW_TYPE).methods.singleOrNull {
        it.name == "p" && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;")
    } ?: error("Missing SearchView.p(CharSequence)")
    check(AccessFlags.PUBLIC.isSet(setQuery.accessFlags))
    val setQueryInsns = setQuery.implementation?.instructions?.toList() ?: error("Missing SearchView.p body")
    check(setQueryInsns.any {
        val r = insnMethod(it)
        r?.definingClass == SEARCH_VIEW_TYPE && r.name == "setQuery" &&
            r.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;")
    }) { "SearchView.p no longer delegates to setQuery" }
    nav.addInstructions(0, "invoke-static {p0}, $SEARCH_VIEW_TYPE->$HELPER_ON_NAV_CHANGE($NAV_CHANGE_LISTENER_TYPE)V")

    val back = tvBackFp.repairedMethod
    val xs = back.instructions.toList()
    check(back.implementation?.registerCount == 8) { "Unexpected TV back callback registers" }
    val hits = xs.indices.filter { i ->
        if (i < 2) false else {
            val f = insnField(xs[i-2]); val inv = xs[i] as? FiveRegisterInstruction; val mr = insnMethod(xs[i])
            xs[i-2].opcode == Opcode.IGET_OBJECT && f?.definingClass == ACTIVITY_MAIN_BINDING_TYPE &&
                f.name == "k" && f.type == SEARCH_VIEW_TYPE &&
                xs[i-1].opcode == Opcode.CONST_16 && (xs[i-1] as? NarrowLiteralInstruction)?.narrowLiteral == 8 &&
                mr?.definingClass == "Landroid/view/View;" && mr.name == "setVisibility" &&
                mr.parameterTypes.map(CharSequence::toString) == listOf("I") && mr.returnType == "V" &&
                inv?.registerCount == 2 && inv.registerC == regA(xs[i-2]) && inv.registerD == regA(xs[i-1])
        }
    }
    check(hits.size == 1) { "Expected one TV Back search hide site, got ${hits.size}" }
    val invoke = xs[hits.single()] as FiveRegisterInstruction
    back.replaceInstruction(hits.single(), "invoke-static {v${invoke.registerC}, v${invoke.registerD}}, $SEARCH_VIEW_TYPE->$HELPER_HIDE_SEARCH(${SEARCH_VIEW_TYPE}I)V")
}

private fun BytecodePatchContext.patchCategoryMarquee() {
    // Reject changed or unrelated target shapes rather than patching a fuzzy match.
    val textClass = classDefBy(CAT_TEXT_TYPE)
    val keep = textClass.methods.singleOrNull { it.name == "setKeepMarquee" &&
        it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
        ?: error("Missing category text marquee setter")
    check(AccessFlags.PUBLIC.isSet(keep.accessFlags)) { "Marquee setter not public" }
    val ks = keep.implementation?.instructions?.toList() ?: error("Missing marquee setter body")
    check(ks.size >= 5 && ks[0].opcode == Opcode.IPUT_BOOLEAN &&
        insnField(ks[0])?.definingClass == CAT_TEXT_TYPE && insnField(ks[0])?.name == "x" &&
        ks[1].opcode == Opcode.IF_EQZ && ks[2].opcode == Opcode.CONST_4 &&
        (ks[2] as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
        ks[3].opcode == Opcode.INVOKE_VIRTUAL &&
        insnMethod(ks[3])?.definingClass == "Landroid/view/View;" &&
        insnMethod(ks[3])?.name == "setSelected") { "Category marquee setter changed" }
    val focus = textClass.methods.singleOrNull { it.name == "isFocused" &&
        it.returnType == "Z" && it.parameterTypes.isEmpty() }
        ?: error("Missing category fake-focus override")
    val fs = focus.implementation?.instructions?.toList() ?: error("Missing focus implementation")
    check(fs.size >= 7 && fs[0].opcode == Opcode.IGET_BOOLEAN &&
        insnField(fs[0])?.definingClass == CAT_TEXT_TYPE && insnField(fs[0])?.name == "x" &&
        fs[1].opcode == Opcode.IF_EQZ && fs[2].opcode == Opcode.CONST_4 &&
        (fs[2] as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
        fs[3].opcode == Opcode.RETURN && fs[4].opcode == Opcode.INVOKE_SUPER &&
        insnMethod(fs[4])?.name == "isFocused") { "Category fake-focus implementation changed" }
    val m = catHolderCtorFp.repairedMethod
    val xs = m.instructions.toList()
    val hits = xs.indices.filter { i ->
        val r = insnMethod(xs[i]); val inv = xs[i] as? FiveRegisterInstruction
        i >= 2 && xs[i].opcode == Opcode.INVOKE_VIRTUAL &&
        r?.definingClass == CAT_TEXT_TYPE && r.name == "setKeepMarquee" &&
        r.parameterTypes.map(CharSequence::toString) == listOf("Z") && r.returnType == "V" &&
        inv?.registerCount == 2 && xs[i-1].opcode == Opcode.CONST_4 &&
        (xs[i-1] as? NarrowLiteralInstruction)?.narrowLiteral == 1 && regA(xs[i-1]) == inv.registerD &&
        xs[i-2].opcode == Opcode.IGET_OBJECT && insnField(xs[i-2])?.definingClass == CAT_BINDING_TYPE &&
        insnField(xs[i-2])?.name == "c" && insnField(xs[i-2])?.type == CAT_TEXT_TYPE &&
        regA(xs[i-2]) == inv.registerC
    }
    check(hits.size == 1) { "Expected one verified category-only marquee call" }
    val inv = xs[hits.single()] as FiveRegisterInstruction
    m.replaceInstruction(hits.single(),
        "invoke-static {v${inv.registerC}, v${inv.registerD}}, $SEARCH_VIEW_TYPE->$HELPER_CAT_MARQUEE(${CAT_TEXT_TYPE}Z)V")
}

@Suppress("unused")
val fixCricfySearchKeyboardPatch = bytecodePatch(
    name = "Fix search keyboard focus",
    description = "Opens search on Android TV and helps keep the keyboard connected during category searches on TV and phones. Clears TV search on navigation or close.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    dependsOn(nativeIntegrityAndDebloatPatch)

    execute {
        check(
            packageMetadata.packageName == CRICFY_PKG &&
                packageMetadata.versionName == CRICFY_VERSION &&
                packageMetadata.versionCode == CRICFY_CODE
        ) { "Unsupported CRICFy target for Issue #45 TV keyboard patch" }

        verifyMainSearchBinding()
        verifySearchViewInternals()

        // Sanitize protected CRICFy classes BEFORE obtaining MutableClass instances.
        repairClassPayloads(SEARCH_VIEW_TYPE, SEARCH_CLICK_ROUTER_TYPE, TV_TOP_CLICK_LISTENER_TYPE, NAV_CHANGE_LISTENER_TYPE, TV_BACK_CALLBACK_TYPE, CAT_HOLDER_TYPE)

        mutableClassDefBy(SEARCH_VIEW_TYPE).addIssue45SearchHelpers()
        patchTvTopSearchOpen()
        patchSearchAutoCompleteClick()
        patchNavigationAndBack()
        patchCategoryMarquee()
    }
}
