.class public abstract Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;
.source "SourceFile"


# instance fields
.field public p:Landroid/view/View;

.field public q:Ljava/lang/String;

.field public r:Z

.field public s:I

.field public t:I


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->s:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->t:I

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->N(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->M(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public J()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->q:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->q:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public K(Landroid/view/View;)Ljava/lang/String;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->getBlankTip()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->m()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public L()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic M(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/high16 v0, 0x437f0000    # 255.0f

    .line 18
    .line 19
    mul-float/2addr p1, v0

    .line 20
    float-to-int p1, p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic N(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->q:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public O()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->g:Landroid/view/View;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/16 v1, 0x9

    .line 20
    .line 21
    new-array v1, v1, [F

    .line 22
    .line 23
    fill-array-data v1, :array_0

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-wide/16 v2, 0xfa0

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/rgf;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/rgf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c$a;

    .line 44
    .line 45
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Landroid/view/animation/LinearInterpolator;

    .line 52
    .line 53
    invoke-direct {p0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3e99999a    # 0.3f
        0x0
        0x3e99999a    # 0.3f
        0x0
        0x3e99999a    # 0.3f
        0x0
        0x3e99999a    # 0.3f
        0x0
    .end array-data
.end method

.method public P(IILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gtz p2, :cond_0

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->r:Z

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    if-ge p1, p2, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->r:Z

    .line 11
    .line 12
    :goto_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView$a;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView$a;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->B(Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 19
    .line 20
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->s:I

    .line 21
    .line 22
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->t:I

    .line 23
    .line 24
    :cond_0
    const-string p0, "\u6dfb\u52a0"

    .line 25
    .line 26
    invoke-virtual {p1, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->s:I

    .line 31
    .line 32
    add-int/2addr v0, v1

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->s:I

    .line 34
    .line 35
    const/4 p0, 0x2

    .line 36
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public R(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->q:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->q:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->K(Landroid/view/View;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void

    .line 33
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "\u586b\u5199"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, ", \u63d0\u5347\u8d44\u6599\u5b8c\u6574\u5ea6"

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/zvk;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v1}, Ll/t3m;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-direct {v0, v1}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Ll/t3m;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget v1, Ll/c9c0;->A:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    filled-new-array {v0}, [I

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p1, v0}, Ll/zvk;->e([I)Ll/zvk;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const/4 v0, 0x1

    .line 96
    invoke-virtual {p1, v0}, Ll/zvk;->k(Z)Ll/zvk;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    sget v0, Ll/qa00;->i:I

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/zvk;->p(I)Ll/zvk;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    const/16 v1, 0xd

    .line 107
    .line 108
    invoke-virtual {p1, v1}, Ll/zvk;->t(I)Ll/zvk;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const/4 v1, 0x0

    .line 113
    invoke-virtual {p1, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1, v0, v0, v0, v0}, Ll/zvk;->s(IIII)Ll/zvk;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    sget v0, Ll/zvk;->D:I

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ll/zvk;->i(I)Ll/zvk;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    new-instance v0, Ll/qgf;

    .line 128
    .line 129
    invoke-direct {v0, p0}, Ll/qgf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    const-wide/16 v0, 0xbb8

    .line 137
    .line 138
    invoke-virtual {p1, v0, v1}, Ll/zvk;->a(J)Ll/zvk;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->p:Landroid/view/View;

    .line 147
    .line 148
    invoke-virtual {v0, p1, v1}, Ll/fwk;->t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->q:Ljava/lang/String;

    .line 153
    .line 154
    return-void
.end method
