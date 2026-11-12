.class public final Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public adBreakDuration:D

.field public adBreakTime:Ljava/lang/String;

.field public adCuePoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public adData:Lcom/google/ads/interactivemedia/v3/impl/data/zzc;

.field public adPeriodDuration:D

.field public adPodInfo:Lcom/google/ads/interactivemedia/v3/impl/data/zzd;

.field public adPosition:I

.field public adTimeUpdateMs:J

.field public appSetIdTimeoutMs:J

.field public bufferedTime:D

.field public companions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;",
            ">;"
        }
    .end annotation
.end field

.field public consentSettingsConfig:Lcom/google/ads/interactivemedia/v3/impl/data/zzbl;

.field public cuepoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/ads/interactivemedia/v3/impl/data/zzba;",
            ">;"
        }
    .end annotation
.end field

.field public currentTime:D

.field public disableAppSetId:Z

.field public duration:D

.field public enableGks:Z

.field public enableInstrumentation:Z

.field public enableTrustlessGksBc:Z

.field public enableTrustlessGksDai:Z

.field public errorCode:I

.field public errorMessage:Ljava/lang/String;

.field public espAdapterTimeoutMs:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public espAdapters:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public eventId:Ljava/lang/String;

.field public gksFirstPartyAdServers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public gksTimeoutMs:I

.field public iconClickFallbackImages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/ads/interactivemedia/v3/impl/data/zzbf;",
            ">;"
        }
    .end annotation
.end field

.field public innerError:Ljava/lang/String;

.field public internalCuePoints:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public jsConsentCheckRequiredParameters:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public ln:Ljava/lang/String;

.field public logData:Lcom/google/ads/interactivemedia/v3/impl/data/zzbm;

.field public m:Ljava/lang/String;

.field public monitorAppLifecycle:Z

.field public n:Ljava/lang/String;

.field public networkRequest:Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;

.field public platformSignalCollectorTimeoutMs:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public queryId:Ljava/lang/String;

.field public resizeAndPositionVideo:Lcom/google/ads/interactivemedia/v3/impl/data/zzbx;

.field public seekTime:D

.field public streamId:Ljava/lang/String;

.field public streamUrl:Ljava/lang/String;

.field public subtitles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public totalAds:I

.field public url:Ljava/lang/String;

.field public useAndroidAdshieldV2:Z

.field public vastEvent:Ljava/lang/String;

.field public videoUrl:Ljava/lang/String;


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

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JavaScriptMsgData["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-class v1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;

    invoke-virtual {v1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v2, :cond_2e

    aget-object v4, v1, v3

    :try_start_13
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_2b} :catch_2b
    .catch Ljava/lang/IllegalAccessException; {:try_start_13 .. :try_end_2b} :catch_2b

    :catch_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :cond_2e
    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
