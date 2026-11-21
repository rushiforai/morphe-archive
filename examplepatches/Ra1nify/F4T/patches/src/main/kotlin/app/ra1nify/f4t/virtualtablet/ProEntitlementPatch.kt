package app.ra1nify.f4t.virtualtablet

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ra1nify.f4t.shared.VIRTUAL_TABLET
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ANCHOR = "nonSubscriptionsLatestPurchases"
private const val ENTITLEMENT_ID = "pro"
private const val PRODUCT_ID = "vt_pro_static"
private const val ENTITLEMENT_INFOS = "Lcom/revenuecat/purchases/EntitlementInfos;"
private const val VERIFICATION_RESULT = "Lcom/revenuecat/purchases/VerificationResult;"
private const val DIAG_TAG = "VTPatch"

private const val DIAGNOSTICS = false

// Purchase data RevenueCat parses instead of the real store response.
private val ENTITLEMENTS_JSON = """
    {"$ENTITLEMENT_ID":{"product_identifier":"$PRODUCT_ID","purchase_date":"2024-01-01T00:00:00Z","ownership_type":"PURCHASED"}}
""".trimIndent()

private val SUBSCRIPTIONS_JSON = """
    {"$PRODUCT_ID":{"store":"app_store","period_type":"normal","original_purchase_date":"2024-01-01T00:00:00Z","ownership_type":"PURCHASED","is_sandbox":false}}
""".trimIndent()

@Suppress("unused")
val proEntitlementPatch = bytecodePatch(
    name = "Lifetime Pro",
    default = false,
) {
    compatibleWith(VIRTUAL_TABLET)

    // The anti-resale notice is not optional, so every host patch pulls it in. A patch is executed
    // once per object, so selecting several host patches still installs a single notice call.
    dependsOn(virtualTabletAntiResalePatch)

    execute {
        // EntitlementInfos are built from these two JSON blobs at a single call site.
        val anchorClass = try {
            mutableClassDefBy { it.usesString(ANCHOR) }
        } catch (t: Throwable) {
            throw PatchException(
                "no unique class references \"$ANCHOR\"; this host build is not supported " +
                    "(${t.message})"
            )
        }

        val candidates = anchorClass.methods
            .filterIsInstance<MutableMethod>()
            .filter { it.isEntitlementInfosFactory() }

        if (candidates.size != 1) {
            throw PatchException(
                "${anchorClass.type} has ${candidates.size} candidate entitlement factory " +
                    "method(s), expected exactly 1. Candidates: " +
                    candidates.joinToString { "${it.name}(${it.parameterTypes.joinToString { type -> type }})" }
            )
        }

        val factory = candidates.single()
        factory.injectProEntitlement()
        println(
            "[virtualtablet] pro entitlement injected into ${anchorClass.type}->${factory.name} " +
                "(id=$ENTITLEMENT_ID, product=$PRODUCT_ID)"
        )

        // Fallback for code paths that never reach the factory above.
        val infoClass = mutableClassDefBy("Lcom/revenuecat/purchases/EntitlementInfo;")
        val active = infoClass.methods
            .filterIsInstance<MutableMethod>()
            .filter { m -> m.name == "isActive" && m.parameterTypes.isEmpty() && m.returnType == "Z" }

        if (active.size != 1) {
            throw PatchException(
                "expected exactly 1 isActive()Z on ${infoClass.type}, found ${active.size}"
            )
        }
        active.single().forceReturnTrue()
        println("[virtualtablet] ${infoClass.type}->isActive() forced to true")
    }
}

private fun MutableMethod.forceReturnTrue() {
    val body = implementation as? MutableMethodImplementation
        ?: throw PatchException("$definingClass->$name has no mutable implementation")
    if (body.registerCount < 1) {
        throw PatchException("$definingClass->$name has no registers to return a value in")
    }
    while (body.instructions.isNotEmpty()) {
        body.removeInstruction(body.instructions.size - 1)
    }
    addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}

private fun Method.isEntitlementInfosFactory(): Boolean =
    AccessFlags.STATIC.isSet(accessFlags) &&
        returnType == ENTITLEMENT_INFOS &&
        parameterTypes.size == 5 &&
        parameterTypes[0] == "Lorg/json/JSONObject;" &&
        parameterTypes[1] == "Lorg/json/JSONObject;" &&
        parameterTypes[2] == "Lorg/json/JSONObject;" &&
        parameterTypes[3] == "Ljava/util/Date;" &&
        parameterTypes[4] == VERIFICATION_RESULT

private fun MutableMethod.injectProEntitlement() {
    val body = implementation
    if (body == null) {
        throw PatchException("$definingClass->$name has no implementation")
    }

    val base = body.registerCount - 5
    if (base < 2) {
        throw PatchException(
            "$definingClass->$name has only $base local register(s); 2 are needed for the injection"
        )
    }

    val entitlements = base
    val subscriptions = base + 1
    val verification = base + 4
    val scratch = 0
    val scratchObject = 1

    val smali = buildString {
        if (DIAGNOSTICS) {
            appendLine(logCall("entitlement factory entered"))
        }
        appendLine("const-string v$scratch, ${jsonLiteral(ENTITLEMENTS_JSON)}")
        appendLine("new-instance v$scratchObject, Lorg/json/JSONObject;")
        appendLine("invoke-direct {v$scratchObject, v$scratch}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V")
        appendLine("move-object v$entitlements, v$scratchObject")
        appendLine("const-string v$scratch, ${jsonLiteral(SUBSCRIPTIONS_JSON)}")
        appendLine("new-instance v$scratchObject, Lorg/json/JSONObject;")
        appendLine("invoke-direct {v$scratchObject, v$scratch}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V")
        appendLine("move-object v$subscriptions, v$scratchObject")
        appendLine("sget-object v$verification, $VERIFICATION_RESULT->VERIFIED:$VERIFICATION_RESULT")
        if (DIAGNOSTICS) {
            append(logCall("inputs replaced (ents=pro subs=vt_pro_static verif=VERIFIED)"))
        }
    }

    addInstructions(0, smali.trimEnd())
}

private fun logCall(message: String): String = """
    const-string v0, "$DIAG_TAG"
    const-string v1, "$message"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
""".trimIndent()

private fun jsonLiteral(json: String): String = "\"" + json.replace("\"", "\\\"") + "\""

private fun ClassDef.usesString(value: String): Boolean = methods.any { method ->
    method.implementation?.instructions?.any { insn ->
        insn is ReferenceInstruction &&
            (insn.reference as? StringReference)?.string == value
    } == true
}
