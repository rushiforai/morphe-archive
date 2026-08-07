.class public final Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEventOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;",
        "Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEventOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;->d()Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/z2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearFanbaseId()Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;->a(Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getFanbaseId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;->getFanbaseId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getFanbaseIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;->getFanbaseIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setFanbaseId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;->b(Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFanbaseIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;->c(Lcom/p1/mobile/longlink/msg/live_fanbase/LongLinkLiveFanbaseMessage$RedPacketEvent;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
