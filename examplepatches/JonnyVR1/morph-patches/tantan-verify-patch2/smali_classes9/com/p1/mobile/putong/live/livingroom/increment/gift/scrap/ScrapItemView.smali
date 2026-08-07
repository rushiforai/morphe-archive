.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/view/View;

.field public g:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->k0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->l0()V

    return-void
.end method

.method private synthetic l0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x43040000    # 132.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/high16 v1, 0x42840000    # 66.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qce0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x43040000    # 132.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v0, v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final m0(Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->itemStock:Lcom/p1/mobile/putong/live/base/data/BLiveScrapItemStock;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapItemStock;->count:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->f:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->targetItem:Lcom/p1/mobile/putong/live/base/data/BLiveScrapTargetItem;

    .line 19
    .line 20
    iget-wide v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapTargetItem;->cost:J

    .line 21
    .line 22
    cmp-long v0, v4, v2

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const-wide/16 v4, 0x1

    .line 27
    .line 28
    :cond_1
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->remainCount:J

    .line 29
    .line 30
    div-long/2addr v2, v4

    .line 31
    long-to-int p1, v2

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->f:Landroid/view/View;

    .line 33
    .line 34
    if-gtz p1, :cond_2

    .line 35
    .line 36
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    const/4 p1, 0x1

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final n0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qbe0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/high16 v0, 0x42380000    # 46.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "context_single_room"

    .line 14
    .line 15
    invoke-static {v1, p0, p1, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;Z)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->isRightTabScrap:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/oce0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/oce0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->g:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/n9c0;->W:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance v0, Ll/pce0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/pce0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->g:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/n9c0;->H:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->isRightTabScrap:Z

    .line 53
    .line 54
    if-eqz p2, :cond_2

    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->d:Landroid/view/View;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    sget v0, Ll/obc0;->c6:I

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    sget v0, Ll/obc0;->q2:I

    .line 67
    .line 68
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->d:Landroid/view/View;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    sget v0, Ll/obc0;->u6:I

    .line 77
    .line 78
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    sget v0, Ll/obc0;->n6:I

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    :goto_1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->itemId:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->n0(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->g:Lv/VText;

    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->itemId:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v0}, Ll/qbe0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
