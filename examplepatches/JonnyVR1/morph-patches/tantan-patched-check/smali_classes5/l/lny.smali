.class public Ll/lny;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 6
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "HUAWEI"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string v0, "navigationbar_is_min"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v1, "XIAOMI"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const-string v0, "force_fsg_nav_bar"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x1

    .line 31
    const/4 v3, 0x0

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0, v0, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eq p0, v2, :cond_2

    .line 43
    .line 44
    return v2

    .line 45
    :cond_2
    return v3

    .line 46
    :cond_3
    const-string v0, "window"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    return v3

    .line 55
    :cond_4
    check-cast v0, Landroid/view/WindowManager;

    .line 56
    .line 57
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Landroid/util/DisplayMetrics;

    .line 62
    .line 63
    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 67
    .line 68
    .line 69
    iget v4, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 70
    .line 71
    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 72
    .line 73
    new-instance v5, Landroid/util/DisplayMetrics;

    .line 74
    .line 75
    invoke-direct {v5}, Landroid/util/DisplayMetrics;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v5}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 79
    .line 80
    .line 81
    iget v0, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 82
    .line 83
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 84
    .line 85
    if-le v0, v5, :cond_5

    .line 86
    .line 87
    invoke-static {p0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    add-int/2addr p0, v0

    .line 92
    if-le p0, v4, :cond_6

    .line 93
    .line 94
    return v3

    .line 95
    :cond_5
    invoke-static {p0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    add-int/2addr p0, v5

    .line 100
    if-le p0, v1, :cond_6

    .line 101
    .line 102
    return v3

    .line 103
    :cond_6
    sub-int/2addr v1, v5

    .line 104
    if-gtz v1, :cond_8

    .line 105
    .line 106
    sub-int/2addr v4, v0

    .line 107
    if-lez v4, :cond_7

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_7
    return v3

    .line 111
    :cond_8
    :goto_1
    return v2
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/view/RadarRipple;Lv/VDraweeView;)Landroid/animation/Animator;
    .locals 14

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
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0x3e8

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    .line 18
    .line 19
    const/4 v8, 0x1

    .line 20
    const/high16 v9, 0x3f000000    # 0.5f

    .line 21
    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    const v3, 0x3f8f5c29    # 1.12f

    .line 25
    .line 26
    .line 27
    const/high16 v4, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const v5, 0x3f8f5c29    # 1.12f

    .line 30
    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    const/high16 v7, 0x3f000000    # 0.5f

    .line 34
    .line 35
    invoke-direct/range {v1 .. v9}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 36
    .line 37
    .line 38
    const-wide/16 v2, 0x1f4

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 41
    .line 42
    .line 43
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    .line 44
    .line 45
    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v4}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 49
    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    invoke-virtual {v1, v4}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 53
    .line 54
    .line 55
    new-instance v5, Landroid/view/animation/ScaleAnimation;

    .line 56
    .line 57
    const/4 v12, 0x1

    .line 58
    const/high16 v13, 0x3f000000    # 0.5f

    .line 59
    .line 60
    const v6, 0x3f8f5c29    # 1.12f

    .line 61
    .line 62
    .line 63
    const/high16 v7, 0x3f800000    # 1.0f

    .line 64
    .line 65
    const v8, 0x3f8f5c29    # 1.12f

    .line 66
    .line 67
    .line 68
    const/high16 v9, 0x3f800000    # 1.0f

    .line 69
    .line 70
    const/4 v10, 0x1

    .line 71
    const/high16 v11, 0x3f000000    # 0.5f

    .line 72
    .line 73
    invoke-direct/range {v5 .. v13}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    .line 80
    .line 81
    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, v2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 85
    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-virtual {v5, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ll/lny$a;

    .line 92
    .line 93
    invoke-direct {v2, p0, p1, v5}, Ll/lny$a;-><init>(Lcom/p1/mobile/putong/core/newui/view/RadarRipple;Lv/VDraweeView;Landroid/view/animation/ScaleAnimation;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 97
    .line 98
    .line 99
    const/4 v2, -0x1

    .line 100
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 101
    .line 102
    .line 103
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 104
    .line 105
    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    .line 110
    .line 111
    new-instance v2, Ll/lny$b;

    .line 112
    .line 113
    invoke-direct {v2, p1, v1, v5, p0}, Ll/lny$b;-><init>(Lv/VDraweeView;Landroid/view/animation/ScaleAnimation;Landroid/view/animation/ScaleAnimation;Lcom/p1/mobile/putong/core/newui/view/RadarRipple;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 117
    .line 118
    .line 119
    return-object v0

    .line 120
    nop

    .line 121
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
