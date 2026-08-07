.class public Ll/ygl;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ljava/lang/Object;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    const-string v0, "android.app.ActivityManagerNative"

    .line 8
    .line 9
    invoke-static {v0}, Ll/puc0;->m(Ljava/lang/String;)Ll/puc0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "getDefault"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/puc0;->b(Ljava/lang/String;)Ll/puc0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0

    .line 24
    :cond_0
    const-class v0, Landroid/app/ActivityManager;

    .line 25
    .line 26
    invoke-static {v0}, Ll/puc0;->k(Ljava/lang/Class;)Ll/puc0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "getService"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/puc0;->b(Ljava/lang/String;)Ll/puc0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    return-object v0
.end method

.method public static b()Ljava/lang/Object;
    .locals 2

    .line 1
    const-string v0, "android.app.ActivityThread"

    .line 2
    .line 3
    invoke-static {v0}, Ll/puc0;->m(Ljava/lang/String;)Ll/puc0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "currentActivityThread"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/puc0;->b(Ljava/lang/String;)Ll/puc0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static c()Landroid/os/Handler;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ll/ygl;->b()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {v1}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "getHandler"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ll/puc0;->b(Ljava/lang/String;)Ll/puc0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/puc0;->h()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    :try_start_1
    invoke-static {}, Ll/ygl;->b()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v2, "mH"

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/os/Handler;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 43
    .line 44
    return-object v0

    .line 45
    :catch_0
    move-exception v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-object v1

    .line 48
    :catch_1
    move-exception v1

    .line 49
    move-object v3, v1

    .line 50
    move-object v1, v0

    .line 51
    move-object v0, v3

    .line 52
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    return-object v1
.end method
