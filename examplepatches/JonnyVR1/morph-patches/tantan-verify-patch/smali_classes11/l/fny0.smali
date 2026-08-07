.class public final Ll/fny0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/hwt0;

.field public b:Lcom/google/android/gms/internal/ads/zzgaa;

.field public c:Lcom/google/android/gms/internal/ads/zzgad;

.field public d:Ll/kzy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/kzy0;

.field public f:Ll/kzy0;


# direct methods
.method public constructor <init>(Ll/hwt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fny0;->a:Ll/hwt0;

    .line 5
    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 11
    .line 12
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgad;->zzd()Lcom/google/android/gms/internal/ads/zzgad;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/fny0;->c:Lcom/google/android/gms/internal/ads/zzgad;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic f(Ll/fny0;)Lcom/google/android/gms/internal/ads/zzgaa;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    return-object p0
.end method

.method public static j(Ll/oot0;Lcom/google/android/gms/internal/ads/zzgaa;Ll/kzy0;Ll/hwt0;)Ll/kzy0;
    .locals 10
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/oot0;->zzn()Ll/d0u0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Ll/oot0;->zze()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0}, Ll/d0u0;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    move-object v5, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Ll/d0u0;->f(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    move-object v5, v2

    .line 23
    :goto_0
    invoke-interface {p0}, Ll/oot0;->g()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v4, 0x0

    .line 28
    const/4 v6, -0x1

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/d0u0;->o()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    :cond_1
    :goto_1
    move v9, v6

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    invoke-virtual {v0, v1, p3, v4}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-interface {p0}, Ll/oot0;->zzk()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    invoke-virtual {p3, v0, v1}, Ll/hwt0;->c(J)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    goto :goto_1

    .line 56
    :goto_2
    move p3, v4

    .line 57
    :goto_3
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ge p3, v0, :cond_4

    .line 62
    .line 63
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    move-object v4, v0

    .line 68
    check-cast v4, Ll/kzy0;

    .line 69
    .line 70
    invoke-interface {p0}, Ll/oot0;->g()Z

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    invoke-interface {p0}, Ll/oot0;->zzb()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    invoke-interface {p0}, Ll/oot0;->zzc()I

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    invoke-static/range {v4 .. v9}, Ll/fny0;->m(Ll/kzy0;Ljava/lang/Object;ZIII)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    return-object v4

    .line 89
    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_5

    .line 97
    .line 98
    if-eqz p2, :cond_5

    .line 99
    .line 100
    invoke-interface {p0}, Ll/oot0;->g()Z

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    invoke-interface {p0}, Ll/oot0;->zzb()I

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    invoke-interface {p0}, Ll/oot0;->zzc()I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    move-object v4, p2

    .line 113
    invoke-static/range {v4 .. v9}, Ll/fny0;->m(Ll/kzy0;Ljava/lang/Object;ZIII)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_5

    .line 118
    .line 119
    return-object v4

    .line 120
    :cond_5
    return-object v3
.end method

.method public static m(Ll/kzy0;Ljava/lang/Object;ZIII)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/kzy0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    iget p1, p0, Ll/kzy0;->b:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    if-ne p1, p3, :cond_1

    .line 17
    .line 18
    iget p0, p0, Ll/kzy0;->c:I

    .line 19
    .line 20
    if-ne p0, p4, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    return v0

    .line 24
    :cond_2
    const/4 p2, -0x1

    .line 25
    if-ne p1, p2, :cond_3

    .line 26
    .line 27
    iget p0, p0, Ll/kzy0;->e:I

    .line 28
    .line 29
    if-ne p0, p5, :cond_3

    .line 30
    .line 31
    return v1

    .line 32
    :cond_3
    return v0
.end method


# virtual methods
.method public final a(Ll/kzy0;)Ll/d0u0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fny0;->c:Lcom/google/android/gms/internal/ads/zzgad;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/zzgad;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/d0u0;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b()Ll/kzy0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fny0;->d:Ll/kzy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/kzy0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/lit8 v0, v0, -0x1

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {}, Ll/mor;->a()V

    .line 33
    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_2
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :cond_3
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    move-object p0, v0

    .line 51
    :goto_0
    check-cast p0, Ll/kzy0;

    .line 52
    .line 53
    return-object p0
.end method

.method public final d()Ll/kzy0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fny0;->e:Ll/kzy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/kzy0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fny0;->f:Ll/kzy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Ll/oot0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fny0;->e:Ll/kzy0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fny0;->a:Ll/hwt0;

    .line 6
    .line 7
    invoke-static {p1, v0, v1, v2}, Ll/fny0;->j(Ll/oot0;Lcom/google/android/gms/internal/ads/zzgaa;Ll/kzy0;Ll/hwt0;)Ll/kzy0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 12
    .line 13
    return-void
.end method

.method public final h(Ljava/util/List;Ll/kzy0;Ll/oot0;)V
    .locals 1
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/zzgaa;->zzj(Ljava/util/Collection;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ll/kzy0;

    .line 19
    .line 20
    iput-object p1, p0, Ll/fny0;->e:Ll/kzy0;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Ll/fny0;->f:Ll/kzy0;

    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 32
    .line 33
    iget-object p2, p0, Ll/fny0;->e:Ll/kzy0;

    .line 34
    .line 35
    iget-object v0, p0, Ll/fny0;->a:Ll/hwt0;

    .line 36
    .line 37
    invoke-static {p3, p1, p2, v0}, Ll/fny0;->j(Ll/oot0;Lcom/google/android/gms/internal/ads/zzgaa;Ll/kzy0;Ll/hwt0;)Ll/kzy0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 42
    .line 43
    :cond_1
    invoke-interface {p3}, Ll/oot0;->zzn()Ll/d0u0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Ll/fny0;->l(Ll/d0u0;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final i(Ll/oot0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fny0;->e:Ll/kzy0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fny0;->a:Ll/hwt0;

    .line 6
    .line 7
    invoke-static {p1, v0, v1, v2}, Ll/fny0;->j(Ll/oot0;Lcom/google/android/gms/internal/ads/zzgaa;Ll/kzy0;Ll/hwt0;)Ll/kzy0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/fny0;->d:Ll/kzy0;

    .line 12
    .line 13
    invoke-interface {p1}, Ll/oot0;->zzn()Ll/d0u0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/fny0;->l(Ll/d0u0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final k(Lcom/google/android/gms/internal/ads/w2;Ll/kzy0;Ll/d0u0;)V
    .locals 2
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iget-object p0, p0, Ll/fny0;->c:Lcom/google/android/gms/internal/ads/zzgad;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/ads/zzgad;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/d0u0;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1, p2, p0}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public final l(Ll/d0u0;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/w2;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/w2;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/fny0;->e:Ll/kzy0;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1, p1}, Ll/fny0;->k(Lcom/google/android/gms/internal/ads/w2;Ll/kzy0;Ll/d0u0;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/fny0;->f:Ll/kzy0;

    .line 20
    .line 21
    iget-object v2, p0, Ll/fny0;->e:Ll/kzy0;

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/kow0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Ll/fny0;->f:Ll/kzy0;

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1, p1}, Ll/fny0;->k(Lcom/google/android/gms/internal/ads/w2;Ll/kzy0;Ll/d0u0;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 35
    .line 36
    iget-object v2, p0, Ll/fny0;->e:Ll/kzy0;

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/kow0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_3

    .line 43
    .line 44
    iget-object v1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 45
    .line 46
    iget-object v2, p0, Ll/fny0;->f:Ll/kzy0;

    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/kow0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    iget-object v1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1, p1}, Ll/fny0;->k(Lcom/google/android/gms/internal/ads/w2;Ll/kzy0;Ll/d0u0;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    const/4 v1, 0x0

    .line 61
    :goto_0
    iget-object v2, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->size()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    iget-object v3, p0, Ll/fny0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 68
    .line 69
    if-ge v1, v2, :cond_2

    .line 70
    .line 71
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Ll/kzy0;

    .line 76
    .line 77
    invoke-virtual {p0, v0, v2, p1}, Ll/fny0;->k(Lcom/google/android/gms/internal/ads/w2;Ll/kzy0;Ll/d0u0;)V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v1, v1, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 84
    .line 85
    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/ads/zzgaa;->contains(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_3

    .line 90
    .line 91
    iget-object v1, p0, Ll/fny0;->d:Ll/kzy0;

    .line 92
    .line 93
    invoke-virtual {p0, v0, v1, p1}, Ll/fny0;->k(Lcom/google/android/gms/internal/ads/w2;Ll/kzy0;Ll/d0u0;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    :goto_1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/w2;->c()Lcom/google/android/gms/internal/ads/zzgad;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Ll/fny0;->c:Lcom/google/android/gms/internal/ads/zzgad;

    .line 101
    .line 102
    return-void
.end method
