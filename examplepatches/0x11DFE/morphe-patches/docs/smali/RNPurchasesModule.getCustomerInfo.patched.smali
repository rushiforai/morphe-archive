.method public getCustomerInfo(Lcom/facebook/react/bridge/Promise;)V
    .registers 8
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation
                    new-instance v5, Ljava/util/HashMap;
                    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V
                    const-string v1, "identifier"
                    const-string v0, "Waypoint Pro"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x1
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    const-string v1, "isActive"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    const-string v1, "willRenew"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "NORMAL"
                    const-string v1, "periodType"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-wide v0, 0x1941f297c00L
                    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v0
                    const-string v1, "latestPurchaseDateMillis"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "2025-01-01T00:00:00Z"
                    const-string v1, "latestPurchaseDate"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-wide v0, 0x1941f297c00L
                    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v0
                    const-string v1, "originalPurchaseDateMillis"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "2025-01-01T00:00:00Z"
                    const-string v1, "originalPurchaseDate"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "expirationDateMillis"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "expirationDate"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "PLAY_STORE"
                    const-string v1, "store"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "waypoint_lifetime"
                    const-string v1, "productIdentifier"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "productPlanIdentifier"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    const-string v1, "isSandbox"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "unsubscribeDetectedAt"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "unsubscribeDetectedAtMillis"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "billingIssueDetectedAt"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "billingIssueDetectedAtMillis"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "PURCHASED"
                    const-string v1, "ownershipType"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "NOT_VERIFIED"
                    const-string v1, "verification"
                    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    new-instance v3, Ljava/util/LinkedHashMap;
                    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V
                    const-string v0, "Waypoint Pro"
                    invoke-interface {v3, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    new-instance v4, Ljava/util/HashMap;
                    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V
                    const-string v0, "all"
                    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "active"
                    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "verification"
                    const-string v1, "NOT_VERIFIED"
                    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    new-instance v2, Ljava/util/HashMap;
                    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V
                    const-string v0, "entitlements"
                    invoke-interface {v2, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "activeSubscriptions"
                    new-instance v1, Ljava/util/ArrayList;
                    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "allPurchasedProductIdentifiers"
                    new-instance v1, Ljava/util/ArrayList;
                    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "nonSubscriptionTransactions"
                    new-instance v1, Ljava/util/ArrayList;
                    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "subscriptionsByProductIdentifier"
                    new-instance v1, Ljava/util/HashMap;
                    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "allExpirationDates"
                    new-instance v1, Ljava/util/HashMap;
                    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "allExpirationDatesMillis"
                    new-instance v1, Ljava/util/HashMap;
                    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "allPurchaseDates"
                    new-instance v1, Ljava/util/HashMap;
                    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "allPurchaseDatesMillis"
                    new-instance v1, Ljava/util/HashMap;
                    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "latestExpirationDate"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "latestExpirationDateMillis"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-wide v0, 0x1941f297c00L
                    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v0
                    const-string v1, "firstSeenMillis"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "2025-01-01T00:00:00Z"
                    const-string v1, "firstSeen"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "${'$'}RCAnonymousID:waypointmod"
                    const-string v1, "originalAppUserId"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "originalApplicationVersion"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const/4 v0, 0x0
                    const-string v1, "managementURL"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-wide v0, 0x1941f297c00L
                    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v0
                    const-string v1, "requestDateMillis"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "2026-01-01T00:00:00Z"
                    const-string v1, "requestDate"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-wide v0, 0x1941f297c00L
                    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v0
                    const-string v1, "originalPurchaseDateMillis"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v0, "2025-01-01T00:00:00Z"
                    const-string v1, "originalPurchaseDate"
                    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    invoke-static {v2}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;
                    move-result-object v0
                    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
.end method
