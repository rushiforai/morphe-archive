.class public Lcom/tencent/liteav/beauty/b/b/a;
.super Lcom/tencent/liteav/beauty/b/b;
.source "SourceFile"


# instance fields
.field private r:Lcom/tencent/liteav/beauty/b/b/b;

.field private s:Lcom/tencent/liteav/beauty/b/s;

.field private t:Ljava/lang/String;

.field private u:F

.field private v:F

.field private w:F

.field private x:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 8
    .line 9
    const-string v0, "TXCBeauty3Filter"

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->t:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->u:F

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->v:F

    .line 17
    .line 18
    iput v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->w:F

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->x:F

    .line 21
    .line 22
    return-void
.end method

.method private d(II)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/tencent/liteav/beauty/b/b/b;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/b/b;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/b/b;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->t:Ljava/lang/String;

    .line 26
    .line 27
    const-string p1, "m_verticalFilter init failed!!, break init"

    .line 28
    .line 29
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return v1

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 34
    .line 35
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/b/b;->a(II)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    new-instance v0, Lcom/tencent/liteav/beauty/b/s;

    .line 43
    .line 44
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/s;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->t:Ljava/lang/String;

    .line 61
    .line 62
    const-string p1, "mSharpnessFilter init failed!!, break init"

    .line 63
    .line 64
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return v1

    .line 68
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 69
    .line 70
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/s;->a(II)V

    .line 71
    .line 72
    .line 73
    return v2
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 11
    .line 12
    iput p2, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 13
    .line 14
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/b/a;->d(II)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(I)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->u:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->v:F

    .line 9
    .line 10
    cmpl-float v0, v0, v1

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->w:F

    .line 15
    .line 16
    cmpl-float v0, v0, v1

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    :cond_1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->x:F

    .line 27
    .line 28
    cmpl-float v0, v0, v1

    .line 29
    .line 30
    if-lez v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_2
    return p1
.end method

.method public c(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x41200000    # 10.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/b/a;->u:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/b/b;->a(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(II)Z
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/b/a;->d(II)Z

    move-result p0

    return p0
.end method

.method public d(I)V
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x41200000    # 10.0f

    div-float/2addr p1, v0

    .line 74
    iput p1, p0, Lcom/tencent/liteav/beauty/b/b/a;->v:F

    .line 75
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    if-eqz p0, :cond_0

    .line 76
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/b/b;->b(F)V

    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 15
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/b/a;->q()V

    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x41200000    # 10.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/b/a;->w:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/b/b;->c(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(I)V
    .locals 4

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x41a00000    # 20.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->x:F

    .line 6
    .line 7
    sub-float/2addr v0, p1

    .line 8
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-double v0, v0

    .line 13
    const-wide v2, 0x3f50624dd2f1a9fcL    # 0.001

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    cmpg-double v0, v0, v2

    .line 19
    .line 20
    if-gez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput p1, p0, Lcom/tencent/liteav/beauty/b/b/a;->x:F

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/s;->a(F)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/b/a;->r:Lcom/tencent/liteav/beauty/b/b/b;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/b/a;->s:Lcom/tencent/liteav/beauty/b/s;

    .line 19
    .line 20
    :cond_1
    return-void
.end method
