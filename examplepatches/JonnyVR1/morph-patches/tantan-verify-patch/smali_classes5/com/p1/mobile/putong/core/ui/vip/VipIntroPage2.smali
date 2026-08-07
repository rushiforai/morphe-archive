.class public Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroid/view/ViewStub;

.field public c:Landroid/view/ViewStub;

.field public d:Landroid/view/ViewStub;

.field public e:Landroid/view/ViewStub;

.field public f:Landroid/view/ViewStub;

.field public g:Landroid/view/ViewStub;

.field public h:Landroid/view/ViewStub;

.field public i:Landroid/view/ViewStub;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Z

.field public m:Z

.field public n:F

.field public o:Ll/a690;


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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 9
    .line 10
    invoke-static {}, Ll/vnb;->p1()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

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
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 32
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 33
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 36
    invoke-static {}, Ll/vnb;->p1()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-eqz p1, :cond_0

    const p1, 0x3f333333    # 0.7f

    goto :goto_0

    :cond_0
    const p1, 0x3f666666    # 0.9f

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qql0;->a(Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/a690;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->o:Ll/a690;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/high16 v0, 0x41600000    # 14.0f

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/high16 v0, 0x41800000    # 16.0f

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 45
    .line 46
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 50
    .line 51
    mul-float/2addr v1, v2

    .line 52
    float-to-int v1, v1

    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 55
    .line 56
    .line 57
    :cond_2
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-lez v0, :cond_6

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->b:Landroid/view/ViewStub;

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    sget v0, Ll/fdc0;->a0:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VDraweeView;

    .line 76
    .line 77
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 78
    .line 79
    if-nez v1, :cond_3

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 82
    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 90
    .line 91
    int-to-float v2, v2

    .line 92
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 93
    .line 94
    mul-float/2addr v2, v3

    .line 95
    float-to-int v2, v2

    .line 96
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 103
    .line 104
    int-to-float v2, v2

    .line 105
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 106
    .line 107
    mul-float/2addr v2, v3

    .line 108
    float-to-int v2, v2

    .line 109
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->b:Landroid/view/ViewStub;

    .line 112
    .line 113
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 118
    .line 119
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 120
    .line 121
    int-to-float v2, v2

    .line 122
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 123
    .line 124
    mul-float/2addr v2, v3

    .line 125
    float-to-int v2, v2

    .line 126
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 127
    .line 128
    :cond_4
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    invoke-virtual {v1, v0, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->e(Ll/a690;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->f(Ll/a690;)V

    .line 142
    .line 143
    .line 144
    :cond_6
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->c(Ll/a690;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public final c(Ll/a690;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->k:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 16
    .line 17
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 21
    .line 22
    mul-float/2addr v1, v2

    .line 23
    float-to-int v1, v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->k:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->k:Lv/VText;

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    const/high16 v1, 0x41300000    # 11.0f

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/high16 v1, 0x41400000    # 12.0f

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->k:Lv/VText;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->k:Lv/VText;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final d()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->h:Landroid/view/ViewStub;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/fdc0;->e0:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lv/AutoVDraweeView;

    .line 14
    .line 15
    sget v1, Ll/fdc0;->W:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lv/AutoVDraweeView;

    .line 22
    .line 23
    sget v2, Ll/fdc0;->P:I

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/FrameLayout;

    .line 30
    .line 31
    sget v3, Ll/fdc0;->q0:I

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Landroid/widget/LinearLayout;

    .line 38
    .line 39
    sget v4, Ll/fdc0;->S0:I

    .line 40
    .line 41
    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Landroid/widget/TextView;

    .line 46
    .line 47
    sget v5, Ll/fdc0;->U0:I

    .line 48
    .line 49
    invoke-virtual {p0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    check-cast v5, Landroid/widget/TextView;

    .line 54
    .line 55
    sget v6, Ll/fdc0;->T0:I

    .line 56
    .line 57
    invoke-virtual {p0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    check-cast v6, Landroid/widget/TextView;

    .line 62
    .line 63
    sget v7, Ll/fdc0;->V0:I

    .line 64
    .line 65
    invoke-virtual {p0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    check-cast v7, Landroid/widget/TextView;

    .line 70
    .line 71
    iget-boolean v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 72
    .line 73
    if-nez v8, :cond_0

    .line 74
    .line 75
    iget-boolean v9, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 76
    .line 77
    if-eqz v9, :cond_3

    .line 78
    .line 79
    :cond_0
    const/high16 v9, 0x41400000    # 12.0f

    .line 80
    .line 81
    if-eqz v8, :cond_1

    .line 82
    .line 83
    move v8, v9

    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const/high16 v8, 0x41500000    # 13.0f

    .line 86
    .line 87
    :goto_0
    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 88
    .line 89
    .line 90
    iget-boolean v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 91
    .line 92
    if-eqz v8, :cond_2

    .line 93
    .line 94
    const/high16 v9, 0x41300000    # 11.0f

    .line 95
    .line 96
    :cond_2
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 97
    .line 98
    .line 99
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 100
    .line 101
    invoke-static {v4, v8}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 102
    .line 103
    .line 104
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 105
    .line 106
    invoke-static {v6, v8}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 107
    .line 108
    .line 109
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 110
    .line 111
    invoke-static {v5, v8}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 112
    .line 113
    .line 114
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 115
    .line 116
    invoke-static {v7, v8}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 117
    .line 118
    .line 119
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->h:Landroid/view/ViewStub;

    .line 120
    .line 121
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    iget v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 126
    .line 127
    int-to-float v9, v9

    .line 128
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 129
    .line 130
    mul-float/2addr v9, v10

    .line 131
    float-to-int v9, v9

    .line 132
    iput v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 133
    .line 134
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->h:Landroid/view/ViewStub;

    .line 135
    .line 136
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    check-cast v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 141
    .line 142
    iget v9, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 143
    .line 144
    int-to-float v9, v9

    .line 145
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 146
    .line 147
    mul-float/2addr v9, v10

    .line 148
    float-to-int v9, v9

    .line 149
    iput v9, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 152
    .line 153
    .line 154
    move-result-object v8

    .line 155
    iget v9, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 156
    .line 157
    int-to-float v9, v9

    .line 158
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 159
    .line 160
    mul-float/2addr v9, v10

    .line 161
    float-to-int v9, v9

    .line 162
    iput v9, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    iget v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 169
    .line 170
    int-to-float v9, v9

    .line 171
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 172
    .line 173
    mul-float/2addr v9, v10

    .line 174
    float-to-int v9, v9

    .line 175
    iput v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 176
    .line 177
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 178
    .line 179
    .line 180
    move-result-object v8

    .line 181
    iget v9, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 182
    .line 183
    int-to-float v9, v9

    .line 184
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 185
    .line 186
    mul-float/2addr v9, v10

    .line 187
    float-to-int v9, v9

    .line 188
    iput v9, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 189
    .line 190
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    iget v8, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 195
    .line 196
    int-to-float v8, v8

    .line 197
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 198
    .line 199
    mul-float/2addr v8, v9

    .line 200
    float-to-int v8, v8

    .line 201
    iput v8, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 202
    .line 203
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 208
    .line 209
    iget v8, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 210
    .line 211
    int-to-float v8, v8

    .line 212
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 213
    .line 214
    mul-float/2addr v8, v9

    .line 215
    float-to-int v8, v8

    .line 216
    iput v8, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 217
    .line 218
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 223
    .line 224
    iget v8, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 225
    .line 226
    int-to-float v8, v8

    .line 227
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 228
    .line 229
    mul-float/2addr v8, v9

    .line 230
    float-to-int v8, v8

    .line 231
    iput v8, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 232
    .line 233
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 238
    .line 239
    iget v8, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 240
    .line 241
    int-to-float v8, v8

    .line 242
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 243
    .line 244
    mul-float/2addr v8, v9

    .line 245
    float-to-int v8, v8

    .line 246
    iput v8, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 247
    .line 248
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 253
    .line 254
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 255
    .line 256
    int-to-float v3, v3

    .line 257
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 258
    .line 259
    mul-float/2addr v3, v8

    .line 260
    float-to-int v3, v3

    .line 261
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 262
    .line 263
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 268
    .line 269
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 270
    .line 271
    int-to-float v3, v3

    .line 272
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 273
    .line 274
    mul-float/2addr v3, v8

    .line 275
    float-to-int v3, v3

    .line 276
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 277
    .line 278
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 283
    .line 284
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 285
    .line 286
    int-to-float v3, v3

    .line 287
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 288
    .line 289
    mul-float/2addr v3, v8

    .line 290
    float-to-int v3, v3

    .line 291
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 292
    .line 293
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 298
    .line 299
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 300
    .line 301
    int-to-float v3, v3

    .line 302
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 303
    .line 304
    mul-float/2addr v3, v8

    .line 305
    float-to-int v3, v3

    .line 306
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 307
    .line 308
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 313
    .line 314
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 315
    .line 316
    int-to-float v3, v3

    .line 317
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 318
    .line 319
    mul-float/2addr v3, p0

    .line 320
    float-to-int p0, v3

    .line 321
    iput p0, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 322
    .line 323
    :cond_3
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result p0

    .line 331
    if-eqz p0, :cond_5

    .line 332
    .line 333
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    invoke-static {p0}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-eqz p0, :cond_4

    .line 342
    .line 343
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 348
    .line 349
    .line 350
    move-result-object p0

    .line 351
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 352
    .line 353
    new-instance v2, Ll/bkq;

    .line 354
    .line 355
    const/4 v3, 0x4

    .line 356
    const/16 v8, 0xf

    .line 357
    .line 358
    invoke-direct {v2, v3, v8}, Ll/bkq;-><init>(II)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v0, p0, v2}, Lv/AutoVDraweeView;->y(Ljava/lang/String;Ll/fm80;)V

    .line 362
    .line 363
    .line 364
    goto :goto_1

    .line 365
    :cond_4
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 370
    .line 371
    .line 372
    move-result-object p0

    .line 373
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 374
    .line 375
    invoke-virtual {v0, p0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    goto :goto_1

    .line 379
    :cond_5
    invoke-static {}, Ll/c17;->u0()Z

    .line 380
    .line 381
    .line 382
    move-result p0

    .line 383
    if-eqz p0, :cond_6

    .line 384
    .line 385
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 386
    .line 387
    sget v2, Ll/jbc0;->Vb:I

    .line 388
    .line 389
    invoke-virtual {p0, v0, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 390
    .line 391
    .line 392
    goto :goto_1

    .line 393
    :cond_6
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 394
    .line 395
    sget v2, Ll/jbc0;->wc:I

    .line 396
    .line 397
    invoke-virtual {p0, v0, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 398
    .line 399
    .line 400
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 401
    .line 402
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 403
    .line 404
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    const/4 v0, 0x0

    .line 409
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 414
    .line 415
    invoke-virtual {v1, p0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 419
    .line 420
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 421
    .line 422
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 427
    .line 428
    .line 429
    move-result p0

    .line 430
    const-string v0, "\u9047\u89c1\u4f60\u5f88\u5f00\u5fc3"

    .line 431
    .line 432
    if-eqz p0, :cond_7

    .line 433
    .line 434
    const-string p0, "\u76f8\u4fe1\u661f\u5ea7\u4e48\uff1f"

    .line 435
    .line 436
    invoke-virtual {v6, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    .line 438
    .line 439
    const-string p0, "\u4f1a\u505a\u996d\u4e48\uff1f"

    .line 440
    .line 441
    invoke-virtual {v7, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 442
    .line 443
    .line 444
    const-string p0, "\u559c\u6b22\u732b\u4e48\uff1f"

    .line 445
    .line 446
    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 447
    .line 448
    .line 449
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 450
    .line 451
    .line 452
    return-void

    .line 453
    :cond_7
    const-string p0, "\u4f60\u771f\u53ef\u7231"

    .line 454
    .line 455
    invoke-virtual {v6, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 456
    .line 457
    .line 458
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 459
    .line 460
    .line 461
    const-string p0, "\u597d\u559c\u6b22\u4f60~"

    .line 462
    .line 463
    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 464
    .line 465
    .line 466
    const-string p0, "\u4f60\u7684\u773c\u775b\u771f\u597d\u770b"

    .line 467
    .line 468
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 469
    .line 470
    .line 471
    return-void
.end method

.method public final e(Ll/a690;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    .line 7
    .line 8
    if-eqz v2, :cond_3

    .line 9
    .line 10
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/high16 v0, 0x41600000    # 14.0f

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/high16 v0, 0x41700000    # 15.0f

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 29
    .line 30
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 31
    .line 32
    int-to-float v2, v2

    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    .line 34
    .line 35
    mul-float/2addr v2, v3

    .line 36
    float-to-int v2, v2

    .line 37
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 46
    .line 47
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    .line 48
    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    const/high16 v2, 0x41800000    # 16.0f

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const/high16 v2, 0x41880000    # 17.0f

    .line 55
    .line 56
    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 71
    .line 72
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->j:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2$a;->a:[I

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    aget v0, v0, v1

    .line 98
    .line 99
    if-eq v0, v2, :cond_7

    .line 100
    .line 101
    const/4 v1, 0x2

    .line 102
    if-eq v0, v1, :cond_5

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 127
    .line 128
    if-nez v0, :cond_6

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 135
    .line 136
    const/4 v0, 0x5

    .line 137
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, p1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_6
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 164
    .line 165
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-nez p1, :cond_9

    .line 174
    .line 175
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_8

    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->p9:I

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_9
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a:Lv/VText;

    .line 207
    .line 208
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r9:I

    .line 213
    .line 214
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public final f(Ll/a690;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2$a;->a:[I

    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_b

    .line 2
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->d()V

    return-void

    .line 3
    :pswitch_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->i:Landroid/view/ViewStub;

    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    move-result-object p1

    .line 5
    sget v0, Ll/fdc0;->Z:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VImage;

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    if-ne p1, v1, :cond_0

    .line 7
    sget p1, Ll/jbc0;->dc:I

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_2

    .line 8
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    if-ne p1, v1, :cond_1

    .line 9
    sget p1, Ll/jbc0;->gc:I

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_2

    .line 10
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    if-ne p1, v1, :cond_3

    .line 11
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 12
    sget p1, Ll/jbc0;->B8:I

    goto :goto_0

    .line 13
    :cond_2
    sget p1, Ll/jbc0;->A8:I

    .line 14
    :goto_0
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_2

    .line 15
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    if-ne p1, v1, :cond_5

    .line 16
    invoke-static {}, Ll/c17;->u0()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 17
    sget p1, Ll/jbc0;->ic:I

    goto :goto_1

    .line 18
    :cond_4
    sget p1, Ll/jbc0;->hc:I

    .line 19
    :goto_1
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 20
    :cond_5
    :goto_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-nez p1, :cond_6

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    if-eqz p1, :cond_13

    .line 21
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->i:Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->i:Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float v0, v0

    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, p0

    float-to-int p0, v0

    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    return-void

    .line 25
    :pswitch_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->g:Landroid/view/ViewStub;

    .line 26
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    sget v0, Ll/fdc0;->s:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 28
    sget v3, Ll/fdc0;->i1:I

    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lv/VImage;

    .line 29
    sget v4, Ll/fdc0;->g:I

    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lv/AutoVDraweeView;

    .line 30
    sget v5, Ll/fdc0;->i:I

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lv/AutoVDraweeView;

    .line 31
    invoke-static {}, Ll/rbb0;->n()Lcom/p1/mobile/putong/data/User;

    move-result-object v6

    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 32
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    invoke-static {}, Ll/c17;->u0()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 36
    sget v2, Ll/jbc0;->zc:I

    goto :goto_3

    .line 37
    :cond_7
    sget v2, Ll/jbc0;->yc:I

    .line 38
    :goto_3
    invoke-virtual {v1, v4, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 39
    invoke-static {}, Ll/rbb0;->n()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v1

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    invoke-virtual {v5, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    goto :goto_5

    .line 40
    :cond_8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    invoke-static {}, Ll/c17;->u0()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 43
    sget v1, Ll/jbc0;->Gc:I

    goto :goto_4

    .line 44
    :cond_9
    sget v1, Ll/jbc0;->Dc:I

    .line 45
    :goto_4
    invoke-virtual {v3, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    :goto_5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-nez v1, :cond_a

    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    if-eqz v1, :cond_13

    .line 47
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v2, v2

    iget v6, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v6

    float-to-int v2, v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 50
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 51
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 52
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 54
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 55
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 56
    sget p1, Ll/fdc0;->Z:I

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lv/VImage;

    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v2, v2

    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v2, v2

    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 59
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 60
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 63
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    invoke-static {v4, p1}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 64
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    invoke-static {v5, p0}, Ll/bnl0;->u0(Landroid/view/View;F)V

    return-void

    .line 65
    :pswitch_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->f:Landroid/view/ViewStub;

    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-nez p1, :cond_b

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    if-eqz p1, :cond_13

    .line 67
    :cond_b
    sget p1, Ll/fdc0;->Z:I

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lv/VImage;

    .line 68
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->f:Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float v0, v0

    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, p0

    float-to-int p0, v0

    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    return-void

    .line 71
    :pswitch_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->e:Landroid/view/ViewStub;

    .line 72
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    sget v0, Ll/fdc0;->s:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 74
    sget v3, Ll/fdc0;->i1:I

    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lv/VImage;

    .line 75
    sget v4, Ll/fdc0;->g:I

    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lv/AutoVDraweeView;

    .line 76
    sget v5, Ll/fdc0;->i:I

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lv/AutoVDraweeView;

    .line 77
    sget v6, Ll/fdc0;->Z:I

    invoke-virtual {p0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VImage;

    .line 78
    invoke-static {}, Ll/rbb0;->m()Lcom/p1/mobile/putong/data/User;

    move-result-object v7

    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 79
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    invoke-static {}, Ll/rbb0;->m()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v1

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    invoke-virtual {v4, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 82
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 83
    invoke-static {}, Ll/c17;->u0()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 84
    sget v2, Ll/jbc0;->zc:I

    goto :goto_6

    .line 85
    :cond_c
    sget v2, Ll/jbc0;->yc:I

    .line 86
    :goto_6
    invoke-virtual {v1, v5, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    goto :goto_8

    .line 87
    :cond_d
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    invoke-static {}, Ll/c17;->u0()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 90
    sget v1, Ll/jbc0;->Cc:I

    goto :goto_7

    .line 91
    :cond_e
    sget v1, Ll/jbc0;->Ac:I

    .line 92
    :goto_7
    invoke-virtual {v3, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 93
    :goto_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-nez v1, :cond_f

    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    if-eqz v1, :cond_13

    .line 94
    :cond_f
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float v2, v2

    iget v7, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v7

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 95
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v1, v1

    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 96
    invoke-static {v0, v2}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 97
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 98
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 99
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 100
    invoke-static {v4, v1}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 101
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 102
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 103
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 104
    invoke-static {v5, v1}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 105
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 106
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 107
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 108
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v0, v0

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 109
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, p0

    float-to-int p0, v0

    iput p0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void

    .line 110
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->d:Landroid/view/ViewStub;

    .line 111
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    sget v0, Ll/fdc0;->g:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/AutoVDraweeView;

    .line 113
    sget v1, Ll/fdc0;->i:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lv/AutoVDraweeView;

    .line 114
    sget v2, Ll/fdc0;->Z:I

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 115
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v3

    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 116
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 117
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    .line 118
    invoke-static {v3}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 119
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v3

    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    new-instance v4, Ll/bkq;

    const/4 v5, 0x4

    const/16 v6, 0xf

    invoke-direct {v4, v5, v6}, Ll/bkq;-><init>(II)V

    .line 120
    invoke-virtual {v1, v3, v4}, Lv/AutoVDraweeView;->y(Ljava/lang/String;Ll/fm80;)V

    goto :goto_a

    .line 121
    :cond_10
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v3

    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    goto :goto_a

    .line 122
    :cond_11
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 123
    invoke-static {}, Ll/c17;->u0()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 124
    sget v4, Ll/jbc0;->xc:I

    goto :goto_9

    .line 125
    :cond_12
    sget v4, Ll/jbc0;->wc:I

    .line 126
    :goto_9
    invoke-virtual {v3, v1, v4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 127
    :goto_a
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-nez v3, :cond_14

    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    if-eqz v3, :cond_13

    goto :goto_c

    :cond_13
    :goto_b
    return-void

    .line 128
    :cond_14
    :goto_c
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v4, v4

    iget v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 129
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 130
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 131
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 132
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 133
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 134
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 135
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 136
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 137
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v3, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 138
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 139
    invoke-static {v0, v3}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 140
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    invoke-static {v1, p1}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 141
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    move-result-object p1

    check-cast p1, Ll/wlj;

    invoke-virtual {p1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object p1

    .line 142
    invoke-virtual {p1}, Lcom/facebook/drawee/generic/RoundingParams;->e()F

    move-result v2

    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v2, v3

    invoke-virtual {p1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->q(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 143
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    move-result-object v0

    check-cast v0, Ll/wlj;

    invoke-virtual {v0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 144
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    move-result-object p1

    check-cast p1, Ll/wlj;

    invoke-virtual {p1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object p1

    .line 145
    invoke-virtual {p1}, Lcom/facebook/drawee/generic/RoundingParams;->e()F

    move-result v0

    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v0, p0

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/RoundingParams;->q(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 146
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    move-result-object p0

    check-cast p0, Ll/wlj;

    invoke-virtual {p0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    return-void

    .line 147
    :pswitch_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->c:Landroid/view/ViewStub;

    .line 148
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    sget v0, Ll/fdc0;->d:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/AutoVDraweeView;

    .line 150
    sget v2, Ll/fdc0;->l1:I

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lv/VText;

    .line 151
    sget v3, Ll/fdc0;->Z:I

    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lv/VImage;

    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v4

    invoke-virtual {v4}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    move-result-object v4

    invoke-interface {v4}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->ul()I

    move-result v4

    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 153
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v5

    invoke-virtual {v5}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    move-result-object v5

    invoke-interface {v5}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->cc()I

    move-result v5

    .line 154
    invoke-static {v4, v5}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 155
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v6

    .line 156
    invoke-virtual {v4, v1, v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    const/4 v1, 0x0

    .line 157
    invoke-virtual {v2, v1, v1, v4, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 158
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->l:Z

    if-nez v1, :cond_15

    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->m:Z

    if-eqz v4, :cond_17

    :cond_15
    if-eqz v1, :cond_16

    const/high16 v1, 0x41600000    # 14.0f

    goto :goto_d

    :cond_16
    const/high16 v1, 0x41800000    # 16.0f

    .line 159
    :goto_d
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 160
    sget v1, Ll/fdc0;->b1:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 161
    sget v4, Ll/fdc0;->f:I

    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    .line 162
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v6, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v6, v6

    iget v7, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v6, v7

    float-to-int v6, v6

    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 163
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v5, v5

    iget v6, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 164
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 165
    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v5, v5

    iget v6, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 166
    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v5, v5

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 167
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 169
    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v5, v5

    iget v6, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 170
    iget v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v5, v5

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 171
    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    invoke-static {v4, v1}, Ll/bnl0;->u0(Landroid/view/View;F)V

    .line 173
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v4, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v4, v4

    iget v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 174
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v3, v3

    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 175
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    move-result-object v1

    check-cast v1, Ll/wlj;

    invoke-virtual {v1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v1

    const/high16 v3, 0x40000000    # 2.0f

    .line 176
    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Lcom/facebook/drawee/generic/RoundingParams;->q(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 177
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    move-result-object v3

    check-cast v3, Ll/wlj;

    invoke-virtual {v3, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 178
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    int-to-float v1, v1

    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->n:F

    mul-float/2addr v1, p0

    float-to-int p0, v1

    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 179
    :cond_17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipIntroPage2;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
