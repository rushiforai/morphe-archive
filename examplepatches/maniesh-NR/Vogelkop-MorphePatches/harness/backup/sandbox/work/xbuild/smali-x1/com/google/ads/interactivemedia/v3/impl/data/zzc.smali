.class public final Lcom/google/ads/interactivemedia/v3/impl/data/zzc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private adId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private adPodInfo:Lcom/google/ads/interactivemedia/v3/impl/data/zzd;
    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation
.end field

.field private adSystem:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private adWrapperCreativeIds:[Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation
.end field

.field private adWrapperIds:[Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation
.end field

.field private adWrapperSystems:[Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation
.end field

.field private advertiserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private clickThroughUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private companions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation
.end field

.field private contentType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private creativeAdId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private creativeId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private dealId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private description:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private disableUi:Z

.field private duration:D

.field private height:I

.field private linear:Z

.field private skipTimeOffset:D

.field private skippable:Z

.field private surveyUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private title:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private traffickingParameters:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private uiElements:Ljava/util/Set;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lvim;",
            ">;"
        }
    .end annotation
.end field

.field private universalAdIdRegistry:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private universalAdIdValue:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private universalAdIds:[Lcom/google/ads/interactivemedia/v3/impl/data/zzcd;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafp;
    .end annotation

    .annotation runtime Lcom/google/ads/interactivemedia/v3/internal/zzafr;
    .end annotation
.end field

.field private vastMediaBitrate:I

.field private vastMediaHeight:I

.field private vastMediaWidth:I

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->linear:Z

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->skippable:Z

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->skipTimeOffset:D

    new-instance v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzd;

    invoke-direct {v0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzd;-><init>()V

    iput-object v0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adPodInfo:Lcom/google/ads/interactivemedia/v3/impl/data/zzd;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->clickThroughUrl:Ljava/lang/String;

    return-object p0
.end method

.method public final b()I
    .registers 1

    iget p0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->vastMediaHeight:I

    return p0
.end method

.method public final c()I
    .registers 1

    iget p0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->vastMediaWidth:I

    return p0
.end method

.method public final d()Z
    .registers 1

    iget-boolean p0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->skippable:Z

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    const-string v0, "vastMediaHeight"

    const-string v1, "vastMediaWidth"

    const-string v2, "vastMediaBitrate"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzafo;->b(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzafq;->a(Ljava/lang/Object;[Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 35

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adId:Ljava/lang/String;

    iget-object v2, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->creativeId:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->creativeAdId:Ljava/lang/String;

    iget-object v4, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->universalAdIdValue:Ljava/lang/String;

    iget-object v5, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->universalAdIdRegistry:Ljava/lang/String;

    iget-object v6, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->title:Ljava/lang/String;

    iget-object v7, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->description:Ljava/lang/String;

    iget-object v8, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->contentType:Ljava/lang/String;

    iget-object v9, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adWrapperIds:[Ljava/lang/String;

    invoke-static {v9}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adWrapperSystems:[Ljava/lang/String;

    invoke-static {v10}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adWrapperCreativeIds:[Ljava/lang/String;

    invoke-static {v11}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    iget-object v12, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adSystem:Ljava/lang/String;

    iget-object v13, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->advertiserName:Ljava/lang/String;

    iget-object v14, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->surveyUrl:Ljava/lang/String;

    iget-object v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->dealId:Ljava/lang/String;

    move-object/from16 v16, v15

    iget-boolean v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->linear:Z

    move/from16 v17, v15

    iget-boolean v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->skippable:Z

    move/from16 v18, v15

    iget v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->width:I

    move/from16 v19, v15

    iget v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->height:I

    move/from16 v20, v15

    iget v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->vastMediaHeight:I

    move/from16 v21, v15

    iget v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->vastMediaWidth:I

    move/from16 v22, v15

    iget v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->vastMediaBitrate:I

    move/from16 v23, v15

    iget-object v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->traffickingParameters:Ljava/lang/String;

    move-object/from16 v24, v15

    iget-object v15, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->clickThroughUrl:Ljava/lang/String;

    move-object/from16 v25, v13

    move-object/from16 v26, v14

    iget-wide v13, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->duration:D

    move-wide/from16 v27, v13

    iget-object v13, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->adPodInfo:Lcom/google/ads/interactivemedia/v3/impl/data/zzd;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->uiElements:Ljava/util/Set;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v29, v14

    iget-boolean v14, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->disableUi:Z

    move-object/from16 v30, v13

    move/from16 v31, v14

    iget-wide v13, v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->skipTimeOffset:D

    const-string v0, ", creativeId="

    move-wide/from16 v32, v13

    const-string v13, ", creativeAdId="

    const-string v14, "Ad [adId="

    invoke-static {v14, v1, v0, v2, v13}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", universalAdIdValue="

    const-string v2, ", universalAdIdRegistry="

    invoke-static {v0, v3, v1, v4, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", title="

    const-string v2, ", description="

    invoke-static {v0, v5, v1, v6, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", contentType="

    const-string v2, ", adWrapperIds="

    invoke-static {v0, v7, v1, v8, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", adWrapperSystems="

    const-string v2, ", adWrapperCreativeIds="

    invoke-static {v0, v9, v1, v10, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", adSystem="

    const-string v2, ", advertiserName="

    invoke-static {v0, v11, v1, v12, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", surveyUrl="

    const-string v2, ", dealId="

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-static {v0, v3, v1, v4, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", linear="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", skippable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", vastMediaHeight="

    const-string v2, ", vastMediaWidth="

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-static {v3, v4, v1, v2, v0}, Lsko;->r(IILjava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    const-string v1, ", vastMediaBitrate="

    const-string v2, ", traffickingParameters="

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-static {v3, v4, v1, v2, v0}, Lsko;->r(IILjava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    const-string v1, ", clickThroughUrl="

    const-string v2, ", duration="

    move-object/from16 v3, v24

    invoke-static {v0, v3, v1, v15, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", adPodInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", uiElements="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", disableUi="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", skipTimeOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-wide/from16 v1, v32

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
