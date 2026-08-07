.class public Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$SkeletonPoint;,
        Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$Skeleton;
    }
.end annotation


# instance fields
.field private skeletonNum:I

.field private skeletons:[Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$Skeleton;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getSkeletonNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;->skeletonNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getSkeletons()[Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$Skeleton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;->skeletons:[Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$Skeleton;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$Skeleton;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public setSkeletonNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;->skeletonNum:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BefSkeletonInfo{skeletons="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;->skeletons:[Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo$Skeleton;

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", skeletonNum="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;->skeletonNum:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/16 p0, 0x7d

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
