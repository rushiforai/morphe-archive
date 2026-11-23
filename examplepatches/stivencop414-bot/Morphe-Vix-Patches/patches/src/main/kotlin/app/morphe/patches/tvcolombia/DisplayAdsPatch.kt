package app.morphe.patches.tvcolombia

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val CONFIG = "Lcolombia/tv/plus/config;"
private const val STARTUP = "Lcolombia/tv/plus/empezar;"
private const val CONTEXT = "Landroid/content/Context;"
private const val PREFERENCES = "Landroid/content/SharedPreferences;"

private fun adEntry(owner: String, parameters: List<String>, result: String, evidence: String) = Fingerprint(
    definingClass = owner,
    parameters = parameters,
    returnType = result,
    filters = listOf(
        string("sinads"),
        methodCall(definingClass = PREFERENCES, name = "getBoolean"),
        string(evidence),
    ),
)

private val startupFingerprint = Fingerprint(
    definingClass = STARTUP,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = CONFIG, name = "E1", returnType = "I"),
        string("appopenad"),
        methodCall(definingClass = "Lcom/wortise/ads/fullscreen/FullscreenAd;", name = "loadAd"),
    ),
)

private val startupContinuation = Fingerprint(
    definingClass = STARTUP,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        string("pwd_validado"),
        methodCall(definingClass = PREFERENCES, name = "getBoolean"),
    ),
)

private val entryInterstitial = adEntry(CONFIG, listOf(CONTEXT, "Z", "Z", "Z", "Z", "Z"), "V", "n_imp_chat")
private val exitInterstitial = adEntry(CONFIG, listOf(CONTEXT), "V", "n_imp")
private val banner = Fingerprint(
    definingClass = CONFIG,
    parameters = listOf(CONTEXT, "Z", "Z"),
    returnType = "Lcolombia/tv/plus/m;",
    filters = listOf(
        string("sinads"),
        methodCall(definingClass = "Lcom/facebook/ads/AdView;", name = "loadAd"),
        methodCall(definingClass = "Lcom/wortise/ads/banner/BannerAd;", name = "loadAd"),
    ),
)
private val displaySlots = listOf(
    "t_menugrid" to listOf("I"),
    "t_submenu" to listOf("I"),
    "t_submenu_ultimas" to listOf("I"),
    "t_radio" to emptyList(),
    "t_qr" to emptyList(),
    "profile" to emptyList(),
).map { (screen, parameters) ->
    screen to Fingerprint(
        definingClass = "Lcolombia/tv/plus/$screen;",
        parameters = parameters,
        returnType = "V",
        filters = listOf(
            string("sinads"),
            methodCall(definingClass = "Lcom/wortise/ads/banner/BannerAd;", name = "loadAd"),
            methodCall(definingClass = "Lcom/fyber/inneractive/sdk/external/InneractiveAdSpot;", name = "requestAd"),
        ),
    )
}

private val cardAds = Fingerprint(
    definingClass = "Lcolombia/tv/plus/t_card;",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        string("cards_"),
        string("sinads"),
        methodCall(definingClass = "Lcom/facebook/ads/NativeAdBase;", name = "loadAd"),
    ),
)

private const val APPNEXT_PRELOAD = "Lcom/appnext/nativeads/AdLoader;"
private const val STARTAPP_PRELOAD = "Lcom/startapp/sdk/ads/nativead/StartAppNativeAd;"
private val startupPreloads = Fingerprint(
    definingClass = STARTUP,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        string("sinads_fhasta"),
        methodCall(definingClass = APPNEXT_PRELOAD, name = "load"),
        string("IN-CHAT"),
        methodCall(definingClass = STARTAPP_PRELOAD, name = "loadAd"),
    ),
)

private val vastRequests = listOf("t_video", "t_video_pro").map { screen ->
    screen to Fingerprint(
        definingClass = "Lcolombia/tv/plus/$screen\$r;",
        parameters = listOf("[Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        filters = listOf(
            string("https://global.appnext.com/offerWallApi.aspx?id="),
            string("&type=vast&vast_ver=3.0&duration=all&packageId="),
        ),
    )
}

private fun MutableMethod.skipCardPlacement() {
    val code = instructions.toList()
    val setting = code.indices.singleOrNull {
        ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == "sinads"
    } ?: throw PatchException("Expected one local ad placement guard in $definingClass->$name")
    val result = code.getOrNull(setting + 2) as? OneRegisterInstruction
    val guard = code.getOrNull(setting + 3) as? BuilderOffsetInstruction
    val branchRegister = (guard as? OneRegisterInstruction)?.registerA
    if (result == null || code[setting + 2].opcode != Opcode.MOVE_RESULT ||
        guard == null || guard.opcode != Opcode.IF_NEZ || branchRegister != result.registerA
    ) {
        throw PatchException("Card advertisement fallback branch changed")
    }
    replaceInstruction(setting + 3, BuilderInstruction20t(Opcode.GOTO_16, guard.target))
}

private fun MutableMethod.skipOptionalPreloads() {
    val code = instructions.toList()
    for ((owner, call) in listOf(APPNEXT_PRELOAD to "load", STARTAPP_PRELOAD to "loadAd")) {
        val index = code.indices.singleOrNull {
            val ref = (code[it] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == owner && ref.name == call
        } ?: throw PatchException("Expected one preload call to $owner->$call")
        if (code.getOrNull(index + 1)?.opcode in
            listOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE)
        ) {
            throw PatchException("The preload call $owner->$call now has a consumer")
        }
        replaceInstruction(index, BuilderInstruction10x(Opcode.NOP))
    }
}

private fun Fingerprint.requireOne(label: String): MutableMethod {
    val matches = matchAll().toList()
    if (matches.size != 1) throw PatchException("Expected one $label method, found ${matches.size}")
    return matches.single().method
}

private fun skipStartupAds() {
    val startup = startupFingerprint.requireOne("startup ads")
    val continuation = startupContinuation.requireOne("startup continuation")
    val instructions = startup.instructions.toList()
    val selector = instructions.indices.singleOrNull {
        val ref = (instructions[it] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == CONFIG && ref.name == "E1" && ref.returnType == "I"
    } ?: throw PatchException("Startup ad selector call changed")

    // The selector's zero route can still load a native ad. Match the native ad's
    // error callback by marking it complete and calling the normal continuation.
    startup.addInstructions(
        selector,
        """
        const/4 v0, 0x1
        iput-boolean v0, p0, $STARTUP->s:Z
        invoke-virtual {p0}, $STARTUP->${continuation.name}()V
        return-void
        """.trimIndent(),
    )
}

@Suppress("unused")
val blockDisplayAds = patch(
    name = "Block startup ads, banners and interstitials",
    description = "Blocks automatic app-open ads, display ads in app screens, interstitials, and client-side VAST prerolls.",
) {
    category("Ads")
    compatibleWith(tvColombia)

    execute {
        skipStartupAds()
        entryInterstitial.requireOne("entry interstitial").addInstructions(0, "return-void")
        exitInterstitial.requireOne("exit interstitial").addInstructions(0, "return-void")
        displaySlots.forEach { (screen, slot) ->
            slot.requireOne("$screen ad loader").addInstructions(0, "return-void")
        }
        cardAds.requireOne("card rendering").skipCardPlacement()
        startupPreloads.requireOne("startup preloads").skipOptionalPreloads()
        vastRequests.forEach { (screen, request) ->
            // The existing completion callback treats an empty response as no ad and starts playback.
            request.requireOne("$screen VAST request").addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
        }
        banner.requireOne("banner loader").addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
