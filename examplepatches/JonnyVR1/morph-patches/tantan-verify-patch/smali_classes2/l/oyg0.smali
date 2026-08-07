.class public final Ll/oyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vjg0;


# instance fields
.field public final a:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ll/aug0;IILjava/util/Map;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    invoke-static {p4}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Ll/mmg0;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3, p4}, Ll/mmg0;-><init>(Ll/aug0;IILjava/util/Map;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final b(Ll/aug0;IJ)V
    .locals 3

    .line 1
    iget v0, p1, Ll/aug0;->o:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p1, Ll/aug0;->q:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 19
    .line 20
    new-instance v0, Ll/lvg0;

    .line 21
    .line 22
    invoke-direct {v0, p1, p2, p3, p4}, Ll/lvg0;-><init>(Ll/aug0;IJ)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rkg0;->h(Ll/aug0;IJ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final c(Ll/aug0;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 15
    .line 16
    new-instance v0, Ll/mtg0;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ll/mtg0;-><init>(Ll/aug0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ll/vjg0;->c(Ll/aug0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final d(Ll/aug0;ILjava/lang/Exception;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget v0, p1, Ll/aug0;->b:I

    .line 5
    .line 6
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v0, Ll/jng0;

    .line 23
    .line 24
    invoke-direct {v0, p1, p2, p3}, Ll/jng0;-><init>(Ll/aug0;ILjava/lang/Exception;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2, p3}, Ll/rkg0;->i(Ll/aug0;ILjava/lang/Exception;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final e(Ll/aug0;ILjava/util/Map;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Ll/lhg0;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3}, Ll/lhg0;-><init>(Ll/aug0;ILjava/util/Map;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final f(Ll/aug0;Ljava/util/Map;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Ll/hxg0;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Ll/hxg0;-><init>(Ll/aug0;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final g(Ll/aug0;Ll/bog0;I)V
    .locals 1

    .line 1
    iget v0, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 15
    .line 16
    new-instance v0, Ll/pfg0;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2, p3}, Ll/pfg0;-><init>(Ll/aug0;Ll/bog0;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, p3}, Ll/rkg0;->g(Ll/aug0;Ll/bog0;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final h(Ll/aug0;ILjava/util/Map;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/aug0;->b:I

    .line 2
    .line 3
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p1, Ll/aug0;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v0, Ll/wzg0;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3}, Ll/wzg0;-><init>(Ll/aug0;ILjava/util/Map;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p1, Ll/aug0;->p:Ll/eog0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    return-void
.end method
