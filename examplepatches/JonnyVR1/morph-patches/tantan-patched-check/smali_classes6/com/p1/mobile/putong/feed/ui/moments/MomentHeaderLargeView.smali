.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VLinear_FillerMeasure;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Landroid/widget/FrameLayout;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText_Expandable;

.field public l:Lcom/p1/mobile/putong/feed/data/Moment;

.field public m:Z


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

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->p0(Landroid/widget/TextView;Z)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->n0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->o0(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private synthetic n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->m0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/po00;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k4:I

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->l:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v2, p0}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->l:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/w1e;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0(Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->m0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

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
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 p1, 0x0

    .line 36
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->i:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lv/VDraweeView;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/high16 v2, 0x41e00000    # 28.0f

    .line 55
    .line 56
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    sub-int/2addr v1, v2

    .line 61
    new-instance v2, Landroid/graphics/Point;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 64
    .line 65
    iget v4, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 66
    .line 67
    iget v3, v3, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 68
    .line 69
    invoke-direct {v2, v4, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Ll/dmk0;->b(ILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 77
    .line 78
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {v2, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 92
    .line 93
    invoke-virtual {p1, p0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 94
    .line 95
    .line 96
    const/16 p1, 0x8

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->t0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t0(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->m:Z

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->k:Lv/VText_Expandable;

    .line 4
    .line 5
    new-instance v0, Ll/lo00;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/lo00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->k:Lv/VText_Expandable;

    .line 14
    .line 15
    new-instance v0, Ll/mo00;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/mo00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->k:Lv/VText_Expandable;

    .line 24
    .line 25
    new-instance v0, Ll/no00;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/no00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lv/VText_Expandable;->setOnExpandStateChangeListener(Lv/VText_Expandable$c;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->l:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->k:Lv/VText_Expandable;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 6
    .line 7
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->m:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lv/VText_Expandable;->o(Ljava/lang/CharSequence;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->h:Lv/VText;

    .line 13
    .line 14
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->r0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->i:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->i:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    const/16 p1, 0x8

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->e:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/tq8;->d()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->e:Lv/VText;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/k9c0;->k0:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->e:Lv/VText;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v2, Ll/k9c0;->l0:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->g:Lv/VImage;

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    const/4 v3, 0x0

    .line 67
    invoke-static {v0, p1, v1, v2, v3}, Ll/orb0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->i:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    new-instance v1, Ll/oo00;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/oo00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 87
    .line 88
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->f:Lv/VDraweeView;

    .line 93
    .line 94
    if-nez v0, :cond_1

    .line 95
    .line 96
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->f:Lv/VDraweeView;

    .line 102
    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    sget-object v2, Ll/uqb0;->X:Ll/hj5;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 115
    .line 116
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v2, p1}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, ".png"

    .line 132
    .line 133
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_1
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    return-void
.end method
