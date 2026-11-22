package org.ungoogled.patches.maps.car

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.w3c.dom.Element
import com.android.tools.smali.dexlib2.iface.ClassDef
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val ORIGINAL = "com.google.android.apps.gmm.car.GmmCarProjectionService"
private const val LEGACY_PROVIDER = "com.google.android.apps.gmm.car.projected.service.CarNavigationProviderService"
private const val ADAPTER = "patches.maps.gearslip.NativeCarService"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

/** Open the existing native editor locally when CAL owns the requesting car window. */
internal fun bindMapsCarSearch(
    classBy: (String) -> ClassDef,
    mutableMethod: (String, String, List<String>, String) -> MutableMethod,
) {
    check(classBy("Lrhe;").fields.count { it.name == "l" && it.type == "Landroid/view/ViewGroup;" } == 1) {
        "Maps' car Search window changed"
    }
    val original = classBy("Lrhe;").methods.single {
        it.name == "G" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    val instructions = original.implementation!!.instructions.toList()
    check(original.implementation!!.registerCount >= 3) { "Maps' car Search has no scratch registers" }
    val mode = (instructions.first() as? ReferenceInstruction)?.reference as? MethodReference
    val gate = instructions[2] as? OffsetInstruction
    val positions = instructions.runningFold(0) { pc, instruction -> pc + instruction.codeUnits }
    val localIndex = gate?.let { positions.indexOf(positions[2] + it.codeOffset) } ?: -1
    check(mode?.definingClass == "Lrhe;" && mode.name == "C" && mode.parameterTypes.isEmpty() && mode.returnType == "Z" &&
        instructions[1].opcode == com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT &&
        instructions[2].opcode == com.android.tools.smali.dexlib2.Opcode.IF_EQZ && localIndex in instructions.indices &&
        (instructions[localIndex] as? ReferenceInstruction)?.reference?.toString() == "Lrhe;->aB:Lsiy;" && instructions.drop(localIndex).any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name == "aM" && ref.returnType == "Luvs;"
    }) { "Maps' local Search editor branch changed" }
    val method = mutableMethod("Lrhe;", "G", emptyList(), "V")
    val body = method.implementation!!.instructions.toList()
    method.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lrhe;->l:Landroid/view/ViewGroup;
        invoke-static/range {v0 .. v0}, Lpatches/maps/gearslip/NativeCarSearch;->target(Landroid/view/View;)I
        move-result v0
        if-eqz v0, :original_car_search
        const/4 v1, 0x1
        if-eq v0, v1, :native_local_search
        return-void
    """, ExternalLabel("original_car_search", body[0]), ExternalLabel("native_local_search", body[localIndex]))
}

/**
 * The resource ids, in the one Maps version this patch targets (26.44.06.1006895251), of the views the
 * extension presses to start guidance on the host's request. Their names are the extension's own list,
 * `NativeRoutePreview.START_NAMES`: one place for the names, and a test that these keys equal it, in
 * order. The ids are those of the footer builder's own resource table entries; how both were established
 * is in docs/research/2026-11-22-maps-start-guidance-design.md, section 1.
 */
internal val MAPS_ROUTE_PREVIEW_START_IDS = linkedMapOf(
    "place_details_navigation_footer_action_button" to 0x7f0b0906,
    "place_details_navigation_footer_spinner_or_action_icon" to 0x7f0b0909,
)

/**
 * Refuse a Maps whose car route preview no longer builds the Start views the extension presses: the
 * footer builder (`snl.a()`, the car place details' navigation footer) must be one method, and must
 * still use every id above. A Start the extension cannot find at run time is silent; one the patch
 * cannot find here stops the patch.
 */
internal fun validateMapsRoutePreviewStart(
    classBy: (String) -> ClassDef,
    ids: Map<String, Int> = MAPS_ROUTE_PREVIEW_START_IDS,
) {
    check(ids.isNotEmpty()) { "Maps' car route preview Start control is not identified" }
    val builders = classBy("Lsnl;").methods.filter {
        it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Lbhjq;"
    }
    check(builders.size == 1) { "Maps' car route preview footer builder changed" }
    val literals = (builders.single().implementation?.instructions ?: emptyList())
        .mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }.toSet()
    for ((name, id) in ids) {
        check(id in literals) { "Maps' car route preview Start view changed: $name" }
    }
}

/** Keep unsupported private clients disconnected; never forge a retail-host grant. */
internal fun guardMapsPrivateCarToken(method: MutableMethod) {
    check(method.definingClass == "Lbeop;" && method.name == "e" && method.parameterTypes.isEmpty() && method.returnType == "V")
    check(method.implementation!!.registerCount > 2) { "Maps' optional car token has no scratch registers" }
    method.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lbeop;->d:Lbeqa;
        instance-of v1, v0, Lbeqt;
        if-nez v1, :unsupported_private_car_token
        instance-of v1, v0, Lpxt;
        if-eqz v1, :original_car_token
        :unsupported_private_car_token
        return-void
    """, ExternalLabel("original_car_token", method.implementation!!.instructions.first()))
}

/** Check the concrete application path, not an unrelated generated interface. */
internal fun validateMapsGuidanceComponent(classBy: (String) -> ClassDef) {
    val hierarchy = listOf(
        "Lcom/google/android/apps/gmm/base/app/GoogleMapsApplication;",
        "Lnsn;", "Lngb;", "Lnsm;",
    )
    hierarchy.zipWithNext().forEach { (child, parent) ->
        check(classBy(child).superclass == parent) { "Maps' application component hierarchy changed: $child" }
    }
    listOf(Triple("Lnsm;", "rS", "Ljava/lang/Object;"),
        Triple("Lnsn;", "n", "Lcqwl;"),
        Triple("Lcqwl;", "rS", "Ljava/lang/Object;")).forEach { (owner, name, result) ->
        check(classBy(owner).methods.count { it.name == name && it.parameterTypes.isEmpty() && it.returnType == result } == 1) {
            "Maps' cached application component accessor changed: $owner->$name"
        }
    }
    check(classBy("Lnjz;").fields.count { it.name == "bR" && it.type == "Lcqya;" } == 1) {
        "Maps' native guidance provider changed"
    }
    check("Lblrb;" in classBy("Lblra;").interfaces) { "Maps' native guidance listener marker changed" }
    check(classBy("Lblra;").methods.count {
        it.name == "se" && it.parameterTypes.map(CharSequence::toString) == listOf("Lblqy;") && it.returnType == "V"
    } == 1) { "Maps' native guidance callback changed" }
}

internal fun validateMapsNavigationProvider(classBy: (String) -> ClassDef) {
    listOf("Lcom/google/android/apps/gmm/car/projected/service/CarNavigationProviderService;", "Ltsf;", "Llvt;")
        .zipWithNext().forEach { (child, parent) ->
        check(classBy(child).superclass == parent) { "Maps' native navigation service hierarchy changed: $child" }
    }
    check(classBy("Llvt;").fields.count { it.name == "b" && it.type == "Llvp;" } == 1) {
        "Maps' native navigation Binder changed"
    }
    check(classBy("Llvp;").methods.count {
        it.name == "y" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "Landroid/os/Parcel;", "Landroid/os/Parcel;") && it.returnType == "Z"
    } == 1) { "Maps' native navigation dispatch changed" }
    for (type in listOf("Llvs;", "Llvq;", "Llvo;")) {
        for (name in listOf("c", "e")) {
            check(classBy(type).methods.count {
                it.name == name && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") && it.returnType == "V"
            } == 1) { "Maps' native navigation message changed: $type->$name" }
        }
    }
}

private val nativeNavigationResources = resourcePatch {
    execute {
        var descriptor: String? = null
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val application = doc.getElementsByTagName("application").item(0) as Element
            fun elements(tag: String): List<Element> = doc.getElementsByTagName(tag).let { nodes ->
                (0 until nodes.length).map { nodes.item(it) as Element }
            }
            val original = elements("service").singleOrNull { it.getAttributeNS(ANDROID, "name") == ORIGINAL }
                ?: throw PatchException("Maps' original Android Auto service changed")
            val provider = elements("service").singleOrNull { it.getAttributeNS(ANDROID, "name") == LEGACY_PROVIDER }
                ?: throw PatchException("Maps' internal navigation provider changed")
            // The CAL adapter is the external navigation provider. The old Google-private
            // provider must remain available to Maps' own renderer, but external discovery
            // triggers a CAR_SPEED permission preflight that a re-signed client cannot satisfy.
            provider.setAttributeNS(ANDROID, "android:exported", "false")
            val providerFilters = provider.getElementsByTagName("intent-filter").let { nodes ->
                (0 until nodes.length).map { nodes.item(it) as Element }
            }
            for (filter in providerFilters) {
                val categories = filter.getElementsByTagName("category")
                if ((0 until categories.length).any {
                    (categories.item(it) as Element).getAttributeNS(ANDROID, "name") == "com.google.android.car.category.NAVIGATION_PROVIDER"
                }) provider.removeChild(filter)
            }
            if (elements("service").any { it.getAttributeNS(ANDROID, "name") == ADAPTER })
                throw PatchException("Native Maps navigation is already applied")
            val carDescriptor = elements("meta-data").singleOrNull {
                it.parentNode == application && it.getAttributeNS(ANDROID, "name") == "com.google.android.gms.car.application"
            } ?: throw PatchException("Maps' automotive descriptor changed")
            descriptor = carDescriptor.getAttributeNS(ANDROID, "resource").takeIf { it.startsWith("@xml/") }
                ?.removePrefix("@xml/") ?: throw PatchException("Maps' automotive descriptor is not an XML resource")

            // Same process as the original projection controller: the private native connection
            // stays inside the patched Maps UID and never binds stock Maps as a fallback.
            application.appendChild(doc.createElement("service").apply {
                setAttributeNS(ANDROID, "android:name", ADAPTER)
                setAttributeNS(ANDROID, "android:exported", "true")
                setAttributeNS(ANDROID, "android:foregroundServiceType", "location")
                original.getAttributeNS(ANDROID, "process").takeIf(String::isNotEmpty)?.let {
                    setAttributeNS(ANDROID, "android:process", it)
                }
                appendChild(doc.createElement("intent-filter").apply {
                    appendChild(doc.createElement("action").apply { setAttributeNS(ANDROID, "android:name", "androidx.car.app.CarAppService") })
                    appendChild(doc.createElement("category").apply { setAttributeNS(ANDROID, "android:name", "androidx.car.app.category.NAVIGATION") })
                })
                appendChild(doc.createElement("intent-filter").apply {
                    appendChild(doc.createElement("action").apply { setAttributeNS(ANDROID, "android:name", "androidx.car.app.action.NAVIGATE") })
                    appendChild(doc.createElement("category").apply { setAttributeNS(ANDROID, "android:name", "android.intent.category.DEFAULT") })
                    appendChild(doc.createElement("data").apply { setAttributeNS(ANDROID, "android:scheme", "geo") })
                })
            })
            for (permission in listOf("androidx.car.app.NAVIGATION_TEMPLATES", "androidx.car.app.ACCESS_SURFACE")) {
                if (elements("uses-permission").none { it.getAttributeNS(ANDROID, "name") == permission })
                    root.appendChild(doc.createElement("uses-permission").apply { setAttributeNS(ANDROID, "android:name", permission) })
            }
            if (elements("meta-data").none { it.parentNode == application && it.getAttributeNS(ANDROID, "name") == "androidx.car.app.minCarApiLevel" })
                application.appendChild(doc.createElement("meta-data").apply {
                    setAttributeNS(ANDROID, "android:name", "androidx.car.app.minCarApiLevel")
                    setAttributeNS(ANDROID, "android:value", "5")
                })
            val queries = elements("queries").firstOrNull() ?: doc.createElement("queries").also(root::appendChild)
            for (host in listOf("app.seb3thehacker.gearslip", "app.seb3thehacker.gearslip.dev", "app.johninnl.drivedeck", "app.johninnl.drivedeck.dev", "com.google.android.projection.gearhead")) {
                if (elements("package").none { it.parentNode == queries && it.getAttributeNS(ANDROID, "name") == host })
                    queries.appendChild(doc.createElement("package").apply { setAttributeNS(ANDROID, "android:name", host) })
            }
        }
        // Preserve the original descriptor's capabilities and add its one real navigation
        // adapter. Gearslip's navigation precedence suppresses incidental messages/media tiles.
        document("res/xml/${descriptor!!}.xml").use { doc ->
            val uses = doc.getElementsByTagName("uses")
            if ((0 until uses.length).none { (uses.item(it) as Element).getAttribute("name") == "template" })
                doc.documentElement.appendChild(doc.createElement("uses").apply { setAttribute("name", "template") })
        }
    }
}

@Suppress("unused")
val nativeCarNavigationPatch = bytecodePatch(
    name = "Native navigation for any Android Auto host",
    description = "Shows Maps' own car interface, as in Google's Android Auto, on any Android Auto compatible host: " +
        "Google's Android Auto and community hosts such as DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE. " +
        "Maps draws its map, turn and ETA cards, buttons, search, settings and route panels itself; the host shows the screen, " +
        "passes touches through and supplies its keyboard for typing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(nativeNavigationResources, patches.shared.androidAutoHostVisibility)
    extendWith("extensions/maps-gearslip.mpe")
    execute {
        fun requireMethod(type: String, name: String, parameters: List<String>, returns: String) {
            if (classDefBy(type).methods.none {
                it.name == name && it.returnType == returns && it.parameterTypes.map(CharSequence::toString) == parameters
            }) throw PatchException("Maps' native car ABI changed: $type->$name")
        }
        fun requireField(type: String, name: String, fieldType: String) {
            if (classDefBy(type).fields.none { it.name == name && it.type == fieldType })
                throw PatchException("Maps' native car field changed: $type->$name")
        }
        // These six SDK policy lookups are the complete resource cohort used by
        // the native facade. Own them locally instead of resolving foreign AA
        // resources (or adding unrelated resource-table entries to Maps).
        requireField("Llvh;","d","Ljava/lang/String;")
        requireField("Llvi;","d","Ljava/lang/String;")
        requireMethod("Ljbz;","b",listOf("Llvi;","Landroid/content/Context;","Landroid/content/res/Resources;"),"I")
        requireMethod("Ljbz;","c",listOf("Llvh;","Landroid/content/Context;","Landroid/content/res/Resources;"),"Z")
        val dimension=mutableClassDefBy("Ljbz;").methods.single{it.name=="b"&&it.parameterTypes.map(CharSequence::toString)==listOf("Llvi;","Landroid/content/Context;","Landroid/content/res/Resources;")}
        val flag=mutableClassDefBy("Ljbz;").methods.single{it.name=="c"&&it.parameterTypes.map(CharSequence::toString)==listOf("Llvh;","Landroid/content/Context;","Landroid/content/res/Resources;")}
        if(dimension.implementation!!.registerCount<=3||flag.implementation!!.registerCount<=3)
            throw PatchException("Maps' car SDK lookups have no scratch register")
        dimension.addInstructions(0,"""
            iget-object v0, p0, Llvi;->d:Ljava/lang/String;
            invoke-static {p1, v0}, Lpatches/maps/gearslip/LocalCarUiResources;->dimension(Landroid/content/Context;Ljava/lang/String;)I
            move-result v0
            return v0
        """)
        flag.addInstructions(0,"""
            iget-object v0, p0, Llvh;->d:Ljava/lang/String;
            invoke-static {v0}, Lpatches/maps/gearslip/LocalCarUiResources;->flag(Ljava/lang/String;)Z
            move-result v0
            return v0
        """)
        // Only the native car SDK context constructor is changed; other merged nnd
        // constructors and every unrelated package-context lookup remain untouched.
        requireMethod("Lnnu;", "<init>", listOf("Landroid/content/Context;"), "V")
        requireField("Lnnu;", "a", "Ljava/lang/Object;")
        requireField("Lnnu;", "b", "Ljava/lang/Object;")
        val sdkContext=mutableClassDefBy("Lnnu;").methods.single{
            it.name=="<init>"&&it.parameterTypes.map(CharSequence::toString)==listOf("Landroid/content/Context;")
        }
        sdkContext.addInstructions(1,"""
            iput-object p1, p0, Lnnu;->a:Ljava/lang/Object;
            iput-object p1, p0, Lnnu;->b:Ljava/lang/Object;
            return-void
        """)
        val decorFactory=mutableClassDefBy("Llvg;").methods.single{
            it.name=="<init>"&&it.parameterTypes.map(CharSequence::toString)==listOf("Lnnu;","[Ljava/lang/Object;")
        }
        val entryConstants=decorFactory.implementation!!.instructions.withIndex().filter{
            (((it.value as? ReferenceInstruction)?.reference) as? StringReference)?.string=="com.google.android.gearhead.appdecor.CarUiEntry"
        }
        if(entryConstants.size!=1)throw PatchException("Maps' car decor factory changed")
        val entry=entryConstants.single()
        decorFactory.replaceInstruction(entry.index,"const-string v${(entry.value as OneRegisterInstruction).registerA}, \"patches.maps.gearslip.LocalCarUiEntry\"")
        // Google's demand-space microphone belongs to its private host. Do not
        // display an action which a repackaged public CAL client cannot execute.
        // Native typed search and its genuine editor remain available.
        requireMethod("Ltqb;","s",emptyList(),"Z")
        mutableClassDefBy("Ltqb;").methods.single{it.name=="s"&&it.parameterTypes.isEmpty()&&it.returnType=="Z"}
            .addInstructions(0,"const/4 v0, 0x0\nreturn v0")
        requireMethod("L$ORIGINAL;".replace('.', '/'), "b", emptyList(), "Ljava/lang/Class;")
        requireField("Lbepc;", "a", "Ljava/lang/ref/WeakReference;")
        requireField("Lbesr;", "H", "I")
        requireField("Lbesr;", "J", "Lbeno;")
        requireMethod("Lbeno;", "C", listOf("Landroid/content/Intent;"), "V")
        requireField("Lbesr;", "k", "Lbetg;")
        requireField("Lbesr;", "C", "Lcom/google/android/gms/car/DrawingSpec;")
        requireField("Lbesr;", "o", "Landroid/content/res/Configuration;")
        requireField("Lbesr;", "n", "Landroid/os/Bundle;")
        requireField("Lbesr;", "v", "Landroid/graphics/Rect;")
        requireMethod("Lbete;", "A", listOf("Landroid/graphics/Rect;"), "V")
        requireField("Lbete;", "j", "Lbesz;")
        requireMethod("Lbesz;", "f", listOf("Landroid/view/Surface;"), "V")
        requireField("Lbesz;", "b", "Ljava/lang/Object;")
        validateMapsGuidanceComponent { classDefBy(it) }
        validateMapsRoutePreviewStart({ classDefBy(it) })
        bindMapsCarSearch({ classDefBy(it) }) { owner, name, parameters, result ->
            mutableClassDefBy(owner).methods.single { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result }
        }
        bindMapsNativeContent({ classDefBy(it) }) { owner, name, parameters, result ->
            mutableClassDefBy(owner).methods.single { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result }
        }
        requireMethod("Lblrr;","a",listOf("Lblrb;","Ljava/util/concurrent/Executor;"),"V")
        requireMethod("Lblrr;","c",listOf("Lblrb;"),"V")
        requireField("Lblrr;","b","Lblqy;")
        requireField("Lblqy;","c","Lblrf;")
        requireField("Lblqy;","b","Lblrn;")
        requireField("Lblrn;","a","Lbmgp;")
        requireMethod("Lbmgp;","e",emptyList(),"Lblvb;")
        requireField("Lblvb;","d","Lycx;")
        requireField("Lblvb;","i","I")
        requireField("Lblvb;","j","I")
        requireField("Lblvb;","m","I")
        requireField("Lblvb;","n","I")
        requireField("Lblvb;","b","Lycj;")
        requireField("Lycj;","N","Lcizm;")
        requireField("Lnjz;","hN","Lcqya;")
        requireMethod("Lawxs;","c",listOf("Lcizm;"),"Lcizm;")
        requireMethod("Lblvb;","c",emptyList(),"I")
        requireMethod("Lblvb;","d",emptyList(),"I")
        requireField("Lycx;","q","Landroid/text/Spanned;")
        requireField("Lycx;","t","Ljava/lang/CharSequence;")
        requireField("Lycx;","c","Lcboo;")
        requireField("Lycx;","d","Lcjdp;")
        requireField("Lycx;","e","Lcjdq;")
        requireField("Lycx;","I","Lcjbk;")
        requireField("Lycx;","f","I")
        requireField("Lycx;","g","I")
        requireField("Lycx;","S","Lycx;")
        requireField("Lycx;","F","Ljava/util/List;")
        requireField("Lybw;","a","Ljava/util/List;")
        requireField("Lybw;","b","I")
        requireField("Lybx;","a","Lcjax;")
        requireField("Lybx;","b","Z")
        mapOf(
            "Lcboo;" to setOf("MANEUVER_UNKNOWN","DEPART","NAME_CHANGE","STRAIGHT","LANE_CHANGE","TURN","COUNTED_TURN","UTURN","ON_RAMP","OFF_RAMP","FORK","MERGE","FERRY","FERRY_TRAIN","ROUNDABOUT_ENTER","ROUNDABOUT_EXIT","ROUNDABOUT_ENTER_AND_EXIT","DESTINATION"),
            "Lcjdp;" to setOf("SIDE_LEFT","SIDE_RIGHT","SIDE_UNSPECIFIED"),
            "Lcjdq;" to setOf("TURN_UNKNOWN","TURN_SLIGHT","TURN_NORMAL","TURN_SHARP","TURN_KEEP","TURN_UTURN","TURN_STRAIGHT","TURN_MERGE","TURN_FORK"),
            "Lcjbk;" to setOf("NONE","LEFT","RIGHT"),
            "Lcjax;" to setOf("STRAIGHT","SLIGHT","NORMAL","SHARP","U_TURN","MERGE"),
            "Lcizm;" to setOf("KILOMETERS","MILES","MILES_YARDS","REGIONAL"),
        ).forEach { (owner,names) ->
            val initializer=classDefBy(owner).methods.single { it.name == "<clinit>" }
            val literals=initializer.implementation!!.instructions.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            }.toSet()
            check(literals.containsAll(names)) { "Maps' native routing enum changed: $owner" }
        }
        requireMethod("Lcom/google/android/libraries/geo/navcore/service/base/NavigationService;","onStartCommand",listOf("Landroid/content/Intent;","I","I"),"I")
        // The public session forwards the original same-UID provider protocol; it
        // does not retain its service after disconnect or override restore policy.
        val nativeProvider = "L${LEGACY_PROVIDER.replace('.', '/')};"
        requireMethod(nativeProvider, "onBind", listOf("Landroid/content/Intent;"), "Landroid/os/IBinder;")
        requireMethod(nativeProvider, "d", listOf("Llvo;"), "V")
        requireMethod(nativeProvider, "e", emptyList(), "V")
        validateMapsNavigationProvider { classDefBy(it) }
        // Native projected-session start otherwise installs a Google-private
        // focus client whose disconnected pxd.c() rejects every route request.
        // CAL already owns navigation through INavigationHost. Keep Maps' normal
        // phone-focus fallback (the existing p(null) path) for that session only;
        // do not fabricate a private focus grant or change native route results.
        requireMethod("Lryt;", "p", listOf("Lpya;"), "V")
        val privateFocus = mutableClassDefBy("Lryt;").methods.single {
            it.name == "p" && it.parameterTypes.map(CharSequence::toString) == listOf("Lpya;")
        }
        if (privateFocus.implementation!!.registerCount <= 2)
            throw PatchException("Maps' private focus registration has no scratch register")
        privateFocus.addInstructionsWithLabels(0, """
            invoke-static {}, Lpatches/maps/gearslip/NativeCarNavigationSession;->usesPublicHost()Z
            move-result v0
            if-eqz v0, :original_private_focus
            const/4 p1, 0x0
        """, ExternalLabel("original_private_focus", privateFocus.implementation!!.instructions.first()))
        requireMethod("Lbesr;", "v", emptyList(), "V")
        requireMethod("Lbesr;", "t", listOf("Landroid/content/res/Resources;"), "V")
        requireMethod("Llus;", "b", listOf("Landroid/content/res/Configuration;"), "V")
        requireMethod("Lbesr;", "o", listOf("Lcom/google/android/gms/car/display/CarRegionId;", "Lcom/google/android/gms/car/DrawingSpec;", "Landroid/content/Intent;", "Landroid/content/res/Configuration;", "Landroid/os/Bundle;"), "V")
        requireMethod("Lbesr;", "m", listOf("I", "Z"), "V")
        requireMethod("Lbesr;", "k", emptyList(), "V")
        requireMethod("Lcom/google/android/gms/car/DrawingSpec;", "<init>", listOf("I", "I", "I", "Landroid/view/Surface;", "Landroid/graphics/Rect;", "I", "I", "Landroid/os/Bundle;"), "V")

        // A re-signed Maps cannot use Google's private vehicle/sensor/message channel.
        // Its global CarConnectionHandler otherwise throws an uncaught SecurityException
        // while genuine AA is connected. Keep only that optional token disconnected;
        // the adapter's own native presentation uses a separate beld connection.
        requireField("Lbeop;", "d", "Lbeqa;")
        requireField("Lbeqt;", "a", "Lbequ;")
        requireField("Lpxu;", "c", "Lbeop;")
        requireMethod("Lpxt;", "<init>", listOf("Lpxu;"), "V")
        requireMethod("Lpxt;", "b", emptyList(), "V")
        requireMethod("Lbeop;", "e", emptyList(), "V")
        val connect = mutableClassDefBy("Lbeop;").methods.single {
            it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        guardMapsPrivateCarToken(connect)

        // Native CAL navigation uses the phone's location. Vehicle speed is optional and
        // remains truthfully unavailable when not granted; it must not block GPS routing
        // or send a re-signed client into an impossible CAR_SPEED permission request.
        requireField("Ltrl;", "a", "Z")
        requireField("Ltrl;", "b", "Z")
        requireMethod("Ltrl;", "a", emptyList(), "Z")
        val permissions = mutableClassDefBy("Ltrl;").methods.single {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        if (permissions.implementation!!.registerCount <= 1) throw PatchException("Maps' car permission preflight has no scratch register")
        permissions.addInstructions(0, """
            iget-boolean v0, p0, Ltrl;->a:Z
            return v0
        """)
    }
}
