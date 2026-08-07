.class public final Ll/x6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y6;


# instance fields
.field public final a:Ll/g1w;

.field public final b:Ll/g1w;

.field public final c:Ll/g1w;

.field public final d:Ll/g1w;

.field public final e:Ll/g1w;

.field public final f:Ll/g1w;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/common/cache/LongAddables;->a()Ll/g1w;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/x6;->a:Ll/g1w;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/common/cache/LongAddables;->a()Ll/g1w;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/x6;->b:Ll/g1w;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/common/cache/LongAddables;->a()Ll/g1w;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/x6;->c:Ll/g1w;

    .line 21
    .line 22
    invoke-static {}, Lcom/google/common/cache/LongAddables;->a()Ll/g1w;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/x6;->d:Ll/g1w;

    .line 27
    .line 28
    invoke-static {}, Lcom/google/common/cache/LongAddables;->a()Ll/g1w;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/x6;->e:Ll/g1w;

    .line 33
    .line 34
    invoke-static {}, Lcom/google/common/cache/LongAddables;->a()Ll/g1w;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/x6;->f:Ll/g1w;

    .line 39
    .line 40
    return-void
.end method

.method public static h(J)J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    return-wide p0

    .line 8
    :cond_0
    const-wide p0, 0x7fffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    return-wide p0
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/x6;->a:Ll/g1w;

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-interface {p0, v0, v1}, Ll/g1w;->add(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6;->f:Ll/g1w;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g1w;->increment()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x6;->c:Ll/g1w;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/g1w;->increment()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/x6;->e:Ll/g1w;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Ll/g1w;->add(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/x6;->b:Ll/g1w;

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-interface {p0, v0, v1}, Ll/g1w;->add(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x6;->d:Ll/g1w;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/g1w;->increment()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/x6;->e:Ll/g1w;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Ll/g1w;->add(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f()Ll/hy3;
    .locals 13

    .line 1
    new-instance v0, Ll/hy3;

    .line 2
    .line 3
    iget-object v1, p0, Ll/x6;->a:Ll/g1w;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/g1w;->sum()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ll/x6;->h(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iget-object v3, p0, Ll/x6;->b:Ll/g1w;

    .line 14
    .line 15
    invoke-interface {v3}, Ll/g1w;->sum()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-static {v3, v4}, Ll/x6;->h(J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    iget-object v5, p0, Ll/x6;->c:Ll/g1w;

    .line 24
    .line 25
    invoke-interface {v5}, Ll/g1w;->sum()J

    .line 26
    .line 27
    .line 28
    move-result-wide v5

    .line 29
    invoke-static {v5, v6}, Ll/x6;->h(J)J

    .line 30
    .line 31
    .line 32
    move-result-wide v5

    .line 33
    iget-object v7, p0, Ll/x6;->d:Ll/g1w;

    .line 34
    .line 35
    invoke-interface {v7}, Ll/g1w;->sum()J

    .line 36
    .line 37
    .line 38
    move-result-wide v7

    .line 39
    invoke-static {v7, v8}, Ll/x6;->h(J)J

    .line 40
    .line 41
    .line 42
    move-result-wide v7

    .line 43
    iget-object v9, p0, Ll/x6;->e:Ll/g1w;

    .line 44
    .line 45
    invoke-interface {v9}, Ll/g1w;->sum()J

    .line 46
    .line 47
    .line 48
    move-result-wide v9

    .line 49
    invoke-static {v9, v10}, Ll/x6;->h(J)J

    .line 50
    .line 51
    .line 52
    move-result-wide v9

    .line 53
    iget-object p0, p0, Ll/x6;->f:Ll/g1w;

    .line 54
    .line 55
    invoke-interface {p0}, Ll/g1w;->sum()J

    .line 56
    .line 57
    .line 58
    move-result-wide v11

    .line 59
    invoke-static {v11, v12}, Ll/x6;->h(J)J

    .line 60
    .line 61
    .line 62
    move-result-wide v11

    .line 63
    invoke-direct/range {v0 .. v12}, Ll/hy3;-><init>(JJJJJJ)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public g(Ll/y6;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/y6;->f()Ll/hy3;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/x6;->a:Ll/g1w;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/hy3;->b()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-interface {v0, v1, v2}, Ll/g1w;->add(J)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/x6;->b:Ll/g1w;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/hy3;->e()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-interface {v0, v1, v2}, Ll/g1w;->add(J)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/x6;->c:Ll/g1w;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/hy3;->d()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-interface {v0, v1, v2}, Ll/g1w;->add(J)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/x6;->d:Ll/g1w;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/hy3;->c()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    invoke-interface {v0, v1, v2}, Ll/g1w;->add(J)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/x6;->e:Ll/g1w;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/hy3;->f()J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    invoke-interface {v0, v1, v2}, Ll/g1w;->add(J)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/x6;->f:Ll/g1w;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/hy3;->a()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    invoke-interface {p0, v0, v1}, Ll/g1w;->add(J)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
