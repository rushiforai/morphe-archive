package app.rimixyz.patches.autoclicker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_AUTOCLICKER
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RETURN_VOID = "return-void"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"

private val PRIVACY_META_DATA = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
)

private val ADVERTISING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

private fun Fingerprint.noOpVoid() {
    method.addInstructions(0, RETURN_VOID)
}

private fun MethodReference.isAnalyticsEvent() =
    definingClass == ANALYTICS_EVENT_METHOD &&
        name == "a" &&
        returnType == "V" &&
        parameterTypes.size == 2 &&
        parameterTypes[0] == "Ljava/lang/String;" &&
        parameterTypes[1] == "Landroid/os/Bundle;"

private fun Method.hasAnalyticsEvent() =
    instructionsOrNull?.any { instruction ->
        (instruction as? ReferenceInstruction)?.reference.let { it as? MethodReference }?.isAnalyticsEvent() == true
    } == true

/**
 * Desliga anúncios e telemetria do Auto Clicker 2.3.0 em um único patch.
 *
 * Anúncios (todos confirmados por engenharia reversa no DEX e na bancada LDPlayer):
 *  - `q2.a.e`: criação/carregamento do `AdView` no `R.id.adViewContainer`;
 *  - `q2.b.j`: cooldown que autoriza `p2.c.onCreate` a criar o helper intersticial;
 *  - `q2.b.l`: exibição no `onBackPressed` de `p2.c`, neutralizada como defesa extra;
 *  - `SplashActivity.onCreate`: chamada a `MobileAds.initialize`, trocada por `nop`
 *    sem tocar no `Handler.postDelayed` de 30 ms que abre `MainActivity`.
 *
 * Telemetria:
 *  - metadados oficiais do Firebase no manifesto desligam Analytics e Crashlytics;
 *  - `s2.e.a`/`s2.e.c` (log e recordException do Crashlytics) viram `return-void`;
 *  - todos os `FirebaseAnalytics.a(String, Bundle)` das classes do app são trocados
 *    por `nop` — são 6 sítios: ACCESSIBILITY_DIALOG_OK, ACCESSIBILITY_DIALOG_CANCEL,
 *    SINGLE_MODE_ENABLE, MULTI_MODE_ENABLE, SERVICE_IS_KILLED e RE_ENABLE_SERVICE;
 *  - permissões de ID publicitário e install referrer são removidas do manifesto.
 *
 * `FirebaseAnalytics.getInstance` e o Remote Config são preservados: remover o
 * objeto deixaria os 6 `logEvent` com NPE. Com os loaders de anúncio cortados,
 * os valores remotos não têm efeito visível.
 */
@Suppress("unused")
val disableAdsAndTrackingPatch = patch(
    name = "Disable ads and tracking",
    description = "Blocks ads, analytics, crash reporting, and advertising ID access. " +
        "Auto Clicker requires Accessibility.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AUTOCLICKER)

    execute {
        verifyAutoClickerTarget()

        // 1. Banner: nenhum AdView é criado nem carregado.
        BannerLoadFingerprint.noOpVoid()

        // 2. Intersticial: j() == false impede até a criação do helper q2.b.
        InterstitialCooldownFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        InterstitialShowFingerprint.noOpVoid()

        // 3. Inicialização do SDK de ads sem alterar o resto do onCreate.
        val splash = MobileAdsInitFingerprint.method
        val splashInstructions = splash.instructions.toList()
        val initIndex = splashInstructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == MOBILE_ADS && ref.name == "initialize"
        }
        check(initIndex >= 0) {
            "Disable ads and tracking: MobileAds.initialize não encontrado no SplashActivity"
        }
        splash.replaceInstruction(initIndex, "nop")

        // 4. Crashlytics direto.
        CrashlyticsLogFingerprint.noOpVoid()
        CrashlyticsRecordFingerprint.noOpVoid()

        // 5. Eventos GA4 nas classes do app (evita mexer em código de biblioteca).
        var eventsDisabled = 0
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(ANALYTICS_EVENT_OWNER)) return@classDefForEach
            if (classDef.methods.none { it.hasAnalyticsEvent() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasAnalyticsEvent()) return@forEach
                val hits = method.instructions.toList().mapIndexedNotNull { index, instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref?.isAnalyticsEvent() == true) index else null
                }
                hits.forEach { method.replaceInstruction(it, "nop") }
                eventsDisabled += hits.size
            }
        }
        check(eventsDisabled > 0) {
            "Disable ads and tracking: nenhum FirebaseAnalytics.logEvent encontrado nas classes do app"
        }

        // 6. Manifest: flags oficiais do Firebase e remoção de IDs publicitários.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").single()

            for ((key, value) in PRIVACY_META_DATA) {
                val existing = application.children("meta-data")
                    .filter { it.attribute(ATTR_NAME) == key }
                if (existing.isEmpty()) {
                    application.appendChild("meta-data") {
                        setAttribute(ATTR_NAME, key)
                        setAttribute(ATTR_VALUE, value)
                    }
                } else {
                    existing.forEach { it.setAttribute(ATTR_VALUE, value) }
                }
            }

            manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_PERMISSIONS }
                .forEach { it.remove() }
        }
    }
}
