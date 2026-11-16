package app.badfella.patches.sciencenews

import app.badfella.patches.util.commitAll
import app.badfella.patches.util.loadDexHandles
import app.badfella.patches.util.resolveUniqueClass
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import org.w3c.dom.Element

private const val PREFERENCES = "Lcom/appsfornexus/sciencenews/utils/AppPreferences;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

/**
 * Science News Daily keeps one persisted subscription flag that the client reads everywhere:
 * AppPreferences.getSubscriptionStatus(Context) reads the "SUBSCRIPTION_STATUS" boolean from the
 * "subscriptionpref" file. Its only writer is setSubscriptionStatus(), called from the server
 * entitlement callback (PremiumEntitlementManager$1.onResponse) after /api/premium/me or
 * /api/premium/verify, so the flag is a cached copy of the server answer.
 *
 * Every consumer is local presentation or advertising: app-open, banner, interstitial and
 * reward-ad gates, upsell dialogs and menus, the download-news action, list layouts and the
 * settings badge. The premium article list comes from the public sciquest.org WordPress REST
 * endpoint and is not authorized by this flag, so enabling it unlocks no withheld server content
 * and writes no purchase.
 *
 * In addition, stock builds include Google Play's PairIP license check wrapper
 * (com.pairip.application.Application and com.pairip.licensecheck.LicenseActivity), which shows a
 * "Get this app from Play Store" blocker dialog when the app is installed from outside Google Play.
 * The patch restores the real application class (com.appsfornexus.sciencenews.AppController) in the
 * manifest, removes the PairIP licensing activity and stamp metadata, and replaces the subscription
 * gate with a constant-true return.
 */
@Suppress("unused")
val scienceNewsLocalSubscriptionPatch = resourcePatch(
    name = "Science News Daily local subscription",
    description = "Reports the cached subscription flag as active, so ad-free reading, premium-post browsing, downloads and upsell-free screens stay enabled. Neutralizes the PairIP installation check so the app runs when installed outside Play Store. Preserves sign-in, Google Play billing callbacks, restore and the server verification request.",
) {
    compatibleWith(Compatibility(
        name = "Science News Daily",
        packageName = "com.appsfornexus.dailysciencenews",
        apkFileType = ApkFileType.APKS,
        targets = listOf(
            AppTarget(
                version = "23.8",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 238),
                description = "Version 23.8, build 238 (ARM64 split).",
            ),
        ),
    ))
    execute {
        val dexes = loadDexHandles(this)
        val (handle, owner) = dexes.resolveUniqueClass(PREFERENCES)
        var edits = 0
        val methods = owner.methods.map { method ->
            if (method.name != "getSubscriptionStatus" || method.returnType != "Z" ||
                method.parameterTypes.map { it.toString() } != listOf("Landroid/content/Context;")) {
                return@map method
            }
            check(method.accessFlags == 9) { "Science News subscription gate is no longer static" }
            val implementation = checkNotNull(method.implementation)
            check(implementation.registerCount == 3 && implementation.tryBlocks.isEmpty()) {
                "Science News subscription gate shape changed"
            }
            val code = implementation.instructions.toList()
            check(code.size == 8) { "Science News subscription gate instruction count changed" }
            check(code[0].opcode == Opcode.CONST_STRING &&
                (code[0] as ReferenceInstruction).reference.toString() == "subscriptionpref") {
                "Science News subscription preference file changed"
            }
            check(code[1].opcode == Opcode.CONST_4 &&
                (code[1] as NarrowLiteralInstruction).narrowLiteral == 0) {
                "Science News preference mode changed"
            }
            check(code[2].opcode == Opcode.INVOKE_VIRTUAL &&
                (code[2] as ReferenceInstruction).reference.toString() ==
                "Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;") {
                "Science News preference lookup changed"
            }
            check(code[3].opcode == Opcode.MOVE_RESULT_OBJECT) { "Science News preference result changed" }
            check(code[4].opcode == Opcode.CONST_STRING &&
                (code[4] as ReferenceInstruction).reference.toString() == "SUBSCRIPTION_STATUS") {
                "Science News subscription key changed"
            }
            check(code[5].opcode == Opcode.INVOKE_INTERFACE &&
                (code[5] as ReferenceInstruction).reference.toString() ==
                "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z") {
                "Science News subscription read changed"
            }
            check(code[6].opcode == Opcode.MOVE_RESULT) { "Science News subscription result changed" }
            check(code[7].opcode == Opcode.RETURN) { "Science News subscription return changed" }
            edits++
            ImmutableMethod(
                method.definingClass, method.name, method.parameters, method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                ImmutableMethodImplementation(
                    implementation.registerCount,
                    listOf(
                        ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                        ImmutableInstruction11x(Opcode.RETURN, 0),
                    ),
                    emptyList(), emptyList(),
                ),
            )
        }
        check(edits == 1) { "Expected one Science News subscription gate, found $edits" }
        handle.replaceClass(owner, ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass,
            owner.interfaces, owner.sourceFile, owner.annotations, owner.fields, methods))
        dexes.commitAll()

        document("AndroidManifest.xml").use { manifest ->
            val app = manifest.getElementsByTagName("application").item(0) as Element
            if (app.getAttributeNS(ANDROID, "name") == "com.pairip.application.Application") {
                app.setAttributeNS(ANDROID, "android:name", "com.appsfornexus.sciencenews.AppController")
            }

            val removeTags = setOf("activity", "meta-data")
            val nodes = manifest.getElementsByTagName("*")
            for (i in nodes.length - 1 downTo 0) {
                val node = nodes.item(i) as Element
                val name = node.getAttributeNS(ANDROID, "name")
                if (node.tagName in removeTags) {
                    if (name.startsWith("com.pairip.") || name.startsWith("com.android.stamp.")) {
                        node.parentNode.removeChild(node)
                    }
                }
            }
        }
    }
}
