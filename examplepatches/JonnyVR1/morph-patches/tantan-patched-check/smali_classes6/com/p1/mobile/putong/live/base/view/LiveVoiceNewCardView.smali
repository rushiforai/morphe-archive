.class public Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;
.super Lcom/p1/mobile/putong/live/base/view/BaseCardView;
.source "SourceFile"


# static fields
.field public static r:[I


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public i:Landroid/widget/TextView;

.field public j:Landroidx/constraintlayout/widget/Placeholder;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VText;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/FrameLayout;

.field public o:Landroid/widget/ViewFlipper;

.field public p:[I

.field public q:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget v0, Ll/mbc0;->b0:I

    .line 2
    .line 3
    sget v1, Ll/mbc0;->c0:I

    .line 4
    .line 5
    sget v2, Ll/mbc0;->d0:I

    .line 6
    .line 7
    sget v3, Ll/mbc0;->e0:I

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->r:[I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/BaseCardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/mbc0;->f0:I

    .line 5
    .line 6
    sget v0, Ll/mbc0;->g0:I

    .line 7
    .line 8
    sget v1, Ll/mbc0;->h0:I

    .line 9
    .line 10
    sget v2, Ll/mbc0;->i0:I

    .line 11
    .line 12
    filled-new-array {p1, v0, v1, v2}, [I

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->p:[I

    .line 17
    .line 18
    sget p1, Ll/mbc0;->k:I

    .line 19
    .line 20
    sget v0, Ll/mbc0;->l:I

    .line 21
    .line 22
    sget v1, Ll/mbc0;->m:I

    .line 23
    .line 24
    sget v2, Ll/mbc0;->n:I

    .line 25
    .line 26
    filled-new-array {p1, v0, v1, v2}, [I

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->q:[I

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/BaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    sget p1, Ll/mbc0;->f0:I

    sget p2, Ll/mbc0;->g0:I

    sget v0, Ll/mbc0;->h0:I

    sget v1, Ll/mbc0;->i0:I

    filled-new-array {p1, p2, v0, v1}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->p:[I

    .line 35
    sget p1, Ll/mbc0;->k:I

    sget p2, Ll/mbc0;->l:I

    sget v0, Ll/mbc0;->m:I

    sget v1, Ll/mbc0;->n:I

    filled-new-array {p1, p2, v0, v1}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->q:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/BaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    sget p1, Ll/mbc0;->f0:I

    sget p2, Ll/mbc0;->g0:I

    sget p3, Ll/mbc0;->h0:I

    sget v0, Ll/mbc0;->i0:I

    filled-new-array {p1, p2, p3, v0}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->p:[I

    .line 38
    sget p1, Ll/mbc0;->k:I

    sget p2, Ll/mbc0;->l:I

    sget p3, Ll/mbc0;->m:I

    sget v0, Ll/mbc0;->n:I

    filled-new-array {p1, p2, p3, v0}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->q:[I

    return-void
.end method

.method private k0()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sget v2, Ll/qa00;->q:I

    .line 12
    .line 13
    sub-int/2addr v1, v2

    .line 14
    int-to-float v1, v1

    .line 15
    const/high16 v2, 0x40000000    # 2.0f

    .line 16
    .line 17
    div-float/2addr v1, v2

    .line 18
    float-to-int v1, v1

    .line 19
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    const v2, 0x3f5c28f6    # 0.86f

    .line 23
    .line 24
    .line 25
    mul-float/2addr v1, v2

    .line 26
    float-to-int v1, v1

    .line 27
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 28
    .line 29
    const/high16 v2, 0x43110000    # 145.0f

    .line 30
    .line 31
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-le v1, v3, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->j:Landroidx/constraintlayout/widget/Placeholder;

    .line 43
    .line 44
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 45
    .line 46
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    sub-int/2addr v0, v2

    .line 51
    const/high16 v2, 0x41c80000    # 25.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    add-int/2addr v0, v2

    .line 58
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;

    .line 62
    .line 63
    const/4 v6, 0x0

    .line 64
    sget v7, Ll/qa00;->h:I

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    const/4 v4, 0x0

    .line 68
    const/4 v5, 0x0

    .line 69
    invoke-static/range {v2 .. v7}, Ll/ynp0;->l(Landroid/view/View;IIIII)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private r()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->i0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->j0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->k0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lbv;->a(Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i0()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_1

    .line 4
    .line 5
    new-instance v1, Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v1, v2}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/xlj;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v2, v3}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ll/xlj;->a()Ll/wlj;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "#ffffff"

    .line 32
    .line 33
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    sget v5, Ll/qa00;->a:I

    .line 38
    .line 39
    int-to-float v5, v5

    .line 40
    invoke-virtual {v3, v4, v5}, Lcom/facebook/drawee/generic/RoundingParams;->o(IF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 50
    .line 51
    const/high16 v3, 0x41c00000    # 24.0f

    .line 52
    .line 53
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    const/high16 v3, 0x40c00000    # 6.0f

    .line 67
    .line 68
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    neg-int v3, v3

    .line 73
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 74
    .line 75
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->k:Landroid/widget/LinearLayout;

    .line 79
    .line 80
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    return-void
.end method

.method public final j0()V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/ViewFlipper;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->o:Landroid/widget/ViewFlipper;

    .line 11
    .line 12
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    sget v1, Ll/bnl0;->e:I

    .line 15
    .line 16
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    const/16 v1, 0x10

    .line 20
    .line 21
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->o:Landroid/widget/ViewFlipper;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->o:Landroid/widget/ViewFlipper;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/b8c0;->a:I

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/content/Context;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->o:Landroid/widget/ViewFlipper;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Ll/b8c0;->b:I

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/content/Context;I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->o:Landroid/widget/ViewFlipper;

    .line 51
    .line 52
    const/16 v1, 0x708

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setFlipInterval(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->n:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->o:Landroid/widget/ViewFlipper;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/LiveVoiceNewCardView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
