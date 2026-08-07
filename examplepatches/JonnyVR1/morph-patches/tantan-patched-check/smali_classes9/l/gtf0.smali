.class public Ll/gtf0;
.super Ll/p2w;
.source "SourceFile"

# interfaces
.implements Ll/hxl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gtf0$a;
    }
.end annotation


# instance fields
.field public a:Ll/wg50;

.field public b:Ll/dxl;

.field public c:Z

.field public d:Ll/p1w$a;

.field public e:Ll/r3w;


# direct methods
.method public constructor <init>(Ll/dxl;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/p2w;-><init>(Ll/dxl;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/p1w$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/p1w$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gtf0;->d:Ll/p1w$a;

    .line 10
    .line 11
    new-instance v0, Ll/r3w;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/r3w;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/gtf0;->e:Ll/r3w;

    .line 17
    .line 18
    iput-object p1, p0, Ll/gtf0;->b:Ll/dxl;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const/16 p2, 0x9

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/gtf0;->b:Ll/dxl;

    .line 6
    .line 7
    iget-object p0, p0, Ll/gtf0;->e:Ll/r3w;

    .line 8
    .line 9
    iget-boolean v1, p0, Ll/r3w;->h:Z

    .line 10
    .line 11
    iget-object v2, p0, Ll/r3w;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v3, p0, Ll/r3w;->d:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v4, p0, Ll/r3w;->e:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v5, p0, Ll/r3w;->f:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface/range {v0 .. v5}, Ll/dxl;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(IILl/gxl;)V
    .locals 3

    .line 1
    const/4 v0, 0x6

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Ll/gtf0;->e:Ll/r3w;

    .line 10
    .line 11
    iget-object v2, v2, Ll/r3w;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, "SocketLongLink State change, preState:"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/m3g0;->a(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p1, ", current:"

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Ll/m3g0;->a(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v1, "[live][longlink]"

    .line 45
    .line 46
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    if-ne p2, v0, :cond_1

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 p1, 0x0

    .line 54
    :goto_0
    iput-boolean p1, p0, Ll/gtf0;->c:Z

    .line 55
    .line 56
    iget-object p2, p0, Ll/gtf0;->b:Ll/dxl;

    .line 57
    .line 58
    invoke-interface {p2, p1}, Ll/dxl;->b(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p3}, Ll/gtf0;->j(Ll/gxl;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public e()Ll/p1w$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gtf0;->d:Ll/p1w$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;J)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/gtf0;->a:Ll/wg50;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/gtf0;->c:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p1, p0, Ll/gtf0;->e:Ll/r3w;

    .line 11
    .line 12
    iget-object p1, p1, Ll/r3w;->g:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "voiceRoom"

    .line 15
    .line 16
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->video:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->video:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 26
    .line 27
    :goto_0
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;->setSeq(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const-string p3, "live.client.chatReaded"

    .line 51
    .line 52
    invoke-virtual {p2, p3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setMsgTypeName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const/4 p3, 0x0

    .line 57
    invoke-virtual {p2, p3}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setIsResponse(Z)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p1}, Ll/qq60;->a(Lcom/google/protobuf/q;)Lcom/google/protobuf/Any;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p2, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setData(Lcom/google/protobuf/Any;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 74
    .line 75
    new-instance p2, Ll/rct;

    .line 76
    .line 77
    invoke-direct {p2, p1}, Ll/rct;-><init>(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/gtf0;->a:Ll/wg50;

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Ll/wg50;->a(Ll/qy3;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Ll/gtf0;->e:Ll/r3w;

    .line 92
    .line 93
    iget-object p2, p2, Ll/r3w;->g:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string p2, "send Message error, isConnected:"

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-boolean p2, p0, Ll/gtf0;->c:Z

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p2, ",okim:"

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/gtf0;->a:Ll/wg50;

    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "[live][longlink]"

    .line 123
    .line 124
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Connector;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p4    # Lcom/p1/mobile/putong/data/Connector;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "SocketLongLink roomId is null"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 40
    .line 41
    new-instance p1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-static {}, Ll/r3w$a;->a()Ll/r3w$a;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, p1}, Ll/r3w$a;->f(Ljava/lang/String;)Ll/r3w$a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, p2}, Ll/r3w$a;->j(Ljava/lang/String;)Ll/r3w$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, p3}, Ll/r3w$a;->c(Z)Ll/r3w$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, p5}, Ll/r3w$a;->g(Ljava/lang/String;)Ll/r3w$a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_2

    .line 88
    .line 89
    const-string p6, ""

    .line 90
    .line 91
    :cond_2
    invoke-virtual {p1, p6}, Ll/r3w$a;->e(Ljava/lang/String;)Ll/r3w$a;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1, p7}, Ll/r3w$a;->i(Ljava/lang/String;)Ll/r3w$a;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1, p8}, Ll/r3w$a;->d(Ljava/lang/String;)Ll/r3w$a;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1, p9}, Ll/r3w$a;->h(Ljava/lang/String;)Ll/r3w$a;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Ll/r3w$a;->b()Ll/r3w;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Ll/gtf0;->e:Ll/r3w;

    .line 112
    .line 113
    iget-object p1, p0, Ll/gtf0;->a:Ll/wg50;

    .line 114
    .line 115
    if-eqz p1, :cond_3

    .line 116
    .line 117
    new-instance p1, Ljava/lang/IllegalAccessException;

    .line 118
    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Ll/gtf0;->e:Ll/r3w;

    .line 125
    .line 126
    iget-object p0, p0, Ll/r3w;->g:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p0, "okim is created, ignore"

    .line 132
    .line 133
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-direct {p1, p0}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const-string p0, "[live][longlink]"

    .line 144
    .line 145
    invoke-static {p0, p1}, Ll/nsh0;->l(Ljava/lang/String;Ljava/lang/IllegalAccessException;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_3
    invoke-virtual {p0, p4}, Ll/gtf0;->i(Lcom/p1/mobile/putong/data/Connector;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gtf0;->a:Ll/wg50;

    .line 2
    .line 3
    const-string v1, "[live][longlink]"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/IllegalAccessException;

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/gtf0;->e:Ll/r3w;

    .line 15
    .line 16
    iget-object p0, p0, Ll/r3w;->g:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, "okim is null, ignore, roomid:"

    .line 22
    .line 23
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/nsh0;->l(Ljava/lang/String;Ljava/lang/IllegalAccessException;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v0, "stop  "

    .line 43
    .line 44
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/gtf0;->e:Ll/r3w;

    .line 48
    .line 49
    iget-object v0, v0, Ll/r3w;->g:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, " longlink  "

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {v1, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/gtf0;->a:Ll/wg50;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/wg50;->c()V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Ll/gtf0;->a:Ll/wg50;

    .line 73
    .line 74
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/Connector;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/data/Connector;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/gtf0;->e:Ll/r3w;

    .line 7
    .line 8
    iget-object v1, v1, Ll/r3w;->g:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "textRoom"

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Connector;->text_room_tcp_addr_list:Ljava/util/List;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Connector;->tcp_addr_list:Ljava/util/List;

    .line 22
    .line 23
    :goto_0
    const/4 v2, 0x0

    .line 24
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-ge v2, v3, :cond_2

    .line 29
    .line 30
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-nez v4, :cond_1

    .line 41
    .line 42
    new-instance v4, Ll/vxl;

    .line 43
    .line 44
    invoke-direct {v4, v3}, Ll/vxl;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    new-instance v4, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v5, p0, Ll/gtf0;->e:Ll/r3w;

    .line 56
    .line 57
    iget-object v5, v5, Ll/r3w;->g:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v5, " added raw url: "

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    const-string v4, "[live][longlink]"

    .line 75
    .line 76
    invoke-static {v4, v3}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    new-instance v1, Ll/x6s;

    .line 83
    .line 84
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 85
    .line 86
    iget v3, v2, Lcom/p1/mobile/putong/data/ConnectorConfig;->reconnect_backoff_min:I

    .line 87
    .line 88
    iget v2, v2, Lcom/p1/mobile/putong/data/ConnectorConfig;->reconnect_backoff_max:I

    .line 89
    .line 90
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Connector;->client_ip:Ljava/lang/String;

    .line 91
    .line 92
    invoke-direct {v1, v3, v2, v0, v4}, Ll/x6s;-><init>(IILjava/util/List;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    new-instance v0, Ll/nwr;

    .line 96
    .line 97
    invoke-direct {v0}, Ll/nwr;-><init>()V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Ll/gtf0;->e:Ll/r3w;

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ll/nwr;->g(Ll/r3w;)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Ll/hi2;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/hi2;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2, p0}, Ll/hi2;->j(Ll/hxl;)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Ll/gtf0$a;

    .line 114
    .line 115
    invoke-direct {v3}, Ll/gtf0$a;-><init>()V

    .line 116
    .line 117
    .line 118
    new-instance v4, Ll/d2t;

    .line 119
    .line 120
    iget-object v5, p1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 121
    .line 122
    iget v5, v5, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_timeout:I

    .line 123
    .line 124
    invoke-direct {v4, v5}, Ll/d2t;-><init>(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3, v4}, Ll/gtf0$a;->f(Ll/hzq;)V

    .line 128
    .line 129
    .line 130
    new-instance v4, Ll/c2t;

    .line 131
    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 133
    .line 134
    iget p1, p1, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_interval:I

    .line 135
    .line 136
    invoke-direct {v4, p1}, Ll/c2t;-><init>(I)V

    .line 137
    .line 138
    .line 139
    new-instance p1, Ll/th3;

    .line 140
    .line 141
    invoke-direct {p1}, Ll/th3;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, v1}, Ll/th3;->e(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;)Ll/th3;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v0}, Ll/th3;->d(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;)Ll/th3;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1, v2}, Ll/th3;->f(Ll/ixl;)Ll/th3;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Ll/th3;->c(Landroid/app/Application;)Ll/th3;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1, v3}, Ll/th3;->g(Ll/qum;)Ll/th3;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    new-instance v0, Ll/nyt;

    .line 167
    .line 168
    invoke-direct {v0}, Ll/nyt;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, v0}, Ll/th3;->i(Ll/etf0;)Ll/th3;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1, v4}, Ll/th3;->j(Ll/c0j0;)Ll/th3;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iget-object v0, p0, Ll/gtf0;->e:Ll/r3w;

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Ll/th3;->h(Ll/r3w;)Ll/th3;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    new-instance v0, Ll/au6;

    .line 186
    .line 187
    invoke-direct {v0}, Ll/au6;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ll/th3;->a(Ll/bzm;)Ll/th3;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/longlink/intercepter/CompressionInterceptor;

    .line 195
    .line 196
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlink/intercepter/CompressionInterceptor;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ll/th3;->a(Ll/bzm;)Ll/th3;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/longlink/intercepter/CryptInterceptor;

    .line 204
    .line 205
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 206
    .line 207
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlink/intercepter/CryptInterceptor;-><init>(Landroid/content/Context;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1, v0}, Ll/th3;->a(Ll/bzm;)Ll/th3;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    new-instance v0, Ll/b0l;

    .line 215
    .line 216
    iget-object v1, p0, Ll/gtf0;->e:Ll/r3w;

    .line 217
    .line 218
    iget-object v1, v1, Ll/r3w;->b:Ljava/lang/String;

    .line 219
    .line 220
    invoke-direct {v0, v1}, Ll/b0l;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1, v0}, Ll/th3;->a(Ll/bzm;)Ll/th3;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-virtual {p1}, Ll/th3;->b()Ll/wg50;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iput-object p1, p0, Ll/gtf0;->a:Ll/wg50;

    .line 232
    .line 233
    invoke-virtual {p1}, Ll/wg50;->b()V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public final j(Ll/gxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gtf0;->d:Ll/p1w$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/gxl;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, v0, Ll/p1w$a;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/gxl;->b()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/gtf0;->d:Ll/p1w$a;

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;->a()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, v1, Ll/p1w$a;->b:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/gtf0;->d:Ll/p1w$a;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/gxl;->d()Ljava/lang/Throwable;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    const-string p1, ""

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p1}, Ll/gxl;->d()Ljava/lang/Throwable;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :goto_0
    iput-object p1, v0, Ll/p1w$a;->c:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p0, Ll/gtf0;->d:Ll/p1w$a;

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iput-wide v0, p0, Ll/p1w$a;->d:J

    .line 51
    .line 52
    return-void
.end method
