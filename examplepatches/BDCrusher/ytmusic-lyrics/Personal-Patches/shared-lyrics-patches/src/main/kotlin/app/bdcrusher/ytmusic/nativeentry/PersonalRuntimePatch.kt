/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.nativeentry
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.AccessFlags

/** Idempotent normalization, also called before an add-on performs its contract audit. */
fun BytecodePatchContext.normalizePersonalLyricsAccessors(){
    // Normalize the compile-only identity accessor without activating either lyrics integration.
    val manager=mutableClassDefByOrNull("Lapp/morphe/extension/music/patches/lyrics/LyricsManager;")
    if(manager!=null&&manager.methods.none {it.name=="getCommittedVideoId"}){
        val field=manager.fields.singleOrNull {it.name=="currentVideoId"&&it.type=="Ljava/lang/String;"}?:throw PatchException("Unsupported Morphe Music recording identity contract")
        val getter=MutableMethod(ImmutableMethod(manager.type,"getCommittedVideoId",emptyList(),"Ljava/lang/String;",AccessFlags.PUBLIC.value,null,null,MutableMethodImplementation(2)))
        getter.addInstructions(0,"iget-object v0, p0, ${manager.type}->${field.name}:Ljava/lang/String;\nreturn-object v0");manager.methods.add(getter)
    }
    // The shared payload contains the inactive personal renderer too. Resolve its
    // compile-only clock references even when only Shaders/downloads is selected.
    // These read existing official fields and never install lyrics callbacks.
    if(manager!=null)for((name,field,type) in listOf(Triple("isPlaybackPlaying","playing","Z"),Triple("getPlaybackSpeed","playbackSpeed","F"))){
        if(manager.fields.none {it.name==field&&it.type==type})throw PatchException("Unsupported official lyrics clock contract: "+field)
        if(manager.methods.none {it.name==name&&it.parameterTypes.isEmpty()&&it.returnType==type}){
            val getter=MutableMethod(ImmutableMethod(manager.type,name,emptyList(),type,AccessFlags.PUBLIC.value,null,null,MutableMethodImplementation(2)))
            getter.addInstructions(0,"iget"+(if(type=="Z")"-boolean" else "")+" v0, p0, ${manager.type}->${field}:$type\nreturn v0");manager.methods.add(getter)
        }
    }
}

/** Single owner for personal payload, Activity lifecycle and native settings integration. */
private object PersonalNotices
private val personalNotices=resourcePatch {
    execute {
        val input=PersonalNotices::class.java.classLoader!!.getResourceAsStream("bdcrusher-common/NOTICE.txt")?:throw PatchException("Build personal feature notices before packaging")
        val target=this["assets/bdcrusher-features/NOTICE.txt"];target.parentFile.mkdirs();input.use {i->target.outputStream().use {i.copyTo(it)}}
    }
}
val personalRuntimePatch=bytecodePatch {
    dependsOn(personalNotices)
    extendWith("extensions/lyrics-addon.mpe")
    execute {
        if(packageMetadata.packageName!="com.google.android.apps.youtube.music")throw PatchException("Personal features require YouTube Music")
        if(mapOf("9.42.52" to "94252240","9.43.51" to "94351240")[packageMetadata.versionName]!=packageMetadata.versionCode)throw PatchException("Personal Full Collection requires original 9.42.52 / 94252240 or 9.43.51 / 94351240, arm64-v8a")
        val activity=mutableClassDefBy("Lcom/google/android/apps/youtube/music/activities/MusicActivity;")
        val create=activity.methods.singleOrNull {it.name=="onCreate"&&it.parameterTypes==listOf("Landroid/os/Bundle;")}
            ?:throw PatchException("Native Music Activity lifecycle contract missing")
        val index=create.implementation!!.instructions.indexOfFirst {it.opcode in setOf(Opcode.INVOKE_SUPER,Opcode.INVOKE_SUPER_RANGE)&&((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="onCreate"}
        if(index<0)throw PatchException("Native Music Activity superclass initialization missing")
        create.addInstruction(index+1,"invoke-static/range { p0 .. p0 }, Lapp/bdcrusher/ytmusic/common/PersonalRuntime;->attach(Landroid/app/Activity;)V")
        val service=mutableClassDefBy("Lcom/google/android/libraries/youtube/player/background/service/BackgroundPlayerService;")
        val removed=service.methods.singleOrNull {it.name=="onTaskRemoved"&&it.parameterTypes==listOf("Landroid/content/Intent;")}?:throw PatchException("Exact Music task-dismissal lifecycle missing")
        removed.addInstruction(0,"invoke-static { p0, p1 }, Lapp/bdcrusher/ytmusic/common/TaskDismissal;->removed(Landroid/content/Context;Landroid/content/Intent;)V")
        val browser=mutableClassDefBy("Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;")
        val task=browser.methods.singleOrNull {it.name=="onTaskRemoved"&&it.parameterTypes==listOf("Landroid/content/Intent;")}
        if(task!=null)task.addInstruction(0,"invoke-static { p0, p1 }, Lapp/bdcrusher/ytmusic/common/TaskDismissal;->removed(Landroid/content/Context;Landroid/content/Intent;)V")
        else{val method=MutableMethod(ImmutableMethod(browser.type,"onTaskRemoved",listOf(ImmutableMethodParameter("Landroid/content/Intent;",null,null)),"V",AccessFlags.PUBLIC.value,null,null,MutableMethodImplementation(2)));method.addInstructions(0,"invoke-static { p0, p1 }, Lapp/bdcrusher/ytmusic/common/TaskDismissal;->removed(Landroid/content/Context;Landroid/content/Intent;)V\ninvoke-super { p0, p1 }, ${browser.superclass}->onTaskRemoved(Landroid/content/Intent;)V\nreturn-void");browser.methods.add(method)}
        val token=mutableClassDefBy("Landroid/support/v4/media/session/MediaSessionCompat\$Token;")
        val initToken=token.methods.singleOrNull {m->m.name=="<init>"&&m.parameterTypes.firstOrNull()=="Ljava/lang/Object;"&&m.implementation?.instructions?.any {i->i.opcode==Opcode.IPUT_OBJECT&&((i as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.type=="Ljava/lang/Object;"}==true}?:throw PatchException("Exact native media-session token construction missing")
        for(i in initToken.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}.map {it.index}.reversed())initToken.addInstruction(i,"invoke-static { p1 }, Lapp/bdcrusher/ytmusic/common/TaskDismissal;->session(Ljava/lang/Object;)V")

    }
    finalize {
        normalizePersonalLyricsAccessors()
        val logger=mutableClassDefBy("Lapp/morphe/extension/shared/Logger;")
        val policy="Lapp/bdcrusher/ytmusic/common/DebugLogPolicy;"
        logger.methods.single {it.name=="logInternal"&&it.parameterTypes.size==5}.addInstructions(0,"invoke-static/range { p1 .. p3 }, $policy->stack(Lapp/morphe/extension/shared/Logger\$LogMessage;Ljava/lang/Throwable;Z)Z\nmove-result p3")
        logger.methods.single {it.name=="appendToLogBuffer"&&it.parameterTypes==listOf("Ljava/lang/String;")}.addInstructions(0,"invoke-static { p0 }, $policy->bound(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object p0")
        val export=logger.methods.single {it.name=="getFilteredLogs"&&it.parameterTypes.isEmpty()}
        for(i in export.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_OBJECT}.map {it.index}.reversed()){
            val register=(export.implementation!!.instructions.elementAt(i) as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
            export.addInstructions(i,"invoke-static/range { v$register .. v$register }, $policy->export(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object v$register")
        }
        mutableClassDefByOrNull("Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;")?.methods?.forEach {m->
            for((i,instruction) in m.implementation?.instructions?.withIndex()?.toList().orEmpty().reversed()){
                val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference?:continue
                if(ref.definingClass==logger.type&&ref.name=="printDebug"&&ref.parameterTypes==listOf("Lapp/morphe/extension/shared/Logger\$LogMessage;")){
                    val call=instruction as? FiveRegisterInstruction?:throw PatchException("Unsupported component logger call")
                    m.replaceInstruction(i,BuilderInstruction35c(Opcode.INVOKE_STATIC,1,call.registerC,0,0,0,0,ImmutableMethodReference(policy,"component",ref.parameterTypes,"V")))
                }
            }
        }

        val settings=mutableClassDefByOrNull("Lapp/morphe/extension/music/settings/preference/MusicPreferenceFragment;")
            ?:throw PatchException("Select compatible Morphe Music settings/default patches for personal features")
        val init=settings.methods.single {it.name=="initialize"&&it.parameterTypes.isEmpty()}
        val index=init.implementation!!.instructions.indexOfFirst {((it as? ReferenceInstruction)?.reference as? MethodReference)?.name=="sortPreferenceGroups"}
        if(index<0)throw PatchException("Morphe Music settings sorting contract missing")
        init.addInstruction(index,"invoke-static { p0 }, Lapp/bdcrusher/ytmusic/common/PersonalSettings;->install(Landroid/preference/PreferenceFragment;)V")
        // Own the preference content background, rather than exposing the activity below.
        val viewCreated=settings.methods.singleOrNull {it.name=="onViewCreated"&&it.parameterTypes==listOf("Landroid/view/View;","Landroid/os/Bundle;")}
        if(viewCreated==null){
            val method=MutableMethod(ImmutableMethod(settings.type,"onViewCreated",listOf(ImmutableMethodParameter("Landroid/view/View;",null,null),ImmutableMethodParameter("Landroid/os/Bundle;",null,null)),"V",AccessFlags.PUBLIC.value,null,null,MutableMethodImplementation(3)))
            method.addInstructions(0,"invoke-super { p0, p1, p2 }, ${settings.superclass}->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V\ninvoke-static { p1 }, Lapp/bdcrusher/ytmusic/common/PersonalSettings;->bindRoot(Landroid/view/View;)V\nreturn-void")
            settings.methods.add(method)
        }else viewCreated.addInstruction(0,"invoke-static { p1 }, Lapp/bdcrusher/ytmusic/common/PersonalSettings;->bindRoot(Landroid/view/View;)V")
        // Typed Android dialog calls only; keep every native builder, listener and layout.
        val builders=ImmutableMethodReference("Lapp/bdcrusher/ytmusic/common/PersonalRuntime;","showBuilder",listOf("Landroid/app/AlertDialog\$Builder;"),"Landroid/app/AlertDialog;")
        classDefForEach { owner->
            if(owner.type!="Lapp/bdcrusher/ytmusic/common/PersonalRuntime;")for(original in owner.methods){
                val sites=original.implementation?.instructions?.withIndex()?.filter {(_,i)->
                    val ref=(i as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.name=="show"&&ref.parameterTypes.isEmpty()&&ref.definingClass in setOf("Landroid/app/Dialog;","Landroid/app/AlertDialog;","Landroid/app/AlertDialog\$Builder;")
                }?.toList().orEmpty()
                if(sites.isEmpty())continue
                val method=mutableClassDefBy(owner.type).methods.single {it.name==original.name&&it.parameterTypes==original.parameterTypes&&it.returnType==original.returnType}
                for((at,instruction) in sites.reversed()){
                    val ref=(instruction as ReferenceInstruction).reference as MethodReference
                    if(ref.definingClass=="Landroid/app/AlertDialog\$Builder;"){
                        when(instruction){
                            is RegisterRangeInstruction->method.replaceInstruction(at,BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,instruction.startRegister,1,builders))
                            is FiveRegisterInstruction->method.replaceInstruction(at,BuilderInstruction35c(Opcode.INVOKE_STATIC,1,instruction.registerC,0,0,0,0,builders))
                            else->throw PatchException("Unsupported native dialog invocation")
                        }
                    }else{
                        val register=when(instruction){is RegisterRangeInstruction->instruction.startRegister;is FiveRegisterInstruction->instruction.registerC;else->throw PatchException("Unsupported native dialog receiver")}
                        method.addInstruction(at+1,"invoke-static/range { v$register .. v$register }, Lapp/bdcrusher/ytmusic/common/PersonalRuntime;->dialog(Landroid/app/Dialog;)V")
                    }
                }
            }
        }
    }
}
