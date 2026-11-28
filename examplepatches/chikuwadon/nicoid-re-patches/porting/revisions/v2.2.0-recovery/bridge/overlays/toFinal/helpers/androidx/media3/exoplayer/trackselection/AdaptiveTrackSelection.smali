.class public Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;
.super Landroidx/media3/exoplayer/trackselection/BaseTrackSelection;
.source "AdaptiveTrackSelection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;,
        Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;
    }
.end annotation


# static fields
.field public static final DEFAULT_BANDWIDTH_FRACTION:F = 0.7f

.field public static final DEFAULT_BUFFERED_FRACTION_TO_LIVE_EDGE_FOR_QUALITY_INCREASE:F = 0.75f

.field public static final DEFAULT_MAX_DURATION_FOR_QUALITY_DECREASE_MS:I = 0x61a8

.field public static final DEFAULT_MAX_HEIGHT_TO_DISCARD:I = 0x2cf

.field public static final DEFAULT_MAX_WIDTH_TO_DISCARD:I = 0x4ff

.field public static final DEFAULT_MIN_DURATION_FOR_QUALITY_INCREASE_MS:I = 0x2710

.field public static final DEFAULT_MIN_DURATION_TO_RETAIN_AFTER_DISCARD_MS:I = 0x61a8

.field private static final MIN_TIME_BETWEEN_BUFFER_REEVALUTATION_MS:J = 0x3e8L

.field private static final TAG:Ljava/lang/String; = "AdaptiveTrackSelection"


# instance fields
.field private final adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;",
            ">;"
        }
    .end annotation
.end field

.field private final bandwidthFraction:F

.field private final bandwidthMeter:Landroidx/media3/exoplayer/upstream/BandwidthMeter;

.field private final bufferedFractionToLiveEdgeForQualityIncrease:F

.field private final clock:Landroidx/media3/common/util/Clock;

.field private lastBufferEvaluationMediaChunk:Landroidx/media3/exoplayer/source/chunk/MediaChunk;

.field private lastBufferEvaluationMs:J

.field private latestBitrateEstimate:J

.field private final maxDurationForQualityDecreaseUs:J

.field private final maxHeightToDiscard:I

.field private final maxWidthToDiscard:I

.field private final minDurationForQualityIncreaseUs:J

.field private final minDurationToRetainAfterDiscardUs:J

.field private playbackSpeed:F

.field private queuedMediaRC2:Z

.field private reason:I

.field private selectedIndex:I


# direct methods
.method protected constructor <init>(Landroidx/media3/common/TrackGroup;[IILandroidx/media3/exoplayer/upstream/BandwidthMeter;JJJIIFFLjava/util/List;Landroidx/media3/common/util/Clock;)V
    .registers 35
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/common/TrackGroup;",
            "[II",
            "Landroidx/media3/exoplayer/upstream/BandwidthMeter;",
            "JJJIIFF",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;",
            ">;",
            "Landroidx/media3/common/util/Clock;",
            ")V"
        }
    .end annotation

    .line 414
    sget-object v17, Landroidx/media3/exoplayer/trackselection/BaseTrackSelection;->DEFAULT_FORMAT_COMPARATOR:Ljava/util/Comparator;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    move/from16 v11, p11

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    move-object/from16 v15, p15

    move-object/from16 v16, p16

    invoke-direct/range {v0 .. v17}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;-><init>(Landroidx/media3/common/TrackGroup;[IILandroidx/media3/exoplayer/upstream/BandwidthMeter;JJJIIFFLjava/util/List;Landroidx/media3/common/util/Clock;Ljava/util/Comparator;)V

    return-void
.end method

.method protected constructor <init>(Landroidx/media3/common/TrackGroup;[IILandroidx/media3/exoplayer/upstream/BandwidthMeter;JJJIIFFLjava/util/List;Landroidx/media3/common/util/Clock;Ljava/util/Comparator;)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/common/TrackGroup;",
            "[II",
            "Landroidx/media3/exoplayer/upstream/BandwidthMeter;",
            "JJJIIFF",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;",
            ">;",
            "Landroidx/media3/common/util/Clock;",
            "Ljava/util/Comparator<",
            "Landroidx/media3/common/Format;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p17

    .line 478
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/media3/exoplayer/trackselection/BaseTrackSelection;-><init>(Landroidx/media3/common/TrackGroup;[IILjava/util/Comparator;)V

    cmp-long p1, p9, p5

    if-gez p1, :cond_0

    .line 480
    const-string p1, "AdaptiveTrackSelection"

    const-string p2, "Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"

    invoke-static {p1, p2}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-wide p1, p5

    goto :goto_0

    :cond_0
    move-wide p1, p9

    .line 486
    :goto_0
    iput-object p4, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bandwidthMeter:Landroidx/media3/exoplayer/upstream/BandwidthMeter;

    const-wide/16 p3, 0x3e8

    mul-long/2addr p5, p3

    .line 487
    iput-wide p5, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->minDurationForQualityIncreaseUs:J

    mul-long/2addr p7, p3

    .line 488
    iput-wide p7, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->maxDurationForQualityDecreaseUs:J

    mul-long/2addr p1, p3

    .line 489
    iput-wide p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->minDurationToRetainAfterDiscardUs:J

    .line 490
    iput p11, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->maxWidthToDiscard:I

    .line 491
    iput p12, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->maxHeightToDiscard:I

    .line 492
    iput p13, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bandwidthFraction:F

    .line 493
    iput p14, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bufferedFractionToLiveEdgeForQualityIncrease:F

    .line 495
    invoke-static/range {p15 .. p15}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;

    move-object/from16 p1, p16

    .line 496
    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->clock:Landroidx/media3/common/util/Clock;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 497
    iput p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    const/4 p1, 0x0

    .line 498
    iput p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->reason:I

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 499
    iput-wide p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMs:J

    const-wide/32 p1, -0x7fffffff

    .line 500
    iput-wide p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->latestBitrateEstimate:J

    return-void
.end method

.method public constructor <init>(Landroidx/media3/common/TrackGroup;[ILandroidx/media3/exoplayer/upstream/BandwidthMeter;)V
    .registers 21

    .line 365
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v15

    sget-object v16, Landroidx/media3/common/util/Clock;->DEFAULT:Landroidx/media3/common/util/Clock;

    const/4 v3, 0x0

    const-wide/16 v5, 0x2710

    const-wide/16 v7, 0x61a8

    const-wide/16 v9, 0x61a8

    const/16 v11, 0x4ff

    const/16 v12, 0x2cf

    const v13, 0x3f333333    # 0.7f

    const/high16 v14, 0x3f400000    # 0.75f

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p3

    .line 353
    invoke-direct/range {v0 .. v16}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;-><init>(Landroidx/media3/common/TrackGroup;[IILandroidx/media3/exoplayer/upstream/BandwidthMeter;JJJIIFFLjava/util/List;Landroidx/media3/common/util/Clock;)V

    return-void
.end method

.method static synthetic access$000([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)Lcom/google/common/collect/ImmutableList;
    .registers 1

    .line 52
    invoke-static {p0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getAdaptationCheckpoints([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method private static addCheckpoint(Ljava/util/List;[J)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/common/collect/ImmutableList$Builder<",
            "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;",
            ">;>;[J)V"
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move v3, v2

    .line 901
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_0

    .line 902
    aget-wide v4, p1, v3

    add-long/2addr v0, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 904
    :cond_0
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 905
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/collect/ImmutableList$Builder;

    if-eqz v3, :cond_1

    .line 909
    new-instance v4, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;

    aget-wide v5, p1, v2

    invoke-direct {v4, v0, v1, v5, v6}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;-><init>(JJ)V

    invoke-virtual {v3, v4}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private determineIdealSelectedIndex(JJ)I
    .registers 9

    const/4 v0, 0x0

    move v1, v0

    .line 686
    :goto_0
    iget v2, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->length:I

    if-ge v0, v2, :cond_3

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    .line 687
    invoke-virtual {p0, v0, p1, p2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->isTrackExcluded(IJ)Z

    move-result v2

    if-nez v2, :cond_2

    .line 688
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v1

    .line 689
    iget v2, v1, Landroidx/media3/common/Format;->bitrate:I

    invoke-virtual {p0, v1, v2, p3, p4}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->canSelectFormat(Landroidx/media3/common/Format;IJ)Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    move v1, v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method private static getAdaptationCheckpoints([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)Lcom/google/common/collect/ImmutableList;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;",
            ")",
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/common/collect/ImmutableList<",
            "Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;",
            ">;>;"
        }
    .end annotation

    .line 796
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    .line 798
    :goto_0
    array-length v3, p0

    const-wide/16 v4, 0x0

    const/4 v6, 0x1

    if-ge v2, v3, :cond_1

    .line 799
    aget-object v3, p0, v2

    if-eqz v3, :cond_0

    iget-object v3, v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->tracks:[I

    array-length v3, v3

    if-le v3, v6, :cond_0

    .line 800
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    .line 802
    new-instance v6, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;

    invoke-direct {v6, v4, v5, v4, v5}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;-><init>(JJ)V

    invoke-virtual {v3, v6}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 803
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    .line 805
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 809
    :cond_1
    invoke-static {p0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getSortedTrackBitrates([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)[[J

    move-result-object v2

    .line 810
    array-length v3, v2

    new-array v3, v3, [I

    .line 811
    array-length v7, v2

    new-array v7, v7, [J

    move v8, v1

    .line 812
    :goto_2
    array-length v9, v2

    if-ge v8, v9, :cond_3

    .line 813
    aget-object v9, v2, v8

    array-length v10, v9

    if-nez v10, :cond_2

    move-wide v9, v4

    goto :goto_3

    :cond_2
    aget-wide v9, v9, v1

    :goto_3
    aput-wide v9, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 815
    :cond_3
    invoke-static {v0, v7}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->addCheckpoint(Ljava/util/List;[J)V

    .line 817
    invoke-static {v2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getSwitchOrder([[J)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    move v5, v1

    .line 818
    :goto_4
    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v8

    if-ge v5, v8, :cond_4

    .line 819
    invoke-virtual {v4, v5}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 820
    aget v9, v3, v8

    add-int/2addr v9, v6

    aput v9, v3, v8

    .line 821
    aget-object v10, v2, v8

    aget-wide v9, v10, v9

    aput-wide v9, v7, v8

    .line 822
    invoke-static {v0, v7}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->addCheckpoint(Ljava/util/List;[J)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_4
    move v2, v1

    .line 825
    :goto_5
    array-length v3, p0

    if-ge v2, v3, :cond_6

    .line 826
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 827
    aget-wide v3, v7, v2

    shl-long/2addr v3, v6

    aput-wide v3, v7, v2

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 830
    :cond_6
    invoke-static {v0, v7}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->addCheckpoint(Ljava/util/List;[J)V

    .line 831
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object p0

    .line 832
    :goto_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_8

    .line 833
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/collect/ImmutableList$Builder;

    if-nez v2, :cond_7

    .line 834
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    goto :goto_7

    :cond_7
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    :goto_7
    invoke-virtual {p0, v2}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 836
    :cond_8
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method private getAllocatedBandwidth(J)J
    .registers 10

    .line 755
    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getTotalAllocatableBandwidth(J)J

    move-result-wide p1

    .line 756
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-wide p1

    :cond_0
    const/4 v0, 0x1

    move v1, v0

    .line 760
    :goto_0
    iget-object v2, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;

    .line 761
    invoke-virtual {v2, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;

    iget-wide v2, v2, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->totalBandwidth:J

    cmp-long v2, v2, p1

    if-gez v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 764
    :cond_1
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;

    .line 765
    iget-object p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->adaptationCheckpoints:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;

    .line 766
    iget-wide v1, v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->totalBandwidth:J

    sub-long/2addr p1, v1

    long-to-float p1, p1

    iget-wide v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->totalBandwidth:J

    iget-wide v3, v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->totalBandwidth:J

    sub-long/2addr v1, v3

    long-to-float p2, v1

    div-float/2addr p1, p2

    .line 769
    iget-wide v1, v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->allocatedBandwidth:J

    iget-wide v3, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->allocatedBandwidth:J

    iget-wide v5, v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$AdaptationCheckpoint;->allocatedBandwidth:J

    sub-long/2addr v3, v5

    long-to-float p0, v3

    mul-float/2addr p1, p0

    float-to-long p0, p1

    add-long/2addr v1, p0

    return-wide v1
.end method

.method private getLastChunkDurationUs(Ljava/util/List;)J
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunk;",
            ">;)J"
        }
    .end annotation

    .line 745
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    if-eqz p0, :cond_0

    return-wide v0

    .line 748
    :cond_0
    invoke-static {p1}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    .line 749
    iget-wide v2, p0, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->startTimeUs:J

    cmp-long p1, v2, v0

    if-eqz p1, :cond_1

    iget-wide v2, p0, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->endTimeUs:J

    cmp-long p1, v2, v0

    if-eqz p1, :cond_1

    .line 750
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->endTimeUs:J

    iget-wide p0, p0, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->startTimeUs:J

    sub-long/2addr v0, p0

    :cond_1
    return-wide v0
.end method

.method private getNextChunkDurationUs([Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;Ljava/util/List;)J
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;",
            "Ljava/util/List<",
            "+",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunk;",
            ">;)J"
        }
    .end annotation

    .line 724
    iget v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->selectedIndex:I

    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget-object v0, p1, v0

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;->next()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 725
    iget p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->selectedIndex:I

    aget-object p0, p1, p0

    .line 726
    invoke-interface {p0}, Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;->getChunkEndTimeUs()J

    move-result-wide p1

    invoke-interface {p0}, Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;->getChunkStartTimeUs()J

    move-result-wide v0

    sub-long/2addr p1, v0

    return-wide p1

    .line 730
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    .line 731
    invoke-interface {v2}, Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;->next()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 732
    invoke-interface {v2}, Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;->getChunkEndTimeUs()J

    move-result-wide p0

    invoke-interface {v2}, Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;->getChunkStartTimeUs()J

    move-result-wide v0

    sub-long/2addr p0, v0

    return-wide p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 737
    :cond_2
    invoke-direct {p0, p2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getLastChunkDurationUs(Ljava/util/List;)J

    move-result-wide p0

    return-wide p0
.end method

.method private static getSortedTrackBitrates([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)[[J
    .registers 11

    .line 841
    array-length v0, p0

    new-array v0, v0, [[J

    const/4 v1, 0x0

    move v2, v1

    .line 842
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_3

    .line 843
    aget-object v3, p0, v2

    if-nez v3, :cond_0

    .line 845
    new-array v3, v1, [J

    aput-object v3, v0, v2

    goto :goto_2

    .line 848
    :cond_0
    iget-object v4, v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->tracks:[I

    array-length v4, v4

    new-array v4, v4, [J

    aput-object v4, v0, v2

    move v4, v1

    .line 849
    :goto_1
    iget-object v5, v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->tracks:[I

    array-length v5, v5

    if-ge v4, v5, :cond_2

    .line 850
    iget-object v5, v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->group:Landroidx/media3/common/TrackGroup;

    iget-object v6, v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->tracks:[I

    aget v6, v6, v4

    invoke-virtual {v5, v6}, Landroidx/media3/common/TrackGroup;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v5

    iget v5, v5, Landroidx/media3/common/Format;->bitrate:I

    int-to-long v5, v5

    .line 851
    aget-object v7, v0, v2

    const-wide/16 v8, -0x1

    cmp-long v8, v5, v8

    if-nez v8, :cond_1

    const-wide/16 v5, 0x0

    :cond_1
    aput-wide v5, v7, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 853
    :cond_2
    aget-object v3, v0, v2

    invoke-static {v3}, Ljava/util/Arrays;->sort([J)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private static getSwitchOrder([[J)Lcom/google/common/collect/ImmutableList;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[J)",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 869
    invoke-static {}, Lcom/google/common/collect/MultimapBuilder;->treeKeys()Lcom/google/common/collect/MultimapBuilder$MultimapBuilderWithKeys;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/MultimapBuilder$MultimapBuilderWithKeys;->arrayListValues()Lcom/google/common/collect/MultimapBuilder$ListMultimapBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/MultimapBuilder$ListMultimapBuilder;->build()Lcom/google/common/collect/ListMultimap;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    .line 870
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_4

    .line 871
    aget-object v3, p0, v2

    array-length v4, v3

    const/4 v5, 0x1

    if-le v4, v5, :cond_3

    .line 874
    array-length v3, v3

    new-array v4, v3, [D

    move v5, v1

    .line 875
    :goto_1
    aget-object v6, p0, v2

    array-length v7, v6

    const-wide/16 v8, 0x0

    if-ge v5, v7, :cond_1

    .line 877
    aget-wide v6, v6, v5

    const-wide/16 v10, -0x1

    cmp-long v10, v6, v10

    if-eqz v10, :cond_0

    long-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v8

    :cond_0
    aput-wide v8, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, -0x1

    .line 879
    aget-wide v5, v4, v3

    aget-wide v10, v4, v1

    sub-double/2addr v5, v10

    move v7, v1

    :goto_2
    if-ge v7, v3, :cond_3

    .line 881
    aget-wide v10, v4, v7

    add-int/lit8 v7, v7, 0x1

    aget-wide v12, v4, v7

    add-double/2addr v10, v12

    const-wide/high16 v12, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v10, v12

    cmpl-double v12, v5, v8

    if-nez v12, :cond_2

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    goto :goto_3

    .line 883
    :cond_2
    aget-wide v12, v4, v1

    sub-double/2addr v10, v12

    div-double/2addr v10, v5

    .line 884
    :goto_3
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 887
    :cond_4
    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method private getTotalAllocatableBandwidth(J)J
    .registers 10

    .line 775
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bandwidthMeter:Landroidx/media3/exoplayer/upstream/BandwidthMeter;

    invoke-interface {v0}, Landroidx/media3/exoplayer/upstream/BandwidthMeter;->getBitrateEstimate()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->latestBitrateEstimate:J

    long-to-float v0, v0

    .line 776
    iget v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bandwidthFraction:F

    mul-float/2addr v0, v1

    float-to-long v0, v0

    .line 777
    iget-object v2, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bandwidthMeter:Landroidx/media3/exoplayer/upstream/BandwidthMeter;

    invoke-interface {v2}, Landroidx/media3/exoplayer/upstream/BandwidthMeter;->getTimeToFirstByteEstimateUs()J

    move-result-wide v2

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v6, v2, v4

    if-eqz v6, :cond_0

    cmp-long v4, p1, v4

    if-eqz v4, :cond_0

    long-to-float p1, p1

    .line 781
    iget p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    div-float p0, p1, p0

    long-to-float p2, v2

    sub-float/2addr p0, p2

    const/4 p2, 0x0

    .line 782
    invoke-static {p0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p0

    long-to-float p2, v0

    mul-float/2addr p2, p0

    div-float/2addr p2, p1

    float-to-long p0, p2

    return-wide p0

    :cond_0
    long-to-float p1, v0

    .line 779
    iget p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    div-float/2addr p1, p0

    float-to-long p0, p1

    return-wide p0
.end method

.method private initialIdealRC4(JJ)I
    .registers 15

    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->determineIdealSelectedIndex(JJ)I

    move-result v0

    iget v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->reason:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->queuedMediaRC2:Z

    if-nez v1, :cond_0

    iget-wide v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->latestBitrateEstimate:J

    const-wide/32 v3, 0x419ce0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    iget v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    const-wide/16 v1, 0x0

    cmp-long v3, p3, v1

    if-lez v3, :cond_0

    const-wide/32 v1, 0x419ce0

    cmp-long v3, p3, v1

    if-gtz v3, :cond_0

    if-lez v0, :cond_0

    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v6

    iget-object v1, v6, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {v1}, Landroidx/media3/common/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, v6, Landroidx/media3/common/Format;->bitrate:I

    if-lez v1, :cond_0

    const-wide/16 v1, 0x14

    div-long v1, p3, v1

    add-long/2addr v1, p3

    invoke-direct {p0, p1, p2, v1, v2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->determineIdealSelectedIndex(JJ)I

    move-result v3

    if-ge v3, v0, :cond_0

    invoke-virtual {p0, v3}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v7

    iget-object v4, v7, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {v4}, Landroidx/media3/common/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget v4, v7, Landroidx/media3/common/Format;->height:I

    iget v5, v6, Landroidx/media3/common/Format;->height:I

    if-lez v5, :cond_0

    if-le v4, v5, :cond_0

    iget v4, v7, Landroidx/media3/common/Format;->bitrate:I

    iget v5, v6, Landroidx/media3/common/Format;->bitrate:I

    if-le v4, v5, :cond_0

    int-to-long v4, v4

    cmp-long v8, v4, v1

    if-gtz v8, :cond_0

    const-string v4, "nicoid-qualityRC4"

    const-string v5, "initial video bounded 5 percent margin applied"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    return v0
.end method

.method private logInitialRC3(IJ)V
    .registers 9

    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v0

    iget-object v1, v0, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {v1}, Landroidx/media3/common/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initial video height="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->height:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " bitrate="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->bitrate:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " allocatedBps="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v0

    const-string v2, " topBitrate="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->bitrate:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " topHeight="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->height:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "nicoid-qualityRC4"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method private minDurationForQualityIncreaseUs(JJ)J
    .registers 8

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 702
    iget-wide p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->minDurationForQualityIncreaseUs:J

    return-wide p0

    :cond_0
    cmp-long v0, p3, v0

    if-eqz v0, :cond_1

    sub-long/2addr p1, p3

    :cond_1
    long-to-float p1, p1

    .line 712
    iget p2, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->bufferedFractionToLiveEdgeForQualityIncrease:F

    mul-float/2addr p1, p2

    float-to-long p1, p1

    .line 714
    iget-wide p3, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->minDurationForQualityIncreaseUs:J

    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    return-wide p0
.end method


# virtual methods
.method protected canSelectFormat(Landroidx/media3/common/Format;IJ)Z
    .registers 5

    int-to-long p0, p2

    cmp-long p0, p0, p3

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public disable()V
    .registers 2

    const/4 v0, 0x0

    .line 514
    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMediaChunk:Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    return-void
.end method

.method public enable()V
    .registers 3

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 506
    iput-wide v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMs:J

    const/4 v0, 0x0

    .line 507
    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMediaChunk:Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    return-void
.end method

.method public evaluateQueueSize(JLjava/util/List;)I
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "+",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunk;",
            ">;)I"
        }
    .end annotation

    .line 590
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {v0}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    .line 591
    invoke-virtual {p0, v0, v1, p3}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->shouldEvaluateQueueSize(JLjava/util/List;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 592
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p0

    return p0

    .line 594
    :cond_0
    iput-wide v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMs:J

    .line 595
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    invoke-static {p3}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    :goto_0
    iput-object v2, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMediaChunk:Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    .line 597
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    return v3

    .line 600
    :cond_2
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v4, v2, -0x1

    .line 601
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    .line 602
    iget-wide v4, v4, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->startTimeUs:J

    sub-long/2addr v4, p1

    iget v6, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    .line 603
    invoke-static {v4, v5, v6}, Landroidx/media3/common/util/Util;->getPlayoutDurationForMediaDuration(JF)J

    move-result-wide v4

    .line 605
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getMinDurationToRetainAfterDiscardUs()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_4

    .line 610
    invoke-direct {p0, p3}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getLastChunkDurationUs(Ljava/util/List;)J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getAllocatedBandwidth(J)J

    move-result-wide v4

    invoke-direct {p0, v0, v1, v4, v5}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->determineIdealSelectedIndex(JJ)I

    move-result v0

    .line 611
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v0

    :goto_1
    if-ge v3, v2, :cond_4

    .line 616
    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    .line 617
    iget-object v4, v1, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->trackFormat:Landroidx/media3/common/Format;

    .line 618
    iget-wide v8, v1, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->startTimeUs:J

    sub-long/2addr v8, p1

    .line 619
    iget v1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    .line 620
    invoke-static {v8, v9, v1}, Landroidx/media3/common/util/Util;->getPlayoutDurationForMediaDuration(JF)J

    move-result-wide v8

    cmp-long v1, v8, v6

    if-ltz v1, :cond_3

    .line 621
    iget v1, v4, Landroidx/media3/common/Format;->bitrate:I

    iget v5, v0, Landroidx/media3/common/Format;->bitrate:I

    if-ge v1, v5, :cond_3

    iget v1, v4, Landroidx/media3/common/Format;->height:I

    const/4 v5, -0x1

    if-eq v1, v5, :cond_3

    iget v1, v4, Landroidx/media3/common/Format;->height:I

    iget v8, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->maxHeightToDiscard:I

    if-gt v1, v8, :cond_3

    iget v1, v4, Landroidx/media3/common/Format;->width:I

    if-eq v1, v5, :cond_3

    iget v1, v4, Landroidx/media3/common/Format;->width:I

    iget v5, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->maxWidthToDiscard:I

    if-gt v1, v5, :cond_3

    iget v1, v4, Landroidx/media3/common/Format;->height:I

    iget v4, v0, Landroidx/media3/common/Format;->height:I

    if-ge v1, v4, :cond_3

    return v3

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    return v2
.end method

.method public getLatestBitrateEstimate()J
    .registers 3

    .line 636
    iget-wide v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->latestBitrateEstimate:J

    return-wide v0
.end method

.method protected getMinDurationToRetainAfterDiscardUs()J
    .registers 3

    .line 674
    iget-wide v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->minDurationToRetainAfterDiscardUs:J

    return-wide v0
.end method

.method public getSelectedIndex()I
    .registers 1

    .line 574
    iget p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->selectedIndex:I

    return p0
.end method

.method public getSelectionData()Ljava/lang/Object;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public getSelectionReason()I
    .registers 1

    .line 579
    iget p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->reason:I

    return p0
.end method

.method public onPlaybackSpeed(F)V
    .registers 2

    .line 519
    iput p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->playbackSpeed:F

    return-void
.end method

.method protected shouldEvaluateQueueSize(JLjava/util/List;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "+",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunk;",
            ">;)Z"
        }
    .end annotation

    .line 662
    iget-wide v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    sub-long/2addr p1, v0

    const-wide/16 v0, 0x3e8

    cmp-long p1, p1, v0

    if-gez p1, :cond_1

    .line 664
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {p3}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    iget-object p0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->lastBufferEvaluationMediaChunk:Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public updateSelectedTrack(JJJLjava/util/List;[Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJ",
            "Ljava/util/List<",
            "+",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunk;",
            ">;[",
            "Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;",
            ")V"
        }
    .end annotation

    invoke-interface {p7}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->queuedMediaRC2:Z

    .line 529
    :cond_0
    iget-object p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {p1}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide p1

    .line 530
    invoke-direct {p0, p8, p7}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getNextChunkDurationUs([Landroidx/media3/exoplayer/source/chunk/MediaChunkIterator;Ljava/util/List;)J

    move-result-wide v0

    .line 531
    invoke-direct {p0, v0, v1}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getAllocatedBandwidth(J)J

    move-result-wide v2

    .line 534
    iget p8, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->reason:I

    if-nez p8, :cond_1

    const/4 p3, 0x1

    .line 535
    iput p3, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->reason:I

    .line 536
    invoke-direct {p0, p1, p2, v2, v3}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->initialIdealRC4(JJ)I

    move-result p1

    iput p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->selectedIndex:I

    invoke-direct {p0, p1, v2, v3}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->logInitialRC3(IJ)V

    return-void

    .line 540
    :cond_1
    iget v4, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->selectedIndex:I

    .line 543
    invoke-interface {p7}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const/4 v6, -0x1

    if-eqz v5, :cond_2

    move v5, v6

    goto :goto_0

    :cond_2
    invoke-static {p7}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    iget-object v5, v5, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->trackFormat:Landroidx/media3/common/Format;

    invoke-virtual {p0, v5}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->indexOf(Landroidx/media3/common/Format;)I

    move-result v5

    :goto_0
    if-eq v5, v6, :cond_3

    .line 546
    invoke-static {p7}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p7

    check-cast p7, Landroidx/media3/exoplayer/source/chunk/MediaChunk;

    iget p8, p7, Landroidx/media3/exoplayer/source/chunk/MediaChunk;->trackSelectionReason:I

    move v4, v5

    .line 548
    :cond_3
    invoke-direct {p0, p1, p2, v2, v3}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->initialIdealRC4(JJ)I

    move-result p7

    if-eq p7, v4, :cond_7

    .line 550
    invoke-virtual {p0, v4, p1, p2}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->isTrackExcluded(IJ)Z

    move-result p1

    if-nez p1, :cond_7

    .line 553
    invoke-direct {p0, p5, p6, v0, v1}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->minDurationForQualityIncreaseUs(JJ)J

    move-result-wide p1

    if-ge p7, v4, :cond_5

    iget-boolean v5, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->queuedMediaRC2:Z

    if-nez v5, :cond_4

    const/4 v5, 0x1

    if-ne p8, v5, :cond_4

    invoke-virtual {p0, p7}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v5

    iget-object v5, v5, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {v5}, Landroidx/media3/common/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7

    :cond_4
    cmp-long p1, p3, p1

    if-ltz p1, :cond_6

    :cond_5
    if-le p7, v4, :cond_7

    .line 559
    iget-wide p1, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->maxDurationForQualityDecreaseUs:J

    cmp-long p1, p3, p1

    if-ltz p1, :cond_7

    :cond_6
    move p7, v4

    :cond_7
    if-eq p7, v4, :cond_8

    const/4 p8, 0x3

    .line 568
    :cond_8
    iput p8, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->reason:I

    .line 569
    iput p7, p0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection;->selectedIndex:I

    return-void
.end method
