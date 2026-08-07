.class public final Ll/l5z0;
.super Ll/q5z0;
.source "SourceFile"

# interfaces
.implements Ll/yey0;


# static fields
.field public static final k:Lcom/google/android/gms/internal/ads/c3;

.field public static final l:Lcom/google/android/gms/internal/ads/c3;


# instance fields
.field public final d:Ljava/lang/Object;

.field public final e:Landroid/content/Context;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:Z

.field public g:Ll/h4z0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field public h:Ll/m4z0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/w3y0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field public final j:Ll/v2z0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/p3z0;->a:Ll/p3z0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/c3;->zzb(Ljava/util/Comparator;)Lcom/google/android/gms/internal/ads/c3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/l5z0;->k:Lcom/google/android/gms/internal/ads/c3;

    .line 8
    .line 9
    sget-object v0, Ll/r3z0;->a:Ll/r3z0;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/c3;->zzb(Ljava/util/Comparator;)Lcom/google/android/gms/internal/ads/c3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/l5z0;->l:Lcom/google/android/gms/internal/ads/c3;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Ll/v2z0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/v2z0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/h4z0;->d(Landroid/content/Context;)Ll/h4z0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p0}, Ll/q5z0;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v2, 0x0

    .line 28
    :goto_0
    iput-object v2, p0, Ll/l5z0;->e:Landroid/content/Context;

    .line 29
    .line 30
    iput-object v0, p0, Ll/l5z0;->j:Ll/v2z0;

    .line 31
    .line 32
    iput-object v1, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 33
    .line 34
    sget-object v0, Ll/w3y0;->b:Ll/w3y0;

    .line 35
    .line 36
    iput-object v0, p0, Ll/l5z0;->i:Ll/w3y0;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-static {p1}, Ll/mpw0;->j(Landroid/content/Context;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    :cond_1
    iput-boolean v0, p0, Ll/l5z0;->f:Z

    .line 49
    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    sget v0, Ll/mpw0;->a:I

    .line 55
    .line 56
    const/16 v1, 0x20

    .line 57
    .line 58
    if-lt v0, v1, :cond_2

    .line 59
    .line 60
    invoke-static {p1}, Ll/m4z0;->a(Landroid/content/Context;)Ll/m4z0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 65
    .line 66
    :cond_2
    iget-object p0, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 67
    .line 68
    iget-boolean p0, p0, Ll/h4z0;->u0:Z

    .line 69
    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    if-nez p1, :cond_3

    .line 73
    .line 74
    const-string p0, "DefaultTrackSelector"

    .line 75
    .line 76
    const-string p1, "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument."

    .line 77
    .line 78
    invoke-static {p0, p1}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method

.method public static bridge synthetic k(II)I
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const p0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    and-int/2addr p0, p1

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static l(Ll/sqr0;Ljava/lang/String;Z)I
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/sqr0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x4

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    invoke-static {p1}, Ll/l5z0;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/sqr0;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0}, Ll/l5z0;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x0

    .line 29
    if-eqz p0, :cond_6

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_5

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_3

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    sget p2, Ll/mpw0;->a:I

    .line 48
    .line 49
    const-string p2, "-"

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    invoke-virtual {p0, p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    aget-object p0, p0, v0

    .line 57
    .line 58
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    aget-object p1, p1, v0

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    return v1

    .line 71
    :cond_4
    return v0

    .line 72
    :cond_5
    :goto_1
    const/4 p0, 0x3

    .line 73
    return p0

    .line 74
    :cond_6
    :goto_2
    if-eqz p2, :cond_7

    .line 75
    .line 76
    if-nez p0, :cond_7

    .line 77
    .line 78
    const/4 p0, 0x1

    .line 79
    return p0

    .line 80
    :cond_7
    return v0
.end method

.method public static bridge synthetic n()Lcom/google/android/gms/internal/ads/c3;
    .locals 1

    .line 1
    sget-object v0, Ll/l5z0;->k:Lcom/google/android/gms/internal/ads/c3;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic o()Lcom/google/android/gms/internal/ads/c3;
    .locals 1

    .line 1
    sget-object v0, Ll/l5z0;->l:Lcom/google/android/gms/internal/ads/c3;

    .line 2
    .line 3
    return-object v0
.end method

.method public static p(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "und"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public static bridge synthetic q(Ll/l5z0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l5z0;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ll/l5z0;Ll/sqr0;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 5
    .line 6
    iget-boolean v1, v1, Ll/h4z0;->u0:Z

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/l5z0;->f:Z

    .line 12
    .line 13
    if-nez v1, :cond_3

    .line 14
    .line 15
    iget v1, p1, Ll/sqr0;->y:I

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    if-le v1, v3, :cond_3

    .line 19
    .line 20
    iget-object v1, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 21
    .line 22
    const/16 v3, 0x20

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    sparse-switch v4, :sswitch_data_0

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :sswitch_0
    const-string v4, "audio/eac3"

    .line 36
    .line 37
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :sswitch_1
    const-string v4, "audio/ac4"

    .line 45
    .line 46
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_2
    const-string v4, "audio/ac3"

    .line 54
    .line 55
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :sswitch_3
    const-string v4, "audio/eac3-joc"

    .line 63
    .line 64
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    :goto_0
    :try_start_1
    sget v1, Ll/mpw0;->a:I

    .line 71
    .line 72
    if-lt v1, v3, :cond_3

    .line 73
    .line 74
    iget-object v1, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    invoke-virtual {v1}, Ll/m4z0;->g()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :catchall_0
    move-exception p0

    .line 86
    goto :goto_3

    .line 87
    :cond_1
    :goto_1
    sget v1, Ll/mpw0;->a:I

    .line 88
    .line 89
    const/4 v4, 0x0

    .line 90
    if-lt v1, v3, :cond_2

    .line 91
    .line 92
    iget-object v1, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 93
    .line 94
    if-eqz v1, :cond_2

    .line 95
    .line 96
    invoke-virtual {v1}, Ll/m4z0;->g()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_2

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/m4z0;->e()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_2

    .line 107
    .line 108
    iget-object v1, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 109
    .line 110
    invoke-virtual {v1}, Ll/m4z0;->f()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_2

    .line 115
    .line 116
    iget-object v1, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 117
    .line 118
    iget-object p0, p0, Ll/l5z0;->i:Ll/w3y0;

    .line 119
    .line 120
    invoke-virtual {v1, p0, p1}, Ll/m4z0;->d(Ll/w3y0;Ll/sqr0;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_2

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_2
    move v2, v4

    .line 128
    :cond_3
    :goto_2
    monitor-exit v0

    .line 129
    return v2

    .line 130
    :goto_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    throw p0

    .line 132
    nop

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x7e929daa -> :sswitch_3
        0xb269698 -> :sswitch_2
        0xb269699 -> :sswitch_1
        0x59ae0c65 -> :sswitch_0
    .end sparse-switch
.end method

.method public static t(IZ)Z
    .locals 2

    .line 1
    and-int/lit8 p0, p0, 0x7

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x3

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    return v0

    .line 15
    :cond_1
    return v1
.end method

.method public static u(Ll/q2z0;Ll/scu0;Ljava/util/Map;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    :goto_0
    iget v0, p0, Ll/q2z0;->a:I

    .line 3
    .line 4
    if-ge p2, v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p1, Ll/scu0;->A:Lcom/google/android/gms/internal/ads/zzgad;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/ads/zzgad;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/m6u0;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    add-int/lit8 p2, p2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    throw p0

    .line 25
    :cond_1
    return-void
.end method

.method public static final w(ILl/p5z0;[[[ILl/g5z0;Ljava/util/Comparator;)Landroid/util/Pair;
    .locals 18
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    :goto_0
    const/4 v4, 0x2

    .line 10
    if-ge v3, v4, :cond_7

    .line 11
    .line 12
    invoke-virtual {v0, v3}, Ll/p5z0;->c(I)I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    move/from16 v6, p0

    .line 17
    .line 18
    if-ne v6, v5, :cond_6

    .line 19
    .line 20
    invoke-virtual {v0, v3}, Ll/p5z0;->d(I)Ll/q2z0;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    const/4 v7, 0x0

    .line 25
    :goto_1
    iget v8, v5, Ll/q2z0;->a:I

    .line 26
    .line 27
    if-ge v7, v8, :cond_6

    .line 28
    .line 29
    invoke-virtual {v5, v7}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    aget-object v9, p2, v3

    .line 34
    .line 35
    aget-object v9, v9, v7

    .line 36
    .line 37
    move-object/from16 v10, p3

    .line 38
    .line 39
    invoke-interface {v10, v3, v8, v9}, Ll/g5z0;->a(ILl/t2u0;[I)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v9

    .line 43
    iget v8, v8, Ll/t2u0;->a:I

    .line 44
    .line 45
    const/4 v8, 0x1

    .line 46
    new-array v11, v8, [Z

    .line 47
    .line 48
    const/4 v12, 0x0

    .line 49
    :goto_2
    if-gtz v12, :cond_5

    .line 50
    .line 51
    add-int/lit8 v13, v12, 0x1

    .line 52
    .line 53
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v14

    .line 57
    check-cast v14, Ll/h5z0;

    .line 58
    .line 59
    invoke-virtual {v14}, Ll/h5z0;->a()I

    .line 60
    .line 61
    .line 62
    move-result v15

    .line 63
    aget-boolean v12, v11, v12

    .line 64
    .line 65
    if-nez v12, :cond_0

    .line 66
    .line 67
    if-nez v15, :cond_1

    .line 68
    .line 69
    :cond_0
    move/from16 v17, v8

    .line 70
    .line 71
    goto :goto_5

    .line 72
    :cond_1
    if-ne v15, v8, :cond_3

    .line 73
    .line 74
    invoke-static {v14}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 75
    .line 76
    .line 77
    move-result-object v12

    .line 78
    :cond_2
    move/from16 v17, v8

    .line 79
    .line 80
    goto :goto_4

    .line 81
    :cond_3
    new-instance v12, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-interface {v12, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move v15, v13

    .line 90
    :goto_3
    if-gtz v15, :cond_2

    .line 91
    .line 92
    invoke-interface {v9, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v16

    .line 96
    move/from16 v17, v8

    .line 97
    .line 98
    move-object/from16 v8, v16

    .line 99
    .line 100
    check-cast v8, Ll/h5z0;

    .line 101
    .line 102
    invoke-virtual {v8}, Ll/h5z0;->a()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-ne v2, v4, :cond_4

    .line 107
    .line 108
    invoke-virtual {v14, v8}, Ll/h5z0;->b(Ll/h5z0;)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_4

    .line 113
    .line 114
    invoke-interface {v12, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    aput-boolean v17, v11, v15

    .line 118
    .line 119
    :cond_4
    add-int/lit8 v15, v15, 0x1

    .line 120
    .line 121
    move/from16 v8, v17

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :goto_4
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    :goto_5
    move v12, v13

    .line 128
    move/from16 v8, v17

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_5
    add-int/lit8 v7, v7, 0x1

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_6
    move-object/from16 v10, p3

    .line 135
    .line 136
    add-int/lit8 v3, v3, 0x1

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_7
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_8

    .line 145
    .line 146
    const/4 v0, 0x0

    .line 147
    return-object v0

    .line 148
    :cond_8
    move-object/from16 v0, p4

    .line 149
    .line 150
    invoke-static {v1, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    new-array v1, v1, [I

    .line 161
    .line 162
    const/4 v2, 0x0

    .line 163
    :goto_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    if-ge v2, v3, :cond_9

    .line 168
    .line 169
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    check-cast v3, Ll/h5z0;

    .line 174
    .line 175
    iget v3, v3, Ll/h5z0;->c:I

    .line 176
    .line 177
    aput v3, v1, v2

    .line 178
    .line 179
    add-int/lit8 v2, v2, 0x1

    .line 180
    .line 181
    goto :goto_6

    .line 182
    :cond_9
    const/4 v2, 0x0

    .line 183
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Ll/h5z0;

    .line 188
    .line 189
    new-instance v3, Ll/m5z0;

    .line 190
    .line 191
    iget-object v4, v0, Ll/h5z0;->b:Ll/t2u0;

    .line 192
    .line 193
    invoke-direct {v3, v4, v1, v2}, Ll/m5z0;-><init>(Ll/t2u0;[II)V

    .line 194
    .line 195
    .line 196
    iget v0, v0, Ll/h5z0;->a:I

    .line 197
    .line 198
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {v3, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    return-object v0
.end method


# virtual methods
.method public final a()Ll/yey0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    return-object p0
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget v1, Ll/mpw0;->a:I

    .line 5
    .line 6
    const/16 v2, 0x20

    .line 7
    .line 8
    if-lt v1, v2, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/m4z0;->c()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    invoke-super {p0}, Ll/t5z0;->b()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p0
.end method

.method public final c(Ll/w3y0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/l5z0;->i:Ll/w3y0;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ll/w3y0;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput-object p1, p0, Ll/l5z0;->i:Ll/w3y0;

    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/l5z0;->v()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final j(Ll/p5z0;[[[I[ILl/kzy0;Ll/d0u0;)Landroid/util/Pair;
    .locals 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget-object v4, v0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v4

    .line 12
    :try_start_0
    iget-object v5, v0, Ll/l5z0;->g:Ll/h4z0;

    .line 13
    .line 14
    iget-boolean v6, v5, Ll/h4z0;->u0:Z

    .line 15
    .line 16
    if-eqz v6, :cond_0

    .line 17
    .line 18
    sget v6, Ll/mpw0;->a:I

    .line 19
    .line 20
    const/16 v7, 0x20

    .line 21
    .line 22
    if-lt v6, v7, :cond_0

    .line 23
    .line 24
    iget-object v6, v0, Ll/l5z0;->h:Ll/m4z0;

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    invoke-static {v7}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v6, v0, v7}, Ll/m4z0;->b(Ll/l5z0;Landroid/os/Looper;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    goto/16 :goto_15

    .line 41
    .line 42
    :cond_0
    :goto_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    const/4 v4, 0x2

    .line 44
    new-array v6, v4, [Ll/m5z0;

    .line 45
    .line 46
    new-instance v7, Ll/x3z0;

    .line 47
    .line 48
    invoke-direct {v7, v5, v3}, Ll/x3z0;-><init>(Ll/h4z0;[I)V

    .line 49
    .line 50
    .line 51
    sget-object v8, Ll/y3z0;->a:Ll/y3z0;

    .line 52
    .line 53
    invoke-static {v4, v1, v2, v7, v8}, Ll/l5z0;->w(ILl/p5z0;[[[ILl/g5z0;Ljava/util/Comparator;)Landroid/util/Pair;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    const/4 v8, 0x4

    .line 58
    if-nez v7, :cond_1

    .line 59
    .line 60
    new-instance v10, Ll/s3z0;

    .line 61
    .line 62
    invoke-direct {v10, v5}, Ll/s3z0;-><init>(Ll/h4z0;)V

    .line 63
    .line 64
    .line 65
    sget-object v11, Ll/t3z0;->a:Ll/t3z0;

    .line 66
    .line 67
    invoke-static {v8, v1, v2, v10, v11}, Ll/l5z0;->w(ILl/p5z0;[[[ILl/g5z0;Ljava/util/Comparator;)Landroid/util/Pair;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    const/4 v10, 0x0

    .line 73
    :goto_1
    const/4 v11, 0x0

    .line 74
    if-eqz v10, :cond_3

    .line 75
    .line 76
    iget-object v7, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v7, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    iget-object v10, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v10, Ll/m5z0;

    .line 87
    .line 88
    aput-object v10, v6, v7

    .line 89
    .line 90
    :cond_2
    :goto_2
    move v7, v11

    .line 91
    goto :goto_3

    .line 92
    :cond_3
    if-eqz v7, :cond_2

    .line 93
    .line 94
    iget-object v10, v7, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v10, Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result v10

    .line 102
    iget-object v7, v7, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v7, Ll/m5z0;

    .line 105
    .line 106
    aput-object v7, v6, v10

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :goto_3
    const/4 v10, 0x1

    .line 110
    if-ge v7, v4, :cond_5

    .line 111
    .line 112
    invoke-virtual {v1, v7}, Ll/p5z0;->c(I)I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    if-ne v12, v4, :cond_4

    .line 117
    .line 118
    invoke-virtual {v1, v7}, Ll/p5z0;->d(I)Ll/q2z0;

    .line 119
    .line 120
    .line 121
    move-result-object v12

    .line 122
    iget v12, v12, Ll/q2z0;->a:I

    .line 123
    .line 124
    if-lez v12, :cond_4

    .line 125
    .line 126
    move v7, v10

    .line 127
    goto :goto_4

    .line 128
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_5
    move v7, v11

    .line 132
    :goto_4
    new-instance v12, Ll/v3z0;

    .line 133
    .line 134
    invoke-direct {v12, v0, v5, v7, v3}, Ll/v3z0;-><init>(Ll/l5z0;Ll/h4z0;Z[I)V

    .line 135
    .line 136
    .line 137
    sget-object v3, Ll/w3z0;->a:Ll/w3z0;

    .line 138
    .line 139
    invoke-static {v10, v1, v2, v12, v3}, Ll/l5z0;->w(ILl/p5z0;[[[ILl/g5z0;Ljava/util/Comparator;)Landroid/util/Pair;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    if-eqz v3, :cond_6

    .line 144
    .line 145
    iget-object v7, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v7, Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v7

    .line 153
    iget-object v12, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v12, Ll/m5z0;

    .line 156
    .line 157
    aput-object v12, v6, v7

    .line 158
    .line 159
    :cond_6
    if-nez v3, :cond_7

    .line 160
    .line 161
    const/4 v3, 0x0

    .line 162
    goto :goto_5

    .line 163
    :cond_7
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 164
    .line 165
    move-object v7, v3

    .line 166
    check-cast v7, Ll/m5z0;

    .line 167
    .line 168
    iget-object v7, v7, Ll/m5z0;->a:Ll/t2u0;

    .line 169
    .line 170
    check-cast v3, Ll/m5z0;

    .line 171
    .line 172
    iget-object v3, v3, Ll/m5z0;->b:[I

    .line 173
    .line 174
    aget v3, v3, v11

    .line 175
    .line 176
    invoke-virtual {v7, v3}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    iget-object v3, v3, Ll/sqr0;->c:Ljava/lang/String;

    .line 181
    .line 182
    :goto_5
    new-instance v7, Ll/z3z0;

    .line 183
    .line 184
    invoke-direct {v7, v5, v3}, Ll/z3z0;-><init>(Ll/h4z0;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object v3, Ll/q3z0;->a:Ll/q3z0;

    .line 188
    .line 189
    const/4 v12, 0x3

    .line 190
    invoke-static {v12, v1, v2, v7, v3}, Ll/l5z0;->w(ILl/p5z0;[[[ILl/g5z0;Ljava/util/Comparator;)Landroid/util/Pair;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    if-eqz v3, :cond_8

    .line 195
    .line 196
    iget-object v7, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v7, Ljava/lang/Integer;

    .line 199
    .line 200
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 205
    .line 206
    check-cast v3, Ll/m5z0;

    .line 207
    .line 208
    aput-object v3, v6, v7

    .line 209
    .line 210
    :cond_8
    move v3, v11

    .line 211
    :goto_6
    if-ge v3, v4, :cond_f

    .line 212
    .line 213
    invoke-virtual {v1, v3}, Ll/p5z0;->c(I)I

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    if-eq v7, v4, :cond_e

    .line 218
    .line 219
    if-eq v7, v10, :cond_e

    .line 220
    .line 221
    if-eq v7, v12, :cond_e

    .line 222
    .line 223
    if-eq v7, v8, :cond_e

    .line 224
    .line 225
    invoke-virtual {v1, v3}, Ll/p5z0;->d(I)Ll/q2z0;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    aget-object v13, v2, v3

    .line 230
    .line 231
    move v14, v11

    .line 232
    const/4 v15, 0x0

    .line 233
    const/16 v16, 0x0

    .line 234
    .line 235
    :goto_7
    iget v8, v7, Ll/q2z0;->a:I

    .line 236
    .line 237
    if-ge v14, v8, :cond_c

    .line 238
    .line 239
    invoke-virtual {v7, v14}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 240
    .line 241
    .line 242
    move-result-object v8

    .line 243
    aget-object v17, v13, v14

    .line 244
    .line 245
    move-object/from16 v9, v16

    .line 246
    .line 247
    const/16 p5, 0x0

    .line 248
    .line 249
    move/from16 v16, v11

    .line 250
    .line 251
    :goto_8
    iget v12, v8, Ll/t2u0;->a:I

    .line 252
    .line 253
    if-gtz v16, :cond_b

    .line 254
    .line 255
    aget v12, v17, v11

    .line 256
    .line 257
    iget-boolean v10, v5, Ll/h4z0;->v0:Z

    .line 258
    .line 259
    invoke-static {v12, v10}, Ll/l5z0;->t(IZ)Z

    .line 260
    .line 261
    .line 262
    move-result v10

    .line 263
    if-eqz v10, :cond_a

    .line 264
    .line 265
    invoke-virtual {v8, v11}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 266
    .line 267
    .line 268
    move-result-object v10

    .line 269
    new-instance v12, Ll/c4z0;

    .line 270
    .line 271
    aget v4, v17, v11

    .line 272
    .line 273
    invoke-direct {v12, v10, v4}, Ll/c4z0;-><init>(Ll/sqr0;I)V

    .line 274
    .line 275
    .line 276
    if-eqz v9, :cond_9

    .line 277
    .line 278
    invoke-virtual {v12, v9}, Ll/c4z0;->a(Ll/c4z0;)I

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    if-lez v4, :cond_a

    .line 283
    .line 284
    :cond_9
    move-object v15, v8

    .line 285
    move-object v9, v12

    .line 286
    :cond_a
    const/4 v4, 0x2

    .line 287
    const/4 v10, 0x1

    .line 288
    const/16 v16, 0x1

    .line 289
    .line 290
    goto :goto_8

    .line 291
    :cond_b
    add-int/lit8 v14, v14, 0x1

    .line 292
    .line 293
    move-object/from16 v16, v9

    .line 294
    .line 295
    const/4 v4, 0x2

    .line 296
    const/4 v10, 0x1

    .line 297
    const/4 v12, 0x3

    .line 298
    goto :goto_7

    .line 299
    :cond_c
    const/16 p5, 0x0

    .line 300
    .line 301
    if-nez v15, :cond_d

    .line 302
    .line 303
    move-object/from16 v4, p5

    .line 304
    .line 305
    goto :goto_9

    .line 306
    :cond_d
    new-instance v4, Ll/m5z0;

    .line 307
    .line 308
    filled-new-array {v11}, [I

    .line 309
    .line 310
    .line 311
    move-result-object v7

    .line 312
    invoke-direct {v4, v15, v7, v11}, Ll/m5z0;-><init>(Ll/t2u0;[II)V

    .line 313
    .line 314
    .line 315
    :goto_9
    aput-object v4, v6, v3

    .line 316
    .line 317
    goto :goto_a

    .line 318
    :cond_e
    const/16 p5, 0x0

    .line 319
    .line 320
    :goto_a
    add-int/lit8 v3, v3, 0x1

    .line 321
    .line 322
    const/4 v4, 0x2

    .line 323
    const/4 v8, 0x4

    .line 324
    const/4 v10, 0x1

    .line 325
    const/4 v12, 0x3

    .line 326
    goto :goto_6

    .line 327
    :cond_f
    const/16 p5, 0x0

    .line 328
    .line 329
    new-instance v2, Ljava/util/HashMap;

    .line 330
    .line 331
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 332
    .line 333
    .line 334
    move v3, v11

    .line 335
    const/4 v4, 0x2

    .line 336
    :goto_b
    if-ge v3, v4, :cond_10

    .line 337
    .line 338
    invoke-virtual {v1, v3}, Ll/p5z0;->d(I)Ll/q2z0;

    .line 339
    .line 340
    .line 341
    move-result-object v7

    .line 342
    invoke-static {v7, v5, v2}, Ll/l5z0;->u(Ll/q2z0;Ll/scu0;Ljava/util/Map;)V

    .line 343
    .line 344
    .line 345
    add-int/lit8 v3, v3, 0x1

    .line 346
    .line 347
    goto :goto_b

    .line 348
    :cond_10
    invoke-virtual {v1}, Ll/p5z0;->e()Ll/q2z0;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    invoke-static {v3, v5, v2}, Ll/l5z0;->u(Ll/q2z0;Ll/scu0;Ljava/util/Map;)V

    .line 353
    .line 354
    .line 355
    move v3, v11

    .line 356
    :goto_c
    if-ge v3, v4, :cond_12

    .line 357
    .line 358
    invoke-virtual {v1, v3}, Ll/p5z0;->c(I)I

    .line 359
    .line 360
    .line 361
    move-result v7

    .line 362
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 363
    .line 364
    .line 365
    move-result-object v7

    .line 366
    invoke-virtual {v2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v7

    .line 370
    check-cast v7, Ll/m6u0;

    .line 371
    .line 372
    if-nez v7, :cond_11

    .line 373
    .line 374
    add-int/lit8 v3, v3, 0x1

    .line 375
    .line 376
    goto :goto_c

    .line 377
    :cond_11
    throw p5

    .line 378
    :cond_12
    move v2, v11

    .line 379
    :goto_d
    if-ge v2, v4, :cond_15

    .line 380
    .line 381
    invoke-virtual {v1, v2}, Ll/p5z0;->d(I)Ll/q2z0;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    invoke-virtual {v5, v2, v3}, Ll/h4z0;->g(ILl/q2z0;)Z

    .line 386
    .line 387
    .line 388
    move-result v4

    .line 389
    if-nez v4, :cond_13

    .line 390
    .line 391
    goto :goto_e

    .line 392
    :cond_13
    invoke-virtual {v5, v2, v3}, Ll/h4z0;->e(ILl/q2z0;)Ll/j4z0;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    if-nez v3, :cond_14

    .line 397
    .line 398
    aput-object p5, v6, v2

    .line 399
    .line 400
    :goto_e
    add-int/lit8 v2, v2, 0x1

    .line 401
    .line 402
    const/4 v4, 0x2

    .line 403
    goto :goto_d

    .line 404
    :cond_14
    throw p5

    .line 405
    :cond_15
    move v2, v11

    .line 406
    :goto_f
    if-ge v2, v4, :cond_18

    .line 407
    .line 408
    invoke-virtual {v1, v2}, Ll/p5z0;->c(I)I

    .line 409
    .line 410
    .line 411
    move-result v3

    .line 412
    invoke-virtual {v5, v2}, Ll/h4z0;->f(I)Z

    .line 413
    .line 414
    .line 415
    move-result v4

    .line 416
    if-nez v4, :cond_16

    .line 417
    .line 418
    iget-object v4, v5, Ll/scu0;->B:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 419
    .line 420
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    invoke-virtual {v4, v3}, Lcom/google/android/gms/internal/ads/zzfzv;->contains(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result v3

    .line 428
    if-eqz v3, :cond_17

    .line 429
    .line 430
    :cond_16
    aput-object p5, v6, v2

    .line 431
    .line 432
    :cond_17
    add-int/lit8 v2, v2, 0x1

    .line 433
    .line 434
    const/4 v4, 0x2

    .line 435
    goto :goto_f

    .line 436
    :cond_18
    iget-object v2, v0, Ll/l5z0;->j:Ll/v2z0;

    .line 437
    .line 438
    invoke-virtual {v0}, Ll/t5z0;->g()Ll/b6z0;

    .line 439
    .line 440
    .line 441
    move-result-object v22

    .line 442
    invoke-static {v6}, Ll/w2z0;->a([Ll/m5z0;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    const/4 v4, 0x2

    .line 447
    new-array v3, v4, [Ll/n5z0;

    .line 448
    .line 449
    move v7, v11

    .line 450
    :goto_10
    if-ge v7, v4, :cond_1c

    .line 451
    .line 452
    aget-object v4, v6, v7

    .line 453
    .line 454
    if-eqz v4, :cond_19

    .line 455
    .line 456
    iget-object v8, v4, Ll/m5z0;->b:[I

    .line 457
    .line 458
    array-length v9, v8

    .line 459
    if-nez v9, :cond_1a

    .line 460
    .line 461
    :cond_19
    move-object/from16 v18, v2

    .line 462
    .line 463
    const/4 v10, 0x1

    .line 464
    goto :goto_12

    .line 465
    :cond_1a
    iget-object v4, v4, Ll/m5z0;->a:Ll/t2u0;

    .line 466
    .line 467
    const/4 v10, 0x1

    .line 468
    if-ne v9, v10, :cond_1b

    .line 469
    .line 470
    new-instance v23, Ll/o5z0;

    .line 471
    .line 472
    aget v25, v8, v11

    .line 473
    .line 474
    const/16 v27, 0x0

    .line 475
    .line 476
    const/16 v28, 0x0

    .line 477
    .line 478
    const/16 v26, 0x0

    .line 479
    .line 480
    move-object/from16 v24, v4

    .line 481
    .line 482
    invoke-direct/range {v23 .. v28}, Ll/o5z0;-><init>(Ll/t2u0;IIILjava/lang/Object;)V

    .line 483
    .line 484
    .line 485
    move-object/from16 v18, v2

    .line 486
    .line 487
    goto :goto_11

    .line 488
    :cond_1b
    move-object/from16 v19, v4

    .line 489
    .line 490
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v4

    .line 494
    move-object/from16 v23, v4

    .line 495
    .line 496
    check-cast v23, Lcom/google/android/gms/internal/ads/zzgaa;

    .line 497
    .line 498
    const/16 v21, 0x0

    .line 499
    .line 500
    move-object/from16 v18, v2

    .line 501
    .line 502
    move-object/from16 v20, v8

    .line 503
    .line 504
    invoke-virtual/range {v18 .. v23}, Ll/v2z0;->a(Ll/t2u0;[IILl/b6z0;Lcom/google/android/gms/internal/ads/zzgaa;)Ll/w2z0;

    .line 505
    .line 506
    .line 507
    move-result-object v23

    .line 508
    :goto_11
    aput-object v23, v3, v7

    .line 509
    .line 510
    :goto_12
    add-int/lit8 v7, v7, 0x1

    .line 511
    .line 512
    move-object/from16 v2, v18

    .line 513
    .line 514
    const/4 v4, 0x2

    .line 515
    goto :goto_10

    .line 516
    :cond_1c
    new-array v0, v4, [Ll/dfy0;

    .line 517
    .line 518
    :goto_13
    if-ge v11, v4, :cond_20

    .line 519
    .line 520
    invoke-virtual {v1, v11}, Ll/p5z0;->c(I)I

    .line 521
    .line 522
    .line 523
    move-result v2

    .line 524
    invoke-virtual {v5, v11}, Ll/h4z0;->f(I)Z

    .line 525
    .line 526
    .line 527
    move-result v6

    .line 528
    if-nez v6, :cond_1d

    .line 529
    .line 530
    iget-object v6, v5, Ll/scu0;->B:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 531
    .line 532
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 533
    .line 534
    .line 535
    move-result-object v2

    .line 536
    invoke-virtual {v6, v2}, Lcom/google/android/gms/internal/ads/zzfzv;->contains(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    move-result v2

    .line 540
    if-eqz v2, :cond_1e

    .line 541
    .line 542
    :cond_1d
    move-object/from16 v2, p5

    .line 543
    .line 544
    goto :goto_14

    .line 545
    :cond_1e
    invoke-virtual {v1, v11}, Ll/p5z0;->c(I)I

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    const/4 v6, -0x2

    .line 550
    if-eq v2, v6, :cond_1f

    .line 551
    .line 552
    aget-object v2, v3, v11

    .line 553
    .line 554
    if-eqz v2, :cond_1d

    .line 555
    .line 556
    :cond_1f
    sget-object v2, Ll/dfy0;->b:Ll/dfy0;

    .line 557
    .line 558
    :goto_14
    aput-object v2, v0, v11

    .line 559
    .line 560
    add-int/lit8 v11, v11, 0x1

    .line 561
    .line 562
    goto :goto_13

    .line 563
    :cond_20
    invoke-static {v0, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    return-object v0

    .line 568
    :goto_15
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 569
    throw v0
.end method

.method public final m()Ll/h4z0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final r(Ll/f4z0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/h4z0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, Ll/h4z0;-><init>(Ll/f4z0;Ll/g4z0;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter p1

    .line 10
    :try_start_0
    iget-object v1, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ll/scu0;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput-object v0, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 17
    .line 18
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-boolean p1, v0, Ll/h4z0;->u0:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/l5z0;->e:Landroid/content/Context;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const-string p1, "DefaultTrackSelector"

    .line 30
    .line 31
    const-string v0, "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument."

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/t5z0;->i()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p0
.end method

.method public final v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l5z0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/l5z0;->g:Ll/h4z0;

    .line 5
    .line 6
    iget-boolean v1, v1, Ll/h4z0;->u0:Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/l5z0;->f:Z

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    sget v1, Ll/mpw0;->a:I

    .line 16
    .line 17
    const/16 v3, 0x20

    .line 18
    .line 19
    if-lt v1, v3, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ll/l5z0;->h:Ll/m4z0;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/m4z0;->g()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/t5z0;->i()V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void

    .line 42
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p0
.end method
