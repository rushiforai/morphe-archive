.class public Ll/kd4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:Ll/xvx;


# direct methods
.method public constructor <init>(Ll/xvx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kd4;->c:Ll/xvx;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x2

    .line 7
    if-ne v0, v2, :cond_5

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    and-int/lit16 v0, v0, 0xff

    .line 14
    .line 15
    if-eq v0, v2, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x5

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p0, p1}, Ll/kd4;->b(Landroid/view/MotionEvent;)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Ll/kd4;->a:F

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-virtual {p0, p1}, Ll/kd4;->b(Landroid/view/MotionEvent;)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget v0, p0, Ll/kd4;->a:F

    .line 33
    .line 34
    sub-float/2addr p1, v0

    .line 35
    invoke-virtual {p0}, Ll/kd4;->c()F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    mul-float/2addr p1, v0

    .line 40
    float-to-int p1, p1

    .line 41
    iget-object v0, p0, Ll/kd4;->c:Ll/xvx;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/xvx;->e()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-ne p1, v0, :cond_2

    .line 48
    .line 49
    return v1

    .line 50
    :cond_2
    iget-object v0, p0, Ll/kd4;->c:Ll/xvx;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/xvx;->e()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p1, v0

    .line 57
    iget-object v0, p0, Ll/kd4;->c:Ll/xvx;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/xvx;->f()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-lt p1, v0, :cond_3

    .line 64
    .line 65
    iget-object p1, p0, Ll/kd4;->c:Ll/xvx;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/xvx;->f()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    :cond_3
    if-gtz p1, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    move v1, p1

    .line 75
    :goto_0
    iget-object p0, p0, Ll/kd4;->c:Ll/xvx;

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ll/xvx;->n(I)V

    .line 78
    .line 79
    .line 80
    :goto_1
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_5
    return v1
.end method

.method public final b(Landroid/view/MotionEvent;)F
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->getX(I)F

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    sub-float/2addr v0, v2

    .line 12
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->getY(I)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    sub-float/2addr p0, p1

    .line 21
    mul-float/2addr v0, v0

    .line 22
    mul-float/2addr p0, p0

    .line 23
    add-float/2addr v0, p0

    .line 24
    float-to-double p0, v0

    .line 25
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide p0

    .line 29
    double-to-float p0, p0

    .line 30
    return p0
.end method

.method public final c()F
    .locals 4

    .line 1
    iget v0, p0, Ll/kd4;->b:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-gtz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/kd4;->c:Ll/xvx;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/xvx;->f()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Ll/kpj0;->b()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {}, Ll/kpj0;->b()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    mul-int/2addr v0, v1

    .line 26
    invoke-static {}, Ll/kpj0;->d()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {}, Ll/kpj0;->d()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    mul-int/2addr v1, v2

    .line 35
    add-int/2addr v0, v1

    .line 36
    int-to-double v0, v0

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    .line 42
    .line 43
    mul-double/2addr v0, v2

    .line 44
    const-wide/16 v2, 0x0

    .line 45
    .line 46
    cmpl-double v2, v0, v2

    .line 47
    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    iget p0, p0, Ll/kd4;->b:F

    .line 51
    .line 52
    return p0

    .line 53
    :cond_1
    iget-object v2, p0, Ll/kd4;->c:Ll/xvx;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/xvx;->f()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    int-to-double v2, v2

    .line 60
    div-double/2addr v2, v0

    .line 61
    double-to-float v0, v2

    .line 62
    iput v0, p0, Ll/kd4;->b:F

    .line 63
    .line 64
    return v0

    .line 65
    :cond_2
    :goto_0
    iget p0, p0, Ll/kd4;->b:F

    .line 66
    .line 67
    return p0
.end method
