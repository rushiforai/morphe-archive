package app.jofslash.patches.booking.links

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.logging.Logger

private const val OPEN_IN_BROWSER = "Lapp/jofslash/extension/booking/OpenInBrowser;"

/** The app's plain web view for pages: help, terms, privacy, links in chats and trips. */
private const val WEB_VIEW_COMPANION = "Lcom/booking/commonui/web/WebViewActivity\$Companion;"
private const val WEB_VIEW_BASE = "Lcom/booking/commonui/web/WebViewBaseActivity;"
private val START_INTENT_PARAMETERS = listOf(
    "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
    "Ljava/lang/String;", "Z",
)
private const val INTENT = "Landroid/content/Intent;"

/**
 * The places whose web view links may open in the browser. Only these, so the booking form,
 * payment, sign-in, Genius and wallet terms in the booking form, request to book, and the flight,
 * car, taxi and attraction funnels keep their web views as they are, as does anything new.
 */
private val CHANGED_PLACES = listOf(
    "Lcom/booking/assistant/", // Messages with the property and customer service: privacy links.
    "Lcom/booking/convui/", // Chat screens: links in bundle details.
    "Lcom/booking/appindex/", // Home screen discovery feed links.
    "Lcom/booking/deeplink/scheme/handler/OpenUrlActionHandler", // booking.com "open url" links.
    "Lcom/booking/di/membershiphub/", // Complaints page.
    "Lcom/booking/di/selfservice/", // Request status links.
    "Lcom/booking/property/", // Hotel page: "how we work".
    "Lcom/booking/qnacomponents/", // Questions and answers guideline.
    "Lcom/booking/settings/", // Settings: about, terms, privacy, licences.
    "Lcom/booking/tripidea/", // Trip ideas.
    "Lcom/booking/trippresentation/", // Links in My Trips.
    "Lcom/booking/trips/", // Links in trip notes.
    "Lcom/booking/wishlist/", // Shared wishlist links.
)

@Suppress("unused")
val openLinksInBrowserPatch = bytecodePatch(
    name = "Open links in browser",
    description = "Opens links to other websites in your browser (a Custom Tab where the browser has " +
            "them) instead of the app's own web view, from help, terms and privacy pages, chats, trips, " +
            "wishlists and settings. Booking.com's own pages, sign-in, payment, 3-D Secure and the booking " +
            "form stay in the app.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // 1. Where the listed places open a page: WebViewActivity.Companion.getStartIntent(context,
        // url, title, userAgent, language, showRefresh) becomes OpenInBrowser.getStartIntent with
        // the same arguments, which returns a browser intent for another site's page, or else the
        // app's own intent marked so that links to other sites in it open in the browser.
        val targets = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (CHANGED_PLACES.none { classDef.type.startsWith(it) }) return@classDefForEach
            val calls = classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.isStartIntentCall() } == true
            }
            if (calls) targets += classDef
        }
        var changed = 0
        targets.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, insn ->
                    if (!insn.isStartIntentCall()) return@forEachIndexed
                    val range = insn as RegisterRangeInstruction
                    method.replaceInstruction(
                        index,
                        BuilderInstruction3rc(
                            Opcode.INVOKE_STATIC_RANGE,
                            range.startRegister,
                            range.registerCount,
                            ImmutableMethodReference(OPEN_IN_BROWSER, "getStartIntent", START_INTENT_PARAMETERS, INTENT),
                        )
                    )
                    changed++
                }
            }
        }
        if (changed == 0) throw PatchException("Couldn't find where pages open in the app's web view")
        Logger.getLogger("OpenLinksInBrowser").info("Changed $changed places that open a web view")

        // 2. A tap on a link to another site, in a web view from step 1, opens the browser. The
        // base class's handler answers for WebViewActivity, which doesn't override it; the
        // extension checks the activity and the mark, so other web views go on as before. The
        // method has no spare register: the extension hands the WebView back in p1 when the page
        // stays in the app, and null when the browser took the link.
        methodOf(
            WEB_VIEW_BASE,
            "shouldOverrideUrlLoading",
            listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
        ).addInstructions(
            0,
            """
                invoke-static { p0, p1, p2 }, $OPEN_IN_BROWSER->shouldOverrideUrlLoading(Ljava/lang/Object;Landroid/webkit/WebView;Ljava/lang/Object;)Landroid/webkit/WebView;
                move-result-object p1
                if-nez p1, :in_app
                const/4 p1, 0x1
                return p1
                :in_app
                nop
            """
        )
    }
}

/** A call of WebViewActivity.Companion.getStartIntent with six arguments (so invoke-static/range). */
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isStartIntentCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC_RANGE && opcode != Opcode.INVOKE_STATIC) return false
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    if (reference.definingClass != WEB_VIEW_COMPANION || reference.name != "getStartIntent") return false
    if (reference.parameterTypes.map { it.toString() } != START_INTENT_PARAMETERS) return false
    if (opcode != Opcode.INVOKE_STATIC_RANGE) {
        throw PatchException("Unexpected getStartIntent call: $opcode")
    }
    return true
}
