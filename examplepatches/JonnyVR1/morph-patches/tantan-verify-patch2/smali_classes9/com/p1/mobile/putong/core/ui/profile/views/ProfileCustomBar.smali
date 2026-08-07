.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VLinear_FillerMeasure;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public n:Landroid/view/View;

.field public o:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/er90;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(F)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpl-float v1, p1, v0

    .line 10
    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    move p1, v0

    .line 14
    :cond_1
    float-to-double v1, p1

    .line 15
    const-wide v3, 0x3fb999999999999aL    # 0.1

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    cmpg-double v1, v1, v3

    .line 21
    .line 22
    if-gez v1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->e:Lv/VLinear_FillerMeasure;

    .line 25
    .line 26
    const/4 v1, 0x4

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    const v1, 0x3fb33333    # 1.4f

    .line 32
    .line 33
    .line 34
    mul-float/2addr v1, p1

    .line 35
    add-float/2addr p1, v1

    .line 36
    cmpl-float v1, p1, v0

    .line 37
    .line 38
    if-lez v1, :cond_3

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_3
    move v0, p1

    .line 42
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->e:Lv/VLinear_FillerMeasure;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    move p1, v0

    .line 49
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->e:Lv/VLinear_FillerMeasure;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public g(F)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpl-float v1, p1, v0

    .line 10
    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    move p1, v0

    .line 14
    :cond_1
    float-to-double v1, p1

    .line 15
    const-wide v3, 0x3fb999999999999aL    # 0.1

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    cmpg-double v1, v1, v3

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-gez v1, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    const/4 v1, 0x4

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    const v1, 0x3fb33333    # 1.4f

    .line 44
    .line 45
    .line 46
    mul-float/2addr v1, p1

    .line 47
    add-float/2addr p1, v1

    .line 48
    cmpl-float v1, p1, v0

    .line 49
    .line 50
    if-lez v1, :cond_3

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    move v0, p1

    .line 54
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 60
    .line 61
    new-instance v1, Ll/dr90;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/dr90;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    move p1, v0

    .line 70
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->b:Landroid/view/View;

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->n:Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->e:Lv/VLinear_FillerMeasure;

    .line 2
    .line 3
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->j:Lv/VText;

    .line 7
    .line 8
    xor-int/lit8 v1, p3, 0x1

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i(Lv/VText;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->m(Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->j:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i(Lv/VText;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final i(Lv/VText;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVip()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    :cond_1
    return-void

    .line 37
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isODiamond()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v2, 0x1

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->o0()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPlatinum()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 62
    .line 63
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->l0()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 90
    .line 91
    const/4 v6, 0x1

    .line 92
    const/4 v7, 0x0

    .line 93
    move-object v4, p1

    .line 94
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->o7(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const/4 v0, -0x2

    .line 104
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 107
    .line 108
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 112
    .line 113
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->i:Lv/VImage;

    .line 117
    .line 118
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZZ)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZZZ)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->j:Lv/VText;

    .line 5
    .line 6
    const/high16 v1, 0x41a00000    # 20.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->j:Lv/VText;

    .line 16
    .line 17
    const/high16 v1, 0x40000000    # 2.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, p2, p5}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->h(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const/4 p2, 0x0

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    if-nez p3, :cond_1

    .line 37
    .line 38
    if-eqz p4, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->m:Lv/VImage;

    .line 41
    .line 42
    const/4 p3, 0x1

    .line 43
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->m:Lv/VImage;

    .line 48
    .line 49
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l:Lv/VImage;

    .line 53
    .line 54
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->i(Lcom/p1/mobile/putong/data/User;Z)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->g:Lv/VImage;

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    if-eq p1, v2, :cond_0

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->g:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->k:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    sget v1, Ll/qa00;->j:I

    .line 10
    .line 11
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->k:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->k:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->o:Landroid/view/View;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/kec0;->B9:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->o:Landroid/view/View;

    .line 20
    .line 21
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    const/4 v2, -0x1

    .line 24
    const/4 v3, -0x2

    .line 25
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->o:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->o:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->e(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-static {}, Ll/gra;->M3()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->m:Lv/VImage;

    .line 48
    .line 49
    sget v1, Ll/dbc0;->rm:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f:Lv/VText;

    .line 55
    .line 56
    const/high16 v0, -0x1000000

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public setBackCallBack(Ll/x20;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v0, Ll/ar90;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ar90;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setEditCallBack(Ll/x20;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->m:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/br90;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/br90;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMoreCallBack(Ll/x20;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/cr90;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/cr90;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
