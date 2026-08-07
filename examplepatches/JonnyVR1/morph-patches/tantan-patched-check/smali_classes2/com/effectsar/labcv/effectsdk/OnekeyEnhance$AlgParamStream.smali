.class public Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AlgParamStream"
.end annotation


# instance fields
.field amount_float:F

.field asf_scene_mode_int:I

.field contrast_factor_float:F

.field current_pixel_weight_float:F

.field hdr_version_int:I

.field luma_trigger_float:F

.field luminance_target_int0:I

.field luminance_target_int1:I

.field noise_factor_float:F

.field over_trigger_float:F

.field ratio_float:F

.field saturation_factor_float:F

.field under_trigger_float:F


# direct methods
.method public constructor <init>(IIFFFFFFIFFFI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->luminance_target_int0:I

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->luminance_target_int1:I

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->contrast_factor_float:F

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->saturation_factor_float:F

    .line 11
    .line 12
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->amount_float:F

    .line 13
    .line 14
    iput p6, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->ratio_float:F

    .line 15
    .line 16
    iput p7, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->noise_factor_float:F

    .line 17
    .line 18
    iput p8, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->current_pixel_weight_float:F

    .line 19
    .line 20
    iput p9, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->hdr_version_int:I

    .line 21
    .line 22
    iput p10, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->luma_trigger_float:F

    .line 23
    .line 24
    iput p11, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->over_trigger_float:F

    .line 25
    .line 26
    iput p12, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->under_trigger_float:F

    .line 27
    .line 28
    iput p13, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;->asf_scene_mode_int:I

    .line 29
    .line 30
    return-void
.end method
