.class public final Luwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lxnh;

.field public final b:Ld14;

.field public c:Z

.field public d:Z

.field public e:I

.field public f:J

.field public final g:Ljava/util/IdentityHashMap;

.field public final h:Lqfb;

.field public final i:Ltcc;

.field public final j:Lrle;

.field public final k:Lh7f;


# direct methods
.method public constructor <init>(Ltcc;Lxnh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ld14;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ld14;-><init>(B)V

    iput-object v0, p0, Luwh;->b:Ld14;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Luwh;->g:Ljava/util/IdentityHashMap;

    new-instance v0, Lqfb;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Luwh;->h:Lqfb;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Luwh;->k:Lh7f;

    iput-object p1, p0, Luwh;->i:Ltcc;

    iput-object p2, p0, Luwh;->a:Lxnh;

    invoke-static {}, Lsle;->d()Z

    move-result p2

    iput-boolean p2, p0, Luwh;->d:Z

    invoke-static {p0}, Lsle;->a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;

    move-result-object p2

    iput-object p2, p0, Luwh;->j:Lrle;

    new-instance p2, Lrz;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lrz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p0}, Luwh;->c()V

    return-void
.end method


# virtual methods
.method public final a(Lk43;I)V
    .registers 8

    iget-object v0, p0, Luwh;->b:Ld14;

    iget-object v1, v0, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    iget-object v0, v0, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1d

    :goto_11
    if-ge v3, v2, :cond_22

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ltwh;

    iget v4, v4, Ltwh;->b:I

    if-gt v4, p2, :cond_1f

    :cond_1d
    move v2, v3

    goto :goto_22

    :cond_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :cond_22
    :goto_22
    new-instance v3, Ltwh;

    invoke-direct {v3, p1, p2}, Ltwh;-><init>(Lk43;I)V

    invoke-virtual {v0, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-boolean p1, p0, Luwh;->c:Z

    if-eqz p1, :cond_3a

    if-eqz v1, :cond_3a

    new-instance p1, Lpjg;

    const/16 p2, 0x14

    invoke-direct {p1, p0, p2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_3a
    return-void
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Luwh;->b:Ld14;

    iget-object v0, v0, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object p0, p0, Luwh;->g:Ljava/util/IdentityHashMap;

    invoke-virtual {p0}, Ljava/util/IdentityHashMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final c()V
    .registers 3

    iget-boolean v0, p0, Luwh;->d:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Luwh;->a:Lxnh;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lwnh;->a(I)Z

    move-result v0

    if-eqz v0, :cond_18

    iget v0, p0, Luwh;->e:I

    if-gtz v0, :cond_24

    :cond_18
    iget-object v0, p0, Luwh;->i:Ltcc;

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->a:Lqcc;

    if-eq v0, v1, :cond_24

    const/4 v0, 0x1

    goto :goto_25

    :cond_24
    const/4 v0, 0x0

    :goto_25
    iget-boolean v1, p0, Luwh;->c:Z

    if-ne v1, v0, :cond_2a

    return-void

    :cond_2a
    iput-boolean v0, p0, Luwh;->c:Z

    if-nez v0, :cond_32

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void

    :cond_32
    invoke-virtual {p0}, Luwh;->e()V

    return-void
.end method

.method public final d(Lk43;Z)V
    .registers 4

    iget-object v0, p0, Luwh;->g:Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_39

    invoke-virtual {p0}, Luwh;->b()Z

    move-result p1

    if-eqz p1, :cond_39

    iget-object p0, p0, Luwh;->k:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqx;

    iget-object p1, p1, Lqx;->a:Lux;

    iget-object p2, p1, Lux;->h:Luwh;

    iget-object v0, p1, Lux;->b:Lqx;

    iget-object p2, p2, Luwh;->k:Lh7f;

    invoke-virtual {p2, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    const/4 p2, 0x0

    iput-byte p2, p1, Lux;->k:B

    iget-object p2, p1, Lux;->f:Li3j;

    if-eqz p2, :cond_13

    invoke-virtual {p2}, Li3j;->z()I

    move-result p2

    invoke-virtual {p1, p2}, Lux;->a(I)V

    goto :goto_13

    :cond_39
    return-void
.end method

.method public final e()V
    .registers 5

    iget-boolean v0, p0, Luwh;->c:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Luwh;->b:Ld14;

    iget-object v0, v0, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    :cond_e
    return-void

    :cond_f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Luwh;->f:J

    sub-long/2addr v0, v2

    iget-object v2, p0, Luwh;->a:Lxnh;

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwnh;

    iget-wide v2, v2, Lwnh;->c:J

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    cmp-long v0, v2, v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Luwh;->run()V

    return-void

    :cond_32
    invoke-static {p0, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final onConnectionTypeChanged(I)V
    .registers 3

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->isOnline()Z

    move-result p1

    iget-boolean v0, p0, Luwh;->d:Z

    if-ne v0, p1, :cond_9

    return-void

    :cond_9
    iput-boolean p1, p0, Luwh;->d:Z

    invoke-virtual {p0}, Luwh;->c()V

    return-void
.end method

.method public final run()V
    .registers 8

    iget-boolean v0, p0, Luwh;->c:Z

    if-eqz v0, :cond_35

    iget-object v0, p0, Luwh;->b:Ld14;

    iget-object v1, v0, Ld14;->a:Ljava/util/ArrayList;

    iget-object v0, v0, Ld14;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_35

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Luwh;->f:J

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltwh;

    iget-object v3, v3, Ltwh;->a:Lk43;

    iget-object v4, p0, Luwh;->g:Ljava/util/IdentityHashMap;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, p0, Luwh;->h:Lqfb;

    invoke-virtual {v3, v4}, Lk43;->f(Lhvh;)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_36

    :cond_35
    return-void

    :cond_36
    iget-object v0, p0, Luwh;->a:Lxnh;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    iget-wide v0, v0, Lwnh;->c:J

    const-wide/16 v5, 0x0

    cmp-long v2, v0, v5

    if-lez v2, :cond_50

    const-wide/16 v5, 0xa

    cmp-long v2, v3, v5

    if-lez v2, :cond_50

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_50
    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
