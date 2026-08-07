.class public Lcom/p1/mobile/putong/core/ui/home/VirtualCard;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/lql;
.implements Ll/kql;
.implements Ll/pn4;
.implements Ll/jam;
.implements Ll/tql;


# instance fields
.field public a:Ll/sxl0;

.field public b:Lcom/p1/mobile/putong/core/data/VirtualCardType;

.field public c:Landroid/view/View;

.field public d:Landroid/graphics/Paint;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Landroid/graphics/RectF;

.field public l:Landroid/graphics/RectF;

.field public m:Landroid/graphics/Xfermode;

.field public n:F

.field public o:Landroid/graphics/Path;

.field public p:Z

.field public q:F

.field public r:Landroid/animation/ValueAnimator;

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public w:Ll/ik4;

.field public x:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->t:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 20
    .line 21
    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->x:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->G0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    const/4 p2, 0x0

    .line 30
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->t:Z

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    const/4 p1, -0x1

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->x:I

    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->G0()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    const/4 p2, 0x0

    .line 40
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->t:Z

    .line 43
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    const/4 p1, 0x0

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    const/4 p1, -0x1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->x:I

    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->G0()V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)Ll/sxl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    return-object p0
.end method

.method private G0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 9
    .line 10
    const/high16 v1, 0x41000000    # 8.0f

    .line 11
    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->g:I

    .line 17
    .line 18
    const/high16 v2, 0x41200000    # 10.0f

    .line 19
    .line 20
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->h:I

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->i:I

    .line 31
    .line 32
    const/high16 v1, 0x42c40000    # 98.0f

    .line 33
    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->j:I

    .line 39
    .line 40
    new-instance v1, Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 56
    .line 57
    const/high16 v1, -0x10000

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 63
    .line 64
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Landroid/graphics/Path;

    .line 70
    .line 71
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 75
    .line 76
    new-instance v0, Landroid/graphics/RectF;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->k:Landroid/graphics/RectF;

    .line 83
    .line 84
    new-instance v0, Landroid/graphics/RectF;

    .line 85
    .line 86
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->l:Landroid/graphics/RectF;

    .line 90
    .line 91
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 92
    .line 93
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 94
    .line 95
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->m:Landroid/graphics/Xfermode;

    .line 99
    .line 100
    const/high16 v0, 0x41a00000    # 20.0f

    .line 101
    .line 102
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    int-to-float v0, v0

    .line 107
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->n:F

    .line 108
    .line 109
    const/4 v0, 0x0

    .line 110
    const/4 v1, 0x0

    .line 111
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Ll/qxl0;

    .line 115
    .line 116
    invoke-direct {v0}, Ll/qxl0;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    :cond_0
    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    return-void
.end method

.method private X()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 13
    .line 14
    return-void
.end method

.method private c0(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    .line 17
    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s0(Z)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/pn4;->D0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;Z)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_MOVING:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 5
    .line 6
    if-ne p2, p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c0(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_BACK:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 14
    .line 15
    if-eq p2, p1, :cond_3

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->FINISH_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 18
    .line 19
    if-ne p2, p1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;->START_TOUCH:Lcom/p1/mobile/putong/core/newui/home/opt/SwipeState;

    .line 23
    .line 24
    if-ne p2, p1, :cond_2

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    invoke-interface {p0}, Ll/sxl0;->a()V

    .line 31
    .line 32
    .line 33
    :cond_2
    return-void

    .line 34
    :cond_3
    :goto_0
    const/4 p1, 0x0

    .line 35
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c0(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final E0(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x41000000    # 8.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 14
    .line 15
    const/high16 v1, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 28
    .line 29
    const/high16 v0, 0x42c40000    # 98.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 36
    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    sget p1, Ll/dbc0;->g7:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public F0(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/dox;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/dox;->e()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->measure(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    add-int/2addr v2, v3

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    add-int/2addr v3, p1

    .line 38
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public H0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/sxl0;->c(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public I0(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 4
    .line 5
    instance-of v2, v1, Ll/wro;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    check-cast v1, Ll/wro;

    .line 10
    .line 11
    invoke-virtual {v1, p1, p2, p3}, Ll/wro;->k(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 23
    .line 24
    invoke-interface {p0, p1, p2}, Ll/sxl0;->g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move-object p0, v0

    .line 30
    :goto_0
    if-ne p0, v0, :cond_2

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 37
    .line 38
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    const/4 p2, 0x1

    .line 53
    if-ne p1, p2, :cond_2

    .line 54
    .line 55
    new-instance p1, Ll/rxl0;

    .line 56
    .line 57
    invoke-direct {p1}, Ll/rxl0;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-object p0
.end method

.method public J0(Lcom/p1/mobile/putong/core/card/VSwipeCard;ILcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 1

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 4
    .line 5
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c:Landroid/view/View;

    .line 14
    .line 15
    invoke-interface {p4, v0, p2, p3, p1}, Ll/sxl0;->e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 19
    .line 20
    invoke-interface {p2}, Ll/sxl0;->f()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    new-instance p2, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;

    .line 27
    .line 28
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$a;-><init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->P0(Ll/x20;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public K0(ILcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->p:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c0(Z)V

    .line 11
    .line 12
    .line 13
    :goto_0
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 16
    .line 17
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c:Landroid/view/View;

    .line 26
    .line 27
    invoke-interface {p3, v0, p1, p2, p0}, Ll/sxl0;->e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public L0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->t:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    const/4 p4, 0x0

    .line 2
    cmpl-float v0, p1, p4

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    neg-float p2, p1

    .line 8
    :goto_0
    const/high16 p1, -0x40800000    # -1.0f

    .line 9
    .line 10
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/high16 p2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    cmpl-float p2, p3, p4

    .line 21
    .line 22
    const/4 p4, 0x0

    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v0, p4

    .line 28
    :goto_1
    if-nez p2, :cond_2

    .line 29
    .line 30
    move p3, p1

    .line 31
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 32
    .line 33
    instance-of p2, p1, Ll/m2t;

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    check-cast p1, Ll/m2t;

    .line 38
    .line 39
    sget p2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 40
    .line 41
    invoke-virtual {p1, v0, p3, p2, p4}, Ll/m2t;->p(ZFIZ)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 45
    .line 46
    instance-of p2, p1, Ll/b5v;

    .line 47
    .line 48
    if-eqz p2, :cond_4

    .line 49
    .line 50
    check-cast p1, Ll/b5v;

    .line 51
    .line 52
    sget p2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 53
    .line 54
    invoke-virtual {p1, v0, p3, p2, p4}, Ll/b5v;->s(ZFIZ)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 58
    .line 59
    instance-of p1, p0, Ll/d5v;

    .line 60
    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    check-cast p0, Ll/d5v;

    .line 64
    .line 65
    sget p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->G:I

    .line 66
    .line 67
    invoke-virtual {p0, v0, p3, p1, p4}, Ll/d5v;->p(ZFIZ)V

    .line 68
    .line 69
    .line 70
    :cond_5
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->t:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    return-void

    .line 19
    :cond_2
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->t:Z

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 26
    .line 27
    :cond_3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 28
    .line 29
    if-lez v0, :cond_5

    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 32
    .line 33
    if-lez v0, :cond_5

    .line 34
    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    cmpl-float v0, v0, v1

    .line 39
    .line 40
    if-lez v0, :cond_5

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 48
    .line 49
    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 55
    .line 56
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 57
    .line 58
    int-to-float v0, v0

    .line 59
    const/high16 v1, 0x40000000    # 2.0f

    .line 60
    .line 61
    add-float v5, v0, v1

    .line 62
    .line 63
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 64
    .line 65
    int-to-float v0, v0

    .line 66
    add-float v6, v0, v1

    .line 67
    .line 68
    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 69
    .line 70
    const/high16 v3, -0x40000000    # -2.0f

    .line 71
    .line 72
    move v4, v3

    .line 73
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->m:Landroid/graphics/Xfermode;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/gra;->N3()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->l:Landroid/graphics/RectF;

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->g:I

    .line 92
    .line 93
    int-to-float v0, v0

    .line 94
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 95
    .line 96
    mul-float/2addr v0, v2

    .line 97
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->h:I

    .line 98
    .line 99
    int-to-float v3, v3

    .line 100
    mul-float/2addr v3, v2

    .line 101
    const/high16 v2, 0x42300000    # 44.0f

    .line 102
    .line 103
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    int-to-float v2, v2

    .line 108
    add-float/2addr v3, v2

    .line 109
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 110
    .line 111
    int-to-float v2, v2

    .line 112
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->i:I

    .line 113
    .line 114
    int-to-float v4, v4

    .line 115
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 116
    .line 117
    mul-float/2addr v4, v5

    .line 118
    sub-float/2addr v2, v4

    .line 119
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 120
    .line 121
    int-to-float v4, v4

    .line 122
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->j:I

    .line 123
    .line 124
    int-to-float v6, v6

    .line 125
    mul-float/2addr v6, v5

    .line 126
    sub-float/2addr v4, v6

    .line 127
    const/high16 v5, 0x42600000    # 56.0f

    .line 128
    .line 129
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    int-to-float v5, v5

    .line 134
    sub-float/2addr v4, v5

    .line 135
    invoke-virtual {v1, v0, v3, v2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->g:I

    .line 140
    .line 141
    int-to-float v0, v0

    .line 142
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 143
    .line 144
    mul-float/2addr v0, v2

    .line 145
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->h:I

    .line 146
    .line 147
    int-to-float v3, v3

    .line 148
    mul-float/2addr v3, v2

    .line 149
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 150
    .line 151
    int-to-float v4, v4

    .line 152
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->i:I

    .line 153
    .line 154
    int-to-float v5, v5

    .line 155
    mul-float/2addr v5, v2

    .line 156
    sub-float/2addr v4, v5

    .line 157
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 158
    .line 159
    int-to-float v5, v5

    .line 160
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->j:I

    .line 161
    .line 162
    int-to-float v6, v6

    .line 163
    mul-float/2addr v6, v2

    .line 164
    sub-float/2addr v5, v6

    .line 165
    invoke-virtual {v1, v0, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 166
    .line 167
    .line 168
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->l:Landroid/graphics/RectF;

    .line 171
    .line 172
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->n:F

    .line 173
    .line 174
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 175
    .line 176
    mul-float v4, v2, v3

    .line 177
    .line 178
    mul-float/2addr v2, v3

    .line 179
    invoke-virtual {v0, v1, v4, v2, v7}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 183
    .line 184
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->o:Landroid/graphics/Path;

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 190
    .line 191
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->d:Landroid/graphics/Paint;

    .line 195
    .line 196
    const/4 v1, 0x0

    .line 197
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 198
    .line 199
    .line 200
    :cond_5
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->x:I

    .line 201
    .line 202
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->u:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v4, v0

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v5, v0

    .line 19
    const/4 v6, 0x0

    .line 20
    const/16 v7, 0x1f

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x0

    .line 24
    move-object v1, p1

    .line 25
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->x:I

    .line 30
    .line 31
    new-instance p1, Landroid/graphics/PaintFlagsDrawFilter;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    const/4 v2, 0x3

    .line 35
    invoke-direct {p1, v0, v2}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v1, p1

    .line 43
    :goto_0
    invoke-super {p0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public f0(IFFZLjava/lang/String;)V
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    if-lt p1, p3, :cond_0

    .line 5
    .line 6
    const p1, 0x3e99999a    # 0.3f

    .line 7
    .line 8
    .line 9
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public getAdapter()Ll/sxl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCardData()Ll/ik4;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ik4;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ik4;-><init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 11
    .line 12
    new-instance v1, Ll/ik4$a;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ik4$a;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ik4;->h(Ll/ik4$a;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Ll/ik4;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/ik4;->j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/ik4$a;->b()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->w:Ll/ik4;

    .line 43
    .line 44
    return-object p0
.end method

.method public getCardType()Lcom/p1/mobile/putong/core/data/VirtualCardType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->b:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIVirtualCardContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getIVirtualCardUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->v:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/tql;->k(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->X()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/t7m;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/t7m;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 24
    .line 25
    invoke-interface {p1}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 34
    .line 35
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 36
    .line 37
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 42
    .line 43
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 52
    .line 53
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-ne v0, v1, :cond_1

    .line 58
    .line 59
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 60
    .line 61
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eq v0, v1, :cond_2

    .line 66
    .line 67
    :cond_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->e:I

    .line 72
    .line 73
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->f:I

    .line 78
    .line 79
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final s0(Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->s:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    new-array p1, v1, [F

    .line 14
    .line 15
    fill-array-data p1, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    new-array p1, v1, [F

    .line 26
    .line 27
    fill-array-data p1, :array_1

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$b;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard$b;-><init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->q:F

    .line 53
    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    const/high16 p1, 0x3f800000    # 1.0f

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    const/4 p1, 0x0

    .line 60
    :goto_1
    new-array v1, v1, [F

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    aput v2, v1, v3

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    aput p1, v1, v2

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 69
    .line 70
    .line 71
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    const-wide/16 v0, 0x32

    .line 74
    .line 75
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->r:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public setAdapter(Ll/sxl0;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->a:Ll/sxl0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->b:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 18
    .line 19
    invoke-interface {p1, v0, p0, v1}, Ll/sxl0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c:Landroid/view/View;

    .line 24
    .line 25
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/4 v0, -0x1

    .line 28
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->E0(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->c:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setCardType(Lcom/p1/mobile/putong/core/data/VirtualCardType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->b:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    return-void
.end method
