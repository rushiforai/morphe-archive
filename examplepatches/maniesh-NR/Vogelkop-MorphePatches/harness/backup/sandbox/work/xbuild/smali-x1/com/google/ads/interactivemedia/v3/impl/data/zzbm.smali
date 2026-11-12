.class public final Lcom/google/ads/interactivemedia/v3/impl/data/zzbm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public errorCode:I

.field public errorMessage:Ljava/lang/String;

.field public innerError:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    new-array v0, v0, [Ljava/lang/String;

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
    .registers 7

    iget-object v0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzbm;->type:Ljava/lang/String;

    iget v1, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzbm;->errorCode:I

    iget-object v2, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzbm;->errorMessage:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzbm;->innerError:Ljava/lang/String;

    const-string v3, ", errorCode="

    const-string v4, ", errorMessage="

    const-string v5, "Log[type="

    invoke-static {v1, v5, v0, v3, v4}, Lsko;->p(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", innerError="

    const-string v3, "]"

    invoke-static {v0, v2, v1, p0, v3}, Lsko;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
