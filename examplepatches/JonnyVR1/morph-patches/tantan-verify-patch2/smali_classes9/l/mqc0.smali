.class public Ll/mqc0;
.super Ll/kam;
.source "SourceFile"


# instance fields
.field public j:Landroid/graphics/Paint;

.field public k:F

.field public l:[I

.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/kam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, -0x181e3

    .line 5
    .line 6
    .line 7
    const v0, -0x9b9c

    .line 8
    .line 9
    .line 10
    filled-new-array {p1, v0}, [I

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/mqc0;->l:[I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    aget p1, p1, v0

    .line 18
    .line 19
    iput p1, p0, Ll/mqc0;->m:I

    .line 20
    .line 21
    iput v0, p0, Ll/mqc0;->n:I

    .line 22
    .line 23
    invoke-direct {p0}, Ll/mqc0;->l()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/mqc0;->j:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/mqc0;->j:Landroid/graphics/Paint;

    .line 13
    .line 14
    const v1, -0x181e3

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0xa

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    iput v0, p0, Ll/mqc0;->k:F

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public f(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->f(II)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/16 v1, 0xff

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/mqc0;->l:[I

    .line 10
    .line 11
    aget p1, p1, v0

    .line 12
    .line 13
    iput p1, p0, Ll/mqc0;->m:I

    .line 14
    .line 15
    mul-int/2addr p2, v1

    .line 16
    div-int/lit8 p2, p2, 0x64

    .line 17
    .line 18
    iput p2, p0, Ll/mqc0;->n:I

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v2, 0x1

    .line 22
    if-ne p1, v2, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/mqc0;->l:[I

    .line 25
    .line 26
    aget v0, p1, v0

    .line 27
    .line 28
    aget p1, p1, v2

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1, p2}, Ll/lam;->e(III)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Ll/mqc0;->m:I

    .line 35
    .line 36
    iput v1, p0, Ll/mqc0;->n:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const/4 v0, 0x2

    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    mul-int/2addr p2, v1

    .line 43
    div-int/lit8 p2, p2, 0x64

    .line 44
    .line 45
    sub-int/2addr v1, p2

    .line 46
    iput v1, p0, Ll/mqc0;->n:I

    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/mqc0;->j:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget p3, p0, Ll/mqc0;->m:I

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/mqc0;->j:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget p3, p0, Ll/mqc0;->n:I

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget p3, p0, Ll/mqc0;->k:F

    .line 18
    .line 19
    iget-object p0, p0, Ll/mqc0;->j:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p3, p3, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->h(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
