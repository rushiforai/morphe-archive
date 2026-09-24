package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val BRIDGE = "Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.text() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Method.code() = implementation?.instructions?.toList() ?: emptyList()
private fun Method.hasText(s: String) = code().any { it.text()==s }
private fun FieldReference.id() = "$definingClass->$name:$type"
private fun MethodReference.id() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun <T> Iterable<T>.unique(role: String): T {
    val list=toList()
    if(list.size!=1) throw PatchException("AI captions: $role must match exactly once; found ${list.size}")
    return list.single()
}

/** Bind once after all bundles execute; no copied official extension or cross-bundle dependency. */
internal fun BytecodePatchContext.installNativeCaptionBridge(ai:Boolean, simplified:Boolean, memory:Boolean) {
    val featureRuntime=mutableClassDefBy("Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;")
    for((name,enabled) in listOf("aiInstalled" to ai,"simplifiedInstalled" to simplified,"memoryInstalled" to memory)) {
        val stub=featureRuntime.methods.single { it.name==name }
        val replacement=ImmutableMethod(featureRuntime.type,name,stub.parameters,stub.returnType,stub.accessFlags,stub.annotations,null,MutableMethodImplementation(1)).toMutable()
        replacement.addInstructions(0,"const/4 v0, ${if(enabled) "0x1" else "0x0"}\nreturn v0")
        featureRuntime.methods.remove(stub);featureRuntime.methods.add(replacement)
    }
    val track=getAllClassesWithString("AUTO_TRANSLATE_CAPTIONS_OPTION").map { classDefBy(it.type) }
        .filter { "Landroid/os/Parcelable;" in it.interfaces }.unique("caption model")
    val sentinel=track.methods.filter { it.returnType=="Z" && it.hasText("AUTO_TRANSLATE_CAPTIONS_OPTION") }
        .unique("auto-translate sentinel")
    val language=sentinel.code().mapNotNull { it.field() }.filter { it.definingClass==track.type && it.type==STRING }
        .distinctBy { it.id() }.unique("language field")
    val vss=track.methods.filter { it.returnType=="Z" && it.hasText("t") }
        .flatMap { it.code().mapNotNull { ins -> ins.field() } }.filter { it.type==STRING }
        .distinctBy { it.id() }.unique("vss field")
    val display=track.methods.filter { it.name=="toString" }.flatMap { it.code().mapNotNull { ins -> ins.field() } }
        .filter { it.type=="Ljava/lang/CharSequence;" }.unique("display field")
    val listMethod=getAllClassesWithString("&tlang=").flatMap { classDefBy(it.type).methods.toList() }
        .filter { it.hasText("&tlang=") && it.parameterTypes.isEmpty() && it.returnType=="Ljava/util/List;" }
        .unique("translated track list")
    val listCode=listMethod.code()
    val url=listCode.mapIndexedNotNull { i,ins -> if(ins.text()=="&tlang=") listCode.getOrNull(i-2)?.field() else null }
        .filter { it.definingClass==track.type && it.type==STRING }.unique("signed source URL")
    val builderFactory=track.methods.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty()
        && it.returnType.startsWith("L") && it.returnType!=track.type }.unique("track builder factory")
    val builder=classDefBy(builderFactory.returnType)
    val copy=builder.methods.filter { it.name=="<init>" && it.parameterTypes.toList()==listOf(track.type) }
        .unique("immutable track copy constructor")
    fun builderField(field: FieldReference): FieldReference {
        val c=copy.code()
        return c.mapIndexedNotNull { i, ins ->
            if(ins.field()?.id()==field.id()) c.getOrNull(i+1)?.field() else null
        }.filter { it.definingClass==builder.type }.unique("builder field ${field.name}")
    }
    fun setter(field: FieldReference): Method {
        val bf=builderField(field)
        return builder.methods.filter { it.parameterTypes.toList()==listOf(STRING) && it.returnType=="V" &&
            it.code().any { ins -> ins.opcode==Opcode.IPUT_OBJECT && ins.field()?.id()==bf.id() } }
            .unique("builder setter ${field.name}")
    }
    val languageSetter=setter(language); val urlSetter=setter(url); val vssSetter=setter(vss)
    val builderDisplay=builderField(display)
    val build=builder.methods.filter { it.parameterTypes.isEmpty() && it.returnType==track.type }.unique("build track")
    val selector=getAllClassesWithString("setSubtitleTrack name:%s languageCode:%s languageName:%s format:%d trackName:%s vssid:%s videoid:%s")
        .flatMap { classDefBy(it.type).methods.toList() }.filter { it.hasText("setSubtitleTrack name:%s languageCode:%s languageName:%s format:%d trackName:%s vssid:%s videoid:%s") }
        .unique("all-menu track selection")
    if(selector.parameterTypes.firstOrNull()!=track.type || AccessFlags.STATIC.isSet(selector.accessFlags))
        throw PatchException("AI captions: unexpected native track selector")
    for(m in listOf(copy,languageSetter,urlSetter,vssSetter,build))
        if(!AccessFlags.PUBLIC.isSet(m.accessFlags)) throw PatchException("AI captions: non-public builder")
    if(!AccessFlags.PUBLIC.isSet(builder.fields.first { it.name==builderDisplay.name }.accessFlags))
        throw PatchException("AI captions: private display field")
    fun mutable(m:Method)=mutableClassDefBy(m.definingClass).methods.filter { it.id()==m.id() }.unique("mutable method")
    val runtime=mutableClassDefBy(BRIDGE)
    fun bind(name:String, body:String) {
        val stub=runtime.methods.filter { it.name==name && it.parameterTypes.toList()==listOf(OBJECT) }.unique(name)
        val m=ImmutableMethod(BRIDGE,name,stub.parameters,stub.returnType,stub.accessFlags,stub.annotations,null,
            MutableMethodImplementation(4)).toMutable()
        m.addInstructionsWithLabels(0,body.trimIndent());runtime.methods.remove(stub);runtime.methods.add(m)
    }
    bind("language","check-cast p0, ${track.type}\niget-object v0, p0, ${language.id()}\nreturn-object v0")
    bind("vss","check-cast p0, ${track.type}\niget-object v0, p0, ${vss.id()}\nreturn-object v0")
    bind("url","check-cast p0, ${track.type}\niget-object v0, p0, ${url.id()}\nreturn-object v0")
    bind("displayName","check-cast p0, ${track.type}\niget-object v0, p0, ${display.id()}\nreturn-object v0")
    if(simplified) {
    bind("cloneSimplified", """
        check-cast p0, ${track.type}
        new-instance v0, ${builder.type}
        invoke-direct {v0, p0}, ${copy.id()}
        const-string v1, "zh-Hans"
        invoke-virtual {v0, v1}, ${languageSetter.id()}
        invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->simplifiedLabel()$STRING
        move-result-object v1
        iput-object v1, v0, ${builderDisplay.id()}
        iget-object v1, p0, ${url.id()}
        invoke-static {v1}, $BRIDGE->simplifiedUrl($STRING)$STRING
        move-result-object v1
        invoke-virtual {v0, v1}, ${urlSetter.id()}
        iget-object v1, p0, ${vss.id()}
        invoke-static {v1}, $BRIDGE->simplifiedVss($STRING)$STRING
        move-result-object v1
        invoke-virtual {v0, v1}, ${vssSetter.id()}
        invoke-virtual {v0}, ${build.id()}
        move-result-object v0
        return-object v0
    """)
    mutable(listMethod).apply {
        val returns=implementation!!.instructions.mapIndexedNotNull { i,ins ->
            if(ins.opcode==Opcode.RETURN_OBJECT) i to (ins as OneRegisterInstruction).registerA else null }
        for((i,r) in returns.reversed()) {
            // Replace the labeled instruction itself: branch targets must execute the hook.
            replaceInstruction(i,"invoke-static/range {v$r .. v$r}, $BRIDGE->augmentTranslations(Ljava/util/List;)Ljava/util/List;")
            addInstructions(i+1,"move-result-object v$r\nreturn-object v$r")
        }
    }
    } // optional simplified language menu
    if(selector.returnType!="V" || selector.parameterTypes.size !in 2..3 ||
        (selector.parameterTypes.size==3 && selector.parameterTypes[2]!="I"))throw PatchException("Caption selector signature changed")
    // setSubtitleTrack is a USER entry point, not the automatic new-video path. Its final
    // event dispatcher is shared with model-ready/default restoration. Capture the COMMITTED
    // track there (after Off/auto-caption/forced-track filtering), before renderer I/O starts.
    val dispatcherRef=selector.code().mapNotNull { it.call() }.filter {
        it.definingClass==selector.definingClass && it.returnType=="V" && it.parameterTypes.size==1 &&
            it.parameterTypes[0].toString().startsWith("L")
    }.distinctBy { it.id() }.unique("shared caption event dispatcher")
    val dispatcher=classDefBy(dispatcherRef.definingClass).methods.filter { it.id()==dispatcherRef.id() }
        .unique("caption event method")
    val event=classDefBy(dispatcher.parameterTypes.single().toString())
    fun eventField(type:String)=event.fields.filter { it.type==type && !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        .unique("caption event field $type")
    val eventRequested=eventField(track.type)
    val eventOrigin=eventField(selector.parameterTypes[1].toString())
    val eventReason=eventField("I")
    // The event's String is a playback identifier (manager.c -> player.ap), NOT a
    // video ID. Resolve ownership from the model field that feeds the builder's
    // explicitly named videoId property. Never infer semantics from a field type.
    val videoSetter=builder.methods.filter { it.parameterTypes.toList()==listOf(STRING) &&
        it.returnType=="V" && it.hasText("Null videoId") }.unique("videoId builder setter")
    val model=classDefBy(listMethod.definingClass)
    val modelVideoField=model.methods.flatMap { m ->
        val code=m.code()
        code.mapIndexedNotNull { i,ins ->
            if(ins.call()?.id()!=videoSetter.id()) return@mapIndexedNotNull null
            val read=code.getOrNull(i-1) as? TwoRegisterInstruction ?: return@mapIndexedNotNull null
            val call=ins as? FiveRegisterInstruction ?: return@mapIndexedNotNull null
            val field=code[i-1].field()
            if(code[i-1].opcode==Opcode.IGET_OBJECT && call.registerCount==2 &&
                read.registerA==call.registerD && field?.definingClass==model.type && field.type==STRING) field else null
        }
    }.distinctBy { it.id() }.unique("caption model videoId provenance")
    val modelGetterName="captionAddonVideoId"
    val mutableModel=mutableClassDefBy(model.type)
    if(mutableModel.methods.any { it.name==modelGetterName })throw PatchException("Caption model getter already exists")
    val modelGetter=ImmutableMethod(model.type,modelGetterName,emptyList(),STRING,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,null,null,MutableMethodImplementation(2)).toMutable()
    modelGetter.addInstructions(0,"iget-object v0, p0, ${modelVideoField.id()}\nreturn-object v0")
    mutableModel.methods.add(modelGetter)
    val committed=dispatcher.code().filter { it.opcode==Opcode.IPUT_OBJECT }.mapNotNull { it.field() }
        .filter { it.definingClass==selector.definingClass && it.type==track.type }
        .distinctBy { it.id() }.unique("committed caption track")
    if(!AccessFlags.PUBLIC.isSet(classDefBy(selector.definingClass).fields.single { it.name==committed.name }.accessFlags))
        throw PatchException("AI captions: committed track is not accessible")
    val rendererIndex=dispatcher.code().indices.filter { index ->
        val call=dispatcher.code()[index].call()
        call?.definingClass==selector.definingClass && call.returnType=="V" &&
            call.parameterTypes.map { it.toString() }==listOf(track.type,"Z")
    }.unique("caption renderer update")
    if(dispatcher.code().drop(rendererIndex).any { it.opcode==Opcode.IPUT_OBJECT && it.field()?.id()==committed.id() })
        throw PatchException("AI captions: track mutates after renderer update")
    val sharedCallers=classDefBy(selector.definingClass).methods.filter { m -> m.code().any { it.call()?.id()==dispatcherRef.id() } }
    if(sharedCallers.none { it.id()!=selector.id() && it.parameterTypes.size==2 })
        throw PatchException("AI captions: automatic model initializer does not share the dispatcher")
    val appliedStub=runtime.methods.single { it.name=="onNativeTrackApplied" }
    val applied=ImmutableMethod(BRIDGE,appliedStub.name,appliedStub.parameters,appliedStub.returnType,appliedStub.accessFlags,
        appliedStub.annotations,null,MutableMethodImplementation(8)).toMutable()
    applied.addInstructionsWithLabels(0,"""
        if-eqz p0, :done
        if-eqz p1, :done
        check-cast p0, ${selector.definingClass}
        check-cast p1, ${event.type}
        move-object v0, p0
        iget-object v1, p0, ${committed.id()}
        iget-object v2, p1, ${eventRequested.id()}
        iget-object v3, p1, ${eventOrigin.id()}
        iget v4, p1, ${eventReason.id()}
        invoke-static {p0}, $BRIDGE->nativeModelVideo($OBJECT)$STRING
        move-result-object v5
        invoke-static/range {v0 .. v5}, $BRIDGE->onNativeAppliedEvent($OBJECT$OBJECT$OBJECT${OBJECT}I$STRING)V
        :done
        return-void
    """.trimIndent())
    runtime.methods.remove(appliedStub);runtime.methods.add(applied)
    mutable(dispatcher).apply {
        val renderer=dispatcher.code()[rendererIndex]
        val registers=renderer as? FiveRegisterInstruction ?: throw PatchException("AI captions: renderer invoke changed")
        if(renderer.opcode!=Opcode.INVOKE_VIRTUAL || registers.registerCount!=3)
            throw PatchException("AI captions: unexpected renderer update signature")
        // Replace the labeled instruction so every incoming native branch executes capture.
        replaceInstruction(rendererIndex,"invoke-static/range {p0 .. p1}, $BRIDGE->onNativeTrackApplied($OBJECT$OBJECT)V")
        addInstructions(rendererIndex+1,"invoke-virtual {v${registers.registerC}, v${registers.registerD}, v${registers.registerE}}, ${renderer.call()!!.id()}")
    }

    if(ai) {
        val stub=runtime.methods.single { it.name=="selectNative" }
        val m=ImmutableMethod(BRIDGE,stub.name,stub.parameters,stub.returnType,stub.accessFlags,stub.annotations,null,MutableMethodImplementation(4)).toMutable()
        m.addInstructions(0,"""
            check-cast p0, ${selector.definingClass}
            check-cast p1, ${track.type}
            check-cast p2, ${selector.parameterTypes[1]}
            ${if(selector.parameterTypes.size==3) "invoke-virtual/range {p0 .. p3}" else "invoke-virtual {p0, p1, p2}"}, ${selector.id()}
            return-void
        """.trimIndent())
        runtime.methods.remove(stub);runtime.methods.add(m)
    }
    // Global per-launch memory uses fresh native tracks; never carries old-video URLs.
    val owner=classDefBy(selector.definingClass)
    val defaultTrack=owner.methods.filter { it.parameterTypes.isEmpty() && it.returnType==track.type }.unique("native default selector")
    val modelField=defaultTrack.code().mapNotNull { it.field() }.first { it.definingClass==owner.type && it.type==listMethod.definingClass }
    bind("nativeModelVideo", """
        check-cast p0, ${owner.type}
        if-eqz p0, :no_model
        iget-object v0, p0, ${modelField.id()}
        if-eqz v0, :no_model
        invoke-virtual {v0}, ${modelGetter.id()}
        move-result-object v0
        return-object v0
        :no_model
        const-string v0, ""
        return-object v0
    """)
    val nativeList=classDefBy(listMethod.definingClass).methods.filter {
        it.parameterTypes.isEmpty() && it.returnType=="Ljava/util/List;" && it.name!=listMethod.name
    }.unique("native original track list")
    fun listAccessor(m:Method) = """
        check-cast p0, ${owner.type}
        iget-object v0, p0, ${modelField.id()}
        if-nez v0, :model_ready
        const/4 v0, 0x0
        return-object v0
        :model_ready
        invoke-virtual {v0}, ${m.id()}
        move-result-object v0
        return-object v0
    """
    bind("nativeTracks",listAccessor(nativeList));bind("translatedTracks",listAccessor(listMethod))
    if(memory) {
    mutable(defaultTrack).apply {
        if(implementation!!.registerCount < 2) throw PatchException("AI memory: no scratch register")
        addInstructionsWithLabels(0,"""
            invoke-static {p0}, $BRIDGE->resolveRemembered($OBJECT)$OBJECT
            move-result-object v0
            if-nez v0, :remembered_track
            invoke-static {}, $BRIDGE->restoreDecision()I
            move-result v0
            if-nez v0, :original_default
            const/4 v0, 0x0
            return-object v0
            :remembered_track
            check-cast v0, ${track.type}
            return-object v0
        """.trimIndent(),ExternalLabel("original_default",implementation!!.instructions.first()))
    }
    val initializer=owner.methods.filter { m -> m.returnType=="V" && m.parameterTypes.size==2 &&
        m.code().any { it.opcode==Opcode.IPUT_OBJECT && it.field()?.id()==modelField.id() } &&
        m.code().any { it.call()?.id()==defaultTrack.id() }
    }.unique("caption model ready initializer")
    // Replace the shared model-ready branch entry, not one of several native settings flags.
    val ci=initializer.code();val dc=ci.indexOfFirst { it.call()?.id()==defaultTrack.id() }
    val entry=(0 until dc).filter { i ->
        ci[i].opcode==Opcode.IGET_OBJECT && ci[i].field()?.id()==modelField.id() &&
        ci.getOrNull(i+1)?.opcode==Opcode.IF_NEZ && ci.getOrNull(i+3)?.opcode==Opcode.IGET_BOOLEAN
    }.unique("model ready decision")+3
    val nativeRead=ci[entry] as TwoRegisterInstruction
    val scratch=(ci.first() as OneRegisterInstruction).registerA
    val enabled=ci[dc-1]
    val eventType=(enabled as ReferenceInstruction).reference.toString()
    val disabledIndex=(dc+1 until ci.size).filter { i -> ci[i].opcode==Opcode.NEW_INSTANCE &&
        (ci[i] as? ReferenceInstruction)?.reference.toString()==eventType }.firstOrNull()
        ?: throw PatchException("AI memory: disabled event missing")
    mutable(initializer).apply {
        val on=implementation!!.instructions[dc-1];val off=implementation!!.instructions[disabledIndex]
        replaceInstruction(entry,"invoke-static {}, $BRIDGE->restoreDecision()I")
        addInstructionsWithLabels(entry+1,"""
            move-result v$scratch
            if-ltz v$scratch, :native_settings
            if-eqz v$scratch, :remembered_off
            const/4 v$scratch, 0x0
            goto :remembered_on
            :remembered_off
            const/4 v$scratch, 0x0
            goto :off_event
            :native_settings
            const/4 v$scratch, 0x0
            iget-boolean v${nativeRead.registerA}, v${nativeRead.registerB}, ${ci[entry].field()!!.id()}
        """.trimIndent(),ExternalLabel("remembered_on",on),ExternalLabel("off_event",off))
    }

    } // optional cross-video memory

    if(simplified) {
    // Both modern protobuf settings and legacy CC rows consume this shared metadata field.
    val metadataField=listCode.mapNotNull { it.field() }.first { it.definingClass==listMethod.definingClass && it.type.startsWith("L") }
    val metadata=classDefBy(metadataField.type)
    val metadataBase=classDefBy(metadata.superclass!!)
    val schema=metadata.methods.flatMap { it.code() }.mapNotNull { it.text() }.filter { it.startsWith("\u0001\u0007") }.unique("translation metadata schema")
    if(schema!="\u0001\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0004\u0004\u0001\u041b\u0002\u001b\u0003\u041b\u0004\u1004\u0000\u0005\u1409\u0001\u0006\u0016\u0007\u1409\u0002")
        throw PatchException("AI menu: metadata wire schema changed")
    // In this verified schema field d is field 3, but bind through the schema object table, not class name.
    val schemaCode=metadata.methods.first { it.code().any { ins -> ins.text()==schema } }.code()
    val schemaNames=schemaCode.mapNotNull { it.text() }.filter { name -> metadata.fields.any { it.name==name } }
    val translationField=metadata.fields.firstOrNull { it.name==schemaNames.getOrNull(3) }
        ?: throw PatchException("AI menu: translation field missing")
    val translationEntryType=listCode.filter { it.opcode==Opcode.CHECK_CAST }.map {
        (it as ReferenceInstruction).reference.toString()
    }.distinct().mapNotNull { classDefByOrNull(it) }.filter { cls -> cls.methods.any { m -> m.code().any { ins ->
        ins.text()=="\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0002\u0001\u0001\u1008\u0000\u0002\u1409\u0001\u0003\u0016\u0004\u0016"
    } } }.unique("translation entry wire schema")
    val parse=metadataBase.methods.filter { it.name=="parseFrom" && it.parameterTypes.toList()==listOf(metadataBase.type,"[B")
        && AccessFlags.PUBLIC.isSet(it.accessFlags) }.unique("public metadata parser")
    val instance=metadata.fields.filter { it.type==metadata.type && AccessFlags.STATIC.isSet(it.accessFlags) }.unique("metadata default")
    bind("augmentMetadata", """
        check-cast p0, ${metadata.type}
        invoke-virtual {p0}, ${metadata.type}->toByteArray()[B
        move-result-object v0
        invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->addSimplified([B)[B
        move-result-object v0
        sget-object v1, ${instance.id()}
        invoke-static {v1, v0}, ${parse.id()}
        move-result-object v0
        return-object v0
    """)
    val constructors=classDefBy(listMethod.definingClass).methods.filter { it.name=="<init>" &&
        it.code().any { ins -> ins.opcode==Opcode.IPUT_OBJECT && ins.field()?.id()==metadataField.id() } }
    if(constructors.isEmpty()) throw PatchException("AI menu: metadata constructor missing")
    constructors.forEach { ctor ->
        val writeIndex=ctor.code().indexOfFirst { it.opcode==Opcode.IPUT_OBJECT && it.field()?.id()==metadataField.id() }
        val write=ctor.code()[writeIndex] as TwoRegisterInstruction
        mutable(ctor).apply {
            replaceInstruction(writeIndex,"invoke-static/range {v${write.registerA} .. v${write.registerA}}, $BRIDGE->augmentMetadata($OBJECT)$OBJECT")
            addInstructions(writeIndex+1,"move-result-object v${write.registerA}\ncheck-cast v${write.registerA}, ${metadata.type}\niput-object v${write.registerA}, v${write.registerB}, ${metadataField.id()}")
        }
    }
    data class ReadHook(val m:Method,val index:Int,val dest:Int,val receiver:Int)
    val reads=mutableListOf<ReadHook>()
    classDefForEach { cls ->
        if(cls.type==metadata.type || cls.type.startsWith("Lapp/")) return@classDefForEach
        cls.methods.forEach { m -> m.code().forEachIndexed { i,ins ->
            if(ins.opcode==Opcode.IGET_OBJECT && ins.field()?.id()==translationField.id()) {
                val r=ins as TwoRegisterInstruction;reads.add(ReadHook(m,i,r.registerA,r.registerB))
            }
        } }
    }
    if(reads.isEmpty()) throw PatchException("AI menu: no translation metadata consumers")
    reads.groupBy { it.m.id() }.values.forEach { hooks ->
        val m=mutable(hooks.first().m)
        hooks.sortedByDescending { it.index }.forEach { h ->
            m.replaceInstruction(h.index,"invoke-static/range {v${h.receiver} .. v${h.receiver}}, $BRIDGE->augmentMetadata($OBJECT)$OBJECT")
            m.addInstructions(h.index+1,"move-result-object v${h.dest}\ncheck-cast v${h.dest}, ${metadata.type}\niget-object v${h.dest}, v${h.dest}, ${translationField.id()}")
        }
    }
    java.util.logging.Logger.getLogger("AI captions").info("Shared translation metadata readers hooked: ${reads.size}; mode-aware memory ready")
    } // optional metadata augmentation
    if(!ai)return
    installCaptionQuickToggle()
    val renderer=mutableClassDefBy("Lcom/google/android/libraries/youtube/player/subtitles/ui/SubtitleWindowView;")
    if(renderer.methods.any { it.name=="draw" && it.parameterTypes.toList()==listOf("Landroid/graphics/Canvas;") })
        throw PatchException("AI captions: native draw override already exists")
    val draw=ImmutableMethod(renderer.type,"draw",listOf(ImmutableMethodParameter("Landroid/graphics/Canvas;",null,null)),
        "V",AccessFlags.PUBLIC.value,null,null,MutableMethodImplementation(3)).toMutable()
    draw.addInstructionsWithLabels(0,"""
        invoke-static {}, $BRIDGE->suppressNativeDraw()Z
        move-result v0
        if-eqz v0, :original
        return-void
        :original
        invoke-super {p0, p1}, ${renderer.superclass}->draw(Landroid/graphics/Canvas;)V
        return-void
    """.trimIndent())
    renderer.methods.add(draw)
    val fragment=mutableClassDefBy("Lapp/morphe/extension/shared/settings/preference/AbstractPreferenceFragment;")
    val copyPath=fragment.methods.filter { it.name=="onPreferenceLongClick" && it.returnType=="Z" &&
        it.parameterTypes.map { t -> t.toString() }==listOf("Landroid/widget/AdapterView;","Landroid/view/View;","I","J") }
        .unique("official breadcrumb long-press handler")
    val originalName="aiCaptionOriginalLongClick"
    if(fragment.methods.any { it.name==originalName }) throw PatchException("AI settings: handler already wrapped")
    val original=ImmutableMethod(fragment.type,originalName,copyPath.parameters,copyPath.returnType,
        copyPath.accessFlags,copyPath.annotations,null,copyPath.implementation).toMutable()
    val wrapper=ImmutableMethod(fragment.type,copyPath.name,copyPath.parameters,copyPath.returnType,
        copyPath.accessFlags,copyPath.annotations,null,MutableMethodImplementation(7)).toMutable()
    wrapper.addInstructionsWithLabels(0,"""
        invoke-static/range {p1 .. p5}, Lapp/yydarlinker/deepseekcaptions/ApiInputPolicy;->consumePathCopy(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
        move-result v0
        if-eqz v0, :original_copy
        const/4 v0, 0x1
        return v0
        :original_copy
        invoke-direct/range {p0 .. p5}, ${fragment.type}->$originalName(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
        move-result v0
        return v0
    """.trimIndent())
    fragment.methods.remove(copyPath);fragment.methods.add(original);fragment.methods.add(wrapper)

}
