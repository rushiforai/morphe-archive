.class public final Lcom/google/android/exoplayer2/source/dash/DashMediaSource;
.super Lcom/google/android/exoplayer2/source/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$c;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$f;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$d;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$h;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$g;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$b;,
        Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public A:Landroid/net/Uri;

.field public B:Ll/h4c;

.field public C:Z

.field public D:J

.field public E:J

.field public F:J

.field public G:I

.field public H:J

.field public I:I

.field public final a:Lcom/google/android/exoplayer2/n;

.field public final b:Z

.field public final c:Ll/g6c$a;

.field public final d:Lcom/google/android/exoplayer2/source/dash/a$a;

.field public final e:Ll/et5;

.field public final f:Lcom/google/android/exoplayer2/drm/c;

.field public final g:Lcom/google/android/exoplayer2/upstream/c;

.field public final h:Ll/hs2;

.field public final i:J

.field public final j:J

.field public final k:Lcom/google/android/exoplayer2/source/j$a;

.field public final l:Lcom/google/android/exoplayer2/upstream/d$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+",
            "Ll/h4c;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;

.field public final n:Ljava/lang/Object;

.field public final o:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/google/android/exoplayer2/source/dash/b;",
            ">;"
        }
    .end annotation
.end field

.field public final p:Ljava/lang/Runnable;

.field public final q:Ljava/lang/Runnable;

.field public final r:Lcom/google/android/exoplayer2/source/dash/d$b;

.field public final s:Ll/vtv;

.field public t:Ll/g6c;

.field public u:Lcom/google/android/exoplayer2/upstream/Loader;

.field public v:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public w:Ljava/io/IOException;

.field public x:Landroid/os/Handler;

.field public y:Lcom/google/android/exoplayer2/n$g;

.field public z:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "goog.exo.dash"

    .line 2
    .line 3
    invoke-static {v0}, Ll/t9f;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n;Ll/h4c;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/dash/a$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;JJ)V
    .locals 0
    .param p2    # Ll/h4c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/g6c$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/google/android/exoplayer2/upstream/d$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/n;",
            "Ll/h4c;",
            "Ll/g6c$a;",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+",
            "Ll/h4c;",
            ">;",
            "Lcom/google/android/exoplayer2/source/dash/a$a;",
            "Ll/et5;",
            "Ll/zb5;",
            "Lcom/google/android/exoplayer2/drm/c;",
            "Lcom/google/android/exoplayer2/upstream/c;",
            "JJ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->a:Lcom/google/android/exoplayer2/n;

    .line 5
    .line 6
    iget-object p7, p1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 7
    .line 8
    iput-object p7, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y:Lcom/google/android/exoplayer2/n$g;

    .line 9
    .line 10
    iget-object p7, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 11
    .line 12
    invoke-static {p7}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p7

    .line 16
    check-cast p7, Lcom/google/android/exoplayer2/n$h;

    .line 17
    .line 18
    iget-object p7, p7, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 19
    .line 20
    iput-object p7, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z:Landroid/net/Uri;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A:Landroid/net/Uri;

    .line 27
    .line 28
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 29
    .line 30
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->c:Ll/g6c$a;

    .line 31
    .line 32
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->l:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 33
    .line 34
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->d:Lcom/google/android/exoplayer2/source/dash/a$a;

    .line 35
    .line 36
    iput-object p8, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->f:Lcom/google/android/exoplayer2/drm/c;

    .line 37
    .line 38
    iput-object p9, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 39
    .line 40
    iput-wide p10, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->i:J

    .line 41
    .line 42
    iput-wide p12, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->j:J

    .line 43
    .line 44
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->e:Ll/et5;

    .line 45
    .line 46
    new-instance p1, Ll/hs2;

    .line 47
    .line 48
    invoke-direct {p1}, Ll/hs2;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->h:Ll/hs2;

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    if-eqz p2, :cond_0

    .line 55
    .line 56
    move p3, p1

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 p3, 0x0

    .line 59
    :goto_0
    iput-boolean p3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->b:Z

    .line 60
    .line 61
    const/4 p4, 0x0

    .line 62
    invoke-virtual {p0, p4}, Lcom/google/android/exoplayer2/source/a;->createEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/j$a;

    .line 63
    .line 64
    .line 65
    move-result-object p5

    .line 66
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 67
    .line 68
    new-instance p5, Ljava/lang/Object;

    .line 69
    .line 70
    invoke-direct {p5}, Ljava/lang/Object;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->n:Ljava/lang/Object;

    .line 74
    .line 75
    new-instance p5, Landroid/util/SparseArray;

    .line 76
    .line 77
    invoke-direct {p5}, Landroid/util/SparseArray;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 81
    .line 82
    new-instance p5, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$c;

    .line 83
    .line 84
    invoke-direct {p5, p0, p4}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$c;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;Lcom/google/android/exoplayer2/source/dash/DashMediaSource$a;)V

    .line 85
    .line 86
    .line 87
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->r:Lcom/google/android/exoplayer2/source/dash/d$b;

    .line 88
    .line 89
    const-wide p5, -0x7fffffffffffffffL    # -4.9E-324

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    iput-wide p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H:J

    .line 95
    .line 96
    iput-wide p5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 97
    .line 98
    if-eqz p3, :cond_1

    .line 99
    .line 100
    iget-boolean p2, p2, Ll/h4c;->d:Z

    .line 101
    .line 102
    xor-int/2addr p1, p2

    .line 103
    invoke-static {p1}, Ll/w11;->g(Z)V

    .line 104
    .line 105
    .line 106
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->m:Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;

    .line 107
    .line 108
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->p:Ljava/lang/Runnable;

    .line 109
    .line 110
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->q:Ljava/lang/Runnable;

    .line 111
    .line 112
    new-instance p1, Ll/vtv$a;

    .line 113
    .line 114
    invoke-direct {p1}, Ll/vtv$a;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->s:Ll/vtv;

    .line 118
    .line 119
    return-void

    .line 120
    :cond_1
    new-instance p1, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;

    .line 121
    .line 122
    invoke-direct {p1, p0, p4}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;Lcom/google/android/exoplayer2/source/dash/DashMediaSource$a;)V

    .line 123
    .line 124
    .line 125
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->m:Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;

    .line 126
    .line 127
    new-instance p1, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$f;

    .line 128
    .line 129
    invoke-direct {p1, p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$f;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)V

    .line 130
    .line 131
    .line 132
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->s:Ll/vtv;

    .line 133
    .line 134
    new-instance p1, Ll/j4c;

    .line 135
    .line 136
    invoke-direct {p1, p0}, Ll/j4c;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)V

    .line 137
    .line 138
    .line 139
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->p:Ljava/lang/Runnable;

    .line 140
    .line 141
    new-instance p1, Ll/k4c;

    .line 142
    .line 143
    invoke-direct {p1, p0}, Ll/k4c;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)V

    .line 144
    .line 145
    .line 146
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->q:Ljava/lang/Runnable;

    .line 147
    .line 148
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n;Ll/h4c;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/dash/a$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;JJLcom/google/android/exoplayer2/source/dash/DashMediaSource$a;)V
    .locals 0

    .line 149
    invoke-direct/range {p0 .. p13}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;-><init>(Lcom/google/android/exoplayer2/n;Ll/h4c;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/dash/a$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;JJ)V

    return-void
.end method

.method private G()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->p:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C:Z

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->n:Ljava/lang/Object;

    .line 30
    .line 31
    monitor-enter v0

    .line 32
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z:Landroid/net/Uri;

    .line 33
    .line 34
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C:Z

    .line 37
    .line 38
    new-instance v0, Lcom/google/android/exoplayer2/upstream/d;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->t:Ll/g6c;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->l:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 43
    .line 44
    const/4 v4, 0x4

    .line 45
    invoke-direct {v0, v2, v1, v4, v3}, Lcom/google/android/exoplayer2/upstream/d;-><init>(Ll/g6c;Landroid/net/Uri;ILcom/google/android/exoplayer2/upstream/d$a;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->m:Lcom/google/android/exoplayer2/source/dash/DashMediaSource$e;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 51
    .line 52
    invoke-interface {v2, v4}, Lcom/google/android/exoplayer2/upstream/c;->d(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F(Lcom/google/android/exoplayer2/upstream/d;Lcom/google/android/exoplayer2/upstream/Loader$b;I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G()V

    return-void
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y(Ljava/io/IOException;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)Lcom/google/android/exoplayer2/upstream/Loader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)Ljava/io/IOException;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->w:Ljava/io/IOException;

    .line 2
    .line 3
    return-object p0
.end method

.method public static h(Ll/mr60;JJ)J
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p3

    .line 6
    .line 7
    iget-wide v5, v0, Ll/mr60;->b:J

    .line 8
    .line 9
    invoke-static {v5, v6}, Ll/bmk0;->J0(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->l(Ll/mr60;)Z

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    const-wide v8, 0x7fffffffffffffffL

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    const/4 v10, 0x0

    .line 23
    move v11, v10

    .line 24
    :goto_0
    iget-object v12, v0, Ll/mr60;->c:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v12

    .line 30
    if-ge v11, v12, :cond_6

    .line 31
    .line 32
    iget-object v12, v0, Ll/mr60;->c:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v12

    .line 38
    check-cast v12, Ll/y70;

    .line 39
    .line 40
    iget-object v13, v12, Ll/y70;->c:Ljava/util/List;

    .line 41
    .line 42
    iget v12, v12, Ll/y70;->b:I

    .line 43
    .line 44
    const/4 v14, 0x1

    .line 45
    if-eq v12, v14, :cond_0

    .line 46
    .line 47
    const/4 v15, 0x2

    .line 48
    if-eq v12, v15, :cond_0

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_0
    move v14, v10

    .line 52
    :goto_1
    if-eqz v7, :cond_1

    .line 53
    .line 54
    if-nez v14, :cond_5

    .line 55
    .line 56
    :cond_1
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v12

    .line 60
    if-eqz v12, :cond_2

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    invoke-interface {v13, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v12

    .line 67
    check-cast v12, Ll/t1d0;

    .line 68
    .line 69
    invoke-virtual {v12}, Ll/t1d0;->b()Ll/l4c;

    .line 70
    .line 71
    .line 72
    move-result-object v12

    .line 73
    if-nez v12, :cond_3

    .line 74
    .line 75
    add-long/2addr v5, v1

    .line 76
    return-wide v5

    .line 77
    :cond_3
    invoke-interface {v12, v1, v2, v3, v4}, Ll/l4c;->l(JJ)J

    .line 78
    .line 79
    .line 80
    move-result-wide v13

    .line 81
    const-wide/16 v15, 0x0

    .line 82
    .line 83
    cmp-long v15, v13, v15

    .line 84
    .line 85
    if-nez v15, :cond_4

    .line 86
    .line 87
    return-wide v5

    .line 88
    :cond_4
    invoke-interface {v12, v1, v2, v3, v4}, Ll/l4c;->e(JJ)J

    .line 89
    .line 90
    .line 91
    move-result-wide v15

    .line 92
    add-long/2addr v15, v13

    .line 93
    const-wide/16 v13, 0x1

    .line 94
    .line 95
    sub-long v13, v15, v13

    .line 96
    .line 97
    invoke-interface {v12, v13, v14}, Ll/l4c;->c(J)J

    .line 98
    .line 99
    .line 100
    move-result-wide v15

    .line 101
    add-long/2addr v15, v5

    .line 102
    invoke-interface {v12, v13, v14, v1, v2}, Ll/l4c;->d(JJ)J

    .line 103
    .line 104
    .line 105
    move-result-wide v12

    .line 106
    add-long/2addr v12, v15

    .line 107
    invoke-static {v8, v9, v12, v13}, Ljava/lang/Math;->min(JJ)J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    :cond_5
    :goto_2
    add-int/lit8 v11, v11, 0x1

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    return-wide v8
.end method

.method public static i(Ll/mr60;JJ)J
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p3

    .line 6
    .line 7
    iget-wide v5, v0, Ll/mr60;->b:J

    .line 8
    .line 9
    invoke-static {v5, v6}, Ll/bmk0;->J0(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->l(Ll/mr60;)Z

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    const/4 v8, 0x0

    .line 18
    move-wide v10, v5

    .line 19
    move v9, v8

    .line 20
    :goto_0
    iget-object v12, v0, Ll/mr60;->c:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v12

    .line 26
    if-ge v9, v12, :cond_6

    .line 27
    .line 28
    iget-object v12, v0, Ll/mr60;->c:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v12

    .line 34
    check-cast v12, Ll/y70;

    .line 35
    .line 36
    iget-object v13, v12, Ll/y70;->c:Ljava/util/List;

    .line 37
    .line 38
    iget v12, v12, Ll/y70;->b:I

    .line 39
    .line 40
    const/4 v14, 0x1

    .line 41
    if-eq v12, v14, :cond_0

    .line 42
    .line 43
    const/4 v15, 0x2

    .line 44
    if-eq v12, v15, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    move v14, v8

    .line 48
    :goto_1
    if-eqz v7, :cond_1

    .line 49
    .line 50
    if-nez v14, :cond_5

    .line 51
    .line 52
    :cond_1
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v12

    .line 56
    if-eqz v12, :cond_2

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_2
    invoke-interface {v13, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v12

    .line 63
    check-cast v12, Ll/t1d0;

    .line 64
    .line 65
    invoke-virtual {v12}, Ll/t1d0;->b()Ll/l4c;

    .line 66
    .line 67
    .line 68
    move-result-object v12

    .line 69
    if-nez v12, :cond_3

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    invoke-interface {v12, v1, v2, v3, v4}, Ll/l4c;->l(JJ)J

    .line 73
    .line 74
    .line 75
    move-result-wide v13

    .line 76
    const-wide/16 v15, 0x0

    .line 77
    .line 78
    cmp-long v13, v13, v15

    .line 79
    .line 80
    if-nez v13, :cond_4

    .line 81
    .line 82
    :goto_2
    return-wide v5

    .line 83
    :cond_4
    invoke-interface {v12, v1, v2, v3, v4}, Ll/l4c;->e(JJ)J

    .line 84
    .line 85
    .line 86
    move-result-wide v13

    .line 87
    invoke-interface {v12, v13, v14}, Ll/l4c;->c(J)J

    .line 88
    .line 89
    .line 90
    move-result-wide v12

    .line 91
    add-long/2addr v12, v5

    .line 92
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    .line 93
    .line 94
    .line 95
    move-result-wide v10

    .line 96
    :cond_5
    :goto_3
    add-int/lit8 v9, v9, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    return-wide v10
.end method

.method public static j(Ll/h4c;J)J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/h4c;->e()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/h4c;->d(I)Ll/mr60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-wide v3, v2, Ll/mr60;->b:J

    .line 14
    .line 15
    invoke-static {v3, v4}, Ll/bmk0;->J0(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-virtual {v0, v1}, Ll/h4c;->g(I)J

    .line 20
    .line 21
    .line 22
    move-result-wide v5

    .line 23
    invoke-static/range {p1 .. p2}, Ll/bmk0;->J0(J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v7

    .line 27
    iget-wide v0, v0, Ll/h4c;->a:J

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    const-wide/16 v9, 0x1388

    .line 34
    .line 35
    invoke-static {v9, v10}, Ll/bmk0;->J0(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v9

    .line 39
    const/4 v11, 0x0

    .line 40
    move v12, v11

    .line 41
    :goto_0
    iget-object v13, v2, Ll/mr60;->c:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v13}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v13

    .line 47
    if-ge v12, v13, :cond_3

    .line 48
    .line 49
    iget-object v13, v2, Ll/mr60;->c:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v13

    .line 55
    check-cast v13, Ll/y70;

    .line 56
    .line 57
    iget-object v13, v13, Ll/y70;->c:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v14

    .line 63
    if-eqz v14, :cond_0

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_0
    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v13

    .line 70
    check-cast v13, Ll/t1d0;

    .line 71
    .line 72
    invoke-virtual {v13}, Ll/t1d0;->b()Ll/l4c;

    .line 73
    .line 74
    .line 75
    move-result-object v13

    .line 76
    if-eqz v13, :cond_2

    .line 77
    .line 78
    add-long v14, v0, v3

    .line 79
    .line 80
    invoke-interface {v13, v5, v6, v7, v8}, Ll/l4c;->f(JJ)J

    .line 81
    .line 82
    .line 83
    move-result-wide v16

    .line 84
    add-long v14, v14, v16

    .line 85
    .line 86
    sub-long/2addr v14, v7

    .line 87
    const-wide/32 v16, 0x186a0

    .line 88
    .line 89
    .line 90
    sub-long v18, v9, v16

    .line 91
    .line 92
    cmp-long v13, v14, v18

    .line 93
    .line 94
    if-ltz v13, :cond_1

    .line 95
    .line 96
    cmp-long v13, v14, v9

    .line 97
    .line 98
    if-lez v13, :cond_2

    .line 99
    .line 100
    add-long v16, v9, v16

    .line 101
    .line 102
    cmp-long v13, v14, v16

    .line 103
    .line 104
    if-gez v13, :cond_2

    .line 105
    .line 106
    :cond_1
    move-wide v9, v14

    .line 107
    :cond_2
    :goto_1
    add-int/lit8 v12, v12, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    const-wide/16 v0, 0x3e8

    .line 111
    .line 112
    sget-object v2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    .line 113
    .line 114
    invoke-static {v9, v10, v0, v1, v2}, Lcom/google/common/math/LongMath;->b(JJLjava/math/RoundingMode;)J

    .line 115
    .line 116
    .line 117
    move-result-wide v0

    .line 118
    return-wide v0
.end method

.method public static l(Ll/mr60;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/mr60;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Ll/mr60;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ll/y70;

    .line 18
    .line 19
    iget v2, v2, Ll/y70;->b:I

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    if-eq v2, v3, :cond_1

    .line 23
    .line 24
    const/4 v4, 0x2

    .line 25
    if-ne v2, v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    return v3

    .line 32
    :cond_2
    return v0
.end method

.method public static m(Ll/mr60;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/mr60;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Ll/mr60;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ll/y70;

    .line 18
    .line 19
    iget-object v2, v2, Ll/y70;->c:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/t1d0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/t1d0;->b()Ll/l4c;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-interface {v2}, Ll/l4c;->k()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    :goto_1
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    return v0
.end method


# virtual methods
.method public final A(Z)V
    .locals 35

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v2, v3, :cond_1

    .line 12
    .line 13
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->keyAt(I)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iget v4, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 20
    .line 21
    if-lt v3, v4, :cond_0

    .line 22
    .line 23
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, Lcom/google/android/exoplayer2/source/dash/b;

    .line 30
    .line 31
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 32
    .line 33
    iget v6, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 34
    .line 35
    sub-int/2addr v3, v6

    .line 36
    invoke-virtual {v4, v5, v3}, Lcom/google/android/exoplayer2/source/dash/b;->L(Ll/h4c;I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Ll/h4c;->d(I)Ll/mr60;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 49
    .line 50
    invoke-virtual {v3}, Ll/h4c;->e()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    const/4 v4, 0x1

    .line 55
    sub-int/2addr v3, v4

    .line 56
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 57
    .line 58
    invoke-virtual {v5, v3}, Ll/h4c;->d(I)Ll/mr60;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 63
    .line 64
    invoke-virtual {v6, v3}, Ll/h4c;->g(I)J

    .line 65
    .line 66
    .line 67
    move-result-wide v6

    .line 68
    iget-wide v8, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 69
    .line 70
    invoke-static {v8, v9}, Ll/bmk0;->e0(J)J

    .line 71
    .line 72
    .line 73
    move-result-wide v8

    .line 74
    invoke-static {v8, v9}, Ll/bmk0;->J0(J)J

    .line 75
    .line 76
    .line 77
    move-result-wide v8

    .line 78
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 79
    .line 80
    invoke-virtual {v3, v1}, Ll/h4c;->g(I)J

    .line 81
    .line 82
    .line 83
    move-result-wide v10

    .line 84
    invoke-static {v2, v10, v11, v8, v9}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->i(Ll/mr60;JJ)J

    .line 85
    .line 86
    .line 87
    move-result-wide v10

    .line 88
    invoke-static {v5, v6, v7, v8, v9}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->h(Ll/mr60;JJ)J

    .line 89
    .line 90
    .line 91
    move-result-wide v6

    .line 92
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 93
    .line 94
    iget-boolean v3, v3, Ll/h4c;->d:Z

    .line 95
    .line 96
    if-eqz v3, :cond_2

    .line 97
    .line 98
    invoke-static {v5}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->m(Ll/mr60;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-nez v3, :cond_2

    .line 103
    .line 104
    move v3, v4

    .line 105
    goto :goto_1

    .line 106
    :cond_2
    move v3, v1

    .line 107
    :goto_1
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    if-eqz v3, :cond_3

    .line 113
    .line 114
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 115
    .line 116
    iget-wide v14, v5, Ll/h4c;->f:J

    .line 117
    .line 118
    cmp-long v5, v14, v12

    .line 119
    .line 120
    if-eqz v5, :cond_3

    .line 121
    .line 122
    invoke-static {v14, v15}, Ll/bmk0;->J0(J)J

    .line 123
    .line 124
    .line 125
    move-result-wide v14

    .line 126
    sub-long v14, v6, v14

    .line 127
    .line 128
    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->max(JJ)J

    .line 129
    .line 130
    .line 131
    move-result-wide v10

    .line 132
    :cond_3
    sub-long/2addr v6, v10

    .line 133
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 134
    .line 135
    iget-boolean v14, v5, Ll/h4c;->d:Z

    .line 136
    .line 137
    move-wide/from16 v31, v12

    .line 138
    .line 139
    if-eqz v14, :cond_6

    .line 140
    .line 141
    iget-wide v14, v5, Ll/h4c;->a:J

    .line 142
    .line 143
    cmp-long v5, v14, v31

    .line 144
    .line 145
    if-eqz v5, :cond_4

    .line 146
    .line 147
    move v1, v4

    .line 148
    :cond_4
    invoke-static {v1}, Ll/w11;->g(Z)V

    .line 149
    .line 150
    .line 151
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 152
    .line 153
    iget-wide v4, v1, Ll/h4c;->a:J

    .line 154
    .line 155
    invoke-static {v4, v5}, Ll/bmk0;->J0(J)J

    .line 156
    .line 157
    .line 158
    move-result-wide v4

    .line 159
    sub-long/2addr v8, v4

    .line 160
    sub-long/2addr v8, v10

    .line 161
    invoke-virtual {v0, v8, v9, v6, v7}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H(JJ)V

    .line 162
    .line 163
    .line 164
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 165
    .line 166
    iget-wide v4, v1, Ll/h4c;->a:J

    .line 167
    .line 168
    invoke-static {v10, v11}, Ll/bmk0;->l1(J)J

    .line 169
    .line 170
    .line 171
    move-result-wide v14

    .line 172
    add-long/2addr v4, v14

    .line 173
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y:Lcom/google/android/exoplayer2/n$g;

    .line 174
    .line 175
    iget-wide v14, v1, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 176
    .line 177
    invoke-static {v14, v15}, Ll/bmk0;->J0(J)J

    .line 178
    .line 179
    .line 180
    move-result-wide v14

    .line 181
    sub-long/2addr v8, v14

    .line 182
    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->j:J

    .line 183
    .line 184
    const-wide/16 v16, 0x2

    .line 185
    .line 186
    const-wide/16 v33, 0x0

    .line 187
    .line 188
    div-long v12, v6, v16

    .line 189
    .line 190
    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->min(JJ)J

    .line 191
    .line 192
    .line 193
    move-result-wide v12

    .line 194
    cmp-long v1, v8, v12

    .line 195
    .line 196
    move-wide/from16 v17, v4

    .line 197
    .line 198
    if-gez v1, :cond_5

    .line 199
    .line 200
    move-wide/from16 v26, v12

    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_5
    move-wide/from16 v26, v8

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_6
    const-wide/16 v33, 0x0

    .line 207
    .line 208
    move-wide/from16 v17, v31

    .line 209
    .line 210
    move-wide/from16 v26, v33

    .line 211
    .line 212
    :goto_2
    iget-wide v1, v2, Ll/mr60;->b:J

    .line 213
    .line 214
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 215
    .line 216
    .line 217
    move-result-wide v1

    .line 218
    sub-long v22, v10, v1

    .line 219
    .line 220
    new-instance v14, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$b;

    .line 221
    .line 222
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 223
    .line 224
    iget-wide v4, v1, Ll/h4c;->a:J

    .line 225
    .line 226
    iget-wide v8, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 227
    .line 228
    iget v2, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 229
    .line 230
    iget-object v10, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->a:Lcom/google/android/exoplayer2/n;

    .line 231
    .line 232
    iget-boolean v11, v1, Ll/h4c;->d:Z

    .line 233
    .line 234
    if-eqz v11, :cond_7

    .line 235
    .line 236
    iget-object v11, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y:Lcom/google/android/exoplayer2/n$g;

    .line 237
    .line 238
    :goto_3
    move-object/from16 v28, v1

    .line 239
    .line 240
    move/from16 v21, v2

    .line 241
    .line 242
    move-wide v15, v4

    .line 243
    move-wide/from16 v24, v6

    .line 244
    .line 245
    move-wide/from16 v19, v8

    .line 246
    .line 247
    move-object/from16 v29, v10

    .line 248
    .line 249
    move-object/from16 v30, v11

    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_7
    const/4 v11, 0x0

    .line 253
    goto :goto_3

    .line 254
    :goto_4
    invoke-direct/range {v14 .. v30}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$b;-><init>(JJJIJJJLl/h4c;Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/n$g;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0, v14}, Lcom/google/android/exoplayer2/source/a;->refreshSourceInfo(Lcom/google/android/exoplayer2/c0;)V

    .line 258
    .line 259
    .line 260
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->b:Z

    .line 261
    .line 262
    if-nez v1, :cond_b

    .line 263
    .line 264
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 265
    .line 266
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->q:Ljava/lang/Runnable;

    .line 267
    .line 268
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 269
    .line 270
    .line 271
    if-eqz v3, :cond_8

    .line 272
    .line 273
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 274
    .line 275
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->q:Ljava/lang/Runnable;

    .line 276
    .line 277
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 278
    .line 279
    iget-wide v4, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 280
    .line 281
    invoke-static {v4, v5}, Ll/bmk0;->e0(J)J

    .line 282
    .line 283
    .line 284
    move-result-wide v4

    .line 285
    invoke-static {v3, v4, v5}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->j(Ll/h4c;J)J

    .line 286
    .line 287
    .line 288
    move-result-wide v3

    .line 289
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 290
    .line 291
    .line 292
    :cond_8
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C:Z

    .line 293
    .line 294
    if-eqz v1, :cond_9

    .line 295
    .line 296
    invoke-direct {v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G()V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_9
    if-eqz p1, :cond_b

    .line 301
    .line 302
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 303
    .line 304
    iget-boolean v2, v1, Ll/h4c;->d:Z

    .line 305
    .line 306
    if-eqz v2, :cond_b

    .line 307
    .line 308
    iget-wide v1, v1, Ll/h4c;->e:J

    .line 309
    .line 310
    cmp-long v3, v1, v31

    .line 311
    .line 312
    if-eqz v3, :cond_b

    .line 313
    .line 314
    cmp-long v3, v1, v33

    .line 315
    .line 316
    if-nez v3, :cond_a

    .line 317
    .line 318
    const-wide/16 v1, 0x1388

    .line 319
    .line 320
    :cond_a
    iget-wide v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->D:J

    .line 321
    .line 322
    add-long/2addr v3, v1

    .line 323
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 324
    .line 325
    .line 326
    move-result-wide v1

    .line 327
    sub-long/2addr v3, v1

    .line 328
    move-wide/from16 v1, v33

    .line 329
    .line 330
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 331
    .line 332
    .line 333
    move-result-wide v1

    .line 334
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->E(J)V

    .line 335
    .line 336
    .line 337
    :cond_b
    return-void
.end method

.method public final B(Ll/llk0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/llk0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "urn:mpeg:dash:utc:direct:2014"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_7

    .line 10
    .line 11
    const-string v1, "urn:mpeg:dash:utc:direct:2012"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto :goto_3

    .line 20
    :cond_0
    const-string v1, "urn:mpeg:dash:utc:http-iso:2014"

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_6

    .line 27
    .line 28
    const-string v1, "urn:mpeg:dash:utc:http-iso:2012"

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_1
    const-string v1, "urn:mpeg:dash:utc:http-xsdate:2014"

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_5

    .line 44
    .line 45
    const-string v1, "urn:mpeg:dash:utc:http-xsdate:2012"

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const-string p1, "urn:mpeg:dash:utc:ntp:2014"

    .line 55
    .line 56
    invoke-static {v0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_4

    .line 61
    .line 62
    const-string p1, "urn:mpeg:dash:utc:ntp:2012"

    .line 63
    .line 64
    invoke-static {v0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    new-instance p1, Ljava/io/IOException;

    .line 72
    .line 73
    const-string v0, "Unsupported UTC timing scheme"

    .line 74
    .line 75
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y(Ljava/io/IOException;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->p()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    :goto_1
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$h;

    .line 87
    .line 88
    const/4 v1, 0x0

    .line 89
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$h;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource$a;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->D(Ll/llk0;Lcom/google/android/exoplayer2/upstream/d$a;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_6
    :goto_2
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$d;

    .line 97
    .line 98
    invoke-direct {v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$d;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->D(Ll/llk0;Lcom/google/android/exoplayer2/upstream/d$a;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_7
    :goto_3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C(Ll/llk0;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final C(Ll/llk0;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object p1, p1, Ll/llk0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bmk0;->Q0(Ljava/lang/String;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->E:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z(J)V
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y(Ljava/io/IOException;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final D(Ll/llk0;Lcom/google/android/exoplayer2/upstream/d$a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/llk0;",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/upstream/d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->t:Ll/g6c;

    .line 4
    .line 5
    iget-object p1, p1, Ll/llk0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v2, 0x5

    .line 12
    invoke-direct {v0, v1, p1, v2, p2}, Lcom/google/android/exoplayer2/upstream/d;-><init>(Ll/g6c;Landroid/net/Uri;ILcom/google/android/exoplayer2/upstream/d$a;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$g;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-direct {p1, p0, p2}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$g;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;Lcom/google/android/exoplayer2/source/dash/DashMediaSource$a;)V

    .line 19
    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F(Lcom/google/android/exoplayer2/upstream/d;Lcom/google/android/exoplayer2/upstream/Loader$b;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final E(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->p:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final F(Lcom/google/android/exoplayer2/upstream/d;Lcom/google/android/exoplayer2/upstream/Loader$b;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "TT;>;",
            "Lcom/google/android/exoplayer2/upstream/Loader$b<",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "TT;>;>;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer2/upstream/Loader;->n(Lcom/google/android/exoplayer2/upstream/Loader$e;Lcom/google/android/exoplayer2/upstream/Loader$b;I)J

    .line 4
    .line 5
    .line 6
    move-result-wide v5

    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 8
    .line 9
    new-instance v1, Ll/mtv;

    .line 10
    .line 11
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 12
    .line 13
    iget-object v4, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 14
    .line 15
    invoke-direct/range {v1 .. v6}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;J)V

    .line 16
    .line 17
    .line 18
    iget p1, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 19
    .line 20
    invoke-virtual {p0, v1, p1}, Lcom/google/android/exoplayer2/source/j$a;->s(Ll/mtv;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final H(JJ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p2}, Ll/bmk0;->l1(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v5

    .line 7
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->a:Lcom/google/android/exoplayer2/n;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 10
    .line 11
    iget-wide v1, v1, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 12
    .line 13
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    cmp-long v3, v1, v7

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    :goto_0
    move-wide v9, v1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 29
    .line 30
    iget-object v1, v1, Ll/h4c;->j:Ll/mre0;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-wide v1, v1, Ll/mre0;->c:J

    .line 35
    .line 36
    cmp-long v3, v1, v7

    .line 37
    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move-wide v9, v5

    .line 46
    :goto_1
    sub-long v1, p1, p3

    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/bmk0;->l1(J)J

    .line 49
    .line 50
    .line 51
    move-result-wide v1

    .line 52
    const-wide/16 v3, 0x0

    .line 53
    .line 54
    cmp-long v11, v1, v3

    .line 55
    .line 56
    if-gez v11, :cond_2

    .line 57
    .line 58
    cmp-long v11, v9, v3

    .line 59
    .line 60
    if-lez v11, :cond_2

    .line 61
    .line 62
    move-wide v1, v3

    .line 63
    :cond_2
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 64
    .line 65
    iget-wide v3, v3, Ll/h4c;->c:J

    .line 66
    .line 67
    cmp-long v11, v3, v7

    .line 68
    .line 69
    if-eqz v11, :cond_3

    .line 70
    .line 71
    add-long/2addr v1, v3

    .line 72
    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    :cond_3
    move-wide v3, v1

    .line 77
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->a:Lcom/google/android/exoplayer2/n;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 80
    .line 81
    iget-wide v1, v1, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 82
    .line 83
    cmp-long v11, v1, v7

    .line 84
    .line 85
    if-eqz v11, :cond_5

    .line 86
    .line 87
    invoke-static/range {v1 .. v6}, Ll/bmk0;->r(JJJ)J

    .line 88
    .line 89
    .line 90
    move-result-wide v3

    .line 91
    :cond_4
    :goto_2
    move-wide v13, v3

    .line 92
    goto :goto_3

    .line 93
    :cond_5
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 94
    .line 95
    iget-object v1, v1, Ll/h4c;->j:Ll/mre0;

    .line 96
    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    iget-wide v1, v1, Ll/mre0;->b:J

    .line 100
    .line 101
    cmp-long v11, v1, v7

    .line 102
    .line 103
    if-eqz v11, :cond_4

    .line 104
    .line 105
    invoke-static/range {v1 .. v6}, Ll/bmk0;->r(JJJ)J

    .line 106
    .line 107
    .line 108
    move-result-wide v3

    .line 109
    goto :goto_2

    .line 110
    :goto_3
    cmp-long v1, v13, v9

    .line 111
    .line 112
    if-lez v1, :cond_6

    .line 113
    .line 114
    move-wide v15, v13

    .line 115
    goto :goto_4

    .line 116
    :cond_6
    move-wide v15, v9

    .line 117
    :goto_4
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y:Lcom/google/android/exoplayer2/n$g;

    .line 118
    .line 119
    iget-wide v1, v1, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 120
    .line 121
    cmp-long v3, v1, v7

    .line 122
    .line 123
    if-eqz v3, :cond_7

    .line 124
    .line 125
    goto :goto_5

    .line 126
    :cond_7
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 127
    .line 128
    iget-object v2, v1, Ll/h4c;->j:Ll/mre0;

    .line 129
    .line 130
    if-eqz v2, :cond_8

    .line 131
    .line 132
    iget-wide v2, v2, Ll/mre0;->a:J

    .line 133
    .line 134
    cmp-long v4, v2, v7

    .line 135
    .line 136
    if-eqz v4, :cond_8

    .line 137
    .line 138
    move-wide v1, v2

    .line 139
    goto :goto_5

    .line 140
    :cond_8
    iget-wide v1, v1, Ll/h4c;->g:J

    .line 141
    .line 142
    cmp-long v3, v1, v7

    .line 143
    .line 144
    if-eqz v3, :cond_9

    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_9
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->i:J

    .line 148
    .line 149
    :goto_5
    cmp-long v3, v1, v13

    .line 150
    .line 151
    if-gez v3, :cond_a

    .line 152
    .line 153
    move-wide v1, v13

    .line 154
    :cond_a
    cmp-long v3, v1, v15

    .line 155
    .line 156
    if-lez v3, :cond_b

    .line 157
    .line 158
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->j:J

    .line 159
    .line 160
    const-wide/16 v3, 0x2

    .line 161
    .line 162
    div-long v3, p3, v3

    .line 163
    .line 164
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 165
    .line 166
    .line 167
    move-result-wide v1

    .line 168
    sub-long v1, p1, v1

    .line 169
    .line 170
    invoke-static {v1, v2}, Ll/bmk0;->l1(J)J

    .line 171
    .line 172
    .line 173
    move-result-wide v11

    .line 174
    invoke-static/range {v11 .. v16}, Ll/bmk0;->r(JJJ)J

    .line 175
    .line 176
    .line 177
    move-result-wide v1

    .line 178
    :cond_b
    move-wide v9, v15

    .line 179
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->a:Lcom/google/android/exoplayer2/n;

    .line 180
    .line 181
    iget-object v3, v3, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 182
    .line 183
    iget v4, v3, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 184
    .line 185
    const v5, -0x800001

    .line 186
    .line 187
    .line 188
    cmpl-float v6, v4, v5

    .line 189
    .line 190
    if-eqz v6, :cond_c

    .line 191
    .line 192
    goto :goto_6

    .line 193
    :cond_c
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 194
    .line 195
    iget-object v4, v4, Ll/h4c;->j:Ll/mre0;

    .line 196
    .line 197
    if-eqz v4, :cond_d

    .line 198
    .line 199
    iget v4, v4, Ll/mre0;->d:F

    .line 200
    .line 201
    goto :goto_6

    .line 202
    :cond_d
    move v4, v5

    .line 203
    :goto_6
    iget v3, v3, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 204
    .line 205
    cmpl-float v6, v3, v5

    .line 206
    .line 207
    if-eqz v6, :cond_e

    .line 208
    .line 209
    goto :goto_7

    .line 210
    :cond_e
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 211
    .line 212
    iget-object v3, v3, Ll/h4c;->j:Ll/mre0;

    .line 213
    .line 214
    if-eqz v3, :cond_f

    .line 215
    .line 216
    iget v3, v3, Ll/mre0;->e:F

    .line 217
    .line 218
    goto :goto_7

    .line 219
    :cond_f
    move v3, v5

    .line 220
    :goto_7
    cmpl-float v6, v4, v5

    .line 221
    .line 222
    if-nez v6, :cond_11

    .line 223
    .line 224
    cmpl-float v5, v3, v5

    .line 225
    .line 226
    if-nez v5, :cond_11

    .line 227
    .line 228
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 229
    .line 230
    iget-object v5, v5, Ll/h4c;->j:Ll/mre0;

    .line 231
    .line 232
    if-eqz v5, :cond_10

    .line 233
    .line 234
    iget-wide v5, v5, Ll/mre0;->a:J

    .line 235
    .line 236
    cmp-long v5, v5, v7

    .line 237
    .line 238
    if-nez v5, :cond_11

    .line 239
    .line 240
    :cond_10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 241
    .line 242
    move v3, v4

    .line 243
    :cond_11
    new-instance v5, Lcom/google/android/exoplayer2/n$g$a;

    .line 244
    .line 245
    invoke-direct {v5}, Lcom/google/android/exoplayer2/n$g$a;-><init>()V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v5, v1, v2}, Lcom/google/android/exoplayer2/n$g$a;->k(J)Lcom/google/android/exoplayer2/n$g$a;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v1, v13, v14}, Lcom/google/android/exoplayer2/n$g$a;->i(J)Lcom/google/android/exoplayer2/n$g$a;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-virtual {v1, v9, v10}, Lcom/google/android/exoplayer2/n$g$a;->g(J)Lcom/google/android/exoplayer2/n$g$a;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/n$g$a;->j(F)Lcom/google/android/exoplayer2/n$g$a;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/n$g$a;->h(F)Lcom/google/android/exoplayer2/n$g$a;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/n$g$a;->f()Lcom/google/android/exoplayer2/n$g;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y:Lcom/google/android/exoplayer2/n$g;

    .line 273
    .line 274
    return-void
.end method

.method public createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/fyx;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 14
    .line 15
    sub-int v8, v2, v3

    .line 16
    .line 17
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/a;->createEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/j$a;

    .line 18
    .line 19
    .line 20
    move-result-object v15

    .line 21
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/a;->createDrmEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/drm/b$a;

    .line 22
    .line 23
    .line 24
    move-result-object v13

    .line 25
    new-instance v4, Lcom/google/android/exoplayer2/source/dash/b;

    .line 26
    .line 27
    iget v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 28
    .line 29
    add-int v5, v1, v8

    .line 30
    .line 31
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 32
    .line 33
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->h:Ll/hs2;

    .line 34
    .line 35
    iget-object v9, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->d:Lcom/google/android/exoplayer2/source/dash/a$a;

    .line 36
    .line 37
    iget-object v10, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->v:Ll/pgj0;

    .line 38
    .line 39
    iget-object v12, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->f:Lcom/google/android/exoplayer2/drm/c;

    .line 40
    .line 41
    iget-object v14, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 42
    .line 43
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 44
    .line 45
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->s:Ll/vtv;

    .line 46
    .line 47
    iget-object v11, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->e:Ll/et5;

    .line 48
    .line 49
    move-wide/from16 v16, v1

    .line 50
    .line 51
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->r:Lcom/google/android/exoplayer2/source/dash/d$b;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/a;->getPlayerId()Ll/bf80;

    .line 54
    .line 55
    .line 56
    move-result-object v22

    .line 57
    move-object/from16 v20, v11

    .line 58
    .line 59
    const/4 v11, 0x0

    .line 60
    move-object/from16 v19, p2

    .line 61
    .line 62
    move-object/from16 v21, v1

    .line 63
    .line 64
    move-object/from16 v18, v3

    .line 65
    .line 66
    invoke-direct/range {v4 .. v22}, Lcom/google/android/exoplayer2/source/dash/b;-><init>(ILl/h4c;Ll/hs2;ILcom/google/android/exoplayer2/source/dash/a$a;Ll/pgj0;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;JLl/vtv;Ll/oj0;Ll/et5;Lcom/google/android/exoplayer2/source/dash/d$b;Ll/bf80;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 70
    .line 71
    iget v1, v4, Lcom/google/android/exoplayer2/source/dash/b;->a:I

    .line 72
    .line 73
    invoke-virtual {v0, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-object v4
.end method

.method public getMediaItem()Lcom/google/android/exoplayer2/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->a:Lcom/google/android/exoplayer2/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()J
    .locals 2

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, -0x1

    .line 4
    .line 5
    mul-int/lit16 p0, p0, 0x3e8

    .line 6
    .line 7
    const/16 v0, 0x1388

    .line 8
    .line 9
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-long v0, p0

    .line 14
    return-wide v0
.end method

.method public maybeThrowSourceInfoRefreshError()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->s:Ll/vtv;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/vtv;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$a;-><init>(Lcom/google/android/exoplayer2/source/dash/DashMediaSource;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/ysf0;->j(Lcom/google/android/exoplayer2/upstream/Loader;Ll/ysf0$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public prepareSourceInternal(Ll/pgj0;)V
    .locals 2
    .param p1    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->v:Ll/pgj0;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->f:Lcom/google/android/exoplayer2/drm/c;

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/a;->getPlayerId()Ll/bf80;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {p1, v0, v1}, Lcom/google/android/exoplayer2/drm/c;->d(Landroid/os/Looper;Ll/bf80;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->f:Lcom/google/android/exoplayer2/drm/c;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/google/android/exoplayer2/drm/c;->prepare()V

    .line 19
    .line 20
    .line 21
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->b:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A(Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->c:Ll/g6c$a;

    .line 31
    .line 32
    invoke-interface {p1}, Ll/g6c$a;->a()Ll/g6c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->t:Ll/g6c;

    .line 37
    .line 38
    new-instance p1, Lcom/google/android/exoplayer2/upstream/Loader;

    .line 39
    .line 40
    const-string v0, "DashMediaSource"

    .line 41
    .line 42
    invoke-direct {p1, v0}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 46
    .line 47
    invoke-static {}, Ll/bmk0;->w()Landroid/os/Handler;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public r(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-eqz v2, :cond_1

    .line 11
    .line 12
    cmp-long v0, v0, p1

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    :goto_0
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H:J

    .line 19
    .line 20
    return-void
.end method

.method public releasePeriod(Lcom/google/android/exoplayer2/source/h;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/dash/b;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/dash/b;->H()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 7
    .line 8
    iget p1, p1, Lcom/google/android/exoplayer2/source/dash/b;->a:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public releaseSourceInternal()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->t:Ll/g6c;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/upstream/Loader;->l()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->u:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 15
    .line 16
    :cond_0
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->D:J

    .line 19
    .line 20
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->E:J

    .line 21
    .line 22
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->b:Z

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move-object v2, v1

    .line 30
    :goto_0
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A:Landroid/net/Uri;

    .line 33
    .line 34
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z:Landroid/net/Uri;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->w:Ljava/io/IOException;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 46
    .line 47
    :cond_2
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 53
    .line 54
    iput v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G:I

    .line 55
    .line 56
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H:J

    .line 57
    .line 58
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->o:Landroid/util/SparseArray;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->h:Ll/hs2;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/hs2;->i()V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->f:Lcom/google/android/exoplayer2/drm/c;

    .line 69
    .line 70
    invoke-interface {p0}, Lcom/google/android/exoplayer2/drm/c;->release()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->x:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->q:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t(Lcom/google/android/exoplayer2/upstream/d;JJ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "*>;JJ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mtv;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 4
    .line 5
    iget-object v3, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 16
    .line 17
    .line 18
    move-result-wide v10

    .line 19
    move-wide v6, p2

    .line 20
    move-wide/from16 v8, p4

    .line 21
    .line 22
    invoke-direct/range {v0 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    .line 27
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 28
    .line 29
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 33
    .line 34
    iget p1, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/source/j$a;->j(Ll/mtv;I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public u(Lcom/google/android/exoplayer2/upstream/d;JJ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ll/h4c;",
            ">;JJ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mtv;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 4
    .line 5
    iget-object v3, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 16
    .line 17
    .line 18
    move-result-wide v10

    .line 19
    move-wide v6, p2

    .line 20
    move-wide/from16 v8, p4

    .line 21
    .line 22
    invoke-direct/range {v0 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    .line 27
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 28
    .line 29
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 33
    .line 34
    iget v2, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 35
    .line 36
    invoke-virtual {v1, v0, v2}, Lcom/google/android/exoplayer2/source/j$a;->m(Ll/mtv;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->e()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/h4c;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    move v1, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {v1}, Ll/h4c;->e()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :goto_0
    invoke-virtual {v0, v2}, Ll/h4c;->d(I)Ll/mr60;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget-wide v3, v3, Ll/mr60;->b:J

    .line 61
    .line 62
    move v5, v2

    .line 63
    :goto_1
    if-ge v5, v1, :cond_1

    .line 64
    .line 65
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 66
    .line 67
    invoke-virtual {v8, v5}, Ll/h4c;->d(I)Ll/mr60;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    iget-wide v8, v8, Ll/mr60;->b:J

    .line 72
    .line 73
    cmp-long v8, v8, v3

    .line 74
    .line 75
    if-gez v8, :cond_1

    .line 76
    .line 77
    add-int/lit8 v5, v5, 0x1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    iget-boolean v3, v0, Ll/h4c;->d:Z

    .line 81
    .line 82
    if-eqz v3, :cond_5

    .line 83
    .line 84
    sub-int v3, v1, v5

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/h4c;->e()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-le v3, v4, :cond_2

    .line 91
    .line 92
    const-string v0, "DashMediaSource"

    .line 93
    .line 94
    const-string v1, "Loaded out of sync manifest"

    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_2
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H:J

    .line 101
    .line 102
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    cmp-long v8, v3, v8

    .line 108
    .line 109
    if-eqz v8, :cond_4

    .line 110
    .line 111
    iget-wide v8, v0, Ll/h4c;->h:J

    .line 112
    .line 113
    const-wide/16 v10, 0x3e8

    .line 114
    .line 115
    mul-long/2addr v8, v10

    .line 116
    cmp-long v3, v8, v3

    .line 117
    .line 118
    if-gtz v3, :cond_4

    .line 119
    .line 120
    const-string v1, "DashMediaSource"

    .line 121
    .line 122
    new-instance v2, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v3, "Loaded stale dynamic manifest: "

    .line 125
    .line 126
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-wide v3, v0, Ll/h4c;->h:J

    .line 130
    .line 131
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v0, ", "

    .line 135
    .line 136
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->H:J

    .line 140
    .line 141
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v1, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :goto_2
    iget v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G:I

    .line 152
    .line 153
    add-int/lit8 v1, v0, 0x1

    .line 154
    .line 155
    iput v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G:I

    .line 156
    .line 157
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 158
    .line 159
    iget p1, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 160
    .line 161
    invoke-interface {v1, p1}, Lcom/google/android/exoplayer2/upstream/c;->d(I)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-ge v0, p1, :cond_3

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k()J

    .line 168
    .line 169
    .line 170
    move-result-wide v0

    .line 171
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->E(J)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_3
    new-instance p1, Lcom/google/android/exoplayer2/source/dash/DashManifestStaleException;

    .line 176
    .line 177
    invoke-direct {p1}, Lcom/google/android/exoplayer2/source/dash/DashManifestStaleException;-><init>()V

    .line 178
    .line 179
    .line 180
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->w:Ljava/io/IOException;

    .line 181
    .line 182
    return-void

    .line 183
    :cond_4
    iput v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->G:I

    .line 184
    .line 185
    :cond_5
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 186
    .line 187
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C:Z

    .line 188
    .line 189
    iget-boolean v0, v0, Ll/h4c;->d:Z

    .line 190
    .line 191
    and-int/2addr v0, v2

    .line 192
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->C:Z

    .line 193
    .line 194
    sub-long v2, p2, p4

    .line 195
    .line 196
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->D:J

    .line 197
    .line 198
    iput-wide p2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->E:J

    .line 199
    .line 200
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->n:Ljava/lang/Object;

    .line 201
    .line 202
    monitor-enter v2

    .line 203
    :try_start_0
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 204
    .line 205
    iget-object v0, v0, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 206
    .line 207
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z:Landroid/net/Uri;

    .line 208
    .line 209
    if-ne v0, v3, :cond_7

    .line 210
    .line 211
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 212
    .line 213
    iget-object v0, v0, Ll/h4c;->k:Landroid/net/Uri;

    .line 214
    .line 215
    if-eqz v0, :cond_6

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_6
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    :goto_3
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z:Landroid/net/Uri;

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :catchall_0
    move-exception v0

    .line 226
    move-object p0, v0

    .line 227
    goto :goto_5

    .line 228
    :cond_7
    :goto_4
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    const/4 p1, 0x1

    .line 230
    if-nez v1, :cond_a

    .line 231
    .line 232
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B:Ll/h4c;

    .line 233
    .line 234
    iget-boolean v1, v0, Ll/h4c;->d:Z

    .line 235
    .line 236
    if-eqz v1, :cond_9

    .line 237
    .line 238
    iget-object p1, v0, Ll/h4c;->i:Ll/llk0;

    .line 239
    .line 240
    if-eqz p1, :cond_8

    .line 241
    .line 242
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->B(Ll/llk0;)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->p()V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_9
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A(Z)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_a
    iget v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 255
    .line 256
    add-int/2addr v0, v5

    .line 257
    iput v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->I:I

    .line 258
    .line 259
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A(Z)V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :goto_5
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 264
    throw p0
.end method

.method public v(Lcom/google/android/exoplayer2/upstream/d;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ll/h4c;",
            ">;JJ",
            "Ljava/io/IOException;",
            "I)",
            "Lcom/google/android/exoplayer2/upstream/Loader$c;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p6

    .line 2
    .line 3
    new-instance v2, Ll/mtv;

    .line 4
    .line 5
    iget-wide v3, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 6
    .line 7
    iget-object v5, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v7

    .line 17
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 18
    .line 19
    .line 20
    move-result-wide v12

    .line 21
    move-wide/from16 v8, p2

    .line 22
    .line 23
    move-wide/from16 v10, p4

    .line 24
    .line 25
    invoke-direct/range {v2 .. v13}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Ll/ktx;

    .line 29
    .line 30
    iget v4, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 31
    .line 32
    invoke-direct {v3, v4}, Ll/ktx;-><init>(I)V

    .line 33
    .line 34
    .line 35
    new-instance v4, Lcom/google/android/exoplayer2/upstream/c$c;

    .line 36
    .line 37
    move/from16 v5, p7

    .line 38
    .line 39
    invoke-direct {v4, v2, v3, v1, v5}, Lcom/google/android/exoplayer2/upstream/c$c;-><init>(Ll/mtv;Ll/ktx;Ljava/io/IOException;I)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 43
    .line 44
    invoke-interface {v3, v4}, Lcom/google/android/exoplayer2/upstream/c;->a(Lcom/google/android/exoplayer2/upstream/c$c;)J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    cmp-long v5, v3, v5

    .line 54
    .line 55
    if-nez v5, :cond_0

    .line 56
    .line 57
    sget-object v3, Lcom/google/android/exoplayer2/upstream/Loader;->g:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 v5, 0x0

    .line 61
    invoke-static {v5, v3, v4}, Lcom/google/android/exoplayer2/upstream/Loader;->h(ZJ)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    :goto_0
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/upstream/Loader$c;->c()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    xor-int/lit8 v5, v4, 0x1

    .line 70
    .line 71
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 72
    .line 73
    iget v7, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 74
    .line 75
    invoke-virtual {v6, v2, v7, v1, v5}, Lcom/google/android/exoplayer2/source/j$a;->q(Ll/mtv;ILjava/io/IOException;Z)V

    .line 76
    .line 77
    .line 78
    if-nez v4, :cond_1

    .line 79
    .line 80
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 81
    .line 82
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 83
    .line 84
    invoke-interface {p0, v0, v1}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-object v3
.end method

.method public w(Lcom/google/android/exoplayer2/upstream/d;JJ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ljava/lang/Long;",
            ">;JJ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mtv;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 4
    .line 5
    iget-object v3, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 16
    .line 17
    .line 18
    move-result-wide v10

    .line 19
    move-wide v6, p2

    .line 20
    move-wide/from16 v8, p4

    .line 21
    .line 22
    invoke-direct/range {v0 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    .line 27
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 28
    .line 29
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 33
    .line 34
    iget v2, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 35
    .line 36
    invoke-virtual {v1, v0, v2}, Lcom/google/android/exoplayer2/source/j$a;->m(Ll/mtv;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->e()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ljava/lang/Long;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    sub-long/2addr v0, p2

    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->z(J)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public x(Lcom/google/android/exoplayer2/upstream/d;JJLjava/io/IOException;)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ljava/lang/Long;",
            ">;JJ",
            "Ljava/io/IOException;",
            ")",
            "Lcom/google/android/exoplayer2/upstream/Loader$c;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p6

    .line 6
    .line 7
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 8
    .line 9
    new-instance v4, Ll/mtv;

    .line 10
    .line 11
    iget-wide v5, v1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 12
    .line 13
    iget-object v7, v1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v8

    .line 19
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object v9

    .line 23
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 24
    .line 25
    .line 26
    move-result-wide v14

    .line 27
    move-wide/from16 v10, p2

    .line 28
    .line 29
    move-wide/from16 v12, p4

    .line 30
    .line 31
    invoke-direct/range {v4 .. v15}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 32
    .line 33
    .line 34
    iget v5, v1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 35
    .line 36
    const/4 v6, 0x1

    .line 37
    invoke-virtual {v3, v4, v5, v2, v6}, Lcom/google/android/exoplayer2/source/j$a;->q(Ll/mtv;ILjava/io/IOException;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->g:Lcom/google/android/exoplayer2/upstream/c;

    .line 41
    .line 42
    iget-wide v4, v1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 43
    .line 44
    invoke-interface {v3, v4, v5}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->y(Ljava/io/IOException;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Lcom/google/android/exoplayer2/upstream/Loader;->f:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 51
    .line 52
    return-object v0
.end method

.method public final y(Ljava/io/IOException;)V
    .locals 2

    .line 1
    const-string v0, "DashMediaSource"

    .line 2
    .line 3
    const-string v1, "Failed to resolve time offset."

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final z(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->F:J

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;->A(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
