.class public Ll/mwr;
.super Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth;-><init>(Ljava/lang/Object;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public g(Ll/eh3;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/yc60;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;->setMsgId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/protobuf/a;->toByteArray()[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Ll/yc60;->d([B)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public j()Ll/yc60;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->h()Ll/yc60;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;

    .line 7
    .line 8
    const-string v0, "auth connect step get ack null"

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method
