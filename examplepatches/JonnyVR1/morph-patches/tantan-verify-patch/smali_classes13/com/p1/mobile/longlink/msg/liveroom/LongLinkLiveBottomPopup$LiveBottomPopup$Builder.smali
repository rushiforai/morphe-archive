.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->p0()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllDescriptions(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllWindow(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addDescriptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-object p0
.end method

.method public addDescriptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    return-object p0
.end method

.method public addDescriptions(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-object p0
.end method

.method public addDescriptions(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addWindow(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown$Builder;)V

    return-object p0
.end method

.method public addWindow(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)V

    return-object p0
.end method

.method public addWindow(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown$Builder;)V

    return-object p0
.end method

.method public addWindow(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBackgroundColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBlankClose()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearButton()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearContent()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearContentColor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearDescriptions()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearExtra()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearHeader()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIconUrl()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRemainDuration()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRemind()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearShowClose()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSource()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStyleType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTitle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearToast()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWindow()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getBackgroundColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getBackgroundColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getBackgroundColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBlankClose()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getBlankClose()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getButton()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getButton()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getContentBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContentColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getContentColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContentColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getContentColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDescriptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getDescriptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDescriptionsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getDescriptionsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getDescriptionsList()Ljava/util/List;
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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getDescriptionsList()Ljava/util/List;

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

.method public getExtra()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getExtra()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getExtraBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getExtraBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHeader()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getHeader()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getIconUrl()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getIconUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRemainDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getRemainDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getRemind()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getRemind()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getShowClose()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getShowClose()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getSourceBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStyleType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupStyleTypeEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getStyleType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupStyleTypeEnum;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStyleTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getStyleTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getTitle()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getTitleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToast()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getToast()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getTypeBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWindow(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getWindow(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWindowCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getWindowCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getWindowList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->getWindowList()Ljava/util/List;

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

.method public hasButton()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->hasButton()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasHeader()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->hasHeader()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasRemind()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->hasRemind()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasToast()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->hasToast()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeButton(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeHeader(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeRemind(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeToast(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeDescriptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeWindow(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->J(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBlankClose(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setButton(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->L(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;)V

    return-object p0
.end method

.method public setButton(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->M(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setContent(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->N(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setContentBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->O(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setContentColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->P(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setContentColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->Q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDescriptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->R(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-object p0
.end method

.method public setDescriptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->S(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setExtra(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->T(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setExtraBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->U(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHeader(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader$Builder;)V

    return-object p0
.end method

.method public setHeader(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupHeader;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIconUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->X(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIconUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->Y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRemainDuration(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->Z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRemind(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->a0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind$Builder;)V

    return-object p0
.end method

.method public setRemind(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->b0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupRemind;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setShowClose(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->c0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSource(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->d0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->e0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStyleType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupStyleTypeEnum;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->f0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupStyleTypeEnum;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStyleTypeValue(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->g0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->h0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->i0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToast(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->j0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast$Builder;)V

    return-object p0
.end method

.method public setToast(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->k0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupToast;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->l0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->m0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWindow(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->n0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown$Builder;)V

    return-object p0
.end method

.method public setWindow(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;->o0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopup;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
