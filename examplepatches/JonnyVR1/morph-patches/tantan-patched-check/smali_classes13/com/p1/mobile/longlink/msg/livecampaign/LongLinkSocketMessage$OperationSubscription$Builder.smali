.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscriptionOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscriptionOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->j()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

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

.method public synthetic constructor <init>(Ll/v3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearData()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSubscribeType()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUpdateType()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getData()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDataBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getDataBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSubscribeType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getSubscribeType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSubscribeTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getSubscribeTypeBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdateType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getUpdateType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdateTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getUpdateTypeBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setData(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDataBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSubscribeType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSubscribeTypeBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdateType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdateTypeBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
