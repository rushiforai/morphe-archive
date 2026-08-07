.class public Ll/rlf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/clf;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/bnl0$g;

.field public B:Ll/bnl0$g;

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:Landroid/widget/PopupWindow;

.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Lv/VLinear_FillerMeasure;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public f:Lv/VLinear;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public i:Lv/VFrame;

.field public j:Lv/VLinear;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public n:Lv/VFrame;

.field public o:Lv/VLinear;

.field public p:Lv/VEditText;

.field public q:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

.field public s:Ll/clf;

.field public t:Z

.field public u:Z

.field public v:Lcom/p1/mobile/putong/data/User;

.field public w:Landroid/view/animation/Interpolator;

.field public x:Z

.field public y:Ll/eof;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/rlf;->t:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/rlf;->u:Z

    .line 9
    .line 10
    new-instance v1, Ll/xjg;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/xjg;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/rlf;->w:Landroid/view/animation/Interpolator;

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/rlf;->x:Z

    .line 18
    .line 19
    const-string v0, ""

    .line 20
    .line 21
    iput-object v0, p0, Ll/rlf;->z:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 24
    .line 25
    return-void
.end method

.method public static J(Landroid/app/Activity;)Z
    .locals 5
    .param p0    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move v2, v1

    .line 15
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-ge v2, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/4 v4, -0x1

    .line 41
    if-eq v3, v4, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "navigationBarBackground"

    .line 60
    .line 61
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_0

    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    return v1
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rlf;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/rlf;->o:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/rlf;->p:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 13
    .line 14
    iget-object p0, p0, Ll/rlf;->p:Lv/VEditText;

    .line 15
    .line 16
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ll/rlf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rlf;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/rlf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rlf;->W()V

    return-void
.end method

.method public static synthetic c(Ll/rlf;Landroid/animation/ValueAnimator;ILandroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rlf;->V(Landroid/animation/ValueAnimator;ILandroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Ll/rlf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rlf;->N()V

    return-void
.end method

.method public static synthetic e(Ll/rlf;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rlf;->P(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f(Ll/rlf;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rlf;->L(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic i(Ll/rlf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rlf;->O()V

    return-void
.end method

.method public static synthetic j(Ll/rlf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rlf;->M()V

    return-void
.end method

.method public static synthetic k(Ll/rlf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rlf;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/rlf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rlf;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/rlf;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rlf;->K(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic n(Ll/rlf;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rlf;->T(I)V

    return-void
.end method

.method public static synthetic p(Ll/rlf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rlf;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic q(Ll/rlf;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rlf;->z:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic s(Ll/rlf;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rlf;->z:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic u(Ll/rlf;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rlf;->b0(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rlf;->p:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public C()V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/rlf;->u:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, v0, Ll/rlf;->u:Z

    .line 10
    .line 11
    iget-object v2, v0, Ll/rlf;->o:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    new-array v4, v3, [F

    .line 21
    .line 22
    fill-array-data v4, :array_0

    .line 23
    .line 24
    .line 25
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-wide/16 v5, 0xc8

    .line 30
    .line 31
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    sget-object v13, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 36
    .line 37
    invoke-virtual {v4, v13}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 38
    .line 39
    .line 40
    new-instance v7, Ll/qlf;

    .line 41
    .line 42
    invoke-direct {v7, v0, v4, v2}, Ll/qlf;-><init>(Ll/rlf;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/elf;

    .line 49
    .line 50
    invoke-direct {v2, v0}, Ll/elf;-><init>(Ll/rlf;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v4, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ll/rlf;->I()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget-object v7, v0, Ll/rlf;->q:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 61
    .line 62
    const/4 v15, 0x6

    .line 63
    const/16 v16, 0x5

    .line 64
    .line 65
    const/16 v17, 0x4

    .line 66
    .line 67
    const/16 v18, 0x3

    .line 68
    .line 69
    const-string v8, "translationY"

    .line 70
    .line 71
    const/4 v9, 0x1

    .line 72
    const/16 v19, 0x0

    .line 73
    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    new-array v14, v3, [F

    .line 77
    .line 78
    fill-array-data v14, :array_1

    .line 79
    .line 80
    .line 81
    move-object v2, v8

    .line 82
    const-string v8, "alpha"

    .line 83
    .line 84
    move v11, v9

    .line 85
    const-wide/16 v9, 0x0

    .line 86
    .line 87
    move/from16 v20, v11

    .line 88
    .line 89
    const-wide/16 v11, 0xc8

    .line 90
    .line 91
    move/from16 v29, v20

    .line 92
    .line 93
    move/from16 v20, v1

    .line 94
    .line 95
    move/from16 v1, v29

    .line 96
    .line 97
    invoke-static/range {v7 .. v14}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    iget-object v8, v0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 102
    .line 103
    new-array v9, v3, [F

    .line 104
    .line 105
    fill-array-data v9, :array_2

    .line 106
    .line 107
    .line 108
    const-string v22, "alpha"

    .line 109
    .line 110
    const-wide/16 v23, 0x0

    .line 111
    .line 112
    const-wide/16 v25, 0x3c

    .line 113
    .line 114
    const/16 v27, 0x0

    .line 115
    .line 116
    move-object/from16 v21, v8

    .line 117
    .line 118
    move-object/from16 v28, v9

    .line 119
    .line 120
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    iget-object v9, v0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 125
    .line 126
    new-array v10, v3, [F

    .line 127
    .line 128
    fill-array-data v10, :array_3

    .line 129
    .line 130
    .line 131
    const-string v22, "alpha"

    .line 132
    .line 133
    move-object/from16 v21, v9

    .line 134
    .line 135
    move-object/from16 v28, v10

    .line 136
    .line 137
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 138
    .line 139
    .line 140
    move-result-object v9

    .line 141
    iget-object v10, v0, Ll/rlf;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 142
    .line 143
    new-array v11, v3, [F

    .line 144
    .line 145
    fill-array-data v11, :array_4

    .line 146
    .line 147
    .line 148
    const-string v22, "alpha"

    .line 149
    .line 150
    move-object/from16 v21, v10

    .line 151
    .line 152
    move-object/from16 v28, v11

    .line 153
    .line 154
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v10

    .line 158
    iget-object v11, v0, Ll/rlf;->h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 159
    .line 160
    new-array v12, v3, [F

    .line 161
    .line 162
    fill-array-data v12, :array_5

    .line 163
    .line 164
    .line 165
    const-string v22, "alpha"

    .line 166
    .line 167
    move-object/from16 v21, v11

    .line 168
    .line 169
    move-object/from16 v28, v12

    .line 170
    .line 171
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    move-result-object v11

    .line 175
    iget-object v12, v0, Ll/rlf;->b:Lv/VLinear;

    .line 176
    .line 177
    new-array v13, v1, [F

    .line 178
    .line 179
    aput v19, v13, v20

    .line 180
    .line 181
    invoke-static {v12, v2, v13}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v2, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    const/4 v12, 0x7

    .line 190
    new-array v12, v12, [Landroid/animation/Animator;

    .line 191
    .line 192
    aput-object v4, v12, v20

    .line 193
    .line 194
    aput-object v7, v12, v1

    .line 195
    .line 196
    aput-object v8, v12, v3

    .line 197
    .line 198
    aput-object v9, v12, v18

    .line 199
    .line 200
    aput-object v10, v12, v17

    .line 201
    .line 202
    aput-object v11, v12, v16

    .line 203
    .line 204
    aput-object v2, v12, v15

    .line 205
    .line 206
    invoke-static {v5, v6, v12}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    new-instance v4, Ll/flf;

    .line 211
    .line 212
    invoke-direct {v4, v0}, Ll/flf;-><init>(Ll/rlf;)V

    .line 213
    .line 214
    .line 215
    invoke-static {v2, v4}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 220
    .line 221
    .line 222
    iget-object v4, v0, Ll/rlf;->p:Lv/VEditText;

    .line 223
    .line 224
    new-array v11, v3, [F

    .line 225
    .line 226
    fill-array-data v11, :array_6

    .line 227
    .line 228
    .line 229
    const-string v5, "alpha"

    .line 230
    .line 231
    const-wide/16 v6, 0x0

    .line 232
    .line 233
    const-wide/16 v8, 0x1e

    .line 234
    .line 235
    const/4 v10, 0x0

    .line 236
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    new-instance v3, Ll/rlf$b;

    .line 241
    .line 242
    invoke-direct {v3, v0}, Ll/rlf$b;-><init>(Ll/rlf;)V

    .line 243
    .line 244
    .line 245
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 250
    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :cond_1
    move/from16 v20, v1

    .line 255
    .line 256
    move-object v2, v8

    .line 257
    move v1, v9

    .line 258
    new-array v14, v3, [F

    .line 259
    .line 260
    fill-array-data v14, :array_7

    .line 261
    .line 262
    .line 263
    const-string v8, "alpha"

    .line 264
    .line 265
    const-wide/16 v9, 0x0

    .line 266
    .line 267
    const-wide/16 v11, 0xc8

    .line 268
    .line 269
    invoke-static/range {v7 .. v14}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 270
    .line 271
    .line 272
    move-result-object v7

    .line 273
    iget-object v8, v0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 274
    .line 275
    new-array v9, v3, [F

    .line 276
    .line 277
    fill-array-data v9, :array_8

    .line 278
    .line 279
    .line 280
    const-string v22, "alpha"

    .line 281
    .line 282
    const-wide/16 v23, 0x0

    .line 283
    .line 284
    const-wide/16 v25, 0x3c

    .line 285
    .line 286
    const/16 v27, 0x0

    .line 287
    .line 288
    move-object/from16 v21, v8

    .line 289
    .line 290
    move-object/from16 v28, v9

    .line 291
    .line 292
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 293
    .line 294
    .line 295
    move-result-object v8

    .line 296
    iget-object v9, v0, Ll/rlf;->k:Lv/VText;

    .line 297
    .line 298
    new-array v10, v3, [F

    .line 299
    .line 300
    fill-array-data v10, :array_9

    .line 301
    .line 302
    .line 303
    const-string v22, "alpha"

    .line 304
    .line 305
    move-object/from16 v21, v9

    .line 306
    .line 307
    move-object/from16 v28, v10

    .line 308
    .line 309
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 310
    .line 311
    .line 312
    move-result-object v9

    .line 313
    iget-object v10, v0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 314
    .line 315
    new-array v11, v3, [F

    .line 316
    .line 317
    fill-array-data v11, :array_a

    .line 318
    .line 319
    .line 320
    const-string v22, "alpha"

    .line 321
    .line 322
    move-object/from16 v21, v10

    .line 323
    .line 324
    move-object/from16 v28, v11

    .line 325
    .line 326
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 327
    .line 328
    .line 329
    move-result-object v10

    .line 330
    iget-object v11, v0, Ll/rlf;->b:Lv/VLinear;

    .line 331
    .line 332
    new-array v12, v1, [F

    .line 333
    .line 334
    aput v19, v12, v20

    .line 335
    .line 336
    invoke-static {v11, v2, v12}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    invoke-virtual {v2, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    new-array v11, v15, [Landroid/animation/Animator;

    .line 345
    .line 346
    aput-object v4, v11, v20

    .line 347
    .line 348
    aput-object v7, v11, v1

    .line 349
    .line 350
    aput-object v8, v11, v3

    .line 351
    .line 352
    aput-object v9, v11, v18

    .line 353
    .line 354
    aput-object v10, v11, v17

    .line 355
    .line 356
    aput-object v2, v11, v16

    .line 357
    .line 358
    invoke-static {v5, v6, v11}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    new-instance v3, Ll/glf;

    .line 363
    .line 364
    invoke-direct {v3, v0}, Ll/glf;-><init>(Ll/rlf;)V

    .line 365
    .line 366
    .line 367
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 368
    .line 369
    .line 370
    move-result-object v2

    .line 371
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 372
    .line 373
    .line 374
    :goto_0
    iget-object v2, v0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 375
    .line 376
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 377
    .line 378
    .line 379
    iget-object v2, v0, Ll/rlf;->k:Lv/VText;

    .line 380
    .line 381
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 382
    .line 383
    .line 384
    iget-object v0, v0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 385
    .line 386
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 387
    .line 388
    .line 389
    return-void

    .line 390
    nop

    .line 391
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    :array_4
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    :array_5
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    :array_6
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    :array_7
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    :array_8
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    :array_9
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    :array_a
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/rlf$e;->a:[I

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getTypeByAlias(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    aget p1, v0, p1

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    if-eq p1, v0, :cond_2

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    if-eq p1, v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    if-eq p1, v0, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    new-instance p1, Ll/tlf;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/tlf;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/rlf;->y:Ll/eof;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p1, Ll/vlf;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/vlf;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/rlf;->y:Ll/eof;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    new-instance p1, Ll/xlf;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/xlf;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/rlf;->y:Ll/eof;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    new-instance p1, Ll/skf;

    .line 56
    .line 57
    invoke-direct {p1}, Ll/skf;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/rlf;->y:Ll/eof;

    .line 61
    .line 62
    :goto_0
    iget-object p1, p0, Ll/rlf;->y:Ll/eof;

    .line 63
    .line 64
    iget-object p0, p0, Ll/rlf;->i:Lv/VFrame;

    .line 65
    .line 66
    invoke-interface {p1, p0}, Ll/eof;->e(Landroid/view/ViewGroup;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final F()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/rlf$d;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {v0, p0, v1}, Ll/rlf$d;-><init>(Ll/rlf;I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/dlf;->a(Lv/VLinear;Landroid/view/WindowInsetsAnimation$Callback;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final G()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-double v0, v0

    .line 8
    const-wide v2, 0x3fe92c5f92c5f92cL    # 0.7866666666666666

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    mul-double/2addr v0, v2

    .line 14
    double-to-int v0, v0

    .line 15
    const/high16 v1, 0x43c80000    # 400.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-le v0, v2, :cond_0

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    :cond_0
    iget-object v1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 28
    .line 29
    invoke-static {v1}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sub-int/2addr v1, v0

    .line 34
    div-int/lit8 v1, v1, 0x2

    .line 35
    .line 36
    iput v0, p0, Ll/rlf;->G:I

    .line 37
    .line 38
    iget-object v2, p0, Ll/rlf;->i:Lv/VFrame;

    .line 39
    .line 40
    invoke-static {v2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/rlf;->c:Lv/VLinear_FillerMeasure;

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/rlf;->c:Lv/VLinear_FillerMeasure;

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/rlf;->k:Lv/VText;

    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/rlf;->k:Lv/VText;

    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/rlf;->y:Ll/eof;

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    iget v1, p0, Ll/rlf;->G:I

    .line 78
    .line 79
    invoke-interface {v0, v1}, Ll/eof;->b(I)V

    .line 80
    .line 81
    .line 82
    :cond_1
    invoke-virtual {p0}, Ll/rlf;->I()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    const/high16 v0, 0x43aa0000    # 340.0f

    .line 89
    .line 90
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget v1, p0, Ll/rlf;->G:I

    .line 95
    .line 96
    :goto_0
    add-int/2addr v0, v1

    .line 97
    goto :goto_1

    .line 98
    :cond_2
    const/high16 v0, 0x43960000    # 300.0f

    .line 99
    .line 100
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget v1, p0, Ll/rlf;->G:I

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :goto_1
    iget-object v1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 108
    .line 109
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    sub-int/2addr v1, v0

    .line 114
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 115
    .line 116
    invoke-static {v0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    sub-int/2addr v1, v0

    .line 121
    div-int/lit8 v1, v1, 0x2

    .line 122
    .line 123
    iput v1, p0, Ll/rlf;->F:I

    .line 124
    .line 125
    iget-object p0, p0, Ll/rlf;->b:Lv/VLinear;

    .line 126
    .line 127
    invoke-static {p0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public H(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 5

    .line 1
    iput-object p3, p0, Ll/rlf;->v:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rlf;->E(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/rlf;->G()V

    .line 7
    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/rlf;->I()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Ll/rlf;->c:Lv/VLinear_FillerMeasure;

    .line 17
    .line 18
    const-string v1, "\u987a\u4fbf\u5938\u5938%s~"

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    const/4 v3, 0x0

    .line 22
    if-eqz p1, :cond_3

    .line 23
    .line 24
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/rlf;->f:Lv/VLinear;

    .line 28
    .line 29
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/rlf;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 33
    .line 34
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 37
    .line 38
    .line 39
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    const/4 v4, 0x4

    .line 56
    if-le v2, v4, :cond_1

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string v0, "..."

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_1
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 71
    .line 72
    const/4 v2, 0x2

    .line 73
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 77
    .line 78
    const/4 v2, 0x0

    .line 79
    const v4, 0x3f933333    # 1.15f

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v2, v4}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/rlf;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 86
    .line 87
    new-instance v2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v4, "\u7ed9 "

    .line 90
    .line 91
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v0, " \u7559\u8a00"

    .line 98
    .line 99
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/rlf;->h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 110
    .line 111
    const-string v0, "\u8ba9\u4f60\u7684\u559c\u6b22\u8131\u9896\u800c\u51fa\uff0c\u66f4\u5bb9\u6613\u914d\u5bf9"

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->k:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_2

    .line 125
    .line 126
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 127
    .line 128
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->k:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/rlf;->p:Lv/VEditText;

    .line 136
    .line 137
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->k:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->k:Ljava/lang/String;

    .line 147
    .line 148
    iput-object p1, p0, Ll/rlf;->z:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ll/rlf;->b0(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_2
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const-string v0, "\u53d1\u9001\u5e76\u559c\u6b22%s"

    .line 162
    .line 163
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-object v2, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 168
    .line 169
    invoke-virtual {v2, p1}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    new-instance p1, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .line 176
    .line 177
    iget-object v2, p0, Ll/rlf;->v:Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 195
    .line 196
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->setAnimateDirection(Z)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->i()V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 205
    .line 206
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->setTextList(Ljava/util/List;)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 210
    .line 211
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h()V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 215
    .line 216
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Ll/rlf;->p:Lv/VEditText;

    .line 232
    .line 233
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    goto :goto_0

    .line 249
    :cond_3
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Ll/rlf;->f:Lv/VLinear;

    .line 253
    .line 254
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 258
    .line 259
    const/high16 v0, 0x42600000    # 56.0f

    .line 260
    .line 261
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 269
    .line 270
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/rlf;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 274
    .line 275
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 276
    .line 277
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Ll/rlf;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 281
    .line 282
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    .line 286
    .line 287
    iget-object p1, p0, Ll/rlf;->e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 288
    .line 289
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 292
    .line 293
    invoke-virtual {v0, p3}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    xor-int/2addr v0, v2

    .line 298
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Ll/rlf;->e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 302
    .line 303
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 304
    .line 305
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 313
    .line 314
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Ll/rlf;->p:Lv/VEditText;

    .line 330
    .line 331
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 344
    .line 345
    .line 346
    iget-object p1, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 347
    .line 348
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    const-string v1, "\u53d1\u9001\u79f0\u8d5e\u5e76\u559c\u6b22%s"

    .line 357
    .line 358
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-virtual {p1, v0}, Landroid/widget/TextSwitcher;->setCurrentText(Ljava/lang/CharSequence;)V

    .line 363
    .line 364
    .line 365
    iget-object p1, p0, Ll/rlf;->p:Lv/VEditText;

    .line 366
    .line 367
    const-string v0, ""

    .line 368
    .line 369
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 370
    .line 371
    .line 372
    :goto_0
    iget-object p1, p0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 373
    .line 374
    new-instance v0, Ll/jlf;

    .line 375
    .line 376
    invoke-direct {v0, p0}, Ll/jlf;-><init>(Ll/rlf;)V

    .line 377
    .line 378
    .line 379
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 380
    .line 381
    .line 382
    iget-object p1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 383
    .line 384
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 385
    .line 386
    .line 387
    iput-boolean v3, p0, Ll/rlf;->u:Z

    .line 388
    .line 389
    iget-object p1, p0, Ll/rlf;->p:Lv/VEditText;

    .line 390
    .line 391
    new-instance v0, Ll/rlf$c;

    .line 392
    .line 393
    invoke-direct {v0, p0}, Ll/rlf$c;-><init>(Ll/rlf;)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 397
    .line 398
    .line 399
    iget-object p1, p0, Ll/rlf;->q:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 400
    .line 401
    new-instance v0, Ll/klf;

    .line 402
    .line 403
    invoke-direct {v0, p0}, Ll/klf;-><init>(Ll/rlf;)V

    .line 404
    .line 405
    .line 406
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 407
    .line 408
    .line 409
    iget-object p1, p0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 410
    .line 411
    new-instance v0, Ll/llf;

    .line 412
    .line 413
    invoke-direct {v0, p0}, Ll/llf;-><init>(Ll/rlf;)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->setOnItemClickListener(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;)V

    .line 417
    .line 418
    .line 419
    iget-object p1, p0, Ll/rlf;->k:Lv/VText;

    .line 420
    .line 421
    new-instance v0, Ll/mlf;

    .line 422
    .line 423
    invoke-direct {v0, p0}, Ll/mlf;-><init>(Ll/rlf;)V

    .line 424
    .line 425
    .line 426
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 427
    .line 428
    .line 429
    iget-object p1, p0, Ll/rlf;->n:Lv/VFrame;

    .line 430
    .line 431
    new-instance v0, Ll/nlf;

    .line 432
    .line 433
    invoke-direct {v0, p0}, Ll/nlf;-><init>(Ll/rlf;)V

    .line 434
    .line 435
    .line 436
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 437
    .line 438
    .line 439
    iget-object p1, p0, Ll/rlf;->y:Ll/eof;

    .line 440
    .line 441
    if-eqz p1, :cond_4

    .line 442
    .line 443
    invoke-interface {p1, p2, p3, p4}, Ll/eof;->c(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 444
    .line 445
    .line 446
    :cond_4
    invoke-virtual {p0}, Ll/rlf;->F()V

    .line 447
    .line 448
    .line 449
    return-void
.end method

.method public final I()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "send_game_guidance"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "send_fitness_guidance"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "send_drinking_guidance"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->e:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "send_smoking_guidance"

    .line 42
    .line 43
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 53
    return p0
.end method

.method public final synthetic K(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rlf;->z:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/rlf;->a0(Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p3, p0, Ll/rlf;->o:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    iget-object v0, p0, Ll/rlf;->A:Ll/bnl0$g;

    .line 12
    .line 13
    iget v1, v0, Ll/bnl0$g;->c:I

    .line 14
    .line 15
    int-to-float v2, v1

    .line 16
    iget-object v3, p0, Ll/rlf;->B:Ll/bnl0$g;

    .line 17
    .line 18
    iget v4, v3, Ll/bnl0$g;->c:I

    .line 19
    .line 20
    sub-int/2addr v4, v1

    .line 21
    int-to-float v1, v4

    .line 22
    const/high16 v4, 0x3f800000    # 1.0f

    .line 23
    .line 24
    sub-float/2addr v4, p1

    .line 25
    mul-float/2addr v1, v4

    .line 26
    add-float/2addr v2, v1

    .line 27
    float-to-int v1, v2

    .line 28
    iput v1, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 29
    .line 30
    iget v0, v0, Ll/bnl0$g;->d:I

    .line 31
    .line 32
    int-to-float v1, v0

    .line 33
    iget v2, v3, Ll/bnl0$g;->d:I

    .line 34
    .line 35
    sub-int/2addr v2, v0

    .line 36
    int-to-float v0, v2

    .line 37
    mul-float/2addr v0, v4

    .line 38
    add-float/2addr v1, v0

    .line 39
    float-to-int v0, v1

    .line 40
    iput v0, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 41
    .line 42
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 43
    .line 44
    iget v1, p0, Ll/rlf;->E:I

    .line 45
    .line 46
    int-to-float v2, v1

    .line 47
    iget v3, p0, Ll/rlf;->D:I

    .line 48
    .line 49
    sub-int/2addr v3, v1

    .line 50
    int-to-float v1, v3

    .line 51
    mul-float/2addr v1, v4

    .line 52
    add-float/2addr v2, v1

    .line 53
    neg-float v1, v2

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 58
    .line 59
    invoke-virtual {p0, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    sget p0, Ll/qa00;->i:I

    .line 63
    .line 64
    int-to-float p0, p0

    .line 65
    mul-float/2addr p0, p1

    .line 66
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/rlf;->A:Ll/bnl0$g;

    .line 8
    .line 9
    iget v2, v1, Ll/bnl0$g;->c:I

    .line 10
    .line 11
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 12
    .line 13
    iget v1, v1, Ll/bnl0$g;->d:I

    .line 14
    .line 15
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    iget-object v1, p0, Ll/rlf;->o:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 23
    .line 24
    iget p0, p0, Ll/rlf;->D:I

    .line 25
    .line 26
    neg-int p0, p0

    .line 27
    int-to-float p0, p0

    .line 28
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/rlf;->n:Lv/VFrame;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/rlf;->n:Lv/VFrame;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic P(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Ll/rlf;->X(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic T(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rlf;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Landroid/animation/ValueAnimator;ILandroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p4, p0, Ll/rlf;->o:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    iget-object v0, p0, Ll/rlf;->A:Ll/bnl0$g;

    .line 12
    .line 13
    iget v1, v0, Ll/bnl0$g;->c:I

    .line 14
    .line 15
    int-to-float v2, v1

    .line 16
    iget-object v3, p0, Ll/rlf;->B:Ll/bnl0$g;

    .line 17
    .line 18
    iget v4, v3, Ll/bnl0$g;->c:I

    .line 19
    .line 20
    sub-int/2addr v4, v1

    .line 21
    int-to-float v1, v4

    .line 22
    mul-float/2addr v1, p1

    .line 23
    add-float/2addr v2, v1

    .line 24
    float-to-int v1, v2

    .line 25
    iput v1, p4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 26
    .line 27
    iget v0, v0, Ll/bnl0$g;->d:I

    .line 28
    .line 29
    int-to-float v1, v0

    .line 30
    iget v2, v3, Ll/bnl0$g;->d:I

    .line 31
    .line 32
    sub-int/2addr v2, v0

    .line 33
    int-to-float v0, v2

    .line 34
    mul-float/2addr v0, p1

    .line 35
    add-float/2addr v1, v0

    .line 36
    float-to-int v0, v1

    .line 37
    iput v0, p4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 38
    .line 39
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 40
    .line 41
    invoke-virtual {v0, p4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    iget-object p4, p0, Ll/rlf;->o:Lv/VLinear;

    .line 45
    .line 46
    iget p0, p0, Ll/rlf;->E:I

    .line 47
    .line 48
    int-to-float v0, p0

    .line 49
    sub-int/2addr p2, p0

    .line 50
    int-to-float p0, p2

    .line 51
    mul-float/2addr p0, p1

    .line 52
    add-float/2addr v0, p0

    .line 53
    neg-float p0, v0

    .line 54
    invoke-virtual {p4, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 55
    .line 56
    .line 57
    sget p0, Ll/qa00;->i:I

    .line 58
    .line 59
    int-to-float p0, p0

    .line 60
    const/high16 p2, 0x3f800000    # 1.0f

    .line 61
    .line 62
    sub-float/2addr p2, p1

    .line 63
    mul-float/2addr p0, p2

    .line 64
    invoke-virtual {p3, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic W()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/rlf;->A:Ll/bnl0$g;

    .line 8
    .line 9
    iget v2, v1, Ll/bnl0$g;->c:I

    .line 10
    .line 11
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 12
    .line 13
    iget v1, v1, Ll/bnl0$g;->d:I

    .line 14
    .line 15
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    iget-object v1, p0, Ll/rlf;->o:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 23
    .line 24
    iget v1, p0, Ll/rlf;->E:I

    .line 25
    .line 26
    neg-int v1, v1

    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/rlf;->o:Lv/VLinear;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public X(I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/rlf;->u:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rlf;->C()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-lez p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/rlf;->c0(I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public Y(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/ln7;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 26
    .line 27
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 37
    .line 38
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final Z(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rlf;->w()Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "have_comment"

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "e_send_profile_like"

    .line 24
    .line 25
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final a0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/rlf;->x:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/rlf;->x:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/rlf;->y:Ll/eof;

    .line 10
    .line 11
    invoke-interface {v0, p2}, Ll/eof;->a(Z)Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/rlf;->s:Ll/clf;

    .line 24
    .line 25
    iget-object v1, p0, Ll/clf;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->toJson()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v1, v0, p1, p2}, Ll/clf;->x0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/rlf;->I()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/rlf;->s:Ll/clf;

    .line 48
    .line 49
    const-string p1, ""

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/clf;->u0(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rlf;->w()Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rlf;->k:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Ll/rlf;->G:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    cmpl-float p1, p1, v0

    .line 15
    .line 16
    iget-object p0, p0, Ll/rlf;->k:Lv/VText;

    .line 17
    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    const/high16 p1, 0x42a40000    # 82.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/high16 p1, 0x42600000    # 56.0f

    .line 31
    .line 32
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final c0(I)V
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/rlf;->A:Ll/bnl0$g;

    .line 6
    .line 7
    if-nez v2, :cond_1

    .line 8
    .line 9
    iget-object v2, v0, Ll/rlf;->k:Lv/VText;

    .line 10
    .line 11
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iput-object v2, v0, Ll/rlf;->A:Ll/bnl0$g;

    .line 16
    .line 17
    iget-object v2, v0, Ll/rlf;->o:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v0, Ll/rlf;->B:Ll/bnl0$g;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rlf;->I()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget v3, v0, Ll/rlf;->F:I

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iput v3, v0, Ll/rlf;->C:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/high16 v2, 0x41200000    # 10.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-int/2addr v3, v2

    .line 43
    iput v3, v0, Ll/rlf;->C:I

    .line 44
    .line 45
    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 46
    iput-boolean v2, v0, Ll/rlf;->u:Z

    .line 47
    .line 48
    iput v1, v0, Ll/rlf;->D:I

    .line 49
    .line 50
    iget-object v3, v0, Ll/rlf;->n:Lv/VFrame;

    .line 51
    .line 52
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    const/4 v3, 0x2

    .line 56
    new-array v4, v3, [I

    .line 57
    .line 58
    iget-object v5, v0, Ll/rlf;->i:Lv/VFrame;

    .line 59
    .line 60
    invoke-virtual {v5, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 61
    .line 62
    .line 63
    aget v4, v4, v2

    .line 64
    .line 65
    const/high16 v5, 0x429c0000    # 78.0f

    .line 66
    .line 67
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    add-int/2addr v5, v1

    .line 72
    iget-object v6, v0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 73
    .line 74
    invoke-static {v6}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    iget-object v7, v0, Ll/rlf;->i:Lv/VFrame;

    .line 79
    .line 80
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    sub-int/2addr v6, v7

    .line 85
    sub-int/2addr v6, v4

    .line 86
    iget-object v4, v0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 87
    .line 88
    invoke-static {v4}, Ll/rlf;->J(Landroid/app/Activity;)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    const/4 v7, 0x0

    .line 93
    if-eqz v4, :cond_2

    .line 94
    .line 95
    iget-object v4, v0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 96
    .line 97
    invoke-static {v4}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    goto :goto_1

    .line 102
    :cond_2
    move v4, v7

    .line 103
    :goto_1
    sub-int/2addr v6, v4

    .line 104
    sub-int/2addr v5, v6

    .line 105
    iget v4, v0, Ll/rlf;->C:I

    .line 106
    .line 107
    if-ge v4, v5, :cond_3

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_3
    iput v5, v0, Ll/rlf;->C:I

    .line 111
    .line 112
    :goto_2
    iget-object v4, v0, Ll/rlf;->B:Ll/bnl0$g;

    .line 113
    .line 114
    iget v4, v4, Ll/bnl0$g;->b:I

    .line 115
    .line 116
    iget-object v5, v0, Ll/rlf;->A:Ll/bnl0$g;

    .line 117
    .line 118
    iget v5, v5, Ll/bnl0$g;->b:I

    .line 119
    .line 120
    sub-int v6, v4, v5

    .line 121
    .line 122
    if-ge v6, v1, :cond_4

    .line 123
    .line 124
    sub-int/2addr v4, v5

    .line 125
    iput v4, v0, Ll/rlf;->E:I

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_4
    iput v1, v0, Ll/rlf;->E:I

    .line 129
    .line 130
    :goto_3
    iget-object v4, v0, Ll/rlf;->o:Lv/VLinear;

    .line 131
    .line 132
    invoke-virtual {v4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    check-cast v4, Landroid/graphics/drawable/GradientDrawable;

    .line 137
    .line 138
    new-array v5, v3, [F

    .line 139
    .line 140
    fill-array-data v5, :array_0

    .line 141
    .line 142
    .line 143
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    const-wide/16 v8, 0xc8

    .line 148
    .line 149
    invoke-virtual {v5, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    sget-object v6, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 154
    .line 155
    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 156
    .line 157
    .line 158
    new-instance v10, Ll/olf;

    .line 159
    .line 160
    invoke-direct {v10, v0, v5, v1, v4}, Ll/olf;-><init>(Ll/rlf;Landroid/animation/ValueAnimator;ILandroid/graphics/drawable/GradientDrawable;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v5, v10}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 164
    .line 165
    .line 166
    new-instance v1, Ll/plf;

    .line 167
    .line 168
    invoke-direct {v1, v0}, Ll/plf;-><init>(Ll/rlf;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v5, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0}, Ll/rlf;->I()Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    iget-object v10, v0, Ll/rlf;->q:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 179
    .line 180
    const/16 v18, 0x5

    .line 181
    .line 182
    const/16 v19, 0x4

    .line 183
    .line 184
    const/16 v20, 0x3

    .line 185
    .line 186
    const-string v11, "translationY"

    .line 187
    .line 188
    if-eqz v1, :cond_5

    .line 189
    .line 190
    new-array v1, v3, [F

    .line 191
    .line 192
    fill-array-data v1, :array_1

    .line 193
    .line 194
    .line 195
    move-object v12, v11

    .line 196
    const-string v11, "alpha"

    .line 197
    .line 198
    move-object v14, v12

    .line 199
    const-wide/16 v12, 0x0

    .line 200
    .line 201
    move-object/from16 v16, v14

    .line 202
    .line 203
    const-wide/16 v14, 0xc8

    .line 204
    .line 205
    move-object/from16 v17, v1

    .line 206
    .line 207
    move-object/from16 v1, v16

    .line 208
    .line 209
    move-object/from16 v16, v6

    .line 210
    .line 211
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 212
    .line 213
    .line 214
    move-result-object v6

    .line 215
    iget-object v10, v0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 216
    .line 217
    new-array v11, v3, [F

    .line 218
    .line 219
    fill-array-data v11, :array_2

    .line 220
    .line 221
    .line 222
    move-object/from16 v17, v11

    .line 223
    .line 224
    const-string v11, "alpha"

    .line 225
    .line 226
    const-wide/16 v14, 0x3c

    .line 227
    .line 228
    const/16 v16, 0x0

    .line 229
    .line 230
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 231
    .line 232
    .line 233
    move-result-object v10

    .line 234
    iget-object v11, v0, Ll/rlf;->k:Lv/VText;

    .line 235
    .line 236
    new-array v12, v3, [F

    .line 237
    .line 238
    fill-array-data v12, :array_3

    .line 239
    .line 240
    .line 241
    const-string v22, "alpha"

    .line 242
    .line 243
    const-wide/16 v23, 0x0

    .line 244
    .line 245
    const-wide/16 v25, 0x3c

    .line 246
    .line 247
    const/16 v27, 0x0

    .line 248
    .line 249
    move-object/from16 v21, v11

    .line 250
    .line 251
    move-object/from16 v28, v12

    .line 252
    .line 253
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 254
    .line 255
    .line 256
    move-result-object v11

    .line 257
    iget-object v12, v0, Ll/rlf;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 258
    .line 259
    new-array v13, v3, [F

    .line 260
    .line 261
    fill-array-data v13, :array_4

    .line 262
    .line 263
    .line 264
    const-string v22, "alpha"

    .line 265
    .line 266
    move-object/from16 v21, v12

    .line 267
    .line 268
    move-object/from16 v28, v13

    .line 269
    .line 270
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 271
    .line 272
    .line 273
    move-result-object v12

    .line 274
    iget-object v13, v0, Ll/rlf;->h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 275
    .line 276
    new-array v14, v3, [F

    .line 277
    .line 278
    fill-array-data v14, :array_5

    .line 279
    .line 280
    .line 281
    const-string v22, "alpha"

    .line 282
    .line 283
    move-object/from16 v21, v13

    .line 284
    .line 285
    move-object/from16 v28, v14

    .line 286
    .line 287
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 288
    .line 289
    .line 290
    move-result-object v13

    .line 291
    iget-object v14, v0, Ll/rlf;->b:Lv/VLinear;

    .line 292
    .line 293
    iget v15, v0, Ll/rlf;->C:I

    .line 294
    .line 295
    neg-int v15, v15

    .line 296
    int-to-float v15, v15

    .line 297
    const/16 p1, 0x6

    .line 298
    .line 299
    new-array v4, v2, [F

    .line 300
    .line 301
    aput v15, v4, v7

    .line 302
    .line 303
    invoke-static {v14, v1, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v1, v8, v9}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    const/4 v4, 0x7

    .line 312
    new-array v4, v4, [Landroid/animation/Animator;

    .line 313
    .line 314
    aput-object v5, v4, v7

    .line 315
    .line 316
    aput-object v6, v4, v2

    .line 317
    .line 318
    aput-object v10, v4, v3

    .line 319
    .line 320
    aput-object v11, v4, v20

    .line 321
    .line 322
    aput-object v12, v4, v19

    .line 323
    .line 324
    aput-object v13, v4, v18

    .line 325
    .line 326
    aput-object v1, v4, p1

    .line 327
    .line 328
    invoke-static {v8, v9, v4}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 333
    .line 334
    .line 335
    iget-object v1, v0, Ll/rlf;->p:Lv/VEditText;

    .line 336
    .line 337
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 338
    .line 339
    .line 340
    iget-object v8, v0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 341
    .line 342
    new-array v15, v3, [F

    .line 343
    .line 344
    fill-array-data v15, :array_6

    .line 345
    .line 346
    .line 347
    const-string v9, "alpha"

    .line 348
    .line 349
    const-wide/16 v10, 0x0

    .line 350
    .line 351
    const-wide/16 v12, 0x1e

    .line 352
    .line 353
    const/4 v14, 0x0

    .line 354
    invoke-static/range {v8 .. v15}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    new-instance v2, Ll/rlf$a;

    .line 359
    .line 360
    invoke-direct {v2, v0}, Ll/rlf$a;-><init>(Ll/rlf;)V

    .line 361
    .line 362
    .line 363
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 368
    .line 369
    .line 370
    return-void

    .line 371
    :cond_5
    move-object/from16 v16, v6

    .line 372
    .line 373
    move-object v1, v11

    .line 374
    const/16 p1, 0x6

    .line 375
    .line 376
    new-array v4, v3, [F

    .line 377
    .line 378
    fill-array-data v4, :array_7

    .line 379
    .line 380
    .line 381
    const-string v11, "alpha"

    .line 382
    .line 383
    const-wide/16 v12, 0x0

    .line 384
    .line 385
    const-wide/16 v14, 0xc8

    .line 386
    .line 387
    move-object/from16 v17, v4

    .line 388
    .line 389
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 390
    .line 391
    .line 392
    move-result-object v4

    .line 393
    iget-object v10, v0, Ll/rlf;->l:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 394
    .line 395
    new-array v6, v3, [F

    .line 396
    .line 397
    fill-array-data v6, :array_8

    .line 398
    .line 399
    .line 400
    const-string v11, "alpha"

    .line 401
    .line 402
    const-wide/16 v14, 0x3c

    .line 403
    .line 404
    const/16 v16, 0x0

    .line 405
    .line 406
    move-object/from16 v17, v6

    .line 407
    .line 408
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    iget-object v10, v0, Ll/rlf;->k:Lv/VText;

    .line 413
    .line 414
    new-array v11, v3, [F

    .line 415
    .line 416
    fill-array-data v11, :array_9

    .line 417
    .line 418
    .line 419
    move-object/from16 v17, v11

    .line 420
    .line 421
    const-string v11, "alpha"

    .line 422
    .line 423
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 424
    .line 425
    .line 426
    move-result-object v10

    .line 427
    iget-object v11, v0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 428
    .line 429
    new-array v12, v3, [F

    .line 430
    .line 431
    fill-array-data v12, :array_a

    .line 432
    .line 433
    .line 434
    const-string v22, "alpha"

    .line 435
    .line 436
    const-wide/16 v23, 0x0

    .line 437
    .line 438
    const-wide/16 v25, 0x3c

    .line 439
    .line 440
    const/16 v27, 0x0

    .line 441
    .line 442
    move-object/from16 v21, v11

    .line 443
    .line 444
    move-object/from16 v28, v12

    .line 445
    .line 446
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 447
    .line 448
    .line 449
    move-result-object v11

    .line 450
    iget-object v12, v0, Ll/rlf;->b:Lv/VLinear;

    .line 451
    .line 452
    iget v0, v0, Ll/rlf;->C:I

    .line 453
    .line 454
    neg-int v0, v0

    .line 455
    int-to-float v0, v0

    .line 456
    new-array v13, v2, [F

    .line 457
    .line 458
    aput v0, v13, v7

    .line 459
    .line 460
    invoke-static {v12, v1, v13}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    invoke-virtual {v0, v8, v9}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    move/from16 v1, p1

    .line 469
    .line 470
    new-array v1, v1, [Landroid/animation/Animator;

    .line 471
    .line 472
    aput-object v5, v1, v7

    .line 473
    .line 474
    aput-object v4, v1, v2

    .line 475
    .line 476
    aput-object v6, v1, v3

    .line 477
    .line 478
    aput-object v10, v1, v20

    .line 479
    .line 480
    aput-object v11, v1, v19

    .line 481
    .line 482
    aput-object v0, v1, v18

    .line 483
    .line 484
    invoke-static {v8, v9, v1}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 485
    .line 486
    .line 487
    move-result-object v0

    .line 488
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 489
    .line 490
    .line 491
    return-void

    .line 492
    nop

    .line 493
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    :array_6
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    :array_7
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    :array_8
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    :array_9
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    :array_a
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/clf;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rlf;->y(Ll/clf;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rlf;->v(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 6
    .line 7
    new-instance v0, Landroid/view/View;

    .line 8
    .line 9
    iget-object v1, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/ilf;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ilf;-><init>(Ll/rlf;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Ll/ln7;->b()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/rlf;->x()V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    iget-object p2, p0, Ll/rlf;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 39
    .line 40
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/c9c0;->x:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/rlf;->e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 56
    .line 57
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget v1, Ll/c9c0;->x:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/rlf;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 73
    .line 74
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v1, Ll/c9c0;->x:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Ll/rlf;->h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 90
    .line 91
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget v1, Ll/c9c0;->z:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ll/rlf;->k:Lv/VText;

    .line 107
    .line 108
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sget v1, Ll/c9c0;->z:I

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Ll/rlf;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 124
    .line 125
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget v1, Ll/c9c0;->z:I

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    .line 139
    .line 140
    iget-object p2, p0, Ll/rlf;->p:Lv/VEditText;

    .line 141
    .line 142
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    sget v1, Ll/c9c0;->x:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Ll/rlf;->p:Lv/VEditText;

    .line 158
    .line 159
    iget-object v0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    sget v1, Ll/c9c0;->z:I

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 172
    .line 173
    .line 174
    iget-object p2, p0, Ll/rlf;->p:Lv/VEditText;

    .line 175
    .line 176
    invoke-static {p2}, Ll/wpe;->a(Lv/VEditText;)V

    .line 177
    .line 178
    .line 179
    iget-object p2, p0, Ll/rlf;->q:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 180
    .line 181
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    sget v0, Ll/c9c0;->U0:I

    .line 188
    .line 189
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 194
    .line 195
    .line 196
    :cond_1
    return-object p1
.end method

.method public v(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/slf;->b(Ll/rlf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w()Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rlf;->r:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final x()V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/widget/PopupWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rlf;->w()Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/kec0;->Ae:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/rlf;->H:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public y(Ll/clf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rlf;->s:Ll/clf;

    .line 2
    .line 3
    return-void
.end method

.method public final z()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rlf;->z:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/rlf;->Z(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_3

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Ll/rlf;->z:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ll/rlf;->y:Ll/eof;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/eof;->d()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    :cond_1
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/rlf;->w()Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 90
    .line 91
    new-instance v3, Ll/hlf;

    .line 92
    .line 93
    invoke-direct {v3, p0, v0}, Ll/hlf;-><init>(Ll/rlf;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    iget-object v1, p0, Ll/rlf;->z:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    xor-int/lit8 v1, v1, 0x1

    .line 111
    .line 112
    invoke-virtual {p0, v0, v1}, Ll/rlf;->a0(Ljava/lang/String;Z)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vc()V

    .line 125
    .line 126
    .line 127
    return-void
.end method
