.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->i()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

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

.method public synthetic constructor <init>(Ll/c3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearApply()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTemplateData()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getApply()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->getApply()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasApply()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->hasApply()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasTemplateData()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->hasTemplateData()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeApply(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeTemplateData(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setApply(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo$Builder;)V

    return-object p0
.end method

.method public setApply(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveMaskModeFollowApplyInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTemplateData(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-object p0
.end method

.method public setTemplateData(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
