package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import java.security.MessageDigest
import org.ungoogled.patches.maps.car.validateMapsGuidanceComponent

private const val COORDINATOR="Lorg/ungoogled/ui/MapsGuidanceCoordinator;"
internal data class MapsVoiceContract(val registers:Int,val count:Int,val flags:Int,val hash:String)
internal val mapsVoiceContracts=mapOf(
    "Lbnah;->d(Lbnas;)V" to MapsVoiceContract(2, 4, 17, "298ac9e09fde197a90f77c1ed279b983fb546b687c2f99c7c7bb11321b826fd7"),
    "Lbnah;->l()V" to MapsVoiceContract(1, 1, 17, "68765955a2c6d9354c6580a44f21ae36aecd36ae0a9cd37eb19693b31b2a6fdd"),
    "Lbnaq;->d(Lbnas;)V" to MapsVoiceContract(5, 22, 17, "037f1b356b4619c4d6f662df662e307d2cacf37b3c66b17cc175edd569cee192"),
    "Lbnaq;->l()V" to MapsVoiceContract(1, 1, 17, "68765955a2c6d9354c6580a44f21ae36aecd36ae0a9cd37eb19693b31b2a6fdd"),
    "Lbjpk;->b()D" to MapsVoiceContract(3, 4, 17, "3c9291786f5e654838ec79a10e38d21eb8deacbd51d1cfd010327d9825e69f4d"),
    "Lbjpk;->d()D" to MapsVoiceContract(3, 4, 17, "c642f4e700eff6a9809fa075cce40ab651b3a9a0cd622a81f4e19e6ce32518c4"),
    "Lbjpp;->g()I" to MapsVoiceContract(1, 4, 17, "6e53f5c88a3bf25f12cc55fd8f37ee56d886c85479ce04ef9d8faed7176fe95e"),
    "Lbjpp;->n(I)Lbjpk;" to MapsVoiceContract(7, 16, 17, "f734404649d967128ba549b24159d4042a745e04e3d3699d2eefc16cb2827bdd"),
    "Lblvb;-><init>(Lblva;)V" to MapsVoiceContract(4, 43, 65537, "1c7cfab626bb49800de012dfe1e8fbb21a0f7badd6ec97a8695517131e88baee"),
    "Lycj;-><init>(Lyce;)V" to MapsVoiceContract(20, 465, 65537, "19ffcc8b30893907295016ad9ff40f5798c8293182be97e2b62e3cc91fec8364"),
    "Lbmyh;->g(Lbnbc;I)Z" to MapsVoiceContract(7, 66, 17, "b4a62b52cf33e5c34b5691270852bacac5cc33e15d50d0f6d53d51f84fc06068"),
    "Lbmxs;->r(Lbnay;Lbnat;)V" to MapsVoiceContract(3, 5, 8, "b00048cac3920989589dd2b0ef600854d75e461d6ae303638d75afc4512cafe3"),
    "Lbnad;->e(Lbnau;)V" to MapsVoiceContract(3, 5, 17, "0faa787367d290e7510593b46f777dbe012c55c77e48d8c47e09ab3b3571c83c"),
    "Lbmxr;->b(Ljava/lang/Object;)V" to MapsVoiceContract(3, 30, 4177, "1c586ace15c00a81a9b12512bfdcd532d309fa879e860f184bea0eccd1cc7d6b"),
    "Lbmxs;->C()Z" to MapsVoiceContract(2, 8, 17, "fc347780408561a89fc3c3f680a893770749d299887887e8f579cb6846d568f2"),
    "Lbmxs;->k(Lbncc;Lbnbc;Lbnau;Lbnay;)Lcom/google/common/util/concurrent/ListenableFuture;" to MapsVoiceContract(26, 123, 17, "2b9bc1a6d382af922dd5d51354b80f8819633f7dec85202d56c3a9402e2f8282"),
    "Lbmxs;->l(Lbnav;)V" to MapsVoiceContract(5, 7, 17, "2e6630a7a34a8936724bfe6702931dee1e8daaaa8111426ad712d72c78212321"),
    "Lbmxs;->m()V" to MapsVoiceContract(3, 6, 17, "93ff4aa557fd748821679df47f8ae554f016574338efa2d5d612ee20e401da4a"),
    "Lbmxs;->n()V" to MapsVoiceContract(3, 18, 17, "dc468c0333eba0b8480c76851c56de560b58474fa0fa56f56f7c432bd1641b4b"),
    "Lbmxs;->o()V" to MapsVoiceContract(2, 3, 17, "0df87432ee78b5465460cf482e54e5109702c44738745d9f420f00bc9382c55c"),
    "Lbmxs;->p(Lbnad;)V" to MapsVoiceContract(6, 26, 17, "f0053343351c6847831936d3709e43864e1c3c81986dcd768ee65f4203249b30"),
    "Lbmxs;->z(Lbnad;)V" to MapsVoiceContract(5, 23, 17, "f26fba19100f3816395ed06a7ec4b715470dd76773c05c9740954e6f69ca5bc7"),
    "Lbmxs;->A(Lbnax;)V" to MapsVoiceContract(5, 12, 17, "1b0928ef5db4ff86988450764b22681de18c291a47a39204e5a66721cecbd579"),
    "Lbmzd;->d(Lbnas;)V" to MapsVoiceContract(5, 37, 131089, "2c4316bc33f2f0f2c4bdcdb9e44854537602e99fff449bb2d34424c410dc03ed"),
    "Lbmzd;->g()V" to MapsVoiceContract(4, 16, 16, "12447ec4820b97b0d8a6a741291d6c9963f9d23aed47ccab7ea40b0be395b75d"),
    "Lbmzd;->l()V" to MapsVoiceContract(1, 2, 17, "b3ef66fea3702b032f747bb51b19211a6adab53247b1535ef12d381cba5e860d"),
    "Lbmzi;->b()Lbnbf;" to MapsVoiceContract(2, 16, 131089, "9d60fa898b1ac97fd85870368013b550d36bfd08195a4cb6830206b53ac0b6dd"),
    "Lbmzi;->c()Lbnbf;" to MapsVoiceContract(2, 20, 131089, "5f0b956a0fb16d5b04c9314d71aa502fdcdd4eafe8a3ae872091b0583fbca24b"),
    "Lbmzi;->l(Lbnbc;)Z" to MapsVoiceContract(3, 18, 131089, "ce37198891cf63156754f4fa053a10add2f79d6ca6b97e5ae780e89d8078f50e"),
    "Lbmzw;->b(Ljava/lang/Object;)V" to MapsVoiceContract(2, 8, 4177, "5ccacc3b1880960679e33850366a660ccc646f08b27ef0a23da7ecaab0e7ae25"),
    "Lbmyo;->b(Ljava/lang/Object;)V" to MapsVoiceContract(19, 526, 4113, "04302b3ab2fb565c42a5046ce07af2dc6c7a4cc42a607c52f793a50bad706718"),
    "Lbmzz;->a(Lbnau;)V" to MapsVoiceContract(4, 35, 17, "423721b487ed75e3d94f085edf5fc968246cc71a9a5e713b1c521bf1e9e2a601"),
    "Lbmzz;->b(Lbnau;)V" to MapsVoiceContract(5, 19, 17, "874d06fc734e90c696a0a4daa48f59de548ba957490443b64ddc22c41d4f776d"),
    "Lbnad;->d()V" to MapsVoiceContract(4, 11, 16, "a6c3be982d9757ab2219c3980ef7550f3a0885d5015dd85a684424d4cece221e"),
    "Lbnad;->g()V" to MapsVoiceContract(3, 7, 17, "088c4ad7931669ab7a42f4d24ad6d1b08bcf5ddbeb41f3a3521702fd4a03c765"),
    "Lbnad;->h()V" to MapsVoiceContract(3, 8, 17, "49dc200e5d94a647d67855f5fdc6be4fc67e0a5ff312881d1a08c189f1fd6b9c"),
    "Lbnax;-><clinit>()V" to MapsVoiceContract(13, 40, 65544, "5bdf91463818bdb55b6d3b603592ae92847c7bf38bcb08e3082ad0a93de23e49"),
    "Lbnbc;-><clinit>()V" to MapsVoiceContract(34, 324, 65544, "fb0ce9d4895a05293b149c70d1c9ae620a9087817b2ddae11b8ae92190e484d4"),
    "Lbnbf;-><clinit>()V" to MapsVoiceContract(7, 22, 65544, "35c9e6aca2b0ce6da83bdca7237fb96ca98db50f915c374600321135012725fc"),
    "Lbmon;-><init>(Lbmnv;Lbmoa;Landroid/content/Context;Lbnkt;Lcqvj;Lcqvj;Ljava/util/concurrent/Executor;Lazqf;Lawxs;Lbmkk;)V" to MapsVoiceContract(14, 41, 65537, "6323aafae395825a01d23eb2543fc3e3dfea21cd09db169a01d7a9596df4b1ed"),
    "Lbmon;->u(Lycx;)V" to MapsVoiceContract(6, 44, 17, "7b8f49115e961a51f5179f2ba8d1d852fd75b0e252fa82ed035122ec8f327369"),
    "Lbmon;->v()V" to MapsVoiceContract(2, 10, 17, "d02d46d4105767f96dbdb132bfc6c11f7c7abe340fc027c389d022a38e7072e5"),
    "Lbmza;->d(Lbnas;)V" to MapsVoiceContract(6, 17, 17, "b068b41d4557feb104ae4fdff3c50fb3ad945a27d66ab22ae58a6fc28fd55327"),
    "Lbmza;->l()V" to MapsVoiceContract(4, 9, 17, "fbbfe3f0ed4e9e8f690985b0b9f4a12f4e4a3e74a42d65d810b801fa6f8b990c"),
    "Lbnam;->d(Lbnas;)V" to MapsVoiceContract(4, 12, 17, "cae750d277cc77852bcd8f90b99dae25b77e57c3619b11250e9150402b605a8d"),
    "Lbnam;->l()V" to MapsVoiceContract(2, 6, 17, "d97a21cac1e9342cc2255925ebdde042b1924ed9e865f477c55e485be0bc3ed1"),
    "Lnsm;->rS()Ljava/lang/Object;" to MapsVoiceContract(1, 5, 17, "2af359c4e550217514d5b3b978949e6852cfb9a8baf98c1def15594d6db8c6ad"),
    "Lnsn;->n()Lcqwl;" to MapsVoiceContract(1, 2, 17, "5c4cc1f086998c11ac008e9f220510382f70c231561f03a77fc41318ce7139d7"),
    "Lcqwl;->rS()Ljava/lang/Object;" to MapsVoiceContract(4, 25, 17, "22f2e80d4da8139b17fa6a3af334ab8dea7148528967cf3ed2e0f936a0e15793"),
    "Lnjz;->jd()V" to MapsVoiceContract(4, 141, 18, "6a79f5b7e45013834fc9a9aba4e595802cd39ec625244b072f0e8f285e924631"),
    "Lnjy;->i()Ljava/lang/Object;" to MapsVoiceContract(26, 2064, 18, "7e35dff5b9297ec7cf3298a2eb91d9659ae745f87e169ac36a94d5200aeda37d"),
)

/** Same primitive JSON body representation as the independent original-DEX inspector. */
internal fun mapsVoiceFingerprint(method:Method):String {
    val body=method.implementation ?: error("Missing Maps voice body")
    val rows=mutableListOf<Any?>()
    body.instructions.forEach { i ->
        // Opcode exposes a lowercase mnemonic field also named `name`; the oracle uses Enum.name().
        val row=mutableListOf<Any?>(i.opcode.toString(),i.codeUnits)
        if(i is OneRegisterInstruction)row.add(listOf("a",i.registerA))
        if(i is TwoRegisterInstruction)row.add(listOf("b",i.registerB))
        if(i is ThreeRegisterInstruction)row.add(listOf("c",i.registerC))
        if(i is FiveRegisterInstruction)row.add(listOf("invoke",i.registerCount,i.registerC,i.registerD,i.registerE,i.registerF,i.registerG))
        if(i is RegisterRangeInstruction)row.add(listOf("range",i.startRegister,i.registerCount))
        if(i is WideLiteralInstruction)row.add(listOf("literal",i.wideLiteral))
        if(i is OffsetInstruction)row.add(listOf("offset",i.codeOffset))
        if(i is ReferenceInstruction)row.add(listOf("reference",i.reference.toString()))
        if(i is DualReferenceInstruction)row.add(listOf("reference2",i.reference2.toString()))
        if(i is SwitchPayload)i.switchElements.forEach { row.add(listOf("switch",it.key,it.offset)) }
        if(i is ArrayPayload)row.add(listOf("array",i.elementWidth,i.arrayElements))
        rows.add(row)
    }
    body.tryBlocks.forEach { b -> rows.add(listOf("try",b.startCodeAddress,b.codeUnitCount,b.exceptionHandlers.map { listOf(it.exceptionType,it.handlerCodeAddress) })) }
    fun json(value:Any?):String=when(value) {
        null -> "null"
        is String -> buildString {
            append('"');value.forEach { c -> when(c) {
                '"' -> append("\\\"")
                '\\' -> append("\\\\")
                '\b' -> append("\\b")
                '\u000c' -> append("\\f")
                '\n' -> append("\\n")
                '\r' -> append("\\r")
                '\t' -> append("\\t")
                else -> if(c<' ' || c=='\u2028' || c=='\u2029')append("\\u%04x".format(c.code)) else append(c)
            } };append('"')
        }
        is Iterable<*> -> value.joinToString(",","[","]") { json(it) }
        else -> value.toString()
    }
    return MessageDigest.getInstance("SHA-256").digest(json(rows).toByteArray(Charsets.UTF_8)).joinToString(""){"%02x".format(it.toInt() and 255)}
}

internal fun validateMapsWarningVoice(classes:Iterable<ClassDef>):Map<String,Method> {
    val byType=classes.associateBy { it.type }
    validateMapsGuidanceComponent { byType.getValue(it) }
    listOf(
        Triple("Lnjz;","hU","Lcqya;"),
        Triple("Lbmxs;","f","Lbmzi;"),
        Triple("Lbmxs;","j","Ljava/util/concurrent/Executor;"),
        Triple("Lbmxs;","p","Lbnad;"),
        Triple("Lbmxs;","q","Lbnad;"),
        Triple("Lbnad;","s","Ljava/util/concurrent/atomic/AtomicBoolean;"),
        Triple("Lbnad;","w","Lbnas;"),
        Triple("Lbmzz;","a","Lbnad;"),
        Triple("Lbmon;","a","Lcqvj;"),
        Triple("Lbmon;","b","Lcqvj;"),
        Triple("Lbmon;","d","Landroid/content/Context;"),
        Triple("Lbmon;","c","Lbmnv;"),
        Triple("Lbmon;","e","Lblvb;"),
        Triple("Lbmon;","o","Lycx;"),
        Triple("Lbmzd;","a","Landroid/media/MediaPlayer;"),
        Triple("Lbnam;","a","Lbnau;"),
        Triple("Lbmza;","a","[Lbnau;"),
    ).forEach { (owner,name,type) ->
        check(byType.getValue(owner).fields.count { it.name==name && it.type==type }==1) { "Changed Maps warning field $owner->$name" }
    }
    listOf(Triple("Lblvb;","b","Lycj;"),Triple("Lycj;","k","Lbjpp;")).forEach { (owner,name,type) ->
        check(byType.getValue(owner).fields.count { it.name==name && it.type==type }==1) { "Changed Maps native route geometry field $owner->$name" }
    }
    return mapsVoiceContracts.mapValues { (descriptor,c) ->
        val m=byType.getValue(descriptor.substringBefore("->")).methods.single { it.toString()==descriptor }
        check(m.accessFlags==c.flags && m.implementation?.registerCount==c.registers && m.implementation!!.instructions.count()==c.count && mapsVoiceFingerprint(m)==c.hash) { "Changed or already patched Maps warning voice $descriptor" }
        m
    }
}

context(context:BytecodePatchContext)
internal fun bindMapsWarningVoice() {
    val bindingTypes=listOf("Lcom/google/android/apps/gmm/base/app/GoogleMapsApplication;", "Lnsn;", "Lngb;", "Lnsm;", "Lcqwl;", "Lnjz;", "Lblra;")
    val classes=(mapsVoiceContracts.keys.map { it.substringBefore("->") }+bindingTypes).distinct().map { context.classDefBy(it) }
    val originals=validateMapsWarningVoice(classes)
    val methods=originals.keys.associateWith { descriptor -> context.mutableClassDefBy(descriptor.substringBefore("->")).methods.single { it.toString()==descriptor } }
    val extension=context.mutableClassDefBy(COORDINATOR)
    listOf("dispatch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V", "terminal(Ljava/lang/Object;Ljava/lang/Object;)V", "captureRoute(Ljava/lang/Object;)V", "routeEnded(Ljava/lang/Object;)V", "hooksInstalled()Z", "requestNativeFocus(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I", "cancelPreparedCallback(Ljava/lang/Object;)Z").forEach { signature ->
        check(extension.methods.count { it.toString()=="$COORDINATOR->$signature" }==1) { "Missing Maps warning extension $signature" }
    }
    val replay=context.classDefBy(MAPS_NATIVE_REPLAY)
    check(replay.methods.count { it.name==MAPS_CAN_RESUME_VOICE && it.parameterTypes.isEmpty() && it.returnType=="Z" }==1 &&
        replay.methods.count { it.name==MAPS_RESUME_VOICE && it.parameterTypes.isEmpty() && it.returnType=="V" }==1) {
        "Missing Maps native voice-only recovery interface"
    }
    bindMapsVoiceResume(context.mutableClassDefBy("Lbmon;"),originals.getValue("Lbmon;->u(Lycx;)V"))
    bindMapsNativeVoice(methods)
    val installed=extension.methods.single { it.name=="hooksInstalled" }
    installed.replaceInstruction(0,"const/4 v0, 0x1")
}

internal fun bindMapsNativeVoice(methods:Map<String,MutableMethod>) {
    fun pick(owner:String,name:String)=methods.values.single { it.definingClass==owner && it.name==name }
    val dispatch=pick("Lbmyo;","b")
    val anchors=dispatch.instructions.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString()=="Lbnau;->d(Lbnas;)V" }
    check(anchors.size==1)
    val at=anchors.single().index;val call=anchors.single().value as FiveRegisterInstruction
    check(at==366 && call.registerCount==2 && call.registerC==1 && call.registerD==3)
    check((dispatch.instructions[at-1] as ReferenceInstruction).reference.toString()=="Lbnad;->w:Lbnas;")
    check((dispatch.instructions[at-1] as TwoRegisterInstruction).registerB==0)
    // Replace the existing invoke so all incoming branches run the final asynchronous fence.
    dispatch.replaceInstruction(at,"invoke-static {v0, v1, v3}, $COORDINATOR->dispatch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
    dispatch.addInstructionsWithLabels(0,"""
        invoke-static/range {p0 .. p0}, $COORDINATOR->cancelPreparedCallback(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :maps_native_ready_callback
        return-void
    """,ExternalLabel("maps_native_ready_callback",dispatch.getInstruction(0)))
    val focus=pick("Lbmyh;","g")
    val outline="Laq\$\$ExternalSyntheticApiModelOutline0;->m\$1(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I"
    val focusAt=focus.instructions.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString()==outline }.single().index
    val focusCall=focus.instructions[focusAt] as FiveRegisterInstruction
    check(focusCall.registerCount==2 && focus.instructions[focusAt].opcode==Opcode.INVOKE_STATIC)
    focus.replaceInstruction(focusAt,"invoke-static {v${focusCall.registerC}, v${focusCall.registerD}}, $COORDINATOR->requestNativeFocus(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I")
    pick("Lbmzz;","a").addInstruction(0,"invoke-static/range {p0 .. p1}, $COORDINATOR->terminal(Ljava/lang/Object;Ljava/lang/Object;)V")
    val route=pick("Lbmon;","<init>")
    route.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }.reversed().forEach { route.addInstruction(it,"invoke-static/range {p0 .. p0}, $COORDINATOR->captureRoute(Ljava/lang/Object;)V") }
    pick("Lbmon;","v").addInstruction(0,"invoke-static/range {p0 .. p0}, $COORDINATOR->routeEnded(Ljava/lang/Object;)V")
}
