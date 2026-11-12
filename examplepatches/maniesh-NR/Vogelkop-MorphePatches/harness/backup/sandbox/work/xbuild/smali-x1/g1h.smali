.class public final Lg1h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lf1h;


# direct methods
.method public constructor <init>(Lf1h;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg1h;->a:Lf1h;

    return-void
.end method


# virtual methods
.method public final a(Lndc;Ljf4;Lagm;)Lxcc;
    .registers 7

    iget-object p0, p0, Lg1h;->a:Lf1h;

    iget-object p0, p0, Lf1h;->a:Lp12;

    const-string v0, "CX:bindToLifecycle-UseCaseGroup"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_9
    invoke-virtual {p0}, Lp12;->e()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2d

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lp12;->v(I)V

    new-instance v0, Lbp3;

    iget-object v1, p3, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p3, Lagm;->b:Ljava/lang/Object;

    check-cast v2, Lk8n;

    iget-object p3, p3, Lagm;->d:Ljava/lang/Object;

    check-cast p3, Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, p3}, Lbp3;-><init>(Ljava/util/List;Lk8n;Ljava/util/List;)V

    invoke-static {p0, p1, p2, v0}, Lp12;->a(Lp12;Lndc;Ljf4;Lbp3;)Lxcc;

    move-result-object p0
    :try_end_29
    .catchall {:try_start_9 .. :try_end_29} :catchall_35

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-object p0

    :cond_2d
    :try_start_2d
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_35
    .catchall {:try_start_2d .. :try_end_35} :catchall_35

    :catchall_35
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final varargs b([Lqrm;)V
    .registers 6

    iget-object p0, p0, Lg1h;->a:Lf1h;

    iget-object p0, p0, Lf1h;->a:Lp12;

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lqrm;

    const-string v0, "CX:unbind"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_10
    invoke-static {}, Lxug;->i()V

    invoke-virtual {p0}, Lp12;->e()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_35

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lcdc;

    new-instance v1, Lbp3;

    invoke-static {p1}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    sget-object v2, Ll08;->a:Ll08;

    const/4 v3, 0x0

    invoke-direct {v1, p1, v3, v2}, Lbp3;-><init>(Ljava/util/List;Lk8n;Ljava/util/List;)V

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {v0, v1, p0}, Lcdc;->j(Lbp3;Ljava/util/HashSet;)V
    :try_end_31
    .catchall {:try_start_10 .. :try_end_31} :catchall_3d

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_35
    :try_start_35
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Unbind UseCase is not supported in concurrent camera mode, call unbindAll() first."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_3d
    .catchall {:try_start_35 .. :try_end_3d} :catchall_3d

    :catchall_3d
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method
