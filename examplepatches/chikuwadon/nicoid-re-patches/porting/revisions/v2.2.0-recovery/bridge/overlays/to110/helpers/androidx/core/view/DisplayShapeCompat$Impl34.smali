.class Landroidx/core/view/DisplayShapeCompat$Impl34;
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
    name = "Impl34"
.end annotation


# instance fields
.field private final mPlatformDisplayShape:Landroid/view/DisplayShape;


# direct methods
.method constructor <init>(Landroid/view/DisplayShape;)V
    .registers 2
    .param p1, "platformDisplayShape"    # Landroid/view/DisplayShape;

    .line 389
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 390
    iput-object p1, p0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    .line 391
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 407
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 408
    :cond_0
    instance-of v0, p1, Landroidx/core/view/DisplayShapeCompat$Impl34;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    .line 409
    :cond_1
    move-object v0, p1

    check-cast v0, Landroidx/core/view/DisplayShapeCompat$Impl34;

    .line 410
    .local v0, "that":Landroidx/core/view/DisplayShapeCompat$Impl34;
    iget-object v1, p0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    iget-object v2, v0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public getPath()Landroid/graphics/Path;
    .registers 2

    .line 396
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    invoke-virtual {v0}, Landroid/view/DisplayShape;->getPath()Landroid/graphics/Path;

    move-result-object v0

    return-object v0
.end method

.method public getPlatformDisplayShape()Landroid/view/DisplayShape;
    .registers 2

    .line 402
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .line 415
    iget-object v0, p0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 421
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DisplayShapeCompat{mPlatformDisplayShape="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/core/view/DisplayShapeCompat$Impl34;->mPlatformDisplayShape:Landroid/view/DisplayShape;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
