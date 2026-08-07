.class public Lio/agora/rtc2/video/LowLightEnhanceOptions;
.super Ljava/lang/Object;


# static fields
.field public static final LOW_LIGHT_ENHANCE_AUTO:I = 0x0

.field public static final LOW_LIGHT_ENHANCE_LEVEL_FAST:I = 0x1

.field public static final LOW_LIGHT_ENHANCE_LEVEL_HIGH_QUALITY:I = 0x0

.field public static final LOW_LIGHT_ENHANCE_MANUAL:I = 0x1


# instance fields
.field public lowlightEnhanceLevel:I

.field public lowlightEnhanceMode:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/LowLightEnhanceOptions;->lowlightEnhanceMode:I

    iput v0, p0, Lio/agora/rtc2/video/LowLightEnhanceOptions;->lowlightEnhanceLevel:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/LowLightEnhanceOptions;->lowlightEnhanceMode:I

    iput p2, p0, Lio/agora/rtc2/video/LowLightEnhanceOptions;->lowlightEnhanceLevel:I

    return-void
.end method
