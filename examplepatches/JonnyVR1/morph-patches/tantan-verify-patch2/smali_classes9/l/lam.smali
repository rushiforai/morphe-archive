.class public abstract Ll/lam;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Ll/n4m;

.field public g:Landroid/graphics/RectF;

.field public h:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/lam;->d:I

    .line 6
    .line 7
    iput v0, p0, Ll/lam;->e:I

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 15
    .line 16
    iput-object p1, p0, Ll/lam;->a:Landroid/content/Context;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lam;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    int-to-float p1, p1

    .line 14
    mul-float/2addr p0, p1

    .line 15
    const/high16 p1, 0x3f000000    # 0.5f

    .line 16
    .line 17
    add-float/2addr p0, p1

    .line 18
    float-to-int p0, p0

    .line 19
    return p0
.end method

.method public b()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lam;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lam;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d(FFI)F
    .locals 0

    .line 1
    sub-float/2addr p2, p1

    .line 2
    int-to-float p0, p3

    .line 3
    mul-float/2addr p2, p0

    .line 4
    const/high16 p0, 0x42c80000    # 100.0f

    .line 5
    .line 6
    div-float/2addr p2, p0

    .line 7
    add-float/2addr p1, p2

    .line 8
    return p1
.end method

.method public e(III)I
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sub-int/2addr v2, p0

    .line 34
    sub-int/2addr v3, v0

    .line 35
    sub-int/2addr v4, v1

    .line 36
    sub-int/2addr p2, p1

    .line 37
    mul-int/2addr v2, p3

    .line 38
    div-int/lit8 v2, v2, 0x64

    .line 39
    .line 40
    add-int/2addr p0, v2

    .line 41
    mul-int/2addr v3, p3

    .line 42
    div-int/lit8 v3, v3, 0x64

    .line 43
    .line 44
    add-int/2addr v0, v3

    .line 45
    mul-int/2addr v4, p3

    .line 46
    div-int/lit8 v4, v4, 0x64

    .line 47
    .line 48
    add-int/2addr v1, v4

    .line 49
    mul-int/2addr p3, p2

    .line 50
    div-int/lit8 p3, p3, 0x64

    .line 51
    .line 52
    add-int/2addr p1, p3

    .line 53
    invoke-static {p1, p0, v0, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public f(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/lam;->d:I

    .line 2
    .line 3
    iput p2, p0, Ll/lam;->e:I

    .line 4
    .line 5
    return-void
.end method

.method public abstract g(Landroid/graphics/Canvas;II)V
.end method

.method public h(II)V
    .locals 0

    .line 1
    iput p2, p0, Ll/lam;->c:I

    .line 2
    .line 3
    iput p1, p0, Ll/lam;->b:I

    .line 4
    .line 5
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    return-void
.end method

.method public j(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ll/n4m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lam;->f:Ll/n4m;

    .line 2
    .line 3
    return-void
.end method
