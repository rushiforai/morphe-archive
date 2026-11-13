package arpit.morphe.patches.runna.premium

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Matches `EntitlementInfosMapperKt.map(EntitlementInfos)` of RevenueCat's
 * `hybridcommon` module — the conversion step between the native `CustomerInfo`
 * object and the map handed to the React Native bridge.
 *
 * Runna is a React Native app, so its JavaScript bundle never touches the native
 * `EntitlementInfos` object directly: `CustomerInfoMapperKt.map(customerInfo)`
 * builds the bridge payload and delegates the entitlement subtree to this method,
 * whose result is exposed to JS as `customerInfo.entitlements`. Returning a
 * synthetic map here is enough for every `entitlements.active.premium` and
 * `entitlements.all.premium` check performed by the bundle.
 *
 * The RevenueCat SDK keeps its class and method names in release builds (only the
 * host app is minified), so this fingerprint is name-stable across app versions.
 */
object EntitlementInfosMapperFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    returnType = "Ljava/util/Map;",
)

/**
 * Matches Expo's `fetch` response callback that decodes the collected body bytes
 * into a `String` and resolves the JS promise with it.
 *
 * Expo SDK 54 installs `expo/fetch` as the global `fetch` polyfill (unless
 * `EXPO_PUBLIC_USE_RN_FETCH` is set), so Apollo's `HttpLink` never reaches React
 * Native's `NetworkingModule`. The callback is an R8-renamed Kotlin lambda, so it
 * is matched by its behavior rather than by name: it decodes a byte array as
 * UTF-8 and resolves a `String` promise. That combination is unique in the app.
 */
object ExpoFetchTextResponseFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        method.parameterTypes.size == 1 && instructions != null &&
            instructions.any { instruction ->
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    instruction.getReference<MethodReference>()?.let { reference ->
                        reference.definingClass == "Ljava/lang/String;" &&
                            reference.name == "<init>" &&
                            reference.parameterTypes == listOf("[B", "Ljava/nio/charset/Charset;")
                    } == true
            } &&
            instructions.any { instruction ->
                instruction.opcode == Opcode.INVOKE_INTERFACE &&
                    instruction.getReference<MethodReference>()?.let { reference ->
                        reference.definingClass == "Lfj/s;" &&
                            reference.name == "resolve" &&
                            reference.parameterTypes == listOf("Ljava/lang/String;")
                    } == true
            }
    },
)
