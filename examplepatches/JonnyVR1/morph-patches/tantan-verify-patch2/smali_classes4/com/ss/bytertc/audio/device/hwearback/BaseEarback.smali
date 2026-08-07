.class public abstract Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/IHardWareEarback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;
    }
.end annotation


# static fields
.field public static final RESULT_INVALID_STATE:I = -0x2

.field public static final RESULT_OP_FAILED:I = -0x1

.field public static final RESULT_SUCCESS:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BaseEarback"


# instance fields
.field protected final context:Landroid/content/Context;

.field private volatile state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

.field protected final webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->context:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 7
    .line 8
    sget-object p1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->IDLE:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 11
    .line 12
    return-void
.end method

.method private changeState(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "changeState: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " -> "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "BaseEarback"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 33
    .line 34
    if-eq v0, p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onStateChanged(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized close()I
    .locals 3

    .line 1
    const-string v0, "close() with state: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "BaseEarback"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 24
    .line 25
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->RUNNING:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    const/4 p0, -0x2

    .line 31
    return p0

    .line 32
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onClose()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZED:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 39
    .line 40
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->changeState(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    .line 43
    monitor-exit p0

    .line 44
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    monitor-exit p0

    .line 49
    const/4 p0, -0x1

    .line 50
    return p0

    .line 51
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    throw v0
.end method

.method public getState()Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized init()I
    .locals 3

    .line 1
    const-string v0, "init() with state: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "BaseEarback"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZED:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x0

    .line 36
    if-lt v0, v1, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->isSupport()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 51
    .line 52
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZING:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    if-ne v0, v1, :cond_1

    .line 55
    .line 56
    monitor-exit p0

    .line 57
    return v2

    .line 58
    :cond_1
    :goto_0
    :try_start_1
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZING:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 59
    .line 60
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->changeState(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onInit()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .line 65
    .line 66
    monitor-exit p0

    .line 67
    return v2

    .line 68
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    throw v0
.end method

.method public isSupport()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZED:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onIsSupportCall()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public abstract onClose()Z
.end method

.method public abstract onInit()V
.end method

.method public declared-synchronized onInitResult(Z)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 3
    .line 4
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZING:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 5
    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZED:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->IDLE:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 16
    .line 17
    :goto_0
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->isSupport()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/4 p1, 0x0

    .line 32
    :goto_1
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupported(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    :cond_2
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public abstract onIsSupportCall()Z
.end method

.method public abstract onOpen()Z
.end method

.method public abstract onRelease()V
.end method

.method public declared-synchronized onStateChanged(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method

.method public declared-synchronized open()I
    .locals 4

    .line 1
    const-string v0, "open() with state: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "BaseEarback"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 24
    .line 25
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->RUNNING:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return v2

    .line 32
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 33
    .line 34
    sget-object v3, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->INITIALIZED:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 35
    .line 36
    if-ne v0, v3, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->isSupport()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onOpen()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-direct {p0, v1}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->changeState(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    monitor-exit p0

    .line 55
    return v2

    .line 56
    :catchall_0
    move-exception v0

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    monitor-exit p0

    .line 59
    const/4 p0, -0x1

    .line 60
    return p0

    .line 61
    :cond_3
    :goto_0
    monitor-exit p0

    .line 62
    const/4 p0, -0x2

    .line 63
    return p0

    .line 64
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    throw v0
.end method

.method public declared-synchronized release()I
    .locals 3

    .line 1
    const-string v0, "release() with state: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "BaseEarback"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->state:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 24
    .line 25
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->IDLE:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return v2

    .line 32
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onRelease()V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, v1}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->changeState(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return v2

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    throw v0
.end method
