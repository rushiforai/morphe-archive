.class public final Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfigOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->i()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

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

.method public synthetic constructor <init>(Ll/x2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearBackgroundPictureConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTopFrameConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->b(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getBackgroundPictureConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->getBackgroundPictureConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTopFrameConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->getTopFrameConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasBackgroundPictureConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->hasBackgroundPictureConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasTopFrameConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->hasTopFrameConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->c(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeTopFrameConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->d(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->e(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;)V

    return-object p0
.end method

.method public setBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->f(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTopFrameConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->g(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;)V

    return-object p0
.end method

.method public setTopFrameConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->h(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
