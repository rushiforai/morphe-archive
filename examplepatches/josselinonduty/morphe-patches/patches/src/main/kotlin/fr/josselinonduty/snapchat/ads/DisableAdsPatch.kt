package fr.josselinonduty.snapchat.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import fr.josselinonduty.shared.prepend
import fr.josselinonduty.shared.removeUsesPermissions
import fr.josselinonduty.shared.returnFalse
import fr.josselinonduty.snapchat.SNAPCHAT
import fr.josselinonduty.snapchat.snapBytecodePatch

private const val SINGLE = "Lio/reactivex/rxjava3/core/Single;"
private const val SINGLE_JUST = "Lio/reactivex/rxjava3/internal/operators/single/SingleJust;"

// Anchor (14.33.1.0: Lmcp;->f(Lwb0;Lmzg;)Z): the single per-surface ad gate
// ("Ads:Gate:isAdEnabled") consulted before ad items are inserted into
// Stories / Spotlight / Chat feeds. Returning false disables ad insertion only;
// unrelated feed logic lives in the neighbouring method.
// Spec: S2.2.
object AdEnabledGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L", "L"),
    strings = listOf("Ads:Gate:isAdEnabled"),
)

// Anchor (14.33.1.0: Li751;->a): base of every Blizzard upload-window runner
// (subclasses Lji7;/Lli7;, driven by BlizzardV2DurableJob processor Lzs7;).
// Structure: Set.isEmpty() early-out + ObservableFlatMapSingle fan-out.
// Its own empty-set path returns Single.just(window): a clean success, so no retry storm.
// Spec: S1.1.
object BlizzardUploadFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = SINGLE,
    parameters = listOf("L"),
    custom = { _, classDef -> AccessFlags.ABSTRACT.isSet(classDef.accessFlags) }, // runner base class
    filters = listOf(
        methodCall(definingClass = "Ljava/util/Set;", name = "isEmpty"),
        methodCall(
            definingClass = "Lio/reactivex/rxjava3/internal/operators/observable/ObservableFlatMapSingle;",
            name = "<init>",
        ),
    ),
)

// Anchor (14.33.1.0: Ldeh;->buildAdRequest): ConversationAdsManagerDelegate, the JNI delegate the
// native Friends/Chat feed calls to build the request for its sponsored row ("Primark · Publicité").
// Method name and types belong to the JNI interface, so they are not obfuscated.
// Reporting NOTFOUND makes the native side drop the request, so no ad row is inserted.
object ChatFeedAdRequestFingerprint : Fingerprint(
    name = "buildAdRequest",
    returnType = "V",
    parameters = listOf(
        "Lcom/snapchat/client/messaging/BuildAdRequestCallback;",
        "Lcom/snapchat/client/messaging/BuildAdRequestMetadata;",
    ),
    custom = { _, classDef -> !AccessFlags.ABSTRACT.isSet(classDef.accessFlags) },
)

// Spec: S1.4. Anchor: <uses-permission> names (not obfuscated).
private val removeAdIdPermissionsPatch = resourcePatch {
    compatibleWith(SNAPCHAT)
    execute {
        document("AndroidManifest.xml").use {
            it.removeUsesPermissions(
                setOf("com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_AD_ID"),
            )
        }
    }
}

val disableAdsPatch = snapBytecodePatch(
    name = "Disable ads",
    description = "Blocks ad insertion (incl. chat feed sponsored rows), Blizzard analytics uploads and removes the advertising ID permissions.",
) {
    dependsOn(removeAdIdPermissionsPatch)

    execute {
        AdEnabledGateFingerprint.method.returnFalse()

        ChatFeedAdRequestFingerprint.method.prepend(
            """
                sget-object v0, Lcom/snapchat/client/messaging/CallbackStatus;->NOTFOUND:Lcom/snapchat/client/messaging/CallbackStatus;
                invoke-virtual {p1, v0}, Lcom/snapchat/client/messaging/BuildAdRequestCallback;->onError(Lcom/snapchat/client/messaging/CallbackStatus;)V
                return-void
            """,
        )

        BlizzardUploadFingerprint.method.prepend(
            """
                new-instance v0, $SINGLE_JUST
                invoke-direct {v0, p1}, $SINGLE_JUST-><init>(Ljava/lang/Object;)V
                return-object v0
            """,
        )
    }
}
