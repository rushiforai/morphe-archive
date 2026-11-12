.class public final Lno;
.super Lmq;
.source "SourceFile"


# instance fields
.field public final p:Lbz;

.field public q:Z


# direct methods
.method public constructor <init>(Luo;Lkm;Lk8;Ljava/util/List;)V
    .registers 12

    iget-object v2, p1, Luo;->b:Ldl;

    const/4 v5, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lmq;-><init>(Lyz;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V

    iget-object p0, p1, Luo;->a:Lbz;

    iput-object p0, v0, Lno;->p:Lbz;

    return-void
.end method


# virtual methods
.method public final g(ZZ)Z
    .registers 3

    invoke-virtual {p0}, Lmq;->j()Z

    move-result p1

    if-nez p1, :cond_14

    if-eqz p2, :cond_10

    iget-object p1, p0, Lmq;->h:Lep;

    iget-boolean p1, p1, Lep;->b:Z

    if-eqz p1, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    iget-boolean p1, p0, Lno;->q:Z

    if-eqz p1, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    sget-object p1, Llq;->a:Llq;

    sget-object p2, Llq;->c:Llq;

    filled-new-array {p1, p2}, [Llq;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmq;->i([Llq;)Z

    move-result p0

    return p0
.end method

.method public final l(Z)V
    .registers 3

    if-nez p1, :cond_9

    iget-boolean v0, p0, Lno;->q:Z

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    iput-boolean v0, p0, Lno;->q:Z

    :cond_9
    invoke-super {p0, p1}, Lmq;->l(Z)V

    return-void
.end method
