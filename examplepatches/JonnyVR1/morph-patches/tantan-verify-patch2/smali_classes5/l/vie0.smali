.class public Ll/vie0;
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

.method public static synthetic a(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/tie0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Ll/tie0;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Landroid/view/View;Landroid/view/View;Landroid/view/View;[I)V
    .locals 7

    .line 1
    invoke-static {p0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget p3, p3, Ll/bnl0$g;->c:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    div-int/2addr p3, v0

    .line 9
    int-to-float p3, p3

    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    aput v3, v1, v2

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    aput p3, v1, v4

    .line 18
    .line 19
    const-string v5, "translationX"

    .line 20
    .line 21
    invoke-static {p0, v5, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-array v6, v0, [F

    .line 26
    .line 27
    aput v3, v6, v2

    .line 28
    .line 29
    aput p3, v6, v4

    .line 30
    .line 31
    invoke-static {p1, v5, v6}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    new-array v2, v0, [F

    .line 36
    .line 37
    fill-array-data v2, :array_0

    .line 38
    .line 39
    .line 40
    const-string v3, "alpha"

    .line 41
    .line 42
    invoke-static {p0, v3, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-array v4, v0, [F

    .line 47
    .line 48
    fill-array-data v4, :array_1

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v3, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    filled-new-array {v1, p3, v2, v4}, [Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-static {p3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    const-wide/16 v1, 0x1f4

    .line 64
    .line 65
    invoke-virtual {p3, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    new-array v4, v0, [F

    .line 69
    .line 70
    fill-array-data v4, :array_2

    .line 71
    .line 72
    .line 73
    invoke-static {p0, v3, v4}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-array v0, v0, [F

    .line 78
    .line 79
    fill-array-data v0, :array_3

    .line 80
    .line 81
    .line 82
    invoke-static {p1, v3, v0}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    filled-new-array {p3, p0}, [Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance p1, Ll/uie0;

    .line 109
    .line 110
    invoke-direct {p1, p2}, Ll/uie0;-><init>(Landroid/view/View;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sie0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/sie0;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p1, 0x1f4

    .line 7
    .line 8
    invoke-static {p0, v0, p1, p2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
