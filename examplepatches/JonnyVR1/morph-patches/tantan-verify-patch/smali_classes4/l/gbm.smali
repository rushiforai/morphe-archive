.class public Ll/gbm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ebm;->a()Ll/ebm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ebm;->d()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/dkb;->sa(Ljava/util/List;)Lrx/c;

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 18
    .line 19
    const-string v0, "ice_break_question_set"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C8(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/kec0;->h4:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-lt p2, p3, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 37
    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 41
    .line 42
    sget-object p3, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IceBreakQuestionOfflineCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 43
    .line 44
    if-eq p0, p3, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;

    .line 48
    .line 49
    check-cast p2, Ljava/util/List;

    .line 50
    .line 51
    new-instance p0, Ll/fbm;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/fbm;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->h(Ljava/util/List;Ll/y20;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 9
    .line 10
    return-object p0
.end method
