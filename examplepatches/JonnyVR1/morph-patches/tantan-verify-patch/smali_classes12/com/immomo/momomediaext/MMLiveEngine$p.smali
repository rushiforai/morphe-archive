.class Lcom/immomo/momomediaext/MMLiveEngine$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/coninf/MRtcEventHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioMixingFinished()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x1398

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    const-string v2, "EVT_MSG"

    .line 26
    .line 27
    const-string v3, "Audio Mixing Finished"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onConnectionLost()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x1397

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    const-string v2, "EVT_MSG"

    .line 26
    .line 27
    const-string v3, "Connect Lost"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onError(I)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x139d

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "Link Error:"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "EVT_MSG"

    .line 40
    .line 41
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v2, "extra"

    .line 45
    .line 46
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public onFirstRemoteVideoDecoded(JIII)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x13b1

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    const-string v2, "EVT_MSG"

    .line 26
    .line 27
    const-string v3, "First Remote Video Frame Decoded"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v2, "uid"

    .line 33
    .line 34
    long-to-int p1, p1

    .line 35
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    const-string p1, "width"

    .line 39
    .line 40
    invoke-virtual {v0, p1, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string p1, "height"

    .line 44
    .line 45
    invoke-virtual {v0, p1, p4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    const-string p1, "elapsed"

    .line 49
    .line 50
    invoke-virtual {v0, p1, p5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public onJoinChannelSuccess(Ljava/lang/String;JI)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 22
    .line 23
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget-object v3, v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    cmp-long v3, v3, p2

    .line 38
    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->g(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    cmp-long p0, v3, p2

    .line 60
    .line 61
    if-nez p0, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const/16 p0, 0x1389

    .line 65
    .line 66
    iput p0, v2, Landroid/os/Message;->what:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    :goto_0
    const/16 p0, 0x1388

    .line 70
    .line 71
    iput p0, v2, Landroid/os/Message;->what:I

    .line 72
    .line 73
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v3, "join channel sucess, channel:"

    .line 76
    .line 77
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string v3, "EVT_MSG"

    .line 88
    .line 89
    invoke-virtual {v1, v3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const-string p0, "uid"

    .line 93
    .line 94
    long-to-int p2, p2

    .line 95
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    const-string p0, "channel"

    .line 99
    .line 100
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const-string p0, "elapsed"

    .line 104
    .line 105
    invoke-virtual {v1, p0, p4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method public onJoinChannelfail(Ljava/lang/String;JI)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, -0x138d

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "join channel Error, channel:"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "EVT_MSG"

    .line 40
    .line 41
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v2, "uid"

    .line 45
    .line 46
    long-to-int p2, p2

    .line 47
    invoke-virtual {v0, v2, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    const-string p2, "channel"

    .line 51
    .line 52
    invoke-virtual {v0, p2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p1, "elapsed"

    .line 56
    .line 57
    invoke-virtual {v0, p1, p4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public onUserMuteAudio(IZ)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x13a7

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "user mute audio:"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v3, ", uid:"

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "EVT_MSG"

    .line 48
    .line 49
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-string v2, "uid"

    .line 53
    .line 54
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    const-string p1, "muted"

    .line 58
    .line 59
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public onUserMuteVideo(IZ)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x13a8

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "user mute video:"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v3, ", uid:"

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "EVT_MSG"

    .line 48
    .line 49
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-string v2, "uid"

    .line 53
    .line 54
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    const-string p1, "muted"

    .line 58
    .line 59
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public onUserOffline(JI)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 22
    .line 23
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget-object v3, v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    cmp-long v3, v3, p1

    .line 38
    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 42
    .line 43
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->g(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    cmp-long v3, v3, p1

    .line 60
    .line 61
    if-nez v3, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const/16 p0, 0x1393

    .line 65
    .line 66
    iput p0, v2, Landroid/os/Message;->what:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    :goto_0
    const/16 v3, 0x1392

    .line 70
    .line 71
    iput v3, v2, Landroid/os/Message;->what:I

    .line 72
    .line 73
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 74
    .line 75
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    if-eqz v3, :cond_2

    .line 80
    .line 81
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 82
    .line 83
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 88
    .line 89
    const-string v3, "channel"

    .line 90
    .line 91
    invoke-virtual {v1, v3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v3, "user offlinne, reason:"

    .line 97
    .line 98
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v3, ", uid:"

    .line 105
    .line 106
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const-string v3, "EVT_MSG"

    .line 117
    .line 118
    invoke-virtual {v1, v3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    const-string p0, "uid"

    .line 122
    .line 123
    long-to-int p1, p1

    .line 124
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 125
    .line 126
    .line 127
    const-string p0, "reason"

    .line 128
    .line 129
    invoke-virtual {v1, p0, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 133
    .line 134
    .line 135
    :cond_3
    return-void
.end method

.method public onWarning(I)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$p;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x139c

    .line 22
    .line 23
    iput v2, v1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "Link Warn:"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "EVT_MSG"

    .line 40
    .line 41
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v2, "warn"

    .line 45
    .line 46
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
