.class public final Ll/s5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$b;
.implements Lcom/google/android/exoplayer2/upstream/Loader$f;
.implements Lcom/google/android/exoplayer2/source/r;
.implements Ll/bsf;
.implements Lcom/google/android/exoplayer2/source/q$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s5l$b;,
        Ll/s5l$d;,
        Ll/s5l$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/upstream/Loader$b<",
        "Ll/o45;",
        ">;",
        "Lcom/google/android/exoplayer2/upstream/Loader$f;",
        "Lcom/google/android/exoplayer2/source/r;",
        "Ll/bsf;",
        "Lcom/google/android/exoplayer2/source/q$d;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final Y:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:I

.field public B:I

.field public C:Z

.field public D:Z

.field public E:I

.field public F:Lcom/google/android/exoplayer2/k;

.field public G:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public H:Z

.field public I:Ll/ffj0;

.field public J:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/dfj0;",
            ">;"
        }
    .end annotation
.end field

.field public K:[I

.field public L:I

.field public M:Z

.field public N:[Z

.field public O:[Z

.field public P:J

.field public Q:J

.field public R:Z

.field public S:Z

.field public T:Z

.field public U:Z

.field public V:J

.field public W:Lcom/google/android/exoplayer2/drm/DrmInitData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public X:Ll/j5l;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Ll/s5l$b;

.field public final d:Ll/f5l;

.field public final e:Ll/oj0;

.field public final f:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Lcom/google/android/exoplayer2/drm/c;

.field public final h:Lcom/google/android/exoplayer2/drm/b$a;

.field public final i:Lcom/google/android/exoplayer2/upstream/c;

.field public final j:Lcom/google/android/exoplayer2/upstream/Loader;

.field public final k:Lcom/google/android/exoplayer2/source/j$a;

.field public final l:I

.field public final m:Ll/f5l$b;

.field public final n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/j5l;",
            ">;"
        }
    .end annotation
.end field

.field public final o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/j5l;",
            ">;"
        }
    .end annotation
.end field

.field public final p:Ljava/lang/Runnable;

.field public final q:Ljava/lang/Runnable;

.field public final r:Landroid/os/Handler;

.field public final s:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/o5l;",
            ">;"
        }
    .end annotation
.end field

.field public final t:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;"
        }
    .end annotation
.end field

.field public u:Ll/o45;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public v:[Ll/s5l$d;

.field public w:[I

.field public x:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public y:Landroid/util/SparseIntArray;

.field public z:Ll/qfj0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x5

    .line 14
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    filled-new-array {v1, v2, v3}, [Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/s5l;->Y:Ljava/util/Set;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILl/s5l$b;Ll/f5l;Ljava/util/Map;Ll/oj0;JLcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;I)V
    .locals 0
    .param p9    # Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ll/s5l$b;",
            "Ll/f5l;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            ">;",
            "Ll/oj0;",
            "J",
            "Lcom/google/android/exoplayer2/k;",
            "Lcom/google/android/exoplayer2/drm/c;",
            "Lcom/google/android/exoplayer2/drm/b$a;",
            "Lcom/google/android/exoplayer2/upstream/c;",
            "Lcom/google/android/exoplayer2/source/j$a;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s5l;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/s5l;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/s5l;->c:Ll/s5l$b;

    .line 9
    .line 10
    iput-object p4, p0, Ll/s5l;->d:Ll/f5l;

    .line 11
    .line 12
    iput-object p5, p0, Ll/s5l;->t:Ljava/util/Map;

    .line 13
    .line 14
    iput-object p6, p0, Ll/s5l;->e:Ll/oj0;

    .line 15
    .line 16
    iput-object p9, p0, Ll/s5l;->f:Lcom/google/android/exoplayer2/k;

    .line 17
    .line 18
    iput-object p10, p0, Ll/s5l;->g:Lcom/google/android/exoplayer2/drm/c;

    .line 19
    .line 20
    iput-object p11, p0, Ll/s5l;->h:Lcom/google/android/exoplayer2/drm/b$a;

    .line 21
    .line 22
    iput-object p12, p0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 23
    .line 24
    iput-object p13, p0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 25
    .line 26
    iput p14, p0, Ll/s5l;->l:I

    .line 27
    .line 28
    new-instance p1, Lcom/google/android/exoplayer2/upstream/Loader;

    .line 29
    .line 30
    const-string p2, "Loader:HlsSampleStreamWrapper"

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 36
    .line 37
    new-instance p1, Ll/f5l$b;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/f5l$b;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/s5l;->m:Ll/f5l$b;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    new-array p2, p1, [I

    .line 46
    .line 47
    iput-object p2, p0, Ll/s5l;->w:[I

    .line 48
    .line 49
    new-instance p2, Ljava/util/HashSet;

    .line 50
    .line 51
    sget-object p3, Ll/s5l;->Y:Ljava/util/Set;

    .line 52
    .line 53
    invoke-interface {p3}, Ljava/util/Set;->size()I

    .line 54
    .line 55
    .line 56
    move-result p4

    .line 57
    invoke-direct {p2, p4}, Ljava/util/HashSet;-><init>(I)V

    .line 58
    .line 59
    .line 60
    iput-object p2, p0, Ll/s5l;->x:Ljava/util/Set;

    .line 61
    .line 62
    new-instance p2, Landroid/util/SparseIntArray;

    .line 63
    .line 64
    invoke-interface {p3}, Ljava/util/Set;->size()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    invoke-direct {p2, p3}, Landroid/util/SparseIntArray;-><init>(I)V

    .line 69
    .line 70
    .line 71
    iput-object p2, p0, Ll/s5l;->y:Landroid/util/SparseIntArray;

    .line 72
    .line 73
    new-array p2, p1, [Ll/s5l$d;

    .line 74
    .line 75
    iput-object p2, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 76
    .line 77
    new-array p2, p1, [Z

    .line 78
    .line 79
    iput-object p2, p0, Ll/s5l;->O:[Z

    .line 80
    .line 81
    new-array p1, p1, [Z

    .line 82
    .line 83
    iput-object p1, p0, Ll/s5l;->N:[Z

    .line 84
    .line 85
    new-instance p1, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Ll/s5l;->o:Ljava/util/List;

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Ll/s5l;->s:Ljava/util/ArrayList;

    .line 104
    .line 105
    new-instance p1, Ll/q5l;

    .line 106
    .line 107
    invoke-direct {p1, p0}, Ll/q5l;-><init>(Ll/s5l;)V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Ll/s5l;->p:Ljava/lang/Runnable;

    .line 111
    .line 112
    new-instance p1, Ll/r5l;

    .line 113
    .line 114
    invoke-direct {p1, p0}, Ll/r5l;-><init>(Ll/s5l;)V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, Ll/s5l;->q:Ljava/lang/Runnable;

    .line 118
    .line 119
    invoke-static {}, Ll/bmk0;->w()Landroid/os/Handler;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Ll/s5l;->r:Landroid/os/Handler;

    .line 124
    .line 125
    iput-wide p7, p0, Ll/s5l;->P:J

    .line 126
    .line 127
    iput-wide p7, p0, Ll/s5l;->Q:J

    .line 128
    .line 129
    return-void
.end method

.method public static B(II)Ll/rfe;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Unmapped track with id "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, " of type "

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "HlsSampleStreamWrapper"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/rfe;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/rfe;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public static E(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Z)Lcom/google/android/exoplayer2/k;
    .locals 7
    .param p0    # Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Ll/kb00;->k(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/bmk0;->L(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-ne v1, v3, :cond_1

    .line 20
    .line 21
    invoke-static {v2, v0}, Ll/bmk0;->M(Ljava/lang/String;I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Ll/kb00;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v1, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2, v1}, Ll/kb00;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object v5, p0, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v5, p0, Lcom/google/android/exoplayer2/k;->b:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    iget-object v5, p0, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget v5, p0, Lcom/google/android/exoplayer2/k;->d:I

    .line 61
    .line 62
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    iget v5, p0, Lcom/google/android/exoplayer2/k;->e:I

    .line 67
    .line 68
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->e0(I)Lcom/google/android/exoplayer2/k$b;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    const/4 v5, -0x1

    .line 73
    if-eqz p2, :cond_2

    .line 74
    .line 75
    iget v6, p0, Lcom/google/android/exoplayer2/k;->f:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    move v6, v5

    .line 79
    :goto_1
    invoke-virtual {v4, v6}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    if-eqz p2, :cond_3

    .line 84
    .line 85
    iget p2, p0, Lcom/google/android/exoplayer2/k;->g:I

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    move p2, v5

    .line 89
    :goto_2
    invoke-virtual {v4, p2}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p2, v1}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    const/4 v1, 0x2

    .line 98
    if-ne v0, v1, :cond_4

    .line 99
    .line 100
    iget v1, p0, Lcom/google/android/exoplayer2/k;->q:I

    .line 101
    .line 102
    invoke-virtual {p2, v1}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget v4, p0, Lcom/google/android/exoplayer2/k;->r:I

    .line 107
    .line 108
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iget v4, p0, Lcom/google/android/exoplayer2/k;->s:F

    .line 113
    .line 114
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/k$b;->R(F)Lcom/google/android/exoplayer2/k$b;

    .line 115
    .line 116
    .line 117
    :cond_4
    if-eqz v2, :cond_5

    .line 118
    .line 119
    invoke-virtual {p2, v2}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 120
    .line 121
    .line 122
    :cond_5
    iget v1, p0, Lcom/google/android/exoplayer2/k;->y:I

    .line 123
    .line 124
    if-eq v1, v5, :cond_6

    .line 125
    .line 126
    if-ne v0, v3, :cond_6

    .line 127
    .line 128
    invoke-virtual {p2, v1}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 129
    .line 130
    .line 131
    :cond_6
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 132
    .line 133
    if-eqz p0, :cond_8

    .line 134
    .line 135
    iget-object p1, p1, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 136
    .line 137
    if-eqz p1, :cond_7

    .line 138
    .line 139
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/metadata/Metadata;->b(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    :cond_7
    invoke-virtual {p2, p0}, Lcom/google/android/exoplayer2/k$b;->Z(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k$b;

    .line 144
    .line 145
    .line 146
    :cond_8
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0
.end method

.method private F(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, -0x1

    .line 19
    if-ge p1, v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/s5l;->z(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move p1, v1

    .line 32
    :goto_1
    if-ne p1, v1, :cond_2

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-virtual {p0}, Ll/s5l;->J()Ll/j5l;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-wide v5, v0, Ll/o45;->h:J

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/s5l;->G(I)Ll/j5l;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iget-wide v0, p0, Ll/s5l;->P:J

    .line 54
    .line 55
    iput-wide v0, p0, Ll/s5l;->Q:J

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_3
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-static {v0}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ll/j5l;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/j5l;->o()V

    .line 67
    .line 68
    .line 69
    :goto_2
    const/4 v0, 0x0

    .line 70
    iput-boolean v0, p0, Ll/s5l;->T:Z

    .line 71
    .line 72
    iget-object v1, p0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 73
    .line 74
    iget v2, p0, Ll/s5l;->A:I

    .line 75
    .line 76
    iget-wide v3, p1, Ll/o45;->g:J

    .line 77
    .line 78
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/source/j$a;->w(IJJ)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static I(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/kb00;->k(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x3

    .line 10
    const/4 v4, 0x0

    .line 11
    const/4 v5, 0x1

    .line 12
    if-eq v2, v3, :cond_1

    .line 13
    .line 14
    invoke-static {v1}, Ll/kb00;->k(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-ne v2, p0, :cond_0

    .line 19
    .line 20
    return v5

    .line 21
    :cond_0
    return v4

    .line 22
    :cond_1
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    return v4

    .line 29
    :cond_2
    const-string v1, "application/cea-608"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_4

    .line 36
    .line 37
    const-string v1, "application/cea-708"

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    return v5

    .line 47
    :cond_4
    :goto_0
    iget p0, p0, Lcom/google/android/exoplayer2/k;->D:I

    .line 48
    .line 49
    iget p1, p1, Lcom/google/android/exoplayer2/k;->D:I

    .line 50
    .line 51
    if-ne p0, p1, :cond_5

    .line 52
    .line 53
    return v5

    .line 54
    :cond_5
    return v4
.end method

.method public static L(I)I
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p0, v1, :cond_2

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    if-eq p0, v2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    return v1

    .line 13
    :cond_1
    return v2

    .line 14
    :cond_2
    return v0
.end method

.method private static N(Ll/o45;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Ll/j5l;

    .line 2
    .line 3
    return p0
.end method

.method private O()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/s5l;->Q:J

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
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method private S()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/s5l;->H:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Ll/s5l;->K:[I

    .line 6
    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/s5l;->C:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 15
    .line 16
    array-length v1, v0

    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    if-ge v2, v1, :cond_2

    .line 19
    .line 20
    aget-object v3, v0, v2

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/q;->F()Lcom/google/android/exoplayer2/k;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    iget-object v0, p0, Ll/s5l;->I:Ll/ffj0;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/s5l;->R()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    invoke-virtual {p0}, Ll/s5l;->y()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/s5l;->k0()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/s5l;->c:Ll/s5l$b;

    .line 47
    .line 48
    invoke-interface {p0}, Ll/s5l$b;->a()V

    .line 49
    .line 50
    .line 51
    :cond_4
    :goto_1
    return-void
.end method

.method private f0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v3, v1, :cond_0

    .line 7
    .line 8
    aget-object v4, v0, v3

    .line 9
    .line 10
    iget-boolean v5, p0, Ll/s5l;->R:Z

    .line 11
    .line 12
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/source/q;->V(Z)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iput-boolean v2, p0, Ll/s5l;->R:Z

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic u(Ll/s5l;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s5l;->b0()V

    return-void
.end method

.method public static synthetic v(Ll/s5l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s5l;->S()V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/s5l;->D:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Ll/s5l;->P:J

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/s5l;->c(J)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final C(II)Lcom/google/android/exoplayer2/source/q;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq p2, v1, :cond_1

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    if-ne p2, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :cond_1
    :goto_0
    new-instance v2, Ll/s5l$d;

    .line 13
    .line 14
    iget-object v3, p0, Ll/s5l;->e:Ll/oj0;

    .line 15
    .line 16
    iget-object v4, p0, Ll/s5l;->g:Lcom/google/android/exoplayer2/drm/c;

    .line 17
    .line 18
    iget-object v5, p0, Ll/s5l;->h:Lcom/google/android/exoplayer2/drm/b$a;

    .line 19
    .line 20
    iget-object v6, p0, Ll/s5l;->t:Ljava/util/Map;

    .line 21
    .line 22
    const/4 v7, 0x0

    .line 23
    invoke-direct/range {v2 .. v7}, Ll/s5l$d;-><init>(Ll/oj0;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Ljava/util/Map;Ll/s5l$a;)V

    .line 24
    .line 25
    .line 26
    iget-wide v3, p0, Ll/s5l;->P:J

    .line 27
    .line 28
    invoke-virtual {v2, v3, v4}, Lcom/google/android/exoplayer2/source/q;->a0(J)V

    .line 29
    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v3, p0, Ll/s5l;->W:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ll/s5l$d;->h0(Lcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget-wide v3, p0, Ll/s5l;->V:J

    .line 39
    .line 40
    invoke-virtual {v2, v3, v4}, Lcom/google/android/exoplayer2/source/q;->Z(J)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Ll/s5l;->X:Ll/j5l;

    .line 44
    .line 45
    if-eqz v3, :cond_3

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ll/s5l$d;->i0(Ll/j5l;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    invoke-virtual {v2, p0}, Lcom/google/android/exoplayer2/source/q;->c0(Lcom/google/android/exoplayer2/source/q$d;)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Ll/s5l;->w:[I

    .line 54
    .line 55
    add-int/lit8 v4, v0, 0x1

    .line 56
    .line 57
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iput-object v3, p0, Ll/s5l;->w:[I

    .line 62
    .line 63
    aput p1, v3, v0

    .line 64
    .line 65
    iget-object p1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 66
    .line 67
    invoke-static {p1, v2}, Ll/bmk0;->M0([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, [Ll/s5l$d;

    .line 72
    .line 73
    iput-object p1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 74
    .line 75
    iget-object p1, p0, Ll/s5l;->O:[Z

    .line 76
    .line 77
    invoke-static {p1, v4}, Ljava/util/Arrays;->copyOf([ZI)[Z

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Ll/s5l;->O:[Z

    .line 82
    .line 83
    aput-boolean v1, p1, v0

    .line 84
    .line 85
    iget-boolean p1, p0, Ll/s5l;->M:Z

    .line 86
    .line 87
    or-int/2addr p1, v1

    .line 88
    iput-boolean p1, p0, Ll/s5l;->M:Z

    .line 89
    .line 90
    iget-object p1, p0, Ll/s5l;->x:Ljava/util/Set;

    .line 91
    .line 92
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-interface {p1, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/s5l;->y:Landroid/util/SparseIntArray;

    .line 100
    .line 101
    invoke-virtual {p1, p2, v0}, Landroid/util/SparseIntArray;->append(II)V

    .line 102
    .line 103
    .line 104
    invoke-static {p2}, Ll/s5l;->L(I)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iget v1, p0, Ll/s5l;->A:I

    .line 109
    .line 110
    invoke-static {v1}, Ll/s5l;->L(I)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-le p1, v1, :cond_4

    .line 115
    .line 116
    iput v0, p0, Ll/s5l;->B:I

    .line 117
    .line 118
    iput p2, p0, Ll/s5l;->A:I

    .line 119
    .line 120
    :cond_4
    iget-object p1, p0, Ll/s5l;->N:[Z

    .line 121
    .line 122
    invoke-static {p1, v4}, Ljava/util/Arrays;->copyOf([ZI)[Z

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Ll/s5l;->N:[Z

    .line 127
    .line 128
    return-object v2
.end method

.method public final D([Ll/dfj0;)Ll/ffj0;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p1

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget-object v2, p1, v1

    .line 7
    .line 8
    iget v3, v2, Ll/dfj0;->a:I

    .line 9
    .line 10
    new-array v3, v3, [Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    move v4, v0

    .line 13
    :goto_1
    iget v5, v2, Ll/dfj0;->a:I

    .line 14
    .line 15
    if-ge v4, v5, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2, v4}, Ll/dfj0;->c(I)Lcom/google/android/exoplayer2/k;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    iget-object v6, p0, Ll/s5l;->g:Lcom/google/android/exoplayer2/drm/c;

    .line 22
    .line 23
    invoke-interface {v6, v5}, Lcom/google/android/exoplayer2/drm/c;->c(Lcom/google/android/exoplayer2/k;)I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer2/k;->c(I)Lcom/google/android/exoplayer2/k;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    aput-object v5, v3, v4

    .line 32
    .line 33
    add-int/lit8 v4, v4, 0x1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    new-instance v4, Ll/dfj0;

    .line 37
    .line 38
    iget-object v2, v2, Ll/dfj0;->b:Ljava/lang/String;

    .line 39
    .line 40
    invoke-direct {v4, v2, v3}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 41
    .line 42
    .line 43
    aput-object v4, p1, v1

    .line 44
    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance p0, Ll/ffj0;

    .line 49
    .line 50
    invoke-direct {p0, p1}, Ll/ffj0;-><init>([Ll/dfj0;)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method

.method public final G(I)Ll/j5l;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/j5l;

    .line 8
    .line 9
    iget-object v1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v1, p1, v2}, Ll/bmk0;->U0(Ljava/util/List;II)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 20
    .line 21
    array-length v1, v1

    .line 22
    if-ge p1, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/j5l;->m(I)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v2, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 29
    .line 30
    aget-object v2, v2, p1

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/source/q;->u(I)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v0
.end method

.method public final H(Ll/j5l;)Z
    .locals 7

    .line 1
    iget p1, p1, Ll/j5l;->k:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_1

    .line 9
    .line 10
    iget-object v3, p0, Ll/s5l;->N:[Z

    .line 11
    .line 12
    aget-boolean v3, v3, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    iget-object v3, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 17
    .line 18
    aget-object v3, v3, v2

    .line 19
    .line 20
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/q;->P()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    int-to-long v5, p1

    .line 25
    cmp-long v3, v3, v5

    .line 26
    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    return v1

    .line 30
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public final J()Ll/j5l;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/j5l;

    .line 14
    .line 15
    return-object p0
.end method

.method public final K(II)Ll/qfj0;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/s5l;->Y:Ljava/util/Set;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/s5l;->y:Landroid/util/SparseIntArray;

    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    invoke-virtual {v0, p2, v1}, Landroid/util/SparseIntArray;->get(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_0
    iget-object v1, p0, Ll/s5l;->x:Ljava/util/Set;

    .line 26
    .line 27
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p0, Ll/s5l;->w:[I

    .line 38
    .line 39
    aput p1, v1, v0

    .line 40
    .line 41
    :cond_1
    iget-object v1, p0, Ll/s5l;->w:[I

    .line 42
    .line 43
    aget v1, v1, v0

    .line 44
    .line 45
    if-ne v1, p1, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 48
    .line 49
    aget-object p0, p0, v0

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_2
    invoke-static {p1, p2}, Ll/s5l;->B(II)Ll/rfe;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public final M(Ll/j5l;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/s5l;->X:Ll/j5l;

    .line 2
    .line 3
    iget-object v0, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 4
    .line 5
    iput-object v0, p0, Ll/s5l;->F:Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    iput-wide v0, p0, Ll/s5l;->Q:J

    .line 13
    .line 14
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 24
    .line 25
    array-length v2, v1

    .line 26
    const/4 v3, 0x0

    .line 27
    move v4, v3

    .line 28
    :goto_0
    if-ge v4, v2, :cond_0

    .line 29
    .line 30
    aget-object v5, v1, v4

    .line 31
    .line 32
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/source/q;->G()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v0, v5}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 41
    .line 42
    .line 43
    add-int/lit8 v4, v4, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$a;->m()Lcom/google/common/collect/ImmutableList;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, p0, v0}, Ll/j5l;->n(Ll/s5l;Lcom/google/common/collect/ImmutableList;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 54
    .line 55
    array-length v0, p0

    .line 56
    :goto_1
    if-ge v3, v0, :cond_2

    .line 57
    .line 58
    aget-object v1, p0, v3

    .line 59
    .line 60
    invoke-virtual {v1, p1}, Ll/s5l$d;->i0(Ll/j5l;)V

    .line 61
    .line 62
    .line 63
    iget-boolean v2, p1, Ll/j5l;->n:Z

    .line 64
    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/q;->f0()V

    .line 68
    .line 69
    .line 70
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    return-void
.end method

.method public P(I)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 8
    .line 9
    aget-object p1, v0, p1

    .line 10
    .line 11
    iget-boolean p0, p0, Ll/s5l;->T:Z

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/source/q;->K(Z)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public Q()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/s5l;->A:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final R()V
    .locals 6
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "trackGroupToSampleQueueIndex"
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "trackGroups"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s5l;->I:Ll/ffj0;

    .line 2
    .line 3
    iget v0, v0, Ll/ffj0;->a:I

    .line 4
    .line 5
    new-array v1, v0, [I

    .line 6
    .line 7
    iput-object v1, p0, Ll/s5l;->K:[I

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    :goto_0
    if-ge v2, v0, :cond_2

    .line 16
    .line 17
    move v3, v1

    .line 18
    :goto_1
    iget-object v4, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 19
    .line 20
    array-length v5, v4

    .line 21
    if-ge v3, v5, :cond_1

    .line 22
    .line 23
    aget-object v4, v4, v3

    .line 24
    .line 25
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/source/q;->F()Lcom/google/android/exoplayer2/k;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-static {v4}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Lcom/google/android/exoplayer2/k;

    .line 34
    .line 35
    iget-object v5, p0, Ll/s5l;->I:Ll/ffj0;

    .line 36
    .line 37
    invoke-virtual {v5, v2}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-virtual {v5, v1}, Ll/dfj0;->c(I)Lcom/google/android/exoplayer2/k;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-static {v4, v5}, Ll/s5l;->I(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_0

    .line 50
    .line 51
    iget-object v4, p0, Ll/s5l;->K:[I

    .line 52
    .line 53
    aput v3, v4, v2

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object p0, p0, Ll/s5l;->s:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/o5l;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/o5l;->c()V

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_3
    return-void
.end method

.method public T()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->a()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/s5l;->d:Ll/f5l;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/f5l;->n()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public U(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/s5l;->T()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 5
    .line 6
    aget-object p0, p0, p1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/q;->M()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public V(Ll/o45;JJZ)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/s5l;->u:Ll/o45;

    .line 3
    .line 4
    new-instance v1, Ll/mtv;

    .line 5
    .line 6
    iget-wide v2, p1, Ll/o45;->a:J

    .line 7
    .line 8
    iget-object v4, p1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/o45;->f()Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    invoke-virtual {p1}, Ll/o45;->e()Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    invoke-virtual {p1}, Ll/o45;->b()J

    .line 19
    .line 20
    .line 21
    move-result-wide v11

    .line 22
    move-wide v7, p2

    .line 23
    move-wide/from16 v9, p4

    .line 24
    .line 25
    invoke-direct/range {v1 .. v12}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 29
    .line 30
    iget-wide v2, p1, Ll/o45;->a:J

    .line 31
    .line 32
    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 33
    .line 34
    .line 35
    move-object v2, v1

    .line 36
    iget-object v1, p0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 37
    .line 38
    iget v3, p1, Ll/o45;->c:I

    .line 39
    .line 40
    iget v4, p0, Ll/s5l;->b:I

    .line 41
    .line 42
    iget-object v5, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 43
    .line 44
    iget v6, p1, Ll/o45;->e:I

    .line 45
    .line 46
    iget-object v7, p1, Ll/o45;->f:Ljava/lang/Object;

    .line 47
    .line 48
    iget-wide v8, p1, Ll/o45;->g:J

    .line 49
    .line 50
    iget-wide v10, p1, Ll/o45;->h:J

    .line 51
    .line 52
    invoke-virtual/range {v1 .. v11}, Lcom/google/android/exoplayer2/source/j$a;->k(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 53
    .line 54
    .line 55
    if-nez p6, :cond_2

    .line 56
    .line 57
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_0

    .line 62
    .line 63
    iget p1, p0, Ll/s5l;->E:I

    .line 64
    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    :cond_0
    invoke-direct {p0}, Ll/s5l;->f0()V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget p1, p0, Ll/s5l;->E:I

    .line 71
    .line 72
    if-lez p1, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Ll/s5l;->c:Ll/s5l$b;

    .line 75
    .line 76
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public W(Ll/o45;JJ)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/s5l;->u:Ll/o45;

    .line 3
    .line 4
    iget-object v0, p0, Ll/s5l;->d:Ll/f5l;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/f5l;->p(Ll/o45;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/mtv;

    .line 10
    .line 11
    iget-wide v2, p1, Ll/o45;->a:J

    .line 12
    .line 13
    iget-object v4, p1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/o45;->f()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {p1}, Ll/o45;->e()Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-virtual {p1}, Ll/o45;->b()J

    .line 24
    .line 25
    .line 26
    move-result-wide v11

    .line 27
    move-wide v7, p2

    .line 28
    move-wide/from16 v9, p4

    .line 29
    .line 30
    invoke-direct/range {v1 .. v12}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 34
    .line 35
    iget-wide v2, p1, Ll/o45;->a:J

    .line 36
    .line 37
    invoke-interface {v0, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 38
    .line 39
    .line 40
    move-object v2, v1

    .line 41
    iget-object v1, p0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 42
    .line 43
    iget v3, p1, Ll/o45;->c:I

    .line 44
    .line 45
    iget v4, p0, Ll/s5l;->b:I

    .line 46
    .line 47
    iget-object v5, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 48
    .line 49
    iget v6, p1, Ll/o45;->e:I

    .line 50
    .line 51
    iget-object v7, p1, Ll/o45;->f:Ljava/lang/Object;

    .line 52
    .line 53
    iget-wide v8, p1, Ll/o45;->g:J

    .line 54
    .line 55
    iget-wide v10, p1, Ll/o45;->h:J

    .line 56
    .line 57
    invoke-virtual/range {v1 .. v11}, Lcom/google/android/exoplayer2/source/j$a;->n(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 58
    .line 59
    .line 60
    iget-boolean p1, p0, Ll/s5l;->D:Z

    .line 61
    .line 62
    if-nez p1, :cond_0

    .line 63
    .line 64
    iget-wide v0, p0, Ll/s5l;->P:J

    .line 65
    .line 66
    invoke-virtual {p0, v0, v1}, Ll/s5l;->c(J)Z

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    iget-object p1, p0, Ll/s5l;->c:Ll/s5l$b;

    .line 71
    .line 72
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public X(Ll/o45;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v13, p6

    .line 6
    .line 7
    invoke-static {v1}, Ll/s5l;->N(Ll/o45;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    move-object v3, v1

    .line 14
    check-cast v3, Ll/j5l;

    .line 15
    .line 16
    invoke-virtual {v3}, Ll/j5l;->q()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    instance-of v3, v13, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    move-object v3, v13

    .line 27
    check-cast v3, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 28
    .line 29
    iget v3, v3, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    .line 30
    .line 31
    const/16 v4, 0x19a

    .line 32
    .line 33
    if-eq v3, v4, :cond_0

    .line 34
    .line 35
    const/16 v4, 0x194

    .line 36
    .line 37
    if-ne v3, v4, :cond_1

    .line 38
    .line 39
    :cond_0
    sget-object v0, Lcom/google/android/exoplayer2/upstream/Loader;->d:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_1
    invoke-virtual {v1}, Ll/o45;->b()J

    .line 43
    .line 44
    .line 45
    move-result-wide v24

    .line 46
    new-instance v14, Ll/mtv;

    .line 47
    .line 48
    iget-wide v3, v1, Ll/o45;->a:J

    .line 49
    .line 50
    iget-object v5, v1, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/o45;->f()Landroid/net/Uri;

    .line 53
    .line 54
    .line 55
    move-result-object v18

    .line 56
    invoke-virtual {v1}, Ll/o45;->e()Ljava/util/Map;

    .line 57
    .line 58
    .line 59
    move-result-object v19

    .line 60
    move-wide/from16 v20, p2

    .line 61
    .line 62
    move-wide/from16 v22, p4

    .line 63
    .line 64
    move-wide v15, v3

    .line 65
    move-object/from16 v17, v5

    .line 66
    .line 67
    invoke-direct/range {v14 .. v25}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 68
    .line 69
    .line 70
    new-instance v3, Ll/ktx;

    .line 71
    .line 72
    iget v4, v1, Ll/o45;->c:I

    .line 73
    .line 74
    iget v5, v0, Ll/s5l;->b:I

    .line 75
    .line 76
    iget-object v6, v1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 77
    .line 78
    iget v7, v1, Ll/o45;->e:I

    .line 79
    .line 80
    iget-object v8, v1, Ll/o45;->f:Ljava/lang/Object;

    .line 81
    .line 82
    iget-wide v9, v1, Ll/o45;->g:J

    .line 83
    .line 84
    invoke-static {v9, v10}, Ll/bmk0;->l1(J)J

    .line 85
    .line 86
    .line 87
    move-result-wide v9

    .line 88
    iget-wide v11, v1, Ll/o45;->h:J

    .line 89
    .line 90
    invoke-static {v11, v12}, Ll/bmk0;->l1(J)J

    .line 91
    .line 92
    .line 93
    move-result-wide v11

    .line 94
    invoke-direct/range {v3 .. v12}, Ll/ktx;-><init>(IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 95
    .line 96
    .line 97
    new-instance v4, Lcom/google/android/exoplayer2/upstream/c$c;

    .line 98
    .line 99
    move/from16 v5, p7

    .line 100
    .line 101
    invoke-direct {v4, v14, v3, v13, v5}, Lcom/google/android/exoplayer2/upstream/c$c;-><init>(Ll/mtv;Ll/ktx;Ljava/io/IOException;I)V

    .line 102
    .line 103
    .line 104
    iget-object v3, v0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 105
    .line 106
    iget-object v5, v0, Ll/s5l;->d:Ll/f5l;

    .line 107
    .line 108
    invoke-virtual {v5}, Ll/f5l;->k()Ll/u9f;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    invoke-static {v5}, Ll/bgj0;->c(Ll/u9f;)Lcom/google/android/exoplayer2/upstream/c$a;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-interface {v3, v5, v4}, Lcom/google/android/exoplayer2/upstream/c;->b(Lcom/google/android/exoplayer2/upstream/c$a;Lcom/google/android/exoplayer2/upstream/c$c;)Lcom/google/android/exoplayer2/upstream/c$b;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    const/4 v5, 0x0

    .line 121
    if-eqz v3, :cond_2

    .line 122
    .line 123
    iget v6, v3, Lcom/google/android/exoplayer2/upstream/c$b;->a:I

    .line 124
    .line 125
    const/4 v7, 0x2

    .line 126
    if-ne v6, v7, :cond_2

    .line 127
    .line 128
    iget-object v6, v0, Ll/s5l;->d:Ll/f5l;

    .line 129
    .line 130
    iget-wide v7, v3, Lcom/google/android/exoplayer2/upstream/c$b;->b:J

    .line 131
    .line 132
    invoke-virtual {v6, v1, v7, v8}, Ll/f5l;->m(Ll/o45;J)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    move v15, v3

    .line 137
    goto :goto_0

    .line 138
    :cond_2
    move v15, v5

    .line 139
    :goto_0
    if-eqz v15, :cond_6

    .line 140
    .line 141
    if-eqz v2, :cond_5

    .line 142
    .line 143
    const-wide/16 v2, 0x0

    .line 144
    .line 145
    cmp-long v2, v24, v2

    .line 146
    .line 147
    if-nez v2, :cond_5

    .line 148
    .line 149
    iget-object v2, v0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    const/4 v4, 0x1

    .line 156
    sub-int/2addr v3, v4

    .line 157
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    check-cast v2, Ll/j5l;

    .line 162
    .line 163
    if-ne v2, v1, :cond_3

    .line 164
    .line 165
    move v5, v4

    .line 166
    :cond_3
    invoke-static {v5}, Ll/w11;->g(Z)V

    .line 167
    .line 168
    .line 169
    iget-object v2, v0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_4

    .line 176
    .line 177
    iget-wide v2, v0, Ll/s5l;->P:J

    .line 178
    .line 179
    iput-wide v2, v0, Ll/s5l;->Q:J

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_4
    iget-object v2, v0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-static {v2}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    check-cast v2, Ll/j5l;

    .line 189
    .line 190
    invoke-virtual {v2}, Ll/j5l;->o()V

    .line 191
    .line 192
    .line 193
    :cond_5
    :goto_1
    sget-object v2, Lcom/google/android/exoplayer2/upstream/Loader;->f:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 194
    .line 195
    :goto_2
    move-object/from16 v16, v2

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_6
    iget-object v2, v0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 199
    .line 200
    invoke-interface {v2, v4}, Lcom/google/android/exoplayer2/upstream/c;->a(Lcom/google/android/exoplayer2/upstream/c$c;)J

    .line 201
    .line 202
    .line 203
    move-result-wide v2

    .line 204
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    cmp-long v4, v2, v6

    .line 210
    .line 211
    if-eqz v4, :cond_7

    .line 212
    .line 213
    invoke-static {v5, v2, v3}, Lcom/google/android/exoplayer2/upstream/Loader;->h(ZJ)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    goto :goto_2

    .line 218
    :cond_7
    sget-object v2, Lcom/google/android/exoplayer2/upstream/Loader;->g:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :goto_3
    invoke-virtual/range {v16 .. v16}, Lcom/google/android/exoplayer2/upstream/Loader$c;->c()Z

    .line 222
    .line 223
    .line 224
    move-result v17

    .line 225
    move-object v3, v14

    .line 226
    xor-int/lit8 v14, v17, 0x1

    .line 227
    .line 228
    iget-object v2, v0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 229
    .line 230
    iget v4, v1, Ll/o45;->c:I

    .line 231
    .line 232
    iget v5, v0, Ll/s5l;->b:I

    .line 233
    .line 234
    iget-object v6, v1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 235
    .line 236
    iget v7, v1, Ll/o45;->e:I

    .line 237
    .line 238
    iget-object v8, v1, Ll/o45;->f:Ljava/lang/Object;

    .line 239
    .line 240
    iget-wide v9, v1, Ll/o45;->g:J

    .line 241
    .line 242
    iget-wide v11, v1, Ll/o45;->h:J

    .line 243
    .line 244
    invoke-virtual/range {v2 .. v14}, Lcom/google/android/exoplayer2/source/j$a;->p(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJLjava/io/IOException;Z)V

    .line 245
    .line 246
    .line 247
    if-nez v17, :cond_8

    .line 248
    .line 249
    const/4 v2, 0x0

    .line 250
    iput-object v2, v0, Ll/s5l;->u:Ll/o45;

    .line 251
    .line 252
    iget-object v2, v0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 253
    .line 254
    iget-wide v3, v1, Ll/o45;->a:J

    .line 255
    .line 256
    invoke-interface {v2, v3, v4}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 257
    .line 258
    .line 259
    :cond_8
    if-eqz v15, :cond_a

    .line 260
    .line 261
    iget-boolean v1, v0, Ll/s5l;->D:Z

    .line 262
    .line 263
    if-nez v1, :cond_9

    .line 264
    .line 265
    iget-wide v1, v0, Ll/s5l;->P:J

    .line 266
    .line 267
    invoke-virtual {v0, v1, v2}, Ll/s5l;->c(J)Z

    .line 268
    .line 269
    .line 270
    return-object v16

    .line 271
    :cond_9
    iget-object v1, v0, Ll/s5l;->c:Ll/s5l$b;

    .line 272
    .line 273
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer2/source/r$a;->j(Lcom/google/android/exoplayer2/source/r;)V

    .line 274
    .line 275
    .line 276
    :cond_a
    return-object v16
.end method

.method public Y()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5l;->x:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z(Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/c$c;Z)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s5l;->d:Ll/f5l;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/f5l;->o(Landroid/net/Uri;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    if-nez p3, :cond_1

    .line 17
    .line 18
    iget-object p3, p0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 19
    .line 20
    iget-object v0, p0, Ll/s5l;->d:Ll/f5l;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/f5l;->k()Ll/u9f;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/bgj0;->c(Ll/u9f;)Lcom/google/android/exoplayer2/upstream/c$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {p3, v0, p2}, Lcom/google/android/exoplayer2/upstream/c;->b(Lcom/google/android/exoplayer2/upstream/c$a;Lcom/google/android/exoplayer2/upstream/c$c;)Lcom/google/android/exoplayer2/upstream/c$b;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    iget p3, p2, Lcom/google/android/exoplayer2/upstream/c$b;->a:I

    .line 37
    .line 38
    const/4 v0, 0x2

    .line 39
    if-ne p3, v0, :cond_1

    .line 40
    .line 41
    iget-wide p2, p2, Lcom/google/android/exoplayer2/upstream/c$b;->b:J

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move-wide p2, v2

    .line 45
    :goto_0
    iget-object p0, p0, Ll/s5l;->d:Ll/f5l;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2, p3}, Ll/f5l;->q(Landroid/net/Uri;J)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    cmp-long p0, p2, v2

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    return v1

    .line 58
    :cond_2
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public a(Lcom/google/android/exoplayer2/k;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/s5l;->r:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s5l;->p:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-static {v0}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/j5l;

    .line 17
    .line 18
    iget-object v1, p0, Ll/s5l;->d:Ll/f5l;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/f5l;->c(Ll/j5l;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x1

    .line 25
    if-ne v1, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/j5l;->v()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    const/4 v0, 0x2

    .line 32
    if-ne v1, v0, :cond_2

    .line 33
    .line 34
    iget-boolean v0, p0, Ll/s5l;->T:Z

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->f()V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public b(II)Ll/qfj0;
    .locals 3

    .line 1
    sget-object v0, Ll/s5l;->Y:Ljava/util/Set;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/s5l;->K(II)Ll/qfj0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 20
    .line 21
    array-length v2, v1

    .line 22
    if-ge v0, v2, :cond_2

    .line 23
    .line 24
    iget-object v2, p0, Ll/s5l;->w:[I

    .line 25
    .line 26
    aget v2, v2, v0

    .line 27
    .line 28
    if-ne v2, p1, :cond_1

    .line 29
    .line 30
    aget-object v0, v1, v0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 v0, 0x0

    .line 37
    :goto_1
    if-nez v0, :cond_4

    .line 38
    .line 39
    iget-boolean v0, p0, Ll/s5l;->U:Z

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-static {p1, p2}, Ll/s5l;->B(II)Ll/rfe;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_3
    invoke-virtual {p0, p1, p2}, Ll/s5l;->C(II)Lcom/google/android/exoplayer2/source/q;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :cond_4
    const/4 p1, 0x5

    .line 53
    if-ne p2, p1, :cond_6

    .line 54
    .line 55
    iget-object p1, p0, Ll/s5l;->z:Ll/qfj0;

    .line 56
    .line 57
    if-nez p1, :cond_5

    .line 58
    .line 59
    new-instance p1, Ll/s5l$c;

    .line 60
    .line 61
    iget p2, p0, Ll/s5l;->l:I

    .line 62
    .line 63
    invoke-direct {p1, v0, p2}, Ll/s5l$c;-><init>(Ll/qfj0;I)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ll/s5l;->z:Ll/qfj0;

    .line 67
    .line 68
    :cond_5
    iget-object p0, p0, Ll/s5l;->z:Ll/qfj0;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_6
    return-object v0
.end method

.method public final b0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5l;->C:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/s5l;->S()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c(J)Z
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/s5l;->T:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_a

    .line 7
    .line 8
    iget-object v1, v0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_a

    .line 15
    .line 16
    iget-object v1, v0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_5

    .line 25
    .line 26
    :cond_0
    invoke-direct {v0}, Ll/s5l;->O()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 33
    .line 34
    iget-wide v3, v0, Ll/s5l;->Q:J

    .line 35
    .line 36
    iget-object v5, v0, Ll/s5l;->v:[Ll/s5l$d;

    .line 37
    .line 38
    array-length v6, v5

    .line 39
    move v7, v2

    .line 40
    :goto_0
    if-ge v7, v6, :cond_1

    .line 41
    .line 42
    aget-object v8, v5, v7

    .line 43
    .line 44
    iget-wide v9, v0, Ll/s5l;->Q:J

    .line 45
    .line 46
    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer2/source/q;->a0(J)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v7, v7, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    move-object v10, v1

    .line 53
    move-wide v8, v3

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    iget-object v1, v0, Ll/s5l;->o:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/s5l;->J()Ll/j5l;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Ll/j5l;->h()Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_3

    .line 66
    .line 67
    iget-wide v3, v3, Ll/o45;->h:J

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    iget-wide v4, v0, Ll/s5l;->P:J

    .line 71
    .line 72
    iget-wide v6, v3, Ll/o45;->g:J

    .line 73
    .line 74
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    .line 75
    .line 76
    .line 77
    move-result-wide v3

    .line 78
    goto :goto_1

    .line 79
    :goto_2
    iget-object v1, v0, Ll/s5l;->m:Ll/f5l$b;

    .line 80
    .line 81
    invoke-virtual {v1}, Ll/f5l$b;->a()V

    .line 82
    .line 83
    .line 84
    iget-object v5, v0, Ll/s5l;->d:Ll/f5l;

    .line 85
    .line 86
    iget-boolean v1, v0, Ll/s5l;->D:Z

    .line 87
    .line 88
    const/4 v3, 0x1

    .line 89
    if-nez v1, :cond_5

    .line 90
    .line 91
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_4

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_4
    move v11, v2

    .line 99
    goto :goto_4

    .line 100
    :cond_5
    :goto_3
    move v11, v3

    .line 101
    :goto_4
    iget-object v12, v0, Ll/s5l;->m:Ll/f5l$b;

    .line 102
    .line 103
    move-wide/from16 v6, p1

    .line 104
    .line 105
    invoke-virtual/range {v5 .. v12}, Ll/f5l;->e(JJLjava/util/List;ZLl/f5l$b;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, v0, Ll/s5l;->m:Ll/f5l$b;

    .line 109
    .line 110
    iget-boolean v4, v1, Ll/f5l$b;->b:Z

    .line 111
    .line 112
    iget-object v5, v1, Ll/f5l$b;->a:Ll/o45;

    .line 113
    .line 114
    iget-object v1, v1, Ll/f5l$b;->c:Landroid/net/Uri;

    .line 115
    .line 116
    if-eqz v4, :cond_6

    .line 117
    .line 118
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    iput-wide v1, v0, Ll/s5l;->Q:J

    .line 124
    .line 125
    iput-boolean v3, v0, Ll/s5l;->T:Z

    .line 126
    .line 127
    return v3

    .line 128
    :cond_6
    if-nez v5, :cond_8

    .line 129
    .line 130
    if-eqz v1, :cond_7

    .line 131
    .line 132
    iget-object v0, v0, Ll/s5l;->c:Ll/s5l$b;

    .line 133
    .line 134
    invoke-interface {v0, v1}, Ll/s5l$b;->k(Landroid/net/Uri;)V

    .line 135
    .line 136
    .line 137
    :cond_7
    return v2

    .line 138
    :cond_8
    invoke-static {v5}, Ll/s5l;->N(Ll/o45;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_9

    .line 143
    .line 144
    move-object v1, v5

    .line 145
    check-cast v1, Ll/j5l;

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ll/s5l;->M(Ll/j5l;)V

    .line 148
    .line 149
    .line 150
    :cond_9
    iput-object v5, v0, Ll/s5l;->u:Ll/o45;

    .line 151
    .line 152
    iget-object v1, v0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 153
    .line 154
    iget-object v2, v0, Ll/s5l;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 155
    .line 156
    iget v4, v5, Ll/o45;->c:I

    .line 157
    .line 158
    invoke-interface {v2, v4}, Lcom/google/android/exoplayer2/upstream/c;->d(I)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-virtual {v1, v5, v0, v2}, Lcom/google/android/exoplayer2/upstream/Loader;->n(Lcom/google/android/exoplayer2/upstream/Loader$e;Lcom/google/android/exoplayer2/upstream/Loader$b;I)J

    .line 163
    .line 164
    .line 165
    move-result-wide v10

    .line 166
    iget-object v12, v0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 167
    .line 168
    new-instance v13, Ll/mtv;

    .line 169
    .line 170
    iget-wide v7, v5, Ll/o45;->a:J

    .line 171
    .line 172
    iget-object v9, v5, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 173
    .line 174
    move-object v6, v13

    .line 175
    invoke-direct/range {v6 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;J)V

    .line 176
    .line 177
    .line 178
    iget v14, v5, Ll/o45;->c:I

    .line 179
    .line 180
    iget v15, v0, Ll/s5l;->b:I

    .line 181
    .line 182
    iget-object v0, v5, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 183
    .line 184
    iget v1, v5, Ll/o45;->e:I

    .line 185
    .line 186
    iget-object v2, v5, Ll/o45;->f:Ljava/lang/Object;

    .line 187
    .line 188
    iget-wide v6, v5, Ll/o45;->g:J

    .line 189
    .line 190
    iget-wide v4, v5, Ll/o45;->h:J

    .line 191
    .line 192
    move-object/from16 v16, v0

    .line 193
    .line 194
    move/from16 v17, v1

    .line 195
    .line 196
    move-object/from16 v18, v2

    .line 197
    .line 198
    move-wide/from16 v21, v4

    .line 199
    .line 200
    move-wide/from16 v19, v6

    .line 201
    .line 202
    invoke-virtual/range {v12 .. v22}, Lcom/google/android/exoplayer2/source/j$a;->t(Ll/mtv;IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 203
    .line 204
    .line 205
    return v3

    .line 206
    :cond_a
    :goto_5
    return v2
.end method

.method public varargs c0([Ll/dfj0;I[I)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/s5l;->D([Ll/dfj0;)Ll/ffj0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/s5l;->I:Ll/ffj0;

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/s5l;->J:Ljava/util/Set;

    .line 13
    .line 14
    array-length p1, p3

    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    if-ge v0, p1, :cond_0

    .line 17
    .line 18
    aget v1, p3, v0

    .line 19
    .line 20
    iget-object v2, p0, Ll/s5l;->J:Ljava/util/Set;

    .line 21
    .line 22
    iget-object v3, p0, Ll/s5l;->I:Ll/ffj0;

    .line 23
    .line 24
    invoke-virtual {v3, v1}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iput p2, p0, Ll/s5l;->L:I

    .line 35
    .line 36
    iget-object p1, p0, Ll/s5l;->r:Landroid/os/Handler;

    .line 37
    .line 38
    iget-object p2, p0, Ll/s5l;->c:Ll/s5l$b;

    .line 39
    .line 40
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    new-instance p3, Ll/p5l;

    .line 44
    .line 45
    invoke-direct {p3, p2}, Ll/p5l;-><init>(Ll/s5l$b;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/s5l;->k0()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public d()J
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/s5l;->T:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/high16 v0, -0x8000000000000000L

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-wide v0, p0, Ll/s5l;->Q:J

    .line 15
    .line 16
    return-wide v0

    .line 17
    :cond_1
    iget-wide v0, p0, Ll/s5l;->P:J

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/s5l;->J()Ll/j5l;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Ll/j5l;->h()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    iget-object v2, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x1

    .line 37
    if-le v2, v3, :cond_3

    .line 38
    .line 39
    iget-object v2, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    add-int/lit8 v3, v3, -0x2

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ll/j5l;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    const/4 v2, 0x0

    .line 55
    :goto_0
    if-eqz v2, :cond_4

    .line 56
    .line 57
    iget-wide v2, v2, Ll/o45;->h:J

    .line 58
    .line 59
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    :cond_4
    iget-boolean v2, p0, Ll/s5l;->C:Z

    .line 64
    .line 65
    if-eqz v2, :cond_5

    .line 66
    .line 67
    iget-object p0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 68
    .line 69
    array-length v2, p0

    .line 70
    const/4 v3, 0x0

    .line 71
    :goto_1
    if-ge v3, v2, :cond_5

    .line 72
    .line 73
    aget-object v4, p0, v3

    .line 74
    .line 75
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/source/q;->z()J

    .line 76
    .line 77
    .line 78
    move-result-wide v4

    .line 79
    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    add-int/lit8 v3, v3, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_5
    return-wide v0
.end method

.method public d0(ILl/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 10

    .line 1
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x3

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    move v0, v2

    .line 19
    :goto_0
    iget-object v3, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    add-int/lit8 v3, v3, -0x1

    .line 26
    .line 27
    if-ge v0, v3, :cond_1

    .line 28
    .line 29
    iget-object v3, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ll/j5l;

    .line 36
    .line 37
    invoke-virtual {p0, v3}, Ll/s5l;->H(Ll/j5l;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v3, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-static {v3, v2, v0}, Ll/bmk0;->U0(Ljava/util/List;II)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ll/j5l;

    .line 58
    .line 59
    iget-object v5, v0, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 60
    .line 61
    iget-object v3, p0, Ll/s5l;->G:Lcom/google/android/exoplayer2/k;

    .line 62
    .line 63
    invoke-virtual {v5, v3}, Lcom/google/android/exoplayer2/k;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-nez v3, :cond_2

    .line 68
    .line 69
    iget-object v3, p0, Ll/s5l;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 70
    .line 71
    iget v4, p0, Ll/s5l;->b:I

    .line 72
    .line 73
    iget v6, v0, Ll/o45;->e:I

    .line 74
    .line 75
    iget-object v7, v0, Ll/o45;->f:Ljava/lang/Object;

    .line 76
    .line 77
    iget-wide v8, v0, Ll/o45;->g:J

    .line 78
    .line 79
    invoke-virtual/range {v3 .. v9}, Lcom/google/android/exoplayer2/source/j$a;->h(ILcom/google/android/exoplayer2/k;ILjava/lang/Object;J)V

    .line 80
    .line 81
    .line 82
    :cond_2
    iput-object v5, p0, Ll/s5l;->G:Lcom/google/android/exoplayer2/k;

    .line 83
    .line 84
    :cond_3
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_4

    .line 91
    .line 92
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ll/j5l;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/j5l;->q()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_4

    .line 105
    .line 106
    return v1

    .line 107
    :cond_4
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 108
    .line 109
    aget-object v0, v0, p1

    .line 110
    .line 111
    iget-boolean v1, p0, Ll/s5l;->T:Z

    .line 112
    .line 113
    invoke-virtual {v0, p2, p3, p4, v1}, Lcom/google/android/exoplayer2/source/q;->R(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;IZ)I

    .line 114
    .line 115
    .line 116
    move-result p3

    .line 117
    const/4 p4, -0x5

    .line 118
    if-ne p3, p4, :cond_8

    .line 119
    .line 120
    iget-object p4, p2, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 121
    .line 122
    invoke-static {p4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p4

    .line 126
    check-cast p4, Lcom/google/android/exoplayer2/k;

    .line 127
    .line 128
    iget v0, p0, Ll/s5l;->B:I

    .line 129
    .line 130
    if-ne p1, v0, :cond_7

    .line 131
    .line 132
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 133
    .line 134
    aget-object p1, v0, p1

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/q;->P()J

    .line 137
    .line 138
    .line 139
    move-result-wide v0

    .line 140
    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->d(J)I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    :goto_1
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-ge v2, v0, :cond_5

    .line 151
    .line 152
    iget-object v0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ll/j5l;

    .line 159
    .line 160
    iget v0, v0, Ll/j5l;->k:I

    .line 161
    .line 162
    if-eq v0, p1, :cond_5

    .line 163
    .line 164
    add-int/lit8 v2, v2, 0x1

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_5
    iget-object p1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-ge v2, p1, :cond_6

    .line 174
    .line 175
    iget-object p0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    check-cast p0, Ll/j5l;

    .line 182
    .line 183
    iget-object p0, p0, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_6
    iget-object p0, p0, Ll/s5l;->F:Lcom/google/android/exoplayer2/k;

    .line 187
    .line 188
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    check-cast p0, Lcom/google/android/exoplayer2/k;

    .line 193
    .line 194
    :goto_2
    invoke-virtual {p4, p0}, Lcom/google/android/exoplayer2/k;->k(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 195
    .line 196
    .line 197
    move-result-object p4

    .line 198
    :cond_7
    iput-object p4, p2, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 199
    .line 200
    :cond_8
    return p3
.end method

.method public e(J)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object v0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/s5l;->u:Ll/o45;

    .line 25
    .line 26
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/s5l;->d:Ll/f5l;

    .line 30
    .line 31
    iget-object v1, p0, Ll/s5l;->u:Ll/o45;

    .line 32
    .line 33
    iget-object v2, p0, Ll/s5l;->o:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, p1, p2, v1, v2}, Ll/f5l;->v(JLl/o45;Ljava/util/List;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    iget-object p0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->f()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v0, p0, Ll/s5l;->o:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_0
    if-lez v0, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Ll/s5l;->d:Ll/f5l;

    .line 56
    .line 57
    iget-object v2, p0, Ll/s5l;->o:Ljava/util/List;

    .line 58
    .line 59
    add-int/lit8 v3, v0, -0x1

    .line 60
    .line 61
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ll/j5l;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ll/f5l;->c(Ll/j5l;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v2, 0x2

    .line 72
    if-ne v1, v2, :cond_2

    .line 73
    .line 74
    add-int/lit8 v0, v0, -0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    iget-object v1, p0, Ll/s5l;->o:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-ge v0, v1, :cond_3

    .line 84
    .line 85
    invoke-direct {p0, v0}, Ll/s5l;->F(I)V

    .line 86
    .line 87
    .line 88
    :cond_3
    iget-object v0, p0, Ll/s5l;->d:Ll/f5l;

    .line 89
    .line 90
    iget-object v1, p0, Ll/s5l;->o:Ljava/util/List;

    .line 91
    .line 92
    invoke-virtual {v0, p1, p2, v1}, Ll/f5l;->h(JLjava/util/List;)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    iget-object p2, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-ge p1, p2, :cond_4

    .line 103
    .line 104
    invoke-direct {p0, p1}, Ll/s5l;->F(I)V

    .line 105
    .line 106
    .line 107
    :cond_4
    :goto_1
    return-void
.end method

.method public e0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/s5l;->D:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_0

    .line 10
    .line 11
    aget-object v3, v0, v2

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/q;->Q()V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/upstream/Loader;->m(Lcom/google/android/exoplayer2/upstream/Loader$f;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/s5l;->r:Landroid/os/Handler;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Ll/s5l;->H:Z

    .line 32
    .line 33
    iget-object p0, p0, Ll/s5l;->s:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public f()J
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Ll/s5l;->Q:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/s5l;->T:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-wide/high16 v0, -0x8000000000000000L

    .line 15
    .line 16
    return-wide v0

    .line 17
    :cond_1
    invoke-virtual {p0}, Ll/s5l;->J()Ll/j5l;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-wide v0, p0, Ll/o45;->h:J

    .line 22
    .line 23
    return-wide v0
.end method

.method public g(JLl/nke0;)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5l;->d:Ll/f5l;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/f5l;->b(JLl/nke0;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public final g0(J)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_2

    .line 7
    .line 8
    iget-object v3, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 9
    .line 10
    aget-object v3, v3, v2

    .line 11
    .line 12
    invoke-virtual {v3, p1, p2, v1}, Lcom/google/android/exoplayer2/source/q;->Y(JZ)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-nez v3, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Ll/s5l;->O:[Z

    .line 19
    .line 20
    aget-boolean v3, v3, v2

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    iget-boolean v3, p0, Ll/s5l;->M:Z

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    :cond_0
    return v1

    .line 29
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public h0(JZ)Z
    .locals 3

    .line 1
    iput-wide p1, p0, Ll/s5l;->P:J

    .line 2
    .line 3
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/s5l;->Q:J

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-boolean v0, p0, Ll/s5l;->C:Z

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    if-nez p3, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Ll/s5l;->g0(J)Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    return v2

    .line 27
    :cond_1
    iput-wide p1, p0, Ll/s5l;->Q:J

    .line 28
    .line 29
    iput-boolean v2, p0, Ll/s5l;->T:Z

    .line 30
    .line 31
    iget-object p1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    iget-boolean p1, p0, Ll/s5l;->C:Z

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 49
    .line 50
    array-length p2, p1

    .line 51
    :goto_0
    if-ge v2, p2, :cond_2

    .line 52
    .line 53
    aget-object p3, p1, v2

    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/source/q;->r()V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object p0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->f()V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    iget-object p1, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->g()V

    .line 70
    .line 71
    .line 72
    invoke-direct {p0}, Ll/s5l;->f0()V

    .line 73
    .line 74
    .line 75
    :goto_1
    return v1
.end method

.method public i0([Ll/u9f;[Z[Ll/xwd0;[ZJZ)Z
    .locals 13

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    move-wide/from16 v2, p5

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s5l;->w()V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/s5l;->E:I

    .line 9
    .line 10
    const/4 v10, 0x0

    .line 11
    move v4, v10

    .line 12
    :goto_0
    array-length v5, p1

    .line 13
    const/4 v6, 0x0

    .line 14
    const/4 v11, 0x1

    .line 15
    if-ge v4, v5, :cond_2

    .line 16
    .line 17
    aget-object v5, v0, v4

    .line 18
    .line 19
    check-cast v5, Ll/o5l;

    .line 20
    .line 21
    if-eqz v5, :cond_1

    .line 22
    .line 23
    aget-object v7, p1, v4

    .line 24
    .line 25
    if-eqz v7, :cond_0

    .line 26
    .line 27
    aget-boolean v7, p2, v4

    .line 28
    .line 29
    if-nez v7, :cond_1

    .line 30
    .line 31
    :cond_0
    iget v7, p0, Ll/s5l;->E:I

    .line 32
    .line 33
    sub-int/2addr v7, v11

    .line 34
    iput v7, p0, Ll/s5l;->E:I

    .line 35
    .line 36
    invoke-virtual {v5}, Ll/o5l;->e()V

    .line 37
    .line 38
    .line 39
    aput-object v6, v0, v4

    .line 40
    .line 41
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    if-nez p7, :cond_5

    .line 45
    .line 46
    iget-boolean v4, p0, Ll/s5l;->S:Z

    .line 47
    .line 48
    if-eqz v4, :cond_3

    .line 49
    .line 50
    if-nez v1, :cond_4

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    iget-wide v4, p0, Ll/s5l;->P:J

    .line 54
    .line 55
    cmp-long v1, v2, v4

    .line 56
    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_4
    move v1, v10

    .line 61
    goto :goto_2

    .line 62
    :cond_5
    :goto_1
    move v1, v11

    .line 63
    :goto_2
    iget-object v4, p0, Ll/s5l;->d:Ll/f5l;

    .line 64
    .line 65
    invoke-virtual {v4}, Ll/f5l;->k()Ll/u9f;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    move v12, v1

    .line 70
    move-object v5, v4

    .line 71
    move v1, v10

    .line 72
    :goto_3
    array-length v7, p1

    .line 73
    if-ge v1, v7, :cond_a

    .line 74
    .line 75
    aget-object v7, p1, v1

    .line 76
    .line 77
    if-nez v7, :cond_6

    .line 78
    .line 79
    goto :goto_5

    .line 80
    :cond_6
    iget-object v8, p0, Ll/s5l;->I:Ll/ffj0;

    .line 81
    .line 82
    invoke-interface {v7}, Ll/vfj0;->h()Ll/dfj0;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    invoke-virtual {v8, v9}, Ll/ffj0;->c(Ll/dfj0;)I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    iget v9, p0, Ll/s5l;->L:I

    .line 91
    .line 92
    if-ne v8, v9, :cond_7

    .line 93
    .line 94
    iget-object v5, p0, Ll/s5l;->d:Ll/f5l;

    .line 95
    .line 96
    invoke-virtual {v5, v7}, Ll/f5l;->u(Ll/u9f;)V

    .line 97
    .line 98
    .line 99
    move-object v5, v7

    .line 100
    :cond_7
    aget-object v7, v0, v1

    .line 101
    .line 102
    if-nez v7, :cond_9

    .line 103
    .line 104
    iget v7, p0, Ll/s5l;->E:I

    .line 105
    .line 106
    add-int/2addr v7, v11

    .line 107
    iput v7, p0, Ll/s5l;->E:I

    .line 108
    .line 109
    new-instance v7, Ll/o5l;

    .line 110
    .line 111
    invoke-direct {v7, p0, v8}, Ll/o5l;-><init>(Ll/s5l;I)V

    .line 112
    .line 113
    .line 114
    aput-object v7, v0, v1

    .line 115
    .line 116
    aput-boolean v11, p4, v1

    .line 117
    .line 118
    iget-object v9, p0, Ll/s5l;->K:[I

    .line 119
    .line 120
    if-eqz v9, :cond_9

    .line 121
    .line 122
    invoke-virtual {v7}, Ll/o5l;->c()V

    .line 123
    .line 124
    .line 125
    if-nez v12, :cond_9

    .line 126
    .line 127
    iget-object v7, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 128
    .line 129
    iget-object v9, p0, Ll/s5l;->K:[I

    .line 130
    .line 131
    aget v8, v9, v8

    .line 132
    .line 133
    aget-object v7, v7, v8

    .line 134
    .line 135
    invoke-virtual {v7, v2, v3, v11}, Lcom/google/android/exoplayer2/source/q;->Y(JZ)Z

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    if-nez v8, :cond_8

    .line 140
    .line 141
    invoke-virtual {v7}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    if-eqz v7, :cond_8

    .line 146
    .line 147
    move v7, v11

    .line 148
    goto :goto_4

    .line 149
    :cond_8
    move v7, v10

    .line 150
    :goto_4
    move v12, v7

    .line 151
    :cond_9
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_a
    iget p1, p0, Ll/s5l;->E:I

    .line 155
    .line 156
    if-nez p1, :cond_d

    .line 157
    .line 158
    iget-object p1, p0, Ll/s5l;->d:Ll/f5l;

    .line 159
    .line 160
    invoke-virtual {p1}, Ll/f5l;->r()V

    .line 161
    .line 162
    .line 163
    iput-object v6, p0, Ll/s5l;->G:Lcom/google/android/exoplayer2/k;

    .line 164
    .line 165
    iput-boolean v11, p0, Ll/s5l;->R:Z

    .line 166
    .line 167
    iget-object p1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_c

    .line 179
    .line 180
    iget-boolean p1, p0, Ll/s5l;->C:Z

    .line 181
    .line 182
    if-eqz p1, :cond_b

    .line 183
    .line 184
    iget-object p1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 185
    .line 186
    array-length v1, p1

    .line 187
    :goto_6
    if-ge v10, v1, :cond_b

    .line 188
    .line 189
    aget-object v2, p1, v10

    .line 190
    .line 191
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->r()V

    .line 192
    .line 193
    .line 194
    add-int/lit8 v10, v10, 0x1

    .line 195
    .line 196
    goto :goto_6

    .line 197
    :cond_b
    iget-object p1, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 198
    .line 199
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/Loader;->f()V

    .line 200
    .line 201
    .line 202
    goto :goto_9

    .line 203
    :cond_c
    invoke-direct {p0}, Ll/s5l;->f0()V

    .line 204
    .line 205
    .line 206
    goto :goto_9

    .line 207
    :cond_d
    iget-object p1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-nez p1, :cond_10

    .line 214
    .line 215
    invoke-static {v5, v4}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-nez p1, :cond_10

    .line 220
    .line 221
    iget-boolean p1, p0, Ll/s5l;->S:Z

    .line 222
    .line 223
    if-nez p1, :cond_f

    .line 224
    .line 225
    const-wide/16 v6, 0x0

    .line 226
    .line 227
    cmp-long p1, v2, v6

    .line 228
    .line 229
    if-gez p1, :cond_e

    .line 230
    .line 231
    neg-long v6, v2

    .line 232
    :cond_e
    invoke-virtual {p0}, Ll/s5l;->J()Ll/j5l;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iget-object v1, p0, Ll/s5l;->d:Ll/f5l;

    .line 237
    .line 238
    invoke-virtual {v1, p1, v2, v3}, Ll/f5l;->a(Ll/j5l;J)[Ll/drx;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    move-object v1, v5

    .line 243
    move-wide v4, v6

    .line 244
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    iget-object v8, p0, Ll/s5l;->o:Ljava/util/List;

    .line 250
    .line 251
    invoke-interface/range {v1 .. v9}, Ll/u9f;->g(JJJLjava/util/List;[Ll/drx;)V

    .line 252
    .line 253
    .line 254
    iget-object v4, p0, Ll/s5l;->d:Ll/f5l;

    .line 255
    .line 256
    invoke-virtual {v4}, Ll/f5l;->j()Ll/dfj0;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    iget-object p1, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 261
    .line 262
    invoke-virtual {v4, p1}, Ll/dfj0;->d(Lcom/google/android/exoplayer2/k;)I

    .line 263
    .line 264
    .line 265
    move-result p1

    .line 266
    invoke-interface {v1}, Ll/u9f;->j()I

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-eq v1, p1, :cond_10

    .line 271
    .line 272
    :cond_f
    iput-boolean v11, p0, Ll/s5l;->R:Z

    .line 273
    .line 274
    move p1, v11

    .line 275
    move v12, p1

    .line 276
    goto :goto_7

    .line 277
    :cond_10
    move/from16 p1, p7

    .line 278
    .line 279
    :goto_7
    if-eqz v12, :cond_12

    .line 280
    .line 281
    invoke-virtual {p0, v2, v3, p1}, Ll/s5l;->h0(JZ)Z

    .line 282
    .line 283
    .line 284
    :goto_8
    array-length p1, v0

    .line 285
    if-ge v10, p1, :cond_12

    .line 286
    .line 287
    aget-object p1, v0, v10

    .line 288
    .line 289
    if-eqz p1, :cond_11

    .line 290
    .line 291
    aput-boolean v11, p4, v10

    .line 292
    .line 293
    :cond_11
    add-int/lit8 v10, v10, 0x1

    .line 294
    .line 295
    goto :goto_8

    .line 296
    :cond_12
    :goto_9
    invoke-virtual {p0, v0}, Ll/s5l;->p0([Ll/xwd0;)V

    .line 297
    .line 298
    .line 299
    iput-boolean v11, p0, Ll/s5l;->S:Z

    .line 300
    .line 301
    return v12
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5l;->j:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/s5l;->v:[Ll/s5l$d;

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
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->S()V

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

.method public j0(Lcom/google/android/exoplayer2/drm/DrmInitData;)V
    .locals 3
    .param p1    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/s5l;->W:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iput-object p1, p0, Ll/s5l;->W:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    iget-object v1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 13
    .line 14
    array-length v2, v1

    .line 15
    if-ge v0, v2, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Ll/s5l;->O:[Z

    .line 18
    .line 19
    aget-boolean v2, v2, v0

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    aget-object v1, v1, v0

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Ll/s5l$d;->h0(Lcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public k(Ll/mke0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final k0()V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "trackGroups",
            "optionalTrackGroups"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5l;->D:Z

    .line 3
    .line 4
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5l;->U:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/s5l;->r:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object p0, p0, Ll/s5l;->q:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5l;->d:Ll/f5l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f5l;->t(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m()Ll/ffj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s5l;->w()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/s5l;->I:Ll/ffj0;

    .line 5
    .line 6
    return-object p0
.end method

.method public m0(J)V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/s5l;->V:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Ll/s5l;->V:J

    .line 8
    .line 9
    iget-object p0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 10
    .line 11
    array-length v0, p0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_0

    .line 14
    .line 15
    aget-object v2, p0, v1

    .line 16
    .line 17
    invoke-virtual {v2, p1, p2}, Lcom/google/android/exoplayer2/source/q;->Z(J)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public bridge synthetic n(Lcom/google/android/exoplayer2/upstream/Loader$e;JJZ)V
    .locals 0

    .line 1
    check-cast p1, Ll/o45;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Ll/s5l;->V(Ll/o45;JJZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n0(IJ)I
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 10
    .line 11
    aget-object v0, v0, p1

    .line 12
    .line 13
    iget-boolean v1, p0, Ll/s5l;->T:Z

    .line 14
    .line 15
    invoke-virtual {v0, p2, p3, v1}, Lcom/google/android/exoplayer2/source/q;->E(JZ)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iget-object p0, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    invoke-static {p0, p3}, Ll/akq;->h(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/j5l;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/j5l;->q()Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-nez p3, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    invoke-virtual {p0, p1}, Ll/j5l;->m(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    sub-int/2addr p0, p3

    .line 45
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    :cond_1
    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer2/source/q;->d0(I)V

    .line 50
    .line 51
    .line 52
    return p2
.end method

.method public bridge synthetic o(Lcom/google/android/exoplayer2/upstream/Loader$e;JJ)V
    .locals 0

    .line 1
    check-cast p1, Ll/o45;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/s5l;->W(Ll/o45;JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/s5l;->w()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s5l;->K:[I

    .line 5
    .line 6
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/s5l;->K:[I

    .line 10
    .line 11
    aget p1, v0, p1

    .line 12
    .line 13
    iget-object v0, p0, Ll/s5l;->N:[Z

    .line 14
    .line 15
    aget-boolean v0, v0, p1

    .line 16
    .line 17
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/s5l;->N:[Z

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    aput-boolean v0, p0, p1

    .line 24
    .line 25
    return-void
.end method

.method public final p0([Ll/xwd0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s5l;->s:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    aget-object v2, p1, v1

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object v3, p0, Ll/s5l;->s:Ljava/util/ArrayList;

    .line 15
    .line 16
    check-cast v2, Ll/o5l;

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-void
.end method

.method public bridge synthetic q(Lcom/google/android/exoplayer2/upstream/Loader$e;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 0

    .line 1
    check-cast p1, Ll/o45;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p7}, Ll/s5l;->X(Ll/o45;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public s()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/s5l;->T()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/s5l;->T:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean p0, p0, Ll/s5l;->D:Z

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p0, "Loading finished before preparation is complete."

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, v0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    throw p0

    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public t(JZ)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/s5l;->C:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0}, Ll/s5l;->O()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 19
    .line 20
    aget-object v2, v2, v1

    .line 21
    .line 22
    iget-object v3, p0, Ll/s5l;->N:[Z

    .line 23
    .line 24
    aget-boolean v3, v3, v1

    .line 25
    .line 26
    invoke-virtual {v2, p1, p2, p3, v3}, Lcom/google/android/exoplayer2/source/q;->q(JZZ)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    :goto_1
    return-void
.end method

.method public final w()V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "trackGroups",
            "optionalTrackGroups"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/s5l;->D:Z

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/s5l;->I:Ll/ffj0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/s5l;->J:Ljava/util/Set;

    .line 12
    .line 13
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public x(I)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/s5l;->w()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s5l;->K:[I

    .line 5
    .line 6
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/s5l;->K:[I

    .line 10
    .line 11
    aget v0, v0, p1

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    const/4 v2, -0x2

    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/s5l;->J:Ljava/util/Set;

    .line 18
    .line 19
    iget-object p0, p0, Ll/s5l;->I:Ll/ffj0;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, -0x3

    .line 32
    return p0

    .line 33
    :cond_0
    return v2

    .line 34
    :cond_1
    iget-object p0, p0, Ll/s5l;->N:[Z

    .line 35
    .line 36
    aget-boolean p1, p0, v0

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    return v2

    .line 41
    :cond_2
    const/4 p1, 0x1

    .line 42
    aput-boolean p1, p0, v0

    .line 43
    .line 44
    return v0
.end method

.method public final y()V
    .locals 15
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "trackGroups",
            "optionalTrackGroups",
            "trackGroupToSampleQueueIndex"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, -0x2

    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    move v5, v1

    .line 8
    move v6, v2

    .line 9
    move v4, v3

    .line 10
    :goto_0
    const/4 v7, 0x2

    .line 11
    const/4 v8, 0x1

    .line 12
    if-ge v4, v0, :cond_5

    .line 13
    .line 14
    iget-object v9, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 15
    .line 16
    aget-object v9, v9, v4

    .line 17
    .line 18
    invoke-virtual {v9}, Lcom/google/android/exoplayer2/source/q;->F()Lcom/google/android/exoplayer2/k;

    .line 19
    .line 20
    .line 21
    move-result-object v9

    .line 22
    invoke-static {v9}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v9

    .line 26
    check-cast v9, Lcom/google/android/exoplayer2/k;

    .line 27
    .line 28
    iget-object v9, v9, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v9}, Ll/kb00;->s(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    if-eqz v10, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    invoke-static {v9}, Ll/kb00;->o(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    move v7, v8

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-static {v9}, Ll/kb00;->r(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    if-eqz v7, :cond_2

    .line 50
    .line 51
    const/4 v7, 0x3

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    move v7, v1

    .line 54
    :goto_1
    invoke-static {v7}, Ll/s5l;->L(I)I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    invoke-static {v5}, Ll/s5l;->L(I)I

    .line 59
    .line 60
    .line 61
    move-result v9

    .line 62
    if-le v8, v9, :cond_3

    .line 63
    .line 64
    move v6, v4

    .line 65
    move v5, v7

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    if-ne v7, v5, :cond_4

    .line 68
    .line 69
    if-eq v6, v2, :cond_4

    .line 70
    .line 71
    move v6, v2

    .line 72
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_5
    iget-object v1, p0, Ll/s5l;->d:Ll/f5l;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/f5l;->j()Ll/dfj0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget v4, v1, Ll/dfj0;->a:I

    .line 82
    .line 83
    iput v2, p0, Ll/s5l;->L:I

    .line 84
    .line 85
    new-array v2, v0, [I

    .line 86
    .line 87
    iput-object v2, p0, Ll/s5l;->K:[I

    .line 88
    .line 89
    move v2, v3

    .line 90
    :goto_3
    if-ge v2, v0, :cond_6

    .line 91
    .line 92
    iget-object v9, p0, Ll/s5l;->K:[I

    .line 93
    .line 94
    aput v2, v9, v2

    .line 95
    .line 96
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_6
    new-array v2, v0, [Ll/dfj0;

    .line 100
    .line 101
    move v9, v3

    .line 102
    :goto_4
    if-ge v9, v0, :cond_d

    .line 103
    .line 104
    iget-object v10, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 105
    .line 106
    aget-object v10, v10, v9

    .line 107
    .line 108
    invoke-virtual {v10}, Lcom/google/android/exoplayer2/source/q;->F()Lcom/google/android/exoplayer2/k;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    invoke-static {v10}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v10

    .line 116
    check-cast v10, Lcom/google/android/exoplayer2/k;

    .line 117
    .line 118
    if-ne v9, v6, :cond_a

    .line 119
    .line 120
    new-array v11, v4, [Lcom/google/android/exoplayer2/k;

    .line 121
    .line 122
    move v12, v3

    .line 123
    :goto_5
    if-ge v12, v4, :cond_9

    .line 124
    .line 125
    invoke-virtual {v1, v12}, Ll/dfj0;->c(I)Lcom/google/android/exoplayer2/k;

    .line 126
    .line 127
    .line 128
    move-result-object v13

    .line 129
    if-ne v5, v8, :cond_7

    .line 130
    .line 131
    iget-object v14, p0, Ll/s5l;->f:Lcom/google/android/exoplayer2/k;

    .line 132
    .line 133
    if-eqz v14, :cond_7

    .line 134
    .line 135
    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/k;->k(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 136
    .line 137
    .line 138
    move-result-object v13

    .line 139
    :cond_7
    if-ne v4, v8, :cond_8

    .line 140
    .line 141
    invoke-virtual {v10, v13}, Lcom/google/android/exoplayer2/k;->k(Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    goto :goto_6

    .line 146
    :cond_8
    invoke-static {v13, v10, v8}, Ll/s5l;->E(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Z)Lcom/google/android/exoplayer2/k;

    .line 147
    .line 148
    .line 149
    move-result-object v13

    .line 150
    :goto_6
    aput-object v13, v11, v12

    .line 151
    .line 152
    add-int/lit8 v12, v12, 0x1

    .line 153
    .line 154
    goto :goto_5

    .line 155
    :cond_9
    new-instance v10, Ll/dfj0;

    .line 156
    .line 157
    iget-object v12, p0, Ll/s5l;->a:Ljava/lang/String;

    .line 158
    .line 159
    invoke-direct {v10, v12, v11}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 160
    .line 161
    .line 162
    aput-object v10, v2, v9

    .line 163
    .line 164
    iput v9, p0, Ll/s5l;->L:I

    .line 165
    .line 166
    goto :goto_9

    .line 167
    :cond_a
    if-ne v5, v7, :cond_b

    .line 168
    .line 169
    iget-object v11, v10, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v11}, Ll/kb00;->o(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result v11

    .line 175
    if-eqz v11, :cond_b

    .line 176
    .line 177
    iget-object v11, p0, Ll/s5l;->f:Lcom/google/android/exoplayer2/k;

    .line 178
    .line 179
    goto :goto_7

    .line 180
    :cond_b
    const/4 v11, 0x0

    .line 181
    :goto_7
    new-instance v12, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .line 185
    .line 186
    iget-object v13, p0, Ll/s5l;->a:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v13, ":muxed:"

    .line 192
    .line 193
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    if-ge v9, v6, :cond_c

    .line 197
    .line 198
    move v13, v9

    .line 199
    goto :goto_8

    .line 200
    :cond_c
    add-int/lit8 v13, v9, -0x1

    .line 201
    .line 202
    :goto_8
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v12

    .line 209
    new-instance v13, Ll/dfj0;

    .line 210
    .line 211
    invoke-static {v11, v10, v3}, Ll/s5l;->E(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k;Z)Lcom/google/android/exoplayer2/k;

    .line 212
    .line 213
    .line 214
    move-result-object v10

    .line 215
    filled-new-array {v10}, [Lcom/google/android/exoplayer2/k;

    .line 216
    .line 217
    .line 218
    move-result-object v10

    .line 219
    invoke-direct {v13, v12, v10}, Ll/dfj0;-><init>(Ljava/lang/String;[Lcom/google/android/exoplayer2/k;)V

    .line 220
    .line 221
    .line 222
    aput-object v13, v2, v9

    .line 223
    .line 224
    :goto_9
    add-int/lit8 v9, v9, 0x1

    .line 225
    .line 226
    goto :goto_4

    .line 227
    :cond_d
    invoke-virtual {p0, v2}, Ll/s5l;->D([Ll/dfj0;)Ll/ffj0;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iput-object v0, p0, Ll/s5l;->I:Ll/ffj0;

    .line 232
    .line 233
    iget-object v0, p0, Ll/s5l;->J:Ljava/util/Set;

    .line 234
    .line 235
    if-nez v0, :cond_e

    .line 236
    .line 237
    move v3, v8

    .line 238
    :cond_e
    invoke-static {v3}, Ll/w11;->g(Z)V

    .line 239
    .line 240
    .line 241
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 242
    .line 243
    iput-object v0, p0, Ll/s5l;->J:Ljava/util/Set;

    .line 244
    .line 245
    return-void
.end method

.method public final z(I)Z
    .locals 4

    .line 1
    move v0, p1

    .line 2
    :goto_0
    iget-object v1, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    iget-object v2, p0, Ll/s5l;->n:Ljava/util/ArrayList;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/j5l;

    .line 18
    .line 19
    iget-boolean v1, v1, Ll/j5l;->n:Z

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    return v3

    .line 24
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ll/j5l;

    .line 32
    .line 33
    move v0, v3

    .line 34
    :goto_1
    iget-object v1, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 35
    .line 36
    array-length v1, v1

    .line 37
    if-ge v0, v1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ll/j5l;->m(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v2, p0, Ll/s5l;->v:[Ll/s5l$d;

    .line 44
    .line 45
    aget-object v2, v2, v0

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-le v2, v1, :cond_2

    .line 52
    .line 53
    return v3

    .line 54
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    const/4 p0, 0x1

    .line 58
    return p0
.end method
