.class public Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public h:Ll/jjs;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public j:I

.field public k:Z

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->k:Z

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->j0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->k0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->k0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->k0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->e:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;->SMALL:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->f:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;->MIDDLE:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->g:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;->LARGE:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ono;->a(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->getGears()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->combosHitNum:J

    .line 10
    .line 11
    long-to-int v7, v0

    .line 12
    new-instance v2, Ll/jne0;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->h:Ll/jjs;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 17
    .line 18
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->j:I

    .line 19
    .line 20
    move v5, p2

    .line 21
    invoke-direct/range {v2 .. v7}, Ll/jne0;-><init>(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;III)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 25
    .line 26
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;->a(Ll/jne0;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final k0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/nno;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/nno;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->k:Z

    .line 15
    .line 16
    return-void
.end method
