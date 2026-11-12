.class public final Lcom/google/ads/interactivemedia/v3/internal/zzem;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lmbi;

.field public final b:Lcom/google/ads/interactivemedia/v3/internal/zzsx;

.field public final c:La36;

.field public final d:Lcom/google/ads/interactivemedia/v3/internal/zzeg;

.field public final e:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public constructor <init>(Lmbi;Lcom/google/ads/interactivemedia/v3/internal/zzsx;Lcom/google/ads/interactivemedia/v3/internal/zzeg;Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;)V
    .registers 6

    invoke-static {p1, p4}, Lcom/google/ads/interactivemedia/v3/internal/zzds;->a(Lmbi;Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;)Z

    move-result p4

    if-nez p4, :cond_8

    const/4 p4, 0x0

    goto :goto_12

    :cond_8
    new-instance p4, La36;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/atv_ads_framework/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/atv_ads_framework/zzd;-><init>()V

    :goto_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iput-object v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->e:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->a:Lmbi;

    iput-object p2, p0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->b:Lcom/google/ads/interactivemedia/v3/internal/zzsx;

    iput-object p3, p0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->d:Lcom/google/ads/interactivemedia/v3/internal/zzeg;

    iput-object p4, p0, Lcom/google/ads/interactivemedia/v3/internal/zzem;->c:La36;

    return-void
.end method
