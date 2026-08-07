.class public Ll/b10;
.super Ll/rme0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rme0;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)Ll/b10;
    .locals 1

    .line 1
    new-instance v0, Ll/b10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b10;-><init>(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;)V

    .line 4
    .line 5
    .line 6
    return-object v0
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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;->getData()Lcom/google/protobuf/Any;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/google/protobuf/a;->toByteArray()[B

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Ll/yc60;->d([B)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
