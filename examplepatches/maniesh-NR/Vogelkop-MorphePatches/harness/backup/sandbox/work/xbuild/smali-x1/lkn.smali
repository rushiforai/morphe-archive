.class public Llkn;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static final j:Lsjn;


# instance fields
.field public final a:Lxkn;

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Matrix;

.field public d:Landroid/graphics/Bitmap;

.field public final e:I

.field public final f:Ly1n;

.field public g:Landroid/graphics/BitmapShader;

.field public h:Landroid/graphics/LinearGradient;

.field public final i:Lzjn;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lsjn;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lsjn;-><init>(B)V

    sput-object v0, Llkn;->j:Lsjn;

    return-void
.end method

.method public constructor <init>(Lxkn;Landroid/graphics/Bitmap;ILy1n;)V
    .registers 8

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Llkn;->b:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Llkn;->c:Landroid/graphics/Matrix;

    new-instance v2, Lzjn;

    invoke-direct {v2}, Lzjn;-><init>()V

    iput-object v2, p0, Llkn;->i:Lzjn;

    iput-object p1, p0, Llkn;->a:Lxkn;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iput-object p2, p0, Llkn;->d:Landroid/graphics/Bitmap;

    iput p3, p0, Llkn;->e:I

    iput-object p4, p0, Llkn;->f:Ly1n;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget-object p0, p0, Llkn;->d:Landroid/graphics/Bitmap;

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final b()I
    .registers 1

    iget-object p0, p0, Llkn;->d:Landroid/graphics/Bitmap;

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Landroid/content/Context;)V
    .registers 5

    iget-object v0, p0, Llkn;->a:Lxkn;

    iget-object v0, v0, Lxkn;->a:Ljava/lang/String;

    iget-object p0, p0, Llkn;->i:Lzjn;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "wallpaper.adjust.id"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    return-void

    :cond_1d
    iget v0, p0, Lzjn;->a:F

    const-string v1, "wallpaper.adjust.scale"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lzjn;->a:F

    iget v0, p0, Lzjn;->b:F

    const-string v1, "wallpaper.adjust.pivotx"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lzjn;->b:F

    iget v0, p0, Lzjn;->c:F

    const-string v1, "wallpaper.adjust.pivoty"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    iput p1, p0, Lzjn;->c:F

    return-void
.end method

.method public d(Landroid/graphics/Canvas;)V
    .registers 22

    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, v0, Llkn;->d:Landroid/graphics/Bitmap;

    iget v3, v0, Llkn;->e:I

    iget-object v11, v0, Llkn;->b:Landroid/graphics/Paint;

    if-nez v2, :cond_5c

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, v0, Llkn;->a:Lxkn;

    iget v4, v2, Lxkn;->d:I

    iget v5, v2, Lxkn;->e:I

    if-eq v4, v5, :cond_45

    iget-object v4, v0, Llkn;->h:Landroid/graphics/LinearGradient;

    if-nez v4, :cond_3b

    new-instance v12, Landroid/graphics/LinearGradient;

    iget v4, v1, Landroid/graphics/Rect;->left:I

    int-to-float v13, v4

    iget v4, v1, Landroid/graphics/Rect;->top:I

    int-to-float v14, v4

    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    iget v2, v2, Lxkn;->d:I

    filled-new-array {v2, v5}, [I

    move-result-object v17

    const/16 v18, 0x0

    sget-object v19, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v15, v13

    move/from16 v16, v4

    invoke-direct/range {v12 .. v19}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v12, v0, Llkn;->h:Landroid/graphics/LinearGradient;

    :cond_3b
    const/4 v2, -0x1

    invoke-virtual {v11, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, v0, Llkn;->h:Landroid/graphics/LinearGradient;

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto :goto_48

    :cond_45
    invoke-virtual {v11, v4}, Landroid/graphics/Paint;->setColor(I)V

    :goto_48
    iget v0, v1, Landroid/graphics/Rect;->left:I

    int-to-float v5, v0

    iget v0, v1, Landroid/graphics/Rect;->top:I

    int-to-float v6, v0

    iget v0, v1, Landroid/graphics/Rect;->right:I

    int-to-float v7, v0

    iget v0, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v0

    int-to-float v9, v3

    move v10, v9

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void

    :cond_5c
    iget-object v2, v0, Llkn;->g:Landroid/graphics/BitmapShader;

    if-nez v2, :cond_6e

    new-instance v2, Landroid/graphics/BitmapShader;

    iget-object v4, v0, Llkn;->d:Landroid/graphics/Bitmap;

    sget-object v5, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v4, v5, v5}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v2, v0, Llkn;->g:Landroid/graphics/BitmapShader;

    invoke-virtual {v11, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_6e
    iget-object v2, v0, Llkn;->d:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v4, v0, Llkn;->d:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iget-object v5, v0, Llkn;->i:Lzjn;

    invoke-virtual {v5, v1, v2, v4}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v6

    neg-int v2, v2

    int-to-float v2, v2

    iget v7, v5, Lzjn;->b:F

    mul-float/2addr v2, v7

    neg-int v4, v4

    int-to-float v4, v4

    iget v7, v5, Lzjn;->c:F

    mul-float/2addr v4, v7

    iget-object v7, v0, Llkn;->c:Landroid/graphics/Matrix;

    invoke-virtual {v7, v2, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v7, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    iget v6, v5, Lzjn;->b:F

    mul-float/2addr v4, v6

    add-float/2addr v4, v2

    iget v2, v1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    iget v5, v5, Lzjn;->c:F

    mul-float/2addr v6, v5

    add-float/2addr v6, v2

    invoke-virtual {v7, v4, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, v0, Llkn;->g:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v7}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget v0, v1, Landroid/graphics/Rect;->left:I

    int-to-float v5, v0

    iget v0, v1, Landroid/graphics/Rect;->top:I

    int-to-float v6, v0

    iget v0, v1, Landroid/graphics/Rect;->right:I

    int-to-float v7, v0

    iget v0, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v0

    int-to-float v9, v3

    int-to-float v10, v3

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 3

    iget-object v0, p0, Llkn;->f:Ly1n;

    invoke-virtual {v0}, Ly1n;->run()V

    invoke-virtual {p0, p1}, Llkn;->d(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    iget p0, p0, Llkn;->e:I

    if-lez p0, :cond_6

    const/4 p0, -0x3

    return p0

    :cond_6
    const/4 p0, -0x1

    return p0
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .registers 3

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget p0, p0, Llkn;->e:I

    int-to-float p0, p0

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    return-void
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    const/4 p1, 0x0

    iput-object p1, p0, Llkn;->h:Landroid/graphics/LinearGradient;

    return-void
.end method

.method public final setAlpha(I)V
    .registers 2

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    iget-object p0, p0, Llkn;->b:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
