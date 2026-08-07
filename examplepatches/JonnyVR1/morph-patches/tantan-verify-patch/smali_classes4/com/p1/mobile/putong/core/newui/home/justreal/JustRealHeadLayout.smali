.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Ll/o4;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->f(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)Ll/o4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    return-object p0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_trial_go_verify"

    .line 2
    .line 3
    const-string v0, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "tantanapp://verificationcenter"

    .line 17
    .line 18
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 28
    .line 29
    const-string v1, "pending"

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 40
    .line 41
    const-string v0, "prePending"

    .line 42
    .line 43
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/o4;->d()Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/o4;->d()Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "\u53bb\u8ba4\u8bc1"

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public g(ZZ)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    const-wide/16 v2, 0x12c

    .line 4
    .line 5
    const-string v4, "translationY"

    .line 6
    .line 7
    const-string v5, "alpha"

    .line 8
    .line 9
    const/4 v6, 0x1

    .line 10
    const/4 v7, 0x0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 17
    .line 18
    invoke-virtual {p1, v6}, Ll/o4;->f(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/high16 p2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    cmpl-float p1, p1, p2

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    cmpl-float p1, p1, v7

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p1, "e_trial_go_verify"

    .line 41
    .line 42
    const-string p2, "p_suggest_users_home_view"

    .line 43
    .line 44
    invoke-static {p1, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-array p1, v1, [F

    .line 48
    .line 49
    fill-array-data p1, :array_0

    .line 50
    .line 51
    .line 52
    invoke-static {p0, v5, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    new-array v1, v1, [F

    .line 61
    .line 62
    aput p2, v1, v0

    .line 63
    .line 64
    aput v7, v1, v6

    .line 65
    .line 66
    invoke-static {p0, v4, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    filled-new-array {p1, p0}, [Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    cmpl-float p1, p1, v7

    .line 91
    .line 92
    const/high16 v8, 0x42480000    # 50.0f

    .line 93
    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    int-to-float v9, v9

    .line 105
    cmpl-float p1, p1, v9

    .line 106
    .line 107
    if-nez p1, :cond_2

    .line 108
    .line 109
    :goto_0
    return-void

    .line 110
    :cond_2
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    int-to-float p1, p1

    .line 115
    if-nez p2, :cond_3

    .line 116
    .line 117
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    int-to-float p1, p1

    .line 122
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v7}, Landroid/view/View;->setAlpha(F)V

    .line 126
    .line 127
    .line 128
    const/16 p1, 0x8

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->setVisibility(I)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ll/o4;->f(Z)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    new-array v8, v1, [F

    .line 144
    .line 145
    aput p2, v8, v0

    .line 146
    .line 147
    aput v7, v8, v6

    .line 148
    .line 149
    invoke-static {p0, v5, v8}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    new-array v1, v1, [F

    .line 158
    .line 159
    aput v5, v1, v0

    .line 160
    .line 161
    aput p1, v1, v6

    .line 162
    .line 163
    invoke-static {p0, v4, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    filled-new-array {p2, p1}, [Landroid/animation/Animator;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$b;

    .line 176
    .line 177
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->a:Landroid/view/View;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/o4;->a()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->g(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/spl0;->A()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/spl0;->B()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/o4;->b()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    new-instance v0, Ll/etq;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/etq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance p2, Ll/ftq;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Ll/ftq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/spl0;->A()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/spl0;->B()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Ll/gtq;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/gtq;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    new-instance v0, Ll/b230;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/b230;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 31
    .line 32
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/o4;->e(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/o4;->a()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$a;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->setTitleTransCall(Ll/y20;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->b:Ll/o4;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/o4;->d()Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v0, Ll/dtq;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/dtq;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->a:Landroid/view/View;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->a:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
