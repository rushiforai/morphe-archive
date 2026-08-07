.class public Ll/qig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Landroid/text/TextPaint;

.field public c:F

.field public d:F


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qig;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/z0m;)Ll/qig;
    .locals 3

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 13
    .line 14
    invoke-interface {p1}, Ll/jpl;->c()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 27
    .line 28
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/jpl;->a()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 49
    .line 50
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 51
    .line 52
    sub-float v0, v1, v0

    .line 53
    .line 54
    const/high16 v2, 0x40000000    # 2.0f

    .line 55
    .line 56
    div-float/2addr v0, v2

    .line 57
    sub-float/2addr v0, v1

    .line 58
    iput v0, p0, Ll/qig;->c:F

    .line 59
    .line 60
    invoke-interface {p1}, Ll/jpl;->c()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, p0, Ll/qig;->a:Ljava/lang/String;

    .line 65
    .line 66
    invoke-interface {p1}, Ll/jpl;->b()Landroid/graphics/Typeface;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {v0, v1, p1}, Ll/ynp0;->t(ILjava/lang/String;Landroid/graphics/Typeface;)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    int-to-float p1, p1

    .line 75
    iput p1, p0, Ll/qig;->d:F

    .line 76
    .line 77
    return-object p0
.end method

.method public b(Ll/r5m;)Ll/qig;
    .locals 3

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 13
    .line 14
    invoke-interface {p1}, Ll/jpl;->c()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 27
    .line 28
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/jpl;->a()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 49
    .line 50
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 51
    .line 52
    sub-float v0, v1, v0

    .line 53
    .line 54
    const/high16 v2, 0x40000000    # 2.0f

    .line 55
    .line 56
    div-float/2addr v0, v2

    .line 57
    sub-float/2addr v0, v1

    .line 58
    iput v0, p0, Ll/qig;->c:F

    .line 59
    .line 60
    invoke-interface {p1}, Ll/jpl;->c()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, p0, Ll/qig;->a:Ljava/lang/String;

    .line 65
    .line 66
    invoke-interface {p1}, Ll/jpl;->b()Landroid/graphics/Typeface;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {v0, v1, p1}, Ll/ynp0;->t(ILjava/lang/String;Landroid/graphics/Typeface;)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    int-to-float p1, p1

    .line 75
    iput p1, p0, Ll/qig;->d:F

    .line 76
    .line 77
    return-object p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Ll/qig;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public d()F
    .locals 0

    .line 1
    iget p0, p0, Ll/qig;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qig;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Landroid/text/TextPaint;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qig;->b:Landroid/text/TextPaint;

    .line 2
    .line 3
    return-object p0
.end method
