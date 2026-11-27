package app.morphe.patches.all.misc.connectivity.wifi.spoof

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.util.formatCount
import app.morphe.patches.util.patchLogger
import app.morphe.patches.util.transformation.InvocationReplacement
import app.morphe.patches.util.transformation.findInvokeVirtualIndices
import app.morphe.patches.util.transformation.replaceInvokeVirtualWithExtension
import app.morphe.util.findMutableMethodOf

private const val EXTENSION_CLASS_DESCRIPTOR_PREFIX =
    "Lapp/morphe/extension/all/misc/connectivity/wifi/spoof/SpoofWifiPatch"

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_CLASS_DESCRIPTOR_PREFIX;"

@Suppress("unused")
val spoofWiFiConnectionPatch = bytecodePatch(
    name = "Spoof Wi-Fi connection",
    description = "Spoofs an existing Wi-Fi connection.",
    default = false,
) {
    extendWith("extensions/all/misc/connectivity/wifi/spoof/spoof-wifi.mpe")

    category("Connectivity")

    dependsOn(
        bytecodePatch {
            execute {
                var interceptedCount = 0

                classDefForEach { classDef ->
                    // Skip the extension class itself to avoid infinite recursion.
                    if (classDef.type.startsWith(EXTENSION_CLASS_DESCRIPTOR_PREFIX)) return@classDefForEach

                    val mutableClass by lazy { mutableClassDefBy(classDef) }

                    classDef.methods.forEach { method ->
                        if (method.implementation == null) return@forEach

                        val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                        MethodCall.entries.forEach { call ->
                            val indices = method.findInvokeVirtualIndices(call)
                            if (indices.isNotEmpty()) {
                                mutableMethod.replaceInvokeVirtualWithExtension(
                                    EXTENSION_CLASS_DESCRIPTOR,
                                    call,
                                    indices,
                                )
                                interceptedCount += indices.size
                            }
                        }
                    }
                }

                if (interceptedCount == 0) {
                    patchLogger.warning("No Wi-Fi calls found to intercept")
                } else {
                    patchLogger.info("Intercepted ${formatCount(interceptedCount, "call", "calls")}")
                }
            }
        },
    )
}

// Information about method calls we want to replace.
@Suppress("unused")
private enum class MethodCall(
    override val definedClassName: String,
    override val methodName: String,
    override val methodParams: Array<String>,
    override val returnType: String,
) : InvocationReplacement {
    GetSystemService1(
        "Landroid/content/Context;",
        "getSystemService",
        arrayOf("Ljava/lang/String;"),
        "Ljava/lang/Object;",
    ),
    GetSystemService2(
        "Landroid/content/Context;",
        "getSystemService",
        arrayOf("Ljava/lang/Class;"),
        "Ljava/lang/Object;",
    ),
    GetActiveNetworkInfo(
        "Landroid/net/ConnectivityManager;",
        "getActiveNetworkInfo",
        arrayOf(),
        "Landroid/net/NetworkInfo;",
    ),
    IsConnected(
        "Landroid/net/NetworkInfo;",
        "isConnected",
        arrayOf(),
        "Z",
    ),
    IsConnectedOrConnecting(
        "Landroid/net/NetworkInfo;",
        "isConnectedOrConnecting",
        arrayOf(),
        "Z",
    ),
    IsAvailable(
        "Landroid/net/NetworkInfo;",
        "isAvailable",
        arrayOf(),
        "Z",
    ),
    GetState(
        "Landroid/net/NetworkInfo;",
        "getState",
        arrayOf(),
        $$"Landroid/net/NetworkInfo$State;",
    ),
    GetDetailedState(
        "Landroid/net/NetworkInfo;",
        "getDetailedState",
        arrayOf(),
        $$"Landroid/net/NetworkInfo$DetailedState;",
    ),
    IsActiveNetworkMetered(
        "Landroid/net/ConnectivityManager;",
        "isActiveNetworkMetered",
        arrayOf(),
        "Z",
    ),
    GetActiveNetwork(
        "Landroid/net/ConnectivityManager;",
        "getActiveNetwork",
        arrayOf(),
        "Landroid/net/Network;",
    ),
    GetNetworkInfo(
        "Landroid/net/ConnectivityManager;",
        "getNetworkInfo",
        arrayOf("Landroid/net/Network;"),
        "Landroid/net/NetworkInfo;",
    ),
    HasTransport(
        "Landroid/net/NetworkCapabilities;",
        "hasTransport",
        arrayOf("I"),
        "Z",
    ),
    HasCapability(
        "Landroid/net/NetworkCapabilities;",
        "hasCapability",
        arrayOf("I"),
        "Z",
    ),
    RegisterBestMatchingNetworkCallback(
        "Landroid/net/ConnectivityManager;",
        "registerBestMatchingNetworkCallback",
        arrayOf(
            "Landroid/net/NetworkRequest;",
            $$"Landroid/net/ConnectivityManager$NetworkCallback;",
            "Landroid/os/Handler;",
        ),
        "V",
    ),
    RegisterDefaultNetworkCallback1(
        "Landroid/net/ConnectivityManager;",
        "registerDefaultNetworkCallback",
        arrayOf($$"Landroid/net/ConnectivityManager$NetworkCallback;"),
        "V",
    ),
    RegisterDefaultNetworkCallback2(
        "Landroid/net/ConnectivityManager;",
        "registerDefaultNetworkCallback",
        arrayOf($$"Landroid/net/ConnectivityManager$NetworkCallback;", "Landroid/os/Handler;"),
        "V",
    ),
    RegisterNetworkCallback1(
        "Landroid/net/ConnectivityManager;",
        "registerNetworkCallback",
        arrayOf("Landroid/net/NetworkRequest;", $$"Landroid/net/ConnectivityManager$NetworkCallback;"),
        "V",
    ),
    RegisterNetworkCallback2(
        "Landroid/net/ConnectivityManager;",
        "registerNetworkCallback",
        arrayOf("Landroid/net/NetworkRequest;", "Landroid/app/PendingIntent;"),
        "V",
    ),
    RegisterNetworkCallback3(
        "Landroid/net/ConnectivityManager;",
        "registerNetworkCallback",
        arrayOf(
            "Landroid/net/NetworkRequest;",
            $$"Landroid/net/ConnectivityManager$NetworkCallback;",
            "Landroid/os/Handler;",
        ),
        "V",
    ),
    RequestNetwork1(
        "Landroid/net/ConnectivityManager;",
        "requestNetwork",
        arrayOf("Landroid/net/NetworkRequest;", $$"Landroid/net/ConnectivityManager$NetworkCallback;"),
        "V",
    ),
    RequestNetwork2(
        "Landroid/net/ConnectivityManager;",
        "requestNetwork",
        arrayOf("Landroid/net/NetworkRequest;", $$"Landroid/net/ConnectivityManager$NetworkCallback;", "I"),
        "V",
    ),
    RequestNetwork3(
        "Landroid/net/ConnectivityManager;",
        "requestNetwork",
        arrayOf(
            "Landroid/net/NetworkRequest;",
            $$"Landroid/net/ConnectivityManager$NetworkCallback;",
            "Landroid/os/Handler;",
        ),
        "V",
    ),
    RequestNetwork4(
        "Landroid/net/ConnectivityManager;",
        "requestNetwork",
        arrayOf("Landroid/net/NetworkRequest;", "Landroid/app/PendingIntent;"),
        "V",
    ),
    RequestNetwork5(
        "Landroid/net/ConnectivityManager;",
        "requestNetwork",
        arrayOf(
            "Landroid/net/NetworkRequest;",
            $$"Landroid/net/ConnectivityManager$NetworkCallback;",
            "Landroid/os/Handler;",
            "I",
        ),
        "V",
    ),
    UnregisterNetworkCallback1(
        "Landroid/net/ConnectivityManager;",
        "unregisterNetworkCallback",
        arrayOf($$"Landroid/net/ConnectivityManager$NetworkCallback;"),
        "V",
    ),
    UnregisterNetworkCallback2(
        "Landroid/net/ConnectivityManager;",
        "unregisterNetworkCallback",
        arrayOf("Landroid/app/PendingIntent;"),
        "V",
    ),
}
