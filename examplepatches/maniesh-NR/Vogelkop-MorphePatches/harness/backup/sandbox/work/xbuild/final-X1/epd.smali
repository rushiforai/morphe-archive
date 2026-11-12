.class public final Lepd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Ljava/util/WeakHashMap;


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lepd;->b:Ljava/util/WeakHashMap;

    iput-object p1, p0, Lepd;->a:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/content_public/browser/MediaSession;ZZ)V
    .registers 6

    iget-object v0, p0, Lepd;->b:Ljava/util/WeakHashMap;

    if-eqz p2, :cond_25

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ldpd;

    if-nez p2, :cond_15

    new-instance p0, Ldpd;

    invoke-direct {p0, p3}, Ldpd;-><init>(Z)V

    invoke-virtual {v0, p1, p0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_15
    iget-boolean v1, p2, Ldpd;->a:Z

    if-eq v1, p3, :cond_30

    invoke-virtual {p0, p2}, Lepd;->b(Ldpd;)V

    new-instance p0, Ldpd;

    invoke-direct {p0, p3}, Ldpd;-><init>(Z)V

    invoke-virtual {v0, p1, p0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_25
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldpd;

    if-eqz p1, :cond_30

    invoke-virtual {p0, p1}, Lepd;->b(Ldpd;)V

    :cond_30
    return-void
.end method

.method public final b(Ldpd;)V
    .registers 9

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p1, Ldpd;->b:J

    sub-long/2addr v0, v2

    iget-boolean p1, p1, Ldpd;->a:Z

    iget-object p0, p0, Lepd;->a:Lx5f;

    iget-boolean v2, p0, Lx5f;->h:Z

    if-nez v2, :cond_10

    return-void

    :cond_10
    iget-object v2, p0, Lx5f;->d:Lzpa;

    new-instance v3, Lxu0;

    const/4 v4, -0x1

    const/4 v5, 0x2

    const/16 v6, 0x98b

    invoke-direct {v3, v6, v4, v5}, Ljf0;-><init>(III)V

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5, v0, v1}, Ljf0;->p(IIJ)V

    invoke-virtual {v3, v5, v5, p1}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v2}, Lx56;->A(Lzpa;)Luc0;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_40

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_40

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4d

    :cond_40
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4d
    invoke-virtual {v4, v3}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
