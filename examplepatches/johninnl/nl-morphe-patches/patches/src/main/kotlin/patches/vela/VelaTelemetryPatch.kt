package patches.vela

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val UI = "Lnl/johninnl/vela/NativeUi;"
private const val RUNTIME = "Lnl/johninnl/vela/TelemetryRuntime;"
private const val CAR = "Lnl/johninnl/vela/CarUi;"
private const val STATE = "Lu13;"
internal data class Contract(val registers: Int, val count: Int, val flags: Int, val hash: String)

/** Captured from the supplied publisher-signed 0.5.2621 DEX, not the unobfuscated source. */
internal val velaContracts = mapOf(
    "Ldl2;->g(Lapp/vela/core/model/LatLng;Ljava/lang/Double;)V" to Contract(19, 159, 17, "656d43af1ac1cc295cf1e431fac83c16df85b74578d276b99f1c8a0483e205eb"),
    "Ldl2;->j()V" to Contract(14, 117, 17, "58e5a81d7d6a98874edbb2196727b2c68be099e16c589949f361b006b499b2a8"),
    "Ldl2;->p(Lapp/vela/core/model/Route;)V" to Contract(15, 79, 17, "f07645f1e390d061738d398cee894bf07c73a918342f6a85e33ee917afce3f1c"),
    "Llk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to Contract(250, 1610, 17, "ae92064e9e193d7d98a38b136123060d96ca14d42215df5e37ace7bf32258dce"),
    "Lp0;->invoke()Ljava/lang/Object;" to Contract(5, 161, 17, "e8cb6290b05db3ff9caa1f81a9afb7e414dcbc5f157b250965db9d9f7e82a28d"),
    "Lal2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to Contract(233, 366, 17, "282dcf7d9fb3def3a2c0f10c5f0c3af05ff545617806cec5a95af7620a50fd41"),
    "Ltd2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to Contract(247, 1574, 17, "c2fdc79aa59c18657fca05ec2f5e9873d31c0dfccddfa250e79c2cf089a950aa"),
    "Lvk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to Contract(236, 763, 17, "9673b39d51329c38e256655aa68916dd9398ffe71370a67209cf624f800c55f4"),
    "Lyw1;-><init>(Landroid/content/Context;Lxg0;)V" to Contract(4, 29, 65537, "9127401aaaa636dbf4df993eb0c8749e443fd7c2dc1b1bebbee8b6812755124b"),
    "Lz4;->a(Landroid/location/Location;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to Contract(49, 551, 1, "4e7629ce2d2cb1085ca5f6d8f178c6e969e37caf1413285b1a6c8147a6ef56f5"),
    "Lapp/vela/service/NavigationService;->onCreate()V" to Contract(3, 21, 17, "7f4d7245d98995a79746789eab09a04db09778a5efeda46810d96d4e1e4467fa"),
    "Lapp/vela/service/NavigationService;->onDestroy()V" to Contract(3, 5, 17, "61d10a5414426609685b17382ecc4148569cd5bb2c57f97e6a75b0bdb3d7972f"),
    "Lxo2;-><init>(Lsz1;Lwy4;Lz81;Lxg0;)V" to Contract(19, 74, 65537, "13fbbc002adf86021517259fe8e002463fe65abb127ad1fa98f4fd30ed0b5689"),
    "Lapp/vela/VelaApp;->onCreate()V" to Contract(20, 1241, 17, "f70cd0e2bdae04db9cb40e8590105d23f2b944666da4776e8332fec6cca83876"),
    "Lcw;->b(Landroid/graphics/Canvas;Lorg/maplibre/android/snapshotter/MapSnapshot;FF)V" to Contract(16, 163, 17, "a07b364a681f1b46d982d0642ba8a690bf296a7dbd39e5d87c8c6216706091f0"),
    "Lcw;->g(Landroid/graphics/Canvas;)V" to Contract(24, 198, 17, "a6be0960ec06232a957ee5bdf6a81c918774bc1a5be3d6279e3e968a3d9242ce"),
    "Lde2;->A2(DDDDD)V" to Contract(250, 932, 17, "3744b0ff9665f6af6f1531876cacf70cf6bc0682016cd56400b89da252c39c32"),
    "Lde2;->B2(Ljava/util/List;ILapp/vela/core/model/LatLng;Lapp/vela/core/model/LatLng;Lapp/vela/core/model/TravelMode;Ljava/util/List;ZZZ)V" to Contract(24, 32, 17, "527f46361fb3e22acccc9eb86e03c42b58705570b07ce2ab7bd096d5241aa131"),
    "Lhw;->k()Lse4;" to Contract(6, 82, 17, "6b434cabcf3716115e64900a7d461eba9f1f0d6bc84cfc8b5f70ccc2f2095147"),
    "Loc2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to Contract(257, 1275, 17, "d3f024c30c2c37833abc5c525777d6398411db6e979b65676279c2ef85bfba28"),
    "Loi;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;" to Contract(46, 1473, 17, "ccade43b92f35dc1b2039981a179d21ee407e7e0d6fe6b25689ba79dc30b5df0"),
    "Lq72;->Q(Le82;ZZLjava/lang/Double;ZFFLr11;Le50;I)V" to Contract(38, 240, 25, "df96da606c3a1fd2417388fabc18d9ee68d515668fe7fca421342d734cf70957"),
    "Lq72;->p(Lde2;Lr11;Lr11;Le50;I)V" to Contract(217, 7862, 25, "fc0ef6f18af8c08b0382a35e094a8b4a084d474a684fedc5ea03768f3eba610f"),
    "Lq72;->x0(Ljava/lang/Float;Ljava/lang/Double;ZLlg2;Le50;I)V" to Contract(32, 272, 25, "2648bec9bcd9227d2abf64613ba89fa2d63c4b351a549b94ad1a9ab562a5237e"),
    "Ls42;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;" to Contract(32, 277, 17, "67b11239916a2e1be944e7279685b8fc7f7c4b2155de913a3f0d99e70ad57aee"),
    "Lvw1;->onLocationChanged(Landroid/location/Location;)V" to Contract(15, 106, 17, "06290865145f8ad8721fa41674de2b9dced6b6e2680b44be93111c4681112355"),
    "Lwy4;-><init>(Landroid/content/Context;)V" to Contract(3, 34, 65537, "56ca2197a311289f28f1dd470d09ec0ddb354f1c842477c9c5db164add562eaf"),
)

/** Verify the existing R8-merged native chime runnable without making its class mutable. */
private val velaReadOnlyContracts = mapOf(
    "La9;->run()V" to Contract(29, 1259, 17, "069059cd3d8b8a7ed250639a66bb28d364ba1a2c38b19836250379a03b684a73"),
)

private val flockFields = mapOf(
    "Lpw0;->a:Lu13;" to "effectiveFlock",
    "Ltw0;->a:Lu13;" to "effectiveFlockRoute",
    "Lrw0;->a:Lu13;" to "effectiveFlockDetour",
    "Lsw0;->a:Lu13;" to "effectiveFlockCard",
    "Lsw0;->b:Lu13;" to "effectiveFlockVoice",
)
private val flockReaders = mapOf(
    "Lsw0;->a()Z" to mapOf("Lsw0;->a:Lu13;" to 1, "Lsw0;->b:Lu13;" to 1),
    "Lsw0;->b(Landroid/content/Context;Z)V" to mapOf("Lsw0;->a:Lu13;" to 1),
    "Lsw0;->c(Landroid/content/Context;Z)V" to mapOf("Lsw0;->b:Lu13;" to 1),
    "Ldl2;->g(Lapp/vela/core/model/LatLng;Ljava/lang/Double;)V" to mapOf("Lsw0;->a:Lu13;" to 1, "Lsw0;->b:Lu13;" to 1),
    "Llk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to mapOf("Lsw0;->a:Lu13;" to 1, "Lsw0;->b:Lu13;" to 1),
    "Lp0;->invoke()Ljava/lang/Object;" to mapOf("Lsw0;->a:Lu13;" to 1, "Lsw0;->b:Lu13;" to 1),
    "Lapp/vela/VelaApp;->onCreate()V" to flockFields.keys.associateWith { if(it == "Lsw0;->a:Lu13;") 2 else 1 },
    "Llp1;->s(Landroid/content/Context;Lr11;Lsi2;Lsi2;Z)V" to mapOf("Ltw0;->a:Lu13;" to 1, "Lsw0;->a:Lu13;" to 1),
    "Lcw;->b(Landroid/graphics/Canvas;Lorg/maplibre/android/snapshotter/MapSnapshot;FF)V" to mapOf("Lpw0;->a:Lu13;" to 1),
    "Lde2;->A2(DDDDD)V" to mapOf("Lpw0;->a:Lu13;" to 1),
    "Lde2;->B2(Ljava/util/List;ILapp/vela/core/model/LatLng;Lapp/vela/core/model/LatLng;Lapp/vela/core/model/TravelMode;Ljava/util/List;ZZZ)V" to mapOf("Ltw0;->a:Lu13;" to 1),
    "Lf1;->k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;" to flockFields.keys.associateWith { 1 },
    "Loc2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to mapOf("Lrw0;->a:Lu13;" to 1),
    "Lq72;->p(Lde2;Lr11;Lr11;Le50;I)V" to mapOf("Lpw0;->a:Lu13;" to 1),
    "Lsa0;->c(ILe50;)V" to mapOf("Ltw0;->a:Lu13;" to 1),
    "Ltw0;->a(Landroid/content/Context;Z)V" to mapOf("Ltw0;->a:Lu13;" to 1),
    "Lu72;->invoke(Ljava/lang/Object;)Ljava/lang/Object;" to mapOf("Lpw0;->a:Lu13;" to 2, "Lrw0;->a:Lu13;" to 2),
    "Lzk4;->invoke()Ljava/lang/Object;" to mapOf("Ltw0;->a:Lu13;" to 1),
)

private const val FLOCK_ANY = "Lsw0;->a()Z"
private val flockAnyReaders = mapOf(
    "Ldl2;->g(Lapp/vela/core/model/LatLng;Ljava/lang/Double;)V" to 1,
    "Ldl2;->p(Lapp/vela/core/model/Route;)V" to 1,
    "Llk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;" to 1,
    "Lzk4;->invoke()Ljava/lang/Object;" to 1,
)
private val effectiveFields = listOf("effectiveFlock", "effectiveFlockRoute", "effectiveFlockDetour", "effectiveCarSpeed", "effectiveFlockCard", "effectiveFlockVoice")

/** Complete reader inventory keeps preference controls/holders distinct from transient consumers. */
internal fun validateVelaContracts(classes: Iterable<ClassDef>): Map<String, Method> {
    val contracts = velaContracts + velaReadOnlyContracts
    val found = mutableMapOf<String, Method>()
    val readers = mutableMapOf<String, Map<String, Int>>()
    val anyReaders = mutableMapOf<String, Int>()
    val types = mutableSetOf<String>()
    classes.forEach { cls ->
        check(types.add(cls.type)) { "Duplicate Vela class ${cls.type}" }
        cls.methods.forEach { method ->
            val descriptor = method.toString()
            contracts[descriptor]?.let { contract ->
                check(cls.sourceFile == VELA_MAP_ID && method.accessFlags == contract.flags &&
                    method.implementation?.registerCount == contract.registers &&
                    method.implementation!!.instructions.count() == contract.count &&
                    velaFingerprint(method) == contract.hash) { "Changed or already patched Vela contract $descriptor" }
                check(found.put(descriptor, method) == null) { "Duplicate Vela method $descriptor" }
            }
            val refs = (method.implementation?.instructions ?: emptyList()).filter { it.opcode == Opcode.SGET_OBJECT }
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString()?.takeIf(flockFields::containsKey) }
                .groupingBy { it }.eachCount()
            if (refs.isNotEmpty()) readers[descriptor] = refs
            val anyCount = (method.implementation?.instructions ?: emptyList()).count { (it as? ReferenceInstruction)?.reference?.toString() == FLOCK_ANY }
            if(anyCount > 0) anyReaders[descriptor] = anyCount
        }
    }
    check(found.keys == contracts.keys) { "Missing Vela contracts ${contracts.keys - found.keys}" }
    check(anyReaders == flockAnyReaders) { "Changed Vela Flock any-reader cohort: $anyReaders" }
    check(readers == flockReaders) { "Changed Vela Flock reader cohort: $readers" }
    return found
}

context(context: BytecodePatchContext)
private fun method(descriptor: String): MutableMethod =
    context.mutableClassDefBy(descriptor.substringBefore("->")).methods.single { it.toString() == descriptor }

internal fun validateVelaHostAbi(classes: Iterable<ClassDef>) {
    val byType = classes.associateBy { it.type }
    fun required(descriptor: String) {
        val owner = byType.getValue(descriptor.substringBefore("->"))
        check(owner.sourceFile == VELA_MAP_ID && owner.methods.count { it.toString() == descriptor } == 1) {
            "Changed Vela native ABI $descriptor"
        }
    }
    fun field(owner: String, name: String, type: String) {
        val cls = byType.getValue(owner)
        check(cls.sourceFile == VELA_MAP_ID && cls.fields.count { it.name == name && it.type == type } == 1) {
            "Changed Vela native field $owner->$name:$type"
        }
    }
    listOf(
        "Landroidx/compose/ui/layout/a;->d(Llg2;Lkotlin/jvm/functions/Function1;)Llg2;",
        "Lq72;->y0(Ljava/lang/String;Le50;I)V",
        "Landroidx/compose/ui/viewinterop/a;->a(Lkotlin/jvm/functions/Function1;Llg2;Lkotlin/jvm/functions/Function1;Le50;II)V",
        "Lsw0;->a()Z", "Lsw0;->b(Landroid/content/Context;Z)V", "Lsw0;->c(Landroid/content/Context;Z)V",
        "Lcg3;->getValue()Ljava/lang/Object;", "Lapp/vela/core/model/Route;->getPolyline()Ljava/util/List;",
        "Lapp/vela/core/model/LatLng;->getLat()D", "Lapp/vela/core/model/LatLng;->getLng()D",
        "Lla;->H(Le50;)Z", "Le50;->Y(I)Le50;", "Lu13;-><init>(Ljava/lang/Object;Lu34;)V",
        "Lu13;->getValue()Ljava/lang/Object;", "Lu13;->setValue(Ljava/lang/Object;)V",
        "Lfe2;->O(Ljava/lang/Object;Lu34;)Lu13;", "Lr11;->invoke()Ljava/lang/Object;",
        "Lez3;->e(Ljava/lang/String;Le50;I)V", "Lez3;->c(Ljava/lang/String;Le50;I)V",
        "Lez3;->f(Ljava/lang/String;ZLr11;Llg2;Le50;II)V",
        "Lez3;->i(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Ljava/lang/String;Llg2;Lu11;Le50;II)V",
        "Lez3;->b(ILe50;)V", "Lcw;->u()Landroid/graphics/Rect;", "Lcw;->l()Z",
        "Lnt3;-><init>(Landroidx/car/app/i;)V", "Lnt3;->j()V", "Lnt3;->i()Lpt3;",
        "Lpt3;->c(Lnt3;)V", "Lji1;-><init>()V", "Lji1;->a()Landroidx/car/app/model/ItemList;",
        "Lmq3;-><init>()V", "Lmq3;->c(Ljava/lang/String;)V", "Lmq3;->a(Ljava/lang/CharSequence;)V",
        "Lmq3;->b()Landroidx/car/app/model/Row;", "Lqv1;-><init>()V", "Lqv1;->a()Landroidx/car/app/model/ListTemplate;",
        "Lgv2;->onClick()V", "Lke;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V",
        "Landroidx/car/app/model/CarText;->create(Ljava/lang/CharSequence;)Landroidx/car/app/model/CarText;",
        "Landroidx/car/app/model/OnClickDelegateImpl;->create(Lgv2;)Lfv2;",
        "Landroidx/car/app/model/OnCheckedChangeDelegateImpl;->create(Lrj4;)Lev2;",
        "Landroidx/car/app/model/Toggle;-><init>(Lqj4;)V", "Lwy4;->j(Ljava/lang/String;ZZ)V",
        "Ldl2;->a(Ljava/lang/String;)V",
        "La9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V",
        "Ly03;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V",
    ).forEach(::required)
    listOf("Lpw0;", "Ltw0;", "Lrw0;", "Liw;", "Lgr4;").forEach { field(it, "a", STATE) }
    field("Lig2;", "a", "Lig2;")
    field("Lba4;", "g", "Lba4;"); field("Ler4;", "a", "Ler4;")
    listOf("l0", "m0", "n0", "o0", "p0").forEach { field("Lcw;", it, "Landroid/graphics/Paint;") }
    field("Lcw;", "h", "I"); field("Lcw;", "i", "I")
    field("Lnt3;", "f", "Landroidx/car/app/i;"); field("Lji1;", "a", "Ljava/util/ArrayList;")
    field("Lmq3;", "f", "Lfv2;"); field("Lmq3;", "e", "Landroidx/car/app/model/Toggle;"); field("Lmq3;", "h", "Z")
    field("Lqj4;", "a", "Lev2;"); field("Lqj4;", "b", "Z")
    field("Lqv1;", "d", "Landroidx/car/app/model/CarText;")
    field("Lqv1;", "e", "Landroidx/car/app/model/Action;")
    field("Lqv1;", "b", "Landroidx/car/app/model/ItemList;"); field("Lqv1;", "c", "Ljava/util/ArrayList;")
    field("Lsw0;", "a", STATE); field("Lsw0;", "b", STATE)
    field("Lyw1;", "e", "Lapp/vela/core/model/LatLng;"); field("Lyw1;", "f", "Z")
    field("Lxo2;", "f", "Lcg3;")
    field("Lwy4;", "n", "Z"); field("Lwy4;", "o", "Z")
    field("Le82;", "l1", "Z")
    field("Lno2;", "a", "Z"); field("Lno2;", "b", "Z"); field("Lno2;", "c", "Z")
    field("Lno2;", "d", "Lapp/vela/core/model/Route;")
    field("Lcw;", "p", "Lapp/vela/core/model/LatLng;"); field("Lcw;", "H", "J"); field("Lcw;", "c", "Lxo2;")
    field("Le82;", "k", "Lapp/vela/core/model/LatLng;"); field("Le82;", "h", "Lapp/vela/core/model/LatLng;")
    field("Le82;", "i", "Ljava/lang/Float;"); field("Le82;", "j", "Ljava/lang/Float;"); field("Le82;", "w", "Z")
    check(byType.getValue("Lqj4;").methods.none { it.name == "<init>" }) { "Changed Vela toggle allocation ABI" }
    check(byType.getValue("Lgv2;").accessFlags and AccessFlags.INTERFACE.value != 0)
    check(byType.getValue("Lr11;").accessFlags and AccessFlags.INTERFACE.value != 0)
}

context(context: BytecodePatchContext)
private fun guardNativeAbi() {
    // Keep extension Java decoupled from the host state runtime. Its fields are retyped below.
    val ui = context.classDefBy(UI)
    effectiveFields.forEach { name ->
        check(ui.fields.count { it.name == name && it.type == "Ljava/lang/Object;" && it.accessFlags and (AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) == (AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) && it.accessFlags and AccessFlags.FINAL.value == 0 } == 1)
    }
    context.classDefForEach { cls ->
        if (cls.type.startsWith("Lnl/johninnl/vela/")) check(cls.methods.none { m -> (m.implementation?.instructions ?: emptyList()).any {
            val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
            ref?.definingClass == UI && ref.name.startsWith("effective")
        } }) { "Vela effective native states must use reflective Java access: ${cls.type}" }
    }
    listOf(
        "$UI->flockAlertsAny()Z", "$UI->init(Landroid/app/Application;)V", "$UI->settings(Ljava/lang/Object;)V", "$UI->observe()V", "$UI->compactWidget(Ljava/lang/Object;Ljava/lang/Object;)Z",
        "$RUNTIME->nativeSample(Landroid/location/Location;)V", "$RUNTIME->bindLocationProvider(Ljava/lang/Object;)V",
        "$RUNTIME->bindNavSession(Ljava/lang/Object;)V", "$RUNTIME->setNavigationActive(Z)V",
        "$RUNTIME->carCurrentLabel(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;",
        "$RUNTIME->phoneState(Ljava/lang/Object;)V", "$RUNTIME->showSpeed(Z)Z", "$RUNTIME->speedMps(Ljava/lang/Float;)Ljava/lang/Float;",
        "$RUNTIME->phoneLimitKmh(Ljava/lang/Double;)Ljava/lang/Double;", "$RUNTIME->carSpeedMps(D)D",
        "$RUNTIME->speedKmh(Ljava/lang/Double;)Ljava/lang/Double;", "$RUNTIME->limitKmh(Ljava/lang/Double;)Ljava/lang/Double;",
        "$RUNTIME->carLimitKmh(Ljava/lang/Double;)Ljava/lang/Double;", "$RUNTIME->bindVoice(Ljava/lang/Object;)V", "$RUNTIME->fix(Landroid/location/Location;)V",
        "$CAR->settingsEntry(Ljava/lang/Object;Ljava/lang/Object;)V", "$CAR->compact(Ljava/lang/Object;Landroid/graphics/Canvas;)Z",
        "$RUNTIME->compactWarningText()Ljava/lang/String;",
    ).forEach { descriptor -> check(context.classDefBy(descriptor.substringBefore("->")).methods.count { it.toString() == descriptor && it.accessFlags and AccessFlags.STATIC.value != 0 } == 1) { "Missing Vela extension ABI $descriptor" } }
}

private fun guardRef(method: MutableMethod, index: Int, opcode: Opcode, reference: String) {
    val i = method.getInstruction(index)
    check(i.opcode == opcode && (i as? ReferenceInstruction)?.reference?.toString() == reference) {
        "Changed Vela semantic anchor $method @$index"
    }
}

internal data class FlockAlertMask(val method: String, val index: Int, val original: String, val replacement: String)
internal val flockAlertMasks = listOf(
    FlockAlertMask("Ldl2;->g(Lapp/vela/core/model/LatLng;Ljava/lang/Double;)V", 35, FLOCK_ANY, "$UI->flockAlertsAny()Z"),
    FlockAlertMask("Ldl2;->g(Lapp/vela/core/model/LatLng;Ljava/lang/Double;)V", 140, "Lsw0;->a:Lu13;", "$UI->effectiveFlockCard:$STATE"),
    FlockAlertMask("Ldl2;->g(Lapp/vela/core/model/LatLng;Ljava/lang/Double;)V", 148, "Lsw0;->b:Lu13;", "$UI->effectiveFlockVoice:$STATE"),
    FlockAlertMask("Ldl2;->p(Lapp/vela/core/model/Route;)V", 0, FLOCK_ANY, "$UI->flockAlertsAny()Z"),
    FlockAlertMask("Llk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 629, FLOCK_ANY, "$UI->flockAlertsAny()Z"),
    FlockAlertMask("Llk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 670, "Lsw0;->a:Lu13;", "$UI->effectiveFlockCard:$STATE"),
    FlockAlertMask("Llk2;->e(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 681, "Lsw0;->b:Lu13;", "$UI->effectiveFlockVoice:$STATE"),
    FlockAlertMask("Lp0;->invoke()Ljava/lang/Object;", 6, "Lsw0;->a:Lu13;", "$UI->effectiveFlockCard:$STATE"),
    FlockAlertMask("Lp0;->invoke()Ljava/lang/Object;", 13, "Lsw0;->b:Lu13;", "$UI->effectiveFlockVoice:$STATE"),
)
private fun validateVelaFlockAlertMasks(methods: Map<String, MutableMethod>) {
    flockAlertMasks.forEach { mask -> guardRef(methods.getValue(mask.method), mask.index,
        if(mask.original == FLOCK_ANY) Opcode.INVOKE_STATIC else Opcode.SGET_OBJECT, mask.original) }
}
/** Replace runtime reads and any-gates only. Never touch the original preference holder or its callers in UI. */
internal fun maskVelaFlockAlerts(methods: Map<String, MutableMethod>) {
    validateVelaFlockAlertMasks(methods)
    flockAlertMasks.forEach { mask ->
        val method=methods.getValue(mask.method)
        val original=method.getInstruction(mask.index)
        val code=if(mask.original == FLOCK_ANY) "invoke-static {}, ${mask.replacement}"
            else "sget-object v${(original as OneRegisterInstruction).registerA}, ${mask.replacement}"
        method.replaceInstruction(mask.index,code)
        check(method.getInstruction(mask.index).opcode == original.opcode && method.getInstruction(mask.index).codeUnits == original.codeUnits)
    }
}

/** Replacing the first instruction keeps incoming labels on the hook, including return joins. */
private fun prepend(method: MutableMethod, at: Int, hook: String, original: String) {
    val lines = hook.trimIndent().trim().lines()
    method.replaceInstruction(at, lines.first())
    method.addInstructions(at + 1, (lines.drop(1) + original).joinToString("\n"))
}

/** External-only speed/zone data joins the native final disjunction after its hide/preference gates. */
internal fun extendVelaSpeedGate(corner: MutableMethod) {
    val nativeShow = corner.getInstruction(180)
    val nativeContinue = corner.getInstruction(175)
    check(corner.getInstruction<OneRegisterInstruction>(160).registerA == 29 && corner.getInstruction(160).opcode == Opcode.IF_NEZ)
    check(corner.getInstruction<OneRegisterInstruction>(167).registerA == 3 && corner.getInstruction(167).opcode == Opcode.IF_EQZ)
    check(corner.getInstruction<OneRegisterInstruction>(168).registerA == 11 && corner.getInstruction(168).opcode == Opcode.IF_EQZ)
    corner.replaceInstruction(168, "const/4 v3, 0x0")
    corner.addInstructionsWithLabels(169, """
        invoke-static {v3}, $RUNTIME->showSpeed(Z)Z
        move-result v3
        if-nez v3, :vela_show_speed
        if-eqz v11, :vela_native_continue
    """, ExternalLabel("vela_show_speed", nativeShow), ExternalLabel("vela_native_continue", nativeContinue))
}

/** Use a dead local for the result; the original renderer starts by reloading it from p0. */
internal fun interceptVelaCarSpeed(carSpeed: MutableMethod) {
    val original = carSpeed.getInstruction(0)
    carSpeed.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, $CAR->compact(Ljava/lang/Object;Landroid/graphics/Canvas;)Z
        move-result v0
        if-eqz v0, :vela_original_car
        return-void
    """, ExternalLabel("vela_original_car", original))
}

/** Keep the original onGloballyPositioned modifier and restart scope; skip only the native card. */
internal fun interceptVelaPhoneSpeed(speed: MutableMethod) {
    guardRef(speed, 75, Opcode.INVOKE_STATIC, "Landroidx/compose/ui/layout/a;->d(Llg2;Lkotlin/jvm/functions/Function1;)Llg2;")
    check(speed.getInstruction(76).opcode == Opcode.MOVE_RESULT_OBJECT && speed.getInstruction<OneRegisterInstruction>(76).registerA == 16)
    guardRef(speed, 260, Opcode.INVOKE_VIRTUAL_RANGE, "Le50;->u()Lhh3;")
    // Restart closures must keep p1's original native limit, rather than an external override.
    prepend(speed, 260, "move-object/from16 v2, p1", "invoke-virtual/range {p4 .. p4}, Le50;->u()Lhh3;")
    val restart = speed.getInstruction(260)
    speed.replaceInstruction(77, "move-object/from16 v5, v16")
    speed.addInstructionsWithLabels(78, """
        invoke-static {v5, v14}, $UI->compactWidget(Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v5
        if-nez v5, :vela_speed_restart
        invoke-static {v14}, Lla;->H(Le50;)Z
    """, ExternalLabel("vela_speed_restart", restart))
}

/** Capture the real Screen immediately after ItemList.Builder construction, before R8 reuses p0. */
internal fun bindVelaCarSettings(settings: MutableMethod) {
    check(settings.implementation!!.registerCount == 6 && settings.parameterTypes.isEmpty())
    guardRef(settings, 0, Opcode.NEW_INSTANCE, "Lji1;")
    guardRef(settings, 1, Opcode.INVOKE_DIRECT, "Lji1;-><init>()V")
    guardRef(settings, 2, Opcode.IGET_OBJECT, "Lhw;->k:Lsv;")
    check(settings.getInstruction<OneRegisterInstruction>(0).registerA == 0)
    check(settings.getInstruction<TwoRegisterInstruction>(2).registerA == 1 && settings.getInstruction<TwoRegisterInstruction>(2).registerB == 5)
    // p0 is v5 here. At the former insertion point (74), v5 instead holds Action.BACK.
    prepend(settings, 2, "invoke-static {p0, v0}, $CAR->settingsEntry(Ljava/lang/Object;Ljava/lang/Object;)V",
        "iget-object v1, p0, Lhw;->k:Lsv;")
}

/** Keep the native preference, hold/rearm timers, voice mode and car toast; replace only comparison inputs. */
internal fun bindVelaSpeedingInputs(speeding: MutableMethod) {
    guardRef(speeding, 0, Opcode.SGET_OBJECT, "Ld54;->a:Lu13;")
    guardRef(speeding, 12, Opcode.IGET_OBJECT, "Le82;->t:Ljava/lang/Double;")
    guardRef(speeding, 14, Opcode.IGET_OBJECT, "Le82;->s:Ljava/lang/Double;")
    guardRef(speeding, 15, Opcode.IGET_OBJECT, "Le82;->j:Ljava/lang/Float;")
    guardRef(speeding, 26, Opcode.INVOKE_STATIC, "Landroid/os/SystemClock;->elapsedRealtime()J")
    check(speeding.getInstruction<OneRegisterInstruction>(23).registerA == 0)
    check(speeding.getInstruction(25).opcode == Opcode.CONST_4 && speeding.getInstruction<OneRegisterInstruction>(25).registerA == 0)
    check(speeding.getInstruction<TwoRegisterInstruction>(12).registerA == 1 && speeding.getInstruction<TwoRegisterInstruction>(14).registerA == 1)
    // Incoming branches (including the missing-native-speed path) must land on the overrides.
    prepend(speeding, 26, """
        invoke-static {v0}, $RUNTIME->speedKmh(Ljava/lang/Double;)Ljava/lang/Double;
        move-result-object v0
        invoke-static {v1}, $RUNTIME->limitKmh(Ljava/lang/Double;)Ljava/lang/Double;
        move-result-object v1
    """, "invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J")
}

internal fun bindVelaNavigationService(create: MutableMethod, destroy: MutableMethod) {
    val returns = create.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    check(returns.isNotEmpty())
    returns.reversed().forEach { at -> prepend(create, at, """
        const/4 v0, 0x1
        invoke-static {v0}, $RUNTIME->setNavigationActive(Z)V
    """, "return-void") }
    // Stop the voice scene even if native cancellation throws before its superclass completion.
    destroy.addInstructions(0, """
        const/4 v0, 0x0
        invoke-static {v0}, $RUNTIME->setNavigationActive(Z)V
    """)
}

internal fun bindVelaNavSession(constructor: MutableMethod) {
    val returns = constructor.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    check(returns.isNotEmpty())
    returns.reversed().forEach { at -> prepend(constructor, at,
        "invoke-static/range {p0 .. p0}, $RUNTIME->bindNavSession(Ljava/lang/Object;)V", "return-void") }
}

/** Observe original raw Location metadata before native UI smoothing, derivation or time fallback. */
internal fun bindVelaRawLocation(collector: MutableMethod) {
    if (collector.parameterTypes.first() == "Landroid/location/Location;") {
        collector.addInstructions(0, "invoke-static/range {p1 .. p1}, $RUNTIME->nativeSample(Landroid/location/Location;)V")
    } else {
        guardRef(collector, 2, Opcode.CHECK_CAST, "Landroid/location/Location;")
        check(collector.getInstruction<OneRegisterInstruction>(2).registerA == 1)
        collector.addInstructions(3, "invoke-static {v1}, $RUNTIME->nativeSample(Landroid/location/Location;)V")
    }
}

internal fun bindVelaLocationProvider(constructor: MutableMethod) {
    val returns = constructor.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    check(returns.isNotEmpty())
    returns.reversed().forEach { at -> prepend(constructor, at,
        "invoke-static/range {p0 .. p0}, $RUNTIME->bindLocationProvider(Ljava/lang/Object;)V", "return-void") }
}

@Suppress("unused")
val externalSpeedControlsPatch = bytecodePatch(
    name = "External speed controls",
    description = "Use De-Waze or Flitsmeister speed, limits, road warnings and partial average-zone progress in Vela and Android Auto, with native fallback and provider settings.",
    default = true,
) {
    compatibleWith(vela)
    dependsOn(originalInput, velaResources)
    extendWith("extensions/vela.mpe")
    extendWith { carProviderScreenDex() }
    execute {
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        validateVelaContracts(classes)
        validateVelaHostAbi(classes)
        guardNativeAbi()
        // Resolve the full cohort before changing a field, register, instruction or template.
        val resolved = velaContracts.keys.associateWith { method(it) }
        fun pick(owner: String, name: String) = resolved.values.single { it.definingClass == owner && it.name == name }
        val serviceCreate = pick("Lapp/vela/service/NavigationService;", "onCreate")
        val serviceDestroy = pick("Lapp/vela/service/NavigationService;", "onDestroy")
        val locationProvider = pick("Lyw1;", "<init>")
        val rawCollectors = listOf("Ltd2;", "Lal2;", "Lvk2;").map { pick(it, "e") } + pick("Lz4;", "a")
        val session = pick("Lxo2;", "<init>")
        val app = pick("Lapp/vela/VelaApp;", "onCreate")
        val speed = pick("Lq72;", "x0")
        val corner = pick("Lq72;", "Q")
        val content = pick("Ls42;", "invoke")
        val settings = pick("Loi;", "a")
        val carSettings = pick("Lhw;", "k")
        val carSpeed = pick("Lcw;", "g")
        val voice = pick("Lwy4;", "<init>")
        val speeding = pick("Ldl2;", "j")
        val fix = pick("Lvw1;", "onLocationChanged")
        rawCollectors.filter { it.parameterTypes.first() == "Ljava/lang/Object;" }.forEach {
            guardRef(it, 2, Opcode.CHECK_CAST, "Landroid/location/Location;")
            check(it.getInstruction<OneRegisterInstruction>(2).registerA == 1)
        }
        check(locationProvider.instructions.count { it.opcode == Opcode.RETURN_VOID } == 1)
        guardRef(speed, 7, Opcode.INVOKE_VIRTUAL, "Le50;->Y(I)Le50;")
        guardRef(corner, 9, Opcode.INVOKE_VIRTUAL, "Le50;->Y(I)Le50;")
        guardRef(content, 203, Opcode.INVOKE_STATIC, "Ljava/lang/String;->valueOf(I)Ljava/lang/String;")
        check(content.instructions.count { (it as? ReferenceInstruction)?.reference?.toString() == "Ljava/lang/String;->valueOf(I)Ljava/lang/String;" } == 1)
        guardRef(content, 273, Opcode.INVOKE_VIRTUAL, "Le50;->q(Z)V")
        guardRef(content, 274, Opcode.INVOKE_VIRTUAL, "Le50;->q(Z)V")
        check(settings.getInstruction<WideLiteralInstruction>(1018).wideLiteral == 0x7f0e0487L)
        guardRef(settings, 1019, Opcode.INVOKE_STATIC, "Ljr1;->y(ILe50;)Ljava/lang/String;")
        guardRef(settings, 1021, Opcode.SGET_OBJECT, "Lc54;->a:Lu13;")
        check((settings.getInstruction(1472) as SwitchPayload).switchElements.single { it.key == 5 }.offset == 412)
        guardRef(carSettings, 74, Opcode.INVOKE_VIRTUAL, "Lji1;->a()Landroidx/car/app/model/ItemList;")
        guardRef(carSpeed, 91, Opcode.INVOKE_STATIC, "Ljava/lang/String;->valueOf(I)Ljava/lang/String;")
        check(carSpeed.instructions.count { (it as? ReferenceInstruction)?.reference?.toString() == "Ljava/lang/String;->valueOf(I)Ljava/lang/String;" } == 3)
        guardRef(serviceCreate, 19, Opcode.INVOKE_SUPER, "Landroid/app/Service;->onCreate()V")
        guardRef(serviceDestroy, 3, Opcode.INVOKE_SUPER, "Landroid/app/Service;->onDestroy()V")
        guardRef(session, 29, Opcode.IPUT_OBJECT, "Lxo2;->f:Lcg3;")
        guardRef(carSpeed, 8, Opcode.IGET_WIDE, "Lcw;->q:D")
        guardRef(carSpeed, 70, Opcode.SGET_OBJECT, "Liw;->a:Lu13;")
        guardRef(carSpeed, 106, Opcode.IGET_OBJECT, "Lcw;->r:Ljava/lang/Double;")
        val substitutions = listOf(
            Triple(pick("Lcw;", "b"), 93, "Lpw0;->a:Lu13;"),
            Triple(pick("Lde2;", "A2"), 1, "Lpw0;->a:Lu13;"),
            Triple(pick("Lde2;", "B2"), 4, "Ltw0;->a:Lu13;"),
            Triple(pick("Loc2;", "invokeSuspend"), 682, "Lrw0;->a:Lu13;"),
            Triple(pick("Lq72;", "p"), 3137, "Lpw0;->a:Lu13;"),
        )
        substitutions.forEach { (m, index, reference) -> guardRef(m, index, Opcode.SGET_OBJECT, reference) }
        validateVelaFlockAlertMasks(resolved)
        val returns = listOf(app, voice).associateWith { m ->
            m.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.also { check(it.isNotEmpty()) }
        }
        // All guards passed. Retype only descriptor-only extension fields, then apply bounded edits.
        val ui = mutableClassDefBy(UI)
        effectiveFields.forEach { name ->
            val field = ui.fields.single { it.name == name }
            check(ui.fields.remove(field))
            field.type = STATE
            check(ui.fields.add(field))
        }
        substitutions.forEach { (m, index, reference) ->
            val register = m.getInstruction<OneRegisterInstruction>(index).registerA
            val units = m.getInstruction(index).codeUnits
            m.replaceInstruction(index, "sget-object v$register, $UI->${flockFields.getValue(reference)}:$STATE")
            check(m.getInstruction(index).codeUnits == units)
        }
        maskVelaFlockAlerts(resolved)
        // The giant MapScreen keeps precisely its original instruction count and register layout.
        check(pick("Lq72;", "p").instructions.size == 7862 && pick("Lq72;", "p").implementation!!.registerCount == 217)
        returns.getValue(app).reversed().forEach { prepend(app, it, "invoke-static/range {p0 .. p0}, $UI->init(Landroid/app/Application;)V", "return-void") }
        interceptVelaPhoneSpeed(speed)
        prepend(speed, 8, """
            invoke-static {}, $UI->observe()V
            invoke-static {v1}, $RUNTIME->speedMps(Ljava/lang/Float;)Ljava/lang/Float;
            move-result-object v1
            invoke-static {v2}, $RUNTIME->phoneLimitKmh(Ljava/lang/Double;)Ljava/lang/Double;
            move-result-object v2
        """, "and-int/lit8 v4, v15, 0x6")
        extendVelaSpeedGate(corner)
        prepend(corner, 10, "invoke-static {v1}, $RUNTIME->phoneState(Ljava/lang/Object;)V", "invoke-virtual {v13, v1}, Le50;->i(Ljava/lang/Object;)Z")
        prepend(settings, 1018, "invoke-static {v1}, $UI->settings(Ljava/lang/Object;)V", "const v0, 0x7f0e0487")
        bindVelaCarSettings(carSettings)
        interceptVelaCarSpeed(carSpeed)
        returns.getValue(voice).reversed().forEach { prepend(voice, it, "invoke-static/range {p0 .. p0}, $RUNTIME->bindVoice(Ljava/lang/Object;)V", "return-void") }
        bindVelaSpeedingInputs(speeding)
        bindVelaNavigationService(serviceCreate, serviceDestroy)
        bindVelaNavSession(session)
        bindVelaLocationProvider(locationProvider)
        rawCollectors.forEach(::bindVelaRawLocation)
        fix.addInstructions(0, "invoke-static/range {p1 .. p1}, $RUNTIME->fix(Landroid/location/Location;)V")
    }
}
