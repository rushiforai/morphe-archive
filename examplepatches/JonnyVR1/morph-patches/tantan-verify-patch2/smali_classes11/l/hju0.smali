.class public final Ll/hju0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/i6u0;
.implements Ll/efu0;


# instance fields
.field public final a:Ll/o9t0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/s9t0;

.field public final d:Landroid/view/View;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ljava/lang/String;

.field public final f:Lcom/google/android/gms/internal/ads/zzbbz;


# direct methods
.method public constructor <init>(Ll/o9t0;Landroid/content/Context;Ll/s9t0;Landroid/view/View;Lcom/google/android/gms/internal/ads/zzbbz;)V
    .locals 0
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hju0;->a:Ll/o9t0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hju0;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hju0;->c:Ll/s9t0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/hju0;->d:Landroid/view/View;

    .line 11
    .line 12
    iput-object p5, p0, Ll/hju0;->f:Lcom/google/android/gms/internal/ads/zzbbz;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final i(Ll/f5t0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object p2, p0, Ll/hju0;->c:Ll/s9t0;

    .line 2
    .line 3
    iget-object p3, p0, Ll/hju0;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Ll/s9t0;->p(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Ll/hju0;->c:Ll/s9t0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/hju0;->b:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/s9t0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object p0, p0, Ll/hju0;->a:Ll/o9t0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/o9t0;->b()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-interface {p1}, Ll/f5t0;->zzc()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-interface {p1}, Ll/f5t0;->zzb()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    invoke-virtual/range {v0 .. v5}, Ll/s9t0;->l(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception v0

    .line 38
    move-object p0, v0

    .line 39
    const-string p1, "Remote Exception to get reward item."

    .line 40
    .line 41
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final zza()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hju0;->a:Ll/o9t0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/o9t0;->i(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final zzb()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzc()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hju0;->d:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/hju0;->e:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/hju0;->c:Ll/s9t0;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, p0, Ll/hju0;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v0, v2}, Ll/s9t0;->o(Landroid/content/Context;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/hju0;->a:Ll/o9t0;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Ll/o9t0;->i(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final zze()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzf()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzk()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzl()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hju0;->f:Lcom/google/android/gms/internal/ads/zzbbz;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/gms/internal/ads/zzbbz;->zzk:Lcom/google/android/gms/internal/ads/zzbbz;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/hju0;->c:Ll/s9t0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/hju0;->b:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/s9t0;->c(Landroid/content/Context;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/hju0;->e:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Ll/hju0;->f:Lcom/google/android/gms/internal/ads/zzbbz;

    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v2, Lcom/google/android/gms/internal/ads/zzbbz;->zzh:Lcom/google/android/gms/internal/ads/zzbbz;

    .line 25
    .line 26
    if-ne v1, v2, :cond_1

    .line 27
    .line 28
    const-string v1, "/Rewarded"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-string v1, "/Interstitial"

    .line 32
    .line 33
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/hju0;->e:Ljava/lang/String;

    .line 38
    .line 39
    return-void
.end method
