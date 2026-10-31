package ch.broillet.veloce.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import ch.broillet.veloce.patches.shared.certificateDigest
import ch.broillet.veloce.patches.shared.hostCertificateOption
import ch.broillet.veloce.patches.shared.hostPackageName
import ch.broillet.veloce.patches.shared.hostPackageOption
import ch.broillet.veloce.patches.shared.uniqueMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private val carServicePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") != "com.waze") throw PatchException("This patch requires Waze (com.waze)")
            val android = "http://schemas.android.com/apk/res/android"
            val services = document.getElementsByTagName("service")
            val service = (0 until services.length).map { services.item(it) as Element }.singleOrNull {
                it.getAttributeNS(android, "name") in setOf("com.waze.car_lib.WazeCarAppService", ".car_lib.WazeCarAppService")
            } ?: throw PatchException("This Waze build does not expose the expected AndroidX WazeCarAppService")
            val actions = service.getElementsByTagName("action")
            if ((0 until actions.length).none {
                (actions.item(it) as Element).getAttributeNS(android, "name") == "androidx.car.app.CarAppService"
            }) throw PatchException("WazeCarAppService has no AndroidX car-service intent filter")

            service.setAttributeNS(android, "android:exported", "true")
            service.setAttributeNS(android, "android:permission", "")
        }
    }
}

val customCarHostPatch = bytecodePatch(
    name = "Allow custom car hosts",
    description = "Add Veloce (or a custom host package and signing certificate) to Waze's AndroidX host allowlist. Preserves validation of other hosts.",
) {
    compatibleWith(Compatibility(
        packageName = "com.waze",
        name = "Waze",
        targets = listOf(AppTarget(version = null, isExperimental = true,
            description = "Requires WazeCarAppService and a matching AndroidX HostValidator.")),
    ))
    dependsOn(carServicePatch)
    val hostPackage by hostPackageOption()
    val hostCertificate by hostCertificateOption()

    execute {
        val packageName = hostPackageName(checkNotNull(hostPackage))
        val digest = certificateDigest(checkNotNull(hostCertificate))
        val validator = Fingerprint(
            isStatic = false,
            returnType = "Z",
            parameters = listOf("L"),
            filters = listOf(string("Accepted - Validator disabled, all hosts allowed")),
        ).uniqueMethod(this, "Waze AndroidX HostValidator")
        val validatorClass = mutableClassDefBy(validator.definingClass)
        val constructor = validatorClass.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes == listOf(
                "Landroid/content/pm/PackageManager;", "Ljava/util/Map;", "Z")
        } ?: throw PatchException("Waze's AndroidX HostValidator constructor has changed")
        if (constructor.implementation == null || constructor.implementation!!.registerCount > 255) {
            throw PatchException("Waze's AndroidX HostValidator constructor has unsupported registers")
        }
        if (validatorClass.methods.any { it.name == "veloceAllowedHosts" }) {
            throw PatchException("Waze is already patched: veloceAllowedHosts exists")
        }
        // Extend a copy of the original allowlist. AndroidX still checks the host's
        // package, certificate and calling UID; its validator is not bypassed.
        val helper = MutableMethod(ImmutableMethod(validatorClass.type, "veloceAllowedHosts",
            listOf(ImmutableMethodParameter("Ljava/util/Map;", emptySet(), null)), "Ljava/util/Map;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(), MutableMethodImplementation(4)))
        helper.addInstructions(0, """
            new-instance v0, Ljava/util/HashMap;
            invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V
            const-string v1, "$packageName"
            invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Ljava/util/Collection;
            new-instance v1, Ljava/util/ArrayList;
            invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
            if-eqz v2, :add
            invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
            :add
            const-string v2, "$digest"
            invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            const-string v2, "$packageName"
            invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            return-object v0
        """)
        validatorClass.methods.add(helper)
        constructor.addInstructions(0, """
            invoke-static/range {p2 .. p2}, $helper
            move-result-object p2
        """)
    }
}
