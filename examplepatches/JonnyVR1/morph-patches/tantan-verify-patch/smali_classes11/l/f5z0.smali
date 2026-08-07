.class public final Ll/f5z0;
.super Ll/h5z0;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final e:I

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:Z


# direct methods
.method public constructor <init>(ILl/t2u0;ILl/h4z0;ILjava/lang/String;)V
    .locals 3
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h5z0;-><init>(ILl/t2u0;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-static {p5, p1}, Ll/l5z0;->t(IZ)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iput-boolean p2, p0, Ll/f5z0;->f:Z

    .line 10
    .line 11
    iget-object p2, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 12
    .line 13
    iget p2, p2, Ll/sqr0;->d:I

    .line 14
    .line 15
    iget p3, p4, Ll/scu0;->v:I

    .line 16
    .line 17
    and-int/lit8 p3, p2, 0x1

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-eq v0, p3, :cond_0

    .line 21
    .line 22
    move p3, p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move p3, v0

    .line 25
    :goto_0
    iput-boolean p3, p0, Ll/f5z0;->g:Z

    .line 26
    .line 27
    and-int/lit8 p2, p2, 0x2

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    move p2, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move p2, p1

    .line 34
    :goto_1
    iput-boolean p2, p0, Ll/f5z0;->h:Z

    .line 35
    .line 36
    iget-object p2, p4, Ll/scu0;->t:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    const-string p2, ""

    .line 45
    .line 46
    invoke-static {p2}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    iget-object p2, p4, Ll/scu0;->t:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 52
    .line 53
    :goto_2
    move p3, p1

    .line 54
    :goto_3
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-ge p3, v1, :cond_4

    .line 59
    .line 60
    iget-object v1, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 61
    .line 62
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1, v2, p1}, Ll/l5z0;->l(Ll/sqr0;Ljava/lang/String;Z)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-lez v1, :cond_3

    .line 73
    .line 74
    goto :goto_4

    .line 75
    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_4
    const p3, 0x7fffffff

    .line 79
    .line 80
    .line 81
    move v1, p1

    .line 82
    :goto_4
    iput p3, p0, Ll/f5z0;->i:I

    .line 83
    .line 84
    iput v1, p0, Ll/f5z0;->j:I

    .line 85
    .line 86
    iget-object p2, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 87
    .line 88
    iget p2, p2, Ll/sqr0;->e:I

    .line 89
    .line 90
    iget p3, p4, Ll/scu0;->u:I

    .line 91
    .line 92
    invoke-static {p2, p3}, Ll/l5z0;->k(II)I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    iput p2, p0, Ll/f5z0;->k:I

    .line 97
    .line 98
    iget-object p3, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 99
    .line 100
    iget p3, p3, Ll/sqr0;->e:I

    .line 101
    .line 102
    and-int/lit16 p3, p3, 0x440

    .line 103
    .line 104
    if-eqz p3, :cond_5

    .line 105
    .line 106
    move p3, v0

    .line 107
    goto :goto_5

    .line 108
    :cond_5
    move p3, p1

    .line 109
    :goto_5
    iput-boolean p3, p0, Ll/f5z0;->m:Z

    .line 110
    .line 111
    invoke-static {p6}, Ll/l5z0;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    if-nez p3, :cond_6

    .line 116
    .line 117
    move p3, v0

    .line 118
    goto :goto_6

    .line 119
    :cond_6
    move p3, p1

    .line 120
    :goto_6
    iget-object v2, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 121
    .line 122
    invoke-static {v2, p6, p3}, Ll/l5z0;->l(Ll/sqr0;Ljava/lang/String;Z)I

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    iput p3, p0, Ll/f5z0;->l:I

    .line 127
    .line 128
    if-gtz v1, :cond_7

    .line 129
    .line 130
    iget-object p6, p4, Ll/scu0;->t:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 131
    .line 132
    invoke-virtual {p6}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result p6

    .line 136
    if-eqz p6, :cond_8

    .line 137
    .line 138
    if-gtz p2, :cond_7

    .line 139
    .line 140
    goto :goto_8

    .line 141
    :cond_7
    :goto_7
    move p2, v0

    .line 142
    goto :goto_9

    .line 143
    :cond_8
    :goto_8
    iget-boolean p2, p0, Ll/f5z0;->g:Z

    .line 144
    .line 145
    if-nez p2, :cond_7

    .line 146
    .line 147
    iget-boolean p2, p0, Ll/f5z0;->h:Z

    .line 148
    .line 149
    if-eqz p2, :cond_9

    .line 150
    .line 151
    if-lez p3, :cond_9

    .line 152
    .line 153
    goto :goto_7

    .line 154
    :cond_9
    move p2, p1

    .line 155
    :goto_9
    iget-boolean p3, p4, Ll/h4z0;->v0:Z

    .line 156
    .line 157
    invoke-static {p5, p3}, Ll/l5z0;->t(IZ)Z

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    if-eqz p3, :cond_a

    .line 162
    .line 163
    if-eqz p2, :cond_a

    .line 164
    .line 165
    move p1, v0

    .line 166
    :cond_a
    iput p1, p0, Ll/f5z0;->e:I

    .line 167
    .line 168
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f5z0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final bridge synthetic b(Ll/h5z0;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/f5z0;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0
.end method

.method public final bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/f5z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f5z0;->f(Ll/f5z0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final f(Ll/f5z0;)I
    .locals 4

    .line 1
    invoke-static {}, Ll/gqw0;->j()Ll/gqw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Ll/f5z0;->f:Z

    .line 6
    .line 7
    iget-boolean v2, p1, Ll/f5z0;->f:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Ll/f5z0;->i:I

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v2, p1, Ll/f5z0;->i:I

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {}, Lcom/google/android/gms/internal/ads/c3;->zzc()Lcom/google/android/gms/internal/ads/c3;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/c3;->zza()Lcom/google/android/gms/internal/ads/c3;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0, v1, v2, v3}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget v1, p0, Ll/f5z0;->j:I

    .line 38
    .line 39
    iget v2, p1, Ll/f5z0;->j:I

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget v1, p0, Ll/f5z0;->k:I

    .line 46
    .line 47
    iget v2, p1, Ll/f5z0;->k:I

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-boolean v1, p0, Ll/f5z0;->g:Z

    .line 54
    .line 55
    iget-boolean v2, p1, Ll/f5z0;->g:Z

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-boolean v1, p0, Ll/f5z0;->h:Z

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-boolean v2, p1, Ll/f5z0;->h:Z

    .line 68
    .line 69
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget v3, p0, Ll/f5z0;->j:I

    .line 74
    .line 75
    if-nez v3, :cond_0

    .line 76
    .line 77
    invoke-static {}, Lcom/google/android/gms/internal/ads/c3;->zzc()Lcom/google/android/gms/internal/ads/c3;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ads/c3;->zzc()Lcom/google/android/gms/internal/ads/c3;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/c3;->zza()Lcom/google/android/gms/internal/ads/c3;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    :goto_0
    invoke-virtual {v0, v1, v2, v3}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget v1, p0, Ll/f5z0;->l:I

    .line 95
    .line 96
    iget v2, p1, Ll/f5z0;->l:I

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget v1, p0, Ll/f5z0;->k:I

    .line 103
    .line 104
    if-nez v1, :cond_1

    .line 105
    .line 106
    iget-boolean p0, p0, Ll/f5z0;->m:Z

    .line 107
    .line 108
    iget-boolean p1, p1, Ll/f5z0;->m:Z

    .line 109
    .line 110
    invoke-virtual {v0, p0, p1}, Ll/gqw0;->f(ZZ)Ll/gqw0;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    :cond_1
    invoke-virtual {v0}, Ll/gqw0;->a()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    return p0
.end method
