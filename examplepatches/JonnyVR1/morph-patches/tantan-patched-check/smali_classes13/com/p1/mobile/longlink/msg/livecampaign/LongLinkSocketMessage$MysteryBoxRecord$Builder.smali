.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecordOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecordOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->s()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllRewards(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V

    return-object p0
.end method

.method public addRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    return-object p0
.end method

.method public addRewards(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V

    return-object p0
.end method

.method public addRewards(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIconUrl()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNum()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRewards()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTemplate()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getIconUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIconUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getIconUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNum()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getNum()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getRewards(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getRewards(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRewardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getRewardsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRewardsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getRewardsList()Ljava/util/List;

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

.method public getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->hasTemplate()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeRewards(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIconUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIconUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNum(J)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->n(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->o(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V

    return-object p0
.end method

.method public setRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->p(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->q(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-object p0
.end method

.method public setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->r(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
