.class public Ll/fcw;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Landroid/widget/FrameLayout;

.field public k:Lcom/tantan/library/svga/SVGAnimationView;

.field public l:Lcom/p1/mobile/putong/data/User;

.field public m:Ll/x20;

.field public n:Ll/x20;

.field public o:Ll/l4g0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->j:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    const-class p1, Ll/bem;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "p_receive_letter_pop"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/fcw;->o:Ll/l4g0;

    .line 20
    .line 21
    iput-object p2, p0, Ll/fcw;->l:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic E(Ljava/util/Set;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Ll/fcw;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcw;->M(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic G(Ll/fcw;Ljava/util/Set;Landroid/animation/ValueAnimator;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fcw;->Q(Ljava/util/Set;Landroid/animation/ValueAnimator;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/fcw;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcw;->P(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic I(Ll/fcw;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcw;->N(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic J(Ll/fcw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fcw;->O()V

    return-void
.end method

.method private L()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method private synthetic O()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fcw;->m:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gcw;->b(Ll/fcw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
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
    iget-object p0, p0, Ll/fcw;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    const/high16 v0, 0x3f400000    # 0.75f

    .line 14
    .line 15
    mul-float/2addr p1, v0

    .line 16
    const/high16 v0, 0x3e800000    # 0.25f

    .line 17
    .line 18
    add-float/2addr p1, v0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic N(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fcw;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic P(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fcw;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/16 v0, 0xff

    .line 19
    .line 20
    invoke-static {p1, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic Q(Ljava/util/Set;Landroid/animation/ValueAnimator;Landroid/view/View;)V
    .locals 8

    .line 1
    const-string p3, "btn01"

    .line 2
    .line 3
    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p3, :cond_3

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-nez p3, :cond_3

    .line 15
    .line 16
    new-instance p3, Ll/ybw;

    .line 17
    .line 18
    invoke-direct {p3, p0}, Ll/ybw;-><init>(Ll/fcw;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 22
    .line 23
    .line 24
    const/high16 p3, -0x67000000

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    filled-new-array {p3, v1}, [I

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    const-wide/16 v1, 0x14d

    .line 36
    .line 37
    invoke-virtual {p3, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    new-instance v1, Landroid/animation/ArgbEvaluator;

    .line 42
    .line 43
    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3, v1}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Ll/zbw;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/zbw;-><init>(Ll/fcw;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p3, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/acw;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/acw;-><init>(Ll/fcw;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p3, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    const/16 v1, 0xff

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    filled-new-array {v1, v2}, [I

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-wide/16 v3, 0x1f4

    .line 77
    .line 78
    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v3, Landroid/view/animation/PathInterpolator;

    .line 83
    .line 84
    const v4, 0x3f333333    # 0.7f

    .line 85
    .line 86
    .line 87
    const/high16 v5, 0x3fa00000    # 1.25f

    .line 88
    .line 89
    const v6, 0x3e8f5c29    # 0.28f

    .line 90
    .line 91
    .line 92
    const v7, 0x3e051eb8    # 0.13f

    .line 93
    .line 94
    .line 95
    invoke-direct {v3, v6, v7, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 99
    .line 100
    .line 101
    new-instance v3, Ll/bcw;

    .line 102
    .line 103
    invoke-direct {v3, p0}, Ll/bcw;-><init>(Ll/fcw;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 107
    .line 108
    .line 109
    new-instance v3, Ll/ccw;

    .line 110
    .line 111
    invoke-direct {v3, p0}, Ll/ccw;-><init>(Ll/fcw;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    invoke-direct {p0}, Ll/fcw;->L()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    instance-of v3, v3, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 122
    .line 123
    const/4 v4, 0x2

    .line 124
    const/16 v5, 0x686

    .line 125
    .line 126
    if-eqz v3, :cond_0

    .line 127
    .line 128
    invoke-static {v5}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    new-array v3, v4, [Landroid/animation/Animator;

    .line 133
    .line 134
    aput-object v1, v3, v2

    .line 135
    .line 136
    aput-object p3, v3, v0

    .line 137
    .line 138
    invoke-static {v3}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    new-array v1, v4, [Landroid/animation/Animator;

    .line 143
    .line 144
    aput-object p2, v1, v2

    .line 145
    .line 146
    aput-object p3, v1, v0

    .line 147
    .line 148
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_0
    invoke-static {v5}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    const/4 v5, 0x3

    .line 161
    new-array v5, v5, [Landroid/animation/Animator;

    .line 162
    .line 163
    aput-object v3, v5, v2

    .line 164
    .line 165
    aput-object p3, v5, v0

    .line 166
    .line 167
    aput-object v1, v5, v4

    .line 168
    .line 169
    invoke-static {v5}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    new-array v1, v4, [Landroid/animation/Animator;

    .line 174
    .line 175
    aput-object p2, v1, v2

    .line 176
    .line 177
    aput-object p3, v1, v0

    .line 178
    .line 179
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 184
    .line 185
    .line 186
    :goto_0
    iget-object p2, p0, Ll/fcw;->n:Ll/x20;

    .line 187
    .line 188
    if-eqz p2, :cond_1

    .line 189
    .line 190
    invoke-interface {p2}, Ll/x20;->call()V

    .line 191
    .line 192
    .line 193
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    const-string p3, "to_uid"

    .line 202
    .line 203
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    invoke-direct {p0}, Ll/fcw;->L()Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 212
    .line 213
    if-eqz p0, :cond_2

    .line 214
    .line 215
    const-string p0, "message"

    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_2
    const-string p0, "chat"

    .line 219
    .line 220
    :goto_1
    const-string p3, "show_page"

    .line 221
    .line 222
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    filled-new-array {p2, p0}, [Ll/pf60;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    const-string p2, "e_open_letter"

    .line 231
    .line 232
    const-string p3, "p_receive_letter_pop"

    .line 233
    .line 234
    invoke-static {p2, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 235
    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_3
    const-string p3, "img_234"

    .line 239
    .line 240
    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p3

    .line 244
    if-nez p3, :cond_4

    .line 245
    .line 246
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 247
    .line 248
    .line 249
    move-result p2

    .line 250
    if-nez p2, :cond_4

    .line 251
    .line 252
    iget-object p2, p0, Ll/fcw;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 253
    .line 254
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 258
    .line 259
    .line 260
    :cond_4
    :goto_2
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method public R(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fcw;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/fcw;->K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/g1e;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fcw;->o:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, -0x1

    .line 13
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 14
    .line 15
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    const/high16 v0, 0x4000000

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 23
    .line 24
    .line 25
    const/high16 v0, 0x20000

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x400

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 37
    .line 38
    .line 39
    const/high16 v0, -0x80000000

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public show()V
    .locals 12

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fcw;->o:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "to_uid"

    .line 15
    .line 16
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {p0}, Ll/fcw;->L()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    instance-of v2, v2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    const-string v2, "message"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string v2, "chat"

    .line 32
    .line 33
    :goto_0
    const-string v3, "show_page"

    .line 34
    .line 35
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/fcw;->o:Ll/l4g0;

    .line 47
    .line 48
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x2

    .line 57
    new-array v1, v1, [F

    .line 58
    .line 59
    fill-array-data v1, :array_0

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-wide/16 v2, 0xbb8

    .line 67
    .line 68
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Ll/fcw;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 73
    .line 74
    new-instance v3, Ll/wbw;

    .line 75
    .line 76
    invoke-direct {v3, p0, v0, v1}, Ll/wbw;-><init>(Ll/fcw;Ljava/util/Set;Landroid/animation/ValueAnimator;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/fcw;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 83
    .line 84
    new-instance v2, Ll/xbw;

    .line 85
    .line 86
    invoke-direct {v2, v0}, Ll/xbw;-><init>(Ljava/util/Set;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGAnimationView;->setOnClickListener(Lcom/tantan/library/svga/SVGAClickAreaListener;)V

    .line 90
    .line 91
    .line 92
    new-instance v5, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 93
    .line 94
    invoke-direct {v5}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 95
    .line 96
    .line 97
    new-instance v0, Landroid/text/TextPaint;

    .line 98
    .line 99
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 100
    .line 101
    .line 102
    const/16 v1, 0x12

    .line 103
    .line 104
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    int-to-float v1, v1

    .line 109
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 110
    .line 111
    .line 112
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 115
    .line 116
    .line 117
    const/4 v1, 0x1

    .line 118
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 119
    .line 120
    .line 121
    const v2, 0x3e4ccccd    # 0.2f

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    .line 125
    .line 126
    .line 127
    const/4 v2, 0x3

    .line 128
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    sget v3, Ll/c9c0;->p:I

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Ll/fcw;->l:Lcom/p1/mobile/putong/data/User;

    .line 153
    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    const/4 v4, 0x6

    .line 161
    const/4 v11, 0x0

    .line 162
    if-le v3, v4, :cond_1

    .line 163
    .line 164
    const/4 v3, 0x5

    .line 165
    invoke-virtual {v2, v11, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    const-string v3, "\u2026"

    .line 170
    .line 171
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    :cond_1
    const-string v3, "text01"

    .line 176
    .line 177
    invoke-virtual {v5, v2, v0, v3}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object v3, Ll/aeh0;->INSTANCE:Ll/aeh0;

    .line 181
    .line 182
    invoke-direct {p0}, Ll/fcw;->L()Lcom/p1/mobile/android/app/Act;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    iget-object v0, p0, Ll/fcw;->l:Lcom/p1/mobile/putong/data/User;

    .line 187
    .line 188
    invoke-virtual {v0, v11}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    const/16 v9, 0x50

    .line 205
    .line 206
    const/4 v10, 0x0

    .line 207
    const-string v7, "head01"

    .line 208
    .line 209
    const/16 v8, 0x3c

    .line 210
    .line 211
    invoke-virtual/range {v3 .. v10}, Ll/aeh0;->f(Lcom/p1/mobile/android/app/Act;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;IILl/y20;)V

    .line 212
    .line 213
    .line 214
    const-string v0, "btn01"

    .line 215
    .line 216
    invoke-virtual {v5, v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setClickArea(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    const-string v0, "img_234"

    .line 220
    .line 221
    invoke-virtual {v5, v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setClickArea(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    const-string v0, "img_1452"

    .line 225
    .line 226
    invoke-virtual {v5, v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setClickArea(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    const-string v2, "https://auto.tancdn.com/v1/raw/2dbebf28-825a-48cb-87ec-84a61faec80714.svga"

    .line 238
    .line 239
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0, v11}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0, v5}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    new-instance v1, Ll/fcw$a;

    .line 256
    .line 257
    invoke-direct {v1, p0}, Ll/fcw$a;-><init>(Ll/fcw;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iget-object p0, p0, Ll/fcw;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 265
    .line 266
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 267
    .line 268
    .line 269
    return-void

    .line 270
    nop

    .line 271
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
