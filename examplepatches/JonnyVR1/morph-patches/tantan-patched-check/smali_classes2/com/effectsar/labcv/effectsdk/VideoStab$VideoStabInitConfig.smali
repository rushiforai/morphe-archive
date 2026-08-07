.class public Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/VideoStab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoStabInitConfig"
.end annotation


# instance fields
.field public videoStabMaxCropRatio:F

.field public videoStabMotionType:I

.field public videoStabSmoothRadius:I


# direct methods
.method public constructor <init>(IFI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;->videoStabSmoothRadius:I

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;->videoStabMaxCropRatio:F

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;->videoStabMotionType:I

    .line 9
    .line 10
    return-void
.end method
