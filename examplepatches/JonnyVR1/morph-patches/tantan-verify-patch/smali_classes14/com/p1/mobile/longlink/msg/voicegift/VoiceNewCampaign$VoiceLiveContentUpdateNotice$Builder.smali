.class public final Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;",
        "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNoticeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->s()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

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

.method public synthetic constructor <init>(Ll/cbo0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllLiveCampaigns(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->a(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLiveCampaigns(ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->b(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;)V

    return-object p0
.end method

.method public addLiveCampaigns(ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->c(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V

    return-object p0
.end method

.method public addLiveCampaigns(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->d(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;)V

    return-object p0
.end method

.method public addLiveCampaigns(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->e(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAction()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->f(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveCampaigns()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->g(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPosition()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->h(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->i(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAction()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdateAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getAction()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdateAction;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getActionValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getActionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveCampaignsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getLiveCampaignsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLiveCampaignsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getLiveCampaignsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getPosition()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdatePosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdatePosition;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPositionValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getPositionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->j(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAction(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdateAction;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->k(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdateAction;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setActionValue(I)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->l(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveCampaigns(ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->m(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;)V

    return-object p0
.end method

.method public setLiveCampaigns(ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->n(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;ILcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPosition(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdatePosition;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->o(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLongLinkUpdatePosition;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPositionValue(I)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->p(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->q(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;->r(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveContentUpdateNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
