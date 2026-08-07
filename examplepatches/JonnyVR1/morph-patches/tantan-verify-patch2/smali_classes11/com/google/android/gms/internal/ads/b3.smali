.class public final Lcom/google/android/gms/internal/ads/b3;
.super Ll/ksw0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/lsw0;


# direct methods
.method public constructor <init>(Ll/lsw0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/b3;->a:Ll/lsw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ksw0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c()Ll/xrw0;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/b3;->a:Ll/lsw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lsw0;->a()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgaz;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ads/zzgaz;-><init>(I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/google/android/gms/internal/ads/zzgbf;

    .line 14
    .line 15
    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/ads/zzgbf;-><init>(Ljava/util/Map;Ll/fpw0;)V

    .line 16
    .line 17
    .line 18
    return-object v1
.end method
