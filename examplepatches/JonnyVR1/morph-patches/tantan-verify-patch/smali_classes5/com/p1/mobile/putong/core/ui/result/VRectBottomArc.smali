.class public Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Path;

.field public c:I

.field public d:I

.field public e:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 17
    .line 18
    const-string p1, "#c42d16"

    .line 19
    .line 20
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->c:I

    .line 25
    .line 26
    const-string p1, "#d46813"

    .line 27
    .line 28
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->d:I

    .line 33
    .line 34
    const p1, 0x3e4ccccd    # 0.2f

    .line 35
    .line 36
    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->e:F

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 45
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 46
    const-string p1, "#c42d16"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->c:I

    .line 47
    const-string p1, "#d46813"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->d:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->e:F

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 52
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 53
    const-string p1, "#c42d16"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->c:I

    .line 54
    const-string p1, "#d46813"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->d:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->e:F

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v2, v1

    .line 10
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->e:F

    .line 11
    .line 12
    mul-float/2addr v2, v3

    .line 13
    float-to-int v2, v2

    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 15
    .line 16
    int-to-float v4, v0

    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 22
    .line 23
    sub-int/2addr v1, v2

    .line 24
    int-to-float v1, v1

    .line 25
    invoke-virtual {v3, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 29
    .line 30
    neg-int v0, v0

    .line 31
    div-int/lit8 v3, v0, 0x2

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    int-to-float v2, v2

    .line 35
    int-to-float v0, v0

    .line 36
    invoke-virtual {v1, v3, v2, v0, v5}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 40
    .line 41
    invoke-virtual {v0, v5, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->b:Landroid/graphics/Path;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/graphics/Path;->reset()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->c:I

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->d:I

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 13
    .line 14
    int-to-float v3, p1

    .line 15
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->c:I

    .line 16
    .line 17
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->d:I

    .line 18
    .line 19
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->a:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public setArcRation(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;->e:F

    .line 2
    .line 3
    return-void
.end method
