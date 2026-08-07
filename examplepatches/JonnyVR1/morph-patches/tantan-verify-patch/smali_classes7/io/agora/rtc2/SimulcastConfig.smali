.class public Lio/agora/rtc2/SimulcastConfig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;,
        Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;
    }
.end annotation


# instance fields
.field public final configs:[Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_COUNT_MAX:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    invoke-virtual {v0}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->getValue()I

    move-result v0

    new-array v0, v0, [Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;

    iput-object v0, p0, Lio/agora/rtc2/SimulcastConfig;->configs:[Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->STREAM_LAYER_COUNT_MAX:Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;

    invoke-virtual {v1}, Lio/agora/rtc2/SimulcastConfig$StreamLayerIndex;->getValue()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lio/agora/rtc2/SimulcastConfig;->configs:[Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;

    new-instance v2, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;

    invoke-direct {v2, p0}, Lio/agora/rtc2/SimulcastConfig$StreamLayerConfig;-><init>(Lio/agora/rtc2/SimulcastConfig;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
