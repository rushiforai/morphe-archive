.class Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;
.super Landroid/graphics/drawable/shapes/OvalShape;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKCircleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private a:Landroid/graphics/RadialGradient;

.field private b:Landroid/graphics/Paint;

.field final synthetic c:Lcom/hellogroup/mk/business/widget/MKCircleImageView;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKCircleImageView;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->c:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->b:Landroid/graphics/Paint;

    .line 12
    .line 13
    iput p2, p1, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->d:I

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/drawable/shapes/RectShape;->rect()Landroid/graphics/RectF;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    float-to-int p1, p1

    .line 24
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->a(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private a(I)V
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/RadialGradient;

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    int-to-float v1, p1

    .line 6
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->c:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 7
    .line 8
    iget p1, p1, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->d:I

    .line 9
    .line 10
    int-to-float v3, p1

    .line 11
    const/high16 p1, 0x3d000000    # 0.03125f

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    filled-new-array {p1, v2}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    const/4 v5, 0x0

    .line 19
    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 20
    .line 21
    move v2, v1

    .line 22
    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->a:Landroid/graphics/RadialGradient;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->b:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->c:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->c:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    div-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    int-to-float v2, v0

    .line 16
    div-int/lit8 v1, v1, 0x2

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    iget-object v3, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p1, v2, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->c:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 25
    .line 26
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->d:I

    .line 27
    .line 28
    sub-int/2addr v0, p0

    .line 29
    int-to-float p0, v0

    .line 30
    invoke-virtual {p1, v2, v1, p0, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onResize(FF)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/shapes/Shape;->onResize(FF)V

    .line 2
    .line 3
    .line 4
    float-to-int p1, p1

    .line 5
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKCircleImageView$a;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
