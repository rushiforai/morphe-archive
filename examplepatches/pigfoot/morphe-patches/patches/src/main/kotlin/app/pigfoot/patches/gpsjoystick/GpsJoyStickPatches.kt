package app.pigfoot.patches.gpsjoystick

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.shared.certificate.requireOriginalCertificate
import app.pigfoot.patches.shared.maps.isMapsKey
import app.pigfoot.patches.shared.maps.replaceMapsKeyBytes
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest

internal const val GPS_PACKAGE = "com.theappninjas.fakegpsjoystick"
internal const val GPS_SIGNER = "cf5516416b8af05634166a44a3349aa65b346a92"
internal data class GpsPolicy(val tierOwner: String, val tierMethod: String, val tierPin: String, val manifestHash: String,
    val prefs: String, val keys: String, val preferenceMethod: String, val adFreeField: String, val prefsPin: String, val keysPin: String) {
    val pins get() = mapOf(tierOwner to tierPin, prefs to prefsPin, keys to keysPin)
}
internal val gpsPlay534 = GpsPolicy("Lii/b;","u",
    "ea042f04ec458e4e34fdd028ad7268fdab693845787a21e3f0e4c8ca4d9d9e45",
    "96adf035153a0e83238c0a5d88c896806c1b0a53cc0bd83151a6a3f82e2bf952",
    "Ln6/k;","Lpd/f0;","m","D0",
    "dcc63932b06d4d74147fee8c3647c1ed9df798eab4b55d437b0ceee2277e7db1",
    "4247b20e2b65de516db7be5177923f5ee712f04a976481225b2b53e6af82c530")
internal val gpsUnlocked534 = GpsPolicy("Lii/b;","u",
    "5340565dd17253945565aca2206cfcdc0a40bef4aaad30847edd076887ac4a95",
    "4e36d8f89506d2d65489a29e7d230b66d08f14dd33deda7ca3c6d3895437fe8a",
    "Ln6/k;","Lpd/f0;","m","H0",
    "bfe7ca090f93cde3b8dd60bb4d2bf8df3532cea3233827c5c9714ed6e9efc443",
    "e56ce9d9a7f90bf439f099b5f00f3eafde1b5bd2d5fc48f2194e2ecaabfeba34")
internal fun requireGpsTarget(pkg: String?, version: String?, code: String?) {
    require(pkg==GPS_PACKAGE && version=="5.3.4" && code=="3031") { "Unsupported GPS JoyStick package/version/build" }
}
internal fun gpsClassHash(c: ClassDef): String {
    val pool= DexPool(Opcodes.forDexVersion(39));pool.internClass(c)
    val store=MemoryDataStore();pool.writeTo(store)
    return MessageDigest.getInstance("SHA-256").digest(store.data).joinToString("") { "%02x".format(it) }
}

/** App-owned local tier read used by feature/UI gates, not the stored Boolean
 * flags or any Billing SDK classifier. Keep original cache/receipt writes intact. */
internal fun enableGpsLocalTier(method: MutableMethod, policy: GpsPolicy) {
    require(method.definingClass==policy.tierOwner && method.name==policy.tierMethod &&
        method.accessFlags==9 && method.parameterTypes.isEmpty() && method.returnType=="I") { "Unsupported GPS tier resolver" }
    require(method.implementation?.registerCount==14) { "Unsupported GPS tier registers" }
    method.addInstructions(0,"const/4 v0, 0x3\nreturn v0")
}

/** Splash ads use this flag independently of the main UI's tier resolver. */
internal fun enableGpsAdFreePreference(method: MutableMethod, policy: GpsPolicy) {
    require(method.definingClass==policy.prefs && method.name==policy.preferenceMethod && method.accessFlags==1 &&
        method.parameterTypes==listOf(policy.keys,"Ljava/lang/Object;") && method.returnType=="Ljava/lang/Object;") { "Unsupported GPS preference method" }
    val impl=requireNotNull(method.implementation)
    require(impl.registerCount==6) { "Unsupported GPS preference registers" }
    method.addInstructionsWithLabels(0,"""
        sget-object v0, ${policy.keys}->${policy.adFreeField}:${policy.keys}
        if-ne p1, v0, :gps_original
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        return-object v0
    """.trimIndent(),ExternalLabel("gps_original",impl.instructions.first()))
}

/** Match the complete original class-pin set, never individual matching fields.
 * Same package/version/signer does not identify an APK distribution. */
internal fun selectGpsPolicy(hashes: Map<String, String>, policies: List<GpsPolicy> = listOf(gpsPlay534, gpsUnlocked534)): GpsPolicy {
    val matches = policies.filter { policy -> policy.pins.all { (type, pin) -> hashes[type] == pin } }
    require(matches.size == 1) { "Unsupported, ambiguous or already modified GPS JoyStick build" }
    return matches.single()
}

val gpsJoyStickPremiumPatch = bytecodePatch(
    name = "GPS JoyStick: Premium",
    description = "Enable local Premium features and ad-free use in the original GPS JoyStick 5.3.4 Google Play or Unlocked APK. The correct edition is detected automatically. This does not purchase a subscription. Map access is not guaranteed.",
    default = true
) {
    var detectedPolicy: GpsPolicy? = null
    val originalInput = bytecodePatch {
        execute {
            detectedPolicy = null
            requireGpsTarget(packageMetadata.packageName,packageMetadata.versionName,packageMetadata.versionCode)
            requireOriginalCertificate(packageMetadata.signingCertificates.values.flatten(),GPS_SIGNER)
            val hashes = listOf(gpsPlay534, gpsUnlocked534).flatMap { it.pins.keys }.distinct().associateWith { type ->
                val c = requireNotNull(classDefByOrNull(type)) { "Missing GPS JoyStick class: $type" }
                gpsClassHash(c)
            }
            detectedPolicy = selectGpsPolicy(hashes)
        }
    }
    compatibleWith(Compatibility(packageName=GPS_PACKAGE,name="GPS JoyStick",apkFileType=ApkFileType.APK,
        targets=listOf(AppTarget("5.3.4",versionCodes=mapOf(SupportedAbi.ARM64_V8A to 3031),minSdk=23))))
    availability { installer, _ -> if(installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    val mapsKey by stringOption(
        key="mapsApiKey", default="", title="Google Maps API key",
        description="Optional Maps key override; this does not guarantee map access. Leave blank to keep the original key.",
        required=false, validator={value -> isMapsKey(value)}
    )
    dependsOn(rawResourcePatch {
        dependsOn(originalInput)
        execute {
            val policy = requireNotNull(detectedPolicy) { "Missing GPS JoyStick input qualification" }
            if(!mapsKey.isNullOrBlank()) {
                // Raw mode stages binary AXML beside (not at) the decoded XML path.
                // Stage the replacement as a raw root entry: the .bin export alone
                // goes to the decoded workspace, not the returned raw payload.
                val manifest=get("AndroidManifest.xml").resolveSibling("AndroidManifest.xml.bin")
                require(manifest.isFile) { "Missing raw GPS JoyStick manifest" }
                requireGpsTarget(packageMetadata.packageName,packageMetadata.versionName,packageMetadata.versionCode)
                val replacement=replaceMapsKeyBytes(manifest.readBytes(),
                    setOf(policy.manifestHash),
                    "18e4effd43e80b25d94c45bd641313d180d826d876656f1a93383c9ffc9f8628",mapsKey)
                get("./AndroidManifest.xml").writeBytes(replacement)
            }
        }
    })
    execute {
        val policy = requireNotNull(detectedPolicy) { "Missing GPS JoyStick input qualification" }
        requireGpsTarget(packageMetadata.packageName,packageMetadata.versionName,packageMetadata.versionCode)
        val tier=classDefBy(policy.tierOwner).methods.single { it.name==policy.tierMethod && it.parameterTypes.isEmpty() && it.returnType=="I" }
        val prefs=classDefBy(policy.prefs).methods.single { it.name==policy.preferenceMethod && it.parameterTypes==listOf(policy.keys,"Ljava/lang/Object;") && it.returnType=="Ljava/lang/Object;" }
        val prepared=listOf(MutableMethod(tier).also { enableGpsLocalTier(it,policy) },
            MutableMethod(prefs).also { enableGpsAdFreePreference(it,policy) })
        for(replacement in prepared) {
            val owner=mutableClassDefBy(replacement.definingClass)
            val old=owner.methods.single { it.name==replacement.name && it.parameterTypes==replacement.parameterTypes && it.returnType==replacement.returnType }
            require(owner.methods.remove(old));require(owner.methods.add(replacement))
        }
    }
}
