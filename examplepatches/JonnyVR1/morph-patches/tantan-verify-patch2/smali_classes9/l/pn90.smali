.class public Ll/pn90;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field public final b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public c:F


# direct methods
.method public constructor <init>(Landroid/view/View;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/pn90;->c:F

    .line 7
    .line 8
    iput-object p1, p0, Ll/pn90;->a:Landroid/view/View;

    .line 9
    .line 10
    new-instance p1, Ll/in90;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Ll/in90;-><init>(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/pn90;->b:Ll/y20;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic i(Ll/pn90;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pn90;->B()V

    return-void
.end method

.method public static synthetic j(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/q3m;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/q3m;->F()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x3dcccccd    # 0.1f

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ll/q3m;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/q3m;->F()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ll/q3m;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/q3m;->F()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, Ll/q3m;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/q3m;->F()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/asj0;->d0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic l(Ll/y20;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic m(ILcom/p1/mobile/putong/core/ui/PictureView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float p0, p0

    .line 6
    mul-float/2addr v0, p0

    .line 7
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    div-float/2addr v0, p0

    .line 18
    float-to-int p0, v0

    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p0, p2, p0, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic n(Ll/pn90;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pn90;->z()V

    return-void
.end method

.method public static synthetic o(Ll/pn90;Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pn90;->A(Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method

.method public static bridge synthetic p(Ll/pn90;Ll/pf60;I)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pn90;->C(Ll/pf60;I)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method private s(Ll/q3m;)Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method private v()I
    .locals 1

    .line 1
    iget p0, p0, Ll/pn90;->c:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x41700000    # 15.0f

    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    float-to-int p0, p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p0, 0xf

    .line 15
    .line 16
    return p0
.end method

.method private w()I
    .locals 1

    .line 1
    iget p0, p0, Ll/pn90;->c:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x43c80000    # 400.0f

    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    float-to-int p0, p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p0, 0x190

    .line 15
    .line 16
    return p0
.end method


# virtual methods
.method public final synthetic A(Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 18

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    new-instance v2, Ll/ln90;

    .line 8
    .line 9
    move-object/from16 v3, p2

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ll/ln90;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ll/q3m;

    .line 20
    .line 21
    invoke-interface {v1}, Ll/q3m;->o2()V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Ll/q3m;

    .line 27
    .line 28
    invoke-interface {v1}, Ll/t3m;->Q()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Ll/q3m;

    .line 37
    .line 38
    invoke-interface {v1}, Ll/q3m;->F()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-direct/range {p0 .. p0}, Ll/pn90;->w()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-long v6, v1

    .line 47
    sget-object v8, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    new-array v9, v1, [F

    .line 51
    .line 52
    fill-array-data v9, :array_0

    .line 53
    .line 54
    .line 55
    const-string v3, "alpha"

    .line 56
    .line 57
    const-wide/16 v4, 0x0

    .line 58
    .line 59
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v3, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v3, Ll/q3m;

    .line 66
    .line 67
    invoke-interface {v3}, Ll/q3m;->F()Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-direct/range {p0 .. p0}, Ll/pn90;->w()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    int-to-long v8, v3

    .line 76
    sget-object v16, Ll/gt0;->e:Landroid/view/animation/Interpolator;

    .line 77
    .line 78
    new-array v11, v1, [F

    .line 79
    .line 80
    fill-array-data v11, :array_1

    .line 81
    .line 82
    .line 83
    const-string v5, "scaleX"

    .line 84
    .line 85
    const-wide/16 v6, 0x0

    .line 86
    .line 87
    move-object/from16 v10, v16

    .line 88
    .line 89
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    iget-object v4, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v4, Ll/q3m;

    .line 96
    .line 97
    invoke-interface {v4}, Ll/q3m;->F()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v10

    .line 101
    invoke-direct/range {p0 .. p0}, Ll/pn90;->w()I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    int-to-long v14, v4

    .line 106
    new-array v1, v1, [F

    .line 107
    .line 108
    fill-array-data v1, :array_2

    .line 109
    .line 110
    .line 111
    const-string v11, "scaleY"

    .line 112
    .line 113
    const-wide/16 v12, 0x0

    .line 114
    .line 115
    move-object/from16 v17, v1

    .line 116
    .line 117
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    filled-new-array {v3, v1, v2}, [Landroid/animation/Animator;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    new-instance v2, Ll/mn90;

    .line 130
    .line 131
    invoke-direct {v2, v0}, Ll/mn90;-><init>(Ll/pf60;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 135
    .line 136
    .line 137
    :cond_0
    return-void

    .line 138
    nop

    .line 139
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_1
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_2
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic B()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pn90;->b:Ll/y20;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final C(Ll/pf60;I)Landroid/animation/Animator;
    .locals 37
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/q3m;",
            ">;I)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ll/q3m;

    .line 8
    .line 9
    invoke-interface {v2}, Ll/q3m;->U0()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, v0, Ll/pn90;->a:Landroid/view/View;

    .line 14
    .line 15
    invoke-static {v3}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v5, Ll/q3m;

    .line 26
    .line 27
    invoke-interface {v5}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-static {v5}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iget-object v6, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v6, Ll/q3m;

    .line 38
    .line 39
    invoke-interface {v6}, Ll/q3m;->U()Ll/bnl0$g;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    iget v7, v5, Ll/bnl0$g;->d:I

    .line 44
    .line 45
    iget v6, v6, Ll/bnl0$g;->b:I

    .line 46
    .line 47
    iget v5, v5, Ll/bnl0$g;->b:I

    .line 48
    .line 49
    sub-int/2addr v6, v5

    .line 50
    sub-int/2addr v7, v6

    .line 51
    const/high16 v5, 0x41f00000    # 30.0f

    .line 52
    .line 53
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    add-int v13, v7, v5

    .line 58
    .line 59
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v5, Ll/q3m;

    .line 62
    .line 63
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-static {v5}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    iget v5, v5, Ll/bnl0$g;->a:I

    .line 72
    .line 73
    iget v6, v3, Ll/bnl0$g;->c:I

    .line 74
    .line 75
    int-to-float v6, v6

    .line 76
    const/high16 v7, 0x3f800000    # 1.0f

    .line 77
    .line 78
    mul-float/2addr v6, v7

    .line 79
    iget v8, v4, Ll/bnl0$g;->c:I

    .line 80
    .line 81
    int-to-float v8, v8

    .line 82
    div-float/2addr v6, v8

    .line 83
    iget v8, v3, Ll/bnl0$g;->d:I

    .line 84
    .line 85
    int-to-float v8, v8

    .line 86
    mul-float/2addr v8, v7

    .line 87
    iget v7, v4, Ll/bnl0$g;->d:I

    .line 88
    .line 89
    int-to-float v7, v7

    .line 90
    div-float/2addr v8, v7

    .line 91
    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    iget v9, v4, Ll/bnl0$g;->c:I

    .line 96
    .line 97
    int-to-float v9, v9

    .line 98
    mul-float/2addr v9, v7

    .line 99
    iget v10, v3, Ll/bnl0$g;->c:I

    .line 100
    .line 101
    int-to-float v10, v10

    .line 102
    sub-float/2addr v9, v10

    .line 103
    const/high16 v10, 0x40000000    # 2.0f

    .line 104
    .line 105
    div-float/2addr v9, v10

    .line 106
    float-to-int v9, v9

    .line 107
    sget-object v11, Ll/gt0;->i:Landroid/util/Property;

    .line 108
    .line 109
    const/4 v14, 0x1

    .line 110
    new-array v12, v14, [F

    .line 111
    .line 112
    const/4 v15, 0x0

    .line 113
    aput v7, v12, v15

    .line 114
    .line 115
    invoke-static {v2, v11, v12}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 116
    .line 117
    .line 118
    move-result-object v11

    .line 119
    check-cast v11, Landroid/animation/ObjectAnimator;

    .line 120
    .line 121
    cmpl-float v8, v8, v6

    .line 122
    .line 123
    iget v12, v3, Ll/bnl0$g;->a:I

    .line 124
    .line 125
    if-ltz v8, :cond_0

    .line 126
    .line 127
    iget v6, v4, Ll/bnl0$g;->a:I

    .line 128
    .line 129
    sub-int/2addr v12, v6

    .line 130
    int-to-float v6, v12

    .line 131
    iget v8, v4, Ll/bnl0$g;->c:I

    .line 132
    .line 133
    int-to-float v8, v8

    .line 134
    mul-float/2addr v8, v7

    .line 135
    iget v7, v3, Ll/bnl0$g;->c:I

    .line 136
    .line 137
    int-to-float v7, v7

    .line 138
    sub-float/2addr v8, v7

    .line 139
    div-float/2addr v8, v10

    .line 140
    sub-float/2addr v6, v8

    .line 141
    iget v3, v3, Ll/bnl0$g;->b:I

    .line 142
    .line 143
    iget v4, v4, Ll/bnl0$g;->b:I

    .line 144
    .line 145
    sub-int/2addr v3, v4

    .line 146
    int-to-float v3, v3

    .line 147
    goto :goto_0

    .line 148
    :cond_0
    iget v7, v4, Ll/bnl0$g;->a:I

    .line 149
    .line 150
    sub-int/2addr v12, v7

    .line 151
    int-to-float v7, v12

    .line 152
    iget v8, v3, Ll/bnl0$g;->b:I

    .line 153
    .line 154
    iget v12, v4, Ll/bnl0$g;->b:I

    .line 155
    .line 156
    sub-int/2addr v8, v12

    .line 157
    int-to-float v8, v8

    .line 158
    iget v4, v4, Ll/bnl0$g;->d:I

    .line 159
    .line 160
    int-to-float v4, v4

    .line 161
    mul-float/2addr v4, v6

    .line 162
    iget v3, v3, Ll/bnl0$g;->d:I

    .line 163
    .line 164
    int-to-float v3, v3

    .line 165
    sub-float/2addr v4, v3

    .line 166
    div-float/2addr v4, v10

    .line 167
    sub-float v3, v8, v4

    .line 168
    .line 169
    move v6, v7

    .line 170
    :goto_0
    new-instance v4, Ll/nn90;

    .line 171
    .line 172
    invoke-direct {v4, v9, v2}, Ll/nn90;-><init>(ILcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v11, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    int-to-long v7, v4

    .line 183
    iget-object v4, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v4, Ll/q3m;

    .line 186
    .line 187
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 188
    .line 189
    .line 190
    move-result v9

    .line 191
    invoke-virtual {v0, v4, v9, v13}, Ll/pn90;->x(Ll/q3m;II)Landroid/animation/Animator;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 196
    .line 197
    check-cast v9, Ll/q3m;

    .line 198
    .line 199
    invoke-interface {v9}, Ll/q3m;->S1()Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v16

    .line 203
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 204
    .line 205
    .line 206
    move-result v9

    .line 207
    int-to-long v9, v9

    .line 208
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 209
    .line 210
    .line 211
    move-result v12

    .line 212
    move/from16 v24, v15

    .line 213
    .line 214
    int-to-long v14, v12

    .line 215
    sget-object v31, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 216
    .line 217
    int-to-float v12, v13

    .line 218
    move/from16 v33, v3

    .line 219
    .line 220
    move-object/from16 v34, v4

    .line 221
    .line 222
    const/4 v3, 0x1

    .line 223
    new-array v4, v3, [F

    .line 224
    .line 225
    aput v12, v4, v24

    .line 226
    .line 227
    const-string v17, "translationY"

    .line 228
    .line 229
    move-object/from16 v23, v4

    .line 230
    .line 231
    move-wide/from16 v18, v9

    .line 232
    .line 233
    move-wide/from16 v20, v14

    .line 234
    .line 235
    move-object/from16 v22, v31

    .line 236
    .line 237
    invoke-static/range {v16 .. v23}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    iget-object v4, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 242
    .line 243
    check-cast v4, Ll/q3m;

    .line 244
    .line 245
    invoke-interface {v4}, Ll/q3m;->o0()Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object v25

    .line 249
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 250
    .line 251
    .line 252
    move-result v4

    .line 253
    int-to-long v9, v4

    .line 254
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    int-to-long v14, v4

    .line 259
    int-to-float v4, v5

    .line 260
    move-object/from16 v16, v3

    .line 261
    .line 262
    move/from16 v17, v4

    .line 263
    .line 264
    const/4 v3, 0x1

    .line 265
    new-array v4, v3, [F

    .line 266
    .line 267
    aput v17, v4, v24

    .line 268
    .line 269
    const-string v26, "translationX"

    .line 270
    .line 271
    move-object/from16 v32, v4

    .line 272
    .line 273
    move-wide/from16 v27, v9

    .line 274
    .line 275
    move-wide/from16 v29, v14

    .line 276
    .line 277
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 282
    .line 283
    check-cast v9, Ll/q3m;

    .line 284
    .line 285
    invoke-interface {v9}, Ll/q3m;->o0()Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v25

    .line 289
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 290
    .line 291
    .line 292
    move-result v9

    .line 293
    int-to-long v9, v9

    .line 294
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 295
    .line 296
    .line 297
    move-result v14

    .line 298
    int-to-long v14, v14

    .line 299
    move-object/from16 v17, v4

    .line 300
    .line 301
    new-array v4, v3, [F

    .line 302
    .line 303
    const/high16 v3, 0x43b40000    # 360.0f

    .line 304
    .line 305
    aput v3, v4, v24

    .line 306
    .line 307
    const-string v26, "rotation"

    .line 308
    .line 309
    move-object/from16 v32, v4

    .line 310
    .line 311
    move-wide/from16 v27, v9

    .line 312
    .line 313
    move-wide/from16 v29, v14

    .line 314
    .line 315
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    iget-object v4, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 320
    .line 321
    check-cast v4, Ll/q3m;

    .line 322
    .line 323
    invoke-interface {v4}, Ll/q3m;->J()Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v25

    .line 327
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 328
    .line 329
    .line 330
    move-result v4

    .line 331
    int-to-long v9, v4

    .line 332
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    int-to-long v14, v4

    .line 337
    neg-int v4, v5

    .line 338
    int-to-float v4, v4

    .line 339
    move-object/from16 v18, v3

    .line 340
    .line 341
    const/4 v5, 0x1

    .line 342
    new-array v3, v5, [F

    .line 343
    .line 344
    aput v4, v3, v24

    .line 345
    .line 346
    const-string v26, "translationX"

    .line 347
    .line 348
    move-object/from16 v32, v3

    .line 349
    .line 350
    move-wide/from16 v27, v9

    .line 351
    .line 352
    move-wide/from16 v29, v14

    .line 353
    .line 354
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    iget-object v4, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 359
    .line 360
    check-cast v4, Ll/q3m;

    .line 361
    .line 362
    invoke-interface {v4}, Ll/q3m;->J()Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v25

    .line 366
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 367
    .line 368
    .line 369
    move-result v4

    .line 370
    int-to-long v9, v4

    .line 371
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 372
    .line 373
    .line 374
    move-result v4

    .line 375
    int-to-long v14, v4

    .line 376
    new-array v4, v5, [F

    .line 377
    .line 378
    const/high16 v19, -0x3c4c0000    # -360.0f

    .line 379
    .line 380
    aput v19, v4, v24

    .line 381
    .line 382
    const-string v26, "rotation"

    .line 383
    .line 384
    move-object/from16 v32, v4

    .line 385
    .line 386
    move-wide/from16 v27, v9

    .line 387
    .line 388
    move-wide/from16 v29, v14

    .line 389
    .line 390
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 395
    .line 396
    check-cast v9, Ll/q3m;

    .line 397
    .line 398
    invoke-interface {v9}, Ll/q3m;->Q2()Landroid/view/View;

    .line 399
    .line 400
    .line 401
    move-result-object v25

    .line 402
    new-array v9, v5, [F

    .line 403
    .line 404
    const/4 v5, 0x0

    .line 405
    aput v5, v9, v24

    .line 406
    .line 407
    const-string v26, "alpha"

    .line 408
    .line 409
    const-wide/16 v27, 0x0

    .line 410
    .line 411
    const-wide/16 v29, 0xeb

    .line 412
    .line 413
    const/16 v31, 0x0

    .line 414
    .line 415
    move-object/from16 v32, v9

    .line 416
    .line 417
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 418
    .line 419
    .line 420
    move-result-object v5

    .line 421
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 422
    .line 423
    check-cast v9, Ll/q3m;

    .line 424
    .line 425
    move-object v10, v11

    .line 426
    const/4 v11, 0x0

    .line 427
    move v14, v12

    .line 428
    const/4 v12, 0x0

    .line 429
    move-wide/from16 v19, v7

    .line 430
    .line 431
    move-object v8, v9

    .line 432
    const/4 v9, 0x0

    .line 433
    move-object v7, v10

    .line 434
    const/16 v10, 0xeb

    .line 435
    .line 436
    move-wide/from16 v35, v19

    .line 437
    .line 438
    move/from16 v19, v14

    .line 439
    .line 440
    move-wide/from16 v14, v35

    .line 441
    .line 442
    invoke-static/range {v8 .. v13}, Ll/pza0;->e(Ll/q3m;IILandroid/view/animation/Interpolator;II)Landroid/animation/Animator;

    .line 443
    .line 444
    .line 445
    move-result-object v8

    .line 446
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 447
    .line 448
    check-cast v9, Ll/q3m;

    .line 449
    .line 450
    invoke-interface {v9}, Ll/q3m;->y1()Landroid/view/View;

    .line 451
    .line 452
    .line 453
    move-result-object v25

    .line 454
    const/4 v9, 0x1

    .line 455
    new-array v10, v9, [F

    .line 456
    .line 457
    aput v19, v10, v24

    .line 458
    .line 459
    const-string v26, "translationY"

    .line 460
    .line 461
    move-object/from16 v32, v10

    .line 462
    .line 463
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 464
    .line 465
    .line 466
    move-result-object v10

    .line 467
    iget-object v11, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 468
    .line 469
    check-cast v11, Ll/q3m;

    .line 470
    .line 471
    invoke-interface {v11}, Ll/q3m;->q2()Landroid/view/View;

    .line 472
    .line 473
    .line 474
    move-result-object v25

    .line 475
    new-array v11, v9, [F

    .line 476
    .line 477
    aput v19, v11, v24

    .line 478
    .line 479
    const-string v26, "translationY"

    .line 480
    .line 481
    move-object/from16 v32, v11

    .line 482
    .line 483
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 484
    .line 485
    .line 486
    move-result-object v11

    .line 487
    new-array v12, v9, [F

    .line 488
    .line 489
    aput v6, v12, v24

    .line 490
    .line 491
    const-string v6, "translationX"

    .line 492
    .line 493
    invoke-static {v2, v6, v12}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 494
    .line 495
    .line 496
    move-result-object v6

    .line 497
    new-array v12, v9, [F

    .line 498
    .line 499
    aput v33, v12, v24

    .line 500
    .line 501
    const-string v13, "translationY"

    .line 502
    .line 503
    invoke-static {v2, v13, v12}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    const/16 v12, 0xa

    .line 508
    .line 509
    invoke-static {v12}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 510
    .line 511
    .line 512
    move-result-object v13

    .line 513
    move/from16 p2, v9

    .line 514
    .line 515
    const/16 v9, 0xe

    .line 516
    .line 517
    new-array v9, v9, [Landroid/animation/Animator;

    .line 518
    .line 519
    aput-object v34, v9, v24

    .line 520
    .line 521
    aput-object v16, v9, p2

    .line 522
    .line 523
    const/16 v16, 0x2

    .line 524
    .line 525
    aput-object v17, v9, v16

    .line 526
    .line 527
    const/16 v16, 0x3

    .line 528
    .line 529
    aput-object v18, v9, v16

    .line 530
    .line 531
    const/16 v16, 0x4

    .line 532
    .line 533
    aput-object v3, v9, v16

    .line 534
    .line 535
    const/4 v3, 0x5

    .line 536
    aput-object v4, v9, v3

    .line 537
    .line 538
    const/4 v3, 0x6

    .line 539
    aput-object v5, v9, v3

    .line 540
    .line 541
    const/4 v3, 0x7

    .line 542
    aput-object v8, v9, v3

    .line 543
    .line 544
    const/16 v3, 0x8

    .line 545
    .line 546
    aput-object v10, v9, v3

    .line 547
    .line 548
    const/16 v3, 0x9

    .line 549
    .line 550
    aput-object v11, v9, v3

    .line 551
    .line 552
    aput-object v7, v9, v12

    .line 553
    .line 554
    const/16 v3, 0xb

    .line 555
    .line 556
    aput-object v6, v9, v3

    .line 557
    .line 558
    const/16 v3, 0xc

    .line 559
    .line 560
    aput-object v2, v9, v3

    .line 561
    .line 562
    const/16 v2, 0xd

    .line 563
    .line 564
    aput-object v13, v9, v2

    .line 565
    .line 566
    invoke-static {v14, v15, v9}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 567
    .line 568
    .line 569
    move-result-object v2

    .line 570
    filled-new-array {v2}, [Landroid/animation/Animator;

    .line 571
    .line 572
    .line 573
    move-result-object v2

    .line 574
    invoke-static {v2}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 575
    .line 576
    .line 577
    move-result-object v2

    .line 578
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 579
    .line 580
    check-cast v1, Ll/q3m;

    .line 581
    .line 582
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    new-instance v3, Ll/o2h0;

    .line 586
    .line 587
    invoke-direct {v3, v1}, Ll/o2h0;-><init>(Ll/q3m;)V

    .line 588
    .line 589
    .line 590
    invoke-static {v2, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 591
    .line 592
    .line 593
    new-instance v1, Ll/on90;

    .line 594
    .line 595
    invoke-direct {v1, v0}, Ll/on90;-><init>(Ll/pn90;)V

    .line 596
    .line 597
    .line 598
    invoke-static {v2, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 599
    .line 600
    .line 601
    return-object v2
.end method

.method public bridge synthetic a(Ljava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pn90;->r(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/pn90;->t(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/pn90;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final q()I
    .locals 1

    .line 1
    iget p0, p0, Ll/pn90;->c:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const v0, 0x43898000    # 275.0f

    .line 10
    .line 11
    .line 12
    mul-float/2addr p0, v0

    .line 13
    float-to-int p0, p0

    .line 14
    return p0

    .line 15
    :cond_0
    const/16 p0, 0x113

    .line 16
    .line 17
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public t(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
    .locals 37

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p2}, Ll/pn90;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ll/q3m;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-interface {v2, v3}, Ll/q3m;->r3(I)Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    new-instance v5, Ll/jn90;

    .line 27
    .line 28
    invoke-direct {v5, v0}, Ll/jn90;-><init>(Ll/pn90;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, v0, Ll/pn90;->a:Landroid/view/View;

    .line 35
    .line 36
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v4}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-static {v4, v2, v5}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v2, Ll/q3m;

    .line 50
    .line 51
    invoke-interface {v2}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v5, Ll/q3m;

    .line 62
    .line 63
    invoke-interface {v5}, Ll/q3m;->U()Ll/bnl0$g;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-static {v4}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    iget v6, v2, Ll/bnl0$g;->d:I

    .line 71
    .line 72
    iget v5, v5, Ll/bnl0$g;->b:I

    .line 73
    .line 74
    iget v2, v2, Ll/bnl0$g;->b:I

    .line 75
    .line 76
    sub-int/2addr v5, v2

    .line 77
    sub-int/2addr v6, v5

    .line 78
    const/high16 v2, 0x41f00000    # 30.0f

    .line 79
    .line 80
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    add-int v11, v6, v2

    .line 85
    .line 86
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v2, Ll/q3m;

    .line 89
    .line 90
    invoke-interface {v2}, Ll/q3m;->o0()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iget v2, v2, Ll/bnl0$g;->a:I

    .line 99
    .line 100
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v5, Ll/q3m;

    .line 103
    .line 104
    invoke-interface {v5}, Ll/q3m;->B1()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    if-eqz v6, :cond_0

    .line 117
    .line 118
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    check-cast v6, Landroid/view/View;

    .line 123
    .line 124
    int-to-float v7, v11

    .line 125
    invoke-virtual {v6, v7}, Landroid/view/View;->setTranslationY(F)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast v5, Ll/q3m;

    .line 132
    .line 133
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    int-to-float v6, v2

    .line 138
    invoke-virtual {v5, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 139
    .line 140
    .line 141
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast v5, Ll/q3m;

    .line 144
    .line 145
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    const/high16 v6, 0x43b40000    # 360.0f

    .line 150
    .line 151
    invoke-virtual {v5, v6}, Landroid/view/View;->setRotation(F)V

    .line 152
    .line 153
    .line 154
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast v5, Ll/q3m;

    .line 157
    .line 158
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    neg-int v2, v2

    .line 163
    int-to-float v2, v2

    .line 164
    invoke-virtual {v5, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 165
    .line 166
    .line 167
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 168
    .line 169
    check-cast v2, Ll/q3m;

    .line 170
    .line 171
    invoke-interface {v2}, Ll/q3m;->J()Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    const/high16 v5, -0x3c4c0000    # -360.0f

    .line 176
    .line 177
    invoke-virtual {v2, v5}, Landroid/view/View;->setRotation(F)V

    .line 178
    .line 179
    .line 180
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v2, Ll/q3m;

    .line 183
    .line 184
    invoke-interface {v2}, Ll/q3m;->S1()Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    int-to-float v5, v11

    .line 189
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 190
    .line 191
    .line 192
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 193
    .line 194
    check-cast v2, Ll/q3m;

    .line 195
    .line 196
    invoke-interface {v2}, Ll/q3m;->F()Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const/4 v13, 0x0

    .line 201
    invoke-virtual {v2, v13}, Landroid/view/View;->setTranslationY(F)V

    .line 202
    .line 203
    .line 204
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 205
    .line 206
    check-cast v2, Ll/q3m;

    .line 207
    .line 208
    invoke-interface {v2}, Ll/q3m;->y1()Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 213
    .line 214
    .line 215
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 216
    .line 217
    check-cast v2, Ll/q3m;

    .line 218
    .line 219
    invoke-interface {v2}, Ll/q3m;->q2()Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 224
    .line 225
    .line 226
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v2, Ll/q3m;

    .line 229
    .line 230
    invoke-interface {v2}, Ll/q3m;->Q2()Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v2, v13}, Landroid/view/View;->setAlpha(F)V

    .line 235
    .line 236
    .line 237
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 238
    .line 239
    check-cast v2, Ll/q3m;

    .line 240
    .line 241
    invoke-interface {v2}, Ll/q3m;->Q2()Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    const/4 v14, 0x1

    .line 246
    new-array v5, v14, [F

    .line 247
    .line 248
    const/high16 v15, 0x3f800000    # 1.0f

    .line 249
    .line 250
    aput v15, v5, v3

    .line 251
    .line 252
    const-string v6, "alpha"

    .line 253
    .line 254
    invoke-static {v2, v6, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 255
    .line 256
    .line 257
    move-result-object v16

    .line 258
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 259
    .line 260
    check-cast v2, Ll/q3m;

    .line 261
    .line 262
    invoke-interface {v2}, Ll/q3m;->S1()Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v17

    .line 266
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    int-to-long v5, v2

    .line 271
    invoke-direct {v0}, Ll/pn90;->w()I

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    int-to-long v7, v2

    .line 276
    sget-object v24, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 277
    .line 278
    new-array v2, v14, [F

    .line 279
    .line 280
    aput v13, v2, v3

    .line 281
    .line 282
    const-string v18, "translationY"

    .line 283
    .line 284
    move-wide/from16 v19, v5

    .line 285
    .line 286
    move-wide/from16 v21, v7

    .line 287
    .line 288
    move-object/from16 v23, v24

    .line 289
    .line 290
    move-object/from16 v24, v2

    .line 291
    .line 292
    invoke-static/range {v17 .. v24}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 293
    .line 294
    .line 295
    move-result-object v17

    .line 296
    move-object/from16 v24, v23

    .line 297
    .line 298
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 299
    .line 300
    check-cast v2, Ll/q3m;

    .line 301
    .line 302
    invoke-direct {v0, v2}, Ll/pn90;->s(Ll/q3m;)Landroid/animation/Animator;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 307
    .line 308
    check-cast v5, Ll/q3m;

    .line 309
    .line 310
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 311
    .line 312
    .line 313
    move-result-object v18

    .line 314
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 315
    .line 316
    .line 317
    move-result v5

    .line 318
    int-to-long v5, v5

    .line 319
    invoke-direct {v0}, Ll/pn90;->w()I

    .line 320
    .line 321
    .line 322
    move-result v7

    .line 323
    int-to-long v7, v7

    .line 324
    new-array v9, v14, [F

    .line 325
    .line 326
    aput v13, v9, v3

    .line 327
    .line 328
    const-string v19, "translationX"

    .line 329
    .line 330
    move-wide/from16 v20, v5

    .line 331
    .line 332
    move-wide/from16 v22, v7

    .line 333
    .line 334
    move-object/from16 v25, v9

    .line 335
    .line 336
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 337
    .line 338
    .line 339
    move-result-object v26

    .line 340
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 341
    .line 342
    check-cast v5, Ll/q3m;

    .line 343
    .line 344
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v18

    .line 348
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 349
    .line 350
    .line 351
    move-result v5

    .line 352
    int-to-long v5, v5

    .line 353
    invoke-direct {v0}, Ll/pn90;->w()I

    .line 354
    .line 355
    .line 356
    move-result v7

    .line 357
    int-to-long v7, v7

    .line 358
    new-array v9, v14, [F

    .line 359
    .line 360
    aput v13, v9, v3

    .line 361
    .line 362
    const-string v19, "rotation"

    .line 363
    .line 364
    move-wide/from16 v20, v5

    .line 365
    .line 366
    move-wide/from16 v22, v7

    .line 367
    .line 368
    move-object/from16 v25, v9

    .line 369
    .line 370
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 371
    .line 372
    .line 373
    move-result-object v27

    .line 374
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 375
    .line 376
    check-cast v5, Ll/q3m;

    .line 377
    .line 378
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 379
    .line 380
    .line 381
    move-result-object v18

    .line 382
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 383
    .line 384
    .line 385
    move-result v5

    .line 386
    int-to-long v5, v5

    .line 387
    invoke-direct {v0}, Ll/pn90;->w()I

    .line 388
    .line 389
    .line 390
    move-result v7

    .line 391
    int-to-long v7, v7

    .line 392
    new-array v9, v14, [F

    .line 393
    .line 394
    aput v13, v9, v3

    .line 395
    .line 396
    const-string v19, "translationX"

    .line 397
    .line 398
    move-wide/from16 v20, v5

    .line 399
    .line 400
    move-wide/from16 v22, v7

    .line 401
    .line 402
    move-object/from16 v25, v9

    .line 403
    .line 404
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 405
    .line 406
    .line 407
    move-result-object v28

    .line 408
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 409
    .line 410
    check-cast v5, Ll/q3m;

    .line 411
    .line 412
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 413
    .line 414
    .line 415
    move-result-object v18

    .line 416
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 417
    .line 418
    .line 419
    move-result v5

    .line 420
    int-to-long v5, v5

    .line 421
    invoke-direct {v0}, Ll/pn90;->w()I

    .line 422
    .line 423
    .line 424
    move-result v7

    .line 425
    int-to-long v7, v7

    .line 426
    new-array v9, v14, [F

    .line 427
    .line 428
    aput v13, v9, v3

    .line 429
    .line 430
    const-string v19, "rotation"

    .line 431
    .line 432
    move-wide/from16 v20, v5

    .line 433
    .line 434
    move-wide/from16 v22, v7

    .line 435
    .line 436
    move-object/from16 v25, v9

    .line 437
    .line 438
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 439
    .line 440
    .line 441
    move-result-object v22

    .line 442
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 443
    .line 444
    move-object v7, v5

    .line 445
    check-cast v7, Ll/q3m;

    .line 446
    .line 447
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 448
    .line 449
    .line 450
    move-result v8

    .line 451
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 452
    .line 453
    .line 454
    move-result v9

    .line 455
    sget-object v35, Ll/gt0;->c:Landroid/view/animation/Interpolator;

    .line 456
    .line 457
    const/4 v12, 0x0

    .line 458
    move-object/from16 v10, v35

    .line 459
    .line 460
    invoke-static/range {v7 .. v12}, Ll/pza0;->e(Ll/q3m;IILandroid/view/animation/Interpolator;II)Landroid/animation/Animator;

    .line 461
    .line 462
    .line 463
    move-result-object v23

    .line 464
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 465
    .line 466
    check-cast v5, Ll/q3m;

    .line 467
    .line 468
    invoke-interface {v5}, Ll/q3m;->y1()Landroid/view/View;

    .line 469
    .line 470
    .line 471
    move-result-object v29

    .line 472
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 473
    .line 474
    .line 475
    move-result v5

    .line 476
    int-to-long v5, v5

    .line 477
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 478
    .line 479
    .line 480
    move-result v7

    .line 481
    int-to-long v7, v7

    .line 482
    new-array v9, v14, [F

    .line 483
    .line 484
    aput v13, v9, v3

    .line 485
    .line 486
    const-string v30, "translationY"

    .line 487
    .line 488
    move-wide/from16 v31, v5

    .line 489
    .line 490
    move-wide/from16 v33, v7

    .line 491
    .line 492
    move-object/from16 v36, v9

    .line 493
    .line 494
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 495
    .line 496
    .line 497
    move-result-object v24

    .line 498
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 499
    .line 500
    check-cast v5, Ll/q3m;

    .line 501
    .line 502
    invoke-interface {v5}, Ll/q3m;->q2()Landroid/view/View;

    .line 503
    .line 504
    .line 505
    move-result-object v29

    .line 506
    invoke-direct {v0}, Ll/pn90;->v()I

    .line 507
    .line 508
    .line 509
    move-result v5

    .line 510
    int-to-long v5, v5

    .line 511
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 512
    .line 513
    .line 514
    move-result v7

    .line 515
    int-to-long v7, v7

    .line 516
    new-array v9, v14, [F

    .line 517
    .line 518
    aput v13, v9, v3

    .line 519
    .line 520
    const-string v30, "translationY"

    .line 521
    .line 522
    move-wide/from16 v31, v5

    .line 523
    .line 524
    move-wide/from16 v33, v7

    .line 525
    .line 526
    move-object/from16 v36, v9

    .line 527
    .line 528
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 529
    .line 530
    .line 531
    move-result-object v25

    .line 532
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 533
    .line 534
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 535
    .line 536
    .line 537
    move-result v6

    .line 538
    int-to-long v8, v6

    .line 539
    sget-object v35, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 540
    .line 541
    new-array v11, v14, [F

    .line 542
    .line 543
    aput v15, v11, v3

    .line 544
    .line 545
    const-wide/16 v6, 0x0

    .line 546
    .line 547
    move-object/from16 v10, v35

    .line 548
    .line 549
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 550
    .line 551
    .line 552
    move-result-object v12

    .line 553
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 554
    .line 555
    .line 556
    move-result v5

    .line 557
    int-to-long v8, v5

    .line 558
    new-array v11, v14, [F

    .line 559
    .line 560
    aput v13, v11, v3

    .line 561
    .line 562
    const-string v5, "translationX"

    .line 563
    .line 564
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 565
    .line 566
    .line 567
    move-result-object v18

    .line 568
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 569
    .line 570
    .line 571
    move-result v5

    .line 572
    int-to-long v8, v5

    .line 573
    new-array v11, v14, [F

    .line 574
    .line 575
    aput v13, v11, v3

    .line 576
    .line 577
    const-string v5, "translationY"

    .line 578
    .line 579
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 580
    .line 581
    .line 582
    move-result-object v5

    .line 583
    iget-object v6, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 584
    .line 585
    check-cast v6, Ll/q3m;

    .line 586
    .line 587
    invoke-interface {v6}, Ll/q3m;->w3()Landroid/view/View;

    .line 588
    .line 589
    .line 590
    move-result-object v29

    .line 591
    sget-object v30, Ll/gt0;->i:Landroid/util/Property;

    .line 592
    .line 593
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 594
    .line 595
    .line 596
    move-result v6

    .line 597
    int-to-long v6, v6

    .line 598
    new-array v8, v14, [F

    .line 599
    .line 600
    aput v15, v8, v3

    .line 601
    .line 602
    const-wide/16 v31, 0x0

    .line 603
    .line 604
    move-wide/from16 v33, v6

    .line 605
    .line 606
    move-object/from16 v36, v8

    .line 607
    .line 608
    invoke-static/range {v29 .. v36}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 609
    .line 610
    .line 611
    move-result-object v6

    .line 612
    iget-object v7, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 613
    .line 614
    check-cast v7, Ll/q3m;

    .line 615
    .line 616
    invoke-interface {v7}, Ll/q3m;->w3()Landroid/view/View;

    .line 617
    .line 618
    .line 619
    move-result-object v29

    .line 620
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 621
    .line 622
    .line 623
    move-result v7

    .line 624
    int-to-long v7, v7

    .line 625
    new-array v9, v14, [F

    .line 626
    .line 627
    aput v13, v9, v3

    .line 628
    .line 629
    const-string v30, "translationX"

    .line 630
    .line 631
    move-wide/from16 v33, v7

    .line 632
    .line 633
    move-object/from16 v36, v9

    .line 634
    .line 635
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 636
    .line 637
    .line 638
    move-result-object v7

    .line 639
    iget-object v8, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 640
    .line 641
    check-cast v8, Ll/q3m;

    .line 642
    .line 643
    invoke-interface {v8}, Ll/q3m;->w3()Landroid/view/View;

    .line 644
    .line 645
    .line 646
    move-result-object v29

    .line 647
    invoke-virtual {v0}, Ll/pn90;->q()I

    .line 648
    .line 649
    .line 650
    move-result v8

    .line 651
    int-to-long v8, v8

    .line 652
    new-array v10, v14, [F

    .line 653
    .line 654
    aput v13, v10, v3

    .line 655
    .line 656
    const-string v30, "translationY"

    .line 657
    .line 658
    move-wide/from16 v33, v8

    .line 659
    .line 660
    move-object/from16 v36, v10

    .line 661
    .line 662
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 663
    .line 664
    .line 665
    move-result-object v31

    .line 666
    move-object/from16 v29, v6

    .line 667
    .line 668
    move-object/from16 v30, v7

    .line 669
    .line 670
    move-object/from16 v19, v26

    .line 671
    .line 672
    move-object/from16 v20, v27

    .line 673
    .line 674
    move-object/from16 v21, v28

    .line 675
    .line 676
    move-object/from16 v28, v5

    .line 677
    .line 678
    move-object/from16 v26, v12

    .line 679
    .line 680
    move-object/from16 v27, v18

    .line 681
    .line 682
    move-object/from16 v18, v2

    .line 683
    .line 684
    filled-new-array/range {v16 .. v31}, [Landroid/animation/Animator;

    .line 685
    .line 686
    .line 687
    move-result-object v2

    .line 688
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 689
    .line 690
    .line 691
    move-result-object v2

    .line 692
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 693
    .line 694
    check-cast v3, Ll/q3m;

    .line 695
    .line 696
    invoke-interface {v3}, Ll/t3m;->Q()Z

    .line 697
    .line 698
    .line 699
    move-result v3

    .line 700
    if-eqz v3, :cond_1

    .line 701
    .line 702
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 703
    .line 704
    check-cast v3, Ll/q3m;

    .line 705
    .line 706
    invoke-interface {v3}, Ll/q3m;->F()Landroid/view/View;

    .line 707
    .line 708
    .line 709
    move-result-object v3

    .line 710
    invoke-virtual {v3, v13}, Landroid/view/View;->setAlpha(F)V

    .line 711
    .line 712
    .line 713
    :cond_1
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 714
    .line 715
    check-cast v3, Ll/q3m;

    .line 716
    .line 717
    invoke-interface {v3}, Ll/q3m;->k3()V

    .line 718
    .line 719
    .line 720
    new-instance v3, Ll/kn90;

    .line 721
    .line 722
    invoke-direct {v3, v0, v1, v4}, Ll/kn90;-><init>(Ll/pn90;Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 723
    .line 724
    .line 725
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 726
    .line 727
    .line 728
    move-result-object v0

    .line 729
    return-object v0

    .line 730
    :cond_2
    const/4 v0, 0x0

    .line 731
    return-object v0
.end method

.method public u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
    .locals 8

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pn90;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    iget-object p1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/q3m;

    .line 8
    .line 9
    invoke-interface {p1}, Ll/q3m;->c0()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    iget-object p1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ll/q3m;

    .line 16
    .line 17
    invoke-interface {p1}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 p2, 0x0

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    return-object p2

    .line 25
    :cond_0
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ll/q3m;

    .line 28
    .line 29
    invoke-interface {v0}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lv/VPager;->b0()V

    .line 34
    .line 35
    .line 36
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Ll/q3m;

    .line 39
    .line 40
    invoke-interface {v0}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Ll/bnl0;->u(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v0, Ll/q3m;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/bnl0;->v(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Ll/q3m;

    .line 61
    .line 62
    invoke-interface {v0}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v1, Ll/q3m;

    .line 73
    .line 74
    invoke-interface {v1}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/4 v2, 0x0

    .line 79
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 80
    .line 81
    .line 82
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 83
    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_1

    .line 91
    .line 92
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_1

    .line 99
    .line 100
    invoke-virtual {p0, v4, v5}, Ll/pn90;->C(Ll/pf60;I)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_1
    const/16 p1, 0xbb8

    .line 106
    .line 107
    invoke-static {p1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-static {}, Ll/bnl0;->y0()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    int-to-float p1, p1

    .line 116
    const v0, 0x3f4ccccd    # 0.8f

    .line 117
    .line 118
    .line 119
    div-float/2addr p1, v0

    .line 120
    float-to-int v3, p1

    .line 121
    iget-object p1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Ll/q3m;

    .line 124
    .line 125
    invoke-interface {p1}, Ll/t3m;->i3()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    move v0, v2

    .line 130
    add-int v2, v3, p1

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/pn90;->q()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    int-to-float p1, p1

    .line 137
    int-to-float v7, v2

    .line 138
    div-float/2addr p1, v7

    .line 139
    int-to-float v7, v1

    .line 140
    mul-float/2addr p1, v7

    .line 141
    float-to-int p1, p1

    .line 142
    int-to-float p1, p1

    .line 143
    sub-float p1, v7, p1

    .line 144
    .line 145
    div-float/2addr p1, v7

    .line 146
    iput p1, p0, Ll/pn90;->c:F

    .line 147
    .line 148
    const v7, 0x3c23d70a    # 0.01f

    .line 149
    .line 150
    .line 151
    cmpg-float p1, p1, v7

    .line 152
    .line 153
    if-gtz p1, :cond_2

    .line 154
    .line 155
    iput v7, p0, Ll/pn90;->c:F

    .line 156
    .line 157
    :cond_2
    filled-new-array {v2, v0}, [I

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    int-to-long v0, v1

    .line 166
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 170
    .line 171
    .line 172
    new-instance v0, Ll/pn90$a;

    .line 173
    .line 174
    move-object v1, p0

    .line 175
    invoke-direct/range {v0 .. v6}, Ll/pn90$a;-><init>(Ll/pn90;IILl/pf60;ILandroid/animation/Animator;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 179
    .line 180
    .line 181
    new-instance p0, Ll/l2h0;

    .line 182
    .line 183
    invoke-direct {p0, p1}, Ll/l2h0;-><init>(Landroid/animation/ValueAnimator;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v6, p0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 187
    .line 188
    .line 189
    return-object v6
.end method

.method public final x(Ll/q3m;II)Landroid/animation/Animator;
    .locals 11

    .line 1
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/high16 v2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    cmpg-float v2, v1, v2

    .line 23
    .line 24
    if-gez v2, :cond_0

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 45
    .line 46
    .line 47
    :cond_1
    move v8, v1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move v8, v2

    .line 50
    :goto_0
    invoke-interface {p1}, Ll/t3m;->Q()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    int-to-long v4, p2

    .line 57
    sget-object v6, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 58
    .line 59
    const/4 p1, 0x2

    .line 60
    new-array v7, p1, [F

    .line 61
    .line 62
    aput v8, v7, p0

    .line 63
    .line 64
    const/4 p2, 0x0

    .line 65
    const/4 p3, 0x1

    .line 66
    aput p2, v7, p3

    .line 67
    .line 68
    const-string v1, "alpha"

    .line 69
    .line 70
    const-wide/16 v2, 0x0

    .line 71
    .line 72
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    new-array v7, p1, [F

    .line 77
    .line 78
    aput v8, v7, p0

    .line 79
    .line 80
    const v9, 0x3dcccccd    # 0.1f

    .line 81
    .line 82
    .line 83
    aput v9, v7, p3

    .line 84
    .line 85
    const-string v1, "scaleX"

    .line 86
    .line 87
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    new-array v7, p1, [F

    .line 92
    .line 93
    aput v8, v7, p0

    .line 94
    .line 95
    aput v9, v7, p3

    .line 96
    .line 97
    const-string v1, "scaleY"

    .line 98
    .line 99
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    filled-new-array {v10, p0, p2}, [Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_3
    return-object p3
.end method

.method public y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;",
            ")",
            "Ll/pf60<",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/q3m;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pn90;->b:Ll/y20;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
