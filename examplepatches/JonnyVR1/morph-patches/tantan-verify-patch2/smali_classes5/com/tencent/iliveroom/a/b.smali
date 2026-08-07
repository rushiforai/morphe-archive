.class public Lcom/tencent/iliveroom/a/b;
.super Lcom/tencent/trtc/TRTCCloudListener;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/iliveroom/a/a;",
            ">;"
        }
    .end annotation
.end field

.field private b:Z

.field private c:Lcom/tencent/iliveroom/a/b/c;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/trtc/TRTCCloudListener;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/iliveroom/a/b/c;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/tencent/iliveroom/a/b/c;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b;->c:Lcom/tencent/iliveroom/a/b/c;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Lcom/tencent/iliveroom/a/a;
    .locals 0

    .line 150
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/iliveroom/a/a;

    return-object p0
.end method

.method public a(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 5

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    const-string v0, "EVT_MSG"

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "onEvent: userId = "

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, " eventCode = "

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, " eventParam = "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v2, " msg = "

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "TRTCAdapter-callback"

    .line 51
    .line 52
    invoke-static {v2, v1}, Lcom/tencent/rtmp/TXLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    if-eqz p3, :cond_5

    .line 62
    .line 63
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_5

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a;->a()Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 76
    .line 77
    .line 78
    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    new-instance p1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v0, " ["

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, "]"

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const/16 v0, 0x3f0

    .line 105
    .line 106
    const-string v3, "EVT_PARAM1"

    .line 107
    .line 108
    const/4 v4, 0x1

    .line 109
    if-eq p2, v0, :cond_3

    .line 110
    .line 111
    const/16 v0, 0x7d8

    .line 112
    .line 113
    if-eq p2, v0, :cond_1

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_1
    invoke-virtual {p3, v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 121
    .line 122
    if-ne p2, v4, :cond_2

    .line 123
    .line 124
    const/16 p2, 0x32cd

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_2
    const/16 p2, 0x32ce

    .line 128
    .line 129
    :goto_1
    invoke-virtual {p0, v1, v2, p2, p1}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_3
    invoke-virtual {p3, v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 138
    .line 139
    if-ne p2, v4, :cond_4

    .line 140
    .line 141
    const/16 p2, 0x32cb

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_4
    const/16 p2, 0x32cc

    .line 145
    .line 146
    :goto_2
    invoke-virtual {p0, v1, v2, p2, p1}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :catch_0
    :cond_5
    :goto_3
    return-void
.end method

.method public onAudioEffectFinished(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v1, Lcom/tencent/iliveroom/a/b$1;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0, p1}, Lcom/tencent/iliveroom/a/b$1;-><init>(Lcom/tencent/iliveroom/a/b;Lcom/tencent/iliveroom/a/a;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onEffectPlayFinish(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onEffectPlayError(II)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public onCameraDidReady()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 12
    .line 13
    iget-wide v0, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 14
    .line 15
    const/16 v2, 0x32ca

    .line 16
    .line 17
    const-string v3, "\u6253\u5f00\u6444\u50cf\u5934\u6210\u529f"

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onConnectOtherRoom(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->e:Lcom/tencent/iliveroom/a/c;

    .line 12
    .line 13
    invoke-virtual {p1, p2, p3}, Lcom/tencent/iliveroom/a/c;->a(ILjava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1, p2, p3}, Lcom/tencent/iliveroom/a/c/e;->onConnectOtherRoom(JILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :catch_0
    :cond_0
    return-void
.end method

.method public onConnectionRecovery()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 12
    .line 13
    iget-wide v0, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 14
    .line 15
    const/16 v2, 0x32c9

    .line 16
    .line 17
    const-string v3, "\u8fde\u63a5\u670d\u52a1\u5668\u6210\u529f"

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onDisConnectOtherRoom(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onDisconnectOtherRoom(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onEnterRoom(J)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "onEnterRoom -> elapsed = "

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "TRTCAdapter-callback"

    .line 26
    .line 27
    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v4, 0x0

    .line 31
    .line 32
    cmp-long v2, p1, v4

    .line 33
    .line 34
    if-ltz v2, :cond_0

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, v0, Lcom/tencent/iliveroom/a/a;->l:Z

    .line 38
    .line 39
    iget-object p2, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 40
    .line 41
    iget-wide v2, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 42
    .line 43
    const/16 v4, 0x19ca

    .line 44
    .line 45
    const-string v5, "\u83b7\u53d6\u63a5\u53e3\u673a\u5730\u5740\u6210\u529f"

    .line 46
    .line 47
    invoke-virtual {p2, v2, v3, v4, v5}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 51
    .line 52
    iget-wide v2, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 53
    .line 54
    const/16 v4, 0x32c9

    .line 55
    .line 56
    const-string v5, "\u8fde\u63a5\u670d\u52a1\u5668\u6210\u529f"

    .line 57
    .line 58
    invoke-virtual {p2, v2, v3, v4, v5}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 62
    .line 63
    iget-wide v2, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 64
    .line 65
    new-instance v4, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v5, ""

    .line 68
    .line 69
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-string v5, "18446744073709551615"

    .line 73
    .line 74
    const/16 v6, 0x2711

    .line 75
    .line 76
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    const/16 v5, 0x32d5

    .line 88
    .line 89
    invoke-virtual {p2, v2, v3, v5, v4}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-boolean p2, p0, Lcom/tencent/iliveroom/a/b;->b:Z

    .line 93
    .line 94
    if-nez p2, :cond_2

    .line 95
    .line 96
    iput-boolean p1, p0, Lcom/tencent/iliveroom/a/b;->b:Z

    .line 97
    .line 98
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 99
    .line 100
    iget-object p1, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/c/e;->onJoinRoomSuccess(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    iget-boolean p0, v0, Lcom/tencent/iliveroom/a/a;->l:Z

    .line 107
    .line 108
    if-nez p0, :cond_1

    .line 109
    .line 110
    new-instance p0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v2, "\u8fdb\u623f\u5931\u8d25 ["

    .line 113
    .line 114
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p1, "]"

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iget-object p1, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 130
    .line 131
    iget-object p2, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 132
    .line 133
    const/16 v0, 0x2b5f

    .line 134
    .line 135
    invoke-virtual {p1, p2, v0, p0}, Lcom/tencent/iliveroom/a/c/e;->onJoinRoomFailed(Ljava/lang/String;ILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v0, "onEnterRoom -> reenter room fail. code:"

    .line 142
    .line 143
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {v3, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_2
    return-void
.end method

.method public onError(ILjava/lang/String;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/trtc/TRTCCloudListener;->onError(ILjava/lang/String;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onError: errCode = "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " errMsg = "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, " extraInfo = "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "TRTCAdapter-callback"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/tencent/rtmp/TXLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    if-eqz p3, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a;->a()Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    :try_start_0
    const-string v1, "EVT_USERID"

    .line 54
    .line 55
    invoke-virtual {p3, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserIdByTinyId(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 68
    .line 69
    .line 70
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    new-instance p3, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, " ["

    .line 80
    .line 81
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string p2, "]"

    .line 88
    .line 89
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    const/16 p3, -0x527

    .line 97
    .line 98
    if-eq p1, p3, :cond_2

    .line 99
    .line 100
    const/16 p3, -0x525

    .line 101
    .line 102
    if-eq p1, p3, :cond_1

    .line 103
    .line 104
    const/16 p3, -0x516

    .line 105
    .line 106
    if-eq p1, p3, :cond_0

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 110
    .line 111
    const/16 p1, 0x2afc

    .line 112
    .line 113
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onError(JILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 118
    .line 119
    const/16 p1, 0x2eea

    .line 120
    .line 121
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onWarning(JILjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_2
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 126
    .line 127
    const/16 p1, 0x2eeb

    .line 128
    .line 129
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onWarning(JILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :catch_0
    move-exception p0

    .line 134
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 135
    .line 136
    .line 137
    :cond_3
    :goto_0
    return-void
.end method

.method public onExitRoom(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 14
    .line 15
    iget-object p1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/c/e;->onQuitRoomSuccess(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v1, 0x1

    .line 22
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 25
    .line 26
    iget-object p1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 27
    .line 28
    iget-wide v0, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/iliveroom/a/c/e;->onKickOut(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public onFirstAudioFrame(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 12
    .line 13
    const/16 p1, 0x32d3

    .line 14
    .line 15
    const-string v2, "\u64ad\u653e\u9996\u4e2a\u97f3\u9891\u5e27"

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    const-string p1, "TRTCAdapter-callback"

    .line 23
    .line 24
    const-string v0, "parse user id failed."

    .line 25
    .line 26
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onMicDidReady()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 12
    .line 13
    iget-wide v0, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 14
    .line 15
    const/16 v2, 0x32d7

    .line 16
    .line 17
    const-string v3, "\u6253\u5f00\u9ea6\u514b\u98ce\u6210\u529f"

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onMissCustomCmdMsg(Ljava/lang/String;III)V
    .locals 7

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 18
    .line 19
    move v4, p2

    .line 20
    move v5, p3

    .line 21
    move v6, p4

    .line 22
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/iliveroom/a/c/e;->onStreamMessageError(Ljava/lang/String;JIII)V

    .line 23
    .line 24
    .line 25
    :catch_0
    :cond_0
    return-void
.end method

.method public onRecvCustomCmdMsg(Ljava/lang/String;II[B)V
    .locals 6

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 18
    .line 19
    move v4, p2

    .line 20
    move-object v5, p4

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/iliveroom/a/c/e;->onRecvStreamMessage(Ljava/lang/String;JI[B)V

    .line 22
    .line 23
    .line 24
    :catch_0
    :cond_0
    return-void
.end method

.method public onRecvSEIMsg(Ljava/lang/String;[B)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/tencent/iliveroom/a/c/e;->onRecvMessage(Ljava/lang/String;J[B)V

    .line 20
    .line 21
    .line 22
    :catch_0
    :cond_0
    return-void
.end method

.method public onSetMixTranscodingConfig(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/trtc/TRTCCloudListener;->onSetMixTranscodingConfig(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onSetMixTranscodingConfig(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onStartPublishCDNStream(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onStartPublishCDNStream(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onStatistics(Lcom/tencent/trtc/TRTCStatistics;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b;->c:Lcom/tencent/iliveroom/a/b/c;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/b/c;->a(Lcom/tencent/trtc/TRTCStatistics;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Lcom/tencent/iliveroom/a/c/e;->onStatus(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onStopPublishCDNStream(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onStopPublishCDNStream(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onSwitchRole(ILjava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz p2, :cond_3

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/a;->b:Z

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x2

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    move v3, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v3, v1

    .line 20
    :goto_0
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v1, v2

    .line 24
    :goto_1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    move v1, v3

    .line 32
    :goto_2
    invoke-virtual {p0, p2, v3, v1}, Lcom/tencent/iliveroom/a/c/e;->onRoomRoleChanged(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    :cond_3
    return-void
.end method

.method public onTryToReconnect()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 12
    .line 13
    iget-wide v0, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 14
    .line 15
    const/16 v2, 0x2ee1

    .line 16
    .line 17
    const-string v3, "\u7f51\u7edc\u65ad\u5f00\u8fde\u63a5\uff0c\u6b63\u5728\u91cd\u65b0\u8fdb\u623f"

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c/e;->onWarning(JILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onUserEnter(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/trtc/TRTCCloudListener;->onUserEnter(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 5
    .line 6
    .line 7
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    iget-boolean p1, p0, Lcom/tencent/iliveroom/a/a;->g:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/iliveroom/a/a;->startRemoteRender(JLandroid/view/SurfaceView;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/iliveroom/a/c/e;->onRoomBroadcasterIn(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    const-string p1, "TRTCAdapter-callback"

    .line 36
    .line 37
    const-string v0, "parse user id failed."

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onUserExit(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/trtc/TRTCCloudListener;->onUserExit(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 5
    .line 6
    .line 7
    move-result-wide p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/a;->g:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/tencent/iliveroom/a/a;->stopRemoteRender(J)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 22
    .line 23
    cmp-long v0, v0, p1

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a;->j:Lcom/tencent/iliveroom/a/a/d;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/c/a;->b()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p0, v0, p1, p2, v1}, Lcom/tencent/iliveroom/a/c/e;->onRoomBroadcasterOut(Ljava/lang/String;JI)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void

    .line 48
    :catch_0
    move-exception p0

    .line 49
    const-string p1, "TRTCAdapter-callback"

    .line 50
    .line 51
    const-string p2, "parse user id failed."

    .line 52
    .line 53
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onUserVideoAvailable(Ljava/lang/String;Z)V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->h:Ljava/util/Set;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-interface {p1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a;->h:Ljava/util/Set;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {p2, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 39
    .line 40
    const/16 v2, 0x32d2

    .line 41
    .line 42
    const-string v3, "\u6e32\u67d3\u9996\u4e2a\u89c6\u9891\u5e27(IDR)"

    .line 43
    .line 44
    invoke-virtual {p2, v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/iliveroom/a/c/e;->onRoomHasVideo(Ljava/lang/String;J)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void

    .line 55
    :catch_0
    move-exception p0

    .line 56
    const-string p1, "TRTCAdapter-callback"

    .line 57
    .line 58
    const-string p2, "parse user id failed."

    .line 59
    .line 60
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onUserVoiceVolume(Ljava/util/ArrayList;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    new-instance p2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :catch_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;

    .line 31
    .line 32
    new-instance v1, Lcom/tencent/iliveroom/TXIAudioVolumeInfo;

    .line 33
    .line 34
    invoke-direct {v1}, Lcom/tencent/iliveroom/TXIAudioVolumeInfo;-><init>()V

    .line 35
    .line 36
    .line 37
    :try_start_0
    iget-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;->userId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    iput-wide v2, v1, Lcom/tencent/iliveroom/TXIAudioVolumeInfo;->userId:J

    .line 44
    .line 45
    iget v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVolumeInfo;->volume:I

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    const/high16 v2, 0x42c80000    # 100.0f

    .line 49
    .line 50
    div-float/2addr v0, v2

    .line 51
    iput v0, v1, Lcom/tencent/iliveroom/TXIAudioVolumeInfo;->volume:F

    .line 52
    .line 53
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {p0, p2}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onReportAudioVolumeIndicationOfSpeakers(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public onWarning(ILjava/lang/String;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/trtc/TRTCCloudListener;->onWarning(ILjava/lang/String;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onWarning: warningCode = "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " warningMsg = "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, " extraInfo = "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "TRTCAdapter-callback"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/tencent/rtmp/TXLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b;->a()Lcom/tencent/iliveroom/a/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a;->a()Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    :try_start_0
    const-string v1, "EVT_USERID"

    .line 54
    .line 55
    invoke-virtual {p3, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserIdByTinyId(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 68
    .line 69
    .line 70
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    new-instance p3, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p2, " ["

    .line 80
    .line 81
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string p2, "]"

    .line 88
    .line 89
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    const/16 p3, 0x44f

    .line 97
    .line 98
    if-eq p1, p3, :cond_1

    .line 99
    .line 100
    const/16 p3, 0x839

    .line 101
    .line 102
    if-eq p1, p3, :cond_0

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 106
    .line 107
    const/16 p1, 0x32d4

    .line 108
    .line 109
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onEvent(JILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 114
    .line 115
    const/16 p1, 0x2ee3

    .line 116
    .line 117
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/tencent/iliveroom/a/c/e;->onWarning(JILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :catch_0
    move-exception p0

    .line 122
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 123
    .line 124
    .line 125
    :cond_2
    :goto_0
    return-void
.end method
