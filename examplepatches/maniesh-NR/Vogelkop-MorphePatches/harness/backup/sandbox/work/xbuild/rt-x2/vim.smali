.class public interface abstract Lvim;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

.field public static final b:Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

    const-string v1, "adAttribution"

    invoke-direct {v0, v1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;-><init>(Ljava/lang/String;)V

    sput-object v0, Lvim;->a:Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

    new-instance v0, Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

    const-string v1, "countdown"

    invoke-direct {v0, v1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;-><init>(Ljava/lang/String;)V

    sput-object v0, Lvim;->b:Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

    return-void
.end method
