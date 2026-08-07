.class public final Ll/krd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/he80;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/krd$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final i:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final j:Ljava/util/Random;


# instance fields
.field public final a:Lcom/google/android/exoplayer2/c0$d;

.field public final b:Lcom/google/android/exoplayer2/c0$b;

.field public final c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/krd$a;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/he80$a;

.field public f:Lcom/google/android/exoplayer2/c0;

.field public g:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jrd;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jrd;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/krd;->i:Ll/b7h0;

    .line 7
    .line 8
    new-instance v0, Ljava/util/Random;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/krd;->j:Ljava/util/Random;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 36
    sget-object v0, Ll/krd;->i:Ll/b7h0;

    invoke-direct {p0, v0}, Ll/krd;-><init>(Ll/b7h0;)V

    return-void
.end method

.method public constructor <init>(Ll/b7h0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b7h0<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/krd;->d:Ll/b7h0;

    .line 5
    .line 6
    new-instance p1, Lcom/google/android/exoplayer2/c0$d;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/krd;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 12
    .line 13
    new-instance p1, Lcom/google/android/exoplayer2/c0$b;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/krd;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 19
    .line 20
    new-instance p1, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 26
    .line 27
    sget-object p1, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 28
    .line 29
    iput-object p1, p0, Ll/krd;->f:Lcom/google/android/exoplayer2/c0;

    .line 30
    .line 31
    const-wide/16 v0, -0x1

    .line 32
    .line 33
    iput-wide v0, p0, Ll/krd;->h:J

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic h()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/krd;->m()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic i(Ll/krd;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/krd;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic j(Ll/krd;)Lcom/google/android/exoplayer2/c0$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/krd;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ll/krd;)Lcom/google/android/exoplayer2/c0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/krd;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static m()Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    sget-object v1, Ll/krd;->j:Ljava/util/Random;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method


# virtual methods
.method public declared-synchronized a(Ll/hk0$a;I)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/krd;->e:Ll/he80$a;

    .line 3
    .line 4
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    move p2, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p2, v0

    .line 14
    :goto_0
    iget-object v2, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_4

    .line 29
    .line 30
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ll/krd$a;

    .line 35
    .line 36
    invoke-virtual {v3, p1}, Ll/krd$a;->j(Ll/hk0$a;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 43
    .line 44
    .line 45
    invoke-static {v3}, Ll/krd$a;->d(Ll/krd$a;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_1

    .line 50
    .line 51
    invoke-static {v3}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-object v5, p0, Ll/krd;->g:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    if-eqz v4, :cond_2

    .line 64
    .line 65
    invoke-static {v3}, Ll/krd$a;->f(Ll/krd$a;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_2

    .line 70
    .line 71
    move v5, v1

    .line 72
    goto :goto_2

    .line 73
    :catchall_0
    move-exception p1

    .line 74
    goto :goto_3

    .line 75
    :cond_2
    move v5, v0

    .line 76
    :goto_2
    if-eqz v4, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0, v3}, Ll/krd;->l(Ll/krd$a;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    iget-object v4, p0, Ll/krd;->e:Ll/he80$a;

    .line 82
    .line 83
    invoke-static {v3}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-interface {v4, p1, v3, v5}, Ll/he80$a;->x(Ll/hk0$a;Ljava/lang/String;Z)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    invoke-virtual {p0, p1}, Ll/krd;->p(Ll/hk0$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    .line 94
    monitor-exit p0

    .line 95
    return-void

    .line 96
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p1
.end method

.method public b(Ll/he80$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/krd;->e:Ll/he80$a;

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized c(Ll/hk0$a;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/krd;->e:Ll/he80$a;

    .line 3
    .line 4
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/krd;->f:Lcom/google/android/exoplayer2/c0;

    .line 8
    .line 9
    iget-object v1, p1, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 10
    .line 11
    iput-object v1, p0, Ll/krd;->f:Lcom/google/android/exoplayer2/c0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ll/krd$a;

    .line 34
    .line 35
    iget-object v3, p0, Ll/krd;->f:Lcom/google/android/exoplayer2/c0;

    .line 36
    .line 37
    invoke-virtual {v2, v0, v3}, Ll/krd$a;->m(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-virtual {v2, p1}, Ll/krd$a;->j(Ll/hk0$a;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 53
    .line 54
    .line 55
    invoke-static {v2}, Ll/krd$a;->d(Ll/krd$a;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    invoke-static {v2}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget-object v4, p0, Ll/krd;->g:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0, v2}, Ll/krd;->l(Ll/krd$a;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object v3, p0, Ll/krd;->e:Ll/he80$a;

    .line 77
    .line 78
    invoke-static {v2}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const/4 v4, 0x0

    .line 83
    invoke-interface {v3, p1, v2, v4}, Ll/he80$a;->x(Ll/hk0$a;Ljava/lang/String;Z)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    invoke-virtual {p0, p1}, Ll/krd;->p(Ll/hk0$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .line 89
    .line 90
    monitor-exit p0

    .line 91
    return-void

    .line 92
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    throw p1
.end method

.method public declared-synchronized d(Ll/hk0$a;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/krd;->g:Ljava/lang/String;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/krd$a;

    .line 13
    .line 14
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/krd$a;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/krd;->l(Ll/krd$a;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto :goto_2

    .line 26
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ll/krd$a;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/krd$a;->d(Ll/krd$a;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Ll/krd;->e:Ll/he80$a;

    .line 58
    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    invoke-static {v1}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const/4 v3, 0x0

    .line 66
    invoke-interface {v2, p1, v1, v3}, Ll/he80$a;->x(Ll/hk0$a;Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    monitor-exit p0

    .line 71
    return-void

    .line 72
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    throw p1
.end method

.method public declared-synchronized e()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/krd;->g:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

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

.method public declared-synchronized f(Ll/hk0$a;)V
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v2, v1, Ll/krd;->e:Ll/he80$a;

    .line 7
    .line 8
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v2, v0, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 14
    .line 15
    .line 16
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :cond_0
    :try_start_1
    iget-object v2, v0, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    iget-wide v2, v2, Ll/fyx;->d:J

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/krd;->n()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    cmp-long v2, v2, v4

    .line 32
    .line 33
    if-gez v2, :cond_1

    .line 34
    .line 35
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :cond_1
    :try_start_2
    iget-object v2, v1, Ll/krd;->c:Ljava/util/HashMap;

    .line 38
    .line 39
    iget-object v3, v1, Ll/krd;->g:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ll/krd$a;

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-static {v2}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    const-wide/16 v5, -0x1

    .line 54
    .line 55
    cmp-long v3, v3, v5

    .line 56
    .line 57
    if-nez v3, :cond_2

    .line 58
    .line 59
    invoke-static {v2}, Ll/krd$a;->c(Ll/krd$a;)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iget v3, v0, Ll/hk0$a;->c:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    .line 65
    if-eq v2, v3, :cond_2

    .line 66
    .line 67
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :cond_2
    :try_start_3
    iget v2, v0, Ll/hk0$a;->c:I

    .line 73
    .line 74
    iget-object v3, v0, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 75
    .line 76
    invoke-virtual {v1, v2, v3}, Ll/krd;->o(ILcom/google/android/exoplayer2/source/i$b;)Ll/krd$a;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iget-object v3, v1, Ll/krd;->g:Ljava/lang/String;

    .line 81
    .line 82
    if-nez v3, :cond_3

    .line 83
    .line 84
    invoke-static {v2}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iput-object v3, v1, Ll/krd;->g:Ljava/lang/String;

    .line 89
    .line 90
    :cond_3
    iget-object v3, v0, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 91
    .line 92
    const/4 v4, 0x1

    .line 93
    if-eqz v3, :cond_4

    .line 94
    .line 95
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_4

    .line 100
    .line 101
    new-instance v10, Lcom/google/android/exoplayer2/source/i$b;

    .line 102
    .line 103
    iget-object v3, v0, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 104
    .line 105
    iget-object v5, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 106
    .line 107
    iget-wide v6, v3, Ll/fyx;->d:J

    .line 108
    .line 109
    iget v3, v3, Ll/fyx;->b:I

    .line 110
    .line 111
    invoke-direct {v10, v5, v6, v7, v3}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;JI)V

    .line 112
    .line 113
    .line 114
    iget v3, v0, Ll/hk0$a;->c:I

    .line 115
    .line 116
    invoke-virtual {v1, v3, v10}, Ll/krd;->o(ILcom/google/android/exoplayer2/source/i$b;)Ll/krd$a;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-static {v3}, Ll/krd$a;->d(Ll/krd$a;)Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-nez v5, :cond_4

    .line 125
    .line 126
    invoke-static {v3, v4}, Ll/krd$a;->e(Ll/krd$a;Z)Z

    .line 127
    .line 128
    .line 129
    iget-object v5, v0, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 130
    .line 131
    iget-object v6, v0, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 132
    .line 133
    iget-object v6, v6, Ll/fyx;->a:Ljava/lang/Object;

    .line 134
    .line 135
    iget-object v7, v1, Ll/krd;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 136
    .line 137
    invoke-virtual {v5, v6, v7}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 138
    .line 139
    .line 140
    iget-object v5, v1, Ll/krd;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 141
    .line 142
    iget-object v6, v0, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 143
    .line 144
    iget v6, v6, Ll/fyx;->b:I

    .line 145
    .line 146
    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 147
    .line 148
    .line 149
    move-result-wide v5

    .line 150
    invoke-static {v5, v6}, Ll/bmk0;->l1(J)J

    .line 151
    .line 152
    .line 153
    move-result-wide v5

    .line 154
    iget-object v7, v1, Ll/krd;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 155
    .line 156
    invoke-virtual {v7}, Lcom/google/android/exoplayer2/c0$b;->p()J

    .line 157
    .line 158
    .line 159
    move-result-wide v7

    .line 160
    add-long/2addr v5, v7

    .line 161
    const-wide/16 v7, 0x0

    .line 162
    .line 163
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 164
    .line 165
    .line 166
    move-result-wide v11

    .line 167
    new-instance v5, Ll/hk0$a;

    .line 168
    .line 169
    iget-wide v6, v0, Ll/hk0$a;->a:J

    .line 170
    .line 171
    iget-object v8, v0, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 172
    .line 173
    iget v9, v0, Ll/hk0$a;->c:I

    .line 174
    .line 175
    iget-object v13, v0, Ll/hk0$a;->f:Lcom/google/android/exoplayer2/c0;

    .line 176
    .line 177
    iget v14, v0, Ll/hk0$a;->g:I

    .line 178
    .line 179
    iget-object v15, v0, Ll/hk0$a;->h:Lcom/google/android/exoplayer2/source/i$b;

    .line 180
    .line 181
    move-object/from16 v16, v5

    .line 182
    .line 183
    iget-wide v4, v0, Ll/hk0$a;->i:J

    .line 184
    .line 185
    move-object/from16 v20, v3

    .line 186
    .line 187
    move-wide/from16 v17, v4

    .line 188
    .line 189
    iget-wide v3, v0, Ll/hk0$a;->j:J

    .line 190
    .line 191
    move-object/from16 v5, v16

    .line 192
    .line 193
    move-wide/from16 v16, v17

    .line 194
    .line 195
    move-wide/from16 v18, v3

    .line 196
    .line 197
    invoke-direct/range {v5 .. v19}, Ll/hk0$a;-><init>(JLcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;JLcom/google/android/exoplayer2/c0;ILcom/google/android/exoplayer2/source/i$b;JJ)V

    .line 198
    .line 199
    .line 200
    iget-object v3, v1, Ll/krd;->e:Ll/he80$a;

    .line 201
    .line 202
    invoke-static/range {v20 .. v20}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-interface {v3, v5, v4}, Ll/he80$a;->V(Ll/hk0$a;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    :cond_4
    invoke-static {v2}, Ll/krd$a;->d(Ll/krd$a;)Z

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    if-nez v3, :cond_5

    .line 214
    .line 215
    const/4 v3, 0x1

    .line 216
    invoke-static {v2, v3}, Ll/krd$a;->e(Ll/krd$a;Z)Z

    .line 217
    .line 218
    .line 219
    iget-object v3, v1, Ll/krd;->e:Ll/he80$a;

    .line 220
    .line 221
    invoke-static {v2}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-interface {v3, v0, v4}, Ll/he80$a;->V(Ll/hk0$a;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    :cond_5
    invoke-static {v2}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    iget-object v4, v1, Ll/krd;->g:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    if-eqz v3, :cond_6

    .line 239
    .line 240
    invoke-static {v2}, Ll/krd$a;->f(Ll/krd$a;)Z

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    if-nez v3, :cond_6

    .line 245
    .line 246
    const/4 v3, 0x1

    .line 247
    invoke-static {v2, v3}, Ll/krd$a;->g(Ll/krd$a;Z)Z

    .line 248
    .line 249
    .line 250
    iget-object v3, v1, Ll/krd;->e:Ll/he80$a;

    .line 251
    .line 252
    invoke-static {v2}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-interface {v3, v0, v2}, Ll/he80$a;->d(Ll/hk0$a;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 257
    .line 258
    .line 259
    :cond_6
    monitor-exit p0

    .line 260
    return-void

    .line 261
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 262
    throw v0
.end method

.method public declared-synchronized g(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;)Ljava/lang/String;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 3
    .line 4
    iget-object v1, p0, Ll/krd;->b:Lcom/google/android/exoplayer2/c0$b;

    .line 5
    .line 6
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p1, p1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/krd;->o(ILcom/google/android/exoplayer2/source/i$b;)Ll/krd$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-object p1

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public final l(Ll/krd$a;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Ll/krd;->h:J

    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/krd;->g:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public final n()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p0, Ll/krd;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/krd$a;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    const-wide/16 v3, -0x1

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    return-wide v0

    .line 28
    :cond_0
    iget-wide v0, p0, Ll/krd;->h:J

    .line 29
    .line 30
    const-wide/16 v2, 0x1

    .line 31
    .line 32
    add-long/2addr v0, v2

    .line 33
    return-wide v0
.end method

.method public final o(ILcom/google/android/exoplayer2/source/i$b;)Ll/krd$a;
    .locals 9
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const-wide v2, 0x7fffffffffffffffL

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_3

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Ll/krd$a;

    .line 28
    .line 29
    invoke-virtual {v4, p1, p2}, Ll/krd$a;->k(ILcom/google/android/exoplayer2/source/i$b;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4, p1, p2}, Ll/krd$a;->i(ILcom/google/android/exoplayer2/source/i$b;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v5, :cond_0

    .line 37
    .line 38
    invoke-static {v4}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    const-wide/16 v7, -0x1

    .line 43
    .line 44
    cmp-long v7, v5, v7

    .line 45
    .line 46
    if-eqz v7, :cond_2

    .line 47
    .line 48
    cmp-long v7, v5, v2

    .line 49
    .line 50
    if-gez v7, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    if-nez v7, :cond_0

    .line 54
    .line 55
    invoke-static {v1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Ll/krd$a;

    .line 60
    .line 61
    invoke-static {v5}, Ll/krd$a;->h(Ll/krd$a;)Lcom/google/android/exoplayer2/source/i$b;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    if-eqz v5, :cond_0

    .line 66
    .line 67
    invoke-static {v4}, Ll/krd$a;->h(Ll/krd$a;)Lcom/google/android/exoplayer2/source/i$b;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    if-eqz v5, :cond_0

    .line 72
    .line 73
    move-object v1, v4

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    :goto_1
    move-object v1, v4

    .line 76
    move-wide v2, v5

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    if-nez v1, :cond_4

    .line 79
    .line 80
    iget-object v0, p0, Ll/krd;->d:Ll/b7h0;

    .line 81
    .line 82
    invoke-interface {v0}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/String;

    .line 87
    .line 88
    new-instance v1, Ll/krd$a;

    .line 89
    .line 90
    invoke-direct {v1, p0, v0, p1, p2}, Ll/krd$a;-><init>(Ll/krd;Ljava/lang/String;ILcom/google/android/exoplayer2/source/i$b;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 94
    .line 95
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    :cond_4
    return-object v1
.end method

.method public final p(Ll/hk0$a;)V
    .locals 6
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "listener"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/hk0$a;->b:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/krd;->g:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/krd$a;

    .line 20
    .line 21
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ll/krd$a;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/krd;->l(Ll/krd$a;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Ll/krd;->c:Ljava/util/HashMap;

    .line 32
    .line 33
    iget-object v1, p0, Ll/krd;->g:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/krd$a;

    .line 40
    .line 41
    iget v1, p1, Ll/hk0$a;->c:I

    .line 42
    .line 43
    iget-object v2, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 44
    .line 45
    invoke-virtual {p0, v1, v2}, Ll/krd;->o(ILcom/google/android/exoplayer2/source/i$b;)Ll/krd$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iput-object v2, p0, Ll/krd;->g:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/krd;->f(Ll/hk0$a;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 59
    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    invoke-virtual {v2}, Ll/fyx;->b()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-static {v0}, Ll/krd$a;->b(Ll/krd$a;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    iget-object v4, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 75
    .line 76
    iget-wide v4, v4, Ll/fyx;->d:J

    .line 77
    .line 78
    cmp-long v2, v2, v4

    .line 79
    .line 80
    if-nez v2, :cond_1

    .line 81
    .line 82
    invoke-static {v0}, Ll/krd$a;->h(Ll/krd$a;)Lcom/google/android/exoplayer2/source/i$b;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    invoke-static {v0}, Ll/krd$a;->h(Ll/krd$a;)Lcom/google/android/exoplayer2/source/i$b;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget v2, v2, Ll/fyx;->b:I

    .line 93
    .line 94
    iget-object v3, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 95
    .line 96
    iget v3, v3, Ll/fyx;->b:I

    .line 97
    .line 98
    if-ne v2, v3, :cond_1

    .line 99
    .line 100
    invoke-static {v0}, Ll/krd$a;->h(Ll/krd$a;)Lcom/google/android/exoplayer2/source/i$b;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget v0, v0, Ll/fyx;->c:I

    .line 105
    .line 106
    iget-object v2, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 107
    .line 108
    iget v2, v2, Ll/fyx;->c:I

    .line 109
    .line 110
    if-eq v0, v2, :cond_2

    .line 111
    .line 112
    :cond_1
    new-instance v0, Lcom/google/android/exoplayer2/source/i$b;

    .line 113
    .line 114
    iget-object v2, p1, Ll/hk0$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 115
    .line 116
    iget-object v3, v2, Ll/fyx;->a:Ljava/lang/Object;

    .line 117
    .line 118
    iget-wide v4, v2, Ll/fyx;->d:J

    .line 119
    .line 120
    invoke-direct {v0, v3, v4, v5}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;J)V

    .line 121
    .line 122
    .line 123
    iget v2, p1, Ll/hk0$a;->c:I

    .line 124
    .line 125
    invoke-virtual {p0, v2, v0}, Ll/krd;->o(ILcom/google/android/exoplayer2/source/i$b;)Ll/krd$a;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object p0, p0, Ll/krd;->e:Ll/he80$a;

    .line 130
    .line 131
    invoke-static {v0}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v1}, Ll/krd$a;->a(Ll/krd$a;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {p0, p1, v0, v1}, Ll/he80$a;->M(Ll/hk0$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_2
    return-void
.end method
