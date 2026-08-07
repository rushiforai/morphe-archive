.class public Ll/ndp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;

.field public c:Landroid/animation/AnimatorSet;

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/ndp;->a:Lv/VFrame;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ndp;->f(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a(Ll/ndp;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ndp;->c:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public static bridge synthetic b(Ll/ndp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ndp;->k()V

    return-void
.end method

.method public static bridge synthetic c(Ll/ndp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ndp;->l(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    const/high16 v1, 0x43480000    # 200.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-direct {v0, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    const/16 v1, 0x11

    .line 42
    .line 43
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 44
    .line 45
    iget-object v1, p0, Ll/ndp;->a:Lv/VFrame;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 48
    .line 49
    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final e(Landroid/view/View;Ljava/lang/Runnable;Z)Landroid/animation/AnimatorSet;
    .locals 10

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const-wide/16 v4, 0x15e

    .line 19
    .line 20
    invoke-virtual {v3, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    new-instance v6, Landroid/view/animation/DecelerateInterpolator;

    .line 24
    .line 25
    const/high16 v7, 0x3fc00000    # 1.5f

    .line 26
    .line 27
    invoke-direct {v6, v7}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    new-array v6, v2, [F

    .line 34
    .line 35
    fill-array-data v6, :array_1

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v1, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-wide/16 v6, 0x96

    .line 43
    .line 44
    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v4, v5}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Landroid/view/animation/OvershootInterpolator;

    .line 51
    .line 52
    const v5, 0x3f99999a    # 1.2f

    .line 53
    .line 54
    .line 55
    invoke-direct {v4, v5}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    const/4 v6, 0x0

    .line 63
    if-eqz p3, :cond_0

    .line 64
    .line 65
    sget-object p3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    neg-int v7, v7

    .line 72
    int-to-float v7, v7

    .line 73
    new-array v8, v2, [F

    .line 74
    .line 75
    const/4 v9, 0x0

    .line 76
    aput v9, v8, v6

    .line 77
    .line 78
    aput v7, v8, v4

    .line 79
    .line 80
    invoke-static {p1, p3, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    const-wide/16 v7, 0x190

    .line 85
    .line 86
    invoke-virtual {p3, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    const-wide/16 v7, 0x1c2

    .line 90
    .line 91
    invoke-virtual {p3, v7, v8}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 92
    .line 93
    .line 94
    new-instance v7, Landroid/view/animation/AccelerateInterpolator;

    .line 95
    .line 96
    invoke-direct {v7, v5}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p3, v7}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 100
    .line 101
    .line 102
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 103
    .line 104
    new-array v7, v2, [F

    .line 105
    .line 106
    fill-array-data v7, :array_2

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v5, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    const-wide/16 v7, 0x12c

    .line 114
    .line 115
    invoke-virtual {v5, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    .line 118
    const-wide/16 v7, 0x226

    .line 119
    .line 120
    invoke-virtual {v5, v7, v8}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 121
    .line 122
    .line 123
    new-instance v7, Landroid/view/animation/AccelerateInterpolator;

    .line 124
    .line 125
    invoke-direct {v7}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v5, v7}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 129
    .line 130
    .line 131
    const/4 v7, 0x4

    .line 132
    new-array v7, v7, [Landroid/animation/Animator;

    .line 133
    .line 134
    aput-object v3, v7, v6

    .line 135
    .line 136
    aput-object v1, v7, v4

    .line 137
    .line 138
    aput-object p3, v7, v2

    .line 139
    .line 140
    const/4 p3, 0x3

    .line 141
    aput-object v5, v7, p3

    .line 142
    .line 143
    invoke-virtual {v0, v7}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_0
    new-array p3, v2, [Landroid/animation/Animator;

    .line 148
    .line 149
    aput-object v3, p3, v6

    .line 150
    .line 151
    aput-object v1, p3, v4

    .line 152
    .line 153
    invoke-virtual {v0, p3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 154
    .line 155
    .line 156
    :goto_0
    new-instance p3, Ll/ndp$a;

    .line 157
    .line 158
    invoke-direct {p3, p0, p1, p2}, Ll/ndp$a;-><init>(Ll/ndp;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, p3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 162
    .line 163
    .line 164
    return-object v0

    .line 165
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f70a3d7    # 0.94f
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_1
    .array-data 4
        0x3f70a3d7    # 0.94f
        0x3f800000    # 1.0f
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final f(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ndp;->c:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ndp;->c:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final h(Landroid/view/View;Ljava/lang/Runnable;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ndp;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    iput-object p1, p0, Ll/ndp;->d:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ndp;->d()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/toh0;->s()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ndp;->j()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1, p2, p3}, Ll/ndp;->e(Landroid/view/View;Ljava/lang/Runnable;Z)Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/ndp;->c:Landroid/animation/AnimatorSet;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public i(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/ndp;->h(Landroid/view/View;Ljava/lang/Runnable;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "https://fe-static.tancdn.com/v1/raw/56792917-eaab-4d90-9ded-39983fdb6d2f.svga"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/view/ViewGroup;

    .line 28
    .line 29
    iget-object p0, p0, Ll/ndp;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final l(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
