.class public Ll/mmd0;
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

.method public static a()Z
    .locals 19

    const/4 v0, 0x0

    return v0

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "/su"

    .line 3
    .line 4
    const-string v2, "/su/bin/su"

    .line 5
    .line 6
    const-string v3, "/sbin/su"

    .line 7
    .line 8
    const-string v4, "/data/local/xbin/su"

    .line 9
    .line 10
    const-string v5, "/data/local/bin/su"

    .line 11
    .line 12
    const-string v6, "/data/local/su"

    .line 13
    .line 14
    const-string v7, "/system/xbin/su"

    .line 15
    .line 16
    const-string v8, "/system/bin/su"

    .line 17
    .line 18
    const-string v9, "/system/sd/xbin/su"

    .line 19
    .line 20
    const-string v10, "/system/bin/failsafe/su"

    .line 21
    .line 22
    const-string v11, "/system/bin/cufsdosck"

    .line 23
    .line 24
    const-string v12, "/system/xbin/cufsdosck"

    .line 25
    .line 26
    const-string v13, "/system/bin/cufsmgr"

    .line 27
    .line 28
    const-string v14, "/system/xbin/cufsmgr"

    .line 29
    .line 30
    const-string v15, "/system/bin/cufaevdd"

    .line 31
    .line 32
    const-string v16, "/system/xbin/cufaevdd"

    .line 33
    .line 34
    const-string v17, "/system/bin/conbb"

    .line 35
    .line 36
    const-string v18, "/system/xbin/conbb"

    .line 37
    .line 38
    filled-new-array/range {v1 .. v18}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    move v2, v0

    .line 43
    :goto_0
    const/16 v3, 0x12

    .line 44
    .line 45
    if-ge v2, v3, :cond_1

    .line 46
    .line 47
    aget-object v3, v1, v2

    .line 48
    .line 49
    new-instance v4, Ljava/io/File;

    .line 50
    .line 51
    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 55
    .line 56
    .line 57
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    if-eqz v3, :cond_0

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    return v0

    .line 62
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    :cond_1
    return v0
.end method
