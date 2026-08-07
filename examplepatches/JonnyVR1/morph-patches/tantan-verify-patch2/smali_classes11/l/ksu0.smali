.class public final Ll/ksu0;
.super Ll/kzt0;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Ljava/lang/ref/WeakReference;

.field public final l:Ll/wiu0;

.field public final m:Ll/dfu0;

.field public final n:Ll/c7u0;

.field public final o:Ll/q8u0;

.field public final p:Ll/m0u0;

.field public final q:Ll/i7t0;

.field public final r:Ll/kiw0;

.field public final s:Ll/h7w0;

.field public t:Z


# direct methods
.method public constructor <init>(Ll/jzt0;Landroid/content/Context;Ll/wit0;Ll/wiu0;Ll/dfu0;Ll/c7u0;Ll/q8u0;Ll/m0u0;Ll/q6w0;Ll/kiw0;Ll/h7w0;)V
    .locals 0
    .param p3    # Ll/wit0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/kzt0;-><init>(Ll/jzt0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ksu0;->t:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/ksu0;->j:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p4, p0, Ll/ksu0;->l:Ll/wiu0;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ksu0;->k:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    iput-object p5, p0, Ll/ksu0;->m:Ll/dfu0;

    .line 19
    .line 20
    iput-object p6, p0, Ll/ksu0;->n:Ll/c7u0;

    .line 21
    .line 22
    iput-object p7, p0, Ll/ksu0;->o:Ll/q8u0;

    .line 23
    .line 24
    iput-object p8, p0, Ll/ksu0;->p:Ll/m0u0;

    .line 25
    .line 26
    iput-object p10, p0, Ll/ksu0;->r:Ll/kiw0;

    .line 27
    .line 28
    new-instance p1, Ll/j8t0;

    .line 29
    .line 30
    iget-object p2, p9, Ll/q6w0;->m:Lcom/google/android/gms/internal/ads/zzcag;

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    iget-object p3, p2, Lcom/google/android/gms/internal/ads/zzcag;->zza:Ljava/lang/String;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p3, ""

    .line 38
    .line 39
    :goto_0
    if-eqz p2, :cond_1

    .line 40
    .line 41
    iget p2, p2, Lcom/google/android/gms/internal/ads/zzcag;->zzb:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const/4 p2, 0x1

    .line 45
    :goto_1
    invoke-direct {p1, p3, p2}, Ll/j8t0;-><init>(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/ksu0;->q:Ll/i7t0;

    .line 49
    .line 50
    iput-object p11, p0, Ll/ksu0;->s:Ll/h7w0;

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final finalize()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ksu0;->k:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wit0;

    .line 8
    .line 9
    sget-object v1, Ll/sgs0;->L6:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-boolean v1, p0, Ll/ksu0;->t:Z

    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget-object v1, Ll/oct0;->e:Ll/xvw0;

    .line 34
    .line 35
    new-instance v2, Ll/jsu0;

    .line 36
    .line 37
    invoke-direct {v2, v0}, Ll/jsu0;-><init>(Ll/wit0;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-interface {v0}, Ll/wit0;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :goto_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 56
    .line 57
    .line 58
    throw v0
.end method

.method public final i()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksu0;->o:Ll/q8u0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q8u0;->w0()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final j()Ll/i7t0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksu0;->q:Ll/i7t0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Ll/h7w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksu0;->s:Ll/h7w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksu0;->p:Ll/m0u0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m0u0;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ksu0;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public final n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ksu0;->k:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wit0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/wit0;->c0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final o(ZLandroid/app/Activity;)Z
    .locals 4
    .param p2    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/sgs0;->B0:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ksu0;->j:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->f(Landroid/content/Context;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string p1, "Rewarded ads that show when your app is in the background are a violation of AdMob policies and may lead to blocked ad serving. To learn more, visit https://googlemobileadssdk.page.link/admob-interstitial-policies"

    .line 32
    .line 33
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/ksu0;->n:Ll/c7u0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/c7u0;->zzb()V

    .line 39
    .line 40
    .line 41
    sget-object p1, Ll/sgs0;->C0:Ll/dgs0;

    .line 42
    .line 43
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Ll/ksu0;->r:Ll/kiw0;

    .line 60
    .line 61
    iget-object p0, p0, Ll/kzt0;->a:Ll/b7w0;

    .line 62
    .line 63
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 64
    .line 65
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 66
    .line 67
    iget-object p0, p0, Ll/t6w0;->b:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ll/kiw0;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return v1

    .line 73
    :cond_1
    iget-boolean v0, p0, Ll/ksu0;->t:Z

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    const-string p1, "The rewarded ad have been showed."

    .line 78
    .line 79
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/ksu0;->n:Ll/c7u0;

    .line 83
    .line 84
    const/16 p1, 0xa

    .line 85
    .line 86
    const/4 p2, 0x0

    .line 87
    invoke-static {p1, p2, p2}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Ll/c7u0;->i(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 92
    .line 93
    .line 94
    return v1

    .line 95
    :cond_2
    const/4 v0, 0x1

    .line 96
    iput-boolean v0, p0, Ll/ksu0;->t:Z

    .line 97
    .line 98
    iget-object v2, p0, Ll/ksu0;->m:Ll/dfu0;

    .line 99
    .line 100
    invoke-virtual {v2}, Ll/dfu0;->zzb()V

    .line 101
    .line 102
    .line 103
    if-nez p2, :cond_3

    .line 104
    .line 105
    iget-object p2, p0, Ll/ksu0;->j:Landroid/content/Context;

    .line 106
    .line 107
    :cond_3
    :try_start_0
    iget-object v2, p0, Ll/ksu0;->l:Ll/wiu0;

    .line 108
    .line 109
    iget-object v3, p0, Ll/ksu0;->n:Ll/c7u0;

    .line 110
    .line 111
    invoke-interface {v2, p1, p2, v3}, Ll/wiu0;->a(ZLandroid/content/Context;Ll/c7u0;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/ksu0;->m:Ll/dfu0;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/dfu0;->zza()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzdkv; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    return v0

    .line 120
    :catch_0
    move-exception p1

    .line 121
    iget-object p0, p0, Ll/ksu0;->n:Ll/c7u0;

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ll/c7u0;->Z(Lcom/google/android/gms/internal/ads/zzdkv;)V

    .line 124
    .line 125
    .line 126
    return v1
.end method
