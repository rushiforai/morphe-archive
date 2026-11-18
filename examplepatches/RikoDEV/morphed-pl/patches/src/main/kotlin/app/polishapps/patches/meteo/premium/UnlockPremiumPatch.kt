package app.polishapps.patches.meteo.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_METEO_ICM
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/polishapps/extension/meteo/MeteoPatch;"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Injects an active premium entitlement into the RevenueCat response so the app " +
        "reports premium tier without a subscription. Weather model UM 120h and ad-free mode " +
        "become available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_METEO_ICM)

    extendWith("extensions/extension.mpe")

    execute {
        // ---- 1. CustomerInfo serializer injection (safety net) ----
        // The RevenueCat hybrid-common CustomerInfo→Map serializer. It is the single point through
        // which every CustomerInfo (method call responses and the update stream) reaches Dart.
        // Anchored by the three top-level keys it emits; no other method matches all three.
        val serializer = singleMethod("CustomerInfo serializer") { _, method ->
            method.returnType == "Ljava/util/Map;" &&
                method.parameterTypes.size == 1 &&
                method.strings().let { strings ->
                    "entitlements" in strings &&
                        "activeSubscriptions" in strings &&
                        "allPurchasedProductIdentifiers" in strings
                }
        }

        val instructions = serializer.instructions.toList()
        val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returnIndex < 0) {
            throw PatchException("CustomerInfo serializer: return-object not found")
        }

        serializer.addInstructions(
            returnIndex,
            """
                invoke-static {v0}, $EXTENSION_CLASS->injectPremium(Ljava/util/Map;)Ljava/util/Map;
                move-result-object v0
            """,
        )

        // ---- 2. getCustomerInfo handler stub ----
        // On a re-signed APK the RevenueCat backend rejects the request, so the serializer above
        // is never called. We stub the RC Flutter plugin's getCustomerInfo handler to return a
        // pre-built premium CustomerInfo map directly via Result.success(), bypassing the SDK.
        //
        // Found by: the RC Flutter plugin class contains the "getCustomerInfo" method channel name,
        // and the specific handler method is the only single-param void method in that class that
        // invokes on the RC SDK's internal BillingAbstract-derived class (unique reference).
        val rcPluginClasses = findClasses { classDef ->
            classDef.methods.any { m ->
                m.strings().let { s -> "getCustomerInfo" in s && "purchaseProduct" in s }
            }
        }
        val rcPluginClass = rcPluginClasses.singleOrNull()
            ?: throw PatchException(
                "Expected one RC Flutter plugin class, found ${rcPluginClasses.size}",
            )

        val getCustomerInfoCandidates = methodsOf(rcPluginClass) { method ->
            method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.accessFlags and 0x8 == 0 && // not static
                method.implementation?.instructions?.any { instr ->
                    if (instr.opcode != Opcode.INVOKE_VIRTUAL && instr.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@any false
                    val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@any false
                    // The getCustomerInfo handler is the only one that invokes a method with
                    // 6 parameters (appUserId, fetchPolicy, 3 booleans, callback) on the
                    // Purchases implementation class.
                    ref.parameterTypes.size == 6 &&
                        ref.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                        ref.returnType == "V"
                } == true
        }
        val getCustomerInfoHandler = getCustomerInfoCandidates.singleOrNull()
            ?: throw PatchException(
                "Expected one getCustomerInfo handler, found ${getCustomerInfoCandidates.size}",
            )

        // p1 = Result (ir7, impl of mr7). Build premium map → Result.success(map) → return.
        val resultType = getCustomerInfoHandler.parameterTypes[0].toString()
        getCustomerInfoHandler.prependReturn(
            """
                invoke-static {}, $EXTENSION_CLASS->buildPremiumResponse()Ljava/util/Map;
                move-result-object v0
                invoke-virtual {p1, v0}, $resultType->c(Ljava/lang/Object;)V
                return-void
            """,
        )

        // ---- 3. Paywall presenter stub ----
        // The RevenueCatUI paywall is shown via a native Android fragment. Even with premium
        // injected, the native paywall may still pop up. Stub the presenter to answer
        // immediately so it never appears.
        // Anchored by the unique error string "PAYWALLS_MISSING_WRONG_ACTIVITY".
        //
        // The Dart side (purchases_ui_flutter) parses the result as a non-null String into
        // PaywallResult, so null crashes with "type 'Null' is not a subtype of type 'String'".
        // Signature: (Result, requiredEntitlementIdentifier, offering, ...). When an entitlement
        // is required (presentPaywallIfNeeded) answer "NOT_PRESENTED" — what the SDK returns when
        // the user already has it; for a plain presentPaywall answer "PURCHASED".
        val paywallPresenter = singleMethod("paywall presenter") { _, method ->
            "PAYWALLS_MISSING_WRONG_ACTIVITY" in method.strings()
        }

        // p1 = Result, p2 = entitlement id; register indexes > 15, so move to low registers.
        val paywallResultType = paywallPresenter.parameterTypes[0].toString()
        paywallPresenter.prependReturn(
            """
                move-object/from16 v0, p1
                move-object/from16 v1, p2
                const-string v2, "PURCHASED"
                if-eqz v1, :send
                const-string v2, "NOT_PRESENTED"
                :send
                invoke-virtual {v0, v2}, $paywallResultType->c(Ljava/lang/Object;)V
                return-void
            """,
        )
    }
}
