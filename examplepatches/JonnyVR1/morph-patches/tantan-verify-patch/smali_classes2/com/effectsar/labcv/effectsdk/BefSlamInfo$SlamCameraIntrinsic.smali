.class public Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefSlamInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SlamCameraIntrinsic"
.end annotation


# instance fields
.field public cx:F

.field public cy:F

.field public fx:F

.field public fy:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;->fx:F

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;->fy:F

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;->cx:F

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;->cy:F

    .line 11
    .line 12
    return-void
.end method
