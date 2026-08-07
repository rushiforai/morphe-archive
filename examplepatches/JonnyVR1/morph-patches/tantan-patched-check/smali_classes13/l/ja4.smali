.class public Ll/ja4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xpl$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ja4$a;
    }
.end annotation


# instance fields
.field final a:I

.field private b:Ll/ja4$a;

.field private c:Ll/xpl;

.field d:I

.field private e:Landroid/graphics/Rect;

.field private f:Landroid/graphics/SurfaceTexture;

.field private g:Ll/tow;


# direct methods
.method public constructor <init>(Ll/tow;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12f

    .line 5
    .line 6
    iput v0, p0, Ll/ja4;->a:I

    .line 7
    .line 8
    const/16 v0, 0x3c

    .line 9
    .line 10
    iput v0, p0, Ll/ja4;->d:I

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ja4;->e:Landroid/graphics/Rect;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/ja4;->f:Landroid/graphics/SurfaceTexture;

    .line 22
    .line 23
    iput-object p1, p0, Ll/ja4;->g:Ll/tow;

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Ll/ja4;->l(Ll/tow;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private b(III)I
    .locals 0

    .line 1
    if-le p1, p3, :cond_0

    .line 2
    .line 3
    return p3

    .line 4
    :cond_0
    if-ge p1, p2, :cond_1

    .line 5
    .line 6
    return p2

    .line 7
    :cond_1
    return p1
.end method

.method private n(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    sub-float/2addr v2, v0

    .line 22
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v2, p0, Ll/ja4;->d:I

    .line 27
    .line 28
    int-to-float v2, v2

    .line 29
    cmpl-float v0, v0, v2

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    if-gtz v0, :cond_2

    .line 33
    .line 34
    sub-float/2addr v3, v1

    .line 35
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget v1, p0, Ll/ja4;->d:I

    .line 40
    .line 41
    int-to-float v1, v1

    .line 42
    cmpl-float v0, v0, v1

    .line 43
    .line 44
    if-lez v0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    sub-int/2addr v0, v1

    .line 52
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v1, p0, Ll/ja4;->d:I

    .line 57
    .line 58
    if-gt v0, v1, :cond_2

    .line 59
    .line 60
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 61
    .line 62
    iget v1, p2, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    sub-int/2addr v0, v1

    .line 65
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget v1, p0, Ll/ja4;->d:I

    .line 70
    .line 71
    if-gt v0, v1, :cond_2

    .line 72
    .line 73
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 74
    .line 75
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    sub-int/2addr v0, v1

    .line 78
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget v1, p0, Ll/ja4;->d:I

    .line 83
    .line 84
    if-gt v0, v1, :cond_2

    .line 85
    .line 86
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 87
    .line 88
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 89
    .line 90
    sub-int/2addr p1, p2

    .line 91
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget p0, p0, Ll/ja4;->d:I

    .line 96
    .line 97
    if-le p1, p0, :cond_1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    const/4 p0, 0x0

    .line 101
    return p0

    .line 102
    :cond_2
    :goto_0
    return v2
.end method

.method private q(Landroid/graphics/RectF;)Landroid/graphics/Rect;
    .locals 3

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p1, Landroid/graphics/RectF;->right:F

    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-direct {p0, v0, v1, v2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xpl;->b(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B(Landroid/graphics/SurfaceTexture;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/ja4;->f:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/xpl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public C(ILl/row;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/xpl;->E(ILl/row;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public a(FFLandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 5

    .line 1
    new-instance v0, Ll/gu6;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ja4;->c:Ll/xpl;

    .line 4
    .line 5
    check-cast v1, Ll/ciw;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/ciw;->V()Landroid/hardware/camera2/CameraCharacteristics;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v2, p3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Ll/gu6;-><init>(Landroid/hardware/camera2/CameraCharacteristics;Landroid/graphics/RectF;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    div-int/lit8 v1, v1, 0x5

    .line 24
    .line 25
    float-to-int p1, p1

    .line 26
    div-int/lit8 v2, v1, 0x2

    .line 27
    .line 28
    sub-int/2addr p1, v2

    .line 29
    iget v3, p3, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v4, p3, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    sub-int/2addr v4, v1

    .line 34
    invoke-direct {p0, p1, v3, v4}, Ll/ja4;->b(III)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    float-to-int p2, p2

    .line 39
    sub-int/2addr p2, v2

    .line 40
    iget v2, p3, Landroid/graphics/Rect;->top:I

    .line 41
    .line 42
    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    .line 43
    .line 44
    sub-int/2addr p3, v1

    .line 45
    invoke-direct {p0, p2, v2, p3}, Ll/ja4;->b(III)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    new-instance p3, Landroid/graphics/RectF;

    .line 50
    .line 51
    int-to-float v2, p1

    .line 52
    int-to-float v3, p2

    .line 53
    add-int/2addr p1, v1

    .line 54
    int-to-float p1, p1

    .line 55
    add-int/2addr p2, v1

    .line 56
    int-to-float p2, p2

    .line 57
    invoke-direct {p3, v2, v3, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p3}, Ll/gu6;->c(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-direct {p0, p1}, Ll/ja4;->q(Landroid/graphics/RectF;)Landroid/graphics/Rect;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public c()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ja4;->g:Ll/tow;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/tow;->g0:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    iget-object v2, p0, Ll/ja4;->g:Ll/tow;

    .line 11
    .line 12
    iget v3, v2, Ll/tow;->f:I

    .line 13
    .line 14
    iget v2, v2, Ll/tow;->e:I

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-direct {v0, v4, v4, v3, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    int-to-float v2, v2

    .line 25
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    int-to-float v3, v3

    .line 30
    invoke-virtual {p0, v2, v3, v0}, Ll/ja4;->a(FFLandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0, v1}, Ll/ja4;->e(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    new-instance v0, Landroid/graphics/Rect;

    .line 43
    .line 44
    const/16 v2, -0x64

    .line 45
    .line 46
    const/16 v3, 0x64

    .line 47
    .line 48
    invoke-direct {v0, v2, v2, v3, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Ll/ja4;->e(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public d(IIFFFFF)V
    .locals 6

    .line 1
    iget-object p7, p0, Ll/ja4;->g:Ll/tow;

    .line 2
    .line 3
    iget-boolean p7, p7, Ll/tow;->g0:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p7, :cond_1

    .line 8
    .line 9
    new-instance p7, Ll/gu6;

    .line 10
    .line 11
    iget-object v2, p0, Ll/ja4;->c:Ll/xpl;

    .line 12
    .line 13
    check-cast v2, Ll/ciw;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/ciw;->V()Landroid/hardware/camera2/CameraCharacteristics;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Landroid/graphics/RectF;

    .line 20
    .line 21
    int-to-float v4, p2

    .line 22
    int-to-float v5, p1

    .line 23
    invoke-direct {v3, v1, v1, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p7, v2, v3}, Ll/gu6;-><init>(Landroid/hardware/camera2/CameraCharacteristics;Landroid/graphics/RectF;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Landroid/graphics/Rect;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-direct {v1, v2, v2, p2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ja4;->m()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    float-to-int p1, p4

    .line 42
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-direct {p0, p1, v2, p2}, Ll/ja4;->b(III)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    int-to-float p2, p2

    .line 55
    sub-float/2addr p2, p5

    .line 56
    float-to-int p2, p2

    .line 57
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 58
    .line 59
    .line 60
    move-result p4

    .line 61
    invoke-direct {p0, p2, v2, p4}, Ll/ja4;->b(III)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    float-to-int p4, p6

    .line 66
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 67
    .line 68
    .line 69
    move-result p5

    .line 70
    invoke-direct {p0, p4, v2, p5}, Ll/ja4;->b(III)I

    .line 71
    .line 72
    .line 73
    move-result p4

    .line 74
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 75
    .line 76
    .line 77
    move-result p5

    .line 78
    int-to-float p5, p5

    .line 79
    sub-float/2addr p5, p3

    .line 80
    float-to-int p3, p5

    .line 81
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 82
    .line 83
    .line 84
    move-result p5

    .line 85
    invoke-direct {p0, p3, v2, p5}, Ll/ja4;->b(III)I

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    goto :goto_0

    .line 90
    :cond_0
    float-to-int p1, p4

    .line 91
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    invoke-direct {p0, p1, v2, p2}, Ll/ja4;->b(III)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    float-to-int p2, p3

    .line 100
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    invoke-direct {p0, p2, v2, p3}, Ll/ja4;->b(III)I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    float-to-int p3, p6

    .line 109
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 110
    .line 111
    .line 112
    move-result p4

    .line 113
    invoke-direct {p0, p3, v2, p4}, Ll/ja4;->b(III)I

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    float-to-int p3, p5

    .line 118
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 119
    .line 120
    .line 121
    move-result p5

    .line 122
    invoke-direct {p0, p3, v2, p5}, Ll/ja4;->b(III)I

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    :goto_0
    new-instance p5, Landroid/graphics/RectF;

    .line 127
    .line 128
    int-to-float p1, p1

    .line 129
    int-to-float p2, p2

    .line 130
    int-to-float p4, p4

    .line 131
    int-to-float p3, p3

    .line 132
    invoke-direct {p5, p1, p2, p4, p3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p5}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p7, p5}, Ll/gu6;->c(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-direct {p0, p1}, Ll/ja4;->q(Landroid/graphics/RectF;)Landroid/graphics/Rect;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p0, p1, v0}, Ll/ja4;->e(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Ll/ja4;->e:Landroid/graphics/Rect;

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_1
    cmpl-float p7, p3, v1

    .line 156
    .line 157
    if-lez p7, :cond_2

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_2
    move p3, v1

    .line 161
    :goto_1
    cmpl-float p7, p4, v1

    .line 162
    .line 163
    if-lez p7, :cond_3

    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_3
    move p4, v1

    .line 167
    :goto_2
    int-to-float p1, p1

    .line 168
    cmpl-float p7, p5, p1

    .line 169
    .line 170
    if-lez p7, :cond_4

    .line 171
    .line 172
    move p5, p1

    .line 173
    :cond_4
    int-to-float p2, p2

    .line 174
    cmpl-float p7, p6, p2

    .line 175
    .line 176
    if-lez p7, :cond_5

    .line 177
    .line 178
    move p6, p2

    .line 179
    :cond_5
    const/high16 p7, 0x44fa0000    # 2000.0f

    .line 180
    .line 181
    mul-float/2addr p3, p7

    .line 182
    div-float/2addr p3, p1

    .line 183
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 184
    .line 185
    sub-float/2addr p3, v1

    .line 186
    float-to-int p3, p3

    .line 187
    mul-float/2addr p4, p7

    .line 188
    div-float/2addr p4, p2

    .line 189
    sub-float/2addr p4, v1

    .line 190
    float-to-int p4, p4

    .line 191
    mul-float/2addr p5, p7

    .line 192
    div-float/2addr p5, p1

    .line 193
    sub-float/2addr p5, v1

    .line 194
    float-to-int p1, p5

    .line 195
    mul-float/2addr p6, p7

    .line 196
    div-float/2addr p6, p2

    .line 197
    sub-float/2addr p6, v1

    .line 198
    float-to-int p2, p6

    .line 199
    new-instance p5, Landroid/graphics/Rect;

    .line 200
    .line 201
    invoke-direct {p5, p3, p4, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, p5, v0}, Ll/ja4;->e(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public e(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ja4;->e:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {p0, v0, p1}, Ll/ja4;->n(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ja4;->m()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/ja4;->e:Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/ja4;->c:Ll/xpl;

    .line 25
    .line 26
    iget-object p0, p0, Ll/ja4;->e:Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-interface {p1, p0, p2}, Ll/xpl;->k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public f()Ll/xpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->m()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->h()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->g()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public l(Ll/tow;Z)V
    .locals 0

    .line 1
    iget-boolean p2, p1, Ll/tow;->g0:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance p2, Ll/ciw;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/ciw;-><init>(Ll/tow;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Ll/ja4;->c:Ll/xpl;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance p2, Ll/biw;

    .line 14
    .line 15
    invoke-direct {p2, p1}, Ll/biw;-><init>(Ll/tow;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Ll/ja4;->c:Ll/xpl;

    .line 19
    .line 20
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/xpl;->i()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->L()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onData([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->b:Ll/ja4$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/ja4$a;->D([B)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(ILl/row;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0, p1, p2}, Ll/xpl;->G(ILl/row;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "CameraSource"

    .line 13
    .line 14
    const-string p1, "Camera prepare Failed !!!"

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    iget-object p1, p0, Ll/ja4;->c:Ll/xpl;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/ja4;->e:Landroid/graphics/Rect;

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_1
    return v1
.end method

.method public r()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-interface {v0, v1}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/xpl;->e(Landroid/hardware/Camera$ErrorCallback;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/xpl;->a()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ll/ja4;->f:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    iput-object v1, p0, Ll/ja4;->c:Ll/xpl;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    return p0

    .line 30
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public s(ILl/row;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0, p1, p2}, Ll/xpl;->F(ILl/row;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ja4;->c:Ll/xpl;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ja4;->f:Landroid/graphics/SurfaceTexture;

    .line 12
    .line 13
    invoke-interface {p1, p0}, Ll/xpl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_1
    return v1
.end method

.method public t()V
    .locals 0

    .line 1
    return-void
.end method

.method public u(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/ciw;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/ciw;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/ciw;->e0(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public v(Ll/ja4$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ja4;->b:Ll/ja4$a;

    .line 2
    .line 3
    return-void
.end method

.method public w(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xpl;->setExposureCompensation(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x(Ll/ciw$h;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/ciw;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/ciw;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/ciw;->f0(Ll/ciw$h;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public y(Landroid/hardware/Camera$ErrorCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xpl;->e(Landroid/hardware/Camera$ErrorCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z(Ll/xpl$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ja4;->c:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xpl;->I(Ll/xpl$d;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
