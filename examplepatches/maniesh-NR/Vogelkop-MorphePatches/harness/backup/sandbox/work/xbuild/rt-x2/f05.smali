.class public final Lf05;
.super Landroid/graphics/drawable/shapes/OvalShape;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Paint;

.field public final c:I

.field public final synthetic d:Lg05;


# direct methods
.method public constructor <init>(Lg05;II)V
    .registers 11

    iput-object p1, p0, Lf05;->d:Lg05;

    invoke-direct {p0}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lf05;->b:Landroid/graphics/Paint;

    iput p2, p0, Lf05;->a:I

    iput p3, p0, Lf05;->c:I

    new-instance v0, Landroid/graphics/RadialGradient;

    int-to-float p0, p3

    const/high16 p3, 0x40000000    # 2.0f

    div-float v1, p0, p3

    int-to-float v3, p2

    const/high16 p0, 0x3d000000    # 0.03125f

    const/4 p2, 0x0

    filled-new-array {p0, p2}, [I

    move-result-object v4

    const/4 v5, 0x0

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v2, v1

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 9

    iget-object v0, p0, Lf05;->d:Lg05;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    int-to-float v0, v0

    div-float/2addr v0, v2

    iget v3, p0, Lf05;->c:I

    int-to-float v4, v3

    div-float/2addr v4, v2

    iget v5, p0, Lf05;->a:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    iget-object p0, p0, Lf05;->b:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v4, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    int-to-float p0, v3

    div-float/2addr p0, v2

    invoke-virtual {p1, v1, v0, p0, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method
