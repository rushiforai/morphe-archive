.class public final Lu9p;
.super Lbap;
.source "SourceFile"


# instance fields
.field public f:Lu6p;


# virtual methods
.method public final a()Ln9p;
    .registers 4

    new-instance v0, Ln9p;

    iget-boolean v1, p0, Lbap;->d:Z

    iget-boolean v2, p0, Lbap;->b:Z

    iget-boolean p0, p0, Lbap;->e:Z

    invoke-direct {v0, v1, v2, p0}, Ln9p;-><init>(ZZZ)V

    return-object v0
.end method

.method public final c(Lkotlin/jvm/functions/Function1;)Lbap;
    .registers 3

    iget-object v0, p0, Lu9p;->f:Lu6p;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p0}, Lu6p;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lu9p;->f:Lu6p;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lj9p;

    invoke-direct {p0}, Lj9p;-><init>()V

    return-object p0
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbap;->e:Z

    return-void
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbap;->b:Z

    return-void
.end method

.method public final f()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbap;->d:Z

    return-void
.end method

.method public final i()Lbap;
    .registers 4

    iget-object v0, p0, Lu9p;->f:Lu6p;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p0}, Lu6p;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lu9p;->f:Lu6p;

    new-instance v0, Lt9p;

    iget-boolean v1, p0, Lbap;->d:Z

    iget-boolean v2, p0, Lbap;->b:Z

    iget-boolean p0, p0, Lbap;->e:Z

    invoke-direct {v0, v1, v2, p0}, Lt9p;-><init>(ZZZ)V

    return-object v0
.end method
