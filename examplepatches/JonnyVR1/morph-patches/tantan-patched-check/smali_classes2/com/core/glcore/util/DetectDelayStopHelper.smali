.class public Lcom/core/glcore/util/DetectDelayStopHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/core/glcore/util/DetectDelayStopHelper$DetectDelayStopHolder;,
        Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;
    }
.end annotation


# static fields
.field private static final DELAY_FRAME_LIMIT:I = 0x12c

.field public static final TYPE_DETECT_AR_GIFT:I = 0x2f2

.field public static final TYPE_DETECT_BODY:I = 0x2ef

.field public static final TYPE_DETECT_CARTOON:I = 0x2f0

.field public static final TYPE_DETECT_CRYING_FACE:I = 0x2f1

.field public static final TYPE_DETECT_EXPRESS:I = 0x2eb

.field public static final TYPE_DETECT_GESTURE:I = 0x2ec

.field public static final TYPE_DETECT_OBJECT:I = 0x2ed

.field public static final TYPE_DETECT_PICKNOISE:I = 0x2ee

.field public static final TYPE_DETECT_RIG:I = 0x2aa


# instance fields
.field private delayMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lcom/core/glcore/util/DetectDelayStopHelper$1;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/core/glcore/util/DetectDelayStopHelper;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/DetectDelayStopHelper$DetectDelayStopHolder;->detectDelayStop:Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public declared-synchronized cancelRelease(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :try_start_1
    iput-boolean v1, v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->startDelay:Z

    .line 20
    .line 21
    iput v1, v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->frameCount:I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-object v1, v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->runnable:Ljava/lang/Runnable;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    .line 35
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    throw p1
.end method

.method public declared-synchronized delayRelease(ILjava/lang/Runnable;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;-><init>(Lcom/core/glcore/util/DetectDelayStopHelper;Lcom/core/glcore/util/DetectDelayStopHelper$1;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->startDelay:Z

    .line 36
    .line 37
    iput-object p2, v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->runnable:Ljava/lang/Runnable;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput p1, v0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->frameCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p1
.end method

.method public declared-synchronized onNewFrame()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Integer;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/core/glcore/util/DetectDelayStopHelper;->delayMap:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    iget-boolean v2, v1, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->startDelay:Z

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget v2, v1, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->frameCount:I

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    iput v2, v1, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->frameCount:I

    .line 43
    .line 44
    const/16 v3, 0x12c

    .line 45
    .line 46
    if-ne v2, v3, :cond_0

    .line 47
    .line 48
    iget-object v2, v1, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->runnable:Ljava/lang/Runnable;

    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catchall_0
    move-exception v0

    .line 57
    goto :goto_2

    .line 58
    :cond_1
    :goto_1
    const/4 v2, 0x0

    .line 59
    iput-object v2, v1, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->runnable:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    monitor-exit p0

    .line 63
    return-void

    .line 64
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw v0
.end method
