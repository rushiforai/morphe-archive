.class public Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;
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

.field public n:F


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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    .line 9
    .line 10
    invoke-static {}, Ll/vnb;->p1()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->m:Z

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

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
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

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

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    .line 32
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->m:Z

    .line 33
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    .line 36
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->m:Z

    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tql0;->a(Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->j:Lv/VText;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/high16 v1, 0x41900000    # 18.0f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/high16 v1, 0x41980000    # 19.0f

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->k:Lv/VText;

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    const/high16 v1, 0x41400000    # 12.0f

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/high16 v1, 0x41500000    # 13.0f

    .line 25
    .line 26
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 36
    .line 37
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 38
    .line 39
    int-to-float v1, v1

    .line 40
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    .line 41
    .line 42
    mul-float/2addr v1, v2

    .line 43
    float-to-int v1, v1

    .line 44
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 58
    .line 59
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 60
    .line 61
    int-to-float v1, v1

    .line 62
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    .line 63
    .line 64
    mul-float/2addr v1, v2

    .line 65
    float-to-int v1, v1

    .line 66
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 80
    .line 81
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 82
    .line 83
    int-to-float v1, v1

    .line 84
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    .line 85
    .line 86
    mul-float/2addr v1, v2

    .line 87
    float-to-int v1, v1

    .line 88
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 89
    .line 90
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 91
    .line 92
    int-to-float v1, v1

    .line 93
    mul-float/2addr v1, v2

    .line 94
    float-to-int v1, v1

    .line 95
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 109
    .line 110
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 111
    .line 112
    int-to-float v1, v1

    .line 113
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    .line 114
    .line 115
    mul-float/2addr v1, v2

    .line 116
    float-to-int v1, v1

    .line 117
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 118
    .line 119
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 120
    .line 121
    int-to-float v1, v1

    .line 122
    mul-float/2addr v1, v2

    .line 123
    float-to-int v1, v1

    .line 124
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 127
    .line 128
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->j:Lv/VText;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 138
    .line 139
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 140
    .line 141
    int-to-float v1, v1

    .line 142
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    .line 143
    .line 144
    mul-float/2addr v1, v2

    .line 145
    float-to-int v1, v1

    .line 146
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->j:Lv/VText;

    .line 149
    .line 150
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->k:Lv/VText;

    .line 154
    .line 155
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 160
    .line 161
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 162
    .line 163
    int-to-float v1, v1

    .line 164
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->n:F

    .line 165
    .line 166
    mul-float/2addr v1, v2

    .line 167
    float-to-int v1, v1

    .line 168
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->k:Lv/VText;

    .line 171
    .line 172
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Ll/a690;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v3, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d(Lcom/p1/mobile/android/app/Act;Ll/a690;ZII)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ll/a690;ZII)V
    .locals 4

    .line 1
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->l:Z

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->m:Z

    .line 6
    .line 7
    if-eqz p3, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->b()V

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
    const/16 v2, 0x8

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    if-ne p3, p4, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget p3, Ll/rec0;->K0:I

    .line 41
    .line 42
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    invoke-virtual {p1, p3, p4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;->b()V

    .line 51
    .line 52
    .line 53
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 54
    .line 55
    invoke-direct {p3, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 56
    .line 57
    .line 58
    iput p5, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 59
    .line 60
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 61
    .line 62
    invoke-virtual {p4, p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :cond_2
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    sget-object p4, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 72
    .line 73
    if-ne p3, p4, :cond_3

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    sget p3, Ll/rec0;->O0:I

    .line 89
    .line 90
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    invoke-virtual {p1, p3, p4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSeeLetterView;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSeeLetterView;->b()V

    .line 99
    .line 100
    .line 101
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 102
    .line 103
    invoke-direct {p3, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 104
    .line 105
    .line 106
    iput p5, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 107
    .line 108
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 109
    .line 110
    invoke-virtual {p4, p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    goto/16 :goto_2

    .line 114
    .line 115
    :cond_3
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    if-nez p3, :cond_4

    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 126
    .line 127
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 131
    .line 132
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 136
    .line 137
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 141
    .line 142
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 146
    .line 147
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    invoke-virtual {p1, p3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto/16 :goto_2

    .line 155
    .line 156
    :cond_4
    invoke-virtual {p2}, Ll/a690;->f()I

    .line 157
    .line 158
    .line 159
    move-result p3

    .line 160
    if-eqz p3, :cond_6

    .line 161
    .line 162
    invoke-virtual {p2}, Ll/a690;->e()I

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    if-eqz p3, :cond_6

    .line 167
    .line 168
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 169
    .line 170
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 171
    .line 172
    .line 173
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 174
    .line 175
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 176
    .line 177
    .line 178
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 179
    .line 180
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 184
    .line 185
    invoke-virtual {p2}, Ll/a690;->f()I

    .line 186
    .line 187
    .line 188
    move-result p4

    .line 189
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 190
    .line 191
    .line 192
    move-result p4

    .line 193
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 194
    .line 195
    .line 196
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 197
    .line 198
    invoke-virtual {p2}, Ll/a690;->e()I

    .line 199
    .line 200
    .line 201
    move-result p4

    .line 202
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 203
    .line 204
    .line 205
    move-result p4

    .line 206
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 214
    .line 215
    if-eqz p3, :cond_5

    .line 216
    .line 217
    invoke-virtual {p4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 218
    .line 219
    .line 220
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 221
    .line 222
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 223
    .line 224
    .line 225
    move-result p4

    .line 226
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_2

    .line 234
    .line 235
    :cond_5
    invoke-virtual {p4, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 236
    .line 237
    .line 238
    goto/16 :goto_2

    .line 239
    .line 240
    :cond_6
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 241
    .line 242
    .line 243
    move-result p3

    .line 244
    if-eqz p3, :cond_a

    .line 245
    .line 246
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 247
    .line 248
    .line 249
    move-result p3

    .line 250
    sget p4, Ll/jbc0;->fc:I

    .line 251
    .line 252
    if-eq p3, p4, :cond_8

    .line 253
    .line 254
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 255
    .line 256
    .line 257
    move-result p3

    .line 258
    sget p4, Ll/jbc0;->Yb:I

    .line 259
    .line 260
    if-ne p3, p4, :cond_7

    .line 261
    .line 262
    goto :goto_0

    .line 263
    :cond_7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 264
    .line 265
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 266
    .line 267
    .line 268
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 269
    .line 270
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 271
    .line 272
    .line 273
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 274
    .line 275
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 276
    .line 277
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 278
    .line 279
    .line 280
    move-result p5

    .line 281
    invoke-virtual {p3, p4, p5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 282
    .line 283
    .line 284
    goto :goto_1

    .line 285
    :cond_8
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 286
    .line 287
    const/high16 p4, 0x41000000    # 8.0f

    .line 288
    .line 289
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 290
    .line 291
    .line 292
    move-result p5

    .line 293
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 294
    .line 295
    .line 296
    move-result p4

    .line 297
    invoke-virtual {p3, v3, p5, v3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 298
    .line 299
    .line 300
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 301
    .line 302
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 303
    .line 304
    .line 305
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 306
    .line 307
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 308
    .line 309
    .line 310
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 311
    .line 312
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->d:Lv/AutoVDraweeView;

    .line 313
    .line 314
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 315
    .line 316
    .line 317
    move-result p5

    .line 318
    invoke-virtual {p3, p4, p5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 319
    .line 320
    .line 321
    :goto_1
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 322
    .line 323
    .line 324
    move-result p3

    .line 325
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 326
    .line 327
    if-eqz p3, :cond_9

    .line 328
    .line 329
    invoke-virtual {p4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 330
    .line 331
    .line 332
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->g:Landroid/widget/ImageView;

    .line 333
    .line 334
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 335
    .line 336
    .line 337
    move-result p4

    .line 338
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 343
    .line 344
    .line 345
    goto :goto_2

    .line 346
    :cond_9
    invoke-virtual {p4, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 347
    .line 348
    .line 349
    goto :goto_2

    .line 350
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 351
    .line 352
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 353
    .line 354
    .line 355
    :goto_2
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 360
    .line 361
    if-ne p1, p3, :cond_b

    .line 362
    .line 363
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    if-nez p1, :cond_b

    .line 376
    .line 377
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 382
    .line 383
    const/4 p4, 0x5

    .line 384
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 385
    .line 386
    .line 387
    move-result-object p4

    .line 388
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object p4

    .line 392
    invoke-virtual {p1, p3, p4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    goto :goto_3

    .line 397
    :cond_b
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    :goto_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 406
    .line 407
    .line 408
    move-result p3

    .line 409
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->j:Lv/VText;

    .line 410
    .line 411
    if-nez p3, :cond_c

    .line 412
    .line 413
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 414
    .line 415
    .line 416
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->j:Lv/VText;

    .line 417
    .line 418
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 419
    .line 420
    .line 421
    goto :goto_4

    .line 422
    :cond_c
    invoke-virtual {p4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 423
    .line 424
    .line 425
    :goto_4
    invoke-virtual {p2}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 430
    .line 431
    .line 432
    move-result p3

    .line 433
    if-nez p3, :cond_d

    .line 434
    .line 435
    invoke-virtual {p2}, Ll/a690;->s()Z

    .line 436
    .line 437
    .line 438
    move-result p3

    .line 439
    if-eqz p3, :cond_d

    .line 440
    .line 441
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->k:Lv/VText;

    .line 442
    .line 443
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 444
    .line 445
    .line 446
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->k:Lv/VText;

    .line 447
    .line 448
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 449
    .line 450
    .line 451
    goto :goto_5

    .line 452
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->k:Lv/VText;

    .line 453
    .line 454
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 455
    .line 456
    .line 457
    :goto_5
    invoke-virtual {p2}, Ll/a690;->i()I

    .line 458
    .line 459
    .line 460
    move-result p1

    .line 461
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->e:Lv/VImage;

    .line 462
    .line 463
    if-eqz p1, :cond_e

    .line 464
    .line 465
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 466
    .line 467
    .line 468
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->e:Lv/VImage;

    .line 469
    .line 470
    invoke-virtual {p2}, Ll/a690;->i()I

    .line 471
    .line 472
    .line 473
    move-result p3

    .line 474
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 475
    .line 476
    .line 477
    goto :goto_6

    .line 478
    :cond_e
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 479
    .line 480
    .line 481
    :goto_6
    invoke-virtual {p2}, Ll/a690;->m()I

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->i:Landroid/widget/ImageView;

    .line 486
    .line 487
    if-eqz p1, :cond_f

    .line 488
    .line 489
    invoke-virtual {p3, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 490
    .line 491
    .line 492
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->i:Landroid/widget/ImageView;

    .line 493
    .line 494
    invoke-virtual {p2}, Ll/a690;->m()I

    .line 495
    .line 496
    .line 497
    move-result p3

    .line 498
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 499
    .line 500
    .line 501
    goto :goto_7

    .line 502
    :cond_f
    invoke-virtual {p3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 503
    .line 504
    .line 505
    :goto_7
    invoke-virtual {p2}, Ll/a690;->a()Ljava/util/List;

    .line 506
    .line 507
    .line 508
    move-result-object p1

    .line 509
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 510
    .line 511
    .line 512
    move-result p3

    .line 513
    if-nez p3, :cond_11

    .line 514
    .line 515
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 516
    .line 517
    .line 518
    move-result p3

    .line 519
    const/4 p4, 0x3

    .line 520
    if-ne p3, p4, :cond_11

    .line 521
    .line 522
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->h:Landroid/view/ViewStub;

    .line 523
    .line 524
    const/4 p5, 0x1

    .line 525
    invoke-static {p3, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 526
    .line 527
    .line 528
    sget p3, Ll/fdc0;->W0:I

    .line 529
    .line 530
    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 531
    .line 532
    .line 533
    move-result-object p3

    .line 534
    check-cast p3, Lv/AutoVDraweeView;

    .line 535
    .line 536
    sget v0, Ll/fdc0;->X0:I

    .line 537
    .line 538
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 539
    .line 540
    .line 541
    move-result-object v0

    .line 542
    check-cast v0, Lv/AutoVDraweeView;

    .line 543
    .line 544
    sget v1, Ll/fdc0;->Y0:I

    .line 545
    .line 546
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    check-cast v1, Lv/AutoVDraweeView;

    .line 551
    .line 552
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 553
    .line 554
    .line 555
    move-result-object v3

    .line 556
    check-cast v3, Ljava/lang/String;

    .line 557
    .line 558
    invoke-virtual {p3, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 559
    .line 560
    .line 561
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 562
    .line 563
    invoke-interface {p1, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 564
    .line 565
    .line 566
    move-result-object p5

    .line 567
    check-cast p5, Ljava/lang/String;

    .line 568
    .line 569
    const/16 v3, 0x12

    .line 570
    .line 571
    invoke-virtual {p3, v0, p5, p4, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 572
    .line 573
    .line 574
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 575
    .line 576
    const/4 p5, 0x2

    .line 577
    invoke-interface {p1, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 578
    .line 579
    .line 580
    move-result-object p1

    .line 581
    check-cast p1, Ljava/lang/String;

    .line 582
    .line 583
    invoke-virtual {p3, v1, p1, p4, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 584
    .line 585
    .line 586
    const-string p1, "#9affffff"

    .line 587
    .line 588
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 589
    .line 590
    .line 591
    move-result p1

    .line 592
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 593
    .line 594
    .line 595
    move-result-object p3

    .line 596
    check-cast p3, Ll/wlj;

    .line 597
    .line 598
    invoke-virtual {p3}, Ll/wlj;->b()Landroid/graphics/drawable/Drawable;

    .line 599
    .line 600
    .line 601
    move-result-object p3

    .line 602
    sget-object p4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 603
    .line 604
    invoke-virtual {p3, p1, p4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 608
    .line 609
    .line 610
    move-result-object p3

    .line 611
    check-cast p3, Ll/wlj;

    .line 612
    .line 613
    invoke-virtual {p3}, Ll/wlj;->b()Landroid/graphics/drawable/Drawable;

    .line 614
    .line 615
    .line 616
    move-result-object p3

    .line 617
    invoke-virtual {p3, p1, p4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 618
    .line 619
    .line 620
    invoke-virtual {p2}, Ll/a690;->h()I

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    if-eqz p1, :cond_10

    .line 625
    .line 626
    sget p2, Ll/fdc0;->X:I

    .line 627
    .line 628
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 629
    .line 630
    .line 631
    move-result-object p2

    .line 632
    check-cast p2, Lv/VImage;

    .line 633
    .line 634
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 635
    .line 636
    .line 637
    goto :goto_8

    .line 638
    :cond_10
    sget p1, Ll/fdc0;->X:I

    .line 639
    .line 640
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 641
    .line 642
    .line 643
    move-result-object p1

    .line 644
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 645
    .line 646
    .line 647
    :goto_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->c:Landroid/widget/FrameLayout;

    .line 648
    .line 649
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 650
    .line 651
    .line 652
    :cond_11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
