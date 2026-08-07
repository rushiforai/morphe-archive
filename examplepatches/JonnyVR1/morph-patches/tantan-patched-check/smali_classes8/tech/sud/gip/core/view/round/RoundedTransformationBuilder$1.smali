.class Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;
.super Landroid/view/animation/Transformation;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->build()Landroid/view/animation/Transformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;


# direct methods
.method public constructor <init>(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/animation/Transformation;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "r:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 9
    .line 10
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->c(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)[F

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "b:"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 27
    .line 28
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->b(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, "c:"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 41
    .line 42
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->a(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v1, "o:"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 55
    .line 56
    invoke-static {p0}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->d(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    invoke-static {p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->fromBitmap(Landroid/graphics/Bitmap;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 6
    .line 7
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->e(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Landroid/widget/ImageView$ScaleType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 16
    .line 17
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->c(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)[F

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    aget v2, v1, v2

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    aget v3, v1, v3

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    aget v4, v1, v4

    .line 29
    .line 30
    const/4 v5, 0x3

    .line 31
    aget v1, v1, v5

    .line 32
    .line 33
    invoke-virtual {v0, v2, v3, v4, v1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setCornerRadius(FFFF)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 38
    .line 39
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->b(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)F

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setBorderWidth(F)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 48
    .line 49
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->a(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;->this$0:Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 58
    .line 59
    invoke-static {p0}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->d(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {v0, p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setOval(Z)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->toBitmap()Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_0

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-object p0
.end method
