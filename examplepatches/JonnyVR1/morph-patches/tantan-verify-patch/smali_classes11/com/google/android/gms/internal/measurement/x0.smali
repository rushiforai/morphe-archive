.class public final Lcom/google/android/gms/internal/measurement/x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ocy0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/ocy0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/m9y0;

.field public final b:Ll/hfy0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hfy0<",
            "**>;"
        }
    .end annotation
.end field

.field public final c:Z

.field public final d:Ll/e0y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/e0y0<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/hfy0;Ll/e0y0;Ll/m9y0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hfy0<",
            "**>;",
            "Ll/e0y0<",
            "*>;",
            "Ll/m9y0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 5
    .line 6
    invoke-virtual {p2, p3}, Ll/e0y0;->h(Ll/m9y0;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput-boolean p1, p0, Lcom/google/android/gms/internal/measurement/x0;->c:Z

    .line 11
    .line 12
    iput-object p2, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/google/android/gms/internal/measurement/x0;->a:Ll/m9y0;

    .line 15
    .line 16
    return-void
.end method

.method public static g(Ll/hfy0;Ll/e0y0;Ll/m9y0;)Lcom/google/android/gms/internal/measurement/x0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/hfy0<",
            "**>;",
            "Ll/e0y0<",
            "*>;",
            "Ll/m9y0;",
            ")",
            "Lcom/google/android/gms/internal/measurement/x0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/measurement/x0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/measurement/x0;-><init>(Ll/hfy0;Ll/e0y0;Ll/m9y0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ll/shy0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/shy0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/e0y0;->d(Ljava/lang/Object;)Ll/v0y0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/v0y0;->p()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/e1y0;

    .line 28
    .line 29
    invoke-interface {v2}, Ll/e1y0;->zzc()Lcom/google/android/gms/internal/measurement/zzmz;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    sget-object v4, Lcom/google/android/gms/internal/measurement/zzmz;->zzi:Lcom/google/android/gms/internal/measurement/zzmz;

    .line 34
    .line 35
    if-ne v3, v4, :cond_1

    .line 36
    .line 37
    invoke-interface {v2}, Ll/e1y0;->zze()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    invoke-interface {v2}, Ll/e1y0;->zzd()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    instance-of v3, v1, Ll/u4y0;

    .line 50
    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    invoke-interface {v2}, Ll/e1y0;->zza()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    check-cast v1, Ll/u4y0;

    .line 58
    .line 59
    invoke-virtual {v1}, Ll/u4y0;->a()Ll/z4y0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/s5y0;->c()Lcom/google/android/gms/internal/measurement/zzik;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-interface {p2, v2, v1}, Ll/shy0;->o(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-interface {v2}, Ll/e1y0;->zza()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {p2, v2, v1}, Ll/shy0;->o(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const-string p0, "Found invalid MessageSet item."

    .line 84
    .line 85
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/hfy0;->q(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1, p2}, Ll/hfy0;->h(Ljava/lang/Object;Ll/shy0;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final b(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e0y0;->d(Ljava/lang/Object;)Ll/v0y0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/v0y0;->s()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final c(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/vcy0;->o(Ll/hfy0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/google/android/gms/internal/measurement/x0;->c:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 11
    .line 12
    invoke-static {p0, p1, p2}, Ll/vcy0;->m(Ll/e0y0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final d(Ljava/lang/Object;Ll/zby0;Lcom/google/android/gms/internal/measurement/s0;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/zby0;",
            "Lcom/google/android/gms/internal/measurement/s0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/hfy0;->o(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v1, p1}, Ll/e0y0;->i(Ljava/lang/Object;)Ll/v0y0;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    :cond_0
    :try_start_0
    invoke-interface {p2}, Ll/zby0;->zzc()I

    .line 14
    .line 15
    .line 16
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    const v5, 0x7fffffff

    .line 18
    .line 19
    .line 20
    if-ne v4, v5, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0, p1, v2}, Ll/hfy0;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    :try_start_1
    invoke-interface {p2}, Ll/zby0;->zzd()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    const/16 v6, 0xb

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    if-eq v4, v6, :cond_4

    .line 34
    .line 35
    and-int/lit8 v5, v4, 0x7

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    if-ne v5, v6, :cond_3

    .line 39
    .line 40
    iget-object v5, p0, Lcom/google/android/gms/internal/measurement/x0;->a:Ll/m9y0;

    .line 41
    .line 42
    ushr-int/lit8 v4, v4, 0x3

    .line 43
    .line 44
    invoke-virtual {v1, p3, v5, v4}, Ll/e0y0;->b(Lcom/google/android/gms/internal/measurement/s0;Ll/m9y0;I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1, p2, v4, p3, v3}, Ll/e0y0;->f(Ll/zby0;Ljava/lang/Object;Lcom/google/android/gms/internal/measurement/s0;Ll/v0y0;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_3

    .line 56
    :cond_2
    invoke-virtual {v0, v2, p2, v7}, Ll/hfy0;->i(Ljava/lang/Object;Ll/zby0;I)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    goto :goto_2

    .line 61
    :cond_3
    invoke-interface {p2}, Ll/zby0;->zzt()Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    goto :goto_2

    .line 66
    :cond_4
    const/4 v4, 0x0

    .line 67
    move-object v6, v4

    .line 68
    :cond_5
    :goto_0
    invoke-interface {p2}, Ll/zby0;->zzc()I

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    if-eq v8, v5, :cond_9

    .line 73
    .line 74
    invoke-interface {p2}, Ll/zby0;->zzd()I

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    const/16 v9, 0x10

    .line 79
    .line 80
    if-ne v8, v9, :cond_6

    .line 81
    .line 82
    invoke-interface {p2}, Ll/zby0;->zzj()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    iget-object v4, p0, Lcom/google/android/gms/internal/measurement/x0;->a:Ll/m9y0;

    .line 87
    .line 88
    invoke-virtual {v1, p3, v4, v7}, Ll/e0y0;->b(Lcom/google/android/gms/internal/measurement/s0;Ll/m9y0;I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    goto :goto_0

    .line 93
    :cond_6
    const/16 v9, 0x1a

    .line 94
    .line 95
    if-ne v8, v9, :cond_8

    .line 96
    .line 97
    if-eqz v4, :cond_7

    .line 98
    .line 99
    invoke-virtual {v1, p2, v4, p3, v3}, Ll/e0y0;->f(Ll/zby0;Ljava/lang/Object;Lcom/google/android/gms/internal/measurement/s0;Ll/v0y0;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_7
    invoke-interface {p2}, Ll/zby0;->zzp()Lcom/google/android/gms/internal/measurement/zzik;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    goto :goto_0

    .line 108
    :cond_8
    invoke-interface {p2}, Ll/zby0;->zzt()Z

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    if-nez v8, :cond_5

    .line 113
    .line 114
    :cond_9
    invoke-interface {p2}, Ll/zby0;->zzd()I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    const/16 v8, 0xc

    .line 119
    .line 120
    if-ne v5, v8, :cond_c

    .line 121
    .line 122
    if-eqz v6, :cond_b

    .line 123
    .line 124
    if-eqz v4, :cond_a

    .line 125
    .line 126
    invoke-virtual {v1, v6, v4, p3, v3}, Ll/e0y0;->e(Lcom/google/android/gms/internal/measurement/zzik;Ljava/lang/Object;Lcom/google/android/gms/internal/measurement/s0;Ll/v0y0;)V

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_a
    invoke-virtual {v0, v2, v7, v6}, Ll/hfy0;->f(Ljava/lang/Object;ILcom/google/android/gms/internal/measurement/zzik;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    .line 132
    .line 133
    :cond_b
    :goto_1
    const/4 v4, 0x1

    .line 134
    :goto_2
    if-nez v4, :cond_0

    .line 135
    .line 136
    invoke-virtual {v0, p1, v2}, Ll/hfy0;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_c
    :try_start_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzkb;->zzb()Lcom/google/android/gms/internal/measurement/zzkb;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 145
    :goto_3
    invoke-virtual {v0, p1, v2}, Ll/hfy0;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    throw p0
.end method

.method public final e(Ljava/lang/Object;[BIILl/nvx0;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BII",
            "Ll/nvx0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/measurement/u0;

    .line 3
    .line 4
    iget-object v1, v0, Lcom/google/android/gms/internal/measurement/u0;->zzb:Ll/efy0;

    .line 5
    .line 6
    invoke-static {}, Ll/efy0;->k()Ll/efy0;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/efy0;->l()Ll/efy0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/google/android/gms/internal/measurement/u0;->zzb:Ll/efy0;

    .line 17
    .line 18
    :cond_0
    move-object v6, v1

    .line 19
    check-cast p1, Lcom/google/android/gms/internal/measurement/u0$d;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/u0$d;->B()Ll/v0y0;

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    move-object v0, p1

    .line 26
    :goto_0
    if-ge p3, p4, :cond_b

    .line 27
    .line 28
    invoke-static {p2, p3, p5}, Lcom/google/android/gms/internal/measurement/p0;->s([BILl/nvx0;)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    iget v2, p5, Ll/nvx0;->a:I

    .line 33
    .line 34
    const/16 p3, 0xb

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    if-eq v2, p3, :cond_3

    .line 38
    .line 39
    and-int/lit8 p3, v2, 0x7

    .line 40
    .line 41
    if-ne p3, v1, :cond_2

    .line 42
    .line 43
    iget-object p3, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 44
    .line 45
    iget-object v0, p5, Ll/nvx0;->d:Lcom/google/android/gms/internal/measurement/s0;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/google/android/gms/internal/measurement/x0;->a:Ll/m9y0;

    .line 48
    .line 49
    ushr-int/lit8 v3, v2, 0x3

    .line 50
    .line 51
    invoke-virtual {p3, v0, v1, v3}, Ll/e0y0;->b(Lcom/google/android/gms/internal/measurement/s0;Ll/m9y0;I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    move-object v0, p3

    .line 56
    check-cast v0, Lcom/google/android/gms/internal/measurement/u0$f;

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    move-object v3, p2

    .line 61
    move v5, p4

    .line 62
    move-object v7, p5

    .line 63
    invoke-static/range {v2 .. v7}, Lcom/google/android/gms/internal/measurement/p0;->e(I[BIILl/efy0;Ll/nvx0;)I

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    invoke-static {}, Ll/vby0;->a()Ll/vby0;

    .line 69
    .line 70
    .line 71
    new-instance p0, Ljava/lang/NoSuchMethodError;

    .line 72
    .line 73
    invoke-direct {p0}, Ljava/lang/NoSuchMethodError;-><init>()V

    .line 74
    .line 75
    .line 76
    throw p0

    .line 77
    :cond_2
    move-object v3, p2

    .line 78
    move v5, p4

    .line 79
    move-object v7, p5

    .line 80
    invoke-static {v2, v3, v4, v5, v7}, Lcom/google/android/gms/internal/measurement/p0;->c(I[BIILl/nvx0;)I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    goto :goto_0

    .line 85
    :cond_3
    move-object v3, p2

    .line 86
    move v5, p4

    .line 87
    move-object v7, p5

    .line 88
    const/4 p2, 0x0

    .line 89
    move-object p3, p1

    .line 90
    :goto_1
    if-ge v4, v5, :cond_8

    .line 91
    .line 92
    invoke-static {v3, v4, v7}, Lcom/google/android/gms/internal/measurement/p0;->s([BILl/nvx0;)I

    .line 93
    .line 94
    .line 95
    move-result p4

    .line 96
    iget p5, v7, Ll/nvx0;->a:I

    .line 97
    .line 98
    ushr-int/lit8 v2, p5, 0x3

    .line 99
    .line 100
    and-int/lit8 v4, p5, 0x7

    .line 101
    .line 102
    if-eq v2, v1, :cond_6

    .line 103
    .line 104
    const/4 v8, 0x3

    .line 105
    if-eq v2, v8, :cond_4

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_4
    if-nez v0, :cond_5

    .line 109
    .line 110
    if-ne v4, v1, :cond_7

    .line 111
    .line 112
    invoke-static {v3, p4, v7}, Lcom/google/android/gms/internal/measurement/p0;->l([BILl/nvx0;)I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    iget-object p3, v7, Ll/nvx0;->c:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast p3, Lcom/google/android/gms/internal/measurement/zzik;

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_5
    invoke-static {}, Ll/vby0;->a()Ll/vby0;

    .line 122
    .line 123
    .line 124
    new-instance p0, Ljava/lang/NoSuchMethodError;

    .line 125
    .line 126
    invoke-direct {p0}, Ljava/lang/NoSuchMethodError;-><init>()V

    .line 127
    .line 128
    .line 129
    throw p0

    .line 130
    :cond_6
    if-nez v4, :cond_7

    .line 131
    .line 132
    invoke-static {v3, p4, v7}, Lcom/google/android/gms/internal/measurement/p0;->s([BILl/nvx0;)I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    iget p2, v7, Ll/nvx0;->a:I

    .line 137
    .line 138
    iget-object p4, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 139
    .line 140
    iget-object p5, v7, Ll/nvx0;->d:Lcom/google/android/gms/internal/measurement/s0;

    .line 141
    .line 142
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->a:Ll/m9y0;

    .line 143
    .line 144
    invoke-virtual {p4, p5, v0, p2}, Ll/e0y0;->b(Lcom/google/android/gms/internal/measurement/s0;Ll/m9y0;I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p4

    .line 148
    move-object v0, p4

    .line 149
    check-cast v0, Lcom/google/android/gms/internal/measurement/u0$f;

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_7
    :goto_2
    const/16 v2, 0xc

    .line 153
    .line 154
    if-eq p5, v2, :cond_9

    .line 155
    .line 156
    invoke-static {p5, v3, p4, v5, v7}, Lcom/google/android/gms/internal/measurement/p0;->c(I[BIILl/nvx0;)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    goto :goto_1

    .line 161
    :cond_8
    move p4, v4

    .line 162
    :cond_9
    if-eqz p3, :cond_a

    .line 163
    .line 164
    shl-int/lit8 p2, p2, 0x3

    .line 165
    .line 166
    or-int/2addr p2, v1

    .line 167
    invoke-virtual {v6, p2, p3}, Ll/efy0;->e(ILjava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    :cond_a
    move p3, p4

    .line 171
    move-object p2, v3

    .line 172
    move p4, v5

    .line 173
    move-object p5, v7

    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_b
    move v5, p4

    .line 177
    if-ne p3, v5, :cond_c

    .line 178
    .line 179
    return-void

    .line 180
    :cond_c
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzkb;->zzg()Lcom/google/android/gms/internal/measurement/zzkb;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    throw p0
.end method

.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/hfy0;->q(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 8
    .line 9
    invoke-virtual {v1, p2}, Ll/hfy0;->q(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/measurement/x0;->c:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ll/e0y0;->d(Ljava/lang/Object;)Ll/v0y0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/e0y0;->d(Ljava/lang/Object;)Ll/v0y0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/v0y0;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public final zza(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/hfy0;->q(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/hfy0;->k(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-boolean v1, p0, Lcom/google/android/gms/internal/measurement/x0;->c:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/e0y0;->d(Ljava/lang/Object;)Ll/v0y0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/v0y0;->a()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    add-int/2addr v0, p0

    .line 26
    :cond_0
    return v0
.end method

.method public final zza()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 27
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->a:Ll/m9y0;

    instance-of v0, p0, Lcom/google/android/gms/internal/measurement/u0;

    if-eqz v0, :cond_0

    .line 28
    check-cast p0, Lcom/google/android/gms/internal/measurement/u0;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/u0;->u()Lcom/google/android/gms/internal/measurement/u0;

    move-result-object p0

    return-object p0

    .line 29
    :cond_0
    invoke-interface {p0}, Ll/m9y0;->Q()Ll/i9y0;

    move-result-object p0

    invoke-interface {p0}, Ll/i9y0;->F()Ll/m9y0;

    move-result-object p0

    return-object p0
.end method

.method public final zzb(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/hfy0;->q(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-boolean v1, p0, Lcom/google/android/gms/internal/measurement/x0;->c:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/e0y0;->d(Ljava/lang/Object;)Ll/v0y0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    mul-int/lit8 v0, v0, 0x35

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/v0y0;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-int/2addr v0, p0

    .line 28
    :cond_0
    return v0
.end method

.method public final zzd(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/x0;->b:Ll/hfy0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/hfy0;->s(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/x0;->d:Ll/e0y0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/e0y0;->j(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
