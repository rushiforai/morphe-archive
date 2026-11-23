package org.ungoogled.patches.maps.car

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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
    // 26.47 keeps no View on the car Search controller: it carries the window Context
    // (`au:Lcwks` -> d:Object) and the local-editor branch is guarded by a boolean `G()`.
    if (classBy("Lrjs;").fields.count { it.name == "az" && it.type == "Lxch;" } == 1) {
        bindMapsCarSearch2647(mutableMethod)
        return
    }
    check(classBy("Lrjs;").fields.count { it.name == "l" && it.type == "Landroid/view/ViewGroup;" } == 1) {
        "Maps' car Search window changed"
    }
    val original = classBy("Lrjs;").methods.single {
        it.name == "G" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    val instructions = original.implementation!!.instructions.toList()
    check(original.implementation!!.registerCount >= 3) { "Maps' car Search has no scratch registers" }
    val mode = (instructions.first() as? ReferenceInstruction)?.reference as? MethodReference
    val gate = instructions[2] as? OffsetInstruction
    val positions = instructions.runningFold(0) { pc, instruction -> pc + instruction.codeUnits }
    val localIndex = gate?.let { positions.indexOf(positions[2] + it.codeOffset) } ?: -1
    check(mode?.definingClass == "Lrjs;" && mode.name == "C" && mode.parameterTypes.isEmpty() && mode.returnType == "Z" &&
        instructions[1].opcode == com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT &&
        instructions[2].opcode == com.android.tools.smali.dexlib2.Opcode.IF_EQZ && localIndex in instructions.indices &&
        (instructions[localIndex] as? ReferenceInstruction)?.reference?.toString() == "Lrjs;->aB:Lxch;" && instructions.drop(localIndex).any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name == "aM" && ref.returnType == "Luvs;"
    }) { "Maps' local Search editor branch changed" }
    val method = mutableMethod("Lrjs;", "G", emptyList(), "V")
    val body = method.implementation!!.instructions.toList()
    method.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lrjs;->l:Landroid/view/ViewGroup;
        invoke-static/range {v0 .. v0}, Lpatches/maps/gearslip/NativeCarSearch;->target(Landroid/view/View;)I
        move-result v0
        if-eqz v0, :original_car_search
        const/4 v1, 0x1
        if-eq v0, v1, :native_local_search
        return-void
    """, ExternalLabel("original_car_search", body[0]), ExternalLabel("native_local_search", body[localIndex]))
}

/** 26.47's car Search entry: `rjs.v(Lqhg;)V`, mode check `G()Z`, local-editor branch on `az:Lxch;`. */
private fun bindMapsCarSearch2647(
    mutableMethod: (String, String, List<String>, String) -> MutableMethod,
) {
    val method = mutableMethod("Lrjs;", "v", listOf("Lqhg;"), "V")
    val body = method.implementation!!.instructions.toList()
    check(body.size > 3) { "Maps' car Search entry is too short" }
    val mode = (body[0] as? ReferenceInstruction)?.reference as? MethodReference
    check(mode?.definingClass == "Lrjs;" && mode.name == "G" && mode.parameterTypes.isEmpty() && mode.returnType == "Z") {
        "Maps' car Search mode check changed"
    }
    check(body[1].opcode == Opcode.MOVE_RESULT && body[2].opcode == Opcode.IF_EQZ) {
        "Maps' car Search mode branch changed"
    }
    val gate = body[2] as OffsetInstruction
    val positions = body.runningFold(0) { pc, instruction -> pc + instruction.codeUnits }
    val localIndex = positions.indexOf(positions[2] + gate.codeOffset)
    check(localIndex in body.indices) { "Maps' car Search has no local editor branch" }
    val localRead = (body[localIndex] as? ReferenceInstruction)?.reference as? FieldReference
    check(localRead?.definingClass == "Lrjs;" && localRead.name == "az" && localRead.type == "Lxch;") {
        "Maps' local Search editor branch changed"
    }
    check(method.implementation!!.registerCount >= 3) { "Maps' car Search has no scratch registers" }
    method.addInstructionsWithLabels(
        0,
        """
            iget-object v0, p0, Lrjs;->au:Lcwks;
            iget-object v0, v0, Lcwks;->d:Ljava/lang/Object;
            check-cast v0, Landroid/content/Context;
            invoke-static {v0}, Lpatches/maps/gearslip/NativeCarSearch;->targetForContext(Landroid/content/Context;)I
            move-result v0
            if-eqz v0, :original_car_search
            const/4 v1, 0x1
            if-eq v0, v1, :native_local_search
            return-void
        """,
        ExternalLabel("original_car_search", body[0]),
        ExternalLabel("native_local_search", body[localIndex]),
    )
}

/**
 * The resource ids, per Maps version, of the views the extension presses to start guidance on the
 * host's request. Their names are the extension's own list (`NativeRoutePreview.START_NAMES`).
 */
internal val MAPS_ROUTE_PREVIEW_START_IDS = linkedMapOf(
    "place_details_navigation_footer_action_button" to 0x7f0b0906,
    "place_details_navigation_footer_spinner_or_action_icon" to 0x7f0b0909,
)

/** 26.47: the same two views under the newer resource table. */
private val MAPS_ROUTE_PREVIEW_START_IDS_2647 = linkedMapOf(
    "place_details_navigation_footer_action_button" to 0x7f0b090a,
    "place_details_navigation_footer_spinner_or_action_icon" to 0x7f0b090d,
)

/**
 * Refuse a Maps whose car route preview no longer builds the Start views the extension presses: the
 * footer builder (`snl.a()` in 26.44, `tdd.a()` in 26.47) must be one method and must still use every
 * id above. A Start the extension cannot find at run time is silent; one the patch cannot find here
 * stops the patch.
 */
internal fun validateMapsRoutePreviewStart(
    classBy: (String) -> ClassDef,
    ids: Map<String, Int> = MAPS_ROUTE_PREVIEW_START_IDS,
) {
    val is2647 = classBy("Ltdd;").methods.any {
        it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Lbhwh;"
    }
    val owner = if (is2647) "Ltdd;" else "Lsnl;"
    val result = if (is2647) "Lbhwh;" else "Lbhjq;"
    val effective = if (is2647) MAPS_ROUTE_PREVIEW_START_IDS_2647 else ids
    check(effective.isNotEmpty()) { "Maps' car route preview Start control is not identified" }
    val builders = classBy(owner).methods.filter {
        it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == result
    }
    check(builders.size == 1) { "Maps' car route preview footer builder changed" }
    val literals = (builders.single().implementation?.instructions ?: emptyList())
        .mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }.toSet()
    for ((name, id) in effective) {
        check(id in literals) { "Maps' car route preview Start view changed: $name" }
    }
}

/** Keep unsupported private clients disconnected; never forge a retail-host grant. */
internal fun guardMapsPrivateCarToken(method: MutableMethod) {
    check(method.definingClass == "Lbfcf;" && method.name == "e" && method.parameterTypes.isEmpty() && method.returnType == "V")
    check(method.implementation!!.registerCount > 2) { "Maps' optional car token has no scratch registers" }
    method.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lbfcf;->d:Lbfdr;
        instance-of v1, v0, Lbfej;
        if-nez v1, :unsupported_private_car_token
        instance-of v1, v0, Lqaa;
        if-eqz v1, :original_car_token
        :unsupported_private_car_token
        return-void
    """, ExternalLabel("original_car_token", method.implementation!!.instructions.first()))
}

/** Check the concrete application path, not an unrelated generated interface. */
internal fun validateMapsGuidanceComponent(classBy: (String) -> ClassDef) {
    // 26.47 appends two links to the application chain, renames the cached component accessor
    // (n() now yields crin, whose object getter is pY) and moves the listener marker/callback to
    // blxy/blxx with qk(Lblxv;)V.
    val chain = listOf(
        "Lcom/google/android/apps/gmm/base/app/GoogleMapsApplication;",
        "Lnuq;", "Lnbh;", "Lnup;", "Lnbe;", "Lnbn;",
    )
    val is2647 = runCatching { chain.zipWithNext().all { (child, parent) -> classBy(child).superclass == parent } }
        .getOrDefault(false)
    if (is2647) {
        chain.zipWithNext().forEach { (child, parent) ->
            check(classBy(child).superclass == parent) { "Maps' application component hierarchy changed: $child" }
        }
        check(classBy("Lnup;").methods.count {
            it.name == "n" && it.parameterTypes.isEmpty() && it.returnType == "Lcrin;"
        } == 1) { "Maps' cached application component accessor changed: Lnup;->n" }
        check(classBy("Lcrin;").methods.any {
            it.name == "pY" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;"
        }) { "Maps' application component getter changed: Lcrin;->pY" }
        check(classBy("Lngt;").fields.count { it.name == "bR" && it.type == "Lcrkc;" } == 1) {
            "Maps' native guidance provider changed"
        }
        check("Lblxy;" in classBy("Lblxx;").interfaces) { "Maps' native guidance listener marker changed" }
        check(classBy("Lblxx;").methods.count {
            it.name == "qk" && it.parameterTypes.map(CharSequence::toString) == listOf("Lblxv;") && it.returnType == "V"
        } == 1) { "Maps' native guidance callback changed" }
        return
    }
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
    // 26.47 inserts `tsl` between the service and `lqe`.
    val providerParent = if (classBy("Ltsl;").superclass == "Llqe;") "Ltsl;" else "Ltsf;"
    listOf("Lcom/google/android/apps/gmm/car/projected/service/CarNavigationProviderService;", providerParent, "Llqe;")
        .zipWithNext().forEach { (child, parent) ->
        check(classBy(child).superclass == parent) { "Maps' native navigation service hierarchy changed: $child" }
    }
    check(classBy("Llqe;").fields.count { it.name == "b" && it.type == "Llqa;" } == 1) {
        "Maps' native navigation Binder changed"
    }
    check(classBy("Llqa;").methods.count {
        (it.name == "y" || it.name == "z") && it.parameterTypes.map(CharSequence::toString) == listOf("I", "Landroid/os/Parcel;", "Landroid/os/Parcel;") && it.returnType == "Z"
    } == 1) { "Maps' native navigation dispatch changed" }
    for (type in listOf("Llqd;", "Llqb;", "Llpz;")) {
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
        // 26.47 relocated the car SDK resource cohort: lps/lpt keep their "d"
        // policy name, the lookups moved to kyp.y/kyp.z and the SDK context
        // wrapper became qqt with the decor factory lpr.
        val is2647 = packageMetadata.versionName == "26.47.00.1022347503"
        val carFlagEnum = if (is2647) "Llps;" else "Llvh;"
        val carDimensionEnum = if (is2647) "Llpt;" else "Llvi;"
        val carResources = if (is2647) "Lkyp;" else "Ljbz;"
        val dimensionName = if (is2647) "y" else "b"
        val flagName = if (is2647) "z" else "c"
        requireField(carFlagEnum,"d","Ljava/lang/String;")
        requireField(carDimensionEnum,"d","Ljava/lang/String;")
        requireMethod(carResources,dimensionName,listOf(carDimensionEnum,"Landroid/content/Context;","Landroid/content/res/Resources;"),"I")
        requireMethod(carResources,flagName,listOf(carFlagEnum,"Landroid/content/Context;","Landroid/content/res/Resources;"),"Z")
        val dimension=mutableClassDefBy(carResources).methods.single{it.name==dimensionName&&it.parameterTypes.map(CharSequence::toString)==listOf(carDimensionEnum,"Landroid/content/Context;","Landroid/content/res/Resources;")}
        val flag=mutableClassDefBy(carResources).methods.single{it.name==flagName&&it.parameterTypes.map(CharSequence::toString)==listOf(carFlagEnum,"Landroid/content/Context;","Landroid/content/res/Resources;")}
        if(dimension.implementation!!.registerCount<=3||flag.implementation!!.registerCount<=3)
            throw PatchException("Maps' car SDK lookups have no scratch register")
        dimension.addInstructions(0,"""
            iget-object v0, p0, $carDimensionEnum->d:Ljava/lang/String;
            invoke-static {p1, v0}, Lpatches/maps/gearslip/LocalCarUiResources;->dimension(Landroid/content/Context;Ljava/lang/String;)I
            move-result v0
            return v0
        """)
        flag.addInstructions(0,"""
            iget-object v0, p0, $carFlagEnum->d:Ljava/lang/String;
            invoke-static {v0}, Lpatches/maps/gearslip/LocalCarUiResources;->flag(Ljava/lang/String;)Z
            move-result v0
            return v0
        """)
        // Only the native car SDK context constructor is changed; other merged nnd
        // constructors and every unrelated package-context lookup remain untouched.
        val sdkContextType = if (is2647) "Lqqt;" else "Lnnu;"
        val decorFactoryType = if (is2647) "Llpr;" else "Llvg;"
        requireMethod(sdkContextType, "<init>", listOf("Landroid/content/Context;"), "V")
        requireField(sdkContextType, "a", "Ljava/lang/Object;")
        requireField(sdkContextType, "b", "Ljava/lang/Object;")
        val sdkContext=mutableClassDefBy(sdkContextType).methods.single{
            it.name=="<init>"&&it.parameterTypes.map(CharSequence::toString)==listOf("Landroid/content/Context;")
        }
        sdkContext.addInstructions(1,"""
            iput-object p1, p0, $sdkContextType->a:Ljava/lang/Object;
            iput-object p1, p0, $sdkContextType->b:Ljava/lang/Object;
            return-void
        """)
        val decorFactory=mutableClassDefBy(decorFactoryType).methods.single{
            it.name=="<init>"&&it.parameterTypes.map(CharSequence::toString)==listOf(sdkContextType,"[Ljava/lang/Object;")
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
        val microphoneActionType = if (is2647) "Ltqh;" else "Ltqb;"
        requireMethod(microphoneActionType,"s",emptyList(),"Z")
        mutableClassDefBy(microphoneActionType).methods.single{it.name=="s"&&it.parameterTypes.isEmpty()&&it.returnType=="Z"}
            .addInstructions(0,"const/4 v0, 0x0\nreturn v0")
        requireMethod("L$ORIGINAL;".replace('.', '/'), "b", emptyList(), "Ljava/lang/Class;")
        requireField("Lbfcs;", "a", "Ljava/lang/ref/WeakReference;")
        requireField("Lbfgi;", "H", "I")
        requireField("Lbfgi;", "J", "Lbfbe;")
        requireMethod("Lbfbe;", "C", listOf("Landroid/content/Intent;"), "V")
        requireField("Lbfgi;", "k", "Lbfgx;")
        requireField("Lbfgi;", "C", "Lcom/google/android/gms/car/DrawingSpec;")
        requireField("Lbfgi;", "o", "Landroid/content/res/Configuration;")
        requireField("Lbfgi;", "n", "Landroid/os/Bundle;")
        requireField("Lbfgi;", "v", "Landroid/graphics/Rect;")
        // 26.47 replaced the display surface model: `besz`'s a..d:Object + two [I getters + Surface
        // accessors have no counterpart, and `bete`'s holder moved with it. These are only sanity
        // checks (no edit touches them), so they are skipped on the newer build.
        if (!is2647) {
            requireMethod("Lbete;", "A", listOf("Landroid/graphics/Rect;"), "V")
            requireField("Lbete;", "j", "Lbesz;")
            requireMethod("Lbesz;", "f", listOf("Landroid/view/Surface;"), "V")
            requireField("Lbesz;", "b", "Ljava/lang/Object;")
        }
        validateMapsGuidanceComponent { classDefBy(it) }
        validateMapsRoutePreviewStart({ classDefBy(it) })
        bindMapsCarSearch({ classDefBy(it) }) { owner, name, parameters, result ->
            mutableClassDefBy(owner).methods.single { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result }
        }
        bindMapsNativeContent({ classDefBy(it) }) { owner, name, parameters, result ->
            mutableClassDefBy(owner).methods.single { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result }
        }
        requireMethod("Lblyp;","a",listOf("Lblxy;","Ljava/util/concurrent/Executor;"),"V")
        requireMethod("Lblyp;","c",listOf("Lblxy;"),"V")
        requireField("Lblyp;","b","Lblxv;")
        requireField("Lblxv;","c","Lblyc;")
        requireField("Lblxv;","b","Lblyl;")
        requireField("Lblyl;","a","Lbmnu;")
        requireMethod("Lbmnu;","e",emptyList(),"Lbmca;")
        requireField("Lbmca;","d","Lyga;")
        requireField("Lbmca;","i","I")
        requireField("Lbmca;","j","I")
        requireField("Lbmca;","m","I")
        requireField("Lbmca;","n","I")
        requireField("Lbmca;","b","Lyfm;")
        requireField("Lyfm;","N","Lcjkl;")
        requireField("Lngt;","hN","Lcrkc;")
        requireMethod("Laxju;","c",listOf("Lcjkl;"),"Lcjkl;")
        requireMethod("Lbmca;","c",emptyList(),"I")
        requireMethod("Lbmca;","d",emptyList(),"I")
        requireField("Lyga;","q","Landroid/text/Spanned;")
        requireField("Lyga;","t","Ljava/lang/CharSequence;")
        requireField("Lyga;","c","Lcbza;")
        requireField("Lyga;","d","Lcjoo;")
        requireField("Lyga;","e","Lcjop;")
        requireField("Lyga;","I","Lcjmi;")
        requireField("Lyga;","f","I")
        requireField("Lyga;","g","I")
        requireField("Lyga;","S","Lyga;")
        requireField("Lyga;","F","Ljava/util/List;")
        requireField("Lyfa;","a","Ljava/util/List;")
        requireField("Lyfa;","b","I")
        requireField("Lyfb;","a","Lcjlw;")
        requireField("Lyfb;","b","Z")
        mapOf(
            "Lcbza;" to setOf("MANEUVER_UNKNOWN","DEPART","NAME_CHANGE","STRAIGHT","LANE_CHANGE","TURN","COUNTED_TURN","UTURN","ON_RAMP","OFF_RAMP","FORK","MERGE","FERRY","FERRY_TRAIN","ROUNDABOUT_ENTER","ROUNDABOUT_EXIT","ROUNDABOUT_ENTER_AND_EXIT","DESTINATION"),
            "Lcjoo;" to setOf("SIDE_LEFT","SIDE_RIGHT","SIDE_UNSPECIFIED"),
            "Lcjop;" to setOf("TURN_UNKNOWN","TURN_SLIGHT","TURN_NORMAL","TURN_SHARP","TURN_KEEP","TURN_UTURN","TURN_STRAIGHT","TURN_MERGE","TURN_FORK"),
            "Lcjmi;" to setOf("NONE","LEFT","RIGHT"),
            "Lcjlw;" to setOf("STRAIGHT","SLIGHT","NORMAL","SHARP","U_TURN","MERGE"),
            "Lcjkl;" to setOf("KILOMETERS","MILES","MILES_YARDS","REGIONAL"),
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
        requireMethod(nativeProvider, "d", listOf("Llpz;"), "V")
        requireMethod(nativeProvider, "e", emptyList(), "V")
        validateMapsNavigationProvider { classDefBy(it) }
        // Native projected-session start otherwise installs a Google-private
        // focus client whose disconnected pxd.c() rejects every route request.
        // CAL already owns navigation through INavigationHost. Keep Maps' normal
        // phone-focus fallback (the existing p(null) path) for that session only;
        // do not fabricate a private focus grant or change native route results.
        requireMethod("Lsbe;", "p", listOf("Lqah;"), "V")
        val privateFocus = mutableClassDefBy("Lsbe;").methods.single {
            it.name == "p" && it.parameterTypes.map(CharSequence::toString) == listOf("Lqah;")
        }
        if (privateFocus.implementation!!.registerCount <= 2)
            throw PatchException("Maps' private focus registration has no scratch register")
        privateFocus.addInstructionsWithLabels(0, """
            invoke-static {}, Lpatches/maps/gearslip/NativeCarNavigationSession;->usesPublicHost()Z
            move-result v0
            if-eqz v0, :original_private_focus
            const/4 p1, 0x0
        """, ExternalLabel("original_private_focus", privateFocus.implementation!!.instructions.first()))
        requireMethod("Lbfgi;", "v", emptyList(), "V")
        requireMethod("Lbfgi;", "t", listOf("Landroid/content/res/Resources;"), "V")
        requireMethod("Llpd;", "b", listOf("Landroid/content/res/Configuration;"), "V")
        requireMethod("Lbfgi;", "o", listOf("Lcom/google/android/gms/car/display/CarRegionId;", "Lcom/google/android/gms/car/DrawingSpec;", "Landroid/content/Intent;", "Landroid/content/res/Configuration;", "Landroid/os/Bundle;"), "V")
        requireMethod("Lbfgi;", "m", listOf("I", "Z"), "V")
        requireMethod("Lbfgi;", "k", emptyList(), "V")
        requireMethod("Lcom/google/android/gms/car/DrawingSpec;", "<init>", listOf("I", "I", "I", "Landroid/view/Surface;", "Landroid/graphics/Rect;", "I", "I", "Landroid/os/Bundle;"), "V")

        // A re-signed Maps cannot use Google's private vehicle/sensor/message channel.
        // Its global CarConnectionHandler otherwise throws an uncaught SecurityException
        // while genuine AA is connected. Keep only that optional token disconnected;
        // the adapter's own native presentation uses a separate beld connection.
        requireField("Lbfcf;", "d", "Lbfdr;")
        requireField("Lbfej;", "a", "Lbfek;")
        requireField("Lqab;", "c", "Lbfcf;")
        requireMethod("Lqaa;", "<init>", listOf("Lqab;"), "V")
        requireMethod("Lqaa;", "b", emptyList(), "V")
        requireMethod("Lbfcf;", "e", emptyList(), "V")
        val connect = mutableClassDefBy("Lbfcf;").methods.single {
            it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        guardMapsPrivateCarToken(connect)

        // Native CAL navigation uses the phone's location. Vehicle speed is optional and
        // remains truthfully unavailable when not granted; it must not block GPS routing
        // or send a re-signed client into an impossible CAR_SPEED permission request.
        requireField("Ltrr;", "a", "Z")
        requireField("Ltrr;", "b", "Z")
        requireMethod("Ltrr;", "a", emptyList(), "Z")
        val permissions = mutableClassDefBy("Ltrr;").methods.single {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        if (permissions.implementation!!.registerCount <= 1) throw PatchException("Maps' car permission preflight has no scratch register")
        permissions.addInstructions(0, """
            iget-boolean v0, p0, Ltrr;->a:Z
            return v0
        """)
    }
}
