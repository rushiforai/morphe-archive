.class public Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0x13
.end annotation


# instance fields
.field public a:I

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Z

.field public e:I

.field public f:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "[F>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->a:I

    const/4 p1, 0x0

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->d:Z

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->e:I

    .line 41
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->f:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->d:Z

    .line 9
    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->e:I

    .line 11
    .line 12
    new-instance v1, Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->f:Landroid/util/SparseArray;

    .line 18
    .line 19
    sget-object v1, Ll/thc0;->y:[I

    .line 20
    .line 21
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget p2, Ll/thc0;->z:I

    .line 26
    .line 27
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->a:I

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private getCurrentProgressPath()Landroid/graphics/Path;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->e:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    const/high16 v2, 0x42c80000    # 100.0f

    .line 10
    .line 11
    div-float/2addr v1, v2

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    mul-float/2addr v2, v1

    .line 18
    float-to-int v1, v2

    .line 19
    new-instance v2, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    int-to-float v3, v3

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    int-to-float v4, v4

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    add-int/2addr v5, v1

    .line 36
    int-to-float v1, v5

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-float p0, p0

    .line 42
    invoke-direct {v2, v3, v4, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 46
    .line 47
    invoke-virtual {v0, v2, p0}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 48
    .line 49
    .line 50
    return-object v0
.end method

.method private getExactlyPath()Landroid/graphics/Path;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getRectWhole()Landroid/graphics/RectF;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->a:I

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->c(I)[F

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 17
    .line 18
    invoke-virtual {v0, v1, p0, v2}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method private getFinalPath()Landroid/graphics/Path;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getProgressPath()Landroid/graphics/Path;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getExactlyPath()Landroid/graphics/Path;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v1, Landroid/graphics/Path$Op;->UNION:Landroid/graphics/Path$Op;

    .line 10
    .line 11
    invoke-virtual {v0, p0, v1}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private getProgressPath()Landroid/graphics/Path;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    div-int/lit8 v1, v1, 0x2

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getRectWhole()Landroid/graphics/RectF;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    int-to-float v1, v1

    .line 17
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 18
    .line 19
    invoke-virtual {v0, p0, v1, v1, v2}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method private getRectWhole()Landroid/graphics/RectF;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    int-to-float v2, v2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    int-to-float v3, v3

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-float p0, p0

    .line 23
    invoke-direct {v0, v1, v2, v3, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getExactlyPath()Landroid/graphics/Path;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->c:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getFinalPath()Landroid/graphics/Path;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->getCurrentProgressPath()Landroid/graphics/Path;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->b:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final c(I)[F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->f:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [F

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->e(I)[F

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object v0
.end method

.method public final d()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->d:Z

    .line 5
    .line 6
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    int-to-float v5, v3

    .line 13
    const-string v3, "#667A3DD2"

    .line 14
    .line 15
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    const-string v3, "#66C56CD7"

    .line 20
    .line 21
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v8

    .line 25
    sget-object v16, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v6, 0x0

    .line 30
    move-object/from16 v9, v16

    .line 31
    .line 32
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 33
    .line 34
    .line 35
    new-instance v9, Landroid/graphics/LinearGradient;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    int-to-float v12, v3

    .line 42
    const-string v3, "#7A3DD2"

    .line 43
    .line 44
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v14

    .line 48
    const-string v3, "#C56CD7"

    .line 49
    .line 50
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v15

    .line 54
    const/4 v10, 0x0

    .line 55
    const/4 v11, 0x0

    .line 56
    const/4 v13, 0x0

    .line 57
    invoke-direct/range {v9 .. v16}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 58
    .line 59
    .line 60
    new-instance v3, Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v3, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->b:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->b:Landroid/graphics/Paint;

    .line 71
    .line 72
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 73
    .line 74
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 75
    .line 76
    .line 77
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->b:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {v3, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 80
    .line 81
    .line 82
    new-instance v3, Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v3, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->c:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 90
    .line 91
    .line 92
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->c:Landroid/graphics/Paint;

    .line 93
    .line 94
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->c:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final e(I)[F
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    div-int/2addr v0, v1

    .line 7
    const/4 v2, 0x7

    .line 8
    const/4 v3, 0x6

    .line 9
    const/4 v4, 0x5

    .line 10
    const/4 v5, 0x4

    .line 11
    const/4 v6, 0x3

    .line 12
    const/4 v7, 0x1

    .line 13
    const/4 v8, 0x0

    .line 14
    const/16 v9, 0x8

    .line 15
    .line 16
    if-eq p1, v1, :cond_0

    .line 17
    .line 18
    new-array v9, v9, [F

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    aput v0, v9, v8

    .line 22
    .line 23
    aput v0, v9, v7

    .line 24
    .line 25
    aput v0, v9, v1

    .line 26
    .line 27
    aput v0, v9, v6

    .line 28
    .line 29
    aput v0, v9, v5

    .line 30
    .line 31
    aput v0, v9, v4

    .line 32
    .line 33
    aput v0, v9, v3

    .line 34
    .line 35
    aput v0, v9, v2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-array v9, v9, [F

    .line 39
    .line 40
    int-to-float v0, v0

    .line 41
    aput v0, v9, v8

    .line 42
    .line 43
    aput v0, v9, v7

    .line 44
    .line 45
    aput v0, v9, v1

    .line 46
    .line 47
    aput v0, v9, v6

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    aput v1, v9, v5

    .line 51
    .line 52
    aput v1, v9, v4

    .line 53
    .line 54
    aput v0, v9, v3

    .line 55
    .line 56
    aput v0, v9, v2

    .line 57
    .line 58
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->f:Landroid/util/SparseArray;

    .line 59
    .line 60
    invoke-virtual {p0, p1, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-object v9
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->a(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->b(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->e:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->e:I

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
