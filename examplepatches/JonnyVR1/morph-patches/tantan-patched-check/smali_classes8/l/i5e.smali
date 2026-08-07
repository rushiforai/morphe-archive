.class public Ll/i5e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public final e:I

.field public f:Z

.field public final g:F

.field public h:Ll/zl50;

.field public i:Z


# direct methods
.method public constructor <init>(Ll/zl50;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/i5e;->f:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/i5e;->i:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/i5e;->h:Ll/zl50;

    .line 11
    .line 12
    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    int-to-float p1, p1

    .line 21
    iput p1, p0, Ll/i5e;->g:F

    .line 22
    .line 23
    const/high16 p1, 0x42c80000    # 100.0f

    .line 24
    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Ll/i5e;->e:I

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-static {p1}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_5

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eq v0, v3, :cond_1

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    if-eq v0, v3, :cond_5

    .line 14
    .line 15
    const/4 p1, 0x5

    .line 16
    if-eq v0, p1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    iput-boolean v1, p0, Ll/i5e;->i:Z

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_1
    iget-boolean v0, p0, Ll/i5e;->i:Z

    .line 25
    .line 26
    if-eqz v0, :cond_8

    .line 27
    .line 28
    iget v0, p0, Ll/i5e;->a:F

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    cmpl-float v0, v0, v1

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/i5e;->a:F

    .line 40
    .line 41
    :cond_2
    iget v0, p0, Ll/i5e;->b:F

    .line 42
    .line 43
    cmpl-float v0, v0, v1

    .line 44
    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Ll/i5e;->b:F

    .line 52
    .line 53
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-boolean v1, p0, Ll/i5e;->f:Z

    .line 62
    .line 63
    if-nez v1, :cond_4

    .line 64
    .line 65
    iget v1, p0, Ll/i5e;->b:F

    .line 66
    .line 67
    sub-float v3, p1, v1

    .line 68
    .line 69
    iget v4, p0, Ll/i5e;->g:F

    .line 70
    .line 71
    cmpl-float v3, v3, v4

    .line 72
    .line 73
    if-lez v3, :cond_4

    .line 74
    .line 75
    sub-float v1, p1, v1

    .line 76
    .line 77
    iget v3, p0, Ll/i5e;->a:F

    .line 78
    .line 79
    sub-float v3, v0, v3

    .line 80
    .line 81
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    cmpl-float v1, v1, v3

    .line 86
    .line 87
    if-lez v1, :cond_4

    .line 88
    .line 89
    iput-boolean v2, p0, Ll/i5e;->f:Z

    .line 90
    .line 91
    :cond_4
    iget-boolean v1, p0, Ll/i5e;->f:Z

    .line 92
    .line 93
    if-eqz v1, :cond_8

    .line 94
    .line 95
    iget-object v1, p0, Ll/i5e;->h:Ll/zl50;

    .line 96
    .line 97
    iget v3, p0, Ll/i5e;->a:F

    .line 98
    .line 99
    sub-float/2addr v0, v3

    .line 100
    iget p0, p0, Ll/i5e;->b:F

    .line 101
    .line 102
    sub-float/2addr p1, p0

    .line 103
    invoke-interface {v1, v0, p1}, Ll/zl50;->a(FF)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, p0, Ll/i5e;->c:F

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Ll/i5e;->d:F

    .line 118
    .line 119
    iget v0, p0, Ll/i5e;->b:F

    .line 120
    .line 121
    sub-float/2addr p1, v0

    .line 122
    iget v0, p0, Ll/i5e;->e:I

    .line 123
    .line 124
    int-to-float v0, v0

    .line 125
    cmpl-float p1, p1, v0

    .line 126
    .line 127
    if-gtz p1, :cond_7

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/i5e;->a()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_6

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_6
    iget-object p1, p0, Ll/i5e;->h:Ll/zl50;

    .line 137
    .line 138
    invoke-interface {p1, v1}, Ll/zl50;->e(Z)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_7
    :goto_0
    iget-object p1, p0, Ll/i5e;->h:Ll/zl50;

    .line 143
    .line 144
    invoke-interface {p1, v2}, Ll/zl50;->e(Z)V

    .line 145
    .line 146
    .line 147
    :goto_1
    invoke-virtual {p0, v1}, Ll/i5e;->c(Z)V

    .line 148
    .line 149
    .line 150
    :cond_8
    :goto_2
    return v2
.end method

.method public c(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/i5e;->i:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/i5e;->a:F

    .line 6
    .line 7
    iput v0, p0, Ll/i5e;->b:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/i5e;->f:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/i5e;->h:Ll/zl50;

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ll/zl50;->e(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
