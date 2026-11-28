.class public final Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;
.super Ljava/lang/Object;
.source "DefaultBandwidthMeter.java"

# interfaces
.implements Landroidx/media3/exoplayer/upstream/BandwidthMeter;
.implements Landroidx/media3/datasource/TransferListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;,
        Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$Builder;
    }
.end annotation


# static fields
.field private static final BYTES_TRANSFERRED_FOR_ESTIMATE:I = 0x80000

.field private static final COUNTRY_GROUP_INDEX_MASK:I = 0x7

.field private static final COUNTRY_GROUP_SHIFT_2G:I = 0x3

.field private static final COUNTRY_GROUP_SHIFT_3G:I = 0x6

.field private static final COUNTRY_GROUP_SHIFT_4G:I = 0x9

.field private static final COUNTRY_GROUP_SHIFT_5G_NSA:I = 0xc

.field private static final COUNTRY_GROUP_SHIFT_5G_SA:I = 0xf

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATE:J = 0xf4240L

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATES_2G:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATES_3G:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATES_4G:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATES_5G_NSA:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATES_5G_SA:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_INITIAL_BITRATE_ESTIMATES_WIFI:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_SLIDING_WINDOW_MAX_WEIGHT:I = 0x7d0

.field private static final ELAPSED_MILLIS_FOR_ESTIMATE:I = 0x7d0

.field private static singletonInstance:Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;


# instance fields
.field private bitrateEstimate:J

.field private final clock:Landroidx/media3/common/util/Clock;

.field private final context:Landroid/content/Context;

.field private countryCode:Ljava/lang/String;

.field private final eventDispatcher:Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;

.field private final initialBitrateEstimates:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final initialBitrateSupplier:Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;

.field private lastReportedBitrateEstimate:J

.field private networkType:I

.field private networkTypeOverride:I

.field private networkTypeOverrideSet:Z

.field private final resetOnNetworkTypeChange:Z

.field private sampleBytesTransferred:J

.field private sampleStartTimeMs:J

.field private final slidingPercentile:Landroidx/media3/exoplayer/upstream/SlidingPercentile;

.field private streamCount:I

.field private totalBytesTransferred:J

.field private totalElapsedTimeMs:J


# direct methods
.method public static synthetic $r8$lambda$pO_odySZ98SgTVF8TZTXVnU5Mq8(Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;I)V
    .registers 2

    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->onNetworkTypeChanged(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 10

    const-wide/32 v0, 0x419ce0

    .line 58
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-wide/32 v1, 0x30d400

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-wide/32 v2, 0x249f00

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-wide/32 v3, 0x19f0a0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-wide/32 v4, 0xd1f60

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_WIFI:Lcom/google/common/collect/ImmutableList;

    const-wide/32 v0, 0x16e360

    .line 62
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-wide/32 v1, 0xef420

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-wide/32 v5, 0xb71b0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-wide/32 v5, 0x7ef40

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-wide/32 v6, 0x46cd0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v0, v1, v2, v5, v6}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_2G:Lcom/google/common/collect/ImmutableList;

    const-wide/32 v5, 0x1e8480

    .line 66
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-wide/32 v5, 0x13d620

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-wide/32 v5, 0xf4240

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-wide/32 v6, 0x94ed0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v0, v2, v5, v4, v6}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    sput-object v4, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_3G:Lcom/google/common/collect/ImmutableList;

    const-wide/32 v6, 0x2625a0

    .line 70
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-wide/32 v6, 0x124f80

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-wide/32 v7, 0xecd10

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const-wide/32 v8, 0xa6040

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v4, v3, v6, v7, v8}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    sput-object v4, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_4G:Lcom/google/common/collect/ImmutableList;

    const-wide/32 v6, 0x47b760

    .line 74
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-wide/32 v6, 0x2ab980

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-wide/32 v7, 0x200b20

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v4, v6, v7, v3, v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    sput-object v1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_5G_NSA:Lcom/google/common/collect/ImmutableList;

    const-wide/32 v3, 0x2932e0

    .line 78
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-wide/32 v3, 0x186a00

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v0, v3, v2, v5}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_5G_SA:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/util/Map;ILandroidx/media3/common/util/Clock;ZLandroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;I",
            "Landroidx/media3/common/util/Clock;",
            "Z",
            "Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;",
            ")V"
        }
    .end annotation

    .line 356
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 357
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->context:Landroid/content/Context;

    .line 358
    invoke-static {p2}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p2

    iput-object p2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->initialBitrateEstimates:Lcom/google/common/collect/ImmutableMap;

    .line 359
    new-instance p2, Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;

    invoke-direct {p2}, Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;-><init>()V

    iput-object p2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->eventDispatcher:Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;

    .line 360
    new-instance p2, Landroidx/media3/exoplayer/upstream/SlidingPercentile;

    invoke-direct {p2, p3}, Landroidx/media3/exoplayer/upstream/SlidingPercentile;-><init>(I)V

    iput-object p2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->slidingPercentile:Landroidx/media3/exoplayer/upstream/SlidingPercentile;

    .line 361
    iput-object p4, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->clock:Landroidx/media3/common/util/Clock;

    .line 362
    iput-boolean p5, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->resetOnNetworkTypeChange:Z

    .line 363
    iput-object p6, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->initialBitrateSupplier:Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;

    if-eqz p1, :cond_1

    .line 365
    invoke-static {p1}, Landroidx/media3/common/util/NetworkTypeObserver;->getInstance(Landroid/content/Context;)Landroidx/media3/common/util/NetworkTypeObserver;

    move-result-object p1

    .line 366
    invoke-virtual {p1}, Landroidx/media3/common/util/NetworkTypeObserver;->getNetworkType()I

    move-result p2

    iput p2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkType:I

    .line 367
    invoke-direct {p0, p2}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->getInitialBitrateEstimateForNetworkType(I)J

    move-result-wide p2

    iput-wide p2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J

    .line 368
    new-instance p2, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$0;

    invoke-direct {p2, p0}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$0;-><init>(Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;)V

    .line 369
    invoke-static {}, Landroidx/media3/common/util/BackgroundExecutor;->get()Ljava/util/concurrent/Executor;

    move-result-object p0

    .line 368
    invoke-virtual {p1, p2, p0}, Landroidx/media3/common/util/NetworkTypeObserver;->register(Landroidx/media3/common/util/NetworkTypeObserver$Listener;Ljava/util/concurrent/Executor;)V

    return-void

    :cond_1
    const/4 p1, 0x0

    .line 371
    iput p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkType:I

    const-wide/32 p1, 0xf4240

    .line 372
    iput-wide p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Ljava/util/Map;ILandroidx/media3/common/util/Clock;ZLandroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$1;)V
    .registers 8

    .line 54
    invoke-direct/range {p0 .. p6}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;-><init>(Landroid/content/Context;Ljava/util/Map;ILandroidx/media3/common/util/Clock;ZLandroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;)V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;I)J
    .registers 2

    .line 54
    invoke-static {p0, p1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->getInitialBitrateEstimatesForCountry(Ljava/lang/String;I)J

    move-result-wide p0

    return-wide p0
.end method

.method private static getInitialBitrateCountryGroupAssignment(Ljava/lang/String;)I
    .registers 4

    .line 571
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "ZW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xee

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "ZM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xed

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "ZA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xec

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "YT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xeb

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "YE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xea

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "XK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe9

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "WS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe8

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "WF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe7

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "VU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe6

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "VN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe5

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "VI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe4

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "VG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe3

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "VE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe2

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "VC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe1

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "VA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe0

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "UZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xdf

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "UY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xde

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "US"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xdd

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "UG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xdc

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "UA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xdb

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "TZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xda

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "TW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd9

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "TV"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd8

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "TT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd7

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "TR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd6

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "TO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd5

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "TN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd4

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "TM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd3

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "TL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd2

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "TJ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd1

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "TH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd0

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "TG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xcf

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "TD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xce

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "TC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xcd

    goto/16 :goto_0

    :sswitch_22
    const-string v0, "SZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xcc

    goto/16 :goto_0

    :sswitch_23
    const-string v0, "SY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xcb

    goto/16 :goto_0

    :sswitch_24
    const-string v0, "SX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xca

    goto/16 :goto_0

    :sswitch_25
    const-string v0, "SV"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc9

    goto/16 :goto_0

    :sswitch_26
    const-string v0, "ST"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc8

    goto/16 :goto_0

    :sswitch_27
    const-string v0, "SS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc7

    goto/16 :goto_0

    :sswitch_28
    const-string v0, "SR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc6

    goto/16 :goto_0

    :sswitch_29
    const-string v0, "SO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc5

    goto/16 :goto_0

    :sswitch_2a
    const-string v0, "SN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc4

    goto/16 :goto_0

    :sswitch_2b
    const-string v0, "SM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc3

    goto/16 :goto_0

    :sswitch_2c
    const-string v0, "SL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc2

    goto/16 :goto_0

    :sswitch_2d
    const-string v0, "SK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc1

    goto/16 :goto_0

    :sswitch_2e
    const-string v0, "SJ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc0

    goto/16 :goto_0

    :sswitch_2f
    const-string v0, "SI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xbf

    goto/16 :goto_0

    :sswitch_30
    const-string v0, "SH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xbe

    goto/16 :goto_0

    :sswitch_31
    const-string v0, "SG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xbd

    goto/16 :goto_0

    :sswitch_32
    const-string v0, "SE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xbc

    goto/16 :goto_0

    :sswitch_33
    const-string v0, "SD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xbb

    goto/16 :goto_0

    :sswitch_34
    const-string v0, "SC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xba

    goto/16 :goto_0

    :sswitch_35
    const-string v0, "SB"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb9

    goto/16 :goto_0

    :sswitch_36
    const-string v0, "SA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb8

    goto/16 :goto_0

    :sswitch_37
    const-string v0, "RW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb7

    goto/16 :goto_0

    :sswitch_38
    const-string v0, "RU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb6

    goto/16 :goto_0

    :sswitch_39
    const-string v0, "RS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb5

    goto/16 :goto_0

    :sswitch_3a
    const-string v0, "RO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb4

    goto/16 :goto_0

    :sswitch_3b
    const-string v0, "RE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb3

    goto/16 :goto_0

    :sswitch_3c
    const-string v0, "QA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb2

    goto/16 :goto_0

    :sswitch_3d
    const-string v0, "PY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb1

    goto/16 :goto_0

    :sswitch_3e
    const-string v0, "PW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb0

    goto/16 :goto_0

    :sswitch_3f
    const-string v0, "PT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xaf

    goto/16 :goto_0

    :sswitch_40
    const-string v0, "PS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xae

    goto/16 :goto_0

    :sswitch_41
    const-string v0, "PR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xad

    goto/16 :goto_0

    :sswitch_42
    const-string v0, "PM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xac

    goto/16 :goto_0

    :sswitch_43
    const-string v0, "PL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xab

    goto/16 :goto_0

    :sswitch_44
    const-string v0, "PK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xaa

    goto/16 :goto_0

    :sswitch_45
    const-string v0, "PH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa9

    goto/16 :goto_0

    :sswitch_46
    const-string v0, "PG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa8

    goto/16 :goto_0

    :sswitch_47
    const-string v0, "PF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa7

    goto/16 :goto_0

    :sswitch_48
    const-string v0, "PE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa6

    goto/16 :goto_0

    :sswitch_49
    const-string v0, "PA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa5

    goto/16 :goto_0

    :sswitch_4a
    const-string v0, "OM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa4

    goto/16 :goto_0

    :sswitch_4b
    const-string v0, "NZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa3

    goto/16 :goto_0

    :sswitch_4c
    const-string v0, "NU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa2

    goto/16 :goto_0

    :sswitch_4d
    const-string v0, "NR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa1

    goto/16 :goto_0

    :sswitch_4e
    const-string v0, "NP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa0

    goto/16 :goto_0

    :sswitch_4f
    const-string v0, "NO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9f

    goto/16 :goto_0

    :sswitch_50
    const-string v0, "NL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9e

    goto/16 :goto_0

    :sswitch_51
    const-string v0, "NI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9d

    goto/16 :goto_0

    :sswitch_52
    const-string v0, "NG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9c

    goto/16 :goto_0

    :sswitch_53
    const-string v0, "NF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9b

    goto/16 :goto_0

    :sswitch_54
    const-string v0, "NE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9a

    goto/16 :goto_0

    :sswitch_55
    const-string v0, "NC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x99

    goto/16 :goto_0

    :sswitch_56
    const-string v0, "NA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x98

    goto/16 :goto_0

    :sswitch_57
    const-string v0, "MZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x97

    goto/16 :goto_0

    :sswitch_58
    const-string v0, "MY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x96

    goto/16 :goto_0

    :sswitch_59
    const-string v0, "MX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x95

    goto/16 :goto_0

    :sswitch_5a
    const-string v0, "MW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x94

    goto/16 :goto_0

    :sswitch_5b
    const-string v0, "MV"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x93

    goto/16 :goto_0

    :sswitch_5c
    const-string v0, "MU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x92

    goto/16 :goto_0

    :sswitch_5d
    const-string v0, "MT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x91

    goto/16 :goto_0

    :sswitch_5e
    const-string v0, "MS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x90

    goto/16 :goto_0

    :sswitch_5f
    const-string v0, "MR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8f

    goto/16 :goto_0

    :sswitch_60
    const-string v0, "MQ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8e

    goto/16 :goto_0

    :sswitch_61
    const-string v0, "MP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8d

    goto/16 :goto_0

    :sswitch_62
    const-string v0, "MO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8c

    goto/16 :goto_0

    :sswitch_63
    const-string v0, "MN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8b

    goto/16 :goto_0

    :sswitch_64
    const-string v0, "MM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8a

    goto/16 :goto_0

    :sswitch_65
    const-string v0, "ML"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x89

    goto/16 :goto_0

    :sswitch_66
    const-string v0, "MK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x88

    goto/16 :goto_0

    :sswitch_67
    const-string v0, "MH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x87

    goto/16 :goto_0

    :sswitch_68
    const-string v0, "MG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x86

    goto/16 :goto_0

    :sswitch_69
    const-string v0, "MF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x85

    goto/16 :goto_0

    :sswitch_6a
    const-string v0, "ME"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x84

    goto/16 :goto_0

    :sswitch_6b
    const-string v0, "MD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x83

    goto/16 :goto_0

    :sswitch_6c
    const-string v0, "MC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x82

    goto/16 :goto_0

    :sswitch_6d
    const-string v0, "MA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x81

    goto/16 :goto_0

    :sswitch_6e
    const-string v0, "LY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x80

    goto/16 :goto_0

    :sswitch_6f
    const-string v0, "LV"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x7f

    goto/16 :goto_0

    :sswitch_70
    const-string v0, "LU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x7e

    goto/16 :goto_0

    :sswitch_71
    const-string v0, "LT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x7d

    goto/16 :goto_0

    :sswitch_72
    const-string v0, "LS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x7c

    goto/16 :goto_0

    :sswitch_73
    const-string v0, "LR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x7b

    goto/16 :goto_0

    :sswitch_74
    const-string v0, "LK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x7a

    goto/16 :goto_0

    :sswitch_75
    const-string v0, "LI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x79

    goto/16 :goto_0

    :sswitch_76
    const-string v0, "LC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x78

    goto/16 :goto_0

    :sswitch_77
    const-string v0, "LB"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x77

    goto/16 :goto_0

    :sswitch_78
    const-string v0, "LA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x76

    goto/16 :goto_0

    :sswitch_79
    const-string v0, "KZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x75

    goto/16 :goto_0

    :sswitch_7a
    const-string v0, "KY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x74

    goto/16 :goto_0

    :sswitch_7b
    const-string v0, "KW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x73

    goto/16 :goto_0

    :sswitch_7c
    const-string v0, "KR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x72

    goto/16 :goto_0

    :sswitch_7d
    const-string v0, "KN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x71

    goto/16 :goto_0

    :sswitch_7e
    const-string v0, "KM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x70

    goto/16 :goto_0

    :sswitch_7f
    const-string v0, "KI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x6f

    goto/16 :goto_0

    :sswitch_80
    const-string v0, "KH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x6e

    goto/16 :goto_0

    :sswitch_81
    const-string v0, "KG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x6d

    goto/16 :goto_0

    :sswitch_82
    const-string v0, "KE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x6c

    goto/16 :goto_0

    :sswitch_83
    const-string v0, "JP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x6b

    goto/16 :goto_0

    :sswitch_84
    const-string v0, "JO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x6a

    goto/16 :goto_0

    :sswitch_85
    const-string v0, "JM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x69

    goto/16 :goto_0

    :sswitch_86
    const-string v0, "JE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x68

    goto/16 :goto_0

    :sswitch_87
    const-string v0, "IT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x67

    goto/16 :goto_0

    :sswitch_88
    const-string v0, "IS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x66

    goto/16 :goto_0

    :sswitch_89
    const-string v0, "IR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x65

    goto/16 :goto_0

    :sswitch_8a
    const-string v0, "IQ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x64

    goto/16 :goto_0

    :sswitch_8b
    const-string v0, "IO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x63

    goto/16 :goto_0

    :sswitch_8c
    const-string v0, "IN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x62

    goto/16 :goto_0

    :sswitch_8d
    const-string v0, "IM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x61

    goto/16 :goto_0

    :sswitch_8e
    const-string v0, "IL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x60

    goto/16 :goto_0

    :sswitch_8f
    const-string v0, "IE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x5f

    goto/16 :goto_0

    :sswitch_90
    const-string v0, "ID"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x5e

    goto/16 :goto_0

    :sswitch_91
    const-string v0, "HU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x5d

    goto/16 :goto_0

    :sswitch_92
    const-string v0, "HT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x5c

    goto/16 :goto_0

    :sswitch_93
    const-string v0, "HR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x5b

    goto/16 :goto_0

    :sswitch_94
    const-string v0, "HK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x5a

    goto/16 :goto_0

    :sswitch_95
    const-string v0, "GY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x59

    goto/16 :goto_0

    :sswitch_96
    const-string v0, "GW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x58

    goto/16 :goto_0

    :sswitch_97
    const-string v0, "GU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x57

    goto/16 :goto_0

    :sswitch_98
    const-string v0, "GT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x56

    goto/16 :goto_0

    :sswitch_99
    const-string v0, "GR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x55

    goto/16 :goto_0

    :sswitch_9a
    const-string v0, "GQ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x54

    goto/16 :goto_0

    :sswitch_9b
    const-string v0, "GP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x53

    goto/16 :goto_0

    :sswitch_9c
    const-string v0, "GN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x52

    goto/16 :goto_0

    :sswitch_9d
    const-string v0, "GM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x51

    goto/16 :goto_0

    :sswitch_9e
    const-string v0, "GL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x50

    goto/16 :goto_0

    :sswitch_9f
    const-string v0, "GI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x4f

    goto/16 :goto_0

    :sswitch_a0
    const-string v0, "GH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x4e

    goto/16 :goto_0

    :sswitch_a1
    const-string v0, "GG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x4d

    goto/16 :goto_0

    :sswitch_a2
    const-string v0, "GF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x4c

    goto/16 :goto_0

    :sswitch_a3
    const-string v0, "GE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x4b

    goto/16 :goto_0

    :sswitch_a4
    const-string v0, "GD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x4a

    goto/16 :goto_0

    :sswitch_a5
    const-string v0, "GB"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x49

    goto/16 :goto_0

    :sswitch_a6
    const-string v0, "GA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x48

    goto/16 :goto_0

    :sswitch_a7
    const-string v0, "FR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x47

    goto/16 :goto_0

    :sswitch_a8
    const-string v0, "FO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x46

    goto/16 :goto_0

    :sswitch_a9
    const-string v0, "FM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x45

    goto/16 :goto_0

    :sswitch_aa
    const-string v0, "FK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x44

    goto/16 :goto_0

    :sswitch_ab
    const-string v0, "FJ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x43

    goto/16 :goto_0

    :sswitch_ac
    const-string v0, "FI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x42

    goto/16 :goto_0

    :sswitch_ad
    const-string v0, "ET"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x41

    goto/16 :goto_0

    :sswitch_ae
    const-string v0, "ES"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x40

    goto/16 :goto_0

    :sswitch_af
    const-string v0, "ER"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x3f

    goto/16 :goto_0

    :sswitch_b0
    const-string v0, "EG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x3e

    goto/16 :goto_0

    :sswitch_b1
    const-string v0, "EE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x3d

    goto/16 :goto_0

    :sswitch_b2
    const-string v0, "EC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x3c

    goto/16 :goto_0

    :sswitch_b3
    const-string v0, "DZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x3b

    goto/16 :goto_0

    :sswitch_b4
    const-string v0, "DO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x3a

    goto/16 :goto_0

    :sswitch_b5
    const-string v0, "DM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x39

    goto/16 :goto_0

    :sswitch_b6
    const-string v0, "DK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x38

    goto/16 :goto_0

    :sswitch_b7
    const-string v0, "DJ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x37

    goto/16 :goto_0

    :sswitch_b8
    const-string v0, "DE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x36

    goto/16 :goto_0

    :sswitch_b9
    const-string v0, "CZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x35

    goto/16 :goto_0

    :sswitch_ba
    const-string v0, "CY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x34

    goto/16 :goto_0

    :sswitch_bb
    const-string v0, "CX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x33

    goto/16 :goto_0

    :sswitch_bc
    const-string v0, "CW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x32

    goto/16 :goto_0

    :sswitch_bd
    const-string v0, "CV"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x31

    goto/16 :goto_0

    :sswitch_be
    const-string v0, "CU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x30

    goto/16 :goto_0

    :sswitch_bf
    const-string v0, "CR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x2f

    goto/16 :goto_0

    :sswitch_c0
    const-string v0, "CO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x2e

    goto/16 :goto_0

    :sswitch_c1
    const-string v0, "CN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x2d

    goto/16 :goto_0

    :sswitch_c2
    const-string v0, "CM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x2c

    goto/16 :goto_0

    :sswitch_c3
    const-string v0, "CL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_c4
    const-string v0, "CK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_c5
    const-string v0, "CI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_c6
    const-string v0, "CH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_c7
    const-string v0, "CG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_c8
    const-string v0, "CF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_c9
    const-string v0, "CD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_ca
    const-string v0, "CA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_cb
    const-string v0, "BZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_cc
    const-string v0, "BY"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_cd
    const-string v0, "BW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_ce
    const-string v0, "BT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_cf
    const-string v0, "BS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_d0
    const-string v0, "BR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_d1
    const-string v0, "BQ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_d2
    const-string v0, "BO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_d3
    const-string v0, "BN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_d4
    const-string v0, "BM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_d5
    const-string v0, "BL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_d6
    const-string v0, "BJ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_d7
    const-string v0, "BI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_d8
    const-string v0, "BH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_d9
    const-string v0, "BG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_da
    const-string v0, "BF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_db
    const-string v0, "BE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_dc
    const-string v0, "BD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_dd
    const-string v0, "BB"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_de
    const-string v0, "BA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_df
    const-string v0, "AZ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_e0
    const-string v0, "AX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_e1
    const-string v0, "AW"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_e2
    const-string v0, "AU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_e3
    const-string v0, "AT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_e4
    const-string v0, "AS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_e5
    const-string v0, "AR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x9

    goto :goto_0

    :sswitch_e6
    const-string v0, "AQ"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/16 v2, 0x8

    goto :goto_0

    :sswitch_e7
    const-string v0, "AO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x7

    goto :goto_0

    :sswitch_e8
    const-string v0, "AM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x6

    goto :goto_0

    :sswitch_e9
    const-string v0, "AL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x5

    goto :goto_0

    :sswitch_ea
    const-string v0, "AI"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :sswitch_eb
    const-string v0, "AG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :sswitch_ec
    const-string v0, "AF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :sswitch_ed
    const-string v0, "AE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :sswitch_ee
    const-string v0, "AD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move v2, v1

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    const p0, 0x12492

    return p0

    :pswitch_0
    const p0, 0x12724

    return p0

    :pswitch_1
    const p0, 0x112a2

    return p0

    :pswitch_2
    const p0, 0x12251

    return p0

    :pswitch_3
    const p0, 0x12440

    return p0

    :pswitch_4
    const p0, 0x12450

    return p0

    :pswitch_5
    const p0, 0x22252

    return p0

    :pswitch_6
    const p0, 0x138d1

    return p0

    :pswitch_7
    const p0, 0x1144a

    return p0

    :pswitch_8
    const p0, 0xb312

    return p0

    :pswitch_9
    const p0, 0x1469b

    return p0

    :pswitch_a
    const p0, 0x132a3    # 1.1E-40f

    return p0

    :pswitch_b
    return v1

    :pswitch_c
    const p0, 0x12062

    return p0

    :pswitch_d
    const p0, 0x12713

    return p0

    :pswitch_e
    const p0, 0x1224b

    return p0

    :pswitch_f
    const p0, 0x12063

    return p0

    :pswitch_10
    const p0, 0x12453

    return p0

    :pswitch_11
    const p0, 0x1229a

    return p0

    :pswitch_12
    const p0, 0x12452

    return p0

    :pswitch_13
    const p0, 0x12322

    return p0

    :pswitch_14
    const p0, 0x148d2

    return p0

    :pswitch_15
    const p0, 0x124e4

    return p0

    :pswitch_16
    const p0, 0x12248

    return p0

    :pswitch_17
    const p0, 0x96da

    return p0

    :pswitch_18
    const p0, 0x12714

    return p0

    :pswitch_19
    const/16 p0, 0x244b

    return p0

    :pswitch_1a
    const p0, 0x1209b

    return p0

    :pswitch_1b
    const p0, 0x1b201

    return p0

    :pswitch_1c
    const p0, 0x12201

    return p0

    :pswitch_1d
    const p0, 0x13240

    return p0

    :pswitch_1e
    const p0, 0x11698

    return p0

    :pswitch_1f
    const p0, 0x14921

    return p0

    :pswitch_20
    const p0, 0x12312

    return p0

    :pswitch_21
    const p0, 0x12663

    return p0

    :pswitch_22
    const/16 p0, 0x2282

    return p0

    :pswitch_23
    const p0, 0x24481

    return p0

    :pswitch_24
    const p0, 0x126db

    return p0

    :pswitch_25
    const p0, 0xa68a

    return p0

    :pswitch_26
    const p0, 0x122d2

    return p0

    :pswitch_27
    const p0, 0x13911

    return p0

    :pswitch_28
    const p0, 0x1445a

    return p0

    :pswitch_29
    const p0, 0x14440

    return p0

    :pswitch_2a
    const p0, 0x12712

    return p0

    :pswitch_2b
    const p0, 0x100c0

    return p0

    :pswitch_2c
    const p0, 0x2070a

    return p0

    :pswitch_2d
    const p0, 0x122a3

    return p0

    :pswitch_2e
    const p0, 0x128da

    return p0

    :pswitch_2f
    const p0, 0x124e3

    return p0

    :pswitch_30
    const p0, 0x1248b

    return p0

    :pswitch_31
    const/16 p0, 0x1301

    return p0

    :pswitch_32
    const p0, 0x13922

    return p0

    :pswitch_33
    const p0, 0x12293

    return p0

    :pswitch_34
    const p0, 0x14653

    return p0

    :pswitch_35
    const p0, 0x1240b

    return p0

    :pswitch_36
    const p0, 0x1268a

    return p0

    :pswitch_37
    const p0, 0xb910

    return p0

    :pswitch_38
    const p0, 0x12482

    return p0

    :pswitch_39
    const p0, 0x13201

    return p0

    :pswitch_3a
    const p0, 0x12894

    return p0

    :pswitch_3b
    const p0, 0x12691

    return p0

    :pswitch_3c
    const p0, 0x13202

    return p0

    :pswitch_3d
    const p0, 0x12001

    return p0

    :pswitch_3e
    const p0, 0x1225b

    return p0

    :pswitch_3f
    const p0, 0x194c4

    return p0

    :pswitch_40
    const p0, 0x10208

    return p0

    :pswitch_41
    const p0, 0x126dc

    return p0

    :pswitch_42
    const p0, 0x146d3

    return p0

    :pswitch_43
    const p0, 0x12252

    return p0

    :pswitch_44
    const p0, 0x1244b

    return p0

    :pswitch_45
    const p0, 0x12651

    return p0

    :pswitch_46
    const p0, 0x1348a

    return p0

    :pswitch_47
    const p0, 0x24890

    return p0

    :pswitch_48
    const p0, 0x124dc

    return p0

    :pswitch_49
    const p0, 0x12501

    return p0

    :pswitch_4a
    const p0, 0x1244a

    return p0

    :pswitch_4b
    const p0, 0x11253

    return p0

    :pswitch_4c
    const p0, 0x14698

    return p0

    :pswitch_4d
    const p0, 0x122e2

    return p0

    :pswitch_4e
    const p0, 0x11448

    return p0

    :pswitch_4f
    const p0, 0x1c6d4

    return p0

    :pswitch_50
    const p0, 0x124d3

    return p0

    :pswitch_51
    const p0, 0x12093

    return p0

    :pswitch_52
    const p0, 0x1a4c9

    return p0

    :pswitch_53
    const p0, 0x14691

    return p0

    :pswitch_54
    const p0, 0x11249

    return p0

    :pswitch_55
    const p0, 0x226cb

    return p0

    :pswitch_56
    const p0, 0x10001

    return p0

    :pswitch_57
    const/16 p0, 0x1208

    return p0

    :pswitch_58
    const p0, 0x1264b

    return p0

    :pswitch_59
    const p0, 0x12464

    return p0

    :pswitch_5a
    const p0, 0x13712

    return p0

    :pswitch_5b
    const p0, 0x1228a

    return p0

    :pswitch_5c
    const p0, 0x11001

    return p0

    :pswitch_5d
    const p0, 0x1264a

    return p0

    :pswitch_5e
    const p0, 0x12523

    return p0

    :pswitch_5f
    const p0, 0x1289c

    return p0

    :pswitch_60
    const p0, 0x12091

    return p0

    :pswitch_61
    const p0, 0x12210

    return p0

    :pswitch_62
    const p0, 0x124db

    return p0

    :pswitch_63
    const p0, 0x12250

    return p0

    :pswitch_64
    const p0, 0x126d3

    return p0

    :pswitch_65
    const p0, 0x12409

    return p0

    :pswitch_66
    const p0, 0x12012

    return p0

    :pswitch_67
    const p0, 0x124c9

    return p0

    :pswitch_68
    const p0, 0x12023

    return p0

    :pswitch_69
    const p0, 0x10249

    return p0

    :pswitch_6a
    const p0, 0x12090

    return p0

    :pswitch_6b
    const p0, 0x12114

    return p0

    :pswitch_6c
    const p0, 0x12493

    return p0

    :pswitch_6d
    const p0, 0x12693

    return p0

    :pswitch_6e
    const p0, 0x10200

    return p0

    :pswitch_6f
    const p0, 0x1491c

    return p0

    :pswitch_70
    const/16 p0, 0x1000

    return p0

    :pswitch_71
    const p0, 0x12299

    return p0

    :pswitch_72
    const p0, 0x1291b

    return p0

    :pswitch_73
    const p0, 0x12923

    return p0

    :pswitch_74
    const p0, 0x10080

    return p0

    :pswitch_75
    const p0, 0xa508

    return p0

    :pswitch_76
    const p0, 0x11080

    return p0

    :pswitch_77
    const p0, 0x10041

    return p0

    :pswitch_78
    const p0, 0x1221a

    return p0

    :pswitch_79
    const p0, 0x12914

    return p0

    :pswitch_7a
    const p0, 0x12922

    return p0

    :pswitch_7b
    const p0, 0x124da

    return p0

    :pswitch_7c
    const p0, 0xb242

    return p0

    :pswitch_7d
    const p0, 0x128dc

    return p0

    :pswitch_7e
    const p0, 0x12488

    return p0

    :pswitch_7f
    const p0, 0x10008

    return p0

    :pswitch_80
    const p0, 0x126e3

    return p0

    :pswitch_81
    const p0, 0x12514

    return p0

    :pswitch_82
    const p0, 0x1249b

    return p0

    :pswitch_83
    const p0, 0x1b450

    return p0

    :pswitch_84
    const p0, 0x12292

    return p0

    :pswitch_85
    const p0, 0x126d1

    return p0

    :pswitch_86
    const p0, 0x12053

    return p0

    :pswitch_87
    const p0, 0x1348b

    return p0

    :pswitch_88
    const p0, 0x12253

    return p0

    :pswitch_89
    const p0, 0x22249

    return p0

    :pswitch_8a
    const p0, 0x12911

    return p0

    :pswitch_8b
    const p0, 0x12013

    return p0

    :pswitch_8c
    const p0, 0x12010

    return p0

    :pswitch_8d
    const p0, 0x12491

    return p0

    :pswitch_8e
    const p0, 0x126a4

    return p0

    :pswitch_8f
    const p0, 0x12924

    return p0

    :pswitch_90
    const p0, 0x14659

    return p0

    :pswitch_91
    const p0, 0x11000

    return p0

    :pswitch_92
    const p0, 0x1291c

    return p0

    :pswitch_93
    const p0, 0x11040

    return p0

    :pswitch_94
    const p0, 0x144ca

    return p0

    :pswitch_95
    const p0, 0x12249

    return p0

    :pswitch_96
    const p0, 0x126d4

    return p0

    :pswitch_97
    const p0, 0x12490

    return p0

    :pswitch_98
    const p0, 0x128d2

    return p0

    :pswitch_99
    const/16 p0, 0x3258

    return p0

    :pswitch_9a
    const/high16 p0, 0x10000

    return p0

    :pswitch_9b
    const p0, 0x126d2

    return p0

    :pswitch_9c
    const p0, 0x11492

    return p0

    :pswitch_9d
    const p0, 0x12494

    return p0

    :pswitch_9e
    const p0, 0x12723

    return p0

    :pswitch_9f
    const p0, 0x1269a

    return p0

    :pswitch_a0
    const p0, 0x12449

    return p0

    :pswitch_a1
    const p0, 0x128e2

    return p0

    :pswitch_a2
    const p0, 0x128e4

    return p0

    :pswitch_a3
    const p0, 0xc6a1

    return p0

    :pswitch_a4
    const p0, 0x12011

    return p0

    :sswitch_data_0
    .sparse-switch
        0x823 -> :sswitch_ee
        0x824 -> :sswitch_ed
        0x825 -> :sswitch_ec
        0x826 -> :sswitch_eb
        0x828 -> :sswitch_ea
        0x82b -> :sswitch_e9
        0x82c -> :sswitch_e8
        0x82e -> :sswitch_e7
        0x830 -> :sswitch_e6
        0x831 -> :sswitch_e5
        0x832 -> :sswitch_e4
        0x833 -> :sswitch_e3
        0x834 -> :sswitch_e2
        0x836 -> :sswitch_e1
        0x837 -> :sswitch_e0
        0x839 -> :sswitch_df
        0x83f -> :sswitch_de
        0x840 -> :sswitch_dd
        0x842 -> :sswitch_dc
        0x843 -> :sswitch_db
        0x844 -> :sswitch_da
        0x845 -> :sswitch_d9
        0x846 -> :sswitch_d8
        0x847 -> :sswitch_d7
        0x848 -> :sswitch_d6
        0x84a -> :sswitch_d5
        0x84b -> :sswitch_d4
        0x84c -> :sswitch_d3
        0x84d -> :sswitch_d2
        0x84f -> :sswitch_d1
        0x850 -> :sswitch_d0
        0x851 -> :sswitch_cf
        0x852 -> :sswitch_ce
        0x855 -> :sswitch_cd
        0x857 -> :sswitch_cc
        0x858 -> :sswitch_cb
        0x85e -> :sswitch_ca
        0x861 -> :sswitch_c9
        0x863 -> :sswitch_c8
        0x864 -> :sswitch_c7
        0x865 -> :sswitch_c6
        0x866 -> :sswitch_c5
        0x868 -> :sswitch_c4
        0x869 -> :sswitch_c3
        0x86a -> :sswitch_c2
        0x86b -> :sswitch_c1
        0x86c -> :sswitch_c0
        0x86f -> :sswitch_bf
        0x872 -> :sswitch_be
        0x873 -> :sswitch_bd
        0x874 -> :sswitch_bc
        0x875 -> :sswitch_bb
        0x876 -> :sswitch_ba
        0x877 -> :sswitch_b9
        0x881 -> :sswitch_b8
        0x886 -> :sswitch_b7
        0x887 -> :sswitch_b6
        0x889 -> :sswitch_b5
        0x88b -> :sswitch_b4
        0x896 -> :sswitch_b3
        0x89e -> :sswitch_b2
        0x8a0 -> :sswitch_b1
        0x8a2 -> :sswitch_b0
        0x8ad -> :sswitch_af
        0x8ae -> :sswitch_ae
        0x8af -> :sswitch_ad
        0x8c3 -> :sswitch_ac
        0x8c4 -> :sswitch_ab
        0x8c5 -> :sswitch_aa
        0x8c7 -> :sswitch_a9
        0x8c9 -> :sswitch_a8
        0x8cc -> :sswitch_a7
        0x8da -> :sswitch_a6
        0x8db -> :sswitch_a5
        0x8dd -> :sswitch_a4
        0x8de -> :sswitch_a3
        0x8df -> :sswitch_a2
        0x8e0 -> :sswitch_a1
        0x8e1 -> :sswitch_a0
        0x8e2 -> :sswitch_9f
        0x8e5 -> :sswitch_9e
        0x8e6 -> :sswitch_9d
        0x8e7 -> :sswitch_9c
        0x8e9 -> :sswitch_9b
        0x8ea -> :sswitch_9a
        0x8eb -> :sswitch_99
        0x8ed -> :sswitch_98
        0x8ee -> :sswitch_97
        0x8f0 -> :sswitch_96
        0x8f2 -> :sswitch_95
        0x903 -> :sswitch_94
        0x90a -> :sswitch_93
        0x90c -> :sswitch_92
        0x90d -> :sswitch_91
        0x91b -> :sswitch_90
        0x91c -> :sswitch_8f
        0x923 -> :sswitch_8e
        0x924 -> :sswitch_8d
        0x925 -> :sswitch_8c
        0x926 -> :sswitch_8b
        0x928 -> :sswitch_8a
        0x929 -> :sswitch_89
        0x92a -> :sswitch_88
        0x92b -> :sswitch_87
        0x93b -> :sswitch_86
        0x943 -> :sswitch_85
        0x945 -> :sswitch_84
        0x946 -> :sswitch_83
        0x95a -> :sswitch_82
        0x95c -> :sswitch_81
        0x95d -> :sswitch_80
        0x95e -> :sswitch_7f
        0x962 -> :sswitch_7e
        0x963 -> :sswitch_7d
        0x967 -> :sswitch_7c
        0x96c -> :sswitch_7b
        0x96e -> :sswitch_7a
        0x96f -> :sswitch_79
        0x975 -> :sswitch_78
        0x976 -> :sswitch_77
        0x977 -> :sswitch_76
        0x97d -> :sswitch_75
        0x97f -> :sswitch_74
        0x986 -> :sswitch_73
        0x987 -> :sswitch_72
        0x988 -> :sswitch_71
        0x989 -> :sswitch_70
        0x98a -> :sswitch_6f
        0x98d -> :sswitch_6e
        0x994 -> :sswitch_6d
        0x996 -> :sswitch_6c
        0x997 -> :sswitch_6b
        0x998 -> :sswitch_6a
        0x999 -> :sswitch_69
        0x99a -> :sswitch_68
        0x99b -> :sswitch_67
        0x99e -> :sswitch_66
        0x99f -> :sswitch_65
        0x9a0 -> :sswitch_64
        0x9a1 -> :sswitch_63
        0x9a2 -> :sswitch_62
        0x9a3 -> :sswitch_61
        0x9a4 -> :sswitch_60
        0x9a5 -> :sswitch_5f
        0x9a6 -> :sswitch_5e
        0x9a7 -> :sswitch_5d
        0x9a8 -> :sswitch_5c
        0x9a9 -> :sswitch_5b
        0x9aa -> :sswitch_5a
        0x9ab -> :sswitch_59
        0x9ac -> :sswitch_58
        0x9ad -> :sswitch_57
        0x9b3 -> :sswitch_56
        0x9b5 -> :sswitch_55
        0x9b7 -> :sswitch_54
        0x9b8 -> :sswitch_53
        0x9b9 -> :sswitch_52
        0x9bb -> :sswitch_51
        0x9be -> :sswitch_50
        0x9c1 -> :sswitch_4f
        0x9c2 -> :sswitch_4e
        0x9c4 -> :sswitch_4d
        0x9c7 -> :sswitch_4c
        0x9cc -> :sswitch_4b
        0x9de -> :sswitch_4a
        0x9f1 -> :sswitch_49
        0x9f5 -> :sswitch_48
        0x9f6 -> :sswitch_47
        0x9f7 -> :sswitch_46
        0x9f8 -> :sswitch_45
        0x9fb -> :sswitch_44
        0x9fc -> :sswitch_43
        0x9fd -> :sswitch_42
        0xa02 -> :sswitch_41
        0xa03 -> :sswitch_40
        0xa04 -> :sswitch_3f
        0xa07 -> :sswitch_3e
        0xa09 -> :sswitch_3d
        0xa10 -> :sswitch_3c
        0xa33 -> :sswitch_3b
        0xa3d -> :sswitch_3a
        0xa41 -> :sswitch_39
        0xa43 -> :sswitch_38
        0xa45 -> :sswitch_37
        0xa4e -> :sswitch_36
        0xa4f -> :sswitch_35
        0xa50 -> :sswitch_34
        0xa51 -> :sswitch_33
        0xa52 -> :sswitch_32
        0xa54 -> :sswitch_31
        0xa55 -> :sswitch_30
        0xa56 -> :sswitch_2f
        0xa57 -> :sswitch_2e
        0xa58 -> :sswitch_2d
        0xa59 -> :sswitch_2c
        0xa5a -> :sswitch_2b
        0xa5b -> :sswitch_2a
        0xa5c -> :sswitch_29
        0xa5f -> :sswitch_28
        0xa60 -> :sswitch_27
        0xa61 -> :sswitch_26
        0xa63 -> :sswitch_25
        0xa65 -> :sswitch_24
        0xa66 -> :sswitch_23
        0xa67 -> :sswitch_22
        0xa6f -> :sswitch_21
        0xa70 -> :sswitch_20
        0xa73 -> :sswitch_1f
        0xa74 -> :sswitch_1e
        0xa76 -> :sswitch_1d
        0xa78 -> :sswitch_1c
        0xa79 -> :sswitch_1b
        0xa7a -> :sswitch_1a
        0xa7b -> :sswitch_19
        0xa7e -> :sswitch_18
        0xa80 -> :sswitch_17
        0xa82 -> :sswitch_16
        0xa83 -> :sswitch_15
        0xa86 -> :sswitch_14
        0xa8c -> :sswitch_13
        0xa92 -> :sswitch_12
        0xa9e -> :sswitch_11
        0xaa4 -> :sswitch_10
        0xaa5 -> :sswitch_f
        0xaab -> :sswitch_e
        0xaad -> :sswitch_d
        0xaaf -> :sswitch_c
        0xab1 -> :sswitch_b
        0xab3 -> :sswitch_a
        0xab8 -> :sswitch_9
        0xabf -> :sswitch_8
        0xacf -> :sswitch_7
        0xadc -> :sswitch_6
        0xaf3 -> :sswitch_5
        0xb0c -> :sswitch_4
        0xb1b -> :sswitch_3
        0xb27 -> :sswitch_2
        0xb33 -> :sswitch_1
        0xb3d -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a4
        :pswitch_a3
        :pswitch_a2
        :pswitch_a1
        :pswitch_a4
        :pswitch_a0
        :pswitch_9f
        :pswitch_9e
        :pswitch_9d
        :pswitch_9c
        :pswitch_9b
        :pswitch_9a
        :pswitch_99
        :pswitch_98
        :pswitch_97
        :pswitch_96
        :pswitch_95
        :pswitch_a4
        :pswitch_94
        :pswitch_93
        :pswitch_92
        :pswitch_91
        :pswitch_90
        :pswitch_8f
        :pswitch_8e
        :pswitch_8d
        :pswitch_8c
        :pswitch_8b
        :pswitch_8a
        :pswitch_a4
        :pswitch_89
        :pswitch_88
        :pswitch_87
        :pswitch_86
        :pswitch_85
        :pswitch_84
        :pswitch_83
        :pswitch_82
        :pswitch_81
        :pswitch_80
        :pswitch_7f
        :pswitch_a1
        :pswitch_84
        :pswitch_7e
        :pswitch_7d
        :pswitch_7c
        :pswitch_7b
        :pswitch_7a
        :pswitch_79
        :pswitch_78
        :pswitch_a4
        :pswitch_97
        :pswitch_77
        :pswitch_76
        :pswitch_75
        :pswitch_96
        :pswitch_74
        :pswitch_a4
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_9a
        :pswitch_80
        :pswitch_9d
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_8f
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_8f
        :pswitch_9a
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_61
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_9a
        :pswitch_4e
        :pswitch_61
        :pswitch_4d
        :pswitch_95
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_79
        :pswitch_48
        :pswitch_a4
        :pswitch_47
        :pswitch_56
        :pswitch_a4
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_97
        :pswitch_42
        :pswitch_73
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_9a
        :pswitch_96
        :pswitch_3e
        :pswitch_60
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_80
        :pswitch_3a
        :pswitch_39
        :pswitch_82
        :pswitch_42
        :pswitch_38
        :pswitch_37
        :pswitch_8d
        :pswitch_36
        :pswitch_7d
        :pswitch_97
        :pswitch_9a
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_8f
        :pswitch_6c
        :pswitch_2d
        :pswitch_7a
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_79
        :pswitch_9d
        :pswitch_29
        :pswitch_28
        :pswitch_9f
        :pswitch_27
        :pswitch_26
        :pswitch_41
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_97
        :pswitch_22
        :pswitch_21
        :pswitch_91
        :pswitch_20
        :pswitch_8d
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_9d
        :pswitch_92
        :pswitch_9a
        :pswitch_17
        :pswitch_9d
        :pswitch_91
        :pswitch_6c
        :pswitch_16
        :pswitch_96
        :pswitch_97
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_5f
        :pswitch_12
        :pswitch_11
        :pswitch_a4
        :pswitch_92
        :pswitch_a2
        :pswitch_10
        :pswitch_92
        :pswitch_f
        :pswitch_7e
        :pswitch_72
        :pswitch_79
        :pswitch_3a
        :pswitch_e
        :pswitch_d
        :pswitch_95
        :pswitch_c
        :pswitch_3a
        :pswitch_b
        :pswitch_a
        :pswitch_83
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_97
        :pswitch_a4
        :pswitch_8f
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_48
        :pswitch_3a
        :pswitch_30
        :pswitch_2
        :pswitch_8f
        :pswitch_2e
        :pswitch_1
        :pswitch_0
        :pswitch_18
    .end packed-switch
.end method

.method private getInitialBitrateEstimateForNetworkType(I)J
    .registers 7

    .line 512
    iget-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->initialBitrateSupplier:Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;

    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    if-eqz v0, :cond_0

    .line 513
    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$InitialBitrateSupplier;->getInitialBitrateEstimate(I)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-eqz v0, :cond_0

    return-wide v3

    .line 518
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->initialBitrateEstimates:Lcom/google/common/collect/ImmutableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_1

    .line 520
    iget-object p0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->initialBitrateEstimates:Lcom/google/common/collect/ImmutableMap;

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/lang/Long;

    goto :goto_0

    .line 521
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v1, v3, v1

    if-nez v1, :cond_2

    .line 522
    iget-object p0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->countryCode:Ljava/lang/String;

    invoke-static {p0, p1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->getInitialBitrateEstimatesForCountry(Ljava/lang/String;I)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :cond_2
    :goto_0
    if-nez v0, :cond_3

    const-wide/32 p0, 0xf4240

    .line 525
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 527
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method private static getInitialBitrateEstimatesForCountry(Ljava/lang/String;I)J
    .registers 5

    .line 536
    invoke-static {p0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->getInitialBitrateCountryGroupAssignment(Ljava/lang/String;)I

    move-result p0

    const/4 v0, 0x2

    const/4 v1, 0x7

    if-eq p1, v0, :cond_5

    const/4 v0, 0x3

    if-eq p1, v0, :cond_4

    const/4 v0, 0x4

    if-eq p1, v0, :cond_3

    const/4 v0, 0x5

    const/16 v2, 0x9

    if-eq p1, v0, :cond_2

    if-eq p1, v1, :cond_5

    if-eq p1, v2, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_0

    const-wide/32 p0, 0xf4240

    return-wide p0

    .line 553
    :cond_0
    sget-object p1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_5G_NSA:Lcom/google/common/collect/ImmutableList;

    shr-int/lit8 p0, p0, 0xc

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 556
    :cond_1
    sget-object p1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_5G_SA:Lcom/google/common/collect/ImmutableList;

    shr-int/lit8 p0, p0, 0xf

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 550
    :cond_2
    sget-object p1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_4G:Lcom/google/common/collect/ImmutableList;

    shr-int/2addr p0, v2

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 547
    :cond_3
    sget-object p1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_3G:Lcom/google/common/collect/ImmutableList;

    shr-int/lit8 p0, p0, 0x6

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 544
    :cond_4
    sget-object p1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_2G:Lcom/google/common/collect/ImmutableList;

    shr-int/2addr p0, v0

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 541
    :cond_5
    sget-object p1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->DEFAULT_INITIAL_BITRATE_ESTIMATES_WIFI:Lcom/google/common/collect/ImmutableList;

    and-int/2addr p0, v1

    invoke-virtual {p1, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method public static declared-synchronized getSingletonInstance(Landroid/content/Context;)Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;
    .registers 3

    const-class v0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;

    monitor-enter v0

    .line 305
    :try_start_0
    sget-object v1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->singletonInstance:Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;

    if-nez v1, :cond_0

    .line 306
    new-instance v1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$Builder;

    invoke-direct {v1, p0}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter$Builder;->build()Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;

    move-result-object v1

    sput-object v1, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->singletonInstance:Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
    :cond_0
    monitor-exit v0

    return-object v1

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static isTransferAtFullNetworkSpeed(Landroidx/media3/datasource/DataSpec;Z)Z
    .registers 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "127.0.0.1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "localhost"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/16 p1, 0x8

    .line 531
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DataSpec;->isFlagSet(I)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private maybeNotifyBandwidthSample(IJJ)V
    .registers 8

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    .line 504
    iget-wide v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->lastReportedBitrateEstimate:J

    cmp-long v0, p4, v0

    if-nez v0, :cond_0

    return-void

    .line 507
    :cond_0
    iput-wide p4, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->lastReportedBitrateEstimate:J

    .line 508
    iget-object p0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->eventDispatcher:Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;

    invoke-virtual/range {p0 .. p5}, Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;->bandwidthSample(IJJ)V

    return-void
.end method

.method private declared-synchronized onNetworkTypeChanged(I)V
    .registers 10

    monitor-enter p0

    .line 463
    :try_start_0
    iget v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkType:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    :try_start_1
    iget-boolean v1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->resetOnNetworkTypeChange:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_0

    .line 465
    monitor-exit p0

    return-void

    .line 468
    :cond_0
    :try_start_2
    iget-boolean v1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkTypeOverrideSet:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_1

    .line 469
    :try_start_3
    iget p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkTypeOverride:I

    :cond_1
    if-ne v0, p1, :cond_2

    .line 471
    iget-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->countryCode:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v0, :cond_2

    .line 472
    monitor-exit p0

    return-void

    .line 475
    :cond_2
    :try_start_4
    iput p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkType:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_5

    if-eqz p1, :cond_5

    const/16 v0, 0x8

    if-eq p1, v0, :cond_5

    .line 483
    iget-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->countryCode:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-nez v0, :cond_3

    .line 484
    :try_start_5
    iget-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->context:Landroid/content/Context;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->getCountryCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->countryCode:Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 488
    :cond_3
    :try_start_6
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->getInitialBitrateEstimateForNetworkType(I)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J

    .line 489
    iget-object p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {p1}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    .line 490
    iget p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-lez p1, :cond_4

    :try_start_7
    iget-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleStartTimeMs:J
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    sub-long v2, v0, v2

    long-to-int p1, v2

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    move-object v2, p0

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    :goto_0
    move v3, p1

    .line 491
    :try_start_8
    iget-wide v4, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J

    iget-wide v6, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move-object v2, p0

    :try_start_9
    invoke-direct/range {v2 .. v7}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->maybeNotifyBandwidthSample(IJJ)V

    .line 494
    iput-wide v0, v2, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleStartTimeMs:J

    const-wide/16 p0, 0x0

    .line 495
    iput-wide p0, v2, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J

    .line 496
    iput-wide p0, v2, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalBytesTransferred:J

    .line 497
    iput-wide p0, v2, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalElapsedTimeMs:J

    .line 498
    iget-object p0, v2, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->slidingPercentile:Landroidx/media3/exoplayer/upstream/SlidingPercentile;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/upstream/SlidingPercentile;->reset()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 499
    monitor-exit v2

    return-void

    :cond_5
    move-object v2, p0

    .line 480
    monitor-exit v2

    return-void

    :catchall_1
    move-exception v0

    move-object v2, p0

    :goto_1
    move-object p1, v0

    :goto_2
    :try_start_a
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    throw p1

    :catchall_2
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public addEventListener(Landroid/os/Handler;Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener;)V
    .registers 3

    .line 402
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    iget-object p0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->eventDispatcher:Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;

    invoke-virtual {p0, p1, p2}, Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;->addListener(Landroid/os/Handler;Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener;)V

    return-void
.end method

.method public declared-synchronized getBitrateEstimate()J
    .registers 3

    monitor-enter p0

    .line 392
    :try_start_0
    iget-wide v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public getTransferListener()Landroidx/media3/datasource/TransferListener;
    .registers 1

    return-object p0
.end method

.method public declared-synchronized onBytesTransferred(Landroidx/media3/datasource/DataSource;Landroidx/media3/datasource/DataSpec;ZI)V
    .registers 5

    monitor-enter p0

    .line 432
    :try_start_0
    invoke-static {p2, p3}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->isTransferAtFullNetworkSpeed(Landroidx/media3/datasource/DataSpec;Z)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    .line 433
    monitor-exit p0

    return-void

    .line 435
    :cond_0
    :try_start_1
    iget-wide p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J

    int-to-long p3, p4

    add-long/2addr p1, p3

    iput-wide p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 436
    monitor-exit p0

    return-void

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized onTransferEnd(Landroidx/media3/datasource/DataSource;Landroidx/media3/datasource/DataSpec;Z)V
    .registers 14

    monitor-enter p0

    .line 440
    :try_start_0
    invoke-static {p2, p3}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->isTransferAtFullNetworkSpeed(Landroidx/media3/datasource/DataSpec;Z)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez p1, :cond_0

    .line 441
    monitor-exit p0

    return-void

    .line 443
    :cond_0
    :try_start_1
    iget p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I

    const/4 p2, 0x1

    if-lez p1, :cond_1

    move p1, p2

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 444
    iget-object p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {p1}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    .line 445
    iget-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleStartTimeMs:J

    sub-long v2, v0, v2

    long-to-int v5, v2

    .line 446
    iget-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalElapsedTimeMs:J

    int-to-long v6, v5

    add-long/2addr v2, v6

    iput-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalElapsedTimeMs:J

    .line 447
    iget-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalBytesTransferred:J

    iget-wide v6, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J

    add-long/2addr v2, v6

    iput-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalBytesTransferred:J

    if-lez v5, :cond_4

    long-to-float p1, v6

    const/high16 p3, 0x45fa0000    # 8000.0f

    mul-float/2addr p1, p3

    int-to-float p3, v5

    div-float/2addr p1, p3

    .line 450
    iget-object p3, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->slidingPercentile:Landroidx/media3/exoplayer/upstream/SlidingPercentile;

    long-to-double v2, v6

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-virtual {p3, v2, p1}, Landroidx/media3/exoplayer/upstream/SlidingPercentile;->addSample(IF)V

    .line 451
    iget-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalElapsedTimeMs:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-wide/16 v6, 0x7d0

    cmp-long p1, v2, v6

    if-gez p1, :cond_2

    :try_start_2
    iget-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->totalBytesTransferred:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-wide/32 v6, 0x80000

    cmp-long p1, v2, v6

    if-ltz p1, :cond_3

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p1, v0

    move-object v4, p0

    goto :goto_4

    .line 453
    :cond_2
    :goto_1
    :try_start_3
    iget-object p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->slidingPercentile:Landroidx/media3/exoplayer/upstream/SlidingPercentile;

    const/high16 p3, 0x3f000000    # 0.5f

    invoke-virtual {p1, p3}, Landroidx/media3/exoplayer/upstream/SlidingPercentile;->getPercentile(F)F

    move-result p1

    float-to-long v2, p1

    iput-wide v2, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J

    .line 455
    :cond_3
    iget-wide v6, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J

    iget-wide v8, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->bitrateEstimate:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v4, p0

    :try_start_4
    invoke-direct/range {v4 .. v9}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->maybeNotifyBandwidthSample(IJJ)V

    .line 456
    iput-wide v0, v4, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleStartTimeMs:J

    const-wide/16 p0, 0x0

    .line 457
    iput-wide p0, v4, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleBytesTransferred:J

    goto :goto_2

    :cond_4
    move-object v4, p0

    .line 459
    :goto_2
    iget p0, v4, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I

    sub-int/2addr p0, p2

    iput p0, v4, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 460
    monitor-exit v4

    return-void

    :catchall_1
    move-exception v0

    move-object v4, p0

    :goto_3
    move-object p1, v0

    :goto_4
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1

    :catchall_2
    move-exception v0

    goto :goto_3
.end method

.method public onTransferInitializing(Landroidx/media3/datasource/DataSource;Landroidx/media3/datasource/DataSpec;Z)V
    .registers 4

    return-void
.end method

.method public declared-synchronized onTransferStart(Landroidx/media3/datasource/DataSource;Landroidx/media3/datasource/DataSpec;Z)V
    .registers 4

    monitor-enter p0

    .line 420
    :try_start_0
    invoke-static {p2, p3}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->isTransferAtFullNetworkSpeed(Landroidx/media3/datasource/DataSpec;Z)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    .line 421
    monitor-exit p0

    return-void

    .line 423
    :cond_0
    :try_start_1
    iget p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I

    if-nez p1, :cond_1

    .line 424
    iget-object p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {p1}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->sampleStartTimeMs:J

    .line 426
    :cond_1
    iget p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->streamCount:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 427
    monitor-exit p0

    return-void

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public removeEventListener(Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener;)V
    .registers 2

    .line 409
    iget-object p0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->eventDispatcher:Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;

    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener$EventDispatcher;->removeListener(Landroidx/media3/exoplayer/upstream/BandwidthMeter$EventListener;)V

    return-void
.end method

.method public declared-synchronized setNetworkTypeOverride(I)V
    .registers 3

    monitor-enter p0

    .line 385
    :try_start_0
    iput p1, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkTypeOverride:I

    const/4 v0, 0x1

    .line 386
    iput-boolean v0, p0, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->networkTypeOverrideSet:Z

    .line 387
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;->onNetworkTypeChanged(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
