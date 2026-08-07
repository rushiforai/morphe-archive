.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApplyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApplyOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->s()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

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

.method public synthetic constructor <init>(Ll/c4w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAuctionId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGuestUserId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearHostUserId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearState()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAuctionId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getAuctionId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAuctionIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getAuctionIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGuestUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getGuestUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGuestUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getGuestUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHostUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getHostUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHostUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getHostUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getState()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$ApplyState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getState()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$ApplyState;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStateValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->getStateValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setAuctionId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAuctionIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGuestUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGuestUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHostUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHostUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setState(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$ApplyState;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$ApplyState;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStateValue(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionGuestApply;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
