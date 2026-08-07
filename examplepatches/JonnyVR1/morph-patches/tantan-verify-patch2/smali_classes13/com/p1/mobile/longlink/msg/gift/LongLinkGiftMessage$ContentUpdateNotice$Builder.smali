.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNoticeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->s()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

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

.method public synthetic constructor <init>(Ll/o2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllLiveCampaigns(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLiveCampaigns(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;)V

    return-object p0
.end method

.method public addLiveCampaigns(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-object p0
.end method

.method public addLiveCampaigns(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;)V

    return-object p0
.end method

.method public addLiveCampaigns(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveCampaigns()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getActionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getLiveCampaignsCount()I

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
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getLiveCampaignsList()Ljava/util/List;

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

.method public getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPositionValue()I

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getRoomId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAction(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setActionValue(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveCampaigns(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;)V

    return-object p0
.end method

.method public setLiveCampaigns(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPosition(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPositionValue(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
