.class public final Lbv5;
.super Ljo7;
.source "SourceFile"


# instance fields
.field public final c:Lech;


# direct methods
.method public constructor <init>(Lumi;Lech;)V
    .registers 3

    invoke-direct {p0, p1}, Ljo7;-><init>(Lumi;)V

    iput-object p2, p0, Lbv5;->c:Lech;

    return-void
.end method


# virtual methods
.method public final a(Lio7;ILnch;Ljch;)V
    .registers 10

    iget-object v0, p0, Lbv5;->c:Lech;

    iget-object v1, v0, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldch;

    if-nez v2, :cond_18

    new-instance v2, Ldch;

    iget-object v3, p0, Ljo7;->a:Lumi;

    iget-object v4, p0, Ljo7;->b:Lqie;

    invoke-direct {v2, v0, v3, v4}, Ldch;-><init>(Lech;Lumi;Lqie;)V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    :cond_18
    iget-object v0, v2, Ldch;->c:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, v2, Ldch;->d:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-super {p0, p1, p2, p3, p4}, Ljo7;->a(Lio7;ILnch;Ljch;)V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lbv5;->c:Lech;

    iget-object v0, v0, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldch;

    if-eqz v0, :cond_17

    iget-object v1, v0, Ldch;->d:Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Ldch;->a()V

    :cond_17
    return-void
.end method

.method public final g(Ljch;Z)V
    .registers 5

    new-instance v0, Lbu3;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p0, p1, p2}, Lbu3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, p0, Ljo7;->a:Lumi;

    invoke-interface {p0, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
