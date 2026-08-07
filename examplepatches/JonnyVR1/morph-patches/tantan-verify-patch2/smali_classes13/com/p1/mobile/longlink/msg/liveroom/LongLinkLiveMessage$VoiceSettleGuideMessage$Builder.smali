.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->n()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public synthetic constructor <init>(Ll/c3w;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllAvatars(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Ljava/lang/Iterable;)V

    return-object p0
.end method

.method public addAllTags(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Ljava/lang/Iterable;)V

    return-object p0
.end method

.method public addAvatars(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Ljava/lang/String;)V

    return-object p0
.end method

.method public addAvatarsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Lcom/google/protobuf/ByteString;)V

    return-object p0
.end method

.method public addTags(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Ljava/lang/String;)V

    return-object p0
.end method

.method public addTagsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Lcom/google/protobuf/ByteString;)V

    return-object p0
.end method

.method public clearAvatars()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;)V

    return-object p0
.end method

.method public clearTags()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;)V

    return-object p0
.end method

.method public clearTitle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;)V

    return-object p0
.end method

.method public getAvatars(I)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getAvatars(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getAvatarsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getAvatarsBytes(I)Lcom/google/protobuf/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public getAvatarsCount()I
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getAvatarsCount()I

    move-result p0

    return p0
.end method

.method public getAvatarsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getAvatarsList()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getTags(I)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getTags(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getTagsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getTagsBytes(I)Lcom/google/protobuf/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public getTagsCount()I
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getTagsCount()I

    move-result p0

    return p0
.end method

.method public getTagsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getTagsList()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->getTitleBytes()Lcom/google/protobuf/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public setAvatars(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;ILjava/lang/String;)V

    return-object p0
.end method

.method public setTags(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;ILjava/lang/String;)V

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Ljava/lang/String;)V

    return-object p0
.end method

.method public setTitleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSettleGuideMessage;Lcom/google/protobuf/ByteString;)V

    return-object p0
.end method
