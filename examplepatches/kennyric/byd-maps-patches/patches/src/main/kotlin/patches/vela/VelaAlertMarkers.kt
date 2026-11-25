package patches.vela

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Vela's style setup: installs its own sources/layers, once per loaded phone map style. */
internal const val VELA_STYLE_SETUP = "Liw4;->f0(Lorg/maplibre/android/maps/l;Z)V"
internal const val VELA_MARKER_STYLE_HOOK = "Lnl/johninnl/vela/MapMarkers;->style(Ljava/lang/Object;)V"
private const val STYLE = "Lorg/maplibre/android/maps/l;"

/**
 * The R8-renamed MapLibre Style/Layer/Source members the phone marker layer calls reflectively,
 * captured from the publisher-signed 0.5.2621 DEX: l.a=addImage (delegating to c), l.d=addLayer,
 * l.h=addSource, l.n=getSource, l.v=loaded-style check, Layer.g=setProperties, xd3=PropertyValue.
 */
internal val velaMarkerContracts = mapOf(
    VELA_STYLE_SETUP to Contract(65, 2668, 25, "76f335f442c0f8722f4d4b00b5b7e73604de7a640092fcaccb969fdeebd30e5a"),
    "$STYLE->a(Ljava/lang/String;Landroid/graphics/Bitmap;)V" to Contract(3, 2, 17, "d076f6894a43a410ffaee6a3dc2ef7b18d5f5fa589ee9181cb15b659acb76f62"),
    "$STYLE->c(Ljava/lang/String;Landroid/graphics/Bitmap;)V" to Contract(4, 12, 17, "59e7dc557bec047f3702bc88d943a034991bfa69b24b8ab08176d9c2024c2bba"),
    "$STYLE->d(Lorg/maplibre/android/style/layers/Layer;)V" to Contract(3, 10, 17, "a1dbb1e4a8f2da18a7f21517ae506b66181edd428bc7deae9da3e46589a4dc70"),
    "$STYLE->h(Lorg/maplibre/android/style/sources/Source;)V" to Contract(3, 10, 17, "087662dec0acbf19d30b3af680f8f1c7f41d6a4e07d2cdb44a0970ac85f8380a"),
    "$STYLE->n(Ljava/lang/String;)Lorg/maplibre/android/style/sources/Source;" to Contract(3, 13, 17, "710290840c885f1f54b4e940e7125592571fa8ce6d8870b88816fa836d1be957"),
    "$STYLE->v(Ljava/lang/String;)V" to Contract(3, 9, 17, "d4a0f92be61a2806d61e39e92036eff1a6dfa11144e9b92a5c28413af484d3df"),
    "Lorg/maplibre/android/style/layers/Layer;->g([Lxd3;)V" to Contract(7, 32, 145, "5bc330f4c796c6dc1e9435d178c2a03ae38c43556b1abde55ab031f08c87595c"),
    "Lxd3;-><init>(Ljava/lang/String;Ljava/lang/Object;)V" to Contract(3, 4, 65537, "7535090ababba2eabc02b9114fc6ac0efb89d9825fd001a060eebda91eb17158"),
    "Lorg/maplibre/android/style/sources/GeoJsonSource;-><init>(Ljava/lang/String;)V" to Contract(3, 9, 65537, "cf270d6b3b6ae19d87e5ca938216499c23955d23fc9de00847352c795ff091fe"),
    "Lorg/maplibre/android/style/sources/GeoJsonSource;->c(Lorg/maplibre/geojson/FeatureCollection;)V" to Contract(3, 16, 17, "f3d57a78c7222ca592216551aefd9c12b386465b2fe718cad0c2ebf34a24b1a5"),
    "Lorg/maplibre/android/style/layers/SymbolLayer;-><init>(Ljava/lang/String;Ljava/lang/String;)V" to Contract(3, 3, 65537, "d505c87da58701a587d116a48a843a0c54aca67b6698825c58c3c9764c31d98f"),
)

/** Unrenamed JNI/GeoJSON members; presence only, their names are MapLibre's public API. */
private val velaMarkerAbi = listOf(
    "Lorg/maplibre/android/snapshotter/MapSnapshot;->pixelForLatLng(Lorg/maplibre/android/geometry/LatLng;)Landroid/graphics/PointF;",
    "Lorg/maplibre/android/snapshotter/MapSnapshot;->getBitmap()Landroid/graphics/Bitmap;",
    "Lorg/maplibre/android/geometry/LatLng;-><init>(DD)V",
    "Lorg/maplibre/geojson/Point;->fromLngLat(DD)Lorg/maplibre/geojson/Point;",
    "Lorg/maplibre/geojson/Feature;->fromGeometry(Lorg/maplibre/geojson/Geometry;)Lorg/maplibre/geojson/Feature;",
    "Lorg/maplibre/geojson/Feature;->addStringProperty(Ljava/lang/String;Ljava/lang/String;)V",
    "Lorg/maplibre/geojson/FeatureCollection;->fromFeatures(Ljava/util/List;)Lorg/maplibre/geojson/FeatureCollection;",
)

/** Validate every marker binding before any mutation; returns the original style setup method. */
internal fun validateVelaAlertMarkers(classes: Iterable<ClassDef>): Method {
    val byType = classes.associateBy { it.type }
    val found = mutableMapOf<String, Method>()
    velaMarkerContracts.forEach { (descriptor, contract) ->
        val owner = byType[descriptor.substringBefore("->")] ?: error("Missing Vela marker owner $descriptor")
        val method = owner.methods.singleOrNull { it.toString() == descriptor } ?: error("Missing Vela marker method $descriptor")
        check(owner.sourceFile == VELA_MAP_ID && method.accessFlags == contract.flags &&
            method.implementation?.registerCount == contract.registers &&
            method.implementation!!.instructions.count() == contract.count &&
            velaFingerprint(method) == contract.hash) { "Changed or already patched Vela marker contract $descriptor" }
        found[descriptor] = method
    }
    velaMarkerAbi.forEach { descriptor ->
        val owner = byType[descriptor.substringBefore("->")] ?: error("Missing Vela marker owner $descriptor")
        check(owner.sourceFile == VELA_MAP_ID && owner.methods.count { it.toString() == descriptor && it.accessFlags and AccessFlags.PUBLIC.value != 0 } == 1) {
            "Changed Vela marker ABI $descriptor"
        }
    }
    val style = byType.getValue(STYLE)
    check(style.fields.count { it.name == "f" && it.type == "Z" && it.accessFlags and AccessFlags.PUBLIC.value != 0 } == 1) { "Changed Vela style loaded flag" }
    check(byType.getValue("Li03;").superclass == "Lxd3;" && byType.getValue("Lcp1;").superclass == "Lxd3;") { "Changed Vela property value hierarchy" }
    val setup = found.getValue(VELA_STYLE_SETUP)
    check(setup.implementation!!.instructions.count { it.opcode == Opcode.RETURN_VOID } == 1) { "Changed Vela style setup exits" }
    // p0 (v63, the Style) is only copied at entry and never reassigned, so it still holds the Style at the exit.
    val styleRegister = setup.implementation!!.registerCount - 2
    check(setup.implementation!!.instructions.none { i ->
        i.opcode.setsRegister() && (i as OneRegisterInstruction).registerA.let { it == styleRegister || i.opcode.setsWideRegister() && it + 1 == styleRegister }
    }) { "Vela style setup reassigns its Style parameter" }
    return setup
}

context(context: BytecodePatchContext)
internal fun validateVelaAlertMarkerExtension() {
    check(context.classDefBy("Lnl/johninnl/vela/MapMarkers;").methods.count {
        it.toString() == VELA_MARKER_STYLE_HOOK && it.accessFlags and AccessFlags.STATIC.value != 0
    } == 1) { "Missing Vela map marker extension" }
}

/** After Vela's own layers exist; replacement keeps any incoming label on the hook. */
internal fun bindVelaPhoneMarkers(setup: MutableMethod) {
    val contract = velaMarkerContracts.getValue(VELA_STYLE_SETUP)
    check(setup.toString() == VELA_STYLE_SETUP && velaFingerprint(setup) == contract.hash) { "Changed or already patched Vela style setup" }
    val exit = setup.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index
    setup.replaceInstruction(exit, "invoke-static/range {p0 .. p0}, $VELA_MARKER_STYLE_HOOK")
    setup.addInstructions(exit + 1, "return-void")
    check(setup.getInstruction(exit + 1).opcode == Opcode.RETURN_VOID)
}
