.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChangeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->e()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

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

.method public synthetic constructor <init>(Ll/e3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMultiPk()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMultiPk()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->getMultiPk()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasMultiPk()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->hasMultiPk()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeMultiPk(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMultiPk(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk$Builder;)V

    return-object p0
.end method

.method public setMultiPk(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
