.class public Lcom/momo/xengine/XEngineLuaPatch;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static SO_LOAD_SUCCEEDED:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static init()V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "xengine_lua_patch"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Lcom/momo/xengine/XEngineLuaPatch;->SO_LOAD_SUCCEEDED:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "Lua\u8865\u4e01\u5e93\u52a0\u8f7d\u5931\u8d25: "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "[XENGINE]"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private static native nativeRegister(J)V
.end method

.method public static open(J)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xengine/XEngineLuaPatch;->init()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/momo/xengine/XEngineLuaPatch;->SO_LOAD_SUCCEEDED:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/momo/xengine/XEngineLuaPatch;->nativeRegister(J)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
