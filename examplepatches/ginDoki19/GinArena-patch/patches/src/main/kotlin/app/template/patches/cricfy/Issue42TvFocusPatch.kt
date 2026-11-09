package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_CRICFY_TV
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYFY_TV
import app.template.patches.playfy.hidePlaybackControlsPatch as playfyHide
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private data class Target(
    val pkg: String, val version: String, val code: String,
    val activity: String, val playerClass: String, val playerId: Int,
    val showName: String, val controller: String, val focusField: String,
    val combinedId: Int, val progressId: Int, val progressField: String,
    val constructorArgs: List<String>
)
private val cric = Target("com.cricfytv.sports", "7.4", "54",
    "Lcom/android/vending/player/PlayerActivity;", "Lcom/android/vending/player/CricfyPlayerView;", 0x7f0a02f8,
    "j", "Landroidx/media3/ui/PlayerControlView;", "K", 0x7f0a0185, 0x7f0a0189, "d0",
    listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "Landroid/util/AttributeSet;"))
private val play = Target("com.playfy.tv", "1.7", "8",
    "Lcom/playfy/tv/activities/PlayerActivity;", "Landroidx/media3/ui/PlayerView;", 0x7f0a0260,
    "i", "Lk4/q;", "R", 0x7f0a013f, 0x7f0a0143, "k0",
    listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"))
private val cricShow = Fingerprint(definingClass="Landroidx/media3/ui/PlayerView;",name="j",returnType="V",parameters=listOf("Z"))
private val playShow = Fingerprint(definingClass="Landroidx/media3/ui/PlayerView;",name="i",returnType="V",parameters=listOf("Z"))
private val cricControllerState = Fingerprint(definingClass="Lno2;",name="i",returnType="V",parameters=listOf("I"))
private val cricCtor = Fingerprint(definingClass=cric.controller,name="<init>",returnType="V",parameters=cric.constructorArgs)
private val playCtor = Fingerprint(definingClass=play.controller,name="<init>",returnType="V",parameters=play.constructorArgs)
private fun method(i: Instruction) = (i as? ReferenceInstruction)?.reference as? MethodReference
private fun field(i: Instruction) = (i as? ReferenceInstruction)?.reference as? FieldReference
private fun a(i: Instruction) = (i as? OneRegisterInstruction)?.registerA
private fun hex(i: Int) = "0x" + i.toUInt().toString(16)

// Verify both IDs lead into the exact native controller fields, not merely that
// matching numbers occur somewhere in the DEX. The untouched original DEX is
// used for inspection, including CricFy's protected class.
private fun BytecodePatchContext.verifyLookup(ctor: Fingerprint, t: Target, id: Int, expectedField: String) {
    val xs = ctor.originalMethod.implementation?.instructions?.toList() ?: error("Missing controller constructor")
    val hits = xs.indices.filter { i ->
        if (i + 8 >= xs.size || (xs[i] as? NarrowLiteralInstruction)?.narrowLiteral != id) false
        else {
            val inv = xs[i+1] as? FiveRegisterInstruction
            val r = method(xs[i+1])
            val find = xs[i+1].opcode == Opcode.INVOKE_VIRTUAL && inv?.registerCount == 2 &&
                inv.registerD == a(xs[i]) && r?.name == "findViewById" && r.definingClass == "Landroid/view/View;" &&
                r.parameterTypes.map { it.toString() } == listOf("I") && r.returnType == "Landroid/view/View;"
            val reg = a(xs[i+2])
            find && xs[i+2].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (i+3..i+8).any { j ->
                    val f=field(xs[j]); val ins=xs[j] as? TwoRegisterInstruction
                    xs[j].opcode==Opcode.IPUT_OBJECT && ins?.registerA==reg && f?.definingClass==t.controller && f.name==expectedField
                }
        }
    }
    check(hits.size == 1) { "Unexpected controller lookup for ${hex(id)}; refusing to patch" }
}

private fun MutableClass.addFocusHelper(t: Target) {
    val name = "ginIssue42PreferProgress"
    check(methods.none { it.name == name }) { "Helper already exists" }
    val args = listOf("Landroid/view/View;")
        .map { ImmutableMethodParameter(it, emptySet(), null) }
    val helper = ImmutableMethod(type, name, args, "Z", 0x9, emptySet(), emptySet(), MutableMethodImplementation(8)).toMutable()
    // p0 is the original non-null button. Both native methods reuse their
    // registers, so do not assume the original PlayerView parameter survives.
    // Walk the button's actual ancestry, bounded to avoid unexpected cycles.
    // Always fall through to the original requestFocus on any failed guard.
    helper.addInstructionsWithLabels(0, """
        move-object v3, p0
        const/16 v4, 0x10
        :parent_loop
        if-eqz v4, :native
        add-int/lit8 v4, v4, -0x1
        invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
        move-result-object v3
        instance-of v0, v3, Landroid/view/View;
        if-eqz v0, :native
        check-cast v3, Landroid/view/View;
        instance-of v0, v3, ${t.playerClass}
        if-eqz v0, :parent_loop
        invoke-virtual {v3}, Landroid/view/View;->getId()I
        move-result v0
        const v1, ${hex(t.playerId)}
        if-ne v0, v1, :native
        invoke-virtual {v3}, Landroid/view/View;->hasFocus()Z
        move-result v0
        if-eqz v0, :native
        invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v0
        instance-of v1, v0, ${t.activity}
        if-eqz v1, :native
        invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
        move-result-object v1
        invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
        move-result-object v1
        iget v1, v1, Landroid/content/res/Configuration;->uiMode:I
        and-int/lit8 v1, v1, 0xf
        const/4 v2, 0x4
        if-eq v1, v2, :tv
        invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
        move-result-object v1
        const-string v2, "android.software.leanback"
        invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :native
        :tv
        const v1, ${hex(t.progressId)}
        invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v1
        if-eqz v1, :native
        invoke-virtual {v1}, Landroid/view/View;->isShown()Z
        move-result v2
        if-eqz v2, :native
        invoke-virtual {v1}, Landroid/view/View;->isEnabled()Z
        move-result v2
        if-eqz v2, :native
        invoke-virtual {v1}, Landroid/view/View;->isFocusable()Z
        move-result v2
        if-eqz v2, :native
        invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z
        move-result v2
        if-eqz v2, :native
        return v2
        :native
        invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z
        move-result v0
        return v0
    """.trimIndent())
    check(methods.add(helper)) { "Cannot add focus helper" }
}

private fun BytecodePatchContext.applyIssue42(t: Target, show: Fingerprint, ctor: Fingerprint) {
    check(packageMetadata.packageName == t.pkg && packageMetadata.versionName == t.version && packageMetadata.versionCode == t.code) { "Unsupported issue 42 target" }
    verifyLookup(ctor, t, t.combinedId, t.focusField)
    verifyLookup(ctor, t, t.progressId, t.progressField)
    // Sanitizes CricFy's invalid dead-code payloads before mutating PlayerView.
    // Idempotent and harmless for PlayFy's unprotected class.
    val m = show.repairedMethod
    val xs=m.instructions.toList()
    val regs=m.implementation?.registerCount ?: error("Missing show registers")
    check(regs == if (t == cric) 4 else 5) { "Unexpected show registers" }
    val sites=xs.indices.filter { i ->
        if (i<2) false else {
            val f=field(xs[i-2]); val invoke=xs[i] as? FiveRegisterInstruction; val r=method(xs[i]);
            xs[i-2].opcode==Opcode.IGET_OBJECT && f?.definingClass==t.controller && f.name==t.focusField && f.type=="Landroid/widget/ImageView;" &&
                xs[i-1].opcode==Opcode.IF_EQZ && a(xs[i-1])==a(xs[i-2]) &&
                xs[i].opcode==Opcode.INVOKE_VIRTUAL && invoke?.registerCount==1 && invoke.registerC==a(xs[i-2]) &&
                r?.definingClass=="Landroid/view/View;" && r.name=="requestFocus" && r.returnType=="Z" && r.parameterTypes.isEmpty()
        }
    }
    check(sites.size==1) { "Unexpected native focus sequence; refusing to patch" }
    val at=sites.single()
    val button=(xs[at] as FiveRegisterInstruction).registerC
    check(button < 16 && (at+1 < xs.size) && xs[at+1].opcode != Opcode.MOVE_RESULT) { "Unexpected native focus result/registers" }
    val owner = mutableClassDefBy("Landroidx/media3/ui/PlayerView;")
    owner.addFocusHelper(t)
    m.replaceInstruction(at, "invoke-static {v$button}, Landroidx/media3/ui/PlayerView;->ginIssue42PreferProgress(Landroid/view/View;)Z")
}

// CricFy's controller state callback subsequently requests focus on the
// checked source chip. Preserve only an ALREADY focused, usable timebar; do
// not re-focus it after a user deliberately moves to a chip or another view.
private fun MutableClass.addCricfyKeepProgressHelper() {
    val name = "ginIssue42KeepProgress"
    check(methods.none { it.name == name }) { "Unexpected pre-existing focus helper" }
    val args = listOf(ImmutableMethodParameter("Landroid/view/View;", emptySet(), null))
    val helper = ImmutableMethod(type, name, args, "Z", 0x9, emptySet(), emptySet(), MutableMethodImplementation(8)).toMutable()
    helper.addInstructionsWithLabels(0, """
        invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
        move-result-object v4
        move-object v3, p0
        const/16 v5, 0x10
        :parent_loop
        if-eqz v5, :native
        add-int/lit8 v5, v5, -0x1
        invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
        move-result-object v3
        instance-of v0, v3, Landroid/view/View;
        if-eqz v0, :native
        check-cast v3, Landroid/view/View;
        instance-of v0, v3, Lcom/android/vending/player/CricfyPlayerView;
        if-eqz v0, :parent_loop
        check-cast v3, Lcom/android/vending/player/CricfyPlayerView;
        invoke-virtual {v3}, Lcom/android/vending/player/CricfyPlayerView;->getServersExo()Lcom/google/android/material/chip/ChipGroup;
        move-result-object v0
        if-ne v4, v0, :native
        invoke-virtual {v3}, Landroid/view/View;->getId()I
        move-result v0
        const v1, 0x7f0a02f8
        if-ne v0, v1, :native
        invoke-virtual {v3}, Landroid/view/View;->hasWindowFocus()Z
        move-result v0
        if-eqz v0, :native
        invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v0
        instance-of v1, v0, Lcom/android/vending/player/PlayerActivity;
        if-eqz v1, :native
        invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
        move-result-object v1
        invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
        move-result-object v1
        iget v1, v1, Landroid/content/res/Configuration;->uiMode:I
        and-int/lit8 v1, v1, 0xf
        const/4 v2, 0x4
        if-eq v1, v2, :tv
        invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
        move-result-object v1
        const-string v2, "android.software.leanback"
        invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :native
        :tv
        const v1, 0x7f0a0189
        invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v1
        if-eqz v1, :native
        invoke-virtual {v1}, Landroid/view/View;->isShown()Z
        move-result v2
        if-eqz v2, :native
        invoke-virtual {v1}, Landroid/view/View;->isEnabled()Z
        move-result v2
        if-eqz v2, :native
        invoke-virtual {v1}, Landroid/view/View;->isFocusable()Z
        move-result v2
        if-eqz v2, :native
        invoke-virtual {v3}, Landroid/view/View;->findFocus()Landroid/view/View;
        move-result-object v2
        if-ne v1, v2, :native
        const/4 v0, 0x1
        return v0
        :native
        invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z
        move-result v0
        return v0
    """.trimIndent())
    check(methods.add(helper)) { "Cannot add CricFy live-focus helper" }
}

private fun BytecodePatchContext.applyCricfyLiveFocus() {
    // Sanitize the protected class before editing; the original still provides
    // the index for method resolution. All unexpected shapes fail closed.
    val m = cricControllerState.repairedMethod
    val xs = m.instructions.toList()
    check(m.implementation?.registerCount == 7 && xs.size == 57) { "Unexpected CricFy controller state method" }
    fun typ(i: Int) = ((xs[i] as? ReferenceInstruction)?.reference as? TypeReference)?.type
    fun mr(i: Int, owner: String, name: String, ret: String) = method(xs[i])?.let {
        it.definingClass == owner && it.name == name && it.returnType == ret && it.parameterTypes.isEmpty()
    } == true
    check(field(xs[26])?.let { it.definingClass == "Landroidx/media3/ui/PlayerView;" && it.name == "J" && it.type == "Lip2;" } == true &&
        typ(30) == "Lcom/android/vending/player/CricfyPlayerView;" &&
        field(xs[32])?.let { it.definingClass == "Lcom/android/vending/player/CricfyPlayerView;" && it.name == "e0" && it.type == "Lcom/google/android/material/chip/ChipGroup;" } == true &&
        xs[43].opcode == Opcode.INSTANCE_OF && typ(43) == "Lyw;" &&
        mr(46, "Landroid/widget/CompoundButton;", "isChecked", "Z") &&
        xs[48].opcode == Opcode.IF_EQZ && xs[51].opcode == Opcode.CHECK_CAST && typ(51) == "Landroid/view/View;" &&
        xs[52].opcode == Opcode.IF_EQZ && a(xs[52]) == 0 &&
        xs[53].opcode == Opcode.INVOKE_VIRTUAL && mr(53, "Landroid/view/View;", "requestFocus", "Z") &&
        (xs[53] as? FiveRegisterInstruction)?.let { it.registerCount == 1 && it.registerC == 0 } == true &&
        xs[54].opcode == Opcode.GOTO && xs[55].opcode == Opcode.RETURN_VOID
    ) { "Unexpected CricFy selected-chip focus sequence; refusing to patch" }
    // Verify the callback's visibility and iteration branches, not just text.
    val pc = xs.runningFold(0) { n, ins -> n + ins.codeUnits }
    fun dest(i: Int) = pc[i] + ((xs[i] as? OffsetInstruction)?.codeOffset ?: error("Missing branch"))
    check(xs[31].opcode == Opcode.IF_NEZ && a(xs[31]) == 2 && dest(31) == pc[15] &&
        dest(48) == pc[36] && dest(52) == pc[15] && dest(54) == pc[15]) {
        "Unexpected CricFy focus control flow; refusing to patch"
    }
    val owner = mutableClassDefBy("Landroidx/media3/ui/PlayerView;")
    owner.addCricfyKeepProgressHelper()
    m.replaceInstruction(53, "invoke-static {v0}, Landroidx/media3/ui/PlayerView;->ginIssue42KeepProgress(Landroid/view/View;)Z")
}

@Suppress("unused") val cricfyIssue42TvTest = bytecodePatch(
    name="Improve Android TV playback controls",
    description="On Android TV, prefers the seekbar when controls open and helps retain focus when live-source tabs auto-focus. Seeking depends on the stream.", default=true
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)
    dependsOn(hidePlaybackControlsPatch)
    execute {
        applyIssue42(cric, cricShow, cricCtor)
        applyCricfyLiveFocus()
    }
}
@Suppress("unused") val playfyIssue42TvTest = bytecodePatch(
    name="Improve Android TV playback controls",
    description="On Android TV, prefers the seekbar over play/pause when controls open. Seeking depends on the stream.", default=true
) {
    compatibleWith(COMPATIBILITY_PLAYFY_TV)
    dependsOn(playfyHide)
    execute { applyIssue42(play, playShow, playCtor) }
}
