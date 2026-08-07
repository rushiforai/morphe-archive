.class public Lio/agora/rtc2/video/FilterEffectOptions;
.super Ljava/lang/Object;


# instance fields
.field public path:Ljava/lang/String;

.field public strength:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lio/agora/rtc2/video/FilterEffectOptions;->path:Ljava/lang/String;

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lio/agora/rtc2/video/FilterEffectOptions;->strength:F

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;F)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/video/FilterEffectOptions;->path:Ljava/lang/String;

    iput p2, p0, Lio/agora/rtc2/video/FilterEffectOptions;->strength:F

    return-void
.end method
