.class public Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefSlamInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SlamImuInfo"
.end annotation


# instance fields
.field hasAccelerometer:I

.field hasGravity:I

.field hasGyroscope:I

.field hasOrientation:I


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
.method public setHasAccelerometer(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;->hasAccelerometer:I

    .line 2
    .line 3
    return-void
.end method

.method public setHasGravity(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;->hasGravity:I

    .line 2
    .line 3
    return-void
.end method

.method public setHasGyroscope(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;->hasGyroscope:I

    .line 2
    .line 3
    return-void
.end method

.method public setHasOrientation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;->hasOrientation:I

    .line 2
    .line 3
    return-void
.end method
