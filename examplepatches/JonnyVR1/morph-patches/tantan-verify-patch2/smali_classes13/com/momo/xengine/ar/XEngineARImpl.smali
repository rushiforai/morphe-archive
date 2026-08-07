.class final Lcom/momo/xengine/ar/XEngineARImpl;
.super Lcom/momo/xengine/ar/XEngineAR;
.source "SourceFile"


# static fields
.field private static SO_LOAD_SUCCEEDED:Z


# instance fields
.field private final supportType:Lcom/momo/xengine/ar/XEngineAR$SupportType;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/ar/XEngineAR;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/momo/xengine/ar/XEngineAR$SupportType;->SupportSensor:Lcom/momo/xengine/ar/XEngineAR$SupportType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/xengine/ar/XEngineARImpl;->supportType:Lcom/momo/xengine/ar/XEngineAR$SupportType;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/momo/xengine/ar/XEngineARImpl;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xengine/ar/XEngineARImpl;->nativeBindLuaApi(J)V

    return-void
.end method

.method private declared-synchronized loadNativeLib()V
    .locals 5

    .line 1
    const-string v0, "AR\u6a21\u5757\u52a0\u8f7d\u5931\u8d25"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/momo/xengine/ar/XEngineARImpl;->SO_LOAD_SUCCEEDED:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_1
    const-string v1, "xengine_ar"

    .line 11
    .line 12
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/momo/xengine/ar/XEngineARImpl;->nativeGetArchiveTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    const-wide/32 v3, 0x69c5f9f0

    .line 20
    .line 21
    .line 22
    cmp-long v1, v3, v1

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/xengine/ar/XEngineARImpl;->supportType:Lcom/momo/xengine/ar/XEngineAR$SupportType;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/momo/xengine/ar/XEngineAR$SupportType;->getValue()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {p0, v1}, Lcom/momo/xengine/ar/XEngineARImpl;->nativeSetSupportType(I)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    sput-boolean v1, Lcom/momo/xengine/ar/XEngineARImpl;->SO_LOAD_SUCCEEDED:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception v1

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :try_start_2
    new-instance v1, Lcom/momo/xeengine/XEngineException;

    .line 43
    .line 44
    const-string v2, "AR\u6a21\u5757\u7248\u672c\u52a0\u8f7d\u9519\u8bef"

    .line 45
    .line 46
    invoke-direct {v1, v2}, Lcom/momo/xeengine/XEngineException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 50
    :goto_0
    :try_start_3
    new-instance v2, Ljava/lang/RuntimeException;

    .line 51
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw v2

    .line 68
    :catchall_1
    move-exception v0

    .line 69
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 70
    throw v0
.end method

.method private native nativeBindLuaApi(J)V
.end method

.method private native nativeGetArchiveTime()J
.end method

.method private native nativeSetSupportType(I)V
.end method


# virtual methods
.method public createCamera(Lcom/momo/xeengine/IXEngine;)Lcom/momo/xengine/ar/IXARCamera;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/ar/ARCameraCache;->getARCamera(Lcom/momo/xeengine/IXEngine;)Lcom/momo/xengine/ar/IXARCamera;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public engineDidCreated(Lcom/momo/xeengine/IXEngine;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/momo/xengine/ar/a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/momo/xengine/ar/a;-><init>(Lcom/momo/xengine/ar/XEngineARImpl;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Lcom/momo/xeengine/script/XEScriptEngine;->registerModule(Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public engineWillCreate()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/ar/XEngineARImpl;->loadNativeLib()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public engineWillDestroy(Lcom/momo/xeengine/IXEngine;)V
    .locals 0

    return-void
.end method

.method public getSupportType()Lcom/momo/xengine/ar/XEngineAR$SupportType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/ar/XEngineARImpl;->supportType:Lcom/momo/xengine/ar/XEngineAR$SupportType;

    .line 2
    .line 3
    return-object p0
.end method
