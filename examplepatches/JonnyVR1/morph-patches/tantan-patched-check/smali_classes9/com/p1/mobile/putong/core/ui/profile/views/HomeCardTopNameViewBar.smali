.class public Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VLinear_FillerMeasure;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public f:Lv/VImage;

.field public g:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/kec0;->X0:I

    .line 9
    .line 10
    const/4 p3, 0x0

    .line 11
    invoke-static {p1, p2, p3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->g:Landroid/view/View;

    .line 16
    .line 17
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    const/high16 p3, 0x42300000    # 44.0f

    .line 20
    .line 21
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    const/4 v0, -0x1

    .line 26
    invoke-direct {p2, v0, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->g:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->g:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->c(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->d(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f8l;->a(Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "diamond"

    .line 14
    .line 15
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "platinum"

    .line 14
    .line 15
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final f(Lv/VText;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->f:Lv/VImage;

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
    const/4 v1, 0x1

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 45
    .line 46
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->o0()V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 55
    .line 56
    new-instance v0, Ll/d8l;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/d8l;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPlatinum()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 72
    .line 73
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->l0()V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->e:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 82
    .line 83
    new-instance v0, Ll/e8l;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/e8l;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->f:Lv/VImage;

    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->f:Lv/VImage;

    .line 110
    .line 111
    const/4 v5, 0x1

    .line 112
    const/4 v6, 0x0

    .line 113
    move-object v3, p1

    .line 114
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->o7(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->f:Lv/VImage;

    .line 118
    .line 119
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const/4 v0, -0x2

    .line 124
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->f:Lv/VImage;

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->c:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->f(Lv/VText;Lcom/p1/mobile/putong/data/User;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->g(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/User;)V
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->d:Lv/VImage;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/HomeCardTopNameViewBar;->d:Lv/VImage;

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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
