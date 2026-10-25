package app.template.patches.alarmclock.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_ALARMCLOCK
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.iface.Method

private fun Method.sameSignature(other: Method) =
    name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

/**
 * The shop entitlement check: of the [ShopEntitlementCandidateFingerprint] matches, the one that
 * is the only implementation of the interface method it implements (the shop data interface the
 * ad gates call, 35 call sites in 26.06.0). The other candidates implement a shared adapter
 * interface with several implementations. Exactly one candidate must qualify.
 */
private fun BytecodePatchContext.shopEntitlementCheck(): MutableMethod {
    val candidates = ShopEntitlementCandidateFingerprint.matchAllOrNull().orEmpty()
    if (candidates.isEmpty()) throw PatchException("Disable ads: no (ShopFeature)Z method holding \"feature\"")

    // For each candidate, the interfaces of its class that declare its method.
    val declaring = candidates.associateWith { match ->
        match.classDef.interfaces.filter { type ->
            classDefByOrNull(type)?.methods?.any { it.implementation == null && it.sameSignature(match.method) } == true
        }
    }
    // How many classes implement each of those interfaces.
    val interfaces = declaring.values.flatten().toSet()
    val implementations = mutableMapOf<String, Int>()
    classDefForEach { classDef ->
        classDef.interfaces.filter { it in interfaces }.forEach { implementations.merge(it, 1, Int::plus) }
    }

    val sole = declaring.filterValues { types -> types.any { implementations[it] == 1 } }.keys
    return sole.singleOrNull()?.method ?: throw PatchException(
        "Disable ads: expected one sole-implementation (ShopFeature)Z entitlement check, found " +
            sole.map { "${it.classDef.type}->${it.method.name}" } + " of " +
            candidates.map { "${it.classDef.type}->${it.method.name}" },
    )
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_ALARMCLOCK)

    execute {
        // Entitlement check: if the requested feature is AD_FREE, report it owned. Everything
        // else falls through to the original shop-list lookup.
        shopEntitlementCheck().addInstructionsWithLabelsChecked(
            0,
            """
                const-string v0, "AD_FREE"
                invoke-virtual {p1}, $SHOP_FEATURE->name()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x1
                return v0
                :original
                nop
            """,
        )
    }
}
