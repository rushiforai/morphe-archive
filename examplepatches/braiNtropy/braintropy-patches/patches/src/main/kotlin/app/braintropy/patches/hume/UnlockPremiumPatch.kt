package app.braintropy.patches.hume

import app.braintropy.patches.shared.Constants.COMPATIBILITY_HUME
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// A suspend function that returns a value immediately instead of
// COROUTINE_SUSPENDED simply resumes its caller with that value, so
// prepending "return Boolean.TRUE" satisfies the Continuation contract.
private const val RETURN_TRUE = """
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    return-object v0
"""

// SHA-256 (hex) of the Hume 9.29.2 release signing certificate.
private const val ORIGINAL_CERT_SHA256 =
    "7acacaf01b72fc96f212a7470d66bc539e59a826b884c22be380acf051a7c15b"

// SHA-1 digest bytes of the same certificate, as smali array-data lines.
// Reported to Google APIs as the X-Android-Cert header (uppercase hex).
private val ORIGINAL_CERT_SHA1_BYTES = listOf(
    0x99, 0xe0, 0x72, 0x76, 0xa7, 0xab, 0x1c, 0x31, 0xab, 0xdb,
    0xb3, 0x29, 0xbf, 0xb8, 0xed, 0x9f, 0xa6, 0x2e, 0x0b, 0x8f
)

private const val PLAY_STORE_PACKAGE = "com.android.vending"

// Fake Play Billing purchases the app's own IapPurchaseRepositoryImpl sees
// as an active subscription (see the feed helper below for the mechanism).
// SKUs captured from the app's own product-details queries at runtime.
private val FAKE_PURCHASE_SKUS = listOf(
    "com.fittrack.sub.monthly", "com.fittrack.sub.yearly"
)

private fun fakePurchaseJson(sku: String) =
    "{\\\"orderId\\\":\\\"GPA.3394-0432-8823-10001\\\"," +
        "\\\"packageName\\\":\\\"com.elink.fittrackhealth.pro\\\"," +
        "\\\"productId\\\":\\\"$sku\\\"," +
        "\\\"purchaseTime\\\":1790000000000,\\\"purchaseState\\\":0," +
        "\\\"purchaseToken\\\":\\\"braintropy.fake.token.$sku\\\",\\\"quantity\\\":1," +
        "\\\"autoRenewing\\\":true,\\\"acknowledged\\\":true}"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Hume Plus.",
    default = true
) {
    category("Unlock")
    compatibleWith(COMPATIBILITY_HUME)

    execute {
        listOf(
            HasAnyActiveSubscriptionFingerprint,
            HasAnyEntitlementFingerprint,
            HasEntitlementForPaywallFingerprint,
            HasEntitlementForPaywallSyncFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, RETURN_TRUE)
        }

        // The re-signed install carries Morphe's certificate; the backend
        // rejects logins whose reported build signature / installer store
        // are not the Play release ones, surfacing as a fake "no network"
        // error. Report the original values instead.
        GetBuildSignatureFingerprint.method.addInstructions(
            0, "const-string v0, \"$ORIGINAL_CERT_SHA256\"\nreturn-object v0"
        )
        GetInstallerPackageNameFingerprint.method.addInstructions(
            0, "const-string v0, \"$PLAY_STORE_PACKAGE\"\nreturn-object v0"
        )

        // Report the original release certificate to Google APIs. Without
        // this, Hume's API-key Android restriction rejects every Firebase
        // Auth call from the re-signed install.
        GetPackageCertificateHashBytesFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x${ORIGINAL_CERT_SHA1_BYTES.size.toString(16)}
                new-array v0, v0, [B
                fill-array-data v0, :original_cert
                return-object v0
                :original_cert
                .array-data 1
            """.trimIndent() + "\n" +
                ORIGINAL_CERT_SHA1_BYTES.joinToString("\n") { "    0x%xt".format(it) } + "\n" +
                ".end array-data"
        )

        // Feed the fake purchases through the client's own
        // PurchasesUpdatedListener. This listener is the ONLY native source
        // of the Flutter plugin's purchaseStream, and the app's Dart
        // repository reads its subscription state from that stream (it
        // never calls restorePurchases itself). The feed lives in an added
        // helper method because the billing entry points have no free
        // registers to build the purchases inline.
        // Rate limit is essential: an unthrottled feed during
        // queryProductDetailsAsync loops forever (feed -> purchase event ->
        // re-query -> feed), flooding the app until the UI freezes. 1.5s
        // is enough to break that loop while still allowing the tight
        // early retry cadence (+2s/+3s) that unlocks before the home
        // banner can render. The limit is PER CLIENT (keyed by identity
        // hash): a global limit lets Helium's startup queries consume the
        // slot and starve the plugin client. Tracked in a system property
        // to avoid adding fields. Registers 12: v0-v10 locals, v11 = p0.
        val feedPurchasesSmali = """
            iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Lcom/android/billingclient/api/zzs;
            invoke-virtual { v0 }, Lcom/android/billingclient/api/zzs;->zzd()Lcom/android/billingclient/api/PurchasesUpdatedListener;
            move-result-object v0
            if-nez v0, :have_listener
            return-void
            :have_listener
            # monotonic: currentTimeMillis can jump backwards and would suppress feeds
            invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
            move-result-wide v2
            const-string v4, "braintropy.last_feed."
            invoke-static { v11 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
            move-result v5
            invoke-static { v5 }, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
            move-result-object v5
            invoke-virtual { v4, v5 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v4
            invoke-static { v4 }, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v5
            if-eqz v5, :do_feed
            invoke-static { v5 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
            move-result-wide v6
            sub-long v6, v2, v6
            const-wide/16 v8, 0x5dc
            cmp-long v5, v6, v8
            if-gez v5, :do_feed
            return-void
            :do_feed
            invoke-static { v2, v3 }, Ljava/lang/Long;->toString(J)Ljava/lang/String;
            move-result-object v5
            invoke-static { v4, v5 }, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v1
            const/4 v2, 0x0
            invoke-virtual { v1, v2 }, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v1
            invoke-virtual { v1 }, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
            move-result-object v1
            new-instance v3, Ljava/util/ArrayList;
            invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
            const-string v5, ""
            ${
            FAKE_PURCHASE_SKUS.joinToString("\n") { sku ->
                """
                const-string v4, "${fakePurchaseJson(sku)}"
                new-instance v6, Lcom/android/billingclient/api/Purchase;
                invoke-direct { v6, v4, v5 }, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                """.trimIndent()
            }
        }
            invoke-interface { v0, v1, v3 }, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
            return-void
        """
        val feedPurchasesMethod = MutableMethod(
            ImmutableMethod(
                "Lcom/android/billingclient/api/BillingClientImpl;",
                "braintropyFeedPurchases",
                emptyList(),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.SYNTHETIC.value,
                null, null,
                MutableMethodImplementation(12)
            )
        )
        feedPurchasesMethod.implementation!!.apply {
            feedPurchasesSmali.toInstructions(feedPurchasesMethod).forEach { addInstruction(it) }
        }
        QueryPurchasesFingerprint.classDef.methods.add(feedPurchasesMethod)

        // Main-thread-safe entry point: posts BraintropyFeeder(this) to the
        // main looper, where its run() calls braintropyFeedPurchases().
        // Pigeon messages to Dart must be sent on the main thread
        // (FlutterJNI throws @UiThread otherwise and the app dies), and the
        // billing call sites below can run on arbitrary threads.
        // 6 registers: v0-v4 locals, v5 = p0.
        val feedOnMainMethod = MutableMethod(
            ImmutableMethod(
                "Lcom/android/billingclient/api/BillingClientImpl;",
                "braintropyFeedPurchasesOnMain",
                emptyList(),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.SYNTHETIC.value,
                null, null,
                MutableMethodImplementation(6)
            )
        )
        feedOnMainMethod.implementation!!.apply {
            """
                new-instance v0, Lcom/android/billingclient/api/BraintropyFeeder;
                invoke-direct { v0, v5 }, Lcom/android/billingclient/api/BraintropyFeeder;-><init>(Lcom/android/billingclient/api/BillingClientImpl;)V
                new-instance v1, Landroid/os/Handler;
                invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
                move-result-object v2
                invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
                invoke-virtual { v1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
                return-void
            """.toInstructions(feedOnMainMethod).forEach { addInstruction(it) }
        }
        QueryPurchasesFingerprint.classDef.methods.add(feedOnMainMethod)

        // The Dart repository subscribes to the purchase stream ~1.4s
        // after launch, after the plugin client has already connected, so
        // any connect-time feed is always missed. Two helper classes
        // re-feed at +2s, +3s, then every 15s until +60s (covers the
        // 20-60s manual-login window; later unlocks go through the
        // queryProductDetailsAsync hook instead):
        // - BraintropyFeeder (Runnable): one feed, only ever posted to the
        //   main looper (see braintropyFeedPurchasesOnMain for why).
        // - BraintropyFeedLoop (Thread): posts the feeder on the cadence
        //   above. Both classes live in the billing package because
        //   BillingClientImpl is package-private. parkNanos cannot throw
        //   InterruptedException, and any uncaught throw on the thread
        //   would kill the app. Bounded on purpose: every feed briefly
        //   shows the repo's purchase-handling dialog.
        val feederType = "Lcom/android/billingclient/api/BraintropyFeeder;"
        val loopType = "Lcom/android/billingclient/api/BraintropyFeedLoop;"

        // Builds a void ImmutableMethod from smali text.
        // shortcut: without CONSTRUCTOR dexlib files <init>/<clinit> as
        // virtual methods, the dex fails verification, and every modified
        // class in the same output dex disappears at runtime
        // (NoClassDefFoundError) — this flag is load-bearing
        fun smaliMethod(
            type: String, name: String, paramTypes: List<String>,
            flags: Int, registers: Int, smali: String
        ): ImmutableMethod {
            val params: List<com.android.tools.smali.dexlib2.iface.MethodParameter> =
                paramTypes.map { ImmutableMethodParameter(it, null, null) }
            val method = MutableMethod(
                ImmutableMethod(
                    type, name, params, "V", flags, null, null,
                    MutableMethodImplementation(registers)
                )
            )
            method.implementation!!.apply {
                smali.toInstructions(method).forEach { addInstruction(it) }
            }
            return ImmutableMethod(
                type, name, params, "V", flags, null, null,
                ImmutableMethodImplementation.of(method.implementation)
            )
        }

        val kPublic = AccessFlags.PUBLIC.value
        val kCtor = AccessFlags.CONSTRUCTOR.value
        val kStatic = AccessFlags.STATIC.value
        val kSync = AccessFlags.DECLARED_SYNCHRONIZED.value
        val clientType = "Lcom/android/billingclient/api/BillingClientImpl;"

        // Runnable: runs ONE feed. Only ever invoked on the main thread.
        val feederClass = ImmutableClassDef(
            feederType,
            kPublic or AccessFlags.FINAL.value,
            "Ljava/lang/Object;",
            listOf("Ljava/lang/Runnable;"), null, null,
            listOf(
                ImmutableField(
                    feederType, "client", clientType,
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null, null, null
                )
            ),
            listOf(
                smaliMethod(
                    feederType, "<init>", listOf(clientType), kPublic or kCtor, 2,
                    """
                        invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
                        iput-object v1, v0, Lcom/android/billingclient/api/BraintropyFeeder;->client:Lcom/android/billingclient/api/BillingClientImpl;
                        return-void
                    """
                ),
                smaliMethod(
                    feederType, "run", emptyList(), kPublic, 3,
                    """
                        iget-object v0, v2, Lcom/android/billingclient/api/BraintropyFeeder;->client:Lcom/android/billingclient/api/BillingClientImpl;
                        invoke-virtual { v0 }, Lcom/android/billingclient/api/BillingClientImpl;->braintropyFeedPurchases()V
                        return-void
                    """
                )
            )
        )

        // startConnection is often called repeatedly on one client
        // ("Client is already in the process of connecting"), so loop
        // creation goes through a class-synchronized once-per-client
        // guard (keyed by identity hash, released when the loop ends) —
        // otherwise every duplicate call would stack another 90s thread.
        val loopClass = ImmutableClassDef(
            loopType,
            kPublic or AccessFlags.FINAL.value,
            "Ljava/lang/Thread;",
            emptyList(), null, null,
            listOf(
                ImmutableField(
                    loopType, "feeder", feederType,
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null, null, null
                ),
                ImmutableField(
                    loopType, "clientHash", "I",
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                    null, null, null
                ),
                ImmutableField(
                    loopType, "active", "Ljava/util/Set;",
                    AccessFlags.PRIVATE.value or kStatic or AccessFlags.FINAL.value,
                    null, null, null
                )
            ),
            listOf(
                smaliMethod(
                    loopType, "<clinit>", emptyList(), kStatic or kCtor, 1,
                    """
                        new-instance v0, Ljava/util/HashSet;
                        invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
                        sput-object v0, Lcom/android/billingclient/api/BraintropyFeedLoop;->active:Ljava/util/Set;
                        return-void
                    """
                ),
                smaliMethod(
                    loopType, "<init>", listOf(clientType), kPublic or kCtor, 3,
                    """
                        invoke-direct { v1 }, Ljava/lang/Thread;-><init>()V
                        new-instance v0, Lcom/android/billingclient/api/BraintropyFeeder;
                        invoke-direct { v0, v2 }, Lcom/android/billingclient/api/BraintropyFeeder;-><init>(Lcom/android/billingclient/api/BillingClientImpl;)V
                        iput-object v0, v1, Lcom/android/billingclient/api/BraintropyFeedLoop;->feeder:Lcom/android/billingclient/api/BraintropyFeeder;
                        invoke-static { v2 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
                        move-result v0
                        iput v0, v1, Lcom/android/billingclient/api/BraintropyFeedLoop;->clientHash:I
                        return-void
                    """
                ),
                // Guarded entry point (rc 6: v0-v4 locals, v5 = client).
                smaliMethod(
                    loopType, "startOnce", listOf(clientType), kPublic or kStatic or kSync, 6,
                    """
                        sget-object v0, Lcom/android/billingclient/api/BraintropyFeedLoop;->active:Ljava/util/Set;
                        invoke-static { v5 }, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I
                        move-result v1
                        invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                        move-result-object v2
                        invoke-interface { v0, v2 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
                        move-result v3
                        if-nez v3, :start_once_done
                        invoke-interface { v0, v2 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
                        new-instance v3, Lcom/android/billingclient/api/BraintropyFeedLoop;
                        invoke-direct { v3, v5 }, Lcom/android/billingclient/api/BraintropyFeedLoop;-><init>(Lcom/android/billingclient/api/BillingClientImpl;)V
                        invoke-virtual { v3 }, Lcom/android/billingclient/api/BraintropyFeedLoop;->start()V
                        :start_once_done
                        return-void
                    """
                ),
                // Releases the guard when the loop ends (rc 3: v2 = hash).
                smaliMethod(
                    loopType, "finish", listOf("I"), kPublic or kStatic or kSync, 3,
                    """
                        sget-object v0, Lcom/android/billingclient/api/BraintropyFeedLoop;->active:Ljava/util/Set;
                        invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                        move-result-object v1
                        invoke-interface { v0, v1 }, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
                        return-void
                    """
                ),
                // Parks ~74s, posting the feeder to the main looper at
                // +2s/+3s, then every 15s (rc 6: v0-v4 locals, v5 = p0).
                smaliMethod(
                    loopType, "run", emptyList(), kPublic, 6,
                    """
                        const/4 v0, 0x0
                        :feeder_loop
                        const/16 v1, 0x4a
                        if-ge v0, v1, :feeder_done
                        const-wide/32 v2, 0x3b9aca00
                        invoke-static { v2, v3 }, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V
                        rem-int/lit8 v1, v0, 0xf
                        const/16 v2, 0xe
                        if-eq v1, v2, :feeder_post
                        const/4 v1, 0x1
                        if-eq v0, v1, :feeder_post
                        const/4 v1, 0x2
                        if-ne v0, v1, :feeder_skip
                        :feeder_post
                        new-instance v1, Landroid/os/Handler;
                        invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
                        move-result-object v2
                        invoke-direct { v1, v2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
                        iget-object v2, v5, Lcom/android/billingclient/api/BraintropyFeedLoop;->feeder:Lcom/android/billingclient/api/BraintropyFeeder;
                        invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
                        :feeder_skip
                        add-int/lit8 v0, v0, 0x1
                        goto :feeder_loop
                        :feeder_done
                        iget v0, v5, Lcom/android/billingclient/api/BraintropyFeedLoop;->clientHash:I
                        invoke-static { v0 }, Lcom/android/billingclient/api/BraintropyFeedLoop;->finish(I)V
                        return-void
                    """
                )
            )
        )
        // PatchClasses.addClass is internal to the patcher; the patch runs
        // on the JVM, so reflection reaches it anyway.
        val patchClasses = this.javaClass.getMethod("getPatchClasses\$morphe_patcher").invoke(this)
        val addClass = patchClasses.javaClass.getMethod("addClass\$morphe_patcher", ClassDef::class.java)
        addClass.invoke(patchClasses, feederClass)
        addClass.invoke(patchClasses, loopClass)

        // Spawn the re-feed loop at connect time. startOnce dedupes the
        // repeated startConnection calls billing clients make, and the
        // prepend uses only p0 (v1) — no locals needed at all.
        StartConnectionFingerprint.method.apply {
            check(implementation!!.registerCount == 3) {
                "startConnection has ${implementation!!.registerCount} registers, expected 3"
            }
            addInstructions(
                0,
                "invoke-static { v1 }, Lcom/android/billingclient/api/BraintropyFeedLoop;->startOnce(Lcom/android/billingclient/api/BillingClientImpl;)V"
            )
        }

        // Later feed trigger: product-details queries fire whenever the
        // paywall opens, so a manual unlock path (banner > free trial)
        // also feeds the stream if the repo missed every timed post.
        // The prepend uses only p0 (v6) and no locals.
        QueryProductDetailsFingerprint.method.apply {
            check(implementation!!.registerCount == 9) {
                "queryProductDetailsAsync has ${implementation!!.registerCount} registers, expected 9"
            }
            addInstructions(
                0,
                "invoke-virtual { v6 }, Lcom/android/billingclient/api/BillingClientImpl;->braintropyFeedPurchasesOnMain()V"
            )
        }
    }
}
