.class public final Ldch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lqie;

.field public final c:Ljava/util/HashSet;

.field public final d:Ljava/util/HashSet;

.field public final e:Ljava/util/HashMap;

.field public f:I

.field public final synthetic g:Lech;


# direct methods
.method public constructor <init>(Lech;Lumi;Lqie;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ldch;->g:Lech;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Ldch;->c:Ljava/util/HashSet;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Ldch;->d:Ljava/util/HashSet;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ldch;->e:Ljava/util/HashMap;

    iput-object p2, p0, Ldch;->a:Lumi;

    iput-object p3, p0, Ldch;->b:Lqie;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Ldch;->e:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ldch;->e:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, p0, Ldch;->c:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2e

    iget-object v1, p0, Ldch;->d:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2e

    iget-object v1, p0, Ldch;->g:Lech;

    iget-object v1, v1, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v1, p0, Ldch;->g:Lech;

    iget p0, p0, Ldch;->f:I

    invoke-virtual {v1, p0}, Lech;->a(I)V

    goto :goto_2e

    :cond_2b
    invoke-virtual {p0}, Ldch;->b()V

    :cond_2e
    :goto_2e
    monitor-exit v0

    return-void

    :goto_30
    monitor-exit v0
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_32

    throw p0

    :catchall_32
    move-exception p0

    goto :goto_30
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Ldch;->c:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_51

    iget-object v0, p0, Ldch;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_51

    iget-object v0, p0, Ldch;->e:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4c

    iget-object v0, p0, Ldch;->g:Lech;

    iget-object v0, v0, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    new-instance v0, Lcch;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcch;-><init>(Ldch;B)V

    iget-object v2, p0, Ldch;->a:Lumi;

    invoke-interface {v2, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v3, Lcch;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lcch;-><init>(Ldch;B)V

    invoke-interface {v2, v3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v2

    invoke-virtual {v0, v2}, Lnml;->b(Lnml;)V

    new-instance v2, Loml;

    invoke-direct {v2, v0}, Loml;-><init>(Lnml;)V

    iget-object p0, p0, Ldch;->b:Lqie;

    invoke-virtual {p0, v2, v1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void

    :cond_4c
    invoke-static {v0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_51
    return-void
.end method
