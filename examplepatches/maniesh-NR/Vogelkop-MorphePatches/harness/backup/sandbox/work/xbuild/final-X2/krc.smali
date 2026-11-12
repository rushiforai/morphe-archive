.class public final Lkrc;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lu55;

.field public final b:Lorm;

.field public c:J


# direct methods
.method public constructor <init>(Lu55;Lorm;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkrc;->a:Lu55;

    iput-object p2, p0, Lkrc;->b:Lorm;

    check-cast p1, Lulp;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lkrc;->c:J

    return-void
.end method


# virtual methods
.method public final onPause(Lndc;)V
    .registers 8

    iget-object p1, p0, Lkrc;->a:Lu55;

    check-cast p1, Lulp;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lkrc;->c:J

    sub-long/2addr v0, v2

    iget-object p0, p0, Lkrc;->b:Lorm;

    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_17

    return-void

    :cond_17
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v3

    invoke-virtual {v3, p1}, Lfi0;->y(Lzpa;)Lug0;

    move-result-object p1

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_3a

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3a

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_48

    :cond_3a
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {p1, v3, v5, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_48
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v5, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 4

    iget-object p1, p0, Lkrc;->a:Lu55;

    check-cast p1, Lulp;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lkrc;->c:J

    return-void
.end method
