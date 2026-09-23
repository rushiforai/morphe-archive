.class final Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ProviderManifestExecute;
.super Ljava/lang/Object;
.source "RingConnSyncPatch.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;

# direct methods
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# virtual methods
.method public final invoke(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .locals 9

    const-string v0, "AndroidManifest.xml"
    invoke-virtual {p1, v0}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/lang/String;)Lapp/morphe/patcher/util/Document;
    move-result-object v0
    check-cast v0, Ljava/io/Closeable;

    :try_start_0
    move-object v1, v0
    check-cast v1, Lapp/morphe/patcher/util/Document;

    # --- Custom-Permission am manifest-Wurzelelement sicherstellen (idempotent) ---
    const-string v2, "permission"
    invoke-virtual {v1, v2}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    move-result-object v2
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I
    move-result v3
    const/4 v4, 0x0

    :goto_perm
    if-ge v4, v3, :cond_perm_missing
    invoke-interface {v2, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;
    move-result-object v5
    check-cast v5, Lorg/w3c/dom/Element;
    const-string v6, "android:name"
    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    const-string v7, "com.gdjztech.ringconn.permission.ACCESS_HEALTH_DATA"
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :cond_perm_next
    goto :done_permission

    :cond_perm_next
    add-int/lit8 v4, v4, 0x1
    goto :goto_perm

    :cond_perm_missing
    const-string v2, "permission"
    invoke-virtual {v1, v2}, Lapp/morphe/patcher/util/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;
    move-result-object v2

    const-string v3, "android:name"
    const-string v4, "com.gdjztech.ringconn.permission.ACCESS_HEALTH_DATA"
    invoke-interface {v2, v3, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "android:protectionLevel"
    const-string v4, "dangerous"
    invoke-interface {v2, v3, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "android:label"
    const-string v4, "Read RingConn health data"
    invoke-interface {v2, v3, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "manifest"
    invoke-virtual {v1, v3}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    move-result-object v3
    const/4 v4, 0x0
    invoke-interface {v3, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;
    move-result-object v3
    check-cast v3, Lorg/w3c/dom/Element;
    invoke-interface {v3, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :done_permission

    # Hole <application> Element
    const-string v2, "application"
    invoke-virtual {v1, v2}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    move-result-object v2
    const/4 v3, 0x0
    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;
    move-result-object v2
    check-cast v2, Lorg/w3c/dom/Element;

    # Pruefe ob Provider bereits existiert
    const-string v3, "provider"
    invoke-virtual {v1, v3}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    move-result-object v3
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I
    move-result v4
    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_exists_check_end
    invoke-interface {v3, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;
    move-result-object v6
    check-cast v6, Lorg/w3c/dom/Element;
    const-string v7, "android:name"
    invoke-interface {v6, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    const-string v8, "com.gdjztech.ringconn.provider.HealthDataProvider"
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :cond_next
    goto :done_provider

    :cond_next
    add-int/lit8 v5, v5, 0x1
    goto :goto_0

    :cond_exists_check_end
    # Erzeuge <provider>
    const-string v3, "provider"
    invoke-virtual {v1, v3}, Lapp/morphe/patcher/util/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;
    move-result-object v3

    const-string v4, "android:name"
    const-string v5, "com.gdjztech.ringconn.provider.HealthDataProvider"
    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "android:authorities"
    const-string v5, "com.gdjztech.ringconn.provider"
    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "android:exported"
    const-string v5, "true"
    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    # Lesezugriff nur mit der oben deklarierten Berechtigung
    const-string v4, "android:permission"
    const-string v5, "com.gdjztech.ringconn.permission.ACCESS_HEALTH_DATA"
    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "android:readPermission"
    const-string v5, "com.gdjztech.ringconn.permission.ACCESS_HEALTH_DATA"
    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    # Keine temporaeren URI-Grants, sonst laesst sich die Berechtigung umgehen
    const-string v4, "android:grantUriPermissions"
    const-string v5, "false"
    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :done_provider
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0
    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0

    :catchall_0
    move-exception v1
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v2
    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    throw v2
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    check-cast p1, Lapp/morphe/patcher/patch/ResourcePatchContext;
    invoke-virtual {p0, p1}, Lapp/morphe/patches/ringconn/RingConnSyncPatchKt$ProviderManifestExecute;->invoke(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    move-result-object p1
    return-object p1
.end method
