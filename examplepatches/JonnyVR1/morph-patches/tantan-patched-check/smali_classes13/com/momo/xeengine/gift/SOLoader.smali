.class Lcom/momo/xeengine/gift/SOLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static SUCCESS:Z


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

.method public static declared-synchronized load()Z
    .locals 2

    .line 1
    const-class v0, Lcom/momo/xeengine/gift/SOLoader;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/momo/xeengine/gift/SOLoader;->SUCCESS:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    invoke-static {}, Lcom/momo/xeengine/somanager/XEngineSOManager;->loadEngineSO()Z

    .line 9
    .line 10
    .line 11
    const-string v1, "xmedia"

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "xegiftplayer"

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    sput-boolean v1, Lcom/momo/xeengine/gift/SOLoader;->SUCCESS:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    :catchall_0
    :cond_0
    :try_start_2
    sget-boolean v1, Lcom/momo/xeengine/gift/SOLoader;->SUCCESS:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return v1

    .line 28
    :catchall_1
    move-exception v1

    .line 29
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 30
    throw v1
.end method
