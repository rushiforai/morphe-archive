.class public Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/AutoVDraweeView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/view/ViewStub;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vnb;->q1()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    .line 9
    .line 10
    invoke-static {}, Ll/vnb;->p1()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->n:Z

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const p1, 0x3f333333    # 0.7f

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const p1, 0x3f666666    # 0.9f

    .line 25
    .line 26
    .line 27
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    .line 32
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->n:Z

    .line 33
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    .line 36
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->n:Z

    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ojj;->a(Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 2
    .line 3
    const/high16 v1, 0x41500000    # 13.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 15
    .line 16
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 20
    .line 21
    mul-float/2addr v1, v2

    .line 22
    float-to-int v1, v1

    .line 23
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 37
    .line 38
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 39
    .line 40
    int-to-float v1, v1

    .line 41
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 42
    .line 43
    mul-float/2addr v1, v2

    .line 44
    float-to-int v1, v1

    .line 45
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 59
    .line 60
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 61
    .line 62
    int-to-float v1, v1

    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 64
    .line 65
    mul-float/2addr v1, v2

    .line 66
    float-to-int v1, v1

    .line 67
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 68
    .line 69
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 70
    .line 71
    int-to-float v1, v1

    .line 72
    mul-float/2addr v1, v2

    .line 73
    float-to-int v1, v1

    .line 74
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 88
    .line 89
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 90
    .line 91
    int-to-float v1, v1

    .line 92
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 93
    .line 94
    mul-float/2addr v1, v2

    .line 95
    float-to-int v1, v1

    .line 96
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 97
    .line 98
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 99
    .line 100
    int-to-float v1, v1

    .line 101
    mul-float/2addr v1, v2

    .line 102
    float-to-int v1, v1

    .line 103
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->j:Lv/VText;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 117
    .line 118
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 119
    .line 120
    int-to-float v1, v1

    .line 121
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 122
    .line 123
    mul-float/2addr v1, v2

    .line 124
    float-to-int v1, v1

    .line 125
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->j:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 133
    .line 134
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 139
    .line 140
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 141
    .line 142
    int-to-float v1, v1

    .line 143
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->o:F

    .line 144
    .line 145
    mul-float/2addr v1, v2

    .line 146
    float-to-int v1, v1

    .line 147
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Ll/a690;ZII)V
    .locals 5

    .line 1
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->m:Z

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->n:Z

    .line 6
    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->b()V

    .line 10
    .line 11
    .line 12
    :cond_1
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    sget-object p4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 17
    .line 18
    const/16 p5, 0x11

    .line 19
    .line 20
    const/4 v0, -0x2

    .line 21
    const/4 v1, -0x1

    .line 22
    const/4 v2, 0x1

    .line 23
    const/16 v3, 0x8

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-ne p3, p4, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget p3, Ll/rec0;->K0:I

    .line 42
    .line 43
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    invoke-virtual {p1, p3, p4, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;->b()V

    .line 52
    .line 53
    .line 54
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 55
    .line 56
    invoke-direct {p3, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 57
    .line 58
    .line 59
    iput p5, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 60
    .line 61
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 62
    .line 63
    invoke-virtual {p4, p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_2
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    sget-object p4, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 73
    .line 74
    if-ne p3, p4, :cond_3

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    sget p3, Ll/rec0;->O0:I

    .line 90
    .line 91
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 92
    .line 93
    invoke-virtual {p1, p3, p4, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSeeLetterView;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSeeLetterView;->b()V

    .line 100
    .line 101
    .line 102
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 103
    .line 104
    invoke-direct {p3, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 105
    .line 106
    .line 107
    iput p5, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 108
    .line 109
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 110
    .line 111
    invoke-virtual {p4, p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    goto/16 :goto_2

    .line 115
    .line 116
    :cond_3
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    if-nez p3, :cond_4

    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 127
    .line 128
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 132
    .line 133
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 142
    .line 143
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 147
    .line 148
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    invoke-virtual {p1, p3, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 153
    .line 154
    .line 155
    goto/16 :goto_2

    .line 156
    .line 157
    :cond_4
    invoke-virtual {p2}, Ll/a690;->f()I

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    if-eqz p3, :cond_6

    .line 162
    .line 163
    invoke-virtual {p2}, Ll/a690;->e()I

    .line 164
    .line 165
    .line 166
    move-result p3

    .line 167
    if-eqz p3, :cond_6

    .line 168
    .line 169
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 170
    .line 171
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 172
    .line 173
    .line 174
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 175
    .line 176
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 177
    .line 178
    .line 179
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 180
    .line 181
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 182
    .line 183
    .line 184
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 185
    .line 186
    invoke-virtual {p2}, Ll/a690;->f()I

    .line 187
    .line 188
    .line 189
    move-result p4

    .line 190
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 191
    .line 192
    .line 193
    move-result p4

    .line 194
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 195
    .line 196
    .line 197
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 198
    .line 199
    invoke-virtual {p2}, Ll/a690;->e()I

    .line 200
    .line 201
    .line 202
    move-result p4

    .line 203
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 204
    .line 205
    .line 206
    move-result p4

    .line 207
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 211
    .line 212
    .line 213
    move-result p3

    .line 214
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 215
    .line 216
    if-eqz p3, :cond_5

    .line 217
    .line 218
    invoke-virtual {p4, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 219
    .line 220
    .line 221
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 222
    .line 223
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 224
    .line 225
    .line 226
    move-result p4

    .line 227
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 232
    .line 233
    .line 234
    goto/16 :goto_2

    .line 235
    .line 236
    :cond_5
    invoke-virtual {p4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 237
    .line 238
    .line 239
    goto/16 :goto_2

    .line 240
    .line 241
    :cond_6
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 242
    .line 243
    .line 244
    move-result p3

    .line 245
    if-eqz p3, :cond_a

    .line 246
    .line 247
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 248
    .line 249
    .line 250
    move-result p3

    .line 251
    sget p4, Ll/jbc0;->fc:I

    .line 252
    .line 253
    if-eq p3, p4, :cond_8

    .line 254
    .line 255
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 256
    .line 257
    .line 258
    move-result p3

    .line 259
    sget p4, Ll/jbc0;->Yb:I

    .line 260
    .line 261
    if-ne p3, p4, :cond_7

    .line 262
    .line 263
    goto :goto_0

    .line 264
    :cond_7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 265
    .line 266
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 267
    .line 268
    .line 269
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 270
    .line 271
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 272
    .line 273
    .line 274
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 275
    .line 276
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 277
    .line 278
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 279
    .line 280
    .line 281
    move-result p5

    .line 282
    invoke-virtual {p3, p4, p5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 283
    .line 284
    .line 285
    goto :goto_1

    .line 286
    :cond_8
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 287
    .line 288
    const/high16 p4, 0x41000000    # 8.0f

    .line 289
    .line 290
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 291
    .line 292
    .line 293
    move-result p5

    .line 294
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 295
    .line 296
    .line 297
    move-result p4

    .line 298
    invoke-virtual {p3, v4, p5, v4, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 299
    .line 300
    .line 301
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 302
    .line 303
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 304
    .line 305
    .line 306
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 307
    .line 308
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 309
    .line 310
    .line 311
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 312
    .line 313
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->d:Lv/AutoVDraweeView;

    .line 314
    .line 315
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 316
    .line 317
    .line 318
    move-result p5

    .line 319
    invoke-virtual {p3, p4, p5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 320
    .line 321
    .line 322
    :goto_1
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 323
    .line 324
    .line 325
    move-result p3

    .line 326
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 327
    .line 328
    if-eqz p3, :cond_9

    .line 329
    .line 330
    invoke-virtual {p4, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 331
    .line 332
    .line 333
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->g:Landroid/widget/ImageView;

    .line 334
    .line 335
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 336
    .line 337
    .line 338
    move-result p4

    .line 339
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 344
    .line 345
    .line 346
    goto :goto_2

    .line 347
    :cond_9
    invoke-virtual {p4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 348
    .line 349
    .line 350
    goto :goto_2

    .line 351
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 352
    .line 353
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 354
    .line 355
    .line 356
    :goto_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->l:Z

    .line 357
    .line 358
    if-eqz p1, :cond_b

    .line 359
    .line 360
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->j:Lv/VText;

    .line 361
    .line 362
    const p3, -0x173576

    .line 363
    .line 364
    .line 365
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 366
    .line 367
    .line 368
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 369
    .line 370
    const p3, 0x66e8ca8a

    .line 371
    .line 372
    .line 373
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 374
    .line 375
    .line 376
    :cond_b
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 381
    .line 382
    if-ne p1, p3, :cond_c

    .line 383
    .line 384
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 393
    .line 394
    .line 395
    move-result p1

    .line 396
    if-nez p1, :cond_c

    .line 397
    .line 398
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 399
    .line 400
    .line 401
    move-result-object p1

    .line 402
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 403
    .line 404
    const/4 p4, 0x5

    .line 405
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 406
    .line 407
    .line 408
    move-result-object p4

    .line 409
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object p4

    .line 413
    invoke-virtual {p1, p3, p4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    goto :goto_3

    .line 418
    :cond_c
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 419
    .line 420
    .line 421
    move-result-object p1

    .line 422
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    :goto_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 427
    .line 428
    .line 429
    move-result p3

    .line 430
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->j:Lv/VText;

    .line 431
    .line 432
    if-nez p3, :cond_d

    .line 433
    .line 434
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 435
    .line 436
    .line 437
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->j:Lv/VText;

    .line 438
    .line 439
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 440
    .line 441
    .line 442
    goto :goto_4

    .line 443
    :cond_d
    invoke-virtual {p4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 444
    .line 445
    .line 446
    :goto_4
    invoke-virtual {p2}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 451
    .line 452
    .line 453
    move-result p3

    .line 454
    if-nez p3, :cond_e

    .line 455
    .line 456
    invoke-virtual {p2}, Ll/a690;->s()Z

    .line 457
    .line 458
    .line 459
    move-result p3

    .line 460
    if-eqz p3, :cond_e

    .line 461
    .line 462
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 463
    .line 464
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    .line 466
    .line 467
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 468
    .line 469
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 470
    .line 471
    .line 472
    goto :goto_5

    .line 473
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->k:Lv/VText;

    .line 474
    .line 475
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 476
    .line 477
    .line 478
    :goto_5
    invoke-virtual {p2}, Ll/a690;->i()I

    .line 479
    .line 480
    .line 481
    move-result p1

    .line 482
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->e:Lv/VImage;

    .line 483
    .line 484
    if-eqz p1, :cond_f

    .line 485
    .line 486
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 487
    .line 488
    .line 489
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->e:Lv/VImage;

    .line 490
    .line 491
    invoke-virtual {p2}, Ll/a690;->i()I

    .line 492
    .line 493
    .line 494
    move-result p3

    .line 495
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 496
    .line 497
    .line 498
    goto :goto_6

    .line 499
    :cond_f
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 500
    .line 501
    .line 502
    :goto_6
    invoke-virtual {p2}, Ll/a690;->m()I

    .line 503
    .line 504
    .line 505
    move-result p1

    .line 506
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->i:Landroid/widget/ImageView;

    .line 507
    .line 508
    if-eqz p1, :cond_10

    .line 509
    .line 510
    invoke-virtual {p3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 511
    .line 512
    .line 513
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->i:Landroid/widget/ImageView;

    .line 514
    .line 515
    invoke-virtual {p2}, Ll/a690;->m()I

    .line 516
    .line 517
    .line 518
    move-result p3

    .line 519
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 520
    .line 521
    .line 522
    goto :goto_7

    .line 523
    :cond_10
    invoke-virtual {p3, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 524
    .line 525
    .line 526
    :goto_7
    invoke-virtual {p2}, Ll/a690;->a()Ljava/util/List;

    .line 527
    .line 528
    .line 529
    move-result-object p1

    .line 530
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 531
    .line 532
    .line 533
    move-result p3

    .line 534
    if-nez p3, :cond_12

    .line 535
    .line 536
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 537
    .line 538
    .line 539
    move-result p3

    .line 540
    const/4 p4, 0x3

    .line 541
    if-ne p3, p4, :cond_12

    .line 542
    .line 543
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->h:Landroid/view/ViewStub;

    .line 544
    .line 545
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 546
    .line 547
    .line 548
    sget p3, Ll/fdc0;->W0:I

    .line 549
    .line 550
    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 551
    .line 552
    .line 553
    move-result-object p3

    .line 554
    check-cast p3, Lv/AutoVDraweeView;

    .line 555
    .line 556
    sget p5, Ll/fdc0;->X0:I

    .line 557
    .line 558
    invoke-virtual {p0, p5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 559
    .line 560
    .line 561
    move-result-object p5

    .line 562
    check-cast p5, Lv/VDraweeView;

    .line 563
    .line 564
    sget v0, Ll/fdc0;->Y0:I

    .line 565
    .line 566
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 567
    .line 568
    .line 569
    move-result-object v0

    .line 570
    check-cast v0, Lv/VDraweeView;

    .line 571
    .line 572
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    check-cast v1, Ljava/lang/String;

    .line 577
    .line 578
    invoke-virtual {p3, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 582
    .line 583
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object v1

    .line 587
    check-cast v1, Ljava/lang/String;

    .line 588
    .line 589
    const/16 v2, 0x12

    .line 590
    .line 591
    invoke-virtual {p3, p5, v1, p4, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 592
    .line 593
    .line 594
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 595
    .line 596
    const/4 v1, 0x2

    .line 597
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 598
    .line 599
    .line 600
    move-result-object p1

    .line 601
    check-cast p1, Ljava/lang/String;

    .line 602
    .line 603
    invoke-virtual {p3, v0, p1, p4, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 604
    .line 605
    .line 606
    const-string p1, "#9affffff"

    .line 607
    .line 608
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 609
    .line 610
    .line 611
    move-result p1

    .line 612
    invoke-virtual {p5}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 613
    .line 614
    .line 615
    move-result-object p3

    .line 616
    check-cast p3, Ll/wlj;

    .line 617
    .line 618
    invoke-virtual {p3}, Ll/wlj;->b()Landroid/graphics/drawable/Drawable;

    .line 619
    .line 620
    .line 621
    move-result-object p3

    .line 622
    sget-object p4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 623
    .line 624
    invoke-virtual {p3, p1, p4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 625
    .line 626
    .line 627
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 628
    .line 629
    .line 630
    move-result-object p3

    .line 631
    check-cast p3, Ll/wlj;

    .line 632
    .line 633
    invoke-virtual {p3}, Ll/wlj;->b()Landroid/graphics/drawable/Drawable;

    .line 634
    .line 635
    .line 636
    move-result-object p3

    .line 637
    invoke-virtual {p3, p1, p4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 638
    .line 639
    .line 640
    invoke-virtual {p2}, Ll/a690;->h()I

    .line 641
    .line 642
    .line 643
    move-result p1

    .line 644
    if-eqz p1, :cond_11

    .line 645
    .line 646
    sget p2, Ll/fdc0;->X:I

    .line 647
    .line 648
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 649
    .line 650
    .line 651
    move-result-object p2

    .line 652
    check-cast p2, Lv/VImage;

    .line 653
    .line 654
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 655
    .line 656
    .line 657
    goto :goto_8

    .line 658
    :cond_11
    sget p1, Ll/fdc0;->X:I

    .line 659
    .line 660
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 661
    .line 662
    .line 663
    move-result-object p1

    .line 664
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 665
    .line 666
    .line 667
    :goto_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 668
    .line 669
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 670
    .line 671
    .line 672
    :cond_12
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ll/a690;ZIILcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 6

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-ne p6, p3, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p3, 0x0

    .line 8
    :goto_0
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->l:Z

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    const/4 v5, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    move-object v0, p0

    .line 14
    move-object v1, p1

    .line 15
    move-object v2, p2

    .line 16
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->c(Lcom/p1/mobile/android/app/Act;Ll/a690;ZII)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/GPVipIntroPage;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
