.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->s()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

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

.method public synthetic constructor <init>(Ll/s1w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllGifts(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V

    return-object p0
.end method

.method public addGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V

    return-object p0
.end method

.method public addGifts(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V

    return-object p0
.end method

.method public addGifts(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGifts()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearScheme()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSubTitle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTitle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getGifts(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getGifts(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGiftsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getGiftsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGiftsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getGiftsList()Ljava/util/List;

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

.method public getScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getScheme()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSchemeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSchemeBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSubTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSubTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSubTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSubTitleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getTitleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeGifts(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V

    return-object p0
.end method

.method public setGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setScheme(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSchemeBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSubTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSubTitleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
