.class public final Lhll;
.super Llkn;
.source "SourceFile"


# static fields
.field public static final s:Lgpk;


# instance fields
.field public final k:Landroid/content/Context;

.field public final l:Landroid/graphics/LinearGradient;

.field public final m:Lo2c;

.field public final n:Landroid/graphics/Matrix;

.field public final o:Landroid/graphics/Paint;

.field public final p:I

.field public q:Lm9f;

.field public r:Landroid/graphics/ComposeShader;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgpk;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lgpk;-><init>(B)V

    sput-object v0, Lhll;->s:Lgpk;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lxkn;Lo2c;Landroid/graphics/Bitmap;ILy1n;)V
    .registers 15

    invoke-direct {p0, p2, p4, p5, p6}, Llkn;-><init>(Lxkn;Landroid/graphics/Bitmap;ILy1n;)V

    new-instance p4, Landroid/graphics/Matrix;

    invoke-direct {p4}, Landroid/graphics/Matrix;-><init>()V

    iput-object p4, p0, Lhll;->n:Landroid/graphics/Matrix;

    new-instance p4, Landroid/graphics/Paint;

    const/4 p6, 0x1

    invoke-direct {p4, p6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p4, p0, Lhll;->o:Landroid/graphics/Paint;

    iput-object p1, p0, Lhll;->k:Landroid/content/Context;

    new-instance v0, Landroid/graphics/LinearGradient;

    iget v5, p2, Lxkn;->d:I

    iget v6, p2, Lxkn;->e:I

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lhll;->l:Landroid/graphics/LinearGradient;

    iput-object p3, p0, Lhll;->m:Lo2c;

    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iput p5, p0, Lhll;->p:I

    return-void
.end method


# virtual methods
.method public final d(Landroid/graphics/Canvas;)V
    .registers 20

    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, v0, Lhll;->n:Landroid/graphics/Matrix;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v3, v5, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    iget-object v2, v0, Lhll;->l:Landroid/graphics/LinearGradient;

    invoke-virtual {v2, v3}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v3, v0, Lhll;->m:Lo2c;

    iget-boolean v3, v3, Lo2c;->c:Z

    if-nez v3, :cond_eb

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v6

    iget-object v7, v0, Lhll;->q:Lm9f;

    if-eqz v7, :cond_3f

    iget v9, v7, Lm9f;->a:I

    if-ne v9, v3, :cond_3f

    iget v9, v7, Lm9f;->b:I

    if-eq v9, v6, :cond_cf

    :cond_3f
    iget-object v7, v0, Lhll;->k:Landroid/content/Context;

    const v9, 0x7f0809c7

    invoke-static {v9, v7}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-nez v7, :cond_4d

    const/4 v8, 0x0

    goto/16 :goto_e8

    :cond_4d
    new-instance v9, Lm9f;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iput v3, v9, Lm9f;->a:I

    iput v6, v9, Lm9f;->b:I

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v10

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v11

    if-eqz v11, :cond_c6

    if-eqz v10, :cond_c6

    int-to-float v12, v6

    int-to-float v13, v11

    div-float v14, v12, v13

    int-to-float v15, v3

    move/from16 v16, v5

    int-to-float v5, v10

    div-float v8, v15, v5

    invoke-static {v14, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    const/4 v14, 0x0

    cmpl-float v17, v8, v14

    if-eqz v17, :cond_c6

    cmpg-float v16, v8, v16

    const/4 v14, 0x0

    if-gtz v16, :cond_7d

    const/16 v16, 0x1

    goto :goto_7f

    :cond_7d
    move/from16 v16, v14

    :goto_7f
    if-nez v16, :cond_85

    div-float/2addr v15, v8

    float-to-int v3, v15

    div-float/2addr v12, v8

    float-to-int v6, v12

    :cond_85
    sget-object v12, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v6, v12}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_c6

    new-instance v12, Landroid/graphics/BitmapShader;

    sget-object v15, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v12, v6, v15, v15}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    new-instance v15, Landroid/graphics/Canvas;

    invoke-direct {v15, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    if-eqz v16, :cond_a3

    mul-float/2addr v5, v8

    float-to-int v5, v5

    mul-float/2addr v8, v13

    float-to-int v6, v8

    invoke-virtual {v7, v14, v14, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_b1

    :cond_a3
    invoke-virtual {v7, v14, v14, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v5, v8, v8}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v12, v5}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :goto_b1
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    sub-int/2addr v3, v5

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    const/4 v5, 0x0

    invoke-virtual {v15, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v7, v15}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_c7

    :cond_c6
    const/4 v12, 0x0

    :goto_c7
    iput-object v12, v9, Lm9f;->c:Ljava/lang/Object;

    iput-object v9, v0, Lhll;->q:Lm9f;

    const/4 v3, 0x0

    iput-object v3, v0, Lhll;->r:Landroid/graphics/ComposeShader;

    move-object v7, v9

    :cond_cf
    iget-object v3, v0, Lhll;->r:Landroid/graphics/ComposeShader;

    if-nez v3, :cond_e6

    iget-object v3, v7, Lm9f;->c:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/BitmapShader;

    if-eqz v3, :cond_e3

    new-instance v5, Landroid/graphics/ComposeShader;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->OVERLAY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v2, v3, v6}, Landroid/graphics/ComposeShader;-><init>(Landroid/graphics/Shader;Landroid/graphics/Shader;Landroid/graphics/PorterDuff$Mode;)V

    iput-object v5, v0, Lhll;->r:Landroid/graphics/ComposeShader;

    goto :goto_e6

    :cond_e3
    const/4 v3, 0x0

    iput-object v3, v0, Lhll;->r:Landroid/graphics/ComposeShader;

    :cond_e6
    :goto_e6
    iget-object v8, v0, Lhll;->r:Landroid/graphics/ComposeShader;

    :goto_e8
    if-eqz v8, :cond_eb

    move-object v2, v8

    :cond_eb
    iget-object v11, v0, Lhll;->o:Landroid/graphics/Paint;

    invoke-virtual {v11, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget v2, v1, Landroid/graphics/Rect;->right:I

    int-to-float v7, v2

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v1

    iget v0, v0, Lhll;->p:I

    int-to-float v9, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v10, v9

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method
