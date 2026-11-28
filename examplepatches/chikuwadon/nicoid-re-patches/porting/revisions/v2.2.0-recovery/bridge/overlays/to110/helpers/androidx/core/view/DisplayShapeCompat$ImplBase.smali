.class Landroidx/core/view/DisplayShapeCompat$ImplBase;
.super Ljava/lang/Object;
.source "DisplayShapeCompat.java"

# interfaces
.implements Landroidx/core/view/DisplayShapeCompat$Impl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/DisplayShapeCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImplBase"
.end annotation


# instance fields
.field private mCachedPath:Landroid/graphics/Path;

.field private final mDisplayHeight:I

.field private final mDisplayShapeSpec:Ljava/lang/String;

.field private final mDisplayWidth:I

.field private final mOffsetX:I

.field private final mOffsetY:I

.field private final mPhysicalPixelDisplaySizeRatio:F

.field private final mRotation:I

.field private final mScale:F


# direct methods
.method constructor <init>(Ljava/lang/String;IIFIIIF)V
    .registers 9
    .param p1, "spec"    # Ljava/lang/String;
    .param p2, "displayWidth"    # I
    .param p3, "displayHeight"    # I
    .param p4, "physicalPixelDisplaySizeRatio"    # F
    .param p5, "rotation"    # I
    .param p6, "offsetX"    # I
    .param p7, "offsetY"    # I
    .param p8, "scale"    # F

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    iput-object p1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    .line 265
    iput p2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    .line 266
    iput p3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    .line 267
    iput p4, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    .line 268
    iput p5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    .line 269
    iput p6, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    .line 270
    iput p7, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    .line 271
    iput p8, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    .line 272
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 349
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 350
    :cond_0
    instance-of v1, p1, Landroidx/core/view/DisplayShapeCompat$ImplBase;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 351
    :cond_1
    move-object v1, p1

    check-cast v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;

    .line 353
    .local v1, "that":Landroidx/core/view/DisplayShapeCompat$ImplBase;
    iget-object v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    iget-object v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    iget v4, v1, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getPath()Landroid/graphics/Path;
    .registers 7

    .line 278
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mCachedPath:Landroid/graphics/Path;

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mCachedPath:Landroid/graphics/Path;

    return-object v0

    .line 282
    :cond_0
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 289
    :try_start_0
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    invoke-static {v0}, Landroidx/core/graphics/PathParser;->createPathFromPathData(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 293
    .local v0, "path":Landroid/graphics/Path;
    nop

    .line 295
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 296
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 298
    .local v1, "matrix":Landroid/graphics/Matrix;
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    if-eqz v2, :cond_1

    .line 299
    const/4 v2, 0x0

    .line 300
    .local v2, "rotateDegrees":F
    const/4 v3, 0x0

    .line 301
    .local v3, "pivotX":F
    const/4 v4, 0x0

    .line 302
    .local v4, "pivotY":F
    iget v5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 314
    :pswitch_0
    const/high16 v2, 0x43870000    # 270.0f

    .line 315
    const/4 v3, 0x0

    .line 316
    iget v5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    int-to-float v4, v5

    goto :goto_0

    .line 309
    :pswitch_1
    const/high16 v2, 0x43340000    # 180.0f

    .line 310
    iget v5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    int-to-float v3, v5

    .line 311
    iget v5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    int-to-float v4, v5

    .line 312
    goto :goto_0

    .line 304
    :pswitch_2
    const/high16 v2, 0x42b40000    # 90.0f

    .line 305
    iget v5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    int-to-float v3, v5

    .line 306
    const/4 v4, 0x0

    .line 307
    nop

    .line 319
    :goto_0
    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    .line 322
    .end local v2    # "rotateDegrees":F
    .end local v3    # "pivotX":F
    .end local v4    # "pivotY":F
    :cond_1
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_2

    .line 323
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    iget v4, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 326
    :cond_2
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    if-nez v2, :cond_3

    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    if-nez v2, :cond_3

    goto :goto_1

    .line 327
    :cond_3
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    int-to-float v2, v2

    iget v4, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    int-to-float v4, v4

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 330
    :goto_1
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_4

    .line 331
    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 333
    :cond_4
    invoke-virtual {v0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 336
    .end local v1    # "matrix":Landroid/graphics/Matrix;
    :cond_5
    iput-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mCachedPath:Landroid/graphics/Path;

    .line 337
    return-object v0

    .line 290
    .end local v0    # "path":Landroid/graphics/Path;
    :catch_0
    move-exception v0

    .line 291
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to parse DisplayShapeCompat path data: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 283
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_6
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getPlatformDisplayShape()Landroid/view/DisplayShape;
    .registers 2

    .line 344
    const/4 v0, 0x0

    return-object v0
.end method

.method public hashCode()I
    .registers 9

    .line 365
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    .line 366
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iget v4, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget v6, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget v7, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    filled-new-array/range {v0 .. v7}, [Ljava/lang/Object;

    move-result-object v0

    .line 365
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 372
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DisplayShapeCompat{ spec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 373
    iget-object v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayShapeSpec:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, "null"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " displayWidth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " displayHeight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mDisplayHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " physicalPixelDisplaySizeRatio="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mPhysicalPixelDisplaySizeRatio:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " rotation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mRotation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " offsetX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " offsetY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mOffsetY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " scale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/core/view/DisplayShapeCompat$ImplBase;->mScale:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 372
    return-object v0
.end method
