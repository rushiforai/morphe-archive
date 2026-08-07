.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecordOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MysteryBoxRecord"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecordOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

.field public static final ICONURL_FIELD_NUMBER:I = 0x2

.field public static final NUM_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final REWARDS_FIELD_NUMBER:I = 0x4

.field public static final TEMPLATE_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private iconUrl_:Ljava/lang/String;

.field private num_:J

.field private rewards_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;",
            ">;"
        }
    .end annotation
.end field

.field private template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->addAllRewards(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllRewards(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRewards(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addRewards(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->addRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->addRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    return-void
.end method

.method private clearIconUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getIconUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearNum()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRewards()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearTemplate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->addRewards(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->addRewards(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    return-void
.end method

.method private ensureRewardsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->clearIconUrl()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->clearNum()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->clearRewards()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->clearTemplate()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->removeRewards(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setIconUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setIconUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setNum(J)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method private removeRewards(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    return-object v0
.end method

.method private setIconUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconUrlBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setNum(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setRewards(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->ensureRewardsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_a

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_8

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_7

    .line 69
    .line 70
    const/16 v3, 0x18

    .line 71
    .line 72
    if-eq p1, v3, :cond_6

    .line 73
    .line 74
    const/16 v3, 0x22

    .line 75
    .line 76
    if-eq p1, v3, :cond_4

    .line 77
    .line 78
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_2

    .line 83
    .line 84
    :cond_3
    move v0, v2

    .line 85
    goto :goto_3

    .line 86
    :catch_0
    move-exception v0

    .line 87
    move-object p1, v0

    .line 88
    goto :goto_5

    .line 89
    :catch_1
    move-exception v0

    .line 90
    move-object p1, v0

    .line 91
    goto :goto_6

    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 93
    .line 94
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_5

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 107
    .line 108
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;->parser()Ll/ng60;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    .line 119
    .line 120
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 125
    .line 126
    .line 127
    move-result-wide v3

    .line 128
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 139
    .line 140
    if-eqz p1, :cond_9

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_9
    move-object p1, v1

    .line 150
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->parser()Ll/ng60;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    check-cast v3, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 159
    .line 160
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 161
    .line 162
    if-eqz p1, :cond_2

    .line 163
    .line 164
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 172
    .line 173
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :catchall_1
    move-exception v0

    .line 177
    move-object p0, v0

    .line 178
    throw p0

    .line 179
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    return-object v1

    .line 196
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    return-object v1

    .line 204
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 205
    .line 206
    return-object p0

    .line 207
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 208
    .line 209
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 212
    .line 213
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 214
    .line 215
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 222
    .line 223
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    xor-int/2addr p1, v2

    .line 230
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 231
    .line 232
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    xor-int/2addr v3, v2

    .line 239
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 240
    .line 241
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 246
    .line 247
    move p1, v2

    .line 248
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 249
    .line 250
    const-wide/16 v4, 0x0

    .line 251
    .line 252
    cmp-long v1, v2, v4

    .line 253
    .line 254
    if-eqz v1, :cond_b

    .line 255
    .line 256
    move v1, p1

    .line 257
    :goto_7
    move-wide v7, v4

    .line 258
    goto :goto_8

    .line 259
    :cond_b
    move v1, v0

    .line 260
    goto :goto_7

    .line 261
    :goto_8
    iget-wide v5, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 262
    .line 263
    cmp-long v4, v5, v7

    .line 264
    .line 265
    if-eqz v4, :cond_c

    .line 266
    .line 267
    move v4, p1

    .line 268
    :goto_9
    move-object v0, p2

    .line 269
    goto :goto_a

    .line 270
    :cond_c
    move v4, v0

    .line 271
    goto :goto_9

    .line 272
    :goto_a
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 273
    .line 274
    .line 275
    move-result-wide p1

    .line 276
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 277
    .line 278
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 279
    .line 280
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 281
    .line 282
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 287
    .line 288
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 289
    .line 290
    if-ne v0, p1, :cond_d

    .line 291
    .line 292
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->bitField0_:I

    .line 293
    .line 294
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->bitField0_:I

    .line 295
    .line 296
    or-int/2addr p1, p2

    .line 297
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->bitField0_:I

    .line 298
    .line 299
    :cond_d
    return-object p0

    .line 300
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;

    .line 301
    .line 302
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord$Builder;-><init>(Ll/v3w;)V

    .line 303
    .line 304
    .line 305
    return-object p0

    .line 306
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 307
    .line 308
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 309
    .line 310
    .line 311
    return-object v1

    .line 312
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 313
    .line 314
    return-object p0

    .line 315
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 316
    .line 317
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;-><init>()V

    .line 318
    .line 319
    .line 320
    return-object p0

    .line 321
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getNum()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRewards(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRewardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRewardsOrBuilder(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRewardOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRewardOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRewardsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRewardOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v1

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getIconUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    add-int/2addr v0, v2

    .line 41
    :cond_2
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 42
    .line 43
    const-wide/16 v4, 0x0

    .line 44
    .line 45
    cmp-long v4, v2, v4

    .line 46
    .line 47
    if-eqz v4, :cond_3

    .line 48
    .line 49
    const/4 v4, 0x3

    .line 50
    invoke-static {v4, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v0, v2

    .line 55
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-ge v1, v2, :cond_4

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 64
    .line 65
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Lcom/google/protobuf/q;

    .line 70
    .line 71
    const/4 v3, 0x4

    .line 72
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    add-int/2addr v0, v2

    .line 77
    add-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 81
    .line 82
    return v0
.end method

.method public getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->iconUrl_:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getIconUrl()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->num_:J

    .line 30
    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    cmp-long v2, v0, v2

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 39
    .line 40
    .line 41
    :cond_2
    const/4 v0, 0x0

    .line 42
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 43
    .line 44
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-ge v0, v1, :cond_3

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->rewards_:Lcom/google/protobuf/l$h;

    .line 51
    .line 52
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/google/protobuf/q;

    .line 57
    .line 58
    const/4 v2, 0x4

    .line 59
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    return-void
.end method
