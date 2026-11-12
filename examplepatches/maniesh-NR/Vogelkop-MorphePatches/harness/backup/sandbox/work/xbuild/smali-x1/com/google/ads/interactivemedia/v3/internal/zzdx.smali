.class public final Lcom/google/ads/interactivemedia/v3/internal/zzdx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:J

.field public final c:Z

.field public final d:Ljava/util/List;

.field public final e:I


# direct methods
.method public constructor <init>(Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-boolean v0, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->disableAppSetId:Z

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzdx;->a:Z

    iget-wide v0, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->appSetIdTimeoutMs:J

    iput-wide v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzdx;->b:J

    iget-boolean v0, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->enableTrustlessGksBc:Z

    iput-boolean v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzdx;->c:Z

    iget-object v0, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->gksFirstPartyAdServers:Ljava/util/List;

    iput-object v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzdx;->d:Ljava/util/List;

    iget p1, p1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->gksTimeoutMs:I

    iput p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzdx;->e:I

    return-void
.end method
