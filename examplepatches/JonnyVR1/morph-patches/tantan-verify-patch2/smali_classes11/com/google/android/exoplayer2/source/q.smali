.class public Lcom/google/android/exoplayer2/source/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qfj0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/q$b;,
        Lcom/google/android/exoplayer2/source/q$c;,
        Lcom/google/android/exoplayer2/source/q$d;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public A:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public B:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public C:J

.field public D:Z

.field public E:Z

.field public F:J

.field public G:Z

.field public final a:Lcom/google/android/exoplayer2/source/p;

.field public final b:Lcom/google/android/exoplayer2/source/q$b;

.field public final c:Ll/yuf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yuf0<",
            "Lcom/google/android/exoplayer2/source/q$c;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/google/android/exoplayer2/drm/c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Lcom/google/android/exoplayer2/drm/b$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Lcom/google/android/exoplayer2/source/q$d;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Lcom/google/android/exoplayer2/drm/DrmSession;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:I

.field public j:[J

.field public k:[J

.field public l:[I

.field public m:[I

.field public n:[J

.field public o:[Ll/qfj0$a;

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:J

.field public u:J

.field public v:J

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Ll/oj0;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;)V
    .locals 0
    .param p2    # Lcom/google/android/exoplayer2/drm/c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/google/android/exoplayer2/drm/b$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->d:Lcom/google/android/exoplayer2/drm/c;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/q;->e:Lcom/google/android/exoplayer2/drm/b$a;

    .line 7
    .line 8
    new-instance p2, Lcom/google/android/exoplayer2/source/p;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Lcom/google/android/exoplayer2/source/p;-><init>(Ll/oj0;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/exoplayer2/source/q$b;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/google/android/exoplayer2/source/q$b;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->b:Lcom/google/android/exoplayer2/source/q$b;

    .line 21
    .line 22
    const/16 p1, 0x3e8

    .line 23
    .line 24
    iput p1, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 25
    .line 26
    new-array p2, p1, [J

    .line 27
    .line 28
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->j:[J

    .line 29
    .line 30
    new-array p2, p1, [J

    .line 31
    .line 32
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 33
    .line 34
    new-array p2, p1, [J

    .line 35
    .line 36
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 37
    .line 38
    new-array p2, p1, [I

    .line 39
    .line 40
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 41
    .line 42
    new-array p2, p1, [I

    .line 43
    .line 44
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 45
    .line 46
    new-array p1, p1, [Ll/qfj0$a;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->o:[Ll/qfj0$a;

    .line 49
    .line 50
    new-instance p1, Ll/yuf0;

    .line 51
    .line 52
    new-instance p2, Ll/wwd0;

    .line 53
    .line 54
    invoke-direct {p2}, Ll/wwd0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-direct {p1, p2}, Ll/yuf0;-><init>(Ll/a16;)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 61
    .line 62
    const-wide/high16 p1, -0x8000000000000000L

    .line 63
    .line 64
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 65
    .line 66
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/q;->u:J

    .line 67
    .line 68
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/q;->v:J

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/q;->y:Z

    .line 72
    .line 73
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/q;->x:Z

    .line 74
    .line 75
    return-void
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/source/q$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q$c;->b:Lcom/google/android/exoplayer2/drm/c$b;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/drm/c$b;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static k(Ll/oj0;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;)Lcom/google/android/exoplayer2/source/q;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/q;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/google/android/exoplayer2/drm/c;

    .line 8
    .line 9
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Lcom/google/android/exoplayer2/drm/b$a;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/exoplayer2/source/q;-><init>(Ll/oj0;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static l(Ll/oj0;)Lcom/google/android/exoplayer2/source/q;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/q;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1, v1}, Lcom/google/android/exoplayer2/source/q;-><init>(Ll/oj0;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public final declared-synchronized A()J
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->u:J

    .line 3
    .line 4
    iget v2, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 5
    .line 6
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/source/q;->B(I)J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return-wide v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public final B(I)J
    .locals 7

    .line 1
    const-wide/high16 v0, -0x8000000000000000L

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-wide v0

    .line 6
    :cond_0
    add-int/lit8 v2, p1, -0x1

    .line 7
    .line 8
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    :goto_0
    if-ge v3, p1, :cond_3

    .line 14
    .line 15
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 16
    .line 17
    aget-wide v5, v4, v2

    .line 18
    .line 19
    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 24
    .line 25
    aget v4, v4, v2

    .line 26
    .line 27
    and-int/lit8 v4, v4, 0x1

    .line 28
    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    return-wide v0

    .line 32
    :cond_1
    add-int/lit8 v2, v2, -0x1

    .line 33
    .line 34
    const/4 v4, -0x1

    .line 35
    if-ne v2, v4, :cond_2

    .line 36
    .line 37
    iget v2, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 38
    .line 39
    add-int/lit8 v2, v2, -0x1

    .line 40
    .line 41
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    return-wide v0
.end method

.method public final C()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final D(I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iget p0, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 5
    .line 6
    if-ge v0, p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sub-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public final declared-synchronized E(JZ)I
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->H()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v7, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 16
    .line 17
    aget-wide v3, v0, v2

    .line 18
    .line 19
    cmp-long v0, p1, v3

    .line 20
    .line 21
    if-gez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    move-object v1, p0

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->v:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 26
    .line 27
    cmp-long v0, p1, v0

    .line 28
    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    if-eqz p3, :cond_2

    .line 32
    .line 33
    :try_start_1
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 34
    .line 35
    iget p2, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    sub-int/2addr p1, p2

    .line 38
    monitor-exit p0

    .line 39
    return p1

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    move-object v1, p0

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    :try_start_2
    iget p3, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 45
    .line 46
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 47
    .line 48
    sub-int v3, p3, v0

    .line 49
    .line 50
    const/4 v6, 0x1

    .line 51
    move-object v1, p0

    .line 52
    move-wide v4, p1

    .line 53
    :try_start_3
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/source/q;->v(IIJZ)I

    .line 54
    .line 55
    .line 56
    move-result p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 57
    const/4 p1, -0x1

    .line 58
    if-ne p0, p1, :cond_3

    .line 59
    .line 60
    monitor-exit v1

    .line 61
    return v7

    .line 62
    :cond_3
    monitor-exit v1

    .line 63
    return p0

    .line 64
    :catchall_1
    move-exception v0

    .line 65
    :goto_0
    move-object p1, v0

    .line 66
    goto :goto_2

    .line 67
    :catchall_2
    move-exception v0

    .line 68
    move-object v1, p0

    .line 69
    goto :goto_0

    .line 70
    :goto_1
    monitor-exit v1

    .line 71
    return v7

    .line 72
    :goto_2
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 73
    throw p1
.end method

.method public final declared-synchronized F()Lcom/google/android/exoplayer2/k;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->y:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    :goto_0
    monitor-exit p0

    .line 11
    return-object v0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public final G()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final H()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 2
    .line 3
    iget p0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final I()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->z:Z

    .line 3
    .line 4
    return-void
.end method

.method public final declared-synchronized J()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->w:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized K(Z)Z
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->H()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    if-eq p1, v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    :cond_1
    :goto_0
    monitor-exit p0

    .line 28
    return v1

    .line 29
    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p1, v0}, Ll/yuf0;->f(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/google/android/exoplayer2/source/q$c;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/q$c;->a:Lcom/google/android/exoplayer2/k;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    if-eq p1, v0, :cond_3

    .line 46
    .line 47
    monitor-exit p0

    .line 48
    return v1

    .line 49
    :cond_3
    :try_start_2
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->L(I)Z

    .line 56
    .line 57
    .line 58
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 59
    monitor-exit p0

    .line 60
    return p1

    .line 61
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    throw p1
.end method

.method public final L(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/google/android/exoplayer2/drm/DrmSession;->getState()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x4

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 13
    .line 14
    aget p1, v0, p1

    .line 15
    .line 16
    const/high16 v0, 0x40000000    # 2.0f

    .line 17
    .line 18
    and-int/2addr p1, v0

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 22
    .line 23
    invoke-interface {p0}, Lcom/google/android/exoplayer2/drm/DrmSession;->c()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public M()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/google/android/exoplayer2/drm/DrmSession;->getState()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/google/android/exoplayer2/drm/DrmSession;->a()Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/google/android/exoplayer2/drm/DrmSession$DrmSessionException;

    .line 24
    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public final N(Lcom/google/android/exoplayer2/k;Ll/p1j;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-eqz v1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    iget-object v0, v0, Lcom/google/android/exoplayer2/k;->o:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 13
    .line 14
    :goto_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/google/android/exoplayer2/k;->o:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->d:Lcom/google/android/exoplayer2/drm/c;

    .line 19
    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    invoke-interface {v3, p1}, Lcom/google/android/exoplayer2/drm/c;->c(Lcom/google/android/exoplayer2/k;)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k;->c(I)Lcom/google/android/exoplayer2/k;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    goto :goto_2

    .line 31
    :cond_2
    move-object v3, p1

    .line 32
    :goto_2
    iput-object v3, p2, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 35
    .line 36
    iput-object v3, p2, Ll/p1j;->a:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->d:Lcom/google/android/exoplayer2/drm/c;

    .line 39
    .line 40
    if-nez v3, :cond_3

    .line 41
    .line 42
    goto :goto_3

    .line 43
    :cond_3
    if-nez v1, :cond_4

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->d:Lcom/google/android/exoplayer2/drm/c;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/q;->e:Lcom/google/android/exoplayer2/drm/b$a;

    .line 57
    .line 58
    invoke-interface {v1, v2, p1}, Lcom/google/android/exoplayer2/drm/c;->a(Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 63
    .line 64
    iput-object p1, p2, Ll/p1j;->a:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->e:Lcom/google/android/exoplayer2/drm/b$a;

    .line 69
    .line 70
    invoke-interface {v0, p0}, Lcom/google/android/exoplayer2/drm/DrmSession;->b(Lcom/google/android/exoplayer2/drm/b$a;)V

    .line 71
    .line 72
    .line 73
    :cond_5
    :goto_3
    return-void
.end method

.method public final declared-synchronized O(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;ZZLcom/google/android/exoplayer2/source/q$b;)I
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->d:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->H()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x4

    .line 10
    const/4 v2, -0x3

    .line 11
    const/4 v3, -0x5

    .line 12
    if-nez v0, :cond_4

    .line 13
    .line 14
    if-nez p4, :cond_3

    .line 15
    .line 16
    iget-boolean p4, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 17
    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    if-nez p3, :cond_1

    .line 26
    .line 27
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;

    .line 28
    .line 29
    if-eq p2, p3, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto/16 :goto_3

    .line 34
    .line 35
    :cond_1
    :goto_0
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    check-cast p2, Lcom/google/android/exoplayer2/k;

    .line 40
    .line 41
    invoke-virtual {p0, p2, p1}, Lcom/google/android/exoplayer2/source/q;->N(Lcom/google/android/exoplayer2/k;Ll/p1j;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    monitor-exit p0

    .line 45
    return v3

    .line 46
    :cond_2
    monitor-exit p0

    .line 47
    return v2

    .line 48
    :cond_3
    :goto_1
    const/4 p1, 0x4

    .line 49
    :try_start_1
    invoke-virtual {p2, p1}, Ll/ah3;->t(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return v1

    .line 54
    :cond_4
    :try_start_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {v0, v4}, Ll/yuf0;->f(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/google/android/exoplayer2/source/q$c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/q$c;->a:Lcom/google/android/exoplayer2/k;

    .line 67
    .line 68
    if-nez p3, :cond_a

    .line 69
    .line 70
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;

    .line 71
    .line 72
    if-eq v0, p3, :cond_5

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_5
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->L(I)Z

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    const/4 v0, 0x1

    .line 86
    if-nez p3, :cond_6

    .line 87
    .line 88
    iput-boolean v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->d:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    .line 90
    monitor-exit p0

    .line 91
    return v2

    .line 92
    :cond_6
    :try_start_3
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 93
    .line 94
    aget p3, p3, p1

    .line 95
    .line 96
    invoke-virtual {p2, p3}, Ll/ah3;->t(I)V

    .line 97
    .line 98
    .line 99
    iget p3, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 100
    .line 101
    iget v2, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 102
    .line 103
    sub-int/2addr v2, v0

    .line 104
    if-ne p3, v2, :cond_8

    .line 105
    .line 106
    if-nez p4, :cond_7

    .line 107
    .line 108
    iget-boolean p3, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 109
    .line 110
    if-eqz p3, :cond_8

    .line 111
    .line 112
    :cond_7
    const/high16 p3, 0x20000000

    .line 113
    .line 114
    invoke-virtual {p2, p3}, Ll/ah3;->h(I)V

    .line 115
    .line 116
    .line 117
    :cond_8
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 118
    .line 119
    aget-wide v2, p3, p1

    .line 120
    .line 121
    iput-wide v2, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 122
    .line 123
    iget-wide p3, p0, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 124
    .line 125
    cmp-long p3, v2, p3

    .line 126
    .line 127
    if-gez p3, :cond_9

    .line 128
    .line 129
    const/high16 p3, -0x80000000

    .line 130
    .line 131
    invoke-virtual {p2, p3}, Ll/ah3;->h(I)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 135
    .line 136
    aget p2, p2, p1

    .line 137
    .line 138
    iput p2, p5, Lcom/google/android/exoplayer2/source/q$b;->a:I

    .line 139
    .line 140
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 141
    .line 142
    aget-wide p3, p2, p1

    .line 143
    .line 144
    iput-wide p3, p5, Lcom/google/android/exoplayer2/source/q$b;->b:J

    .line 145
    .line 146
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->o:[Ll/qfj0$a;

    .line 147
    .line 148
    aget-object p1, p2, p1

    .line 149
    .line 150
    iput-object p1, p5, Lcom/google/android/exoplayer2/source/q$b;->c:Ll/qfj0$a;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 151
    .line 152
    monitor-exit p0

    .line 153
    return v1

    .line 154
    :cond_a
    :goto_2
    :try_start_4
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/source/q;->N(Lcom/google/android/exoplayer2/k;Ll/p1j;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 155
    .line 156
    .line 157
    monitor-exit p0

    .line 158
    return v3

    .line 159
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 160
    throw p1
.end method

.method public final declared-synchronized P()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->H()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->j:[J

    .line 15
    .line 16
    aget-wide v0, v1, v0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->C:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    :goto_0
    monitor-exit p0

    .line 24
    return-wide v0

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method public Q()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->T()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public R(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;IZ)I
    .locals 9
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    and-int/lit8 v0, p3, 0x2

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move v6, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v6, v1

    .line 10
    :goto_0
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/q;->b:Lcom/google/android/exoplayer2/source/q$b;

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    move-object v4, p1

    .line 14
    move-object v5, p2

    .line 15
    move v7, p4

    .line 16
    invoke-virtual/range {v3 .. v8}, Lcom/google/android/exoplayer2/source/q;->O(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;ZZLcom/google/android/exoplayer2/source/q$b;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 p1, -0x4

    .line 21
    if-ne p0, p1, :cond_4

    .line 22
    .line 23
    invoke-virtual {v5}, Ll/ah3;->p()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_4

    .line 28
    .line 29
    and-int/lit8 p1, p3, 0x1

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    move v1, v2

    .line 34
    :cond_1
    and-int/lit8 p1, p3, 0x4

    .line 35
    .line 36
    if-nez p1, :cond_3

    .line 37
    .line 38
    iget-object p1, v3, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    iget-object p2, v3, Lcom/google/android/exoplayer2/source/q;->b:Lcom/google/android/exoplayer2/source/q$b;

    .line 43
    .line 44
    invoke-virtual {p1, v5, p2}, Lcom/google/android/exoplayer2/source/p;->f(Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;Lcom/google/android/exoplayer2/source/q$b;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    iget-object p2, v3, Lcom/google/android/exoplayer2/source/q;->b:Lcom/google/android/exoplayer2/source/q$b;

    .line 49
    .line 50
    invoke-virtual {p1, v5, p2}, Lcom/google/android/exoplayer2/source/p;->m(Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;Lcom/google/android/exoplayer2/source/q$b;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    :goto_1
    if-nez v1, :cond_4

    .line 54
    .line 55
    iget p1, v3, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 56
    .line 57
    add-int/2addr p1, v2

    .line 58
    iput p1, v3, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 59
    .line 60
    :cond_4
    return p0
.end method

.method public S()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->V(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->T()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->e:Lcom/google/android/exoplayer2/drm/b$a;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/drm/DrmSession;->b(Lcom/google/android/exoplayer2/drm/b$a;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/q;->h:Lcom/google/android/exoplayer2/drm/DrmSession;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/q;->g:Lcom/google/android/exoplayer2/k;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final U()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->V(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public V(Z)V
    .locals 4
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/p;->n()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 8
    .line 9
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 10
    .line 11
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 12
    .line 13
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->x:Z

    .line 17
    .line 18
    const-wide/high16 v2, -0x8000000000000000L

    .line 19
    .line 20
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 21
    .line 22
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/q;->u:J

    .line 23
    .line 24
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/q;->v:J

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 27
    .line 28
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/yuf0;->c()V

    .line 31
    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->A:Lcom/google/android/exoplayer2/k;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 39
    .line 40
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->y:Z

    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final declared-synchronized W()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/p;->o()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public final declared-synchronized X(I)Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->W()V

    .line 3
    .line 4
    .line 5
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 6
    .line 7
    if-lt p1, v0, :cond_1

    .line 8
    .line 9
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 10
    .line 11
    add-int/2addr v1, v0

    .line 12
    if-le p1, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-wide/high16 v1, -0x8000000000000000L

    .line 16
    .line 17
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 18
    .line 19
    sub-int/2addr p1, v0

    .line 20
    iput p1, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    monitor-exit p0

    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw p1
.end method

.method public final declared-synchronized Y(JZ)Z
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->W()V

    .line 3
    .line 4
    .line 5
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->H()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v7, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 19
    .line 20
    aget-wide v3, v0, v2

    .line 21
    .line 22
    cmp-long v0, p1, v3

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->v:J

    .line 27
    .line 28
    cmp-long v0, p1, v0

    .line 29
    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    if-nez p3, :cond_1

    .line 33
    .line 34
    :cond_0
    move-object v1, p0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    iget p3, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 37
    .line 38
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 39
    .line 40
    sub-int v3, p3, v0

    .line 41
    .line 42
    const/4 v6, 0x1

    .line 43
    move-object v1, p0

    .line 44
    move-wide v4, p1

    .line 45
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/source/q;->v(IIJZ)I

    .line 46
    .line 47
    .line 48
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    const/4 p1, -0x1

    .line 50
    if-ne p0, p1, :cond_2

    .line 51
    .line 52
    monitor-exit v1

    .line 53
    return v7

    .line 54
    :cond_2
    :try_start_2
    iput-wide v4, v1, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 55
    .line 56
    iget p1, v1, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 57
    .line 58
    add-int/2addr p1, p0

    .line 59
    iput p1, v1, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    monitor-exit v1

    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :catchall_0
    move-exception v0

    .line 65
    :goto_0
    move-object p0, v0

    .line 66
    goto :goto_2

    .line 67
    :catchall_1
    move-exception v0

    .line 68
    move-object v1, p0

    .line 69
    goto :goto_0

    .line 70
    :goto_1
    monitor-exit v1

    .line 71
    return v7

    .line 72
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 73
    throw p0
.end method

.method public final Z(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->F:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/q;->F:J

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->I()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public a(JIIILl/qfj0$a;)V
    .locals 11
    .param p6    # Ll/qfj0$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->z:Z

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->A:Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    invoke-static {v1}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/google/android/exoplayer2/k;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/source/q;->b(Lcom/google/android/exoplayer2/k;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    and-int/lit8 v1, p3, 0x1

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    move v4, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v4, v2

    .line 25
    :goto_0
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/q;->x:Z

    .line 26
    .line 27
    if-eqz v5, :cond_3

    .line 28
    .line 29
    if-nez v4, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/q;->x:Z

    .line 33
    .line 34
    :cond_3
    iget-wide v5, p0, Lcom/google/android/exoplayer2/source/q;->F:J

    .line 35
    .line 36
    add-long/2addr v5, p1

    .line 37
    iget-boolean v7, p0, Lcom/google/android/exoplayer2/source/q;->D:Z

    .line 38
    .line 39
    if-eqz v7, :cond_6

    .line 40
    .line 41
    iget-wide v7, p0, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 42
    .line 43
    cmp-long v7, v5, v7

    .line 44
    .line 45
    if-gez v7, :cond_4

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_4
    if-nez v1, :cond_6

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->E:Z

    .line 51
    .line 52
    if-nez v1, :cond_5

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v7, "Overriding unexpected non-sync sample for format: "

    .line 57
    .line 58
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 62
    .line 63
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v7, "SampleQueue"

    .line 71
    .line 72
    invoke-static {v7, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iput-boolean v3, p0, Lcom/google/android/exoplayer2/source/q;->E:Z

    .line 76
    .line 77
    :cond_5
    or-int/lit8 v1, p3, 0x1

    .line 78
    .line 79
    move v3, v1

    .line 80
    goto :goto_1

    .line 81
    :cond_6
    move v3, p3

    .line 82
    :goto_1
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->G:Z

    .line 83
    .line 84
    if-eqz v1, :cond_9

    .line 85
    .line 86
    if-eqz v4, :cond_8

    .line 87
    .line 88
    invoke-virtual {p0, v5, v6}, Lcom/google/android/exoplayer2/source/q;->h(J)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_7

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_7
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/q;->G:Z

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_8
    :goto_2
    return-void

    .line 99
    :cond_9
    :goto_3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/p;->e()J

    .line 102
    .line 103
    .line 104
    move-result-wide v1

    .line 105
    int-to-long v7, p4

    .line 106
    sub-long/2addr v1, v7

    .line 107
    move/from16 v7, p5

    .line 108
    .line 109
    int-to-long v7, v7

    .line 110
    sub-long/2addr v1, v7

    .line 111
    move-wide v9, v5

    .line 112
    move-wide v4, v1

    .line 113
    move-wide v1, v9

    .line 114
    move-object v0, p0

    .line 115
    move v6, p4

    .line 116
    move-object/from16 v7, p6

    .line 117
    .line 118
    invoke-virtual/range {v0 .. v7}, Lcom/google/android/exoplayer2/source/q;->i(JIJILl/qfj0$a;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final a0(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/q;->t:J

    .line 2
    .line 3
    return-void
.end method

.method public final b(Lcom/google/android/exoplayer2/k;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->w(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->z:Z

    .line 7
    .line 8
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->A:Lcom/google/android/exoplayer2/k;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->b0(Lcom/google/android/exoplayer2/k;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->f:Lcom/google/android/exoplayer2/source/q$d;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, v0}, Lcom/google/android/exoplayer2/source/q$d;->a(Lcom/google/android/exoplayer2/k;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final declared-synchronized b0(Lcom/google/android/exoplayer2/k;)Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->y:Z

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    invoke-static {p1, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return v0

    .line 15
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/yuf0;->h()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/yuf0;->g()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/google/android/exoplayer2/source/q$c;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/google/android/exoplayer2/source/q$c;->a:Lcom/google/android/exoplayer2/k;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer2/k;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/yuf0;->g()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/google/android/exoplayer2/source/q$c;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/q$c;->a:Lcom/google/android/exoplayer2/k;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 55
    .line 56
    :goto_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v1, p1}, Ll/kb00;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/q;->D:Z

    .line 67
    .line 68
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->E:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    monitor-exit p0

    .line 71
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    throw p1
.end method

.method public final c(Ll/e6c;IZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/p;->p(Ll/e6c;IZ)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final c0(Lcom/google/android/exoplayer2/source/q$d;)V
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/source/q$d;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/q;->f:Lcom/google/android/exoplayer2/source/q$d;

    .line 2
    .line 3
    return-void
.end method

.method public final declared-synchronized d0(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    if-ltz p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 5
    .line 6
    add-int/2addr v0, p1

    .line 7
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 20
    .line 21
    add-int/2addr v0, p1

    .line 22
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public final e0(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/q;->C:J

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/ig60;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/p;->q(Ll/ig60;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->G:Z

    .line 3
    .line 4
    return-void
.end method

.method public final declared-synchronized h(J)Z
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/q;->u:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    cmp-long p1, p1, v3

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    move v1, v2

    .line 15
    :cond_0
    monitor-exit p0

    .line 16
    return v1

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->A()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    cmp-long v0, v3, p1

    .line 24
    .line 25
    if-ltz v0, :cond_2

    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return v1

    .line 29
    :cond_2
    :try_start_2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/q;->j(J)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget p2, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 34
    .line 35
    add-int/2addr p2, p1

    .line 36
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/source/q;->t(I)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return v2

    .line 41
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 42
    throw p1
.end method

.method public final declared-synchronized i(JIJILl/qfj0$a;)V
    .locals 8
    .param p7    # Ll/qfj0$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    sub-int/2addr v0, v1

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 14
    .line 15
    aget-wide v4, v3, v0

    .line 16
    .line 17
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 18
    .line 19
    aget v0, v3, v0

    .line 20
    .line 21
    int-to-long v6, v0

    .line 22
    add-long/2addr v4, v6

    .line 23
    cmp-long v0, v4, p4

    .line 24
    .line 25
    if-gtz v0, :cond_0

    .line 26
    .line 27
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v2

    .line 30
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto/16 :goto_4

    .line 36
    .line 37
    :cond_1
    :goto_1
    const/high16 v0, 0x20000000

    .line 38
    .line 39
    and-int/2addr v0, p3

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    move v0, v1

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v0, v2

    .line 45
    :goto_2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 46
    .line 47
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/q;->v:J

    .line 48
    .line 49
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    iput-wide v3, p0, Lcom/google/android/exoplayer2/source/q;->v:J

    .line 54
    .line 55
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 62
    .line 63
    aput-wide p1, v3, v0

    .line 64
    .line 65
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 66
    .line 67
    aput-wide p4, p1, v0

    .line 68
    .line 69
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 70
    .line 71
    aput p6, p1, v0

    .line 72
    .line 73
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 74
    .line 75
    aput p3, p1, v0

    .line 76
    .line 77
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->o:[Ll/qfj0$a;

    .line 78
    .line 79
    aput-object p7, p1, v0

    .line 80
    .line 81
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->j:[J

    .line 82
    .line 83
    iget-wide p2, p0, Lcom/google/android/exoplayer2/source/q;->C:J

    .line 84
    .line 85
    aput-wide p2, p1, v0

    .line 86
    .line 87
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/yuf0;->h()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/yuf0;->g()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/google/android/exoplayer2/source/q$c;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/q$c;->a:Lcom/google/android/exoplayer2/k;

    .line 104
    .line 105
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/k;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_5

    .line 112
    .line 113
    :cond_3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->d:Lcom/google/android/exoplayer2/drm/c;

    .line 114
    .line 115
    if-eqz p1, :cond_4

    .line 116
    .line 117
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->e:Lcom/google/android/exoplayer2/drm/b$a;

    .line 118
    .line 119
    iget-object p3, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 120
    .line 121
    invoke-interface {p1, p2, p3}, Lcom/google/android/exoplayer2/drm/c;->b(Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/drm/c$b;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    goto :goto_3

    .line 126
    :cond_4
    sget-object p1, Lcom/google/android/exoplayer2/drm/c$b;->a:Lcom/google/android/exoplayer2/drm/c$b;

    .line 127
    .line 128
    :goto_3
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->G()I

    .line 131
    .line 132
    .line 133
    move-result p3

    .line 134
    new-instance p4, Lcom/google/android/exoplayer2/source/q$c;

    .line 135
    .line 136
    iget-object p5, p0, Lcom/google/android/exoplayer2/source/q;->B:Lcom/google/android/exoplayer2/k;

    .line 137
    .line 138
    invoke-static {p5}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p5

    .line 142
    check-cast p5, Lcom/google/android/exoplayer2/k;

    .line 143
    .line 144
    const/4 p6, 0x0

    .line 145
    invoke-direct {p4, p5, p1, p6}, Lcom/google/android/exoplayer2/source/q$c;-><init>(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/drm/c$b;Lcom/google/android/exoplayer2/source/q$a;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2, p3, p4}, Ll/yuf0;->b(ILjava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    :cond_5
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 152
    .line 153
    add-int/2addr p1, v1

    .line 154
    iput p1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 155
    .line 156
    iget p2, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 157
    .line 158
    if-ne p1, p2, :cond_6

    .line 159
    .line 160
    add-int/lit16 p1, p2, 0x3e8

    .line 161
    .line 162
    new-array p3, p1, [J

    .line 163
    .line 164
    new-array p4, p1, [J

    .line 165
    .line 166
    new-array p5, p1, [J

    .line 167
    .line 168
    new-array p6, p1, [I

    .line 169
    .line 170
    new-array p7, p1, [I

    .line 171
    .line 172
    new-array v0, p1, [Ll/qfj0$a;

    .line 173
    .line 174
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 175
    .line 176
    sub-int/2addr p2, v1

    .line 177
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 178
    .line 179
    invoke-static {v3, v1, p4, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 183
    .line 184
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 185
    .line 186
    invoke-static {v1, v3, p5, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 190
    .line 191
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 192
    .line 193
    invoke-static {v1, v3, p6, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 194
    .line 195
    .line 196
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 197
    .line 198
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 199
    .line 200
    invoke-static {v1, v3, p7, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    .line 202
    .line 203
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->o:[Ll/qfj0$a;

    .line 204
    .line 205
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 206
    .line 207
    invoke-static {v1, v3, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/q;->j:[J

    .line 211
    .line 212
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 213
    .line 214
    invoke-static {v1, v3, p3, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 215
    .line 216
    .line 217
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 218
    .line 219
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 220
    .line 221
    invoke-static {v3, v2, p4, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    .line 223
    .line 224
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 225
    .line 226
    invoke-static {v3, v2, p5, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    .line 228
    .line 229
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 230
    .line 231
    invoke-static {v3, v2, p6, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 235
    .line 236
    invoke-static {v3, v2, p7, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 237
    .line 238
    .line 239
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->o:[Ll/qfj0$a;

    .line 240
    .line 241
    invoke-static {v3, v2, v0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    .line 243
    .line 244
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->j:[J

    .line 245
    .line 246
    invoke-static {v3, v2, p3, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 247
    .line 248
    .line 249
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 250
    .line 251
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 252
    .line 253
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 254
    .line 255
    iput-object p7, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 256
    .line 257
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/q;->o:[Ll/qfj0$a;

    .line 258
    .line 259
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/q;->j:[J

    .line 260
    .line 261
    iput v2, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 262
    .line 263
    iput p1, p0, Lcom/google/android/exoplayer2/source/q;->i:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    .line 265
    :cond_6
    monitor-exit p0

    .line 266
    return-void

    .line 267
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 268
    throw p1
.end method

.method public final j(J)I
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    :cond_0
    :goto_0
    iget v2, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 10
    .line 11
    if-le v0, v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 14
    .line 15
    aget-wide v3, v2, v1

    .line 16
    .line 17
    cmp-long v2, v3, p1

    .line 18
    .line 19
    if-ltz v2, :cond_1

    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    add-int/lit8 v1, v1, -0x1

    .line 24
    .line 25
    const/4 v2, -0x1

    .line 26
    if-ne v1, v2, :cond_0

    .line 27
    .line 28
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 29
    .line 30
    add-int/lit8 v1, v1, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return v0
.end method

.method public final declared-synchronized m(JZZ)J
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 3
    .line 4
    const-wide/16 v1, -0x1

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 9
    .line 10
    iget v5, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 11
    .line 12
    aget-wide v6, v3, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 13
    .line 14
    cmp-long v3, p1, v6

    .line 15
    .line 16
    if-gez v3, :cond_1

    .line 17
    .line 18
    :cond_0
    move-object v4, p0

    .line 19
    goto :goto_2

    .line 20
    :cond_1
    if-eqz p4, :cond_2

    .line 21
    .line 22
    :try_start_1
    iget p4, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    if-eq p4, v0, :cond_2

    .line 25
    .line 26
    add-int/lit8 v0, p4, 0x1

    .line 27
    .line 28
    :cond_2
    move-object v4, p0

    .line 29
    move-wide v7, p1

    .line 30
    move v9, p3

    .line 31
    move v6, v0

    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p1, v0

    .line 35
    move-object v4, p0

    .line 36
    goto :goto_3

    .line 37
    :goto_0
    :try_start_2
    invoke-virtual/range {v4 .. v9}, Lcom/google/android/exoplayer2/source/q;->v(IIJZ)I

    .line 38
    .line 39
    .line 40
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 41
    const/4 p1, -0x1

    .line 42
    if-ne p0, p1, :cond_3

    .line 43
    .line 44
    monitor-exit v4

    .line 45
    return-wide v1

    .line 46
    :cond_3
    :try_start_3
    invoke-virtual {v4, p0}, Lcom/google/android/exoplayer2/source/q;->p(I)J

    .line 47
    .line 48
    .line 49
    move-result-wide p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 50
    monitor-exit v4

    .line 51
    return-wide p0

    .line 52
    :catchall_1
    move-exception v0

    .line 53
    :goto_1
    move-object p1, v0

    .line 54
    goto :goto_3

    .line 55
    :catchall_2
    move-exception v0

    .line 56
    move-object v4, p0

    .line 57
    goto :goto_1

    .line 58
    :goto_2
    monitor-exit v4

    .line 59
    return-wide v1

    .line 60
    :goto_3
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 61
    throw p1
.end method

.method public final declared-synchronized n()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->p(I)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return-wide v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 18
    throw v0
.end method

.method public declared-synchronized o()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->s:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/q;->p(I)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return-wide v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 18
    throw v0
.end method

.method public final p(I)J
    .locals 4
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->u:J

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->B(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->u:J

    .line 12
    .line 13
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 14
    .line 15
    sub-int/2addr v0, p1

    .line 16
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 17
    .line 18
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 19
    .line 20
    add-int/2addr v0, p1

    .line 21
    iput v0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 22
    .line 23
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 24
    .line 25
    add-int/2addr v1, p1

    .line 26
    iput v1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 27
    .line 28
    iget v2, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 29
    .line 30
    if-lt v1, v2, :cond_0

    .line 31
    .line 32
    sub-int/2addr v1, v2

    .line 33
    iput v1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 34
    .line 35
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 36
    .line 37
    sub-int/2addr v1, p1

    .line 38
    iput v1, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 39
    .line 40
    if-gez v1, :cond_1

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput p1, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ll/yuf0;->e(I)V

    .line 48
    .line 49
    .line 50
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 51
    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 59
    .line 60
    :cond_2
    add-int/lit8 p1, p1, -0x1

    .line 61
    .line 62
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 63
    .line 64
    aget-wide v1, v0, p1

    .line 65
    .line 66
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 67
    .line 68
    aget p0, p0, p1

    .line 69
    .line 70
    int-to-long p0, p0

    .line 71
    add-long/2addr v1, p0

    .line 72
    return-wide v1

    .line 73
    :cond_3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 74
    .line 75
    iget p0, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 76
    .line 77
    aget-wide p0, p1, p0

    .line 78
    .line 79
    return-wide p0
.end method

.method public final q(JZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/source/q;->m(JZZ)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/google/android/exoplayer2/source/p;->b(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->n()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/p;->b(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final s()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/source/p;->b(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final t(I)J
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->G()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 11
    .line 12
    iget v4, p0, Lcom/google/android/exoplayer2/source/q;->s:I

    .line 13
    .line 14
    sub-int/2addr v3, v4

    .line 15
    if-gt v0, v3, :cond_0

    .line 16
    .line 17
    move v3, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v3, v1

    .line 20
    :goto_0
    invoke-static {v3}, Ll/w11;->a(Z)V

    .line 21
    .line 22
    .line 23
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 24
    .line 25
    sub-int/2addr v3, v0

    .line 26
    iput v3, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 27
    .line 28
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/q;->u:J

    .line 29
    .line 30
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/source/q;->B(I)J

    .line 31
    .line 32
    .line 33
    move-result-wide v6

    .line 34
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    iput-wide v3, p0, Lcom/google/android/exoplayer2/source/q;->v:J

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    move v1, v2

    .line 47
    :cond_1
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/q;->w:Z

    .line 48
    .line 49
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->c:Ll/yuf0;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ll/yuf0;->d(I)V

    .line 52
    .line 53
    .line 54
    iget p1, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    sub-int/2addr p1, v2

    .line 59
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->D(I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->k:[J

    .line 64
    .line 65
    aget-wide v1, v0, p1

    .line 66
    .line 67
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/q;->l:[I

    .line 68
    .line 69
    aget p0, p0, p1

    .line 70
    .line 71
    int-to-long p0, p0

    .line 72
    add-long/2addr v1, p0

    .line 73
    return-wide v1

    .line 74
    :cond_2
    const-wide/16 p0, 0x0

    .line 75
    .line 76
    return-wide p0
.end method

.method public final u(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->a:Lcom/google/android/exoplayer2/source/p;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/q;->t(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/google/android/exoplayer2/source/p;->c(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final v(IIJZ)I
    .locals 6

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, p2, :cond_4

    .line 5
    .line 6
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 7
    .line 8
    aget-wide v4, v3, p1

    .line 9
    .line 10
    cmp-long v3, v4, p3

    .line 11
    .line 12
    if-gtz v3, :cond_4

    .line 13
    .line 14
    if-eqz p5, :cond_0

    .line 15
    .line 16
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/q;->m:[I

    .line 17
    .line 18
    aget v3, v3, p1

    .line 19
    .line 20
    and-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    :cond_0
    cmp-long v0, v4, p3

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    return v2

    .line 29
    :cond_1
    move v0, v2

    .line 30
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    iget v3, p0, Lcom/google/android/exoplayer2/source/q;->i:I

    .line 33
    .line 34
    if-ne p1, v3, :cond_3

    .line 35
    .line 36
    move p1, v1

    .line 37
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_4
    return v0
.end method

.method public w(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;
    .locals 4
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->F:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, p1, Lcom/google/android/exoplayer2/k;->p:J

    .line 10
    .line 11
    const-wide v2, 0x7fffffffffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-wide v1, p1, Lcom/google/android/exoplayer2/k;->p:J

    .line 25
    .line 26
    iget-wide p0, p0, Lcom/google/android/exoplayer2/source/q;->F:J

    .line 27
    .line 28
    add-long/2addr v1, p0

    .line 29
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/k$b;->k0(J)Lcom/google/android/exoplayer2/k$b;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    return-object p1
.end method

.method public final x()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/source/q;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public final declared-synchronized y()J
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/q;->p:I

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-wide/high16 v0, -0x8000000000000000L

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/q;->n:[J

    .line 10
    .line 11
    iget v1, p0, Lcom/google/android/exoplayer2/source/q;->r:I

    .line 12
    .line 13
    aget-wide v1, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    move-wide v0, v1

    .line 16
    :goto_0
    monitor-exit p0

    .line 17
    return-wide v0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public final declared-synchronized z()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/q;->v:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-wide v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method
