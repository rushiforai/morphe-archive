.class public abstract Lf12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ld12;


# instance fields
.field public a:Ld12;

.field public b:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;Lvr9;)V
    .registers 6

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_13

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_12

    new-instance v1, Lk3;

    const/16 v2, 0xa

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    return-void

    :cond_13
    invoke-interface {v0, p1, p2}, Ld12;->a(Ljava/util/ArrayList;Lvr9;)V

    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_13

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_12

    new-instance v1, Lk3;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    return-void

    :cond_13
    invoke-interface {v0, p1, p2}, Ld12;->b(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c(Lra;)V
    .registers 5

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_13

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_12

    new-instance v1, Lxa;

    const/16 v2, 0x13

    invoke-direct {v1, p0, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    return-void

    :cond_13
    invoke-interface {v0, p1}, Ld12;->c(Lra;)V

    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_12

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_11

    new-instance v1, Le12;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Le12;-><init>(Lf12;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_11
    return-void

    :cond_12
    invoke-interface {v0}, Ld12;->d()V

    return-void
.end method

.method public final e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_13

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_12

    new-instance v1, Lk3;

    const/16 v2, 0x9

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    return-void

    :cond_13
    invoke-interface {v0, p1, p2}, Ld12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final f(Ljava/util/ArrayList;Lra;)V
    .registers 6

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_13

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_12

    new-instance v1, Lk3;

    const/16 v2, 0x8

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    return-void

    :cond_13
    invoke-interface {v0, p1, p2}, Ld12;->f(Ljava/util/ArrayList;Lra;)V

    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 11

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_16

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_15

    new-instance v1, Lqn;

    const/4 v6, 0x3

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_15
    return-void

    :cond_16
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-interface {v0, v3, v4, v5}, Ld12;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final h()V
    .registers 4

    iget-object v0, p0, Lf12;->a:Ld12;

    if-nez v0, :cond_12

    iget-object v0, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_11

    new-instance v1, Le12;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Le12;-><init>(Lf12;B)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_11
    return-void

    :cond_12
    invoke-interface {v0}, Ld12;->h()V

    return-void
.end method

.method public final i(Ld12;)V
    .registers 5

    iput-object p1, p0, Lf12;->a:Ld12;

    iget-object p1, p0, Lf12;->b:Ljava/util/ArrayList;

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v0, :cond_19

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_b

    :cond_19
    const/4 p1, 0x0

    iput-object p1, p0, Lf12;->b:Ljava/util/ArrayList;

    return-void
.end method
