package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants as JustWatch
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants as Mlb
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants as NewsNation
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants as AppleTv

// ─────────────────────────────────────────────────────────────────────────────
// Hide device identifiers (OPT-IN, default OFF).
//
// One patch with a checkbox per item, so each app lists one entry instead of
// nine. Each option runs the shared code it names and adds nothing when it is
// off:
//
//   Android ID and advertising ID   hideIds(), below (on by default)
//   Carrier, Carrier name           spoofCarrier(), SpoofCarrierPatch.kt
//   Report Wi-Fi connection, VPN    rewriteNetworkState(), SpoofNetworkStatePatch.kt
//   Nearby Wi-Fi networks,
//   Bluetooth scanning,
//   Cell tower info,
//   Background location             rewriteCalls() and the manifest helpers,
//                                   HideNearbyPatches.kt
//
// The manifest changes (Bluetooth's beacon wake-up receiver, background
// location) run in a resource patch this one depends on, which reads the same
// options.
//
// Android ID and advertising ID. Three layers, mapped in Tubi 10.42.0, Disney+ 26.20.0, Pluto TV 17.2.0 and
// Paramount+ 17.2.0:
//
//   1. ANDROID_ID: every Settings.Secure.getString(ContentResolver, String)
//      call outside our extension is pointed at DeviceIdSpoofer, which
//      answers ANDROID_ID with a random per-install value and passes every
//      other setting through (14 / 9 / 14 call sites).
//   2. Advertising ID through Google's client: AdvertisingIdClient.Info
//      reports the all-zeros ID with "limit ad tracking" on, which is what
//      apps see after the user deletes the ad ID in Android settings. Play
//      Services keeps these names, so they match in all three apps.
//   3. Advertising ID through a direct bind: some SDKs skip the client and
//      bind Google's ad-ID service themselves (Adjust and Google conversion
//      tracking in Tubi, comScore in Pluto). Their copy of the service action
//      is renamed so the bind finds no service and they get no ID, the same
//      as on a device without Play Services. Google's own client keeps the
//      real action, because layer 2 already zeroes what it returns.
//
//   4. Truth Social: the app sends Adjust's device ID to its own server
//      (/api/v1/attribution/device). Its request body is given a random
//      per-install ID from DeviceIdSpoofer.maskId instead.
//
// Not touched: the Widevine DRM device ID (faking it breaks playback) and IDs
// an app generates and stores itself (clearing the app's data resets those).
// ─────────────────────────────────────────────────────────────────────────────

private const val SPOOFER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/DeviceIdSpoofer;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"
private const val AD_ID_CLIENT_PACKAGE = "Lcom/google/android/gms/ads/identifier/"
private const val AD_ID_SERVICE_ACTION = "com.google.android.gms.ads.identifier.service.START"
private const val ZERO_AD_ID = "00000000-0000-0000-0000-000000000000"
private const val TRUTH_ATTRIBUTION_BODY = "Lcom/truthsocial/app/data/api/service/attribution/AttributionDeviceBody;"

internal object AdvertisingIdInfoGetIdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
    name = "getId",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal object AdvertisingIdInfoLimitTrackingFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
    name = "isLimitAdTrackingEnabled",
    parameters = listOf(),
    returnType = "Z",
)

private fun Instruction.isSecureGetString(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return reference.definingClass == "Landroid/provider/Settings\$Secure;" &&
        reference.name == "getString" &&
        reference.parameterTypes.map { it.toString() } ==
        listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;")
}

private fun Instruction.isAdIdServiceAction(): Boolean =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as? StringReference)?.string == AD_ID_SERVICE_ACTION

internal fun BytecodePatchContext.hideIds() {
    // Layer 2. Both getters are plain field reads, so p0 (this) is free
    // to hold the return value.
    AdvertisingIdInfoGetIdFingerprint.methodOrNull?.addInstructions(
        0,
        """
            const-string p0, "$ZERO_AD_ID"
            return-object p0
        """.trimIndent(),
    )
    AdvertisingIdInfoLimitTrackingFingerprint.methodOrNull?.addInstructions(
        0,
        """
            const/4 p0, 0x1
            return p0
        """.trimIndent(),
    )

    // Layers 1 and 3. Collect first, mutate after: mutableClassDefBy swaps
    // the class map entry, which must not happen mid-iteration.
    val idTargets = mutableListOf<String>()
    val actionTargets = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        val instructions = classDef.methods.flatMap { it.implementation?.instructions ?: emptyList() }
        if (instructions.any { it.isSecureGetString() }) idTargets += classDef.type
        if (!classDef.type.startsWith(AD_ID_CLIENT_PACKAGE) &&
            instructions.any { it.isAdIdServiceAction() }
        ) {
            actionTargets += classDef.type
        }
    }

    val replacement = "$SPOOFER->getSecureString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;"
    idTargets.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            // Snapshot: replaceInstruction mutates the live list.
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.isSecureGetString()) return@forEachIndexed
                // Same registers, same order: only the target changes.
                val smali = when (instruction) {
                    is FiveRegisterInstruction ->
                        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, $replacement"
                    is RegisterRangeInstruction ->
                        "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + 1} }, $replacement"
                    else -> return@forEachIndexed
                }
                method.replaceInstruction(index, smali)
            }
        }
    }

    actionTargets.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.isAdIdServiceAction()) return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(
                    index,
                    "const-string v$register, \"semicoloncolonel.mobilestream.no-ad-id-service\"",
                )
            }
        }
    }

    // Layer 4 (Truth Social). AttributionDeviceBody(String adjustDeviceId).
    classDefByOrNull(TRUTH_ATTRIBUTION_BODY)?.let {
        mutableClassDefBy(TRUTH_ATTRIBUTION_BODY).methods
            .filter { it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;") }
            .forEach { constructor ->
                constructor.addInstructions(
                    0,
                    """
                        invoke-static { p1 }, $SPOOFER->maskId(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object p1
                    """.trimIndent(),
                )
            }
    }
}

// RetailMeNot's Expo permission module rejects calls about a permission the
// manifest does not declare, and 10.1.0's root screen asks about background
// location at startup, so removing it left a blank screen. RetailMeNot has its
// own Block background location, which denies the permission through Expo.
private const val RETAILMENOT = "com.whaleshark.retailmenot"

// False for an option this bundle does not declare, such as Bluetooth scanning in the TV bundle.
private fun option(key: String): Boolean =
    runCatching { hideDeviceIdentifiersPatch.options[key].value == true }.getOrDefault(false)

internal val deviceIdentifiersManifestPatch: ResourcePatch = resourcePatch {
    execute {
        if (option("bluetooth")) removeBeaconWakeup()
        if (option("backgroundLocation")) {
            val packageName = document("AndroidManifest.xml").use {
                (it.getElementsByTagName("manifest").item(0) as Element).getAttribute("package")
            }
            if (packageName != RETAILMENOT) removeBackgroundLocation()
        }
    }
}

@Suppress("unused")
val hideDeviceIdentifiersPatch: BytecodePatch = bytecodePatch(
    name = "Hide device identifiers",
    description = "Hides details about your device from the app. " +
        "Choose which ones in the patch options.",
    default = false,
) {
    compatibleWith(
        Tubi.COMPATIBILITY,
        Disney.COMPATIBILITY,
        Pluto.COMPATIBILITY,
        HboMax.COMPATIBILITY,
        HboMax.STREAM_COMPATIBILITY,
        Peacock.COMPATIBILITY,
        Mgm.COMPATIBILITY,
        FoxOne.COMPATIBILITY,
        Starz.COMPATIBILITY,
        Pbs.COMPATIBILITY,
        Espn.COMPATIBILITY,
        Nfl.COMPATIBILITY,
        Nba.COMPATIBILITY,
        JustWatch.COMPATIBILITY,
        Mlb.COMPATIBILITY,
        NewsNation.COMPATIBILITY,
    )

    dependsOn(deviceIdentifiersManifestPatch)

    extendWith("extensions/extension.mpe")

    val deviceIds by booleanOption(
        key = "deviceIds",
        default = true,
        title = "Android ID and advertising ID",
        description = "Gives the app a random Android ID and a zeroed advertising ID. The DRM ID is left alone, " +
            "so playback works.",
    )
    val hideVpn by booleanOption(
        key = "hideVpn",
        default = false,
        title = "VPN connection",
        description = "Hides an active VPN from the app's checks on the device. " +
            "The app's servers can still detect a VPN from your IP address.",
    )
    val wifiNetworks by booleanOption(
        key = "wifiNetworks",
        default = false,
        title = "Nearby Wi-Fi networks",
        description =
            "Hides nearby Wi-Fi networks and the name of yours. Smart-home setup in the app can be affected.",
    )
    val bluetooth by booleanOption(
        key = "bluetooth",
        default = false,
        title = "Bluetooth scanning",
        description =
            "Stops the app's scans for Bluetooth devices and beacons, and hides paired devices from it. " +
                "Smart-home setup in the app stops working. Remotes and controllers keep working.",
    )
    // Read by deviceIdentifiersManifestPatch through option().
    booleanOption(
        key = "backgroundLocation",
        default = false,
        title = "Background location",
        description =
            "Removes the app's access to your location while it is closed or in the background.",
    )

    execute {
        if (deviceIds == true) hideIds()
        // Before the Wi-Fi networks rewrite, which also covers the calls this
        // one rewrote.
        if (hideVpn == true) rewriteNetworkState()
        if (hideVpn == true) hideVpn()
        if (wifiNetworks == true) rewriteCalls(WIFI_REWRITES)
        if (bluetooth == true) rewriteCalls(BLUETOOTH_REWRITES)
    }
}
