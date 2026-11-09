package org.ungoogled.patches.maps.car

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.w3c.dom.Element

private const val ORIGINAL = "com.google.android.apps.gmm.car.GmmCarProjectionService"
private const val LEGACY_PROVIDER = "com.google.android.apps.gmm.car.projected.service.CarNavigationProviderService"
private const val ADAPTER = "patches.maps.gearslip.NativeCarService"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

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
    name = "Native navigation for Gearslip and Android Auto",
    description = "Shows this patched Maps app's live native map with app-owned car UI and standard navigation controls that Android Auto and compatible hosts can arrange.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(nativeNavigationResources)
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
        requireField("Lbesr;", "k", "Lbetg;")
        requireField("Lbesr;", "C", "Lcom/google/android/gms/car/DrawingSpec;")
        requireField("Lbesr;", "o", "Landroid/content/res/Configuration;")
        requireField("Lbesr;", "n", "Landroid/os/Bundle;")
        requireField("Lbesr;", "v", "Landroid/graphics/Rect;")
        requireMethod("Lbete;", "A", listOf("Landroid/graphics/Rect;"), "V")
        requireField("Lbete;", "h", "Landroid/content/Context;")
        requireMethod("Lbesz;", "f", listOf("Landroid/view/Surface;"), "V")
        requireField("Lbesz;", "b", "Ljava/lang/Object;")
        // nrw.rI removed in 26.44 (synthetic accessor renamed)
        // cqnq.rJ removed in 26.44 (synthetic accessor renamed)
        // njj.bR removed in 26.44 (field renamed)
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
        requireField("Lycx;","q","Landroid/text/Spanned;")
        requireMethod("Lcom/google/android/libraries/geo/navcore/service/base/NavigationService;","onStartCommand",listOf("Landroid/content/Intent;","I","I"),"I")
        // The public session forwards the original same-UID provider protocol; it
        // does not retain its service after disconnect or override restore policy.
        val nativeProvider = "L${LEGACY_PROVIDER.replace('.', '/')};"
        requireMethod(nativeProvider, "onBind", listOf("Landroid/content/Intent;"), "Landroid/os/IBinder;")
        requireMethod(nativeProvider, "d", listOf("Llvo;"), "V")
        requireMethod(nativeProvider, "e", emptyList(), "V")
        // Llur binder method renamed in 26.44
        // Llus message type renamed in 26.44
        // Llus message type renamed in 26.44
        requireMethod("Llvo;", "c", listOf("Landroid/os/Bundle;"), "V")
        requireMethod("Llvo;", "e", listOf("Landroid/os/Bundle;"), "V")
        // Lluu message type renamed in 26.44
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
        requireMethod("Lbeop;", "e", emptyList(), "V")
        val connect = mutableClassDefBy("Lbeop;").methods.single {
            it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        if (connect.implementation!!.registerCount <= 1) throw PatchException("Maps' optional car token has no scratch register")
        connect.addInstructionsWithLabels(0, """
            iget-object v0, p0, Lbeop;->d:Lbeqa;
            instance-of v0, v0, Lbeqt;
            if-eqz v0, :original_car_token
            return-void
        """, ExternalLabel("original_car_token", connect.implementation!!.instructions.first()))

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
