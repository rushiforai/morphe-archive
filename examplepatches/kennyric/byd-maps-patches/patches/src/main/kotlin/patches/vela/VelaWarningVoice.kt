package patches.vela

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val SPEAKER = "Lnl/johninnl/vela/VelaWarningSpeaker;"
/** Independent original-artifact guards, checked before any telemetry or voice mutation. */
internal val velaWarningVoiceContracts = mapOf(
    "Ldn2;-><init>(Ly43;Ljava/lang/String;ZLwy4;)V" to Contract(6, 8, 69633, "c6e854474b9046d3daeb69a0c77a693caf353a921ef5a153f76376200ee801ce"),
    "Ldn2;->invoke()Ljava/lang/Object;" to Contract(11, 114, 17, "eba4dd9135a81bb3325cfdb3ab36013484d700ae818d63c17499c4adcbca01f3"),
    "Ly43;->a()Lcom/k2fsa/sherpa/onnx/OfflineTts;" to Contract(30, 312, 17, "e0ae2d5a88d0a3f1a327c2a09eed93eaab68d7604226597c7889a15882d764a6"),
    "Ly43;->b()Ljava/lang/String;" to Contract(2, 12, 17, "9ff054a621b023789afbab604d6318cf9bc77f7c69a56cebecc542feeb60a3d9"),
    "Ly43;->c(Ljava/lang/String;)Lzy4;" to Contract(12, 72, 17, "89d336122dbbbc97e26820099dbd2d95b329ec29aee3887ec93021d3bd374f1e"),
    "Ly43;->e(Lcom/k2fsa/sherpa/onnx/OfflineTts;Ljava/lang/String;IF)Ly03;" to Contract(6, 34, 9, "f6d59f890d5486ad5c5834fc2e977cb68be92f0e2c27643959f860579e67f621"),
    "Ly43;->g()I" to Contract(6, 36, 17, "55ef6c42c6f3b96881bd77585a012ff04f23cf0597acf1e75c88ac045a37cd4d"),
    "Ly43;->h()V" to Contract(4, 9, 17, "20bd08cc2d4e0f85953f39e9976de5cb7b30da3f3ec53c2fb76019681f4b9de9"),
    "Lrj2;->j0(Lapp/vela/core/model/Route;Lyo2;Lapp/vela/core/model/LatLng;ZLjava/lang/Double;DDDLjava/lang/Double;Ly74;)Ly03;" to Contract(81, 1577, 9, "45b2b2a50cfd6b720a214a09b8ca3febf24db446bf81055fdbf63350e31695a4"),
    "Lxo2;->h(Lapp/vela/core/model/LatLng;ZLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)V" to Contract(68, 778, 17, "af65eb3083b7948ce4861a33a74dab8a4ee150394b85f3f70a529c423fba386c"),
    "Lyo2;-><init>(IDDDZIZLjava/util/Set;DIIZDI)V" to Contract(20, 19, 65537, "b24fc85e269a84a03d5e8ac5f039f3094e0dfef45688560b452e603a3ee58c55"),
    "Lwy4;->b()Z" to Contract(4, 21, 17, "f8de40ec32e92d21714dbff7f1cdd281ee5f309bfe636c5f22362c5b35fddf2e"),
    "Lwy4;->l(Ljava/lang/String;Z)V" to Contract(16, 203, 17, "b3f4b99200101e866aa4a336fab764f25e88e6eb7791903be2a46fd9922a38d5"),
    "Lpn1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;B)V" to Contract(7, 8, 69633, "27eef516d92545c66d29cf6cdfcdebf28c1cce6bb90f28e3e623b485a06d58ff"),
    "Lpn1;->invoke()Ljava/lang/Object;" to Contract(10, 68, 17, "87034ad4e7fb508ab9e50109efbb3d64f603a5bb96a75a30c2c600d54a95315e"),
    "Lty4;->onAudioFocusChange(I)V" to Contract(3, 25, 17, "802d2c2c8bb117f59849f58ca595919ed573b77224b9ec005b38dcdef8cb5803"),
    "Lvy4;->onDone(Ljava/lang/String;)V" to Contract(4, 11, 17, "c1a2809e2be620c33a9c45e64088e83aea4da1c5443b7c8da80886f95484d5e4"),
    "Lvy4;->onError(Ljava/lang/String;)V" to Contract(4, 11, 17, "c1a2809e2be620c33a9c45e64088e83aea4da1c5443b7c8da80886f95484d5e4"),
    "Lvy4;->onStart(Ljava/lang/String;)V" to Contract(2, 1, 17, "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
    "Lvy4;->onStop(Ljava/lang/String;Z)V" to Contract(4, 11, 17, "2e2ad611cf7bb32fac9e068938e55783af961d9b5f9e86e16c66c8cf57ec6064"),
    "Lwy4;->d(Ljava/lang/String;)V" to Contract(7, 84, 17, "a9a87055e86c376ce5abe69102f17c3b04eff5d07d2f51eae038c1be5b843600"),
    "Lwy4;->g()V" to Contract(6, 34, 17, "78f9ea92475c9f214ef770dff57bb98fa41e81701b48cfef0f6fd2e06bd24bcf"),
    "Lwy4;->n()V" to Contract(3, 24, 17, "cbc73562d6c102e4fbd952193d5fc6bad845504054b48f11101b74acec237eac"),
)

internal fun validateVelaWarningVoice(classes: Iterable<ClassDef>): Map<String,Method> {
    val found=mutableMapOf<String,Method>()
    val types=classes.associateBy { it.type }
    classes.forEach { cls -> cls.methods.forEach { method ->
        velaWarningVoiceContracts[method.toString()]?.let { c ->
            check(cls.sourceFile==VELA_MAP_ID && method.accessFlags==c.flags &&
                method.implementation?.registerCount==c.registers &&
                method.implementation!!.instructions.count()==c.count && velaFingerprint(method)==c.hash) {
                "Changed or already patched Vela warning voice ${method}"
            }
            check(found.put(method.toString(),method)==null) { "Duplicate Vela warning voice $method" }
        }
    } }
    check(found.keys==velaWarningVoiceContracts.keys) { "Missing Vela warning voice contracts ${velaWarningVoiceContracts.keys-found.keys}" }
    fun field(owner:String,name:String,type:String) {
        check(types.getValue(owner).fields.count { it.name==name && it.type==type }==1) { "Changed Vela warning field $owner->$name:$type" }
    }
    mapOf("a" to "Landroid/content/Context;", "f" to "Ljava/lang/String;", "b" to "Landroid/speech/tts/TextToSpeech;", "c" to "F", "l" to "Ly43;", "d" to "F", "e" to "Z", "g" to "Ljj;",
        "h" to "Z", "i" to "Z", "j" to "Ljava/lang/String;", "m" to "Z", "n" to "Z", "o" to "Z", "s" to "I", "p" to "Landroid/media/AudioManager;", "q" to "Landroid/media/AudioFocusRequest;", "t" to "Z").forEach { (name,type)->field("Lwy4;",name,type) }
    mapOf("a" to "Landroid/content/Context;","c" to "Ljava/util/concurrent/ExecutorService;","d" to "Lcom/k2fsa/sherpa/onnx/OfflineTts;",
        "e" to "Landroid/media/AudioTrack;","f" to "Z","g" to "I","h" to "Ljava/lang/String;").forEach { (name,type)->field("Ly43;",name,type) }
    field("Lzy4;","a","D");field("Lzy4;","b","J");field("Ly03;","f","Ljava/lang/Object;");field("Ly03;","g","Ljava/lang/Object;")
    field("Ldn2;","f","B");field("Ldn2;","h","Ljava/lang/Object;")
    field("Lpn1;","f","B");field("Lpn1;","h","Ljava/lang/Object;");field("Lpn1;","i","Ljava/lang/Object;")
    field("Lvy4;","a","Lwy4;");field("Lty4;","a","Lwy4;")
    field("Lapp/vela/VelaApp;","g","Lwi;");field("Lyb0;","p","Lee3;")
    listOf("Lwi;->b()Ljava/lang/Object;","Lee3;->get()Ljava/lang/Object;","Los1;->w(Landroid/content/Context;)Z").forEach { abi ->
        check(types.getValue(abi.substringBefore("->")).methods.count { it.toString()==abi }==1) { "Changed native selected-engine initialization ABI $abi" }
    }
    field("Lxo2;","b","Lwy4;");field("Lxo2;","f","Lcg3;")
    listOf("a","b","c").forEach { field("Lno2;",it,"Z") };field("Lno2;","d","Lapp/vela/core/model/Route;")
    mapOf("a" to "I","b" to "D","c" to "D","d" to "D","e" to "Z","f" to "I","g" to "Z","h" to "Ljava/util/Set;",
        "i" to "D","j" to "I","k" to "I","l" to "Z","m" to "D","n" to "I").forEach { (name,type)->field("Lyo2;",name,type) }
    val generator=velaWarningVoiceContracts.keys.single { it.startsWith("Lrj2;->j0(") }
    val callers=classes.flatMap { it.methods }.mapNotNull { m->
        val count=(m.implementation?.instructions?:emptyList()).count { (it as? ReferenceInstruction)?.reference?.toString()==generator }
        if(count==0)null else m.toString() to count
    }.toMap()
    check(callers==mapOf("Lxo2;->h(Lapp/vela/core/model/LatLng;ZLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)V" to 1)) { "Changed Vela native navigation regeneration callers $callers" }
    check(types.getValue("Lwy4;").methods.count { it.toString()=="Lwy4;->f()V" }==1)
    return found
}

context(context: BytecodePatchContext)
internal fun validateVelaWarningExtension() {
    listOf("neuralSpeech(Ljava/lang/Object;)Z", "regenerateInput(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "beforeSpeech(Ljava/lang/Object;Z)Z", "language(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;", "capture(Ljava/lang/Object;)V", "dispatch(Ljava/lang/Object;)Z", "focusRequest(Ljava/lang/Object;)V",
        "engineChanging(Ljava/lang/Object;)V", "engineChanged(Ljava/lang/Object;)V", "focusResult(Ljava/lang/Object;I)V", "nativeStop(Ljava/lang/Object;)V", "nativeSpeech(Ljava/lang/Object;)V", "focusChanged(Ljava/lang/Object;I)V",
        "utteranceStart(Ljava/lang/Object;Ljava/lang/String;)V", "utteranceDone(Ljava/lang/Object;Ljava/lang/String;)Z",
        "utteranceError(Ljava/lang/Object;Ljava/lang/String;)Z", "utteranceStopped(Ljava/lang/Object;Ljava/lang/String;Z)Z").forEach { signature ->
        check(context.classDefBy(SPEAKER).methods.count { it.toString()=="$SPEAKER->$signature" }==1) { "Missing Vela warning extension $signature" }
    }
}

internal fun bindVelaWarningVoice(methods:Map<String,MutableMethod>) {
    fun pick(owner:String,name:String)=methods.values.single { it.definingClass==owner && it.name==name }
    pick("Lrj2;","j0").addInstructions(0,"""
        invoke-static/range {p0 .. p1}, $SPEAKER->regenerateInput(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p1
        check-cast p1, Lyo2;
    """)
    for(owner in listOf("Lpn1;","Ldn2;")) {
        val constructor=pick(owner,"<init>")
        constructor.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }.reversed().forEach {
            constructor.addInstructions(it,"invoke-static/range {p0 .. p0}, $SPEAKER->capture(Ljava/lang/Object;)V")
        }
        val dispatch=pick(owner,"invoke")
        dispatch.addInstructionsWithLabels(0,"""
            invoke-static/range {p0 .. p0}, $SPEAKER->dispatch(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :vela_native_warning_closure
            sget-object v0, Ler4;->a:Ler4;
            return-object v0
        """,ExternalLabel("vela_native_warning_closure",dispatch.getInstruction(0)))
    }
    val speech=pick("Lwy4;","l")
    val language=speech.instructions.withIndex().single { (it.value as? ReferenceInstruction)?.reference?.toString()=="Lwy4;->o()Ljava/lang/String;" }.index
    check(speech.getInstruction(language+1).opcode==Opcode.MOVE_RESULT_OBJECT)
    val tag=speech.getInstruction<OneRegisterInstruction>(language+1).registerA
    speech.addInstructions(language+2,"""
        invoke-static {p0, v$tag}, $SPEAKER->language(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$tag
    """)
    speech.addInstructionsWithLabels(0,"""
        invoke-static/range {p0 .. p0}, $SPEAKER->nativeSpeech(Ljava/lang/Object;)V
        invoke-static {p0, p2}, $SPEAKER->beforeSpeech(Ljava/lang/Object;Z)Z
        move-result v0
        if-nez v0, :vela_skip_native_speech
        invoke-static/range {p0 .. p0}, $SPEAKER->neuralSpeech(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :vela_native_speech
        :vela_skip_native_speech
        return-void
    """,ExternalLabel("vela_native_speech",speech.getInstruction(0)))
    val focus=pick("Lwy4;","g")
    val request=focus.instructions.withIndex().single {
        (it.value as? ReferenceInstruction)?.reference?.toString()=="Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I"
    }.index
    check(focus.getInstruction(request+1).opcode==Opcode.MOVE_RESULT)
    val result=focus.getInstruction<OneRegisterInstruction>(request+1).registerA
    focus.addInstructions(request+2,"invoke-static {p0, v$result}, $SPEAKER->focusResult(Ljava/lang/Object;I)V")
    focus.addInstructions(0,"invoke-static/range {p0 .. p0}, $SPEAKER->focusRequest(Ljava/lang/Object;)V")
    pick("Lwy4;","n").addInstructions(0,"invoke-static/range {p0 .. p0}, $SPEAKER->nativeStop(Ljava/lang/Object;)V")
    val engine=pick("Lwy4;","d")
    engine.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }.reversed().forEach { at ->
        engine.replaceInstruction(at,"invoke-static/range {p0 .. p0}, $SPEAKER->engineChanged(Ljava/lang/Object;)V")
        engine.addInstructions(at+1,"return-void")
    }
    engine.addInstructions(0,"invoke-static/range {p0 .. p0}, $SPEAKER->engineChanging(Ljava/lang/Object;)V")
    pick("Lty4;","onAudioFocusChange").addInstructions(0,"invoke-static/range {p0 .. p1}, $SPEAKER->focusChanged(Ljava/lang/Object;I)V")
    pick("Lvy4;","onStart").addInstructions(0,"invoke-static/range {p0 .. p1}, $SPEAKER->utteranceStart(Ljava/lang/Object;Ljava/lang/String;)V")
    mapOf("onDone" to "utteranceDone", "onError" to "utteranceError", "onStop" to "utteranceStopped").forEach { (name,hook) ->
        val m=pick("Lvy4;",name)
        val last=if(name=="onStop")"p2" else "p1"
        val args=if(name=="onStop")"Ljava/lang/Object;Ljava/lang/String;Z" else "Ljava/lang/Object;Ljava/lang/String;"
        m.addInstructionsWithLabels(0,"""
            invoke-static/range {p0 .. $last}, $SPEAKER->$hook($args)Z
            move-result v0
            if-eqz v0, :vela_native_utterance
            return-void
        """,ExternalLabel("vela_native_utterance",m.getInstruction(0)))
    }
}
