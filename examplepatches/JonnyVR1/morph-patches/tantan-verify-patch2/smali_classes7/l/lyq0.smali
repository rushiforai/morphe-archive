.class public Ll/lyq0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static a([B)V
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x2

    .line 3
    if-lt v0, v1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/16 v1, 0x63

    .line 7
    .line 8
    aput-byte v1, p0, v0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    const/16 v1, 0x64

    .line 12
    .line 13
    aput-byte v1, p0, v0

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;J)Z
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/xiaomi/push/gk;->aY:Lcom/xiaomi/push/gk;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v1, 0x1d

    .line 21
    .line 22
    if-lt v0, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 29
    .line 30
    if-ge v0, v1, :cond_1

    .line 31
    .line 32
    :cond_0
    invoke-static {p0, p1, p2, p3}, Ll/qsq0;->a(Landroid/content/Context;Ljava/lang/String;J)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    return v2
.end method

.method public static c(Ljava/lang/String;[B)[B
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    invoke-static {p0}, Ll/lyq0;->a([B)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/g3r0;->b([B[B)[B

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return-object p0

    .line 13
    :catch_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public static d(Ljava/lang/String;[B)[B
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    invoke-static {p0}, Ll/lyq0;->a([B)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/g3r0;->c([B[B)[B

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return-object p0

    .line 13
    :catch_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method
