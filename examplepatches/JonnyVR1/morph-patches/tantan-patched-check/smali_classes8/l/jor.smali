.class public Ll/jor;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Z


# direct methods
.method public constructor <init>(IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/jor;->b:I

    .line 5
    .line 6
    iput p2, p0, Ll/jor;->c:I

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/jor;->d:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 11
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Landroid/graphics/Paint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move/from16 v0, p7

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/jor;->d:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 8
    .line 9
    int-to-float v4, v0

    .line 10
    iget v1, p0, Ll/jor;->a:I

    .line 11
    .line 12
    int-to-float v1, v1

    .line 13
    add-float v5, p5, v1

    .line 14
    .line 15
    iget v7, p0, Ll/jor;->b:I

    .line 16
    .line 17
    iget v8, p0, Ll/jor;->c:I

    .line 18
    .line 19
    sget-object v9, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 20
    .line 21
    move v6, v4

    .line 22
    move/from16 v3, p5

    .line 23
    .line 24
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    move-object/from16 v9, p9

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    new-instance v3, Landroid/graphics/LinearGradient;

    .line 31
    .line 32
    int-to-float v5, v0

    .line 33
    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Paint;->descent()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-float/2addr v1, v5

    .line 38
    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Paint;->ascent()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-float v7, v1, v2

    .line 43
    .line 44
    iget v8, p0, Ll/jor;->b:I

    .line 45
    .line 46
    iget v9, p0, Ll/jor;->c:I

    .line 47
    .line 48
    sget-object v10, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 49
    .line 50
    move/from16 v6, p5

    .line 51
    .line 52
    move/from16 v4, p5

    .line 53
    .line 54
    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 55
    .line 56
    .line 57
    move-object v2, v3

    .line 58
    goto :goto_0

    .line 59
    :goto_1
    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 60
    .line 61
    .line 62
    int-to-float v8, v0

    .line 63
    move-object v3, p1

    .line 64
    move-object v4, p2

    .line 65
    move v5, p3

    .line 66
    move v6, p4

    .line 67
    move/from16 v7, p5

    .line 68
    .line 69
    invoke-virtual/range {v3 .. v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0
    .param p1    # Landroid/graphics/Paint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/graphics/Paint$FontMetricsInt;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2, p3, p4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    float-to-int p1, p1

    .line 6
    iput p1, p0, Ll/jor;->a:I

    .line 7
    .line 8
    return p1
.end method
