.class public Lcom/leanplum/views/BackgroundImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# instance fields
.field private emptyMatrix:Landroid/graphics/Matrix;

.field private loadedBitmap:Z

.field private paint:Landroid/graphics/Paint;

.field private roundedCorners:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/graphics/Bitmap;Z)V
    .registers 5

    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->emptyMatrix:Landroid/graphics/Matrix;

    iput-boolean p4, p0, Lcom/leanplum/views/BackgroundImageView;->roundedCorners:Z

    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-static {p0, p2, p4}, Lcom/leanplum/views/ViewUtils;->applyBackground(Landroid/view/View;IZ)V

    invoke-direct {p0}, Lcom/leanplum/views/BackgroundImageView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 34
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    .line 36
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->emptyMatrix:Landroid/graphics/Matrix;

    .line 37
    invoke-direct {p0}, Lcom/leanplum/views/BackgroundImageView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    .line 45
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->emptyMatrix:Landroid/graphics/Matrix;

    .line 46
    invoke-direct {p0}, Lcom/leanplum/views/BackgroundImageView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 3

    .line 38
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    .line 39
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    .line 40
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/leanplum/views/BackgroundImageView;->emptyMatrix:Landroid/graphics/Matrix;

    .line 41
    invoke-direct {p0}, Lcom/leanplum/views/BackgroundImageView;->init()V

    xor-int/lit8 p2, p2, 0x1

    .line 42
    iput-boolean p2, p0, Lcom/leanplum/views/BackgroundImageView;->roundedCorners:Z

    return-void
.end method

.method private init()V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    const v1, -0xff0100

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p0, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method public loadBitmapFromView(Landroid/view/View;)Landroid/graphics/Bitmap;
    .registers 7

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    if-gtz v0, :cond_a

    const/4 v0, -0x2

    invoke-virtual {p1, v0, v0}, Landroid/view/View;->measure(II)V

    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p1, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/leanplum/views/BackgroundImageView;->loadedBitmap:Z

    invoke-virtual {p1, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/leanplum/views/BackgroundImageView;->roundedCorners:Z

    if-nez v0, :cond_8

    return-void

    :cond_8
    iget-boolean v0, p0, Lcom/leanplum/views/BackgroundImageView;->loadedBitmap:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    iput-boolean v1, p0, Lcom/leanplum/views/BackgroundImageView;->loadedBitmap:Z

    return-void

    :cond_10
    invoke-virtual {p0, p0}, Lcom/leanplum/views/BackgroundImageView;->loadBitmapFromView(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v0

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    sget v1, Lcom/leanplum/utils/SizeUtil;->dp20:I

    invoke-static {v0, v1}, Lcom/leanplum/utils/BitmapUtil;->getRoundedCornerBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/views/BackgroundImageView;->emptyMatrix:Landroid/graphics/Matrix;

    iget-object p0, p0, Lcom/leanplum/views/BackgroundImageView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-void
.end method
