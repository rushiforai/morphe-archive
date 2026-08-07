.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Bitmap;

.field public b:I

.field public c:I

.field public d:I

.field public e:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public f:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIIIILandroid/graphics/Bitmap;)V
    .locals 0
    .param p4    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->b:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->c:I

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->d:I

    .line 9
    .line 10
    iput p4, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->e:I

    .line 11
    .line 12
    iput p5, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->f:I

    .line 13
    .line 14
    iput-object p6, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->a:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(III)Landroid/graphics/Shader;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p1, Landroid/graphics/BitmapShader;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->a:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 10
    .line 11
    invoke-direct {p1, v0, v1, v1}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 12
    .line 13
    .line 14
    int-to-float p2, p2

    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    mul-float/2addr p2, v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->a:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    div-float/2addr p2, v1

    .line 26
    int-to-float p3, p3

    .line 27
    mul-float/2addr p3, v0

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->a:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    int-to-float p0, p0

    .line 35
    div-float/2addr p3, p0

    .line 36
    invoke-static {p2, p3}, Ljava/lang/Math;->max(FF)F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    new-instance p2, Landroid/graphics/Matrix;

    .line 41
    .line 42
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, p0, p0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 49
    .line 50
    .line 51
    return-object p1

    .line 52
    :cond_0
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 53
    .line 54
    int-to-float v1, p1

    .line 55
    add-int/2addr p1, p2

    .line 56
    int-to-float v3, p1

    .line 57
    iget v5, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->e:I

    .line 58
    .line 59
    iget v6, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->f:I

    .line 60
    .line 61
    sget-object v7, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    const/4 v4, 0x0

    .line 65
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Rectangle{width="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", height="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->c:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
