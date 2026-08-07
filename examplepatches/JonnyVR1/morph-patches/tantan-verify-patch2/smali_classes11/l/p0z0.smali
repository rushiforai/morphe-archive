.class public final Ll/p0z0;
.super Ll/tyy0;
.source "SourceFile"


# static fields
.field public static final t:Ll/trs0;


# instance fields
.field public final k:[Ll/mzy0;

.field public final l:[Ll/d0u0;

.field public final m:Ljava/util/ArrayList;

.field public final n:Ljava/util/Map;

.field public final o:Ll/esw0;

.field public p:I

.field public q:[[J

.field public r:Lcom/google/android/gms/internal/ads/zzvg;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final s:Ll/vyy0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lxr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lxr0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "MergingMediaSource"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/lxr0;->a(Ljava/lang/String;)Ll/lxr0;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ll/lxr0;->c()Ll/trs0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/p0z0;->t:Ll/trs0;

    .line 16
    .line 17
    return-void
.end method

.method public varargs constructor <init>(ZZ[Ll/mzy0;)V
    .locals 0

    .line 1
    new-instance p1, Ll/vyy0;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/vyy0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/tyy0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/p0z0;->s:Ll/vyy0;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/p0z0;->m:Ljava/util/ArrayList;

    .line 23
    .line 24
    const/4 p1, -0x1

    .line 25
    iput p1, p0, Ll/p0z0;->p:I

    .line 26
    .line 27
    array-length p1, p3

    .line 28
    new-array p1, p1, [Ll/d0u0;

    .line 29
    .line 30
    iput-object p1, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    new-array p1, p1, [[J

    .line 34
    .line 35
    iput-object p1, p0, Ll/p0z0;->q:[[J

    .line 36
    .line 37
    new-instance p1, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/p0z0;->n:Ljava/util/Map;

    .line 43
    .line 44
    const/16 p1, 0x8

    .line 45
    .line 46
    invoke-static {p1}, Ll/nsw0;->a(I)Ll/lsw0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 p2, 0x2

    .line 51
    invoke-virtual {p1, p2}, Ll/lsw0;->b(I)Ll/ksw0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ll/ksw0;->c()Ll/xrw0;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Ll/p0z0;->o:Ll/esw0;

    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public final bridge synthetic A(Ljava/lang/Object;Ll/mzy0;Ll/d0u0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/p0z0;->r:Lcom/google/android/gms/internal/ads/zzvg;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget v0, p0, Ll/p0z0;->p:I

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p3}, Ll/d0u0;->b()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/p0z0;->p:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p3}, Ll/d0u0;->b()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v1, p0, Ll/p0z0;->p:I

    .line 24
    .line 25
    if-eq v0, v1, :cond_2

    .line 26
    .line 27
    new-instance p1, Lcom/google/android/gms/internal/ads/zzvg;

    .line 28
    .line 29
    invoke-direct {p1, v2}, Lcom/google/android/gms/internal/ads/zzvg;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/p0z0;->r:Lcom/google/android/gms/internal/ads/zzvg;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    move v0, v1

    .line 36
    :goto_0
    iget-object v1, p0, Ll/p0z0;->q:[[J

    .line 37
    .line 38
    array-length v1, v1

    .line 39
    if-nez v1, :cond_3

    .line 40
    .line 41
    iget-object v1, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 42
    .line 43
    array-length v1, v1

    .line 44
    const/4 v3, 0x2

    .line 45
    new-array v3, v3, [I

    .line 46
    .line 47
    const/4 v4, 0x1

    .line 48
    aput v1, v3, v4

    .line 49
    .line 50
    aput v0, v3, v2

    .line 51
    .line 52
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 53
    .line 54
    invoke-static {v0, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, [[J

    .line 59
    .line 60
    iput-object v0, p0, Ll/p0z0;->q:[[J

    .line 61
    .line 62
    :cond_3
    iget-object v0, p0, Ll/p0z0;->m:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 68
    .line 69
    check-cast p1, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    aput-object p3, p2, p1

    .line 76
    .line 77
    iget-object p1, p0, Ll/p0z0;->m:Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    iget-object p1, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 86
    .line 87
    aget-object p1, p1, v2

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/txy0;->w(Ll/d0u0;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    :goto_1
    return-void
.end method

.method public final bridge synthetic E(Ljava/lang/Object;Ll/kzy0;)Ll/kzy0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    check-cast p1, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-object p2

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final G()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p0z0;->r:Lcom/google/android/gms/internal/ads/zzvg;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ll/tyy0;->G()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    throw v0
.end method

.method public final d()Ll/trs0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    aget-object p0, p0, v0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/mzy0;->d()Ll/trs0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Ll/p0z0;->t:Ll/trs0;

    .line 15
    .line 16
    return-object p0
.end method

.method public final i(Ll/kzy0;Ll/c6z0;J)Ll/izy0;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 4
    .line 5
    array-length v1, v1

    .line 6
    new-array v2, v1, [Ll/izy0;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aget-object v0, v0, v3

    .line 10
    .line 11
    iget-object v4, p1, Ll/kzy0;->a:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {v0, v4}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :goto_0
    if-ge v3, v1, :cond_0

    .line 18
    .line 19
    iget-object v4, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 20
    .line 21
    aget-object v4, v4, v3

    .line 22
    .line 23
    invoke-virtual {v4, v0}, Ll/d0u0;->f(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {p1, v4}, Ll/kzy0;->a(Ljava/lang/Object;)Ll/kzy0;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    iget-object v5, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 32
    .line 33
    aget-object v5, v5, v3

    .line 34
    .line 35
    iget-object v6, p0, Ll/p0z0;->q:[[J

    .line 36
    .line 37
    aget-object v6, v6, v0

    .line 38
    .line 39
    aget-wide v7, v6, v3

    .line 40
    .line 41
    sub-long v6, p3, v7

    .line 42
    .line 43
    invoke-interface {v5, v4, p2, v6, v7}, Ll/mzy0;->i(Ll/kzy0;Ll/c6z0;J)Ll/izy0;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    aput-object v4, v2, v3

    .line 48
    .line 49
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object p1, p0, Ll/p0z0;->s:Ll/vyy0;

    .line 53
    .line 54
    new-instance p2, Ll/o0z0;

    .line 55
    .line 56
    iget-object p0, p0, Ll/p0z0;->q:[[J

    .line 57
    .line 58
    aget-object p0, p0, v0

    .line 59
    .line 60
    invoke-direct {p2, p1, p0, v2}, Ll/o0z0;-><init>(Ll/vyy0;[J[Ll/izy0;)V

    .line 61
    .line 62
    .line 63
    return-object p2
.end method

.method public final k(Ll/izy0;)V
    .locals 3

    .line 1
    check-cast p1, Ll/o0z0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    iget-object v1, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 5
    .line 6
    array-length v2, v1

    .line 7
    if-ge v0, v2, :cond_0

    .line 8
    .line 9
    aget-object v1, v1, v0

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/o0z0;->h(I)Ll/izy0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v1, v2}, Ll/mzy0;->k(Ll/izy0;)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public final m(Ll/trs0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/mzy0;->m(Ll/trs0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final v(Ll/btx0;)V
    .locals 2
    .param p1    # Ll/btx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/tyy0;->v(Ll/btx0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    :goto_0
    iget-object v0, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    if-ge p1, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    aget-object v0, v0, p1

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Ll/tyy0;->B(Ljava/lang/Object;Ll/mzy0;)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public final x()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/tyy0;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p0z0;->l:[Ll/d0u0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Ll/p0z0;->p:I

    .line 12
    .line 13
    iput-object v1, p0, Ll/p0z0;->r:Lcom/google/android/gms/internal/ads/zzvg;

    .line 14
    .line 15
    iget-object v0, p0, Ll/p0z0;->m:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/p0z0;->m:Ljava/util/ArrayList;

    .line 21
    .line 22
    iget-object p0, p0, Ll/p0z0;->k:[Ll/mzy0;

    .line 23
    .line 24
    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method
