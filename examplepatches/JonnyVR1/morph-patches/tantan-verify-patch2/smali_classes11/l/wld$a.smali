.class public final Ll/wld$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wld;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/c0$b;

.field public b:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "Lcom/google/android/exoplayer2/c0;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/google/android/exoplayer2/source/i$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Lcom/google/android/exoplayer2/source/i$b;

.field public f:Lcom/google/android/exoplayer2/source/i$b;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/c0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wld$a;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 5
    .line 6
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 11
    .line 12
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/wld$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/wld$a;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Lcom/google/android/exoplayer2/t;Lcom/google/common/collect/ImmutableList;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;
    .locals 10
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/t;",
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ">;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "Lcom/google/android/exoplayer2/c0$b;",
            ")",
            "Lcom/google/android/exoplayer2/source/i$b;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentPeriodIndex()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    move-object v5, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/c0;->q(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    move-object v5, v2

    .line 23
    :goto_0
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->isPlayingAd()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    invoke-virtual {v0, v1, p3}, Lcom/google/android/exoplayer2/c0;->j(ILcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentPosition()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 49
    .line 50
    .line 51
    move-result-wide v6

    .line 52
    sub-long/2addr v1, v6

    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/c0$b;->g(J)I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    :goto_1
    move v9, p3

    .line 58
    goto :goto_3

    .line 59
    :cond_2
    :goto_2
    const/4 p3, -0x1

    .line 60
    goto :goto_1

    .line 61
    :goto_3
    const/4 p3, 0x0

    .line 62
    :goto_4
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-ge p3, v0, :cond_4

    .line 67
    .line 68
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    move-object v4, v0

    .line 73
    check-cast v4, Lcom/google/android/exoplayer2/source/i$b;

    .line 74
    .line 75
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->isPlayingAd()Z

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentAdGroupIndex()I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentAdIndexInAdGroup()I

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    invoke-static/range {v4 .. v9}, Ll/wld$a;->i(Lcom/google/android/exoplayer2/source/i$b;Ljava/lang/Object;ZIII)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    return-object v4

    .line 94
    :cond_3
    add-int/lit8 p3, p3, 0x1

    .line 95
    .line 96
    goto :goto_4

    .line 97
    :cond_4
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    if-eqz p2, :cond_5

    .line 104
    .line 105
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->isPlayingAd()Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentAdGroupIndex()I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    invoke-interface {p0}, Lcom/google/android/exoplayer2/t;->getCurrentAdIndexInAdGroup()I

    .line 114
    .line 115
    .line 116
    move-result v8

    .line 117
    move-object v4, p2

    .line 118
    invoke-static/range {v4 .. v9}, Ll/wld$a;->i(Lcom/google/android/exoplayer2/source/i$b;Ljava/lang/Object;ZIII)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_5

    .line 123
    .line 124
    return-object v4

    .line 125
    :cond_5
    return-object v3
.end method

.method public static i(Lcom/google/android/exoplayer2/source/i$b;Ljava/lang/Object;ZIII)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iget p1, p0, Ll/fyx;->b:I

    .line 14
    .line 15
    if-ne p1, p3, :cond_1

    .line 16
    .line 17
    iget p1, p0, Ll/fyx;->c:I

    .line 18
    .line 19
    if-eq p1, p4, :cond_2

    .line 20
    .line 21
    :cond_1
    if-nez p2, :cond_3

    .line 22
    .line 23
    iget p1, p0, Ll/fyx;->b:I

    .line 24
    .line 25
    const/4 p2, -0x1

    .line 26
    if-ne p1, p2, :cond_3

    .line 27
    .line 28
    iget p0, p0, Ll/fyx;->e:I

    .line 29
    .line 30
    if-ne p0, p5, :cond_3

    .line 31
    .line 32
    :cond_2
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_3
    return v0
.end method


# virtual methods
.method public final b(Lcom/google/common/collect/ImmutableMap$b;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)V
    .locals 2
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap$b<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "Lcom/google/android/exoplayer2/c0;",
            ">;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "Lcom/google/android/exoplayer2/c0;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, p2, p3}, Lcom/google/common/collect/ImmutableMap$b;->g(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$b;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iget-object p0, p0, Ll/wld$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/google/android/exoplayer2/c0;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1, p2, p0}, Lcom/google/common/collect/ImmutableMap$b;->g(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$b;

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public d()Lcom/google/android/exoplayer2/source/i$b;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/google/android/exoplayer2/source/i$b;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 12
    .line 13
    invoke-static {p0}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    return-object p0
.end method

.method public f(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/c0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wld$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/exoplayer2/c0;

    .line 8
    .line 9
    return-object p0
.end method

.method public g()Lcom/google/android/exoplayer2/source/i$b;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/google/android/exoplayer2/source/i$b;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wld$a;->f:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Lcom/google/android/exoplayer2/t;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    iget-object v2, p0, Ll/wld$a;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 6
    .line 7
    invoke-static {p1, v0, v1, v2}, Ll/wld$a;->c(Lcom/google/android/exoplayer2/t;Lcom/google/common/collect/ImmutableList;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    return-void
.end method

.method public k(Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/t;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ">;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "Lcom/google/android/exoplayer2/t;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 19
    .line 20
    iput-object p1, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 21
    .line 22
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 27
    .line 28
    iput-object p1, p0, Ll/wld$a;->f:Lcom/google/android/exoplayer2/source/i$b;

    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 35
    .line 36
    iget-object p2, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 37
    .line 38
    iget-object v0, p0, Ll/wld$a;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 39
    .line 40
    invoke-static {p3, p1, p2, v0}, Ll/wld$a;->c(Lcom/google/android/exoplayer2/t;Lcom/google/common/collect/ImmutableList;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 45
    .line 46
    :cond_1
    invoke-interface {p3}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/wld$a;->m(Lcom/google/android/exoplayer2/c0;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public l(Lcom/google/android/exoplayer2/t;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    iget-object v2, p0, Ll/wld$a;->a:Lcom/google/android/exoplayer2/c0$b;

    .line 6
    .line 7
    invoke-static {p1, v0, v1, v2}, Ll/wld$a;->c(Lcom/google/android/exoplayer2/t;Lcom/google/common/collect/ImmutableList;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/source/i$b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    invoke-interface {p1}, Lcom/google/android/exoplayer2/t;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/wld$a;->m(Lcom/google/android/exoplayer2/c0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final m(Lcom/google/android/exoplayer2/c0;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, p1}, Ll/wld$a;->b(Lcom/google/common/collect/ImmutableMap$b;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/wld$a;->f:Lcom/google/android/exoplayer2/source/i$b;

    .line 19
    .line 20
    iget-object v2, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/wld$a;->f:Lcom/google/android/exoplayer2/source/i$b;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, p1}, Ll/wld$a;->b(Lcom/google/common/collect/ImmutableMap$b;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 34
    .line 35
    iget-object v2, p0, Ll/wld$a;->e:Lcom/google/android/exoplayer2/source/i$b;

    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 44
    .line 45
    iget-object v2, p0, Ll/wld$a;->f:Lcom/google/android/exoplayer2/source/i$b;

    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_3

    .line 52
    .line 53
    iget-object v1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 54
    .line 55
    invoke-virtual {p0, v0, v1, p1}, Ll/wld$a;->b(Lcom/google/common/collect/ImmutableMap$b;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 v1, 0x0

    .line 60
    :goto_0
    iget-object v2, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->size()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget-object v3, p0, Ll/wld$a;->b:Lcom/google/common/collect/ImmutableList;

    .line 67
    .line 68
    if-ge v1, v2, :cond_2

    .line 69
    .line 70
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Lcom/google/android/exoplayer2/source/i$b;

    .line 75
    .line 76
    invoke-virtual {p0, v0, v2, p1}, Ll/wld$a;->b(Lcom/google/common/collect/ImmutableMap$b;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)V

    .line 77
    .line 78
    .line 79
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    iget-object v1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 83
    .line 84
    invoke-virtual {v3, v1}, Lcom/google/common/collect/ImmutableList;->contains(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    iget-object v1, p0, Ll/wld$a;->d:Lcom/google/android/exoplayer2/source/i$b;

    .line 91
    .line 92
    invoke-virtual {p0, v0, v1, p1}, Ll/wld$a;->b(Lcom/google/common/collect/ImmutableMap$b;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    :goto_1
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$b;->d()Lcom/google/common/collect/ImmutableMap;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Ll/wld$a;->c:Lcom/google/common/collect/ImmutableMap;

    .line 100
    .line 101
    return-void
.end method
