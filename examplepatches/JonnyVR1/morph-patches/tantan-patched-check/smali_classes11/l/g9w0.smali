.class public final Ll/g9w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/LinkedList;

.field public final b:I

.field public final c:I

.field public final d:Ll/jaw0;


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 10
    .line 11
    iput p1, p0, Ll/g9w0;->b:I

    .line 12
    .line 13
    iput p2, p0, Ll/g9w0;->c:I

    .line 14
    .line 15
    new-instance p1, Ll/jaw0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/jaw0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jaw0;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g9w0;->i()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jaw0;->b()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final d()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jaw0;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final e()Ll/u9w0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jaw0;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/g9w0;->i()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/u9w0;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/jaw0;->h()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-object v0
.end method

.method public final f()Ll/iaw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jaw0;->d()Ll/iaw0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jaw0;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final h(Ll/u9w0;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jaw0;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/g9w0;->i()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Ll/g9w0;->b:I

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public final i()V
    .locals 5

    .line 1
    :goto_0
    iget-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/u9w0;

    .line 16
    .line 17
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iget-wide v3, v0, Ll/u9w0;->d:J

    .line 26
    .line 27
    sub-long/2addr v1, v3

    .line 28
    iget v0, p0, Ll/g9w0;->c:I

    .line 29
    .line 30
    int-to-long v3, v0

    .line 31
    cmp-long v0, v1, v3

    .line 32
    .line 33
    if-ltz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/g9w0;->d:Ll/jaw0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/jaw0;->g()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/g9w0;->a:Ljava/util/LinkedList;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method
