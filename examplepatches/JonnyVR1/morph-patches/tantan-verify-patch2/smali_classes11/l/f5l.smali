.class public Ll/f5l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/f5l$d;,
        Ll/f5l$b;,
        Ll/f5l$e;,
        Ll/f5l$a;,
        Ll/f5l$c;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/h5l;

.field public final b:Ll/g6c;

.field public final c:Ll/g6c;

.field public final d:Ll/i0j0;

.field public final e:[Landroid/net/Uri;

.field public final f:[Lcom/google/android/exoplayer2/k;

.field public final g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

.field public final h:Ll/dfj0;

.field public final i:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

.field public final k:Ll/bf80;

.field public final l:J

.field public m:Z

.field public n:[B

.field public o:Ljava/io/IOException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public q:Z

.field public r:Ll/u9f;

.field public s:J

.field public t:Z


# direct methods
.method public constructor <init>(Ll/h5l;Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;[Landroid/net/Uri;[Lcom/google/android/exoplayer2/k;Ll/g5l;Ll/pgj0;Ll/i0j0;JLjava/util/List;Ll/bf80;Ll/zb5;)V
    .locals 0
    .param p6    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h5l;",
            "Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;",
            "[",
            "Landroid/net/Uri;",
            "[",
            "Lcom/google/android/exoplayer2/k;",
            "Ll/g5l;",
            "Ll/pgj0;",
            "Ll/i0j0;",
            "J",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ll/bf80;",
            "Ll/zb5;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f5l;->a:Ll/h5l;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 7
    .line 8
    iput-object p3, p0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 9
    .line 10
    iput-object p4, p0, Ll/f5l;->f:[Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    iput-object p7, p0, Ll/f5l;->d:Ll/i0j0;

    .line 13
    .line 14
    iput-wide p8, p0, Ll/f5l;->l:J

    .line 15
    .line 16
    iput-object p10, p0, Ll/f5l;->i:Ljava/util/List;

    .line 17
    .line 18
    iput-object p11, p0, Ll/f5l;->k:Ll/bf80;

    .line 19
    .line 20
    new-instance p1, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 21
    .line 22
    const/4 p2, 0x4

    .line 23
    invoke-direct {p1, p2}, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/f5l;->j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 27
    .line 28
    sget-object p1, Ll/bmk0;->f:[B

    .line 29
    .line 30
    iput-object p1, p0, Ll/f5l;->n:[B

    .line 31
    .line 32
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    iput-wide p1, p0, Ll/f5l;->s:J

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-interface {p5, p1}, Ll/g5l;->a(I)Ll/g6c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/f5l;->b:Ll/g6c;

    .line 45
    .line 46
    if-eqz p6, :cond_0

    .line 47
    .line 48
    invoke-interface {p1, p6}, Ll/g6c;->e(Ll/pgj0;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    const/4 p1, 0x3

    .line 52
    invoke-interface {p5, p1}, Ll/g5l;->a(I)Ll/g6c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/f5l;->c:Ll/g6c;

    .line 57
    .line 58
    new-instance p1, Ll/dfj0;

    .line 59
    .line 60
    invoke-direct {p1, p4}, Ll/dfj0;-><init>([Lcom/google/android/exoplayer2/k;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Ll/f5l;->h:Ll/dfj0;

    .line 64
    .line 65
    new-instance p1, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    const/4 p2, 0x0

    .line 71
    :goto_0
    array-length p5, p3

    .line 72
    if-ge p2, p5, :cond_2

    .line 73
    .line 74
    aget-object p5, p4, p2

    .line 75
    .line 76
    iget p5, p5, Lcom/google/android/exoplayer2/k;->e:I

    .line 77
    .line 78
    and-int/lit16 p5, p5, 0x4000

    .line 79
    .line 80
    if-nez p5, :cond_1

    .line 81
    .line 82
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p5

    .line 86
    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    new-instance p2, Ll/f5l$d;

    .line 93
    .line 94
    iget-object p3, p0, Ll/f5l;->h:Ll/dfj0;

    .line 95
    .line 96
    invoke-static {p1}, Lcom/google/common/primitives/Ints;->n(Ljava/util/Collection;)[I

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-direct {p2, p3, p1}, Ll/f5l$d;-><init>(Ll/dfj0;[I)V

    .line 101
    .line 102
    .line 103
    iput-object p2, p0, Ll/f5l;->r:Ll/u9f;

    .line 104
    .line 105
    return-void
.end method

.method public static d(Lcom/google/android/exoplayer2/source/hls/playlist/b;Lcom/google/android/exoplayer2/source/hls/playlist/b$e;)Landroid/net/Uri;
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/source/hls/playlist/b$e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->g:Ljava/lang/String;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/m5l;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/h4k0;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static g(Lcom/google/android/exoplayer2/source/hls/playlist/b;JI)Ll/f5l$e;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 2
    .line 3
    sub-long v0, p1, v0

    .line 4
    .line 5
    long-to-int v0, v0

    .line 6
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, -0x1

    .line 15
    if-ne v0, v1, :cond_2

    .line 16
    .line 17
    if-eq p3, v4, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move p3, v3

    .line 21
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-ge p3, v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Ll/f5l$e;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 38
    .line 39
    invoke-direct {v0, p0, p1, p2, p3}, Ll/f5l$e;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/b$e;JI)V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_1
    return-object v2

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 51
    .line 52
    if-ne p3, v4, :cond_3

    .line 53
    .line 54
    new-instance p0, Ll/f5l$e;

    .line 55
    .line 56
    invoke-direct {p0, v1, p1, p2, v4}, Ll/f5l$e;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/b$e;JI)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_3
    iget-object v5, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-ge p3, v5, :cond_4

    .line 67
    .line 68
    new-instance p0, Ll/f5l$e;

    .line 69
    .line 70
    iget-object v0, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 77
    .line 78
    invoke-direct {p0, v0, p1, p2, p3}, Ll/f5l$e;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/b$e;JI)V

    .line 79
    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    const-wide/16 v5, 0x1

    .line 91
    .line 92
    if-ge v0, p3, :cond_5

    .line 93
    .line 94
    new-instance p3, Ll/f5l$e;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 103
    .line 104
    add-long/2addr p1, v5

    .line 105
    invoke-direct {p3, p0, p1, p2, v4}, Ll/f5l$e;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/b$e;JI)V

    .line 106
    .line 107
    .line 108
    return-object p3

    .line 109
    :cond_5
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    if-nez p3, :cond_6

    .line 116
    .line 117
    new-instance p3, Ll/f5l$e;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    check-cast p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 126
    .line 127
    add-long/2addr p1, v5

    .line 128
    invoke-direct {p3, p0, p1, p2, v3}, Ll/f5l$e;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/b$e;JI)V

    .line 129
    .line 130
    .line 131
    return-object p3

    .line 132
    :cond_6
    return-object v2
.end method

.method public static i(Lcom/google/android/exoplayer2/source/hls/playlist/b;JI)Ljava/util/List;
    .locals 7
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b;",
            "JI)",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 2
    .line 3
    sub-long/2addr p1, v0

    .line 4
    long-to-int p1, p1

    .line 5
    if-ltz p1, :cond_7

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-ge p2, p1, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    new-instance p2, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v2, -0x1

    .line 29
    if-ge p1, v0, :cond_4

    .line 30
    .line 31
    if-eq p3, v2, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 40
    .line 41
    if-nez p3, :cond_1

    .line 42
    .line 43
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge p3, v3, :cond_2

    .line 54
    .line 55
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-interface {v0, p3, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    invoke-interface {p2, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_0
    add-int/lit8 p1, p1, 0x1

    .line 69
    .line 70
    :cond_3
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-interface {p3, p1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move p3, v1

    .line 84
    :cond_4
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->n:J

    .line 85
    .line 86
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    cmp-long p1, v3, v5

    .line 92
    .line 93
    if-eqz p1, :cond_6

    .line 94
    .line 95
    if-ne p3, v2, :cond_5

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_5
    move v1, p3

    .line 99
    :goto_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-ge v1, p1, :cond_6

    .line 106
    .line 107
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    invoke-interface {p0, v1, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {p2, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 118
    .line 119
    .line 120
    :cond_6
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :cond_7
    :goto_2
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0
.end method


# virtual methods
.method public a(Ll/j5l;J)[Ll/drx;
    .locals 13
    .param p1    # Ll/j5l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v2, -0x1

    .line 4
    :goto_0
    move v8, v2

    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v2, p0, Ll/f5l;->h:Ll/dfj0;

    .line 7
    .line 8
    iget-object v3, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 9
    .line 10
    invoke-virtual {v2, v3}, Ll/dfj0;->d(Lcom/google/android/exoplayer2/k;)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    goto :goto_0

    .line 15
    :goto_1
    iget-object v2, p0, Ll/f5l;->r:Ll/u9f;

    .line 16
    .line 17
    invoke-interface {v2}, Ll/vfj0;->length()I

    .line 18
    .line 19
    .line 20
    move-result v9

    .line 21
    new-array v10, v9, [Ll/drx;

    .line 22
    .line 23
    const/4 v11, 0x0

    .line 24
    move v12, v11

    .line 25
    :goto_2
    if-ge v12, v9, :cond_3

    .line 26
    .line 27
    iget-object v2, p0, Ll/f5l;->r:Ll/u9f;

    .line 28
    .line 29
    invoke-interface {v2, v12}, Ll/vfj0;->c(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v3, p0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 34
    .line 35
    aget-object v3, v3, v2

    .line 36
    .line 37
    iget-object v4, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 38
    .line 39
    invoke-interface {v4, v3}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->h(Landroid/net/Uri;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-nez v4, :cond_1

    .line 44
    .line 45
    sget-object v2, Ll/drx;->a:Ll/drx;

    .line 46
    .line 47
    aput-object v2, v10, v12

    .line 48
    .line 49
    goto :goto_5

    .line 50
    :cond_1
    iget-object v4, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 51
    .line 52
    invoke-interface {v4, v3, v11}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->l(Landroid/net/Uri;Z)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 60
    .line 61
    iget-object v6, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 62
    .line 63
    invoke-interface {v6}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->b()J

    .line 64
    .line 65
    .line 66
    move-result-wide v6

    .line 67
    sub-long/2addr v4, v6

    .line 68
    if-eq v2, v8, :cond_2

    .line 69
    .line 70
    const/4 v2, 0x1

    .line 71
    :goto_3
    move-object v0, p0

    .line 72
    move-object v1, p1

    .line 73
    move-wide v6, p2

    .line 74
    goto :goto_4

    .line 75
    :cond_2
    move v2, v11

    .line 76
    goto :goto_3

    .line 77
    :goto_4
    invoke-virtual/range {v0 .. v7}, Ll/f5l;->f(Ll/j5l;ZLcom/google/android/exoplayer2/source/hls/playlist/b;JJ)Landroid/util/Pair;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-object v0, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v0, Ljava/lang/Long;

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 86
    .line 87
    .line 88
    move-result-wide v0

    .line 89
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v2, Ljava/lang/Integer;

    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    new-instance v6, Ll/f5l$c;

    .line 98
    .line 99
    iget-object v7, v3, Ll/m5l;->a:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v3, v0, v1, v2}, Ll/f5l;->i(Lcom/google/android/exoplayer2/source/hls/playlist/b;JI)Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-direct {v6, v7, v4, v5, v0}, Ll/f5l$c;-><init>(Ljava/lang/String;JLjava/util/List;)V

    .line 106
    .line 107
    .line 108
    aput-object v6, v10, v12

    .line 109
    .line 110
    :goto_5
    add-int/lit8 v12, v12, 0x1

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_3
    return-object v10
.end method

.method public b(JLl/nke0;)J
    .locals 11

    .line 1
    iget-object v0, p0, Ll/f5l;->r:Ll/u9f;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/u9f;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 8
    .line 9
    array-length v2, v1

    .line 10
    const/4 v3, 0x1

    .line 11
    if-ge v0, v2, :cond_0

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-eq v0, v2, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 17
    .line 18
    iget-object v2, p0, Ll/f5l;->r:Ll/u9f;

    .line 19
    .line 20
    invoke-interface {v2}, Ll/u9f;->j()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    aget-object v1, v1, v2

    .line 25
    .line 26
    invoke-interface {v0, v1, v3}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->l(Landroid/net/Uri;Z)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    :goto_0
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_3

    .line 41
    .line 42
    iget-boolean v1, v0, Ll/m5l;->c:Z

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_1
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 48
    .line 49
    iget-object p0, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 50
    .line 51
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->b()J

    .line 52
    .line 53
    .line 54
    move-result-wide v4

    .line 55
    sub-long/2addr v1, v4

    .line 56
    sub-long v5, p1, v1

    .line 57
    .line 58
    iget-object p0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p0, p1, v3, v3}, Ll/bmk0;->f(Ljava/util/List;Ljava/lang/Comparable;ZZ)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    iget-object p1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 75
    .line 76
    iget-wide v7, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    .line 77
    .line 78
    iget-object p1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    sub-int/2addr p1, v3

    .line 85
    if-eq p0, p1, :cond_2

    .line 86
    .line 87
    iget-object p1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 88
    .line 89
    add-int/2addr p0, v3

    .line 90
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 95
    .line 96
    iget-wide p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    .line 97
    .line 98
    move-wide v9, p0

    .line 99
    :goto_1
    move-object v4, p3

    .line 100
    goto :goto_2

    .line 101
    :cond_2
    move-wide v9, v7

    .line 102
    goto :goto_1

    .line 103
    :goto_2
    invoke-virtual/range {v4 .. v10}, Ll/nke0;->a(JJJ)J

    .line 104
    .line 105
    .line 106
    move-result-wide p0

    .line 107
    add-long/2addr p0, v1

    .line 108
    return-wide p0

    .line 109
    :cond_3
    :goto_3
    return-wide p1
.end method

.method public c(Ll/j5l;)I
    .locals 7

    .line 1
    iget v0, p1, Ll/j5l;->o:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    iget-object v0, p0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 9
    .line 10
    iget-object v1, p0, Ll/f5l;->h:Ll/dfj0;

    .line 11
    .line 12
    iget-object v3, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 13
    .line 14
    invoke-virtual {v1, v3}, Ll/dfj0;->d(Lcom/google/android/exoplayer2/k;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    aget-object v0, v0, v1

    .line 19
    .line 20
    iget-object p0, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-interface {p0, v0, v1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->l(Landroid/net/Uri;Z)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 32
    .line 33
    iget-wide v3, p1, Ll/crx;->j:J

    .line 34
    .line 35
    iget-wide v5, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 36
    .line 37
    sub-long/2addr v3, v5

    .line 38
    long-to-int v0, v3

    .line 39
    if-gez v0, :cond_1

    .line 40
    .line 41
    return v2

    .line 42
    :cond_1
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-ge v0, v3, :cond_2

    .line 49
    .line 50
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 62
    .line 63
    :goto_0
    iget v3, p1, Ll/j5l;->o:I

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    const/4 v5, 0x2

    .line 70
    if-lt v3, v4, :cond_3

    .line 71
    .line 72
    return v5

    .line 73
    :cond_3
    iget v3, p1, Ll/j5l;->o:I

    .line 74
    .line 75
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 80
    .line 81
    iget-boolean v3, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;->m:Z

    .line 82
    .line 83
    if-eqz v3, :cond_4

    .line 84
    .line 85
    return v1

    .line 86
    :cond_4
    iget-object p0, p0, Ll/m5l;->a:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->a:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p0, v0}, Ll/h4k0;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iget-object p1, p1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 101
    .line 102
    invoke-static {p0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_5

    .line 107
    .line 108
    return v2

    .line 109
    :cond_5
    return v5
.end method

.method public e(JJLjava/util/List;ZLl/f5l$b;)V
    .locals 31
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/List<",
            "Ll/j5l;",
            ">;Z",
            "Ll/f5l$b;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v6, p3

    .line 4
    .line 5
    move-object/from16 v8, p7

    .line 6
    .line 7
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static/range {p5 .. p5}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/j5l;

    .line 20
    .line 21
    :goto_0
    if-nez v1, :cond_1

    .line 22
    .line 23
    const/4 v11, -0x1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    iget-object v2, v0, Ll/f5l;->h:Ll/dfj0;

    .line 26
    .line 27
    iget-object v3, v1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ll/dfj0;->d(Lcom/google/android/exoplayer2/k;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    move v11, v2

    .line 34
    :goto_1
    sub-long v2, v6, p1

    .line 35
    .line 36
    invoke-virtual/range {p0 .. p2}, Ll/f5l;->s(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    iget-boolean v12, v0, Ll/f5l;->q:Z

    .line 43
    .line 44
    if-nez v12, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/o45;->d()J

    .line 47
    .line 48
    .line 49
    move-result-wide v12

    .line 50
    sub-long/2addr v2, v12

    .line 51
    const-wide/16 v14, 0x0

    .line 52
    .line 53
    invoke-static {v14, v15, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    cmp-long v16, v4, v16

    .line 63
    .line 64
    if-eqz v16, :cond_2

    .line 65
    .line 66
    sub-long/2addr v4, v12

    .line 67
    invoke-static {v14, v15, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    :cond_2
    move-wide v15, v2

    .line 72
    move-wide/from16 v17, v4

    .line 73
    .line 74
    invoke-virtual {v0, v1, v6, v7}, Ll/f5l;->a(Ll/j5l;J)[Ll/drx;

    .line 75
    .line 76
    .line 77
    move-result-object v20

    .line 78
    iget-object v12, v0, Ll/f5l;->r:Ll/u9f;

    .line 79
    .line 80
    move-wide/from16 v13, p1

    .line 81
    .line 82
    move-object/from16 v19, p5

    .line 83
    .line 84
    invoke-interface/range {v12 .. v20}, Ll/u9f;->g(JJJLjava/util/List;[Ll/drx;)V

    .line 85
    .line 86
    .line 87
    iget-object v2, v0, Ll/f5l;->r:Ll/u9f;

    .line 88
    .line 89
    invoke-interface {v2}, Ll/u9f;->j()I

    .line 90
    .line 91
    .line 92
    move-result v12

    .line 93
    const/4 v14, 0x1

    .line 94
    if-eq v11, v12, :cond_3

    .line 95
    .line 96
    move v2, v14

    .line 97
    goto :goto_2

    .line 98
    :cond_3
    const/4 v2, 0x0

    .line 99
    :goto_2
    iget-object v3, v0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 100
    .line 101
    aget-object v15, v3, v12

    .line 102
    .line 103
    iget-object v3, v0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 104
    .line 105
    invoke-interface {v3, v15}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->h(Landroid/net/Uri;)Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-nez v3, :cond_4

    .line 110
    .line 111
    iput-object v15, v8, Ll/f5l$b;->c:Landroid/net/Uri;

    .line 112
    .line 113
    iget-boolean v1, v0, Ll/f5l;->t:Z

    .line 114
    .line 115
    iget-object v2, v0, Ll/f5l;->p:Landroid/net/Uri;

    .line 116
    .line 117
    invoke-virtual {v15, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    and-int/2addr v1, v2

    .line 122
    iput-boolean v1, v0, Ll/f5l;->t:Z

    .line 123
    .line 124
    iput-object v15, v0, Ll/f5l;->p:Landroid/net/Uri;

    .line 125
    .line 126
    return-void

    .line 127
    :cond_4
    iget-object v3, v0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 128
    .line 129
    invoke-interface {v3, v15, v14}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->l(Landroid/net/Uri;Z)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    iget-boolean v4, v3, Ll/m5l;->c:Z

    .line 137
    .line 138
    iput-boolean v4, v0, Ll/f5l;->q:Z

    .line 139
    .line 140
    invoke-virtual {v0, v3}, Ll/f5l;->w(Lcom/google/android/exoplayer2/source/hls/playlist/b;)V

    .line 141
    .line 142
    .line 143
    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 144
    .line 145
    iget-object v9, v0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 146
    .line 147
    invoke-interface {v9}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->b()J

    .line 148
    .line 149
    .line 150
    move-result-wide v17

    .line 151
    sub-long v4, v4, v17

    .line 152
    .line 153
    invoke-virtual/range {v0 .. v7}, Ll/f5l;->f(Ll/j5l;ZLcom/google/android/exoplayer2/source/hls/playlist/b;JJ)Landroid/util/Pair;

    .line 154
    .line 155
    .line 156
    move-result-object v9

    .line 157
    iget-object v6, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 158
    .line 159
    check-cast v6, Ljava/lang/Long;

    .line 160
    .line 161
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 162
    .line 163
    .line 164
    move-result-wide v6

    .line 165
    iget-object v9, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v9, Ljava/lang/Integer;

    .line 168
    .line 169
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 170
    .line 171
    .line 172
    move-result v9

    .line 173
    move/from16 v18, v11

    .line 174
    .line 175
    iget-wide v10, v3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 176
    .line 177
    cmp-long v10, v6, v10

    .line 178
    .line 179
    if-gez v10, :cond_5

    .line 180
    .line 181
    if-eqz v1, :cond_5

    .line 182
    .line 183
    if-eqz v2, :cond_5

    .line 184
    .line 185
    iget-object v2, v0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 186
    .line 187
    aget-object v15, v2, v18

    .line 188
    .line 189
    iget-object v2, v0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 190
    .line 191
    invoke-interface {v2, v15, v14}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->l(Landroid/net/Uri;Z)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    iget-wide v4, v3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 199
    .line 200
    iget-object v2, v0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 201
    .line 202
    invoke-interface {v2}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->b()J

    .line 203
    .line 204
    .line 205
    move-result-wide v6

    .line 206
    sub-long/2addr v4, v6

    .line 207
    const/4 v2, 0x0

    .line 208
    move-wide/from16 v6, p3

    .line 209
    .line 210
    invoke-virtual/range {v0 .. v7}, Ll/f5l;->f(Ll/j5l;ZLcom/google/android/exoplayer2/source/hls/playlist/b;JJ)Landroid/util/Pair;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    iget-object v6, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 215
    .line 216
    check-cast v6, Ljava/lang/Long;

    .line 217
    .line 218
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 219
    .line 220
    .line 221
    move-result-wide v6

    .line 222
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 223
    .line 224
    check-cast v2, Ljava/lang/Integer;

    .line 225
    .line 226
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 227
    .line 228
    .line 229
    move-result v9

    .line 230
    move/from16 v11, v18

    .line 231
    .line 232
    :goto_3
    move-object v2, v15

    .line 233
    move-object v15, v3

    .line 234
    goto :goto_4

    .line 235
    :cond_5
    move v11, v12

    .line 236
    goto :goto_3

    .line 237
    :goto_4
    iget-wide v13, v15, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 238
    .line 239
    cmp-long v3, v6, v13

    .line 240
    .line 241
    if-gez v3, :cond_6

    .line 242
    .line 243
    new-instance v1, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;

    .line 244
    .line 245
    invoke-direct {v1}, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;-><init>()V

    .line 246
    .line 247
    .line 248
    iput-object v1, v0, Ll/f5l;->o:Ljava/io/IOException;

    .line 249
    .line 250
    return-void

    .line 251
    :cond_6
    invoke-static {v15, v6, v7, v9}, Ll/f5l;->g(Lcom/google/android/exoplayer2/source/hls/playlist/b;JI)Ll/f5l$e;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    if-nez v3, :cond_a

    .line 256
    .line 257
    iget-boolean v3, v15, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 258
    .line 259
    if-nez v3, :cond_7

    .line 260
    .line 261
    iput-object v2, v8, Ll/f5l$b;->c:Landroid/net/Uri;

    .line 262
    .line 263
    iget-boolean v1, v0, Ll/f5l;->t:Z

    .line 264
    .line 265
    iget-object v3, v0, Ll/f5l;->p:Landroid/net/Uri;

    .line 266
    .line 267
    invoke-virtual {v2, v3}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    and-int/2addr v1, v3

    .line 272
    iput-boolean v1, v0, Ll/f5l;->t:Z

    .line 273
    .line 274
    iput-object v2, v0, Ll/f5l;->p:Landroid/net/Uri;

    .line 275
    .line 276
    return-void

    .line 277
    :cond_7
    if-nez p6, :cond_8

    .line 278
    .line 279
    iget-object v3, v15, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 280
    .line 281
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    if-eqz v3, :cond_9

    .line 286
    .line 287
    :cond_8
    const/4 v6, 0x1

    .line 288
    goto :goto_5

    .line 289
    :cond_9
    new-instance v3, Ll/f5l$e;

    .line 290
    .line 291
    iget-object v6, v15, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 292
    .line 293
    invoke-static {v6}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    check-cast v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 298
    .line 299
    iget-wide v9, v15, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 300
    .line 301
    iget-object v7, v15, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 302
    .line 303
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 304
    .line 305
    .line 306
    move-result v7

    .line 307
    int-to-long v12, v7

    .line 308
    add-long/2addr v9, v12

    .line 309
    const-wide/16 v12, 0x1

    .line 310
    .line 311
    sub-long/2addr v9, v12

    .line 312
    const/4 v7, -0x1

    .line 313
    invoke-direct {v3, v6, v9, v10, v7}, Ll/f5l$e;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/b$e;JI)V

    .line 314
    .line 315
    .line 316
    :cond_a
    const/4 v6, 0x1

    .line 317
    const/4 v7, 0x0

    .line 318
    goto :goto_6

    .line 319
    :goto_5
    iput-boolean v6, v8, Ll/f5l$b;->b:Z

    .line 320
    .line 321
    return-void

    .line 322
    :goto_6
    iput-boolean v7, v0, Ll/f5l;->t:Z

    .line 323
    .line 324
    const/4 v7, 0x0

    .line 325
    iput-object v7, v0, Ll/f5l;->p:Landroid/net/Uri;

    .line 326
    .line 327
    iget-object v7, v3, Ll/f5l$e;->a:Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 328
    .line 329
    iget-object v7, v7, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->b:Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 330
    .line 331
    invoke-static {v15, v7}, Ll/f5l;->d(Lcom/google/android/exoplayer2/source/hls/playlist/b;Lcom/google/android/exoplayer2/source/hls/playlist/b$e;)Landroid/net/Uri;

    .line 332
    .line 333
    .line 334
    move-result-object v7

    .line 335
    const/4 v9, 0x0

    .line 336
    invoke-virtual {v0, v7, v11, v6, v9}, Ll/f5l;->l(Landroid/net/Uri;IZLl/ac5;)Ll/o45;

    .line 337
    .line 338
    .line 339
    move-result-object v6

    .line 340
    iput-object v6, v8, Ll/f5l$b;->a:Ll/o45;

    .line 341
    .line 342
    if-eqz v6, :cond_b

    .line 343
    .line 344
    goto :goto_7

    .line 345
    :cond_b
    iget-object v6, v3, Ll/f5l$e;->a:Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 346
    .line 347
    invoke-static {v15, v6}, Ll/f5l;->d(Lcom/google/android/exoplayer2/source/hls/playlist/b;Lcom/google/android/exoplayer2/source/hls/playlist/b$e;)Landroid/net/Uri;

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    const/4 v10, 0x0

    .line 352
    invoke-virtual {v0, v6, v11, v10, v9}, Ll/f5l;->l(Landroid/net/Uri;IZLl/ac5;)Ll/o45;

    .line 353
    .line 354
    .line 355
    move-result-object v10

    .line 356
    iput-object v10, v8, Ll/f5l$b;->a:Ll/o45;

    .line 357
    .line 358
    if-eqz v10, :cond_c

    .line 359
    .line 360
    goto :goto_7

    .line 361
    :cond_c
    move-object/from16 p1, v1

    .line 362
    .line 363
    move-object/from16 p2, v2

    .line 364
    .line 365
    move-object/from16 p4, v3

    .line 366
    .line 367
    move-wide/from16 p5, v4

    .line 368
    .line 369
    move-object/from16 p3, v15

    .line 370
    .line 371
    invoke-static/range {p1 .. p6}, Ll/j5l;->w(Ll/j5l;Landroid/net/Uri;Lcom/google/android/exoplayer2/source/hls/playlist/b;Ll/f5l$e;J)Z

    .line 372
    .line 373
    .line 374
    move-result v28

    .line 375
    move-object/from16 v17, p2

    .line 376
    .line 377
    move-wide/from16 v13, p5

    .line 378
    .line 379
    if-eqz v28, :cond_d

    .line 380
    .line 381
    iget-boolean v2, v3, Ll/f5l$e;->d:Z

    .line 382
    .line 383
    if-eqz v2, :cond_d

    .line 384
    .line 385
    :goto_7
    return-void

    .line 386
    :cond_d
    iget-object v10, v0, Ll/f5l;->a:Ll/h5l;

    .line 387
    .line 388
    move v12, v11

    .line 389
    iget-object v11, v0, Ll/f5l;->b:Ll/g6c;

    .line 390
    .line 391
    iget-object v2, v0, Ll/f5l;->f:[Lcom/google/android/exoplayer2/k;

    .line 392
    .line 393
    aget-object v12, v2, v12

    .line 394
    .line 395
    iget-object v2, v0, Ll/f5l;->i:Ljava/util/List;

    .line 396
    .line 397
    iget-object v4, v0, Ll/f5l;->r:Ll/u9f;

    .line 398
    .line 399
    invoke-interface {v4}, Ll/u9f;->s()I

    .line 400
    .line 401
    .line 402
    move-result v19

    .line 403
    iget-object v4, v0, Ll/f5l;->r:Ll/u9f;

    .line 404
    .line 405
    invoke-interface {v4}, Ll/u9f;->o()Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v20

    .line 409
    iget-boolean v4, v0, Ll/f5l;->m:Z

    .line 410
    .line 411
    iget-object v5, v0, Ll/f5l;->d:Ll/i0j0;

    .line 412
    .line 413
    move-object/from16 v16, v10

    .line 414
    .line 415
    iget-wide v9, v0, Ll/f5l;->l:J

    .line 416
    .line 417
    move-object/from16 p1, v1

    .line 418
    .line 419
    iget-object v1, v0, Ll/f5l;->j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 420
    .line 421
    invoke-virtual {v1, v6}, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;->a(Landroid/net/Uri;)[B

    .line 422
    .line 423
    .line 424
    move-result-object v26

    .line 425
    iget-object v1, v0, Ll/f5l;->j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 426
    .line 427
    invoke-virtual {v1, v7}, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;->a(Landroid/net/Uri;)[B

    .line 428
    .line 429
    .line 430
    move-result-object v27

    .line 431
    iget-object v0, v0, Ll/f5l;->k:Ll/bf80;

    .line 432
    .line 433
    move-object/from16 v25, p1

    .line 434
    .line 435
    move-object/from16 v29, v0

    .line 436
    .line 437
    move-object/from16 v18, v2

    .line 438
    .line 439
    move/from16 v21, v4

    .line 440
    .line 441
    move-object/from16 v22, v5

    .line 442
    .line 443
    move-wide/from16 v23, v9

    .line 444
    .line 445
    move-object/from16 v10, v16

    .line 446
    .line 447
    const/16 v30, 0x0

    .line 448
    .line 449
    move-object/from16 v16, v3

    .line 450
    .line 451
    invoke-static/range {v10 .. v30}, Ll/j5l;->j(Ll/h5l;Ll/g6c;Lcom/google/android/exoplayer2/k;JLcom/google/android/exoplayer2/source/hls/playlist/b;Ll/f5l$e;Landroid/net/Uri;Ljava/util/List;ILjava/lang/Object;ZLl/i0j0;JLl/j5l;[B[BZLl/bf80;Ll/ac5;)Ll/j5l;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    iput-object v0, v8, Ll/f5l$b;->a:Ll/o45;

    .line 456
    .line 457
    return-void
.end method

.method public final f(Ll/j5l;ZLcom/google/android/exoplayer2/source/hls/playlist/b;JJ)Landroid/util/Pair;
    .locals 6
    .param p1    # Ll/j5l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/j5l;",
            "Z",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b;",
            "JJ)",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, -0x1

    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/j5l;->h()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    new-instance p0, Landroid/util/Pair;

    .line 15
    .line 16
    iget p2, p1, Ll/j5l;->o:I

    .line 17
    .line 18
    if-ne p2, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/crx;->g()J

    .line 21
    .line 22
    .line 23
    move-result-wide p2

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-wide p2, p1, Ll/crx;->j:J

    .line 26
    .line 27
    :goto_0
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iget p1, p1, Ll/j5l;->o:I

    .line 32
    .line 33
    if-ne p1, v1, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    add-int/lit8 v1, p1, 0x1

    .line 37
    .line 38
    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    new-instance p0, Landroid/util/Pair;

    .line 47
    .line 48
    iget-wide p2, p1, Ll/crx;->j:J

    .line 49
    .line 50
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iget p1, p1, Ll/j5l;->o:I

    .line 55
    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {p0, p2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_4
    :goto_2
    iget-wide v2, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    .line 65
    .line 66
    add-long/2addr v2, p4

    .line 67
    if-eqz p1, :cond_6

    .line 68
    .line 69
    iget-boolean p2, p0, Ll/f5l;->q:Z

    .line 70
    .line 71
    if-eqz p2, :cond_5

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_5
    iget-wide p6, p1, Ll/o45;->g:J

    .line 75
    .line 76
    :cond_6
    :goto_3
    iget-boolean p2, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 77
    .line 78
    if-nez p2, :cond_7

    .line 79
    .line 80
    cmp-long p2, p6, v2

    .line 81
    .line 82
    if-ltz p2, :cond_7

    .line 83
    .line 84
    new-instance p0, Landroid/util/Pair;

    .line 85
    .line 86
    iget-wide p1, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 87
    .line 88
    iget-object p3, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    int-to-long p3, p3

    .line 95
    add-long/2addr p1, p3

    .line 96
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_7
    sub-long/2addr p6, p4

    .line 109
    iget-object p2, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 112
    .line 113
    .line 114
    move-result-object p4

    .line 115
    iget-object p0, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 116
    .line 117
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->i()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    const/4 p5, 0x0

    .line 122
    if-eqz p0, :cond_9

    .line 123
    .line 124
    if-nez p1, :cond_8

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_8
    move p0, p5

    .line 128
    goto :goto_5

    .line 129
    :cond_9
    :goto_4
    move p0, v0

    .line 130
    :goto_5
    invoke-static {p2, p4, v0, p0}, Ll/bmk0;->f(Ljava/util/List;Ljava/lang/Comparable;ZZ)I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    int-to-long p1, p0

    .line 135
    iget-wide v2, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 136
    .line 137
    add-long/2addr p1, v2

    .line 138
    if-ltz p0, :cond_d

    .line 139
    .line 140
    iget-object p4, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {p4, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    check-cast p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 147
    .line 148
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    .line 149
    .line 150
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    .line 151
    .line 152
    add-long/2addr v2, v4

    .line 153
    cmp-long p4, p6, v2

    .line 154
    .line 155
    if-gez p4, :cond_a

    .line 156
    .line 157
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 158
    .line 159
    goto :goto_6

    .line 160
    :cond_a
    iget-object p0, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 161
    .line 162
    :goto_6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 163
    .line 164
    .line 165
    move-result p4

    .line 166
    if-ge p5, p4, :cond_d

    .line 167
    .line 168
    invoke-interface {p0, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p4

    .line 172
    check-cast p4, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 173
    .line 174
    iget-wide v2, p4, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    .line 175
    .line 176
    iget-wide v4, p4, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    .line 177
    .line 178
    add-long/2addr v2, v4

    .line 179
    cmp-long v0, p6, v2

    .line 180
    .line 181
    if-gez v0, :cond_c

    .line 182
    .line 183
    iget-boolean p4, p4, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;->l:Z

    .line 184
    .line 185
    if-eqz p4, :cond_d

    .line 186
    .line 187
    iget-object p3, p3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 188
    .line 189
    if-ne p0, p3, :cond_b

    .line 190
    .line 191
    const-wide/16 p3, 0x1

    .line 192
    .line 193
    goto :goto_7

    .line 194
    :cond_b
    const-wide/16 p3, 0x0

    .line 195
    .line 196
    :goto_7
    add-long/2addr p1, p3

    .line 197
    move v1, p5

    .line 198
    goto :goto_8

    .line 199
    :cond_c
    add-int/lit8 p5, p5, 0x1

    .line 200
    .line 201
    goto :goto_6

    .line 202
    :cond_d
    :goto_8
    new-instance p0, Landroid/util/Pair;

    .line 203
    .line 204
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    return-object p0
.end method

.method public h(JLjava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/f5l;->o:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/f5l;->r:Ll/u9f;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/vfj0;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/f5l;->r:Ll/u9f;

    .line 16
    .line 17
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->i(JLjava/util/List;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public j()Ll/dfj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5l;->h:Ll/dfj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/u9f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5l;->r:Ll/u9f;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Landroid/net/Uri;IZLl/ac5;)Ll/o45;
    .locals 7
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/ac5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p3, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p3

    .line 5
    :cond_0
    iget-object p4, p0, Ll/f5l;->j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 6
    .line 7
    invoke-virtual {p4, p1}, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;->c(Landroid/net/Uri;)[B

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    if-eqz p4, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/f5l;->j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 14
    .line 15
    invoke-virtual {p0, p1, p4}, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;->b(Landroid/net/Uri;[B)[B

    .line 16
    .line 17
    .line 18
    return-object p3

    .line 19
    :cond_1
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    new-instance p4, Lcom/google/android/exoplayer2/upstream/a$b;

    .line 24
    .line 25
    invoke-direct {p4}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p4, p1}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 p4, 0x1

    .line 33
    invoke-virtual {p1, p4}, Lcom/google/android/exoplayer2/upstream/a$b;->b(I)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, p3}, Lcom/google/android/exoplayer2/upstream/a$b;->e(Ljava/util/Map;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v0, Ll/f5l$a;

    .line 46
    .line 47
    iget-object v1, p0, Ll/f5l;->c:Ll/g6c;

    .line 48
    .line 49
    iget-object p1, p0, Ll/f5l;->f:[Lcom/google/android/exoplayer2/k;

    .line 50
    .line 51
    aget-object v3, p1, p2

    .line 52
    .line 53
    iget-object p1, p0, Ll/f5l;->r:Ll/u9f;

    .line 54
    .line 55
    invoke-interface {p1}, Ll/u9f;->s()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    iget-object p1, p0, Ll/f5l;->r:Ll/u9f;

    .line 60
    .line 61
    invoke-interface {p1}, Ll/u9f;->o()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget-object v6, p0, Ll/f5l;->n:[B

    .line 66
    .line 67
    invoke-direct/range {v0 .. v6}, Ll/f5l$a;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;[B)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public m(Ll/o45;J)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f5l;->r:Ll/u9f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/f5l;->h:Ll/dfj0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/dfj0;->d(Lcom/google/android/exoplayer2/k;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-interface {v0, p0}, Ll/vfj0;->f(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-interface {v0, p0, p2, p3}, Ll/u9f;->d(IJ)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public n()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/f5l;->o:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/f5l;->p:Landroid/net/Uri;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Ll/f5l;->t:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 14
    .line 15
    invoke-interface {p0, v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->d(Landroid/net/Uri;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    throw v0
.end method

.method public o(Landroid/net/Uri;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bmk0;->s([Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Ll/o45;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/f5l$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/f5l$a;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/r5c;->h()[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/f5l;->n:[B

    .line 12
    .line 13
    iget-object p0, p0, Ll/f5l;->j:Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;

    .line 14
    .line 15
    iget-object v0, p1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/f5l$a;->j()[B

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, [B

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/source/hls/FullSegmentEncryptionKeyCache;->b(Landroid/net/Uri;[B)[B

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public q(Landroid/net/Uri;J)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/f5l;->e:[Landroid/net/Uri;

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    const/4 v4, -0x1

    .line 7
    if-ge v1, v3, :cond_1

    .line 8
    .line 9
    aget-object v2, v2, v1

    .line 10
    .line 11
    invoke-virtual {v2, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v1, v4

    .line 22
    :goto_1
    const/4 v2, 0x1

    .line 23
    if-ne v1, v4, :cond_2

    .line 24
    .line 25
    return v2

    .line 26
    :cond_2
    iget-object v3, p0, Ll/f5l;->r:Ll/u9f;

    .line 27
    .line 28
    invoke-interface {v3, v1}, Ll/vfj0;->f(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ne v1, v4, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget-boolean v3, p0, Ll/f5l;->t:Z

    .line 36
    .line 37
    iget-object v4, p0, Ll/f5l;->p:Landroid/net/Uri;

    .line 38
    .line 39
    invoke-virtual {p1, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    or-int/2addr v3, v4

    .line 44
    iput-boolean v3, p0, Ll/f5l;->t:Z

    .line 45
    .line 46
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    cmp-long v3, p2, v3

    .line 52
    .line 53
    if-eqz v3, :cond_5

    .line 54
    .line 55
    iget-object v3, p0, Ll/f5l;->r:Ll/u9f;

    .line 56
    .line 57
    invoke-interface {v3, v1, p2, p3}, Ll/u9f;->d(IJ)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    iget-object p0, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 64
    .line 65
    invoke-interface {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->j(Landroid/net/Uri;J)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_4
    return v0

    .line 73
    :cond_5
    :goto_2
    return v2
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/f5l;->o:Ljava/io/IOException;

    .line 3
    .line 4
    return-void
.end method

.method public final s(J)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/f5l;->s:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long p0, v0, v2

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    sub-long/2addr v0, p1

    .line 13
    return-wide v0

    .line 14
    :cond_0
    return-wide v2
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/f5l;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public u(Ll/u9f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f5l;->r:Ll/u9f;

    .line 2
    .line 3
    return-void
.end method

.method public v(JLl/o45;Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/o45;",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/f5l;->o:Ljava/io/IOException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Ll/f5l;->r:Ll/u9f;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Ll/u9f;->p(JLl/o45;Ljava/util/List;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final w(Lcom/google/android/exoplayer2/source/hls/playlist/b;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/b;->e()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-object p1, p0, Ll/f5l;->g:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 16
    .line 17
    invoke-interface {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->b()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    sub-long/2addr v0, v2

    .line 22
    :goto_0
    iput-wide v0, p0, Ll/f5l;->s:J

    .line 23
    .line 24
    return-void
.end method
