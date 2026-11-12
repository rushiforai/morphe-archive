.class public final Llen;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqe7;
.implements Ltdn;


# instance fields
.field public final a:Lrf7;

.field public final b:Lydn;

.field public final c:Lumi;

.field public final d:Ljava/util/HashSet;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lumi;Lydn;Lrf7;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Llen;->d:Ljava/util/HashSet;

    iput-object p1, p0, Llen;->c:Lumi;

    iput-object p2, p0, Llen;->b:Lydn;

    iput-object p3, p0, Llen;->a:Lrf7;

    invoke-virtual {p2, p0}, Lydn;->b(Ltdn;)V

    iget-object p1, p2, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_2a

    iget-object p1, p2, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    if-eqz p1, :cond_2a

    invoke-virtual {p2}, Lydn;->m()I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_2a

    const/4 p3, 0x1

    :cond_2a
    iput-boolean p3, p0, Llen;->f:Z

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 1

    invoke-virtual {p0}, Llen;->f()V

    return-void
.end method

.method public final a(Lre7;)V
    .registers 4

    iget v0, p1, Lre7;->f:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_26

    const/4 v1, 0x2

    if-ne v0, v1, :cond_23

    iget v0, p1, Lre7;->g:I

    const/16 v1, 0x11

    if-eq v0, v1, :cond_15

    const/16 v1, 0xf

    if-ne v0, v1, :cond_23

    :cond_15
    iget-wide v0, p1, Lre7;->o:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Llen;->d:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Llen;->g()V

    :cond_23
    invoke-virtual {p1, p0}, Lre7;->t(Lqe7;)V

    :cond_26
    return-void
.end method

.method public final b(Lre7;)V
    .registers 2

    invoke-virtual {p1, p0}, Lre7;->t(Lqe7;)V

    return-void
.end method

.method public final c(Lre7;)V
    .registers 2

    return-void
.end method

.method public final e(Lre7;)V
    .registers 2

    invoke-virtual {p1, p0}, Lre7;->t(Lqe7;)V

    return-void
.end method

.method public final f()V
    .registers 9

    iget-boolean v0, p0, Llen;->f:Z

    iget-object v1, p0, Llen;->b:Lydn;

    iget-object v2, v1, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    const/4 v3, 0x2

    if-eqz v2, :cond_1b

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    if-eqz v2, :cond_1b

    invoke-virtual {v1}, Lydn;->m()I

    move-result v1

    if-ne v1, v3, :cond_1c

    const/4 v0, 0x1

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x0

    :cond_1c
    :goto_1c
    iget-boolean v1, p0, Llen;->f:Z

    if-eq v0, v1, :cond_6a

    iput-boolean v0, p0, Llen;->f:Z

    if-eqz v0, :cond_6a

    iget-object v0, p0, Llen;->a:Lrf7;

    iget-object v0, v0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_30
    :goto_30
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_67

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    iget-boolean v2, v1, Lre7;->n:Z

    iget-wide v4, v1, Lre7;->o:J

    if-eqz v2, :cond_30

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object v6, p0, Llen;->d:Ljava/util/HashSet;

    invoke-virtual {v6, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_30

    invoke-virtual {v1}, Lre7;->m()Z

    move-result v2

    if-nez v2, :cond_58

    iget v7, v1, Lre7;->f:I

    if-ne v7, v3, :cond_30

    :cond_58
    iget-object v1, v1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v1}, Lcom/opera/android/downloads/DownloadItem;->cancel()V

    if-eqz v2, :cond_30

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :cond_67
    invoke-virtual {p0}, Llen;->g()V

    :cond_6a
    return-void
.end method

.method public final g()V
    .registers 7

    iget-boolean v0, p0, Llen;->e:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Llen;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    :cond_c
    return-void

    :cond_d
    const/4 v0, 0x1

    iput-boolean v0, p0, Llen;->e:Z

    new-instance v0, Ly1n;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Llen;->c:Lumi;

    invoke-interface {p0, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v0, Loml;

    invoke-direct {v0, p0}, Loml;-><init>(Lnml;)V

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x64

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method

.method public final s()V
    .registers 1

    invoke-virtual {p0}, Llen;->f()V

    return-void
.end method

.method public final t()V
    .registers 1

    invoke-virtual {p0}, Llen;->f()V

    return-void
.end method
