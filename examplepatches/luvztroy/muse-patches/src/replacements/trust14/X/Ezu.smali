.class public LX/Ezu;
.super Ljava/lang/Object;

.method public final A00(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/ContentProviderClient;
    .locals 2
    if-eqz p1, :missing
    if-eqz p2, :missing
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :missing
    :try_start
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v1
    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Ljava/lang/String;)Landroid/content/ContentProviderClient;
    move-result-object v0
    :try_end
    return-object v0
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :rejected
    :rejected
    move-exception v0
    :missing
    const/4 v0, 0x0
    return-object v0
.end method

.method public final A01(Landroid/content/Context;)Z
    .locals 1
    const/4 v0, 0x1
    return v0
.end method

.method public final A02(LX/AOD;Z)Z
    .locals 1
    const/4 v0, 0x1
    return v0
.end method
