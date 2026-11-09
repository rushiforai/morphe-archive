package app.template.patches.tvremote

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element
import app.template.patches.shared.Constants.COMPATIBILITY_CRICZ_TV
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYZ_TV
import app.template.patches.shared.Constants.COMPATIBILITY_CREXIFY_TV
import app.template.patches.shared.Constants.COMPATIBILITY_SK_TECH_TV
import app.template.patches.cricz.hidePlaybackControlsPatch as criczHide
import app.template.patches.playz.hidePlaybackControlsPatch as playzHide
import app.template.patches.crexify.crexifyPlaybackControls as crexifyHide
import app.template.patches.sktech.hidePlaybackControlsPatch as sktechHide

private data class Spec(val pkg: String, val ver: String, val code: String,
    val activity: String, val streamMethod: String, val streamArgs: List<String>, val count: Int,
    val showMethod: String, val controller: String, val focusField: String,
    val playerId: Int, val defaultFocusId: Int, val defaultFocusName: String, val progressId: Int, val pauseId: Int, val playId: Int, val fullscreenId: Int)
private val cricz = Spec("com.pro.cricztv","7.3","10", "Lcom/pro/cricztv/activities/PlayerActivity;", "z",
    listOf("Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/util/Map;"),391,
    "g","Lg4/r;","J", 0x7f0a025a,0x7f0a02a0,"share_app_btn",0x7f0a0148,0x7f0a0142,0x7f0a0143,0x7f0a0174)
private val playz = Spec("com.playz.tv","2.3.1","8", "Lcom/playz/tv/activities/PlayerActivity;", "B",
    listOf("Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/util/Map;","Z"),441,
    "h","Li4/r;","I", 0x7f0a0262,0x7f0a02ac,"share_app_btn",0x7f0a0153,0x7f0a014d,0x7f0a014e,0x7f0a0180)
private val crexify = Spec("com.crexify.tv","4.5","12", "Lcom/crexify/tv/activities/PlayerActivity;", "A",
    listOf("Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/util/Map;","Z"),441,
    "h","Lg62;","E", 0x7f0a0267,0x7f0a02b1,"share_app_btn",0x7f0a0153,0x7f0a014d,0x7f0a014e,0x7f0a0180)
private val sktech = Spec("com.live.sktechtv","2.7","17", "Lcom/live/sktechtv/activities/PlayerActivity;", "A",
    listOf("Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/lang/String;","Ljava/util/Map;"),375,
    "g","Lg4/r;","I", 0x7f0a0237,0x7f0a01c9,"message_card",0x7f0a0133,0x7f0a012d,0x7f0a012e,0x7f0a0163)
private fun mr(i: Instruction) = (i as? ReferenceInstruction)?.reference as? MethodReference
private fun fr(i: Instruction) = (i as? ReferenceInstruction)?.reference as? FieldReference
private fun regA(i: Instruction) = (i as? OneRegisterInstruction)?.registerA
private fun regB(i: Instruction) = (i as? TwoRegisterInstruction)?.registerB
private fun hex(n: Int) = "0x"+n.toUInt().toString(16)

private fun MutableClass.addStatic(name: String, parameters: List<String>, ret: String, regs: Int, smali: String) {
    check(methods.none { it.name == name }) { "Unexpected existing test helper $name" }
    val p = parameters.map { ImmutableMethodParameter(it, emptySet(), null) }
    val m = ImmutableMethod(type, name, p, ret, 0x9, emptySet(), emptySet(), MutableMethodImplementation(regs)).toMutable()
    m.addInstructionsWithLabels(0, smali.trimIndent())
    check(methods.add(m)) { "Could not add helper $name" }
}

// This changes no player, network, stream, decoder or signing logic. is_tv is the
// app's own preference; Android television uiMode covers televisions without it.
private fun MutableClass.addHelpers(s: Spec) {
    val owner = s.activity
    addStatic("ginTvDevice", listOf("Landroid/app/Activity;"), "Z", 4, """
        invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
        move-result-object v0
        invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
        move-result-object v0
        iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
        and-int/lit8 v0, v0, 0xf
        const/4 v1, 0x4
        if-eq v0, v1, :yes
        const-string v0, "DataPreferences"
        const/4 v1, 0x0
        invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
        move-result-object v0
        const-string v2, "is_tv"
        invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
        :yes
        const/4 v0, 0x1
        return v0
    """)
    // Preserve the original setVisibility(0). Only transfer initial default
    // focus from nothing or the app-specific default message/share view, and only on a GONE/INVISIBLE ->
    // VISIBLE transition. Switching streams with another focused UI is untouched.
    addStatic("ginTvVisible", listOf("Landroid/view/View;"), "V", 5, """
        invoke-virtual {p0}, Landroid/view/View;->getVisibility()I
        move-result v0
        const/4 v1, 0x0
        invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V
        if-eqz v0, :done
        invoke-static {p0}, $owner->ginTvPlayerFocus(Landroid/view/View;)V
        :done
        return-void
    """)
    addStatic("ginTvPlayerFocus", listOf("Landroid/view/View;"), "V", 6, """
        if-eqz p0, :done
        invoke-virtual {p0}, Landroid/view/View;->getId()I
        move-result v0
        const v1, ${hex(s.playerId)}
        if-ne v0, v1, :done
        invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v0
        instance-of v1, v0, $owner
        if-eqz v1, :done
        check-cast v0, Landroid/app/Activity;
        invoke-static {v0}, $owner->ginTvDevice(Landroid/app/Activity;)Z
        move-result v1
        if-eqz v1, :done
        invoke-virtual {p0}, Landroid/view/View;->getVisibility()I
        move-result v1
        if-nez v1, :done
        invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;
        move-result-object v1
        if-eqz v1, :focus
        if-eq v1, p0, :done
        invoke-virtual {v1}, Landroid/view/View;->getId()I
        move-result v2
        const v3, ${hex(s.defaultFocusId)}
        if-eq v2, v3, :focus
        invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z
        move-result v2
        if-eqz v2, :done
        :focus
        invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z
        :done
        return-void
    """)
    // Native Media3 controller show fallback, but only for the actual focused
    // main player of the expected activity on TV. Do not steal focus from a
    // dialog, list, Share or other interactive UI.
    addStatic("ginTvControllerFocus", listOf("Landroid/view/View;"), "V", 6, """
        if-eqz p0, :done
        invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
        move-result-object v0
        instance-of v1, v0, Landroidx/media3/ui/PlayerView;
        if-eqz v1, :done
        check-cast v0, Landroid/view/View;
        invoke-virtual {v0}, Landroid/view/View;->getId()I
        move-result v1
        const v2, ${hex(s.playerId)}
        if-ne v1, v2, :done
        invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z
        move-result v1
        if-eqz v1, :done
        invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v1
        instance-of v2, v1, $owner
        if-eqz v2, :done
        check-cast v1, Landroid/app/Activity;
        invoke-static {v1}, $owner->ginTvDevice(Landroid/app/Activity;)Z
        move-result v1
        if-eqz v1, :done
        const v1, ${hex(s.progressId)}
        invoke-static {p0, v1}, $owner->ginTvTryFocus(Landroid/view/View;I)Z
        move-result v1
        if-nez v1, :done
        const v1, ${hex(s.pauseId)}
        invoke-static {p0, v1}, $owner->ginTvTryFocus(Landroid/view/View;I)Z
        move-result v1
        if-nez v1, :done
        const v1, ${hex(s.playId)}
        invoke-static {p0, v1}, $owner->ginTvTryFocus(Landroid/view/View;I)Z
        move-result v1
        if-nez v1, :done
        const v1, ${hex(s.fullscreenId)}
        invoke-static {p0, v1}, $owner->ginTvTryFocus(Landroid/view/View;I)Z
        :done
        return-void
    """)
    addStatic("ginTvTryFocus", listOf("Landroid/view/View;","I"), "Z", 4, """
        invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v0
        if-eqz v0, :no
        invoke-virtual {v0}, Landroid/view/View;->isShown()Z
        move-result v1
        if-eqz v1, :no
        invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z
        move-result v1
        if-eqz v1, :no
        invoke-virtual {v0}, Landroid/view/View;->isFocusable()Z
        move-result v1
        if-eqz v1, :no
        invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z
        move-result v0
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """)
}

private fun resourceGuard(s: Spec) = resourcePatch {
    execute {
        check(packageMetadata.packageName == s.pkg && packageMetadata.versionName == s.ver && packageMetadata.versionCode == s.code) { "Unsupported TV remote target" }
        val ns = "http://schemas.android.com/apk/res/android"
        val ids = mapOf("player_view" to s.playerId,s.defaultFocusName to s.defaultFocusId,"exo_progress" to s.progressId,"exo_play" to s.playId,"exo_pause" to s.pauseId,"fullscreen" to s.fullscreenId)
        document("res/values/public.xml").use { d ->
            val nodes=d.getElementsByTagName("public")
            for ((name,id) in ids) {
                val found=(0 until nodes.length).map { nodes.item(it) as Element }.filter { it.getAttribute("type")=="id" && it.getAttribute("name")==name }
                check(found.size==1 && found[0].getAttribute("id").equals(hex(id),true)) { "Unexpected ID for $name" }
            }
        }
        document("res/layout/activity_player.xml").use { d ->
            val nodes=d.getElementsByTagName("androidx.media3.ui.PlayerView")
            val found=(0 until nodes.length).map { nodes.item(it) as Element }.filter { it.getAttributeNS(ns,"id")=="@id/player_view" }
            check(found.size==1 && found[0].getAttributeNS("http://schemas.android.com/apk/res-auto","controller_layout_id")=="@layout/player_controller") { "Unexpected main player" }
            // SK Tech uses a message card rather than the Share view used by
            // the other apps. Only that exact view may hand off focus.
            if (s.pkg == "com.live.sktechtv") {
                val cards = d.getElementsByTagName("com.google.android.material.card.MaterialCardView")
                check((0 until cards.length).count { (cards.item(it) as Element).getAttributeNS(ns,"id")=="@id/message_card" } == 1) {
                    "Unexpected SK Tech message card; refusing to patch."
                }
            }
        }
        document("res/layout/player_controller.xml").use { d ->
            for (id in listOf("exo_progress","exo_play","exo_pause","fullscreen")) {
                val all=d.getElementsByTagName("*")
                check((0 until all.length).count { (all.item(it) as Element).getAttributeNS(ns,"id")=="@id/$id" }==1) { "Unexpected controller target $id" }
            }
            val all=d.getElementsByTagName("*")
            check((0 until all.length).none { (all.item(it) as Element).getAttributeNS(ns,"id")=="@id/exo_play_pause" }) { "Unexpected combined controller" }
        }
    }
}
private val criczRes = resourceGuard(cricz)
private val playzRes = resourceGuard(playz)
private val crexifyRes = resourceGuard(crexify)
private val sktechRes = resourceGuard(sktech)
private val criczStart=Fingerprint(definingClass=cricz.activity,name=cricz.streamMethod,returnType="V",parameters=cricz.streamArgs)
private val playzStart=Fingerprint(definingClass=playz.activity,name=playz.streamMethod,returnType="V",parameters=playz.streamArgs)
private val sktechStart=Fingerprint(definingClass=sktech.activity,name=sktech.streamMethod,returnType="V",parameters=sktech.streamArgs)
private val crexifyStart=Fingerprint(definingClass=crexify.activity,name=crexify.streamMethod,returnType="V",parameters=crexify.streamArgs)
private val criczToggle=Fingerprint(definingClass=cricz.activity,name="E",returnType="V",parameters=emptyList())
private val playzToggle=Fingerprint(definingClass=playz.activity,name="I",returnType="V",parameters=emptyList())
private val sktechToggle=Fingerprint(definingClass=sktech.activity,name="F",returnType="V",parameters=emptyList())
private val crexifyToggle=Fingerprint(definingClass=crexify.activity,name="H",returnType="V",parameters=emptyList())
private val criczShow=Fingerprint(definingClass="Landroidx/media3/ui/PlayerView;",name="g",returnType="V",parameters=listOf("Z"))
private val playzShow=Fingerprint(definingClass="Landroidx/media3/ui/PlayerView;",name="h",returnType="V",parameters=listOf("Z"))
private val sktechShow=Fingerprint(definingClass="Landroidx/media3/ui/PlayerView;",name="g",returnType="V",parameters=listOf("Z"))
private val crexifyShow=Fingerprint(definingClass="Landroidx/media3/ui/PlayerView;",name="h",returnType="V",parameters=listOf("Z"))

private fun BytecodePatchContext.applyRemote(s: Spec, start: Fingerprint, show: Fingerprint, toggle: Fingerprint) {
    val owner=start.classDef
    val m=start.method
    val xs=m.instructions.toList()
    if(s.count!=0) check(xs.size==s.count) { "Unexpected stream method size" }
    val hits=xs.indices.filter { i ->
        val call=mr(xs[i]); call?.definingClass=="Landroidx/media3/ui/PlayerView;" && call.name=="setVisibility" && call.parameterTypes.toList()==listOf("I") && call.returnType=="V"
    }
    check(hits.size==1) { "Unexpected player visibility setup" }
    val at=hits.single(); val call=xs[at] as? FiveRegisterInstruction ?: error("Unexpected visibility registers")
    val zeroIndex = if (s.pkg == "com.pro.cricztv" || s.pkg == "com.live.sktechtv") at-1 else at-4
    val zero = xs.getOrNull(zeroIndex) ?: error("Missing visibility value")
    check(call.registerCount==2 && call.registerC==5 && zero.opcode==Opcode.CONST_4 && regA(zero)==call.registerD && (zero as? NarrowLiteralInstruction)?.narrowLiteral==0) { "Unexpected player visibility value" }
    if (zeroIndex != at-1) check(xs[zeroIndex+1].opcode==Opcode.INVOKE_VIRTUAL && xs[zeroIndex+2].opcode==Opcode.IGET_OBJECT && xs[zeroIndex+3].opcode==Opcode.IGET_OBJECT && regA(xs[zeroIndex+2])==5 && regA(xs[zeroIndex+3])==5) { "Unexpected visibility setup" }
    check(xs.take(at).takeLast(5).any { fr(it)?.type=="Landroidx/media3/ui/PlayerView;" || ((it as? ReferenceInstruction)?.reference?.toString()=="Landroidx/media3/ui/PlayerView;") }) { "Unexpected player load" }
    val sm=show.method; val si=sm.instructions.toList()
    check(si.size==23 && sm.implementation?.registerCount in setOf(4,5)) { "Unexpected native show shape" }
    val fields=si.indices.filter { i -> val f=fr(si[i]); si[i].opcode==Opcode.IGET_OBJECT && f?.definingClass==s.controller && f.name==s.focusField && f.type=="Landroid/view/View;" }
    check(fields.size==1) { "Unexpected native focus target" }
    val fi=fields.single(); check(fi>1 && mr(si[fi-1])?.definingClass==s.controller && mr(si[fi+2])?.name=="requestFocus") { "Unexpected native focus sequence" }
    val controllerReg=regB(si[fi]) ?: error("Missing controller register")
    val tm=toggle.method; val ti=tm.instructions.toList()
    check(ti.size == when (s.pkg) { "com.pro.cricztv" -> 75; "com.live.sktechtv" -> 76; else -> 62 }) { "Unexpected patched fullscreen shape" }
    val hides=ti.indices.filter { i -> val r=mr(ti[i]); r?.definingClass=="Landroidx/media3/ui/PlayerView;" && r.name=="b" && r.parameterTypes.isEmpty() && r.returnType=="V" }
    check(hides.size==2 && hides.all { i -> (ti[i] as? FiveRegisterInstruction)?.registerC==0 && i+1<ti.size && ti[i+1].opcode==Opcode.RETURN_VOID }) { "Unexpected fullscreen hide hooks" }
    owner.addHelpers(s)
    hides.asReversed().forEach { i -> tm.addInstructions(i+1,"invoke-static {v0}, ${s.activity}->ginTvPlayerFocus(Landroid/view/View;)V") }
    m.replaceInstruction(at,"invoke-static {v${call.registerC}}, ${s.activity}->ginTvVisible(Landroid/view/View;)V")
    sm.addInstructions(fi,"invoke-static {v$controllerReg}, ${s.activity}->ginTvControllerFocus(Landroid/view/View;)V")
}

@Suppress("unused") val criczTvRemote=bytecodePatch(name="Improve Android TV playback controls",description="Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable.",default=true) {
    compatibleWith(COMPATIBILITY_CRICZ_TV); dependsOn(criczRes,criczHide)
    execute { check(packageMetadata.packageName==cricz.pkg && packageMetadata.versionName==cricz.ver && packageMetadata.versionCode==cricz.code); applyRemote(cricz,criczStart,criczShow,criczToggle) }
}
@Suppress("unused") val playzTvRemote=bytecodePatch(name="Improve Android TV playback controls",description="Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable.",default=true) {
    compatibleWith(COMPATIBILITY_PLAYZ_TV); dependsOn(playzRes,playzHide)
    execute { check(packageMetadata.packageName==playz.pkg && packageMetadata.versionName==playz.ver && packageMetadata.versionCode==playz.code); applyRemote(playz,playzStart,playzShow,playzToggle) }
}
@Suppress("unused") val crexifyTvRemote=bytecodePatch(name="Improve Android TV playback controls",description="Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable.",default=true) {
    compatibleWith(COMPATIBILITY_CREXIFY_TV); dependsOn(crexifyRes,crexifyHide)
    execute { check(packageMetadata.packageName==crexify.pkg && packageMetadata.versionName==crexify.ver && packageMetadata.versionCode==crexify.code); applyRemote(crexify,crexifyStart,crexifyShow,crexifyToggle) }
}

@Suppress("unused") val sktechTvRemote=bytecodePatch(name="Improve Android TV playback controls",description="Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable.",default=true) {
    compatibleWith(COMPATIBILITY_SK_TECH_TV); dependsOn(sktechRes,sktechHide)
    execute { check(packageMetadata.packageName==sktech.pkg && packageMetadata.versionName==sktech.ver && packageMetadata.versionCode==sktech.code); applyRemote(sktech,sktechStart,sktechShow,sktechToggle) }
}
