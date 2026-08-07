.class public final Ll/l5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/h;
.implements Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/l5l$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/h5l;

.field public final b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

.field public final c:Ll/g5l;

.field public final d:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Lcom/google/android/exoplayer2/drm/c;

.field public final f:Lcom/google/android/exoplayer2/drm/b$a;

.field public final g:Lcom/google/android/exoplayer2/upstream/c;

.field public final h:Lcom/google/android/exoplayer2/source/j$a;

.field public final i:Ll/oj0;

.field public final j:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Ll/xwd0;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ll/i0j0;

.field public final l:Ll/et5;

.field public final m:Z

.field public final n:I

.field public final o:Z

.field public final p:Ll/bf80;

.field public final q:Ll/s5l$b;

.field public final r:J

.field public s:Lcom/google/android/exoplayer2/source/h$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public t:I

.field public u:Ll/ffj0;

.field public v:[Ll/s5l;

.field public w:[Ll/s5l;

.field public x:[[I

.field public y:I

.field public z:Lcom/google/android/exoplayer2/source/r;


# direct methods
.method public constructor <init>(Ll/h5l;Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;Ll/g5l;Ll/pgj0;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;Ll/oj0;Ll/et5;ZIZLl/bf80;J)V
    .locals 0
    .param p4    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l5l;->a:Ll/h5l;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l5l;->b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 7
    .line 8
    iput-object p3, p0, Ll/l5l;->c:Ll/g5l;

    .line 9
    .line 10
    iput-object p4, p0, Ll/l5l;->d:Ll/pgj0;

    .line 11
    .line 12
    iput-object p6, p0, Ll/l5l;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 13
    .line 14
    iput-object p7, p0, Ll/l5l;->f:Lcom/google/android/exoplayer2/drm/b$a;

    .line 15
    .line 16
    iput-object p8, p0, Ll/l5l;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 17
    .line 18
    iput-object p9, p0, Ll/l5l;->h:Lcom/google/android/exoplayer2/source/j$a;

    .line 19
    .line 20
    iput-object p10, p0, Ll/l5l;->i:Ll/oj0;

    .line 21
    .line 22
    iput-object p11, p0, Ll/l5l;->l:Ll/et5;

    .line 23
    .line 24
    iput-boolean p12, p0, Ll/l5l;->m:Z

    .line 25
    .line 26
    iput p13, p0, Ll/l5l;->n:I

    .line 27
    .line 28
    iput-boolean p14, p0, Ll/l5l;->o:Z

    .line 29
    .line 30
    iput-object p15, p0, Ll/l5l;->p:Ll/bf80;

    .line 31
    .line 32
    move-wide/from16 p1, p16

    .line 33
    .line 34
    iput-wide p1, p0, Ll/l5l;->r:J

    .line 35
    .line 36
    new-instance p1, Ll/l5l$b;

    .line 37
    .line 38
    const/4 p2, 0x0

    .line 39
    invoke-direct {p1, p0, p2}, Ll/l5l$b;-><init>(Ll/l5l;Ll/l5l$a;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/l5l;->q:Ll/s5l$b;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    new-array p2, p1, [Lcom/google/android/exoplayer2/source/r;

    .line 46
    .line 47
    invoke-interface {p11, p2}, Ll/et5;->a([Lcom/google/android/exoplayer2/source/r;)Lcom/google/android/exoplayer2/source/r;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    iput-object p2, p0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 52
    .line 53
    new-instance p2, Ljava/util/IdentityHashMap;

    .line 54
    .line 55
    invoke-direct {p2}, Ljava/util/IdentityHashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p2, p0, Ll/l5l;->j:Ljava/util/IdentityHashMap;

    .line 59
    .line 60
    new-instance p2, Ll/i0j0;

    .line 61
    .line 62
    invoke-direct {p2}, Ll/i0j0;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p2, p0, Ll/l5l;->k:Ll/i0j0;

    .line 66
    .line 67
    new-array p2, p1, [Ll/s5l;

    .line 68
    .line 69
    iput-object p2, p0, Ll/l5l;->v:[Ll/s5l;

    .line 70
    .line 71
    new-array p2, p1, [Ll/s5l;

    .line 72
    .line 73
    iput-object p2, p0, Ll/l5l;->w:[Ll/s5l;

    .line 74
    .line 75
    new-array p1, p1, [[I

    .line 76
    .line 77
    iput-object p1, p0, Ll/l5l;->x:[[I

    .line 78
    .line 79
    return-void
.end method

.method public static synthetic j(Ll/l5l;)I
    .locals 1

    .line 1
    iget v0, p0, Ll/l5l;->t:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Ll/l5l;->t:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic k(Ll/l5l;)[Ll/s5l;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5l;->v:[Ll/s5l;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ll/l5l;Ll/ffj0;)Ll/ffj0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l5l;->u:Ll/ffj0;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic n(Ll/l5l;)Lcom/google/android/exoplayer2/source/h$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5l;->s:Lcom/google/android/exoplayer2/source/h$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/l5l;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5l;->b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 2
    .line 3
    return-object p0
.end method

.method public static x(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Z)Lcom/google/android/exoplayer2/k;
    .locals 10
    .param p1    # Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p1, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v2, p1, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 7
    .line 8
    iget v3, p1, Lcom/google/android/exoplayer2/k;->y:I

    .line 9
    .line 10
    iget v4, p1, Lcom/google/android/exoplayer2/k;->d:I

    .line 11
    .line 12
    iget v5, p1, Lcom/google/android/exoplayer2/k;->e:I

    .line 13
    .line 14
    iget-object v6, p1, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/google/android/exoplayer2/k;->b:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {p1, v1}, Ll/bmk0;->M(Ljava/lang/String;I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    iget v3, p0, Lcom/google/android/exoplayer2/k;->y:I

    .line 31
    .line 32
    iget v4, p0, Lcom/google/android/exoplayer2/k;->d:I

    .line 33
    .line 34
    iget v5, p0, Lcom/google/android/exoplayer2/k;->e:I

    .line 35
    .line 36
    iget-object v6, p0, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p1, p0, Lcom/google/android/exoplayer2/k;->b:Ljava/lang/String;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v4, 0x0

    .line 42
    const/4 v6, 0x0

    .line 43
    move v3, v0

    .line 44
    move v5, v4

    .line 45
    move-object p1, v6

    .line 46
    :goto_0
    invoke-static {v1}, Ll/kb00;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    iget v8, p0, Lcom/google/android/exoplayer2/k;->f:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move v8, v0

    .line 56
    :goto_1
    if-eqz p2, :cond_3

    .line 57
    .line 58
    iget v0, p0, Lcom/google/android/exoplayer2/k;->g:I

    .line 59
    .line 60
    :cond_3
    new-instance p2, Lcom/google/android/exoplayer2/k$b;

    .line 61
    .line 62
    invoke-direct {p2}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v9, p0, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p2, v9}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/k$b;->W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->k:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/k$b;->M(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/k$b;->Z(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k$b;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer2/k$b;->e0(I)Lcom/google/android/exoplayer2/k$b;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method

.method public static y(Ljava/util/List;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v2, v3, :cond_2

    .line 17
    .line 18
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 23
    .line 24
    iget-object v4, v3, Lcom/google/android/exoplayer2/drm/DrmInitData;->schemeType:Ljava/lang/String;

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    move v5, v2

    .line 29
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-ge v5, v6, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    check-cast v6, Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 40
    .line 41
    iget-object v7, v6, Lcom/google/android/exoplayer2/drm/DrmInitData;->schemeType:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v7, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-eqz v7, :cond_0

    .line 48
    .line 49
    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer2/drm/DrmInitData;->f(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-object v1
.end method

.method public static z(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1}, Ll/bmk0;->M(Ljava/lang/String;I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/kb00;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Lcom/google/android/exoplayer2/k$b;

    .line 13
    .line 14
    invoke-direct {v2}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Lcom/google/android/exoplayer2/k;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/k$b;->W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Lcom/google/android/exoplayer2/k;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/k$b;->M(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->Z(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k$b;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget v1, p0, Lcom/google/android/exoplayer2/k;->f:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget v1, p0, Lcom/google/android/exoplayer2/k;->g:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget v1, p0, Lcom/google/android/exoplayer2/k;->q:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget v1, p0, Lcom/google/android/exoplayer2/k;->r:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget v1, p0, Lcom/google/android/exoplayer2/k;->s:F

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->R(F)Lcom/google/android/exoplayer2/k$b;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget v1, p0, Lcom/google/android/exoplayer2/k;->d:I

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget p0, p0, Lcom/google/android/exoplayer2/k;->e:I

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/k$b;->e0(I)Lcom/google/android/exoplayer2/k$b;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l5l;->b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->a(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$b;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/l5l;->v:[Ll/s5l;

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    aget-object v3, v0, v2

    .line 13
    .line 14
    invoke-virtual {v3}, Ll/s5l;->e0()V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/l5l;->s:Lcom/google/android/exoplayer2/source/h$a;

    .line 22
    .line 23
    return-void
.end method

.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l5l;->v:[Ll/s5l;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_0

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-virtual {v3}, Ll/s5l;->a0()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Ll/l5l;->s:Lcom/google/android/exoplayer2/source/h$a;

    .line 16
    .line 17
    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/c$c;Z)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l5l;->v:[Ll/s5l;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    :goto_0
    if-ge v3, v1, :cond_0

    .line 7
    .line 8
    aget-object v4, v0, v3

    .line 9
    .line 10
    invoke-virtual {v4, p1, p2, p3}, Ll/s5l;->Z(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/c$c;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    and-int/2addr v2, v4

    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p0, Ll/l5l;->s:Lcom/google/android/exoplayer2/source/h$a;

    .line 19
    .line 20
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 21
    .line 22
    .line 23
    return v2
.end method

.method public c(J)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l5l;->u:Ll/ffj0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/l5l;->v:[Ll/s5l;

    .line 6
    .line 7
    array-length p1, p0

    .line 8
    const/4 p2, 0x0

    .line 9
    move v0, p2

    .line 10
    :goto_0
    if-ge v0, p1, :cond_0

    .line 11
    .line 12
    aget-object v1, p0, v0

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/s5l;->A()V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return p2

    .line 21
    :cond_1
    iget-object p0, p0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 22
    .line 23
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/r;->c(J)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/r;->d()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public e(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/r;->e(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/r;->f()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public g(JLl/nke0;)J
    .locals 4

    .line 1
    iget-object p0, p0, Ll/l5l;->w:[Ll/s5l;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/s5l;->Q()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    invoke-virtual {v2, p1, p2, p3}, Ll/s5l;->g(JLl/nke0;)J

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    return-wide p0

    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return-wide p1
.end method

.method public h(J)J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l5l;->w:[Ll/s5l;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-lez v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aget-object v0, v0, v1

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, v1}, Ll/s5l;->h0(JZ)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    :goto_0
    iget-object v2, p0, Ll/l5l;->w:[Ll/s5l;

    .line 15
    .line 16
    array-length v3, v2

    .line 17
    if-ge v1, v3, :cond_0

    .line 18
    .line 19
    aget-object v2, v2, v1

    .line 20
    .line 21
    invoke-virtual {v2, p1, p2, v0}, Ll/s5l;->h0(JZ)Z

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/l5l;->k:Ll/i0j0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/i0j0;->b()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-wide p1
.end method

.method public i()J
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    return-wide v0
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/r;->isLoading()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Ll/ffj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5l;->u:Ll/ffj0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ffj0;

    .line 8
    .line 9
    return-object p0
.end method

.method public p(Lcom/google/android/exoplayer2/source/h$a;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l5l;->s:Lcom/google/android/exoplayer2/source/h$a;

    .line 2
    .line 3
    iget-object p1, p0, Ll/l5l;->b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->g(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2, p3}, Ll/l5l;->v(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q(JLjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/c$a;",
            ">;",
            "Ljava/util/List<",
            "Ll/s5l;",
            ">;",
            "Ljava/util/List<",
            "[I>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 19
    .line 20
    .line 21
    new-instance v3, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    move v6, v5

    .line 37
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-ge v6, v7, :cond_5

    .line 42
    .line 43
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    check-cast v7, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;

    .line 48
    .line 49
    iget-object v7, v7, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->d:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    if-nez v8, :cond_0

    .line 56
    .line 57
    move-object/from16 v11, p0

    .line 58
    .line 59
    move-object/from16 v8, p4

    .line 60
    .line 61
    move-object/from16 v9, p5

    .line 62
    .line 63
    goto/16 :goto_3

    .line 64
    .line 65
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 72
    .line 73
    .line 74
    const/4 v8, 0x1

    .line 75
    move v9, v5

    .line 76
    move v10, v8

    .line 77
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    if-ge v9, v11, :cond_3

    .line 82
    .line 83
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    check-cast v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;

    .line 88
    .line 89
    iget-object v11, v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->d:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v7, v11}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v11

    .line 95
    if-eqz v11, :cond_2

    .line 96
    .line 97
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v11

    .line 101
    check-cast v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;

    .line 102
    .line 103
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v12

    .line 107
    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    iget-object v12, v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->a:Landroid/net/Uri;

    .line 111
    .line 112
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    iget-object v12, v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->b:Lcom/google/android/exoplayer2/k;

    .line 116
    .line 117
    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    iget-object v11, v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->b:Lcom/google/android/exoplayer2/k;

    .line 121
    .line 122
    iget-object v11, v11, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v11, v8}, Ll/bmk0;->L(Ljava/lang/String;I)I

    .line 125
    .line 126
    .line 127
    move-result v11

    .line 128
    if-ne v11, v8, :cond_1

    .line 129
    .line 130
    move v11, v8

    .line 131
    goto :goto_2

    .line 132
    :cond_1
    move v11, v5

    .line 133
    :goto_2
    and-int/2addr v10, v11

    .line 134
    :cond_2
    add-int/lit8 v9, v9, 0x1

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    const-string v9, "audio:"

    .line 140
    .line 141
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v12

    .line 151
    new-array v7, v5, [Landroid/net/Uri;

    .line 152
    .line 153
    invoke-static {v7}, Ll/bmk0;->k([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    check-cast v7, [Landroid/net/Uri;

    .line 158
    .line 159
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    move-object v14, v7

    .line 164
    check-cast v14, [Landroid/net/Uri;

    .line 165
    .line 166
    new-array v7, v5, [Lcom/google/android/exoplayer2/k;

    .line 167
    .line 168
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    move-object v15, v7

    .line 173
    check-cast v15, [Lcom/google/android/exoplayer2/k;

    .line 174
    .line 175
    const/16 v16, 0x0

    .line 176
    .line 177
    sget-object v17, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 178
    .line 179
    const/4 v13, 0x1

    .line 180
    move-object/from16 v11, p0

    .line 181
    .line 182
    move-wide/from16 v19, p1

    .line 183
    .line 184
    move-object/from16 v18, p6

    .line 185
    .line 186
    invoke-virtual/range {v11 .. v20}, Ll/l5l;->w(Ljava/lang/String;I[Landroid/net/Uri;[Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ljava/util/Map;J)Ll/s5l;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    invoke-static {v3}, Lcom/google/common/primitives/Ints;->n(Ljava/util/Collection;)[I

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    move-object/from16 v9, p5

    .line 195
    .line 196
    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-object/from16 v8, p4

    .line 200
    .line 201
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    iget-boolean v13, v11, Ll/l5l;->m:Z

    .line 205
    .line 206
    if-eqz v13, :cond_4

    .line 207
    .line 208
    if-eqz v10, :cond_4

    .line 209
    .line 210
    new-array v10, v5, [Lcom/google/android/exoplayer2/k;

    .line 211
    .line 212
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v10

    .line 216
    check-cast v10, [Lcom/google/android/exoplayer2/k;

    .line 217
    .line 218
    new-instance v13, Ll/dfj0;

    .line 219
    .line 220
    invoke-direct {v13, v12, v10}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 221
    .line 222
    .line 223
    filled-new-array {v13}, [Ll/dfj0;

    .line 224
    .line 225
    .line 226
    move-result-object v10

    .line 227
    new-array v12, v5, [I

    .line 228
    .line 229
    invoke-virtual {v7, v10, v5, v12}, Ll/s5l;->c0([Ll/dfj0;I[I)V

    .line 230
    .line 231
    .line 232
    :cond_4
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_5
    return-void
.end method

.method public r([Ll/u9f;[Z[Ll/xwd0;[ZJ)J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    array-length v3, v1

    .line 8
    new-array v3, v3, [I

    .line 9
    .line 10
    array-length v4, v1

    .line 11
    new-array v4, v4, [I

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    :goto_0
    array-length v7, v1

    .line 15
    if-ge v6, v7, :cond_3

    .line 16
    .line 17
    aget-object v7, v2, v6

    .line 18
    .line 19
    const/4 v8, -0x1

    .line 20
    if-nez v7, :cond_0

    .line 21
    .line 22
    move v7, v8

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v9, v0, Ll/l5l;->j:Ljava/util/IdentityHashMap;

    .line 25
    .line 26
    invoke-virtual {v9, v7}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    check-cast v7, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    :goto_1
    aput v7, v3, v6

    .line 37
    .line 38
    aput v8, v4, v6

    .line 39
    .line 40
    aget-object v7, v1, v6

    .line 41
    .line 42
    if-eqz v7, :cond_2

    .line 43
    .line 44
    invoke-interface {v7}, Ll/vfj0;->h()Ll/dfj0;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    const/4 v9, 0x0

    .line 49
    :goto_2
    iget-object v10, v0, Ll/l5l;->v:[Ll/s5l;

    .line 50
    .line 51
    array-length v11, v10

    .line 52
    if-ge v9, v11, :cond_2

    .line 53
    .line 54
    aget-object v10, v10, v9

    .line 55
    .line 56
    invoke-virtual {v10}, Ll/s5l;->m()Ll/ffj0;

    .line 57
    .line 58
    .line 59
    move-result-object v10

    .line 60
    invoke-virtual {v10, v7}, Ll/ffj0;->c(Ll/dfj0;)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    if-eq v10, v8, :cond_1

    .line 65
    .line 66
    aput v9, v4, v6

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_1
    add-int/lit8 v9, v9, 0x1

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-object v6, v0, Ll/l5l;->j:Ljava/util/IdentityHashMap;

    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/util/IdentityHashMap;->clear()V

    .line 78
    .line 79
    .line 80
    array-length v6, v1

    .line 81
    new-array v7, v6, [Ll/xwd0;

    .line 82
    .line 83
    array-length v8, v1

    .line 84
    new-array v12, v8, [Ll/xwd0;

    .line 85
    .line 86
    array-length v8, v1

    .line 87
    new-array v10, v8, [Ll/u9f;

    .line 88
    .line 89
    iget-object v8, v0, Ll/l5l;->v:[Ll/s5l;

    .line 90
    .line 91
    array-length v8, v8

    .line 92
    new-array v8, v8, [Ll/s5l;

    .line 93
    .line 94
    const/4 v9, 0x0

    .line 95
    const/4 v11, 0x0

    .line 96
    const/16 v16, 0x0

    .line 97
    .line 98
    :goto_4
    iget-object v13, v0, Ll/l5l;->v:[Ll/s5l;

    .line 99
    .line 100
    array-length v13, v13

    .line 101
    if-ge v9, v13, :cond_10

    .line 102
    .line 103
    const/4 v13, 0x0

    .line 104
    :goto_5
    array-length v14, v1

    .line 105
    if-ge v13, v14, :cond_6

    .line 106
    .line 107
    aget v14, v3, v13

    .line 108
    .line 109
    const/4 v15, 0x0

    .line 110
    if-ne v14, v9, :cond_4

    .line 111
    .line 112
    aget-object v14, v2, v13

    .line 113
    .line 114
    goto :goto_6

    .line 115
    :cond_4
    move-object v14, v15

    .line 116
    :goto_6
    aput-object v14, v12, v13

    .line 117
    .line 118
    aget v14, v4, v13

    .line 119
    .line 120
    if-ne v14, v9, :cond_5

    .line 121
    .line 122
    aget-object v15, v1, v13

    .line 123
    .line 124
    :cond_5
    aput-object v15, v10, v13

    .line 125
    .line 126
    add-int/lit8 v13, v13, 0x1

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_6
    iget-object v13, v0, Ll/l5l;->v:[Ll/s5l;

    .line 130
    .line 131
    aget-object v13, v13, v9

    .line 132
    .line 133
    move-wide/from16 v14, p5

    .line 134
    .line 135
    move-object/from16 v18, v3

    .line 136
    .line 137
    move v3, v9

    .line 138
    move v5, v11

    .line 139
    move-object v9, v13

    .line 140
    const/16 v17, 0x0

    .line 141
    .line 142
    move-object/from16 v11, p2

    .line 143
    .line 144
    move-object/from16 v13, p4

    .line 145
    .line 146
    invoke-virtual/range {v9 .. v16}, Ll/s5l;->i0([Ll/u9f;[Z[Ll/xwd0;[ZJZ)Z

    .line 147
    .line 148
    .line 149
    move-result v19

    .line 150
    move/from16 v11, v17

    .line 151
    .line 152
    move v13, v11

    .line 153
    :goto_7
    array-length v14, v1

    .line 154
    if-ge v11, v14, :cond_a

    .line 155
    .line 156
    aget-object v14, v12, v11

    .line 157
    .line 158
    aget v15, v4, v11

    .line 159
    .line 160
    if-ne v15, v3, :cond_7

    .line 161
    .line 162
    invoke-static {v14}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    aput-object v14, v7, v11

    .line 166
    .line 167
    iget-object v13, v0, Ll/l5l;->j:Ljava/util/IdentityHashMap;

    .line 168
    .line 169
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object v15

    .line 173
    invoke-virtual {v13, v14, v15}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    const/4 v13, 0x1

    .line 177
    goto :goto_9

    .line 178
    :cond_7
    aget v15, v18, v11

    .line 179
    .line 180
    if-ne v15, v3, :cond_9

    .line 181
    .line 182
    if-nez v14, :cond_8

    .line 183
    .line 184
    const/4 v15, 0x1

    .line 185
    goto :goto_8

    .line 186
    :cond_8
    move/from16 v15, v17

    .line 187
    .line 188
    :goto_8
    invoke-static {v15}, Ll/w11;->g(Z)V

    .line 189
    .line 190
    .line 191
    :cond_9
    :goto_9
    add-int/lit8 v11, v11, 0x1

    .line 192
    .line 193
    goto :goto_7

    .line 194
    :cond_a
    if-eqz v13, :cond_e

    .line 195
    .line 196
    aput-object v9, v8, v5

    .line 197
    .line 198
    add-int/lit8 v11, v5, 0x1

    .line 199
    .line 200
    if-nez v5, :cond_c

    .line 201
    .line 202
    const/4 v5, 0x1

    .line 203
    invoke-virtual {v9, v5}, Ll/s5l;->l0(Z)V

    .line 204
    .line 205
    .line 206
    if-nez v19, :cond_b

    .line 207
    .line 208
    iget-object v13, v0, Ll/l5l;->w:[Ll/s5l;

    .line 209
    .line 210
    array-length v14, v13

    .line 211
    if-eqz v14, :cond_b

    .line 212
    .line 213
    aget-object v13, v13, v17

    .line 214
    .line 215
    if-eq v9, v13, :cond_f

    .line 216
    .line 217
    :cond_b
    iget-object v9, v0, Ll/l5l;->k:Ll/i0j0;

    .line 218
    .line 219
    invoke-virtual {v9}, Ll/i0j0;->b()V

    .line 220
    .line 221
    .line 222
    move/from16 v16, v5

    .line 223
    .line 224
    goto :goto_b

    .line 225
    :cond_c
    const/4 v5, 0x1

    .line 226
    iget v13, v0, Ll/l5l;->y:I

    .line 227
    .line 228
    if-ge v3, v13, :cond_d

    .line 229
    .line 230
    move v15, v5

    .line 231
    goto :goto_a

    .line 232
    :cond_d
    move/from16 v15, v17

    .line 233
    .line 234
    :goto_a
    invoke-virtual {v9, v15}, Ll/s5l;->l0(Z)V

    .line 235
    .line 236
    .line 237
    goto :goto_b

    .line 238
    :cond_e
    move v11, v5

    .line 239
    :cond_f
    :goto_b
    add-int/lit8 v9, v3, 0x1

    .line 240
    .line 241
    move-object/from16 v3, v18

    .line 242
    .line 243
    goto/16 :goto_4

    .line 244
    .line 245
    :cond_10
    move v5, v11

    .line 246
    const/4 v3, 0x0

    .line 247
    invoke-static {v7, v3, v2, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 248
    .line 249
    .line 250
    invoke-static {v8, v5}, Ll/bmk0;->O0([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    check-cast v1, [Ll/s5l;

    .line 255
    .line 256
    iput-object v1, v0, Ll/l5l;->w:[Ll/s5l;

    .line 257
    .line 258
    iget-object v2, v0, Ll/l5l;->l:Ll/et5;

    .line 259
    .line 260
    invoke-interface {v2, v1}, Ll/et5;->a([Lcom/google/android/exoplayer2/source/r;)Lcom/google/android/exoplayer2/source/r;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iput-object v1, v0, Ll/l5l;->z:Lcom/google/android/exoplayer2/source/r;

    .line 265
    .line 266
    return-wide p5
.end method

.method public s()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l5l;->v:[Ll/s5l;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/s5l;->s()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public t(JZ)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/l5l;->w:[Ll/s5l;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-virtual {v2, p1, p2, p3}, Ll/s5l;->t(JZ)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public final u(Lcom/google/android/exoplayer2/source/hls/playlist/c;JLjava/util/List;Ljava/util/List;Ljava/util/Map;)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/hls/playlist/c;",
            "J",
            "Ljava/util/List<",
            "Ll/s5l;",
            ">;",
            "Ljava/util/List<",
            "[I>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-array v2, v1, [I

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    move v5, v4

    .line 14
    move v6, v5

    .line 15
    :goto_0
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->e:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    const/4 v8, 0x2

    .line 22
    const/4 v9, 0x1

    .line 23
    if-ge v4, v7, :cond_3

    .line 24
    .line 25
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->e:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    check-cast v7, Lcom/google/android/exoplayer2/source/hls/playlist/c$b;

    .line 32
    .line 33
    iget-object v7, v7, Lcom/google/android/exoplayer2/source/hls/playlist/c$b;->b:Lcom/google/android/exoplayer2/k;

    .line 34
    .line 35
    iget v10, v7, Lcom/google/android/exoplayer2/k;->r:I

    .line 36
    .line 37
    if-gtz v10, :cond_2

    .line 38
    .line 39
    iget-object v10, v7, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v10, v8}, Ll/bmk0;->M(Ljava/lang/String;I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    if-eqz v10, :cond_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    iget-object v7, v7, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v7, v9}, Ll/bmk0;->M(Ljava/lang/String;I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    if-eqz v7, :cond_1

    .line 55
    .line 56
    aput v9, v2, v4

    .line 57
    .line 58
    add-int/lit8 v6, v6, 0x1

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    const/4 v7, -0x1

    .line 62
    aput v7, v2, v4

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    :goto_1
    aput v8, v2, v4

    .line 66
    .line 67
    add-int/lit8 v5, v5, 0x1

    .line 68
    .line 69
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    if-lez v5, :cond_4

    .line 73
    .line 74
    move v1, v5

    .line 75
    move v4, v9

    .line 76
    move v5, v3

    .line 77
    goto :goto_3

    .line 78
    :cond_4
    if-ge v6, v1, :cond_5

    .line 79
    .line 80
    sub-int/2addr v1, v6

    .line 81
    move v4, v3

    .line 82
    move v5, v9

    .line 83
    goto :goto_3

    .line 84
    :cond_5
    move v4, v3

    .line 85
    move v5, v4

    .line 86
    :goto_3
    new-array v13, v1, [Landroid/net/Uri;

    .line 87
    .line 88
    new-array v14, v1, [Lcom/google/android/exoplayer2/k;

    .line 89
    .line 90
    new-array v6, v1, [I

    .line 91
    .line 92
    move v7, v3

    .line 93
    move v10, v7

    .line 94
    :goto_4
    iget-object v11, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->e:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v11

    .line 100
    if-ge v7, v11, :cond_9

    .line 101
    .line 102
    if-eqz v4, :cond_6

    .line 103
    .line 104
    aget v11, v2, v7

    .line 105
    .line 106
    if-ne v11, v8, :cond_8

    .line 107
    .line 108
    :cond_6
    if-eqz v5, :cond_7

    .line 109
    .line 110
    aget v11, v2, v7

    .line 111
    .line 112
    if-eq v11, v9, :cond_8

    .line 113
    .line 114
    :cond_7
    iget-object v11, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->e:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {v11, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    check-cast v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$b;

    .line 121
    .line 122
    iget-object v12, v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$b;->a:Landroid/net/Uri;

    .line 123
    .line 124
    aput-object v12, v13, v10

    .line 125
    .line 126
    iget-object v11, v11, Lcom/google/android/exoplayer2/source/hls/playlist/c$b;->b:Lcom/google/android/exoplayer2/k;

    .line 127
    .line 128
    aput-object v11, v14, v10

    .line 129
    .line 130
    add-int/lit8 v11, v10, 0x1

    .line 131
    .line 132
    aput v7, v6, v10

    .line 133
    .line 134
    move v10, v11

    .line 135
    :cond_8
    add-int/lit8 v7, v7, 0x1

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_9
    aget-object v2, v14, v3

    .line 139
    .line 140
    iget-object v2, v2, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {v2, v8}, Ll/bmk0;->L(Ljava/lang/String;I)I

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    invoke-static {v2, v9}, Ll/bmk0;->L(Ljava/lang/String;I)I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    if-eq v2, v9, :cond_a

    .line 151
    .line 152
    if-nez v2, :cond_b

    .line 153
    .line 154
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->g:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    if-eqz v7, :cond_b

    .line 161
    .line 162
    :cond_a
    if-gt v5, v9, :cond_b

    .line 163
    .line 164
    add-int v7, v2, v5

    .line 165
    .line 166
    if-lez v7, :cond_b

    .line 167
    .line 168
    move v7, v9

    .line 169
    goto :goto_5

    .line 170
    :cond_b
    move v7, v3

    .line 171
    :goto_5
    if-nez v4, :cond_c

    .line 172
    .line 173
    if-lez v2, :cond_c

    .line 174
    .line 175
    move v12, v9

    .line 176
    goto :goto_6

    .line 177
    :cond_c
    move v12, v3

    .line 178
    :goto_6
    iget-object v15, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->j:Lcom/google/android/exoplayer2/k;

    .line 179
    .line 180
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->k:Ljava/util/List;

    .line 181
    .line 182
    const-string v11, "main"

    .line 183
    .line 184
    move-object/from16 v10, p0

    .line 185
    .line 186
    move-wide/from16 v18, p2

    .line 187
    .line 188
    move-object/from16 v17, p6

    .line 189
    .line 190
    move-object/from16 v16, v4

    .line 191
    .line 192
    invoke-virtual/range {v10 .. v19}, Ll/l5l;->w(Ljava/lang/String;I[Landroid/net/Uri;[Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ljava/util/Map;J)Ll/s5l;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    move-object/from16 v8, p4

    .line 197
    .line 198
    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-object/from16 v8, p5

    .line 202
    .line 203
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    iget-boolean v6, v10, Ll/l5l;->m:Z

    .line 207
    .line 208
    if-eqz v6, :cond_13

    .line 209
    .line 210
    if-eqz v7, :cond_13

    .line 211
    .line 212
    new-instance v6, Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .line 216
    .line 217
    if-lez v5, :cond_10

    .line 218
    .line 219
    new-array v5, v1, [Lcom/google/android/exoplayer2/k;

    .line 220
    .line 221
    move v7, v3

    .line 222
    :goto_7
    if-ge v7, v1, :cond_d

    .line 223
    .line 224
    aget-object v8, v14, v7

    .line 225
    .line 226
    invoke-static {v8}, Ll/l5l;->z(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 227
    .line 228
    .line 229
    move-result-object v8

    .line 230
    aput-object v8, v5, v7

    .line 231
    .line 232
    add-int/lit8 v7, v7, 0x1

    .line 233
    .line 234
    goto :goto_7

    .line 235
    :cond_d
    new-instance v1, Ll/dfj0;

    .line 236
    .line 237
    invoke-direct {v1, v11, v5}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 238
    .line 239
    .line 240
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    if-lez v2, :cond_f

    .line 244
    .line 245
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->j:Lcom/google/android/exoplayer2/k;

    .line 246
    .line 247
    if-nez v1, :cond_e

    .line 248
    .line 249
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->g:Ljava/util/List;

    .line 250
    .line 251
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-eqz v1, :cond_f

    .line 256
    .line 257
    :cond_e
    new-instance v1, Ll/dfj0;

    .line 258
    .line 259
    aget-object v2, v14, v3

    .line 260
    .line 261
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->j:Lcom/google/android/exoplayer2/k;

    .line 262
    .line 263
    invoke-static {v2, v5, v3}, Ll/l5l;->x(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Z)Lcom/google/android/exoplayer2/k;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    filled-new-array {v2}, [Lcom/google/android/exoplayer2/k;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    const-string v5, "main:audio"

    .line 272
    .line 273
    invoke-direct {v1, v5, v2}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 274
    .line 275
    .line 276
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    :cond_f
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->k:Ljava/util/List;

    .line 280
    .line 281
    if-eqz v0, :cond_12

    .line 282
    .line 283
    move v1, v3

    .line 284
    :goto_8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    if-ge v1, v2, :cond_12

    .line 289
    .line 290
    new-instance v2, Ljava/lang/StringBuilder;

    .line 291
    .line 292
    const-string v5, "main:cc:"

    .line 293
    .line 294
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v2

    .line 304
    new-instance v5, Ll/dfj0;

    .line 305
    .line 306
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v7

    .line 310
    check-cast v7, Lcom/google/android/exoplayer2/k;

    .line 311
    .line 312
    filled-new-array {v7}, [Lcom/google/android/exoplayer2/k;

    .line 313
    .line 314
    .line 315
    move-result-object v7

    .line 316
    invoke-direct {v5, v2, v7}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 317
    .line 318
    .line 319
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    add-int/lit8 v1, v1, 0x1

    .line 323
    .line 324
    goto :goto_8

    .line 325
    :cond_10
    new-array v2, v1, [Lcom/google/android/exoplayer2/k;

    .line 326
    .line 327
    move v5, v3

    .line 328
    :goto_9
    if-ge v5, v1, :cond_11

    .line 329
    .line 330
    aget-object v7, v14, v5

    .line 331
    .line 332
    iget-object v8, v0, Lcom/google/android/exoplayer2/source/hls/playlist/c;->j:Lcom/google/android/exoplayer2/k;

    .line 333
    .line 334
    invoke-static {v7, v8, v9}, Ll/l5l;->x(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Z)Lcom/google/android/exoplayer2/k;

    .line 335
    .line 336
    .line 337
    move-result-object v7

    .line 338
    aput-object v7, v2, v5

    .line 339
    .line 340
    add-int/lit8 v5, v5, 0x1

    .line 341
    .line 342
    goto :goto_9

    .line 343
    :cond_11
    new-instance v0, Ll/dfj0;

    .line 344
    .line 345
    invoke-direct {v0, v11, v2}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 346
    .line 347
    .line 348
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    :cond_12
    new-instance v0, Ll/dfj0;

    .line 352
    .line 353
    new-instance v1, Lcom/google/android/exoplayer2/k$b;

    .line 354
    .line 355
    invoke-direct {v1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 356
    .line 357
    .line 358
    const-string v2, "ID3"

    .line 359
    .line 360
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    const-string v2, "application/id3"

    .line 365
    .line 366
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 371
    .line 372
    .line 373
    move-result-object v1

    .line 374
    filled-new-array {v1}, [Lcom/google/android/exoplayer2/k;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    const-string v2, "main:id3"

    .line 379
    .line 380
    invoke-direct {v0, v2, v1}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 381
    .line 382
    .line 383
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    new-array v1, v3, [Ll/dfj0;

    .line 387
    .line 388
    invoke-interface {v6, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    check-cast v1, [Ll/dfj0;

    .line 393
    .line 394
    invoke-interface {v6, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    filled-new-array {v0}, [I

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v4, v1, v3, v0}, Ll/s5l;->c0([Ll/dfj0;I[I)V

    .line 403
    .line 404
    .line 405
    :cond_13
    return-void
.end method

.method public final v(J)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/l5l;->b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 4
    .line 5
    invoke-interface {v1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->e()Lcom/google/android/exoplayer2/source/hls/playlist/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/google/android/exoplayer2/source/hls/playlist/c;

    .line 14
    .line 15
    iget-boolean v2, v0, Ll/l5l;->o:Z

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object v2, v1, Lcom/google/android/exoplayer2/source/hls/playlist/c;->m:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v2}, Ll/l5l;->y(Ljava/util/List;)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    :goto_0
    move-object v6, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    sget-object v2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :goto_1
    iget-object v2, v1, Lcom/google/android/exoplayer2/source/hls/playlist/c;->e:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object v7, v1, Lcom/google/android/exoplayer2/source/hls/playlist/c;->g:Ljava/util/List;

    .line 37
    .line 38
    iget-object v10, v1, Lcom/google/android/exoplayer2/source/hls/playlist/c;->h:Ljava/util/List;

    .line 39
    .line 40
    const/4 v11, 0x0

    .line 41
    iput v11, v0, Ll/l5l;->t:I

    .line 42
    .line 43
    new-instance v4, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v5, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    move-wide/from16 v2, p1

    .line 56
    .line 57
    invoke-virtual/range {v0 .. v6}, Ll/l5l;->u(Lcom/google/android/exoplayer2/source/hls/playlist/c;JLjava/util/List;Ljava/util/List;Ljava/util/Map;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    move-object/from16 v0, p0

    .line 61
    .line 62
    move-wide/from16 v1, p1

    .line 63
    .line 64
    move-object v3, v7

    .line 65
    invoke-virtual/range {v0 .. v6}, Ll/l5l;->q(JLjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    .line 66
    .line 67
    .line 68
    move-object v12, v4

    .line 69
    move-object v13, v5

    .line 70
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v1, v0, Ll/l5l;->y:I

    .line 75
    .line 76
    move v14, v11

    .line 77
    :goto_2
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-ge v14, v1, :cond_2

    .line 82
    .line 83
    invoke-interface {v10, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    move-object v15, v1

    .line 88
    check-cast v15, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;

    .line 89
    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v2, "subtitle:"

    .line 93
    .line 94
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v2, ":"

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    iget-object v2, v15, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->d:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iget-object v2, v15, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->a:Landroid/net/Uri;

    .line 115
    .line 116
    filled-new-array {v2}, [Landroid/net/Uri;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    iget-object v2, v15, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->b:Lcom/google/android/exoplayer2/k;

    .line 121
    .line 122
    filled-new-array {v2}, [Lcom/google/android/exoplayer2/k;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    const/4 v5, 0x0

    .line 127
    move-object v7, v6

    .line 128
    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 129
    .line 130
    const/4 v2, 0x3

    .line 131
    move-wide/from16 v8, p1

    .line 132
    .line 133
    invoke-virtual/range {v0 .. v9}, Ll/l5l;->w(Ljava/lang/String;I[Landroid/net/Uri;[Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ljava/util/Map;J)Ll/s5l;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    move-object v6, v7

    .line 138
    filled-new-array {v14}, [I

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    new-instance v3, Ll/dfj0;

    .line 149
    .line 150
    iget-object v4, v15, Lcom/google/android/exoplayer2/source/hls/playlist/c$a;->b:Lcom/google/android/exoplayer2/k;

    .line 151
    .line 152
    filled-new-array {v4}, [Lcom/google/android/exoplayer2/k;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-direct {v3, v1, v4}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 157
    .line 158
    .line 159
    filled-new-array {v3}, [Ll/dfj0;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    new-array v3, v11, [I

    .line 164
    .line 165
    invoke-virtual {v2, v1, v11, v3}, Ll/s5l;->c0([Ll/dfj0;I[I)V

    .line 166
    .line 167
    .line 168
    add-int/lit8 v14, v14, 0x1

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_2
    new-array v1, v11, [Ll/s5l;

    .line 172
    .line 173
    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, [Ll/s5l;

    .line 178
    .line 179
    iput-object v1, v0, Ll/l5l;->v:[Ll/s5l;

    .line 180
    .line 181
    new-array v1, v11, [[I

    .line 182
    .line 183
    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    check-cast v1, [[I

    .line 188
    .line 189
    iput-object v1, v0, Ll/l5l;->x:[[I

    .line 190
    .line 191
    iget-object v1, v0, Ll/l5l;->v:[Ll/s5l;

    .line 192
    .line 193
    array-length v1, v1

    .line 194
    iput v1, v0, Ll/l5l;->t:I

    .line 195
    .line 196
    move v1, v11

    .line 197
    :goto_3
    iget v2, v0, Ll/l5l;->y:I

    .line 198
    .line 199
    iget-object v3, v0, Ll/l5l;->v:[Ll/s5l;

    .line 200
    .line 201
    if-ge v1, v2, :cond_3

    .line 202
    .line 203
    aget-object v2, v3, v1

    .line 204
    .line 205
    const/4 v3, 0x1

    .line 206
    invoke-virtual {v2, v3}, Ll/s5l;->l0(Z)V

    .line 207
    .line 208
    .line 209
    add-int/lit8 v1, v1, 0x1

    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_3
    array-length v1, v3

    .line 213
    :goto_4
    if-ge v11, v1, :cond_4

    .line 214
    .line 215
    aget-object v2, v3, v11

    .line 216
    .line 217
    invoke-virtual {v2}, Ll/s5l;->A()V

    .line 218
    .line 219
    .line 220
    add-int/lit8 v11, v11, 0x1

    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_4
    iget-object v1, v0, Ll/l5l;->v:[Ll/s5l;

    .line 224
    .line 225
    iput-object v1, v0, Ll/l5l;->w:[Ll/s5l;

    .line 226
    .line 227
    return-void
.end method

.method public final w(Ljava/lang/String;I[Landroid/net/Uri;[Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ljava/util/Map;J)Ll/s5l;
    .locals 15
    .param p5    # Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I[",
            "Landroid/net/Uri;",
            "[",
            "Lcom/google/android/exoplayer2/k;",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;J)",
            "Ll/s5l;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/f5l;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l5l;->a:Ll/h5l;

    .line 4
    .line 5
    iget-object v2, p0, Ll/l5l;->b:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 6
    .line 7
    iget-object v5, p0, Ll/l5l;->c:Ll/g5l;

    .line 8
    .line 9
    iget-object v6, p0, Ll/l5l;->d:Ll/pgj0;

    .line 10
    .line 11
    iget-object v7, p0, Ll/l5l;->k:Ll/i0j0;

    .line 12
    .line 13
    iget-wide v8, p0, Ll/l5l;->r:J

    .line 14
    .line 15
    iget-object v11, p0, Ll/l5l;->p:Ll/bf80;

    .line 16
    .line 17
    const/4 v12, 0x0

    .line 18
    move-object/from16 v3, p3

    .line 19
    .line 20
    move-object/from16 v4, p4

    .line 21
    .line 22
    move-object/from16 v10, p6

    .line 23
    .line 24
    invoke-direct/range {v0 .. v12}, Ll/f5l;-><init>(Ll/h5l;Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;[Landroid/net/Uri;[Lcom/google/android/exoplayer2/k;Ll/g5l;Ll/pgj0;Ll/i0j0;JLjava/util/List;Ll/bf80;Ll/zb5;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/s5l;

    .line 28
    .line 29
    iget-object v3, p0, Ll/l5l;->q:Ll/s5l$b;

    .line 30
    .line 31
    iget-object v6, p0, Ll/l5l;->i:Ll/oj0;

    .line 32
    .line 33
    iget-object v10, p0, Ll/l5l;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 34
    .line 35
    iget-object v11, p0, Ll/l5l;->f:Lcom/google/android/exoplayer2/drm/b$a;

    .line 36
    .line 37
    iget-object v12, p0, Ll/l5l;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 38
    .line 39
    iget-object v13, p0, Ll/l5l;->h:Lcom/google/android/exoplayer2/source/j$a;

    .line 40
    .line 41
    iget v14, p0, Ll/l5l;->n:I

    .line 42
    .line 43
    move/from16 v2, p2

    .line 44
    .line 45
    move-object/from16 v9, p5

    .line 46
    .line 47
    move-object/from16 v5, p7

    .line 48
    .line 49
    move-wide/from16 v7, p8

    .line 50
    .line 51
    move-object v4, v0

    .line 52
    move-object v0, v1

    .line 53
    move-object/from16 v1, p1

    .line 54
    .line 55
    invoke-direct/range {v0 .. v14}, Ll/s5l;-><init>(Ljava/lang/String;ILl/s5l$b;Ll/f5l;Ljava/util/Map;Ll/oj0;JLcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;I)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method
