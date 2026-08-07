.class public Ll/n7y;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v0, "cosmosffmpeg"

    .line 2
    .line 3
    const-string v1, "mmssl"

    .line 4
    .line 5
    const-string v2, "mmcrypto"

    .line 6
    .line 7
    const-string v3, "yuvutils"

    .line 8
    .line 9
    const-string v4, "MediaUtils"

    .line 10
    .line 11
    :try_start_0
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v5, "c++_shared"

    .line 24
    .line 25
    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception v5

    .line 33
    invoke-static {v4, v5}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    sget-object v5, Ll/kv0;->b:Landroid/content/Context;

    .line 37
    .line 38
    invoke-static {v5, v3}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object v3, Ll/kv0;->b:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {v3, v2}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v2, Ll/kv0;->b:Landroid/content/Context;

    .line 47
    .line 48
    invoke-static {v2, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object v1, Ll/kv0;->b:Landroid/content/Context;

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-object v0, Ll/kv0;->b:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {v0, v4}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
