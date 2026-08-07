.class public final Ll/i7x0;
.super Ll/m8x0;
.source "SourceFile"


# instance fields
.field public final e:Landroid/content/res/AssetManager;

.field public f:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ljava/io/InputStream;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:J

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/m8x0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/i7x0;->e:Landroid/content/res/AssetManager;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzgo;
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-wide v0, p0, Ll/i7x0;->h:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    const/4 v3, -0x1

    .line 12
    if-eqz v2, :cond_4

    .line 13
    .line 14
    const-wide/16 v4, -0x1

    .line 15
    .line 16
    cmp-long v2, v0, v4

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    int-to-long v6, p3

    .line 21
    :try_start_0
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    long-to-int p3, v0

    .line 26
    :cond_1
    iget-object v0, p0, Ll/i7x0;->g:Ljava/io/InputStream;

    .line 27
    .line 28
    sget v1, Ll/mpw0;->a:I

    .line 29
    .line 30
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    if-ne p1, v3, :cond_2

    .line 35
    .line 36
    return v3

    .line 37
    :cond_2
    iget-wide p2, p0, Ll/i7x0;->h:J

    .line 38
    .line 39
    cmp-long v0, p2, v4

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    int-to-long v0, p1

    .line 44
    sub-long/2addr p2, v0

    .line 45
    iput-wide p2, p0, Ll/i7x0;->h:J

    .line 46
    .line 47
    :cond_3
    invoke-virtual {p0, p1}, Ll/m8x0;->zzg(I)V

    .line 48
    .line 49
    .line 50
    return p1

    .line 51
    :catch_0
    move-exception p0

    .line 52
    new-instance p1, Lcom/google/android/gms/internal/ads/zzgo;

    .line 53
    .line 54
    const/16 p2, 0x7d0

    .line 55
    .line 56
    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/internal/ads/zzgo;-><init>(Ljava/lang/Throwable;I)V

    .line 57
    .line 58
    .line 59
    throw p1

    .line 60
    :cond_4
    return v3
.end method

.method public final e(Ll/akx0;)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzgo;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 3
    .line 4
    iput-object v1, p0, Ll/i7x0;->f:Landroid/net/Uri;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_5

    .line 12
    .line 13
    const-string v3, "/android_asset/"

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    const/16 v3, 0xf

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception p0

    .line 29
    goto :goto_2

    .line 30
    :cond_0
    const-string v3, "/"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ll/m8x0;->k(Ll/akx0;)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Ll/i7x0;->e:Landroid/content/res/AssetManager;

    .line 46
    .line 47
    invoke-virtual {v3, v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p0, Ll/i7x0;->g:Ljava/io/InputStream;

    .line 52
    .line 53
    iget-wide v3, p1, Ll/akx0;->f:J

    .line 54
    .line 55
    invoke-virtual {v1, v3, v4}, Ljava/io/InputStream;->skip(J)J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    iget-wide v5, p1, Ll/akx0;->f:J

    .line 60
    .line 61
    cmp-long v1, v3, v5

    .line 62
    .line 63
    if-ltz v1, :cond_4

    .line 64
    .line 65
    iget-wide v1, p1, Ll/akx0;->g:J

    .line 66
    .line 67
    const-wide/16 v3, -0x1

    .line 68
    .line 69
    cmp-long v5, v1, v3

    .line 70
    .line 71
    if-eqz v5, :cond_2

    .line 72
    .line 73
    iput-wide v1, p0, Ll/i7x0;->h:J

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    iget-object v1, p0, Ll/i7x0;->g:Ljava/io/InputStream;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    int-to-long v1, v1

    .line 83
    iput-wide v1, p0, Ll/i7x0;->h:J

    .line 84
    .line 85
    const-wide/32 v5, 0x7fffffff

    .line 86
    .line 87
    .line 88
    cmp-long v1, v1, v5

    .line 89
    .line 90
    if-nez v1, :cond_3

    .line 91
    .line 92
    iput-wide v3, p0, Ll/i7x0;->h:J
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzgo; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    :cond_3
    :goto_1
    iput-boolean v0, p0, Ll/i7x0;->i:Z

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 97
    .line 98
    .line 99
    iget-wide p0, p0, Ll/i7x0;->h:J

    .line 100
    .line 101
    return-wide p0

    .line 102
    :cond_4
    :try_start_1
    new-instance p0, Lcom/google/android/gms/internal/ads/zzgo;

    .line 103
    .line 104
    const/16 p1, 0x7d8

    .line 105
    .line 106
    invoke-direct {p0, v2, p1}, Lcom/google/android/gms/internal/ads/zzgo;-><init>(Ljava/lang/Throwable;I)V

    .line 107
    .line 108
    .line 109
    throw p0

    .line 110
    :cond_5
    throw v2
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzgo; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 111
    :goto_2
    new-instance p1, Lcom/google/android/gms/internal/ads/zzgo;

    .line 112
    .line 113
    instance-of v1, p0, Ljava/io/FileNotFoundException;

    .line 114
    .line 115
    if-eq v0, v1, :cond_6

    .line 116
    .line 117
    const/16 v0, 0x7d0

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_6
    const/16 v0, 0x7d5

    .line 121
    .line 122
    :goto_3
    invoke-direct {p1, p0, v0}, Lcom/google/android/gms/internal/ads/zzgo;-><init>(Ljava/lang/Throwable;I)V

    .line 123
    .line 124
    .line 125
    throw p1

    .line 126
    :catch_1
    move-exception p0

    .line 127
    throw p0
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i7x0;->f:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzgo;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/i7x0;->f:Landroid/net/Uri;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iget-object v2, p0, Ll/i7x0;->g:Ljava/io/InputStream;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v2

    .line 14
    goto :goto_2

    .line 15
    :catch_0
    move-exception v2

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    iput-object v0, p0, Ll/i7x0;->g:Ljava/io/InputStream;

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/i7x0;->i:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iput-boolean v1, p0, Ll/i7x0;->i:Z

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void

    .line 29
    :goto_1
    :try_start_1
    new-instance v3, Lcom/google/android/gms/internal/ads/zzgo;

    .line 30
    .line 31
    const/16 v4, 0x7d0

    .line 32
    .line 33
    invoke-direct {v3, v2, v4}, Lcom/google/android/gms/internal/ads/zzgo;-><init>(Ljava/lang/Throwable;I)V

    .line 34
    .line 35
    .line 36
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    :goto_2
    iput-object v0, p0, Ll/i7x0;->g:Ljava/io/InputStream;

    .line 38
    .line 39
    iget-boolean v0, p0, Ll/i7x0;->i:Z

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    goto :goto_3

    .line 44
    :cond_2
    iput-boolean v1, p0, Ll/i7x0;->i:Z

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 47
    .line 48
    .line 49
    :goto_3
    throw v2
.end method
