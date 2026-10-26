.class public LX/BWF;
.super Ljava/lang/Object;

.method public static A01(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    if-eqz p0, :missing
    if-eqz p1, :missing
    const-string v0, "com.facebook.services"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :lookup
    const-string v0, "com.facebook.services.dev"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :missing
    :lookup
    :try_start
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v0
    if-eqz v0, :missing
    const/4 v1, 0x0
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    move-result-object v2
    if-eqz v2, :missing
    iget-boolean v0, v2, Landroid/content/pm/ApplicationInfo;->enabled:Z
    :try_end
    return v0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start .. :try_end} :failed
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :failed
    :failed
    move-exception v0
    :missing
    const/4 v0, 0x0
    return v0
.end method
