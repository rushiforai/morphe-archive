/*
 * Ported from ajstrick81's Paramount+ Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/paramount
 * ALL CREDIT FOR THE shouldPlayAd GATE AND THE LIVE SLATE REWRITE GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.paramount.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.ads.ImaPauseAdDisplayFingerprint

// Paramount+ phone 17.2.0 (versionCode 420000962). The Avia player library
// keeps its names here, as in the TV app, so the TV seams match by name.

// Avia's DAI provider asks shouldPlayAd(pod) for every ad pod. When it
// answers false, the provider takes its own skip-the-pod path: the break
// never starts and content continues. Private in 17.2.0 (public on TV), so
// access flags are not pinned.
internal object ShouldPlayAdFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, _ ->
        method.name == "shouldPlayAd" &&
            method.definingClass.endsWith("/AviaDAIResourceProvider;")
    },
)

// Avia's OkHttp interceptor sees every stream request, including live ad-pod
// segments (Google DAI pod serving, "/linear/pods/v1/").
internal object AviaNetworkInterceptorFingerprint : Fingerprint(
    returnType = "Lokhttp3/Response;",
    custom = { method, _ ->
        method.name == "intercept" &&
            method.definingClass.endsWith("/AviaNetworkInterceptor;")
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes on-demand pre-roll and mid-roll ads and pause ads in the Paramount+ " +
        "phone app. Live sports commercial breaks are replaced with Paramount's own " +
        "\"Commercial in Progress\" card, because live ads cannot be skipped past.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // 1) Every ad pod: "do not play". shouldPlayAd has .locals 1.
        ShouldPlayAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // 2) Pause ads: IMA's pause-ad display handler (see the fingerprint).
        ImaPauseAdDisplayFingerprint.method.addInstructions(0, "return-void")

        // 3) Live sports: rewrite each live ad-pod segment request to the same
        //    pod's slate rendition, the TV patch's mechanism unchanged.
        //    OkHttp keeps its public names in this build (Chain.request,
        //    Request.url, Builder.url, Chain.proceed). intercept() has
        //    .locals 16, so v0-v5 are free scratch registers at entry, and p1
        //    (v17) is copied with move-object/from16.
        AviaNetworkInterceptorFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                invoke-interface {v0}, Lokhttp3/Interceptor${'$'}Chain;->request()Lokhttp3/Request;
                move-result-object v1
                invoke-virtual {v1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;
                move-result-object v1
                invoke-virtual {v1}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;
                move-result-object v1
                const-string v2, "/linear/pods/v1/"
                invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :msp_continue
                const-string v2, "/slate/"
                invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :msp_continue
                const-string v2, "^.*[?&]d=([0-9]+).*${'$'}"
                const-string v3, "${'$'}1"
                invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v2
                const-string v3, "[0-9]+"
                invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v3
                if-eqz v3, :msp_learned
                const-string v3, "msp.slate.d"
                invoke-static {v3, v2}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                :msp_learned
                const-string v2, "/([0-9]+)/([0-9]+)/([0-9]+)/([0-9a-fA-F]{32})/"
                const-string v3, "/${'$'}1/slate/0/${'$'}4/"
                invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v4
                const-string v2, "?"
                invoke-virtual {v4, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :msp_haveq
                new-instance v2, Ljava/lang/StringBuilder;
                invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
                invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "?d="
                invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "msp.slate.d"
                const-string v5, "4972"
                invoke-static {v3, v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v3
                invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v4
                :msp_haveq
                invoke-interface {v0}, Lokhttp3/Interceptor${'$'}Chain;->request()Lokhttp3/Request;
                move-result-object v2
                invoke-virtual {v2}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request${'$'}Builder;
                move-result-object v2
                invoke-virtual {v2, v4}, Lokhttp3/Request${'$'}Builder;->url(Ljava/lang/String;)Lokhttp3/Request${'$'}Builder;
                move-result-object v2
                invoke-virtual {v2}, Lokhttp3/Request${'$'}Builder;->build()Lokhttp3/Request;
                move-result-object v2
                invoke-interface {v0, v2}, Lokhttp3/Interceptor${'$'}Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;
                move-result-object v5
                return-object v5
                :msp_continue
                nop
            """.trimIndent(),
        )
    }
}
