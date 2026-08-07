.class public final Ll/ips0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/wit0;->d()Ll/nas0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/wit0;->d()Ll/nas0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/nas0;->zza()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-interface {p1}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzb()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-interface {p1}, Ll/wit0;->y()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzb()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    const-string p0, "A GMSG tried to close something that wasn\'t an overlay."

    .line 37
    .line 38
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
