.class public final Lcom/google/android/gms/internal/play_billing/i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uxx0;


# instance fields
.field public final a:Ll/yvx0;

.field public final b:Ll/k0y0;

.field public final c:Z

.field public final d:Ll/efx0;


# direct methods
.method public constructor <init>(Ll/k0y0;Ll/efx0;Ll/yvx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/play_billing/i0;->b:Ll/k0y0;

    .line 5
    .line 6
    instance-of p1, p3, Lcom/google/android/gms/internal/play_billing/c0;

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/google/android/gms/internal/play_billing/i0;->c:Z

    .line 9
    .line 10
    iput-object p2, p0, Lcom/google/android/gms/internal/play_billing/i0;->d:Ll/efx0;

    .line 11
    .line 12
    iput-object p3, p0, Lcom/google/android/gms/internal/play_billing/i0;->a:Ll/yvx0;

    .line 13
    .line 14
    return-void
.end method

.method public static f(Ll/k0y0;Ll/efx0;Ll/yvx0;)Lcom/google/android/gms/internal/play_billing/i0;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/play_billing/i0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/play_billing/i0;-><init>(Ll/k0y0;Ll/efx0;Ll/yvx0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/play_billing/i0;->b:Ll/k0y0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/k0y0;->a(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/gms/internal/play_billing/i0;->d:Ll/efx0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/efx0;->a(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final b(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 3
    .line 4
    iget-object v0, v0, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 5
    .line 6
    move-object v1, p2

    .line 7
    check-cast v1, Lcom/google/android/gms/internal/play_billing/d0;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    iget-boolean p0, p0, Lcom/google/android/gms/internal/play_billing/i0;->c:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    check-cast p1, Lcom/google/android/gms/internal/play_billing/c0;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/google/android/gms/internal/play_billing/c0;->zzb:Ll/yjx0;

    .line 26
    .line 27
    check-cast p2, Lcom/google/android/gms/internal/play_billing/c0;

    .line 28
    .line 29
    iget-object p1, p2, Lcom/google/android/gms/internal/play_billing/c0;->zzb:Ll/yjx0;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/yjx0;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final c(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/play_billing/c0;

    .line 2
    .line 3
    iget-object p0, p1, Lcom/google/android/gms/internal/play_billing/c0;->zzb:Ll/yjx0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yjx0;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final d(Ljava/lang/Object;[BIILl/ypw0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 3
    .line 4
    iget-object p2, p0, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 5
    .line 6
    invoke-static {}, Ll/o0y0;->c()Ll/o0y0;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    if-eq p2, p3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {}, Ll/o0y0;->f()Ll/o0y0;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iput-object p2, p0, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 18
    .line 19
    :goto_0
    check-cast p1, Lcom/google/android/gms/internal/play_billing/c0;

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    throw p0
.end method

.method public final e(Ljava/lang/Object;Ll/o2y0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Lcom/google/android/gms/internal/play_billing/c0;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/internal/play_billing/c0;->zzb:Ll/yjx0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yjx0;->e()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/util/Map$Entry;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/zix0;

    .line 27
    .line 28
    invoke-interface {v1}, Ll/zix0;->zzc()Lcom/google/android/gms/internal/play_billing/zzjv;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget-object v3, Lcom/google/android/gms/internal/play_billing/zzjv;->zzi:Lcom/google/android/gms/internal/play_billing/zzjv;

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-interface {v1}, Ll/zix0;->zze()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    invoke-interface {v1}, Ll/zix0;->zzd()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    instance-of v2, v0, Ll/hsx0;

    .line 49
    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    invoke-interface {v1}, Ll/zix0;->zza()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    check-cast v0, Ll/hsx0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/hsx0;->a()Ll/tsx0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/e0;->b()Lcom/google/android/gms/internal/play_billing/zzgk;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {p2, v1, v0}, Ll/o2y0;->x(ILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-interface {v1}, Ll/zix0;->zza()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {p2, v1, v0}, Ll/o2y0;->x(ILjava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    const-string p0, "Found invalid MessageSet item."

    .line 83
    .line 84
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/play_billing/d0;

    .line 89
    .line 90
    iget-object p0, p1, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 91
    .line 92
    invoke-virtual {p0, p2}, Ll/o0y0;->k(Ll/o2y0;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final zza(Ljava/lang/Object;)I
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 3
    .line 4
    iget-object v0, v0, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/o0y0;->b()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-boolean p0, p0, Lcom/google/android/gms/internal/play_billing/i0;->c:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    check-cast p1, Lcom/google/android/gms/internal/play_billing/c0;

    .line 15
    .line 16
    iget-object p0, p1, Lcom/google/android/gms/internal/play_billing/c0;->zzb:Ll/yjx0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/yjx0;->c()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-int/2addr v0, p0

    .line 23
    :cond_0
    return v0
.end method

.method public final zzb(Ljava/lang/Object;)I
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 3
    .line 4
    iget-object v0, v0, Lcom/google/android/gms/internal/play_billing/d0;->zzc:Ll/o0y0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-boolean p0, p0, Lcom/google/android/gms/internal/play_billing/i0;->c:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    check-cast p1, Lcom/google/android/gms/internal/play_billing/c0;

    .line 15
    .line 16
    iget-object p0, p1, Lcom/google/android/gms/internal/play_billing/c0;->zzb:Ll/yjx0;

    .line 17
    .line 18
    mul-int/lit8 v0, v0, 0x35

    .line 19
    .line 20
    iget-object p0, p0, Ll/yjx0;->a:Ll/uzx0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/uzx0;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr v0, p0

    .line 27
    :cond_0
    return v0
.end method

.method public final zze()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/play_billing/i0;->a:Ll/yvx0;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/play_billing/d0;->m()Lcom/google/android/gms/internal/play_billing/d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-interface {p0}, Ll/yvx0;->p()Ll/tvx0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ll/tvx0;->zzh()Ll/yvx0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final zzg(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/play_billing/i0;->b:Ll/k0y0;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/play_billing/j0;->u(Ll/k0y0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/google/android/gms/internal/play_billing/i0;->c:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/gms/internal/play_billing/i0;->d:Ll/efx0;

    .line 11
    .line 12
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/play_billing/j0;->t(Ll/efx0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
