.class public Ll/nvj;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public final e:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/bjs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/nvj;->g:Ljava/util/LinkedList;

    .line 17
    .line 18
    iput-object p1, p0, Ll/nvj;->e:Ll/bjs;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->id:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->id:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic s(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/jjs;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 10
    .line 11
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-ne p0, v1, :cond_3

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isScrapGift()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 29
    .line 30
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 31
    .line 32
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 33
    .line 34
    iput-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 37
    .line 38
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 43
    .line 44
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasActionRule()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 55
    .line 56
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 57
    .line 58
    :cond_2
    invoke-virtual {p2, v2}, Ll/jjs;->v(Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_4

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isDiscountCard()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 77
    .line 78
    new-instance v1, Ll/ivj;

    .line 79
    .line 80
    invoke-direct {v1}, Ll/ivj;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 88
    .line 89
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_4

    .line 98
    .line 99
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 100
    .line 101
    new-instance p1, Ll/kvj;

    .line 102
    .line 103
    invoke-direct {p1, v0}, Ll/kvj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p0, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 111
    .line 112
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 113
    .line 114
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 115
    .line 116
    invoke-virtual {p2, v2}, Ll/jjs;->v(Z)V

    .line 117
    .line 118
    .line 119
    :cond_4
    return-void
.end method

.method public static synthetic t(Ll/hzj;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzj;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p3}, Ll/l0k;->g(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/nvj;->g:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {p0, p3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hzj;

    .line 8
    .line 9
    iget-object v1, p0, Ll/nvj;->g:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/hzj;->g(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Ll/nvj;->g:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Ll/nvj;->e:Ll/bjs;

    .line 31
    .line 32
    invoke-virtual {v0, v1, p0}, Ll/hzj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;Ll/bjs;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    return-object v1
.end method

.method public u(I)Ll/hzj;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/hzj;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public v(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public w(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/nvj;->f:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Ll/evj;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/evj;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/jyb;->w(Ljava/util/List;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/gvj;

    .line 22
    .line 23
    invoke-direct {v0, p1, p2}, Ll/gvj;-><init>(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
