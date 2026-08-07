.class public final Ll/pey0;
.super Ll/jvx0;
.source "SourceFile"


# static fields
.field public static final synthetic o:I


# instance fields
.field public final h:I

.field public final i:I

.field public final j:[I

.field public final k:[I

.field public final l:[Ll/d0u0;

.field public final m:[Ljava/lang/Object;

.field public final n:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Ljava/util/Collection;Ll/i2z0;)V
    .locals 6

    .line 81
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Ll/d0u0;

    .line 82
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ll/hby0;

    add-int/lit8 v5, v3, 0x1

    .line 83
    invoke-interface {v4}, Ll/hby0;->zza()Ll/d0u0;

    move-result-object v4

    aput-object v4, v0, v3

    move v3, v5

    goto :goto_0

    .line 84
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Object;

    .line 85
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll/hby0;

    add-int/lit8 v4, v2, 0x1

    .line 86
    invoke-interface {v3}, Ll/hby0;->zzb()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    move v2, v4

    goto :goto_1

    .line 87
    :cond_1
    invoke-direct {p0, v0, v1, p2}, Ll/pey0;-><init>([Ll/d0u0;[Ljava/lang/Object;Ll/i2z0;)V

    return-void
.end method

.method public constructor <init>([Ll/d0u0;[Ljava/lang/Object;Ll/i2z0;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p3}, Ll/jvx0;-><init>(ZLl/i2z0;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 6
    .line 7
    array-length p3, p1

    .line 8
    new-array v1, p3, [I

    .line 9
    .line 10
    iput-object v1, p0, Ll/pey0;->j:[I

    .line 11
    .line 12
    new-array p3, p3, [I

    .line 13
    .line 14
    iput-object p3, p0, Ll/pey0;->k:[I

    .line 15
    .line 16
    iput-object p2, p0, Ll/pey0;->m:[Ljava/lang/Object;

    .line 17
    .line 18
    new-instance p3, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p3, p0, Ll/pey0;->n:Ljava/util/HashMap;

    .line 24
    .line 25
    move p3, v0

    .line 26
    move v1, p3

    .line 27
    move v2, v1

    .line 28
    :goto_0
    array-length v3, p1

    .line 29
    if-ge v0, v3, :cond_0

    .line 30
    .line 31
    aget-object v3, p1, v0

    .line 32
    .line 33
    iget-object v4, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 34
    .line 35
    aput-object v3, v4, v2

    .line 36
    .line 37
    iget-object v4, p0, Ll/pey0;->k:[I

    .line 38
    .line 39
    aput p3, v4, v2

    .line 40
    .line 41
    iget-object v4, p0, Ll/pey0;->j:[I

    .line 42
    .line 43
    aput v1, v4, v2

    .line 44
    .line 45
    invoke-virtual {v3}, Ll/d0u0;->c()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    add-int/2addr p3, v3

    .line 50
    iget-object v3, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 51
    .line 52
    aget-object v3, v3, v2

    .line 53
    .line 54
    invoke-virtual {v3}, Ll/d0u0;->b()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    add-int/2addr v1, v3

    .line 59
    iget-object v3, p0, Ll/pey0;->n:Ljava/util/HashMap;

    .line 60
    .line 61
    aget-object v4, p2, v2

    .line 62
    .line 63
    add-int/lit8 v5, v2, 0x1

    .line 64
    .line 65
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    move v2, v5

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iput p3, p0, Ll/pey0;->h:I

    .line 77
    .line 78
    iput v1, p0, Ll/pey0;->i:I

    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pey0;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/pey0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final p(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pey0;->n:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final q(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pey0;->j:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, p1, v0, v0}, Ll/mpw0;->q([IIZZ)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final r(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pey0;->k:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, p1, v0, v0}, Ll/mpw0;->q([IIZZ)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final s(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pey0;->j:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public final t(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pey0;->k:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public final u(I)Ll/d0u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public final v(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pey0;->m:[Ljava/lang/Object;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public final y()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final z(Ll/i2z0;)Ll/pey0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v0, v0, [Ll/d0u0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/pey0;->l:[Ll/d0u0;

    .line 8
    .line 9
    array-length v3, v2

    .line 10
    if-ge v1, v3, :cond_0

    .line 11
    .line 12
    new-instance v3, Ll/mey0;

    .line 13
    .line 14
    aget-object v2, v2, v1

    .line 15
    .line 16
    invoke-direct {v3, p0, v2}, Ll/mey0;-><init>(Ll/pey0;Ll/d0u0;)V

    .line 17
    .line 18
    .line 19
    aput-object v3, v0, v1

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p0, p0, Ll/pey0;->m:[Ljava/lang/Object;

    .line 25
    .line 26
    new-instance v1, Ll/pey0;

    .line 27
    .line 28
    invoke-direct {v1, v0, p0, p1}, Ll/pey0;-><init>([Ll/d0u0;[Ljava/lang/Object;Ll/i2z0;)V

    .line 29
    .line 30
    .line 31
    return-object v1
.end method
