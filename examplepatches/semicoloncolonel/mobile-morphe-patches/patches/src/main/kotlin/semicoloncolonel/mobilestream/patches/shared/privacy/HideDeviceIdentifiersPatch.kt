package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants as Fandango
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants as CbsNews
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants as NbcNews
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants as FoxLocal
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants as AbcNews
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants as Moviebase
import semicoloncolonel.mobilestream.patches.shared.SHOPPING_APPS
import semicoloncolonel.mobilestream.patches.amc.shared.Constants as Amc
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants as Cnn
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.hulu.shared.Constants as Hulu
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants as FoxNews
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants as MsNow
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants as NyTimes
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants as Paramount
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants as PrimeVideo
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.tmobileplay.shared.Constants as TMobilePlay
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants as TLife
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants as JustWatch
import semicoloncolonel.mobilestream.patches.mint.shared.Constants as Mint
import semicoloncolonel.mobilestream.patches.verizon.shared.Constants as Verizon
import semicoloncolonel.mobilestream.patches.xfinity.shared.Constants as Xfinity
import semicoloncolonel.mobilestream.patches.att.shared.Constants as Att
import semicoloncolonel.mobilestream.patches.visible.shared.Constants as Visible
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants as WhiteHouse
import semicoloncolonel.mobilestream.patches.recgov.shared.Constants as RecGov
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.xumo.shared.Constants as Xumo
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants as Wsj
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants as WashingtonPost
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants as AppleTv
import semicoloncolonel.mobilestream.patches.nps.shared.Constants as Nps
import semicoloncolonel.mobilestream.patches.fema.shared.Constants as Fema

// ─────────────────────────────────────────────────────────────────────────────
// Hide device identifiers (OPT-IN, default OFF).
//
// Three layers, mapped in Tubi 10.42.0, Disney+ 26.20.0, Pluto TV 17.2.0 and
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
// Not touched: the Widevine DRM device ID (faking it breaks playback) and IDs
// an app generates and stores itself (clearing the app's data resets those).
// ─────────────────────────────────────────────────────────────────────────────

private const val SPOOFER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/DeviceIdSpoofer;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"
private const val AD_ID_CLIENT_PACKAGE = "Lcom/google/android/gms/ads/identifier/"
private const val AD_ID_SERVICE_ACTION = "com.google.android.gms.ads.identifier.service.START"
private const val ZERO_AD_ID = "00000000-0000-0000-0000-000000000000"

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

@Suppress("unused")
val hideDeviceIdentifiersPatch = bytecodePatch(
    name = "Hide device identifiers",
    description = "Gives the app a random Android ID and a zeroed advertising ID.",
    default = false,
) {
    compatibleWith(Tubi.COMPATIBILITY, Disney.COMPATIBILITY, Hulu.COMPATIBILITY, Pluto.COMPATIBILITY, Paramount.COMPATIBILITY, HboMax.COMPATIBILITY, Peacock.COMPATIBILITY, PrimeVideo.COMPATIBILITY, Mgm.COMPATIBILITY, FoxOne.COMPATIBILITY, NyTimes.COMPATIBILITY, WashingtonPost.COMPATIBILITY, Wsj.COMPATIBILITY, Amc.COMPATIBILITY, Starz.COMPATIBILITY, Pbs.COMPATIBILITY, FoxNews.COMPATIBILITY, MsNow.COMPATIBILITY, Cnn.COMPATIBILITY, Espn.COMPATIBILITY, Nfl.COMPATIBILITY, Nba.COMPATIBILITY, Fandango.COMPATIBILITY, CbsNews.COMPATIBILITY, NbcNews.COMPATIBILITY, FoxLocal.COMPATIBILITY, AbcNews.COMPATIBILITY, Moviebase.COMPATIBILITY, TMobilePlay.COMPATIBILITY, TLife.COMPATIBILITY, JustWatch.COMPATIBILITY, Mint.COMPATIBILITY, Xfinity.COMPATIBILITY, Att.COMPATIBILITY, Verizon.COMPATIBILITY, Visible.COMPATIBILITY, WhiteHouse.COMPATIBILITY, Nps.COMPATIBILITY, Fema.COMPATIBILITY, RecGov.COMPATIBILITY, *SHOPPING_APPS, AppleTv.COMPATIBILITY, Xumo.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
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
    }
}
