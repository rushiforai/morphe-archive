.class public Lio/agora/rtc2/video/ColorEnhanceOptions;
.super Ljava/lang/Object;


# instance fields
.field public skinProtectLevel:F

.field public strengthLevel:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lio/agora/rtc2/video/ColorEnhanceOptions;->strengthLevel:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lio/agora/rtc2/video/ColorEnhanceOptions;->skinProtectLevel:F

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/ColorEnhanceOptions;->strengthLevel:F

    iput p2, p0, Lio/agora/rtc2/video/ColorEnhanceOptions;->skinProtectLevel:F

    return-void
.end method
