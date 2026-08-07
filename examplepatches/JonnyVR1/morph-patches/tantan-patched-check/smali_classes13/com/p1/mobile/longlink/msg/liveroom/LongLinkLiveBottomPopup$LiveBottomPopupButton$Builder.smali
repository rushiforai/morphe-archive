.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButtonOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButtonOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->H()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

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

.method public synthetic constructor <init>(Ll/u2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllRichText(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-object p0
.end method

.method public addRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    return-object p0
.end method

.method public addRichText(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-object p0
.end method

.method public addRichText(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEndAfterColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEndColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearJumpSchema()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearJumpType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRichText()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStartAfterColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStartColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearText()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTextColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getEndAfterColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndAfterColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndAfterColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndAfterColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpSchemaBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRichText(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getRichText(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRichTextCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getRichTextCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRichTextList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getRichTextList()Ljava/util/List;

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

.method public getStartAfterColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartAfterColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartAfterColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartAfterColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getTextColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getTextColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeRichText(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndAfterColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndAfterColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpSchema(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpTypeValue(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-object p0
.end method

.method public setRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartAfterColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartAfterColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
