.class public Ll/cri0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/animation/AnimatorSet;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Landroid/animation/AnimatorSet;

.field public static c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/cri0;->a:Ljava/util/Map;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-boolean v0, Ll/cri0;->c:Z

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Landroid/view/View;Ll/x20;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zqi0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/zqi0;-><init>(Ll/x20;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/cri0;->j(Landroid/view/View;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->h:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/cri0;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    sput-boolean p0, Ll/cri0;->c:Z

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e(Landroid/view/View;Landroid/animation/AnimatorSet;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget v1, Ll/qa00;->j:I

    .line 14
    .line 15
    sub-int/2addr v0, v1

    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/bri0;

    .line 24
    .line 25
    invoke-direct {p0, p2}, Ll/bri0;-><init>(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/bri0;

    .line 29
    .line 30
    invoke-direct {v0, p2}, Ll/bri0;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, p0, v0}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static varargs f(Ljava/lang/String;Landroid/view/View;[F)Landroid/animation/AnimatorSet;
    .locals 7

    .line 1
    sget-object v0, Ll/cri0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "alpha"

    .line 15
    .line 16
    invoke-static {p1, v2, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-wide/16 v3, 0x12c

    .line 21
    .line 22
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    new-instance v5, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 26
    .line 27
    invoke-direct {v5}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    const-string v5, "scaleX"

    .line 34
    .line 35
    invoke-static {p1, v5, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-virtual {v5, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    new-instance v6, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 43
    .line 44
    invoke-direct {v6}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    const-string v6, "scaleY"

    .line 51
    .line 52
    invoke-static {p1, v6, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    new-instance p2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 60
    .line 61
    invoke-direct {p2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 65
    .line 66
    .line 67
    const/4 p2, 0x3

    .line 68
    new-array p2, p2, [Landroid/animation/Animator;

    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    aput-object v2, p2, v3

    .line 72
    .line 73
    const/4 v2, 0x1

    .line 74
    aput-object v5, p2, v2

    .line 75
    .line 76
    const/4 v2, 0x2

    .line 77
    aput-object p1, p2, v2

    .line 78
    .line 79
    invoke-virtual {v1, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    :cond_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Landroid/animation/AnimatorSet;

    .line 90
    .line 91
    return-object p0
.end method

.method public static g(Landroid/view/View;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static h(Landroid/view/View;Ll/x20;)V
    .locals 2
    .param p1    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-boolean v0, Ll/cri0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sput-boolean v0, Ll/cri0;->c:Z

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    fill-array-data v0, :array_0

    .line 15
    .line 16
    .line 17
    const-string v1, "in"

    .line 18
    .line 19
    invoke-static {v1, p0, v0}, Ll/cri0;->f(Ljava/lang/String;Landroid/view/View;[F)Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/high16 v1, 0x42480000    # 50.0f

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/yqi0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/yqi0;-><init>(Landroid/view/View;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void

    .line 43
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static i(Landroid/widget/TextView;Ljava/lang/CharSequence;I)V
    .locals 10

    .line 1
    sget-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

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
    sget-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 32
    .line 33
    .line 34
    sget v1, Ll/qa00;->k:I

    .line 35
    .line 36
    neg-int v1, v1

    .line 37
    int-to-float v1, v1

    .line 38
    const/4 v2, 0x1

    .line 39
    new-array v3, v2, [F

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    aput v1, v3, v4

    .line 43
    .line 44
    const-string v1, "translationY"

    .line 45
    .line 46
    invoke-static {p0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const/4 v5, 0x2

    .line 51
    div-int/2addr p2, v5

    .line 52
    int-to-long v6, p2

    .line 53
    invoke-virtual {v3, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    new-array p2, v5, [F

    .line 57
    .line 58
    fill-array-data p2, :array_0

    .line 59
    .line 60
    .line 61
    const-string v8, "alpha"

    .line 62
    .line 63
    invoke-static {p0, v8, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 68
    .line 69
    .line 70
    new-array v9, v5, [Landroid/animation/Animator;

    .line 71
    .line 72
    aput-object v3, v9, v4

    .line 73
    .line 74
    aput-object p2, v9, v2

    .line 75
    .line 76
    invoke-virtual {v0, v9}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 77
    .line 78
    .line 79
    new-instance p2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 80
    .line 81
    invoke-direct {p2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, p2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 85
    .line 86
    .line 87
    new-instance p2, Ll/wqi0;

    .line 88
    .line 89
    invoke-direct {p2, p0, p1}, Ll/wqi0;-><init>(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    new-instance p2, Ll/xqi0;

    .line 96
    .line 97
    invoke-direct {p2, p0, p1}, Ll/xqi0;-><init>(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 101
    .line 102
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 103
    .line 104
    .line 105
    sget v3, Ll/qa00;->h:I

    .line 106
    .line 107
    int-to-float v3, v3

    .line 108
    new-array v9, v5, [F

    .line 109
    .line 110
    aput v3, v9, v4

    .line 111
    .line 112
    const/4 v3, 0x0

    .line 113
    aput v3, v9, v2

    .line 114
    .line 115
    invoke-static {p0, v1, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    new-instance v3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 120
    .line 121
    invoke-direct {v3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    .line 130
    new-array v3, v5, [F

    .line 131
    .line 132
    fill-array-data v3, :array_1

    .line 133
    .line 134
    .line 135
    invoke-static {p0, v8, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    new-instance v3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 140
    .line 141
    invoke-direct {v3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    .line 150
    new-instance v3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 151
    .line 152
    invoke-direct {v3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 156
    .line 157
    .line 158
    new-array v3, v5, [Landroid/animation/Animator;

    .line 159
    .line 160
    aput-object v1, v3, v4

    .line 161
    .line 162
    aput-object p0, v3, v2

    .line 163
    .line 164
    invoke-virtual {p1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 165
    .line 166
    .line 167
    sget-object p0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 168
    .line 169
    new-array v1, v5, [Landroid/animation/Animator;

    .line 170
    .line 171
    aput-object v0, v1, v4

    .line 172
    .line 173
    aput-object p1, v1, v2

    .line 174
    .line 175
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 176
    .line 177
    .line 178
    sget-object p0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 181
    .line 182
    .line 183
    sget-object p0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 184
    .line 185
    const/4 p1, 0x0

    .line 186
    invoke-static {p0, p1, p2}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    nop

    .line 191
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static j(Landroid/view/View;Ll/x20;)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    const-string v1, "out"

    .line 8
    .line 9
    invoke-static {v1, p0, v0}, Ll/cri0;->f(Ljava/lang/String;Landroid/view/View;[F)Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ari0;

    .line 14
    .line 15
    invoke-direct {v1, p0, v0, p1}, Ll/ari0;-><init>(Landroid/view/View;Landroid/animation/AnimatorSet;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-wide/16 v2, 0xbb8

    .line 23
    .line 24
    invoke-static {p0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static k()V
    .locals 1

    .line 1
    sget-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    sput-object v0, Ll/cri0;->b:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    :cond_1
    return-void
.end method
