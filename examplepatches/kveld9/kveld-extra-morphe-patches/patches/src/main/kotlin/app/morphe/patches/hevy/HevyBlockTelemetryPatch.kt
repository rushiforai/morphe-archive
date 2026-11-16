package app.morphe.patches.hevy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnVoid
import org.w3c.dom.Element

private val hevyTelemetryResourcePatch = resourcePatch(
    name = "Remove Trackers (Setup)",
    description = "Removes tracking permissions and turns off crash-reporting providers.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_HEVY)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            error("[Block Trackers] AndroidManifest.xml not found.")
        }

        val blockedPermissions = setOf(
            "com.google.android.gms.permission.AD_ID",
            "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_AD_ID",
            "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
            "android.permission.ACCESS_ADSERVICES_TOPICS",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            "android.permission.READ_CONTACTS",
            "android.permission.ACCESS_FINE_LOCATION",
            "android.permission.ACCESS_COARSE_LOCATION",
        )

        val blockedProviders = setOf(
            "io.sentry.android.core.SentryInitProvider",
            "io.sentry.android.core.SentryPerformanceProvider",
            "com.adjust.sdk.SystemLifecycleContentProvider",
            "com.facebook.internal.FacebookInitProvider",
            "com.facebook.FacebookContentProvider",
        )

        val blockedReceivers = setOf(
            "com.adjust.sdk.AdjustReferrerReceiver",
            "com.facebook.CurrentAccessTokenExpirationBroadcastReceiver",
            "com.facebook.AuthenticationTokenManager\$CurrentAuthenticationTokenChangedBroadcastReceiver",
        )

        var removedPermissions = 0
        var disabledProviders = 0
        var disabledServices = 0
        var disabledReceivers = 0

        document(manifestFile.absolutePath).use { doc ->
            // 1. Remove tracking & ads permissions
            val usesPermissions = doc.getElementsByTagName("uses-permission")
            val toRemove = mutableListOf<Element>()
            for (i in 0 until usesPermissions.length) {
                val elem = usesPermissions.item(i) as? Element ?: continue
                val name = elem.getAttribute("android:name")
                if (name in blockedPermissions) {
                    toRemove.add(elem)
                }
            }
            toRemove.forEach {
                it.parentNode?.removeChild(it)
                removedPermissions++
            }

            // 2. Disable Sentry content providers
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as? Element ?: continue
                val name = provider.getAttribute("android:name")
                if (name in blockedProviders) {
                    provider.setAttribute("android:enabled", "false")
                    disabledProviders++
                }
            }

            // 3. Disable WearOS background service and Adjust install referrer receiver
            val services = doc.getElementsByTagName("service")
            for (i in 0 until services.length) {
                val service = services.item(i) as? Element ?: continue
                val name = service.getAttribute("android:name")
                if (name == "com.hevy.services.WearListenerService") {
                    service.setAttribute("android:enabled", "false")
                    disabledServices++
                }
            }

            val receivers = doc.getElementsByTagName("receiver")
            for (i in 0 until receivers.length) {
                val receiver = receivers.item(i) as? Element ?: continue
                val name = receiver.getAttribute("android:name")
                if (name in blockedReceivers) {
                    receiver.setAttribute("android:enabled", "false")
                    disabledReceivers++
                }
            }
        }

        val disabledComponents = disabledProviders + disabledServices + disabledReceivers
        val categoryBreakdown = listOf(
            "providers" to disabledProviders,
            "services" to disabledServices,
            "receivers" to disabledReceivers,
        ).filter { it.second > 0 }
            .joinToString(", ") { "${it.first}=${it.second}" }
        val componentDetails = if (categoryBreakdown.isNotEmpty()) " ($categoryBreakdown)" else ""

        println("[Block Trackers] Stripped $removedPermissions permissions and disabled $disabledComponents tracking components$componentDetails in AndroidManifest.xml")
    }
}

@Suppress("unused")
val hevyBlockTelemetryPatch = bytecodePatch(
    name = "Block Trackers",
    description = "Blocks crash reporting, ad attribution and referral tracking.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_HEVY)
    dependsOn(hevyTelemetryResourcePatch)

    execute {
        val hookedMethods = mutableListOf<String>()

        // 1. Sentry React Native initialization stub (resolve Boolean.TRUE and return)
        val sentryFp = Fingerprint(
            definingClass = "Lio/sentry/react/RNSentryModule;",
            name = "initNativeSdk",
        )
        sentryFp.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )
        hookedMethods.add("RNSentryModule.initNativeSdk")

        // 2. Adjust SDK queuing stubs
        val adjustAddFp = Fingerprint(
            definingClass = "Lcom/adjust/sdk/PackageHandler;",
            name = "addPackage",
        )
        adjustAddFp.method.replaceWithReturnVoid()
        hookedMethods.add("PackageHandler.addPackage")

        val adjustSendFp = Fingerprint(
            definingClass = "Lcom/adjust/sdk/PackageHandler;",
            name = "sendFirstPackage",
        )
        adjustSendFp.method.replaceWithReturnVoid()
        hookedMethods.add("PackageHandler.sendFirstPackage")

        // 3. Facebook AppEvents flush
        val fbFlushFp = Fingerprint(
            definingClass = "Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;",
            name = "flush",
        )
        fbFlushFp.method.replaceWithReturnVoid()
        hookedMethods.add("FBAppEventsLoggerModule.flush")

        // 4. Branch Metrics tracking stub
        val branchFp = Fingerprint(
            definingClass = "Lio/branch/rnbranch/RNBranchModule;",
            name = "isTrackingDisabled",
            parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
        )
        branchFp.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )
        hookedMethods.add("RNBranchModule.isTrackingDisabled")

        // 5. Amplitude React Native Bridge stub (drops legacy event tracking)
        val amplitudeFp = Fingerprint(
            definingClass = "Lcom/amplitude/reactnative/AmplitudeReactNativeModule;",
            name = "getLegacyEvents",
        )
        amplitudeFp.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )
        hookedMethods.add("AmplitudeReactNativeModule.getLegacyEvents")

        // 6. React Native NetworkingModule telemetry sinkhole (redirects Amplitude, Branch and Sentry JS requests to 0.0.0.0)
        val networkingFp = Fingerprint(
            definingClass = "Lcom/facebook/react/modules/network/NetworkingModule;",
            name = "sendRequest",
            parameters = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "D",
                "Lcom/facebook/react/bridge/ReadableArray;",
                "Lcom/facebook/react/bridge/ReadableMap;",
                "Ljava/lang/String;",
                "Z",
                "D",
                "Z",
            ),
        )
        networkingFp.method.addInstructions(
            0,
            """
                if-eqz p2, :cond_proceed
                const-string v0, "amplitude.com"
                invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :cond_sink
                const-string v0, "api.branch.io"
                invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :cond_sink
                const-string v0, "sentry.io"
                invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :cond_sink
                goto :cond_proceed
                :cond_sink
                const-string p2, "http://0.0.0.0"
                :cond_proceed
            """.trimIndent(),
        )
        hookedMethods.add("NetworkingModule.sendRequest")

        println("[Block Trackers] Successfully hooked ${hookedMethods.size} telemetry methods: ${hookedMethods.joinToString(", ")}")
    }
}
