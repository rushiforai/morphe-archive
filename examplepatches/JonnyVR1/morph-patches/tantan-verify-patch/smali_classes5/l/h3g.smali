.class public Ll/h3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b3g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VLinear_FillerMeasure;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VText;

.field public o:Lv/VButton_FakeShadow;

.field public p:Landroid/widget/LinearLayout;

.field public q:Lv/VButton;

.field public r:Lv/VButton;

.field public s:Lv/VScroll_Horizontal;

.field public t:Lv/VLinear;

.field public u:Landroid/widget/FrameLayout;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/android/app/Act;

.field public x:Ll/b3g;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h3g;->w:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/h3g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h3g;->l()V

    return-void
.end method

.method public static synthetic b(Ll/h3g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h3g;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/h3g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h3g;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/h3g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h3g;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/h3g;Ll/syf0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h3g;->k(Ll/syf0;)V

    return-void
.end method

.method private j(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string p1, "female"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private synthetic k(Ll/syf0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/h3g$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h3g$a;-><init>(Ll/h3g;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/syf0;->a(Ll/gzf0;)Ll/syf0;

    .line 7
    .line 8
    .line 9
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Ll/syf0;->o(D)Ll/syf0;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h3g;->x:Ll/b3g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b3g;->s0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h3g;->x:Ll/b3g;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/b3g;->t0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h3g;->o:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    new-instance v1, Ll/g3g;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g3g;-><init>(Ll/h3g;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h3g;->w:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/izf0;->h()Ll/izf0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/sr2;->c()Ll/syf0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/uyf0;

    .line 12
    .line 13
    const-wide v3, 0x4072c00000000000L    # 300.0

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    const-wide/high16 v5, 0x402a000000000000L    # 13.0

    .line 19
    .line 20
    invoke-direct {v2, v3, v4, v5, v6}, Ll/uyf0;-><init>(DD)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/syf0;->p(Ll/uyf0;)Ll/syf0;

    .line 24
    .line 25
    .line 26
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ll/f3g;

    .line 31
    .line 32
    invoke-direct {v3, v0, v1}, Ll/f3g;-><init>(Ll/h3g;Ll/syf0;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v4, 0x258

    .line 36
    .line 37
    invoke-virtual {v2, v3, v4, v5}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    new-instance v12, Landroid/view/animation/AnticipateInterpolator;

    .line 41
    .line 42
    invoke-direct {v12}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object v6, v0, Ll/h3g;->v:Lv/VText;

    .line 46
    .line 47
    sget-object v14, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    new-array v13, v1, [F

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    const/high16 v3, 0x3f800000    # 1.0f

    .line 54
    .line 55
    aput v3, v13, v2

    .line 56
    .line 57
    const-wide/16 v8, 0x0

    .line 58
    .line 59
    const-wide/16 v10, 0x258

    .line 60
    .line 61
    move-object v7, v14

    .line 62
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    iget-object v13, v0, Ll/h3g;->e:Lv/VDraweeView;

    .line 67
    .line 68
    new-array v5, v1, [F

    .line 69
    .line 70
    aput v3, v5, v2

    .line 71
    .line 72
    const-wide/16 v15, 0x0

    .line 73
    .line 74
    const-wide/16 v17, 0x1e0

    .line 75
    .line 76
    const/16 v19, 0x0

    .line 77
    .line 78
    move-object/from16 v20, v5

    .line 79
    .line 80
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    iget-object v13, v0, Ll/h3g;->f:Lv/VDraweeView;

    .line 85
    .line 86
    new-array v6, v1, [F

    .line 87
    .line 88
    aput v3, v6, v2

    .line 89
    .line 90
    move-object/from16 v20, v6

    .line 91
    .line 92
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    iget-object v7, v0, Ll/h3g;->e:Lv/VDraweeView;

    .line 97
    .line 98
    sget-object v8, Ll/gt0;->i:Landroid/util/Property;

    .line 99
    .line 100
    new-instance v13, Landroid/view/animation/OvershootInterpolator;

    .line 101
    .line 102
    const/high16 v15, 0x40000000    # 2.0f

    .line 103
    .line 104
    invoke-direct {v13, v15}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 105
    .line 106
    .line 107
    new-array v14, v1, [F

    .line 108
    .line 109
    aput v3, v14, v2

    .line 110
    .line 111
    const-wide/16 v9, 0xc8

    .line 112
    .line 113
    const-wide/16 v11, 0x320

    .line 114
    .line 115
    invoke-static/range {v7 .. v14}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    iget-object v8, v0, Ll/h3g;->f:Lv/VDraweeView;

    .line 120
    .line 121
    sget-object v17, Ll/gt0;->i:Landroid/util/Property;

    .line 122
    .line 123
    new-instance v9, Landroid/view/animation/OvershootInterpolator;

    .line 124
    .line 125
    invoke-direct {v9, v15}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 126
    .line 127
    .line 128
    new-array v1, v1, [F

    .line 129
    .line 130
    aput v3, v1, v2

    .line 131
    .line 132
    const-wide/16 v18, 0xc8

    .line 133
    .line 134
    const-wide/16 v20, 0x320

    .line 135
    .line 136
    move-object/from16 v23, v1

    .line 137
    .line 138
    move-object/from16 v16, v8

    .line 139
    .line 140
    move-object/from16 v22, v9

    .line 141
    .line 142
    invoke-static/range {v16 .. v23}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    filled-new-array {v4, v5, v6, v7, v1}, [Landroid/animation/Animator;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget-object v0, v0, Ll/h3g;->e:Lv/VDraweeView;

    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    new-array v2, v2, [Landroid/animation/Animator;

    .line 161
    .line 162
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, [Landroid/animation/Animator;

    .line 167
    .line 168
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v0, v1}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    return-object v0
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 14

    .line 1
    new-instance v6, Landroid/view/animation/AnticipateInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/h3g;->e:Lv/VDraweeView;

    .line 7
    .line 8
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 9
    .line 10
    const/4 v8, 0x1

    .line 11
    new-array v7, v8, [F

    .line 12
    .line 13
    const/4 v9, 0x0

    .line 14
    const/4 v10, 0x0

    .line 15
    aput v10, v7, v9

    .line 16
    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    const-wide/16 v4, 0x1f4

    .line 20
    .line 21
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v11

    .line 25
    iget-object v0, p0, Ll/h3g;->e:Lv/VDraweeView;

    .line 26
    .line 27
    new-array v7, v8, [F

    .line 28
    .line 29
    aput v10, v7, v9

    .line 30
    .line 31
    const-string v1, "alpha"

    .line 32
    .line 33
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v12

    .line 37
    iget-object v0, p0, Ll/h3g;->f:Lv/VDraweeView;

    .line 38
    .line 39
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 40
    .line 41
    new-array v7, v8, [F

    .line 42
    .line 43
    aput v10, v7, v9

    .line 44
    .line 45
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v13

    .line 49
    iget-object v0, p0, Ll/h3g;->f:Lv/VDraweeView;

    .line 50
    .line 51
    new-array v7, v8, [F

    .line 52
    .line 53
    aput v10, v7, v9

    .line 54
    .line 55
    const-string v1, "alpha"

    .line 56
    .line 57
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    filled-new-array {v11, v12, v13, v0}, [Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    new-array v1, v1, [Landroid/animation/Animator;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, [Landroid/animation/Animator;

    .line 80
    .line 81
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v1, p0, Ll/h3g;->x:Ll/b3g;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/b3g;->l0()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_0

    .line 92
    .line 93
    iget-object p0, p0, Ll/h3g;->e:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-static {p0, v0}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_0
    iget-object v1, p0, Ll/h3g;->o:Lv/VButton_FakeShadow;

    .line 101
    .line 102
    invoke-static {v1, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ll/h3g;->n:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    neg-int v2, v2

    .line 112
    int-to-float v2, v2

    .line 113
    new-array v3, v8, [F

    .line 114
    .line 115
    aput v2, v3, v9

    .line 116
    .line 117
    const-string v2, "x"

    .line 118
    .line 119
    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const-wide/16 v2, 0x12c

    .line 124
    .line 125
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 126
    .line 127
    .line 128
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    .line 129
    .line 130
    invoke-direct {v2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 134
    .line 135
    .line 136
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 137
    .line 138
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 139
    .line 140
    .line 141
    new-instance v3, Ll/c3g;

    .line 142
    .line 143
    invoke-direct {v3, p0}, Ll/c3g;-><init>(Ll/h3g;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 154
    .line 155
    .line 156
    return-object v2
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/i3g;->b(Ll/h3g;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/b3g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h3g;->x:Ll/b3g;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b3g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h3g;->i(Ll/b3g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h3g;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/h3g;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/h3g;->n:Lv/VText;

    .line 9
    .line 10
    new-instance v0, Ll/d3g;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/d3g;-><init>(Ll/h3g;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/e3g;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/e3g;-><init>(Ll/h3g;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public initAnimationState()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h3g;->v:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/h3g;->e:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/h3g;->e:Lv/VDraweeView;

    .line 13
    .line 14
    const v2, 0x3dcccccd    # 0.1f

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v2}, Ll/bnl0;->t0(Landroid/view/View;F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/h3g;->f:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/h3g;->f:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-static {v0, v2}, Ll/bnl0;->t0(Landroid/view/View;F)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/bnl0;->y0()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ll/h3g;->o:Lv/VButton_FakeShadow;

    .line 35
    .line 36
    int-to-float v2, v0

    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/h3g;->n:Lv/VText;

    .line 41
    .line 42
    neg-int v0, v0

    .line 43
    int-to-float v0, v0

    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/h3g;->e:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {v0, v1, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object v0, p0, Ll/h3g;->f:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/16 v2, 0x64

    .line 37
    .line 38
    const/4 v3, 0x2

    .line 39
    invoke-virtual {p2, v0, v1, v3, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Ll/h3g;->i:Lv/VText;

    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Ll/h3g;->w:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->K0:I

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object v0, p0, Ll/h3g;->w:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-direct {p0, p1}, Ll/h3g;->j(Lcom/p1/mobile/putong/data/User;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_0

    .line 72
    .line 73
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->J0:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->I0:I

    .line 77
    .line 78
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Ll/h3g;->k:Lv/VText;

    .line 83
    .line 84
    filled-new-array {p2}, [Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    const-string v2, "#ffc96b"

    .line 93
    .line 94
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-static {v0, p2, v2, v3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    iget-object p2, p0, Ll/h3g;->o:Lv/VButton_FakeShadow;

    .line 110
    .line 111
    iget-object v0, p0, Ll/h3g;->w:Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-direct {p0, p1}, Ll/h3g;->j(Lcom/p1/mobile/putong/data/User;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_1

    .line 122
    .line 123
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->H0:I

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_1
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->G0:I

    .line 127
    .line 128
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/h3g;->g:Lv/VText;

    .line 136
    .line 137
    invoke-static {p1}, Ll/yie0;->q(Lcom/p1/mobile/putong/data/User;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    return-void
.end method
