package com.dowjames.patches.poolmath

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.dowjames.patches.poolmath.PoolMathConstants.COMPATIBILITY_POOL_MATH

@Suppress("unused")
val unlockPoolMathPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Pool Math premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_POOL_MATH)

    execute {
        PoolMathCustomerInfoFactoryFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "subscriber"
                invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
                move-result-object v1

                new-instance v2, Lorg/json/JSONObject;
                invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

                new-instance v3, Lorg/json/JSONObject;
                invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

                const-string v4, "expires_date"
                const-string v5, "2999-12-31T23:59:59Z"
                invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "purchase_date"
                const-string v5, "2020-01-01T00:00:00Z"
                invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "product_identifier"
                const-string v5, "premium"
                invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "period_type"
                const-string v5, "normal"
                invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "store"
                const-string v5, "play_store"
                invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "ownership_type"
                const-string v5, "purchased"
                invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "premium"
                invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "Pool Math Premium"
                invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "pool_math_premium"
                invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "tfp_premium"
                invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "lifetime"
                invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v4, "annual"
                invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v0, "entitlements"
                invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
            """
        )

        PoolMathEntitlementGetFingerprint.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                """
                    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;
                    const-string p1, "premium"
                    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, Lcom/revenuecat/purchases/EntitlementInfo;
                    return-object v0
                """
            )
        }

        PoolMathEntitlementActiveMapFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;
                return-object v0
            """
        )

        PoolMathEntitlementActiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
