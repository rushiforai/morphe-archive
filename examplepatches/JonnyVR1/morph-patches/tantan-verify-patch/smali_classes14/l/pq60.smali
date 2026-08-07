.class public Ll/pq60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

.field public b:Lcom/google/protobuf/q;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/q;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 37
    iput-object p2, p0, Ll/pq60;->b:Lcom/google/protobuf/q;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/pq60;->b:Lcom/google/protobuf/q;

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;->setMsgId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;->setType(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p3}, Ll/qq60;->a(Lcom/google/protobuf/q;)Lcom/google/protobuf/Any;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;->setData(Lcom/google/protobuf/Any;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 31
    .line 32
    iput-object p1, p0, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a()Lokio/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/a;->toByteArray()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
