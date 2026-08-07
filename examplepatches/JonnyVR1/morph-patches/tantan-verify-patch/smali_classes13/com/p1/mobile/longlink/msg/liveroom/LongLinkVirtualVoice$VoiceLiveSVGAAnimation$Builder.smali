.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimationOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimationOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->p()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

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

.method public synthetic constructor <init>(Ll/b4w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllAnimationExtras(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAnimationExtras(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;)V

    return-object p0
.end method

.method public addAnimationExtras(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V

    return-object p0
.end method

.method public addAnimationExtras(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;)V

    return-object p0
.end method

.method public addAnimationExtras(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnimationExtras()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSvgaUrl()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAnimationExtras(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getAnimationExtras(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnimationExtrasCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getAnimationExtrasCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getAnimationExtrasList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getAnimationExtrasList()Ljava/util/List;

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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getRoomId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSvgaUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getSvgaUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSvgaUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->getSvgaUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeAnimationExtras(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnimationExtras(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;)V

    return-object p0
.end method

.method public setAnimationExtras(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSvgaUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSvgaUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSVGAAnimation;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
