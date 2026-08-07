.class public final Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->p()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

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

.method public synthetic constructor <init>(Ll/f6r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearFollower()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->a(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSource()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->b(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTemplateData()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->c(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserMask()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->d(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getFollower()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getFollower()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSource()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Source;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getSource()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Source;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSourceValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getSourceValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasFollower()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->hasFollower()Z

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->hasTemplateData()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasUserMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->hasUserMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeFollower(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->e(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeTemplateData(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->f(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->g(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFollower(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->h(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;)V

    return-object p0
.end method

.method public setFollower(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->i(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSource(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Source;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->j(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Source;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceValue(I)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->k(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTemplateData(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->l(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-object p0
.end method

.method public setTemplateData(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->m(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->n(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->o(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
