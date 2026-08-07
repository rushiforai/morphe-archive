.class public Ll/r9t;
.super Ll/x250;
.source "SourceFile"


# instance fields
.field public b:Ll/kbt;

.field public c:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/x250;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/r9t;->c:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    new-instance v0, Ll/kbt;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/kbt;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/r9t;->b:Ll/kbt;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic f(Ll/fxl;Lcom/google/protobuf/q;Ll/pq60;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Ll/fxl;->a(Lcom/google/protobuf/q;Ll/pq60;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/ur4;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yc60;->b()Ll/ftf0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/ftf0;->g()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    iget-object v1, p0, Ll/r9t;->b:Ll/kbt;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/yc60;->a()[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v1, v0}, Ll/kbt;->a([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/v710;->d()Ll/v710;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgTypeName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ll/v710;->e(Ljava/lang/String;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ll/smc0;->m()Ll/vzv;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v3, "message has no deal, messageType:"

    .line 54
    .line 55
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgTypeName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_0
    const/4 v2, 0x0

    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ll/fxl;

    .line 79
    .line 80
    invoke-interface {v2}, Ll/fxl;->b()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getData()Lcom/google/protobuf/Any;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-static {v2, v3}, Ll/qq60;->b(Ljava/lang/Class;Lcom/google/protobuf/Any;)Lcom/google/protobuf/q;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    new-instance v3, Ll/pq60;

    .line 93
    .line 94
    sget-object v4, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_COMMON:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgId()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-direct {v3, v4, v5, v2}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V

    .line 101
    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    if-eqz v4, :cond_1

    .line 112
    .line 113
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Ll/fxl;

    .line 118
    .line 119
    new-instance v5, Ll/q9t;

    .line 120
    .line 121
    invoke-direct {v5, v4, v2, v3}, Ll/q9t;-><init>(Ll/fxl;Lcom/google/protobuf/q;Ll/pq60;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v5}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_1
    :goto_1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v1}, Ll/p6s;->A0()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_2

    .line 137
    .line 138
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, v0, p1}, Ll/r9t;->g(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;Ll/smc0;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p0, v0, p1}, Ll/r9t;->h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;Ll/smc0;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    return-void
.end method

.method public final g(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;Ll/smc0;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;->setMsgId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getMsgTypeName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;->setMsgTypeName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {}, Ll/pzi0;->o()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;->setRecvTimestamp(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Ack;

    .line 38
    .line 39
    invoke-static {p1}, Ll/qq60;->a(Lcom/google/protobuf/q;)Lcom/google/protobuf/Any;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setData(Lcom/google/protobuf/Any;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 52
    .line 53
    invoke-static {p0}, Ll/b10;->h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)Ll/b10;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a(Ll/smc0;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;Ll/smc0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getStatus()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status;->getNeedAck()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setIsResponse(Z)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "live.client.msg.ack"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setMsgTypeName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status;->newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/16 v0, 0xc8

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status$Builder;->setStatus(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {}, Ll/pzi0;->o()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status$Builder;->setRecvTs(J)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setStatus(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Status;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 59
    .line 60
    invoke-static {p0}, Ll/rct;->h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)Ll/rct;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a(Ll/smc0;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method
