.class public final Ll/sev0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/tev0;


# direct methods
.method public constructor <init>(Ll/tev0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sev0;->a:Ll/tev0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sev0;->a:Ll/tev0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tev0;->d(Ll/tev0;)Ll/zxt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/zxt0;->d()Ll/z0u0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/z0u0;->a(Ljava/lang/Throwable;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/sev0;->a:Ll/tev0;

    .line 16
    .line 17
    invoke-static {p0}, Ll/tev0;->e(Ll/tev0;)Ll/k6u0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v0}, Ll/k6u0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 22
    .line 23
    .line 24
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 25
    .line 26
    const-string v0, "DelayedBannerAd.onFailure"

    .line 27
    .line 28
    invoke-static {p0, p1, v0}, Ll/q8w0;->b(ILjava/lang/Throwable;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic zzb(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uwt0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/kzt0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
