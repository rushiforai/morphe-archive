.class public final Ll/m5u0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/lcw0;

.field public final b:Lcom/google/android/gms/internal/ads/zzcei;

.field public final c:Landroid/content/pm/ApplicationInfo;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/util/List;

.field public final f:Landroid/content/pm/PackageInfo;

.field public final g:Ll/kpx0;

.field public final h:Ljava/lang/String;

.field public final i:Ll/zuv0;

.field public final j:Ll/grw0;

.field public final k:Ll/o7w0;

.field public final l:Ll/fdu0;


# direct methods
.method public constructor <init>(Ll/lcw0;Lcom/google/android/gms/internal/ads/zzcei;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Ljava/util/List;Landroid/content/pm/PackageInfo;Ll/kpx0;Ll/grw0;Ljava/lang/String;Ll/zuv0;Ll/o7w0;Ll/fdu0;)V
    .locals 0
    .param p6    # Landroid/content/pm/PackageInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m5u0;->a:Ll/lcw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/m5u0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 7
    .line 8
    iput-object p3, p0, Ll/m5u0;->c:Landroid/content/pm/ApplicationInfo;

    .line 9
    .line 10
    iput-object p4, p0, Ll/m5u0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Ll/m5u0;->e:Ljava/util/List;

    .line 13
    .line 14
    iput-object p6, p0, Ll/m5u0;->f:Landroid/content/pm/PackageInfo;

    .line 15
    .line 16
    iput-object p7, p0, Ll/m5u0;->g:Ll/kpx0;

    .line 17
    .line 18
    iput-object p9, p0, Ll/m5u0;->h:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p10, p0, Ll/m5u0;->i:Ll/zuv0;

    .line 21
    .line 22
    iput-object p8, p0, Ll/m5u0;->j:Ll/grw0;

    .line 23
    .line 24
    iput-object p11, p0, Ll/m5u0;->k:Ll/o7w0;

    .line 25
    .line 26
    iput-object p12, p0, Ll/m5u0;->l:Ll/fdu0;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/hpr;)Lcom/google/android/gms/internal/ads/zzbze;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzbze;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    move-object v1, p1

    .line 8
    check-cast v1, Landroid/os/Bundle;

    .line 9
    .line 10
    iget-object p1, p0, Ll/m5u0;->g:Ll/kpx0;

    .line 11
    .line 12
    invoke-interface {p1}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/hpr;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    move-object v7, p1

    .line 23
    check-cast v7, Ljava/lang/String;

    .line 24
    .line 25
    sget-object p1, Ll/sgs0;->h7:Ll/dgs0;

    .line 26
    .line 27
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Ll/m5u0;->j:Ll/grw0;

    .line 45
    .line 46
    invoke-interface {p1}, Ll/grw0;->f()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    const/4 v2, 0x1

    .line 53
    :cond_0
    move v11, v2

    .line 54
    iget-object v8, p0, Ll/m5u0;->h:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v6, p0, Ll/m5u0;->f:Landroid/content/pm/PackageInfo;

    .line 57
    .line 58
    iget-object v5, p0, Ll/m5u0;->e:Ljava/util/List;

    .line 59
    .line 60
    iget-object v4, p0, Ll/m5u0;->d:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v3, p0, Ll/m5u0;->c:Landroid/content/pm/ApplicationInfo;

    .line 63
    .line 64
    iget-object v2, p0, Ll/m5u0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 65
    .line 66
    iget-object p0, p0, Ll/m5u0;->k:Ll/o7w0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/o7w0;->b()Z

    .line 69
    .line 70
    .line 71
    move-result v12

    .line 72
    const/4 v9, 0x0

    .line 73
    const/4 v10, 0x0

    .line 74
    invoke-direct/range {v0 .. v12}, Lcom/google/android/gms/internal/ads/zzbze;-><init>(Landroid/os/Bundle;Lcom/google/android/gms/internal/ads/zzcei;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Ljava/util/List;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzfjc;Ljava/lang/String;ZZ)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method public final b()Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m5u0;->l:Ll/fdu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fdu0;->zza()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/google/android/gms/internal/ads/zzflg;->zza:Lcom/google/android/gms/internal/ads/zzflg;

    .line 7
    .line 8
    new-instance v1, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ll/m5u0;->i:Ll/zuv0;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ll/zuv0;->a(Ljava/lang/Object;)Ll/hpr;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Ll/m5u0;->a:Ll/lcw0;

    .line 20
    .line 21
    invoke-static {v1, v0, p0}, Ll/rbw0;->c(Ll/hpr;Ljava/lang/Object;Ll/ecw0;)Ll/dcw0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/dcw0;->a()Ll/mbw0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final c()Ll/hpr;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/m5u0;->b()Ll/hpr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/android/gms/internal/ads/zzflg;->zzb:Lcom/google/android/gms/internal/ads/zzflg;

    .line 6
    .line 7
    iget-object v2, p0, Ll/m5u0;->g:Ll/kpx0;

    .line 8
    .line 9
    invoke-interface {v2}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ll/hpr;

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    new-array v3, v3, [Ll/hpr;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    aput-object v0, v3, v4

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    aput-object v2, v3, v4

    .line 23
    .line 24
    iget-object v2, p0, Ll/m5u0;->a:Ll/lcw0;

    .line 25
    .line 26
    invoke-virtual {v2, v1, v3}, Ll/ecw0;->a(Ljava/lang/Object;[Ll/hpr;)Ll/pbw0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/l5u0;

    .line 31
    .line 32
    invoke-direct {v2, p0, v0}, Ll/l5u0;-><init>(Ll/m5u0;Ll/hpr;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ll/pbw0;->a(Ljava/util/concurrent/Callable;)Ll/dcw0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/dcw0;->a()Ll/mbw0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method
