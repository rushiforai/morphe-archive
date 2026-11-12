.class public final Lypd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqr9;
.implements Lmod;
.implements Lann;
.implements Lx9l;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:J

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(La21;Lz5l;Lpde;)V
    .registers 4

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lypd;->b:Ljava/lang/Object;

    iput-object p2, p0, Lypd;->c:Ljava/lang/Object;

    iput-object p3, p0, Lypd;->e:Ljava/lang/Object;

    .line 25
    iput-object p1, p0, Lypd;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lafe;Ljava/util/Map;Lxkn;JLjava/lang/Integer;)V
    .registers 7

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lypd;->a:Ljava/lang/Object;

    iput-object p2, p0, Lypd;->b:Ljava/lang/Object;

    iput-object p3, p0, Lypd;->c:Ljava/lang/Object;

    iput-wide p4, p0, Lypd;->d:J

    iput-object p6, p0, Lypd;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Laqd;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lypd;->e:Ljava/lang/Object;

    sget-object p1, Lvjd;->K:Lvjd;

    iput-object p1, p0, Lypd;->a:Ljava/lang/Object;

    const-string p1, ""

    iput-object p1, p0, Lypd;->b:Ljava/lang/Object;

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v0, p0, Lypd;->d:J

    return-void
.end method

.method public constructor <init>(Lypd;Lvjd;Ljava/lang/String;Landroid/net/Uri;J)V
    .registers 7

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lypd;->e:Ljava/lang/Object;

    iput-object p2, p0, Lypd;->a:Ljava/lang/Object;

    iput-object p3, p0, Lypd;->b:Ljava/lang/Object;

    iput-object p4, p0, Lypd;->c:Ljava/lang/Object;

    iput-wide p5, p0, Lypd;->d:J

    return-void
.end method

.method public static synthetic K(Lypd;III)V
    .registers 5

    and-int/lit8 p3, p3, 0x4

    const/4 v0, 0x0

    if-eqz p3, :cond_6

    move p2, v0

    :cond_6
    invoke-virtual {p0, p1, v0, p2}, Lypd;->J(III)V

    return-void
.end method


# virtual methods
.method public final A(Lvjd;)V
    .registers 5

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object v0, p0, Laqd;->j:Lbpd;

    iget-object v1, v0, Lbpd;->c:Ljava/lang/Object;

    check-cast v1, Lwub;

    iget-object v1, v1, Lwub;->a:Ljava/lang/Object;

    check-cast v1, Llhd;

    iget-object v1, v1, Llhd;->a:Landroid/media/session/MediaController;

    invoke-virtual {v1}, Landroid/media/session/MediaController;->getQueueTitle()Ljava/lang/CharSequence;

    move-result-object v1

    iget-object p1, p1, Lvjd;->a:Ljava/lang/CharSequence;

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3e

    iget-object v1, p0, Laqd;->f:Lnpd;

    iget-object v1, v1, Lnpd;->t:Lxkg;

    iget-object p0, p0, Laqd;->v:Lcig;

    const/16 v2, 0x11

    invoke-virtual {p0, v2}, Lcig;->a(I)Z

    move-result p0

    if-eqz p0, :cond_34

    invoke-virtual {v1}, Lxkg;->P()Lcig;

    move-result-object p0

    invoke-virtual {p0, v2}, Lcig;->a(I)Z

    move-result p0

    if-nez p0, :cond_35

    :cond_34
    const/4 p1, 0x0

    :cond_35
    iget-object p0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    iget-object p0, p0, Lxod;->a:Landroid/media/session/MediaSession;

    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setQueueTitle(Ljava/lang/CharSequence;)V

    :cond_3e
    return-void
.end method

.method public final B(I)V
    .registers 6

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object p0, p0, Laqd;->j:Lbpd;

    sget v0, Lnac;->a:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_2b

    if-eq p1, v1, :cond_2a

    const/4 v2, 0x2

    if-eq p1, v2, :cond_28

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unrecognized RepeatMode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " was converted to `PlaybackStateCompat.REPEAT_MODE_NONE`"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lw7d;->K(Ljava/lang/String;)V

    goto :goto_2b

    :cond_28
    move v0, v2

    goto :goto_2b

    :cond_2a
    move v0, v1

    :cond_2b
    :goto_2b
    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    iget p1, p0, Lxod;->j:I

    if-eq p1, v0, :cond_5f

    iput v0, p0, Lxod;->j:I

    iget-object p1, p0, Lxod;->d:Ljava/lang/Object;

    monitor-enter p1

    :try_start_38
    iget-object v2, p0, Lxod;->f:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v2

    sub-int/2addr v2, v1

    :goto_3f
    iget-object v1, p0, Lxod;->f:Landroid/os/RemoteCallbackList;

    if-ltz v2, :cond_56

    invoke-virtual {v1, v2}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lnsa;
    :try_end_49
    .catchall {:try_start_38 .. :try_end_49} :catchall_5d

    :try_start_49
    invoke-interface {v1, v0}, Lnsa;->onRepeatModeChanged(I)V
    :try_end_4c
    .catch Landroid/os/RemoteException; {:try_start_49 .. :try_end_4c} :catch_4d
    .catch Ljava/lang/SecurityException; {:try_start_49 .. :try_end_4c} :catch_4d
    .catchall {:try_start_49 .. :try_end_4c} :catchall_5d

    goto :goto_53

    :catch_4d
    move-exception v1

    :try_start_4e
    const-string v3, "Dead object in setRepeatMode."

    invoke-static {v3, v1}, Lw7d;->r(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_53
    add-int/lit8 v2, v2, -0x1

    goto :goto_3f

    :cond_56
    invoke-virtual {v1}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    monitor-exit p1

    goto :goto_5f

    :goto_5b
    monitor-exit p1
    :try_end_5c
    .catchall {:try_start_4e .. :try_end_5c} :catchall_5d

    throw p0

    :catchall_5d
    move-exception p0

    goto :goto_5b

    :cond_5f
    :goto_5f
    return-void
.end method

.method public final C()Likc;
    .registers 1

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    iget-object p0, p0, La21;->m:Ljava/lang/Object;

    check-cast p0, Lpde;

    return-object p0
.end method

.method public final D(I)Z
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {p0, p1}, Lx9l;->D(I)Z

    move-result p0

    return p0
.end method

.method public final E(I)Lb2l;
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {p0, p1}, Lx9l;->E(I)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final F(Z)V
    .registers 6

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object p0, p0, Laqd;->j:Lbpd;

    sget v0, Lnac;->a:I

    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    iget v0, p0, Lxod;->k:I

    if-eq v0, p1, :cond_3d

    iput p1, p0, Lxod;->k:I

    iget-object v0, p0, Lxod;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_15
    iget-object v1, p0, Lxod;->f:Landroid/os/RemoteCallbackList;

    invoke-virtual {v1}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_1d
    iget-object v2, p0, Lxod;->f:Landroid/os/RemoteCallbackList;

    if-ltz v1, :cond_34

    invoke-virtual {v2, v1}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v2

    check-cast v2, Lnsa;
    :try_end_27
    .catchall {:try_start_15 .. :try_end_27} :catchall_3b

    :try_start_27
    invoke-interface {v2, p1}, Lnsa;->C(I)V
    :try_end_2a
    .catch Landroid/os/RemoteException; {:try_start_27 .. :try_end_2a} :catch_2b
    .catch Ljava/lang/SecurityException; {:try_start_27 .. :try_end_2a} :catch_2b
    .catchall {:try_start_27 .. :try_end_2a} :catchall_3b

    goto :goto_31

    :catch_2b
    move-exception v2

    :try_start_2c
    const-string v3, "Dead object in setShuffleMode."

    invoke-static {v3, v2}, Lw7d;->r(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_31
    add-int/lit8 v1, v1, -0x1

    goto :goto_1d

    :cond_34
    invoke-virtual {v2}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    monitor-exit v0

    goto :goto_3d

    :goto_39
    monitor-exit v0
    :try_end_3a
    .catchall {:try_start_2c .. :try_end_3a} :catchall_3b

    throw p0

    :catchall_3b
    move-exception p0

    goto :goto_39

    :cond_3d
    :goto_3d
    return-void
.end method

.method public final G(Lgql;)V
    .registers 2

    invoke-virtual {p0, p1}, Lypd;->Q(Lgql;)V

    invoke-virtual {p0}, Lypd;->M()V

    return-void
.end method

.method public final H(Landroidx/recyclerview/widget/i;)Z
    .registers 5

    iget-object v0, p0, Lypd;->c:Ljava/lang/Object;

    check-cast v0, Lz5l;

    iget-object v1, v0, Lz5l;->e:Ls9i;

    invoke-virtual {v1}, Ls9i;->Y()Z

    move-result v2

    if-eqz v2, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    instance-of v2, p1, Ljal;

    if-eqz v2, :cond_35

    iget-object v2, v0, Lz5l;->c:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leyj;

    iget-boolean v2, v2, Leyj;->v:Z

    if-eqz v2, :cond_35

    iget-object p0, p0, Lypd;->b:Ljava/lang/Object;

    check-cast p0, La21;

    move-object v2, p1

    check-cast v2, Ljal;

    invoke-virtual {v2}, Ljal;->X()Ljava/util/List;

    move-result-object v2

    invoke-interface {p0, v2}, Lx9l;->X(Ljava/util/List;)Z

    new-instance p0, Lgel;

    iget-object v2, v0, Lz5l;->q:Lilb;

    iget-object v2, v2, Lilb;->l:Lpde;

    invoke-direct {p0, p1, v1, v2}, Lgel;-><init>(Landroidx/recyclerview/widget/i;Ls9i;Lpde;)V

    :cond_35
    iget-object p0, v0, Lz5l;->r:Lllb;

    iget-object v0, p0, Lglb;->m:Lclb;

    iget-object v1, p0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1, p1}, Lclb;->f(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getLayoutDirection()I

    move-result v1

    invoke-static {v0, v1}, Lclb;->c(II)I

    move-result v0

    const/high16 v1, 0xff0000

    and-int/2addr v0, v1

    if-eqz v0, :cond_6c

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    if-ne v0, v1, :cond_6c

    iget-object v0, p0, Lglb;->t:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_5d

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    :cond_5d
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lglb;->t:Landroid/view/VelocityTracker;

    const/4 v0, 0x0

    iput v0, p0, Lglb;->i:F

    iput v0, p0, Lglb;->h:F

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lglb;->n(Landroidx/recyclerview/widget/i;I)V

    :cond_6c
    const/4 p0, 0x1

    return p0
.end method

.method public final I(Ljal;Landroidx/recyclerview/widget/i;)Z
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Lypd;->a:Ljava/lang/Object;

    check-cast v2, La21;

    iget-object v2, v2, La21;->a:Ljava/lang/Object;

    check-cast v2, Lqdb;

    iget-object v3, v0, Lypd;->c:Ljava/lang/Object;

    check-cast v3, Lz5l;

    iget-object v4, v3, Lz5l;->a:Lk6l;

    iget-object v5, v3, Lz5l;->o:Lc5l;

    iget-object v6, v5, Lc5l;->w:Ljava/util/LinkedHashSet;

    invoke-interface {v6, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x0

    if-nez v6, :cond_2ff

    iget-object v6, v3, Lz5l;->v:Lx2l;

    iget-object v6, v6, Lx2l;->m:Lh5k;

    iget-boolean v6, v6, Lh5k;->a:Z

    if-nez v6, :cond_2ff

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iget-wide v10, v0, Lypd;->d:J

    sub-long v10, v8, v10

    const-wide/16 v12, 0x32

    cmp-long v6, v10, v12

    if-ltz v6, :cond_2ff

    iput-wide v8, v0, Lypd;->d:J

    invoke-virtual/range {p1 .. p1}, Ljal;->V()Lhal;

    move-result-object v6

    if-eqz v6, :cond_3f

    iget v6, v6, Lhal;->a:I

    move v12, v6

    goto :goto_40

    :cond_3f
    move v12, v7

    :goto_40
    instance-of v6, v1, Ljal;

    sget-object v14, Lh6l;->d:Lh6l;

    if-eqz v6, :cond_f3

    invoke-virtual/range {p1 .. p1}, Ljal;->X()Ljava/util/List;

    move-result-object v6

    move-object v8, v1

    check-cast v8, Ljal;

    invoke-virtual {v8}, Ljal;->X()Ljava/util/List;

    move-result-object v8

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2ff

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2ff

    invoke-virtual {v6, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2ff

    instance-of v9, v1, Lkj8;

    if-eqz v9, :cond_fc

    invoke-virtual {v5}, Lk56;->h()Z

    move-result v2

    if-nez v2, :cond_2ff

    invoke-virtual {v4, v14}, Lk6l;->h(Lh6l;)V

    :try_start_70
    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_76
    :goto_76
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_f0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    move-object v6, v3

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    iget v6, v6, Lcom/opera/android/browser/TabInfo;->d:I

    move-object v8, v1

    check-cast v8, Lkj8;

    iget-object v8, v8, Lkj8;->c:Ll2l;

    iget v8, v8, Ll2l;->b:I

    if-eq v6, v8, :cond_c2

    invoke-virtual/range {p0 .. p1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v6

    invoke-virtual {v0, v1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v8

    if-le v6, v8, :cond_c2

    move-object v6, v3

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v15

    move-object v6, v1

    check-cast v6, Lkj8;

    iget-object v6, v6, Lkj8;->c:Ll2l;

    iget v6, v6, Ll2l;->b:I

    const/16 v20, 0x7

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    move/from16 v19, v6

    invoke-static/range {v15 .. v20}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    check-cast v3, Ld7l;

    invoke-virtual {v3, v6}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    goto :goto_76

    :cond_c2
    move-object v6, v3

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    iget v6, v6, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq v6, v12, :cond_76

    invoke-virtual/range {p0 .. p1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v6

    invoke-virtual {v0, v1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v8

    if-ge v6, v8, :cond_76

    move-object v6, v3

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v13, 0x7

    const-wide/16 v9, 0x0

    invoke-static/range {v8 .. v13}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    check-cast v3, Ld7l;

    invoke-virtual {v3, v6}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z
    :try_end_ef
    .catchall {:try_start_70 .. :try_end_ef} :catchall_f7

    goto :goto_76

    :cond_f0
    invoke-virtual {v4, v14}, Lk6l;->n(Lh6l;)V

    :cond_f3
    move-object/from16 v15, p1

    goto/16 :goto_269

    :catchall_f7
    move-exception v0

    invoke-virtual {v4, v14}, Lk6l;->n(Lh6l;)V

    throw v0

    :cond_fc
    move-object/from16 v15, p1

    instance-of v5, v15, Lh5l;

    sget-object v9, Lvr0;->n:Lvr0;

    const/4 v10, -0x1

    const/4 v11, 0x1

    if-eqz v5, :cond_1e7

    instance-of v5, v1, Lh5l;

    if-eqz v5, :cond_1e7

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb2l;

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb2l;

    move-object v8, v5

    check-cast v8, Ld7l;

    iget-object v8, v8, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v8

    iget v8, v8, Lcom/opera/android/browser/TabInfo;->d:I

    move-object v12, v6

    check-cast v12, Ld7l;

    iget-object v12, v12, Ld7l;->j:Le7l;

    invoke-interface {v12}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v12

    iget v12, v12, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq v8, v12, :cond_1c8

    invoke-virtual/range {p0 .. p1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v2

    iget-object v4, v3, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v4}, Lexg;->u(Landroidx/recyclerview/widget/RecyclerView;)Z

    move-result v4

    if-ne v4, v11, :cond_14c

    iget-object v4, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    iget-object v8, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTranslationX()F

    move-result v8

    invoke-static {v8}, Lzed;->b(F)I

    move-result v8

    :goto_14a
    add-int/2addr v8, v4

    goto :goto_15f

    :cond_14c
    if-nez v4, :cond_1c4

    iget-object v4, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    iget-object v8, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTranslationY()F

    move-result v8

    invoke-static {v8}, Lzed;->b(F)I

    move-result v8

    goto :goto_14a

    :goto_15f
    if-lt v2, v8, :cond_2ff

    invoke-virtual/range {p0 .. p1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v0

    iget-object v2, v3, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v2}, Lexg;->u(Landroidx/recyclerview/widget/RecyclerView;)Z

    move-result v2

    if-ne v2, v11, :cond_186

    iget-object v2, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    iget-object v3, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    move-result v3

    invoke-static {v3}, Lzed;->b(F)I

    move-result v3

    add-int/2addr v3, v2

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    :goto_184
    add-int/2addr v1, v3

    goto :goto_1a0

    :cond_186
    if-nez v2, :cond_1c0

    iget-object v2, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    iget-object v3, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTranslationY()F

    move-result v3

    invoke-static {v3}, Lzed;->b(F)I

    move-result v3

    add-int/2addr v3, v2

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    goto :goto_184

    :goto_1a0
    if-gt v0, v1, :cond_2ff

    check-cast v5, Ld7l;

    iget-object v0, v5, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v8

    check-cast v6, Ld7l;

    iget-object v0, v6, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v12, v0, Lcom/opera/android/browser/TabInfo;->d:I

    const/4 v13, 0x7

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    invoke-static/range {v8 .. v13}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    invoke-virtual {v5, v0}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    return v7

    :cond_1c0
    invoke-static {}, Lh9o;->p()V

    return v7

    :cond_1c4
    invoke-static {}, Lh9o;->p()V

    return v7

    :cond_1c8
    iget-object v0, v4, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, v4, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-eq v0, v10, :cond_2ff

    if-eq v1, v10, :cond_2ff

    invoke-virtual {v4, v0, v1}, Lk6l;->u(II)V

    invoke-interface {v2, v9}, Lqdb;->b(Lvr0;)V

    return v11

    :cond_1e7
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2ff

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2ff

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_231

    iget-object v1, v4, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v3, v12}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ge v3, v1, :cond_224

    move v1, v11

    goto :goto_225

    :cond_224
    move v1, v7

    :goto_225
    move-object v3, v6

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ne v0, v10, :cond_233

    :cond_231
    move v0, v7

    goto :goto_25a

    :cond_233
    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v6, v7

    :goto_23a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_256

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v12, v6, 0x1

    if-ltz v6, :cond_251

    check-cast v10, Lb2l;

    add-int/2addr v6, v0

    add-int/2addr v6, v1

    invoke-virtual {v5, v6, v10}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    move v6, v12

    goto :goto_23a

    :cond_251
    invoke-static {}, Lj95;->n()V

    const/4 v0, 0x0

    throw v0

    :cond_256
    invoke-static {v4, v5}, Lexg;->c(Lk6l;Ljava/util/List;)I

    move-result v0

    :goto_25a
    if-eqz v0, :cond_2ff

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v11, :cond_265

    invoke-static {v4}, Lexg;->d(Lk6l;)V

    :cond_265
    invoke-interface {v2, v9}, Lqdb;->b(Lvr0;)V

    return v11

    :goto_269
    instance-of v2, v1, Lc38;

    if-eqz v2, :cond_2ff

    invoke-virtual {v5}, Lk56;->h()Z

    move-result v2

    if-nez v2, :cond_2ff

    invoke-virtual {v4, v14}, Lk6l;->h(Lh6l;)V

    :try_start_276
    invoke-virtual {v15}, Ljal;->X()Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_280
    :goto_280
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    move-object v5, v3

    check-cast v5, Ld7l;

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v5

    iget v5, v5, Lcom/opera/android/browser/TabInfo;->d:I

    move-object v6, v1

    check-cast v6, Lc38;

    iget v6, v6, Lc38;->b:I

    if-eq v5, v6, :cond_2c8

    invoke-virtual/range {p0 .. p1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v5

    invoke-virtual {v0, v1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v6

    if-ge v5, v6, :cond_2c8

    move-object v5, v3

    check-cast v5, Ld7l;

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v16

    move-object v5, v1

    check-cast v5, Lc38;

    iget v5, v5, Lc38;->b:I

    const/16 v21, 0x7

    const-wide/16 v17, 0x0

    const/16 v19, 0x0

    move/from16 v20, v5

    invoke-static/range {v16 .. v21}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v5

    check-cast v3, Ld7l;

    invoke-virtual {v3, v5}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    goto :goto_280

    :cond_2c8
    move-object v5, v3

    check-cast v5, Ld7l;

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v5

    iget v5, v5, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq v5, v12, :cond_280

    invoke-virtual/range {p0 .. p1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v5

    invoke-virtual {v0, v1}, Lypd;->n(Landroidx/recyclerview/widget/i;)I

    move-result v6

    if-le v5, v6, :cond_280

    move-object v5, v3

    check-cast v5, Ld7l;

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v13, 0x7

    const-wide/16 v9, 0x0

    invoke-static/range {v8 .. v13}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v5

    check-cast v3, Ld7l;

    invoke-virtual {v3, v5}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z
    :try_end_2f5
    .catchall {:try_start_276 .. :try_end_2f5} :catchall_2fa

    goto :goto_280

    :cond_2f6
    invoke-virtual {v4, v14}, Lk6l;->n(Lh6l;)V

    return v7

    :catchall_2fa
    move-exception v0

    invoke-virtual {v4, v14}, Lk6l;->n(Lh6l;)V

    throw v0

    :cond_2ff
    return v7
.end method

.method public final J(III)V
    .registers 15

    iget-object v0, p0, Lypd;->c:Ljava/lang/Object;

    check-cast v0, Lz5l;

    iget-object v1, v0, Lz5l;->c:Lpde;

    invoke-virtual {v0}, Lz5l;->b()V

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    sget-object v2, Lb3c;->d:Lb3c;

    if-ne p0, v2, :cond_1b

    iget-object p0, v0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    return-void

    :cond_1b
    iget-object p0, v0, Lz5l;->p:Lzg;

    iget v2, p0, Lzg;->a:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lzg;->a:I

    iget-object v4, v0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget v6, p0, Leyj;->E:I

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget p0, p0, Leyj;->F:I

    if-ge p0, p2, :cond_39

    move v7, p2

    goto :goto_3a

    :cond_39
    move v7, p0

    :goto_3a
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget p0, p0, Leyj;->G:I

    if-ge p0, p3, :cond_46

    move v8, p3

    goto :goto_47

    :cond_46
    move v8, p0

    :goto_47
    new-instance v9, Lu5l;

    invoke-direct {v9, v0, v3}, Lu5l;-><init>(Lz5l;B)V

    const/4 v10, 0x1

    move v5, p1

    invoke-static/range {v4 .. v10}, Lexg;->y(Landroidx/recyclerview/widget/RecyclerView;IIIILu5l;Z)V

    return-void
.end method

.method public final L(Ljava/lang/Long;)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public final M()V
    .registers 12

    iget-object v0, p0, Lypd;->e:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Laqd;

    iget-object v0, v1, Laqd;->f:Lnpd;

    iget-object v2, v0, Lnpd;->t:Lxkg;

    invoke-virtual {v2}, Lxkg;->w0()Lqjd;

    move-result-object v3

    invoke-virtual {v2}, Lxkg;->y0()Lvjd;

    move-result-object v4

    const/16 v5, 0x10

    invoke-virtual {v2, v5}, Lxkg;->C(I)Z

    move-result v6

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    if-eqz v6, :cond_24

    invoke-virtual {v2}, Lxkg;->t0()Z

    move-result v6

    if-nez v6, :cond_2e

    :cond_24
    invoke-virtual {v2, v5}, Lxkg;->C(I)Z

    move-result v5

    if-eqz v5, :cond_2e

    invoke-virtual {v2}, Lxkg;->getDuration()J

    move-result-wide v7

    :cond_2e
    if-eqz v3, :cond_34

    iget-object v2, v3, Lqjd;->a:Ljava/lang/String;

    :goto_32
    move-object v5, v2

    goto :goto_37

    :cond_34
    const-string v2, ""

    goto :goto_32

    :goto_37
    const/4 v2, 0x0

    if-eqz v3, :cond_42

    iget-object v3, v3, Lqjd;->g:Lnjd;

    iget-object v3, v3, Lnjd;->a:Landroid/net/Uri;

    if-eqz v3, :cond_42

    move-object v6, v3

    goto :goto_43

    :cond_42
    move-object v6, v2

    :goto_43
    iget-object v3, p0, Lypd;->a:Ljava/lang/Object;

    check-cast v3, Lvjd;

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_68

    iget-object v3, p0, Lypd;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v3, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_68

    iget-object v3, p0, Lypd;->c:Ljava/lang/Object;

    check-cast v3, Landroid/net/Uri;

    invoke-static {v3, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_68

    iget-wide v9, p0, Lypd;->d:J

    cmp-long v3, v9, v7

    if-nez v3, :cond_68

    return-void

    :cond_68
    iput-object v5, p0, Lypd;->b:Ljava/lang/Object;

    iput-object v6, p0, Lypd;->c:Ljava/lang/Object;

    iput-object v4, p0, Lypd;->a:Ljava/lang/Object;

    iput-wide v7, p0, Lypd;->d:J

    iget-object v3, v0, Lnpd;->m:Lbpd;

    invoke-virtual {v3, v4}, Lbpd;->f(Lvjd;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    if-eqz v3, :cond_87

    iput-object v2, v1, Laqd;->p:Lypd;

    invoke-interface {v3}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v9

    if-eqz v9, :cond_a3

    :try_start_80
    invoke-static {v3}, Lyr9;->a(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;
    :try_end_86
    .catch Ljava/util/concurrent/CancellationException; {:try_start_80 .. :try_end_86} :catch_8b
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_80 .. :try_end_86} :catch_8b

    move-object v2, p0

    :cond_87
    :goto_87
    move-wide v9, v7

    move-object v8, v6

    move-object v6, v4

    goto :goto_c4

    :catch_8b
    move-exception v0

    move-object p0, v0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Failed to load bitmap: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lw7d;->K(Ljava/lang/String;)V

    goto :goto_87

    :cond_a3
    move-wide v9, v7

    move-object v8, v6

    move-object v6, v4

    new-instance v4, Lypd;

    move-object v7, v5

    move-object v5, p0

    invoke-direct/range {v4 .. v10}, Lypd;-><init>(Lypd;Lvjd;Ljava/lang/String;Landroid/net/Uri;J)V

    move-object v5, v7

    iput-object v4, v1, Laqd;->p:Lypd;

    iget-object p0, v0, Lnpd;->l:Landroid/os/Handler;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljj5;

    const/4 v7, 0x1

    invoke-direct {v0, p0, v7}, Ljj5;-><init>(Landroid/os/Handler;B)V

    new-instance p0, Lvr9;

    const/4 v7, 0x0

    invoke-direct {p0, v3, v4, v7}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, p0, v0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :goto_c4
    iget-object p0, v1, Laqd;->j:Lbpd;

    move-object v4, v6

    move-object v6, v8

    move-wide v7, v9

    move-object v9, v2

    invoke-static/range {v4 .. v9}, Lnac;->b(Lvjd;Ljava/lang/String;Landroid/net/Uri;JLandroid/graphics/Bitmap;)Lxjd;

    move-result-object v0

    invoke-virtual {p0, v0}, Lbpd;->S(Lxjd;)V

    return-void
.end method

.method public final N(Lz3;)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->N(Lz3;)V

    return-void
.end method

.method public final O(Ljava/lang/Iterable;ZZ)V
    .registers 4

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p3}, La21;->O(Ljava/lang/Iterable;ZZ)V

    return-void
.end method

.method public final P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V
    .registers 4

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1, p2, p3}, La21;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    return-void
.end method

.method public final Q(Lgql;)V
    .registers 14

    iget-object v0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast v0, Laqd;

    iget-object v1, v0, Laqd;->f:Lnpd;

    iget-object v2, v1, Lnpd;->t:Lxkg;

    iget-object v3, v0, Laqd;->v:Lcig;

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Lcig;->a(I)Z

    move-result v3

    const/4 v5, 0x0

    if-eqz v3, :cond_8b

    invoke-virtual {v2}, Lxkg;->P()Lcig;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcig;->a(I)Z

    move-result v2

    if-eqz v2, :cond_8b

    invoke-virtual {p1}, Lgql;->p()Z

    move-result v2

    if-nez v2, :cond_8b

    sget v0, Lnac;->a:I

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Lfql;

    invoke-direct {v0}, Lfql;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_31
    invoke-virtual {p1}, Lgql;->o()I

    move-result v4

    if-ge v3, v4, :cond_45

    const-wide/16 v6, 0x0

    invoke-virtual {p1, v3, v0, v6, v7}, Lgql;->m(ILfql;J)Lfql;

    move-result-object v4

    iget-object v4, v4, Lfql;->b:Lqjd;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    :cond_45
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v8, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    new-instance v6, Lqn;

    const/16 v11, 0xc

    move-object v7, p0

    invoke-direct/range {v6 .. v11}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    :goto_57
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v2, p0, :cond_8a

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqjd;

    iget-object p0, p0, Lqjd;->e:Lvjd;

    iget-object p0, p0, Lvjd;->k:[B

    if-nez p0, :cond_70

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Lqn;->run()V

    goto :goto_87

    :cond_70
    iget-object p1, v1, Lnpd;->m:Lbpd;

    invoke-virtual {p1, p0}, Lbpd;->m([B)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    invoke-virtual {v10, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, v1, Lnpd;->l:Landroid/os/Handler;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljj5;

    const/4 v3, 0x1

    invoke-direct {v0, p1, v3}, Ljj5;-><init>(Landroid/os/Handler;B)V

    invoke-interface {p0, v6, v0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :goto_87
    add-int/lit8 v2, v2, 0x1

    goto :goto_57

    :cond_8a
    return-void

    :cond_8b
    iget-object p0, v0, Laqd;->j:Lbpd;

    invoke-virtual {p0, v5}, Lbpd;->U(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final X(Ljava/util/List;)Z
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {p0, p1}, Lx9l;->X(Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public final a(ILn3j;)V
    .registers 5

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    invoke-virtual {p1}, Landroid/os/BaseBundle;->isEmpty()Z

    move-result v0

    iget-object v1, p2, Ln3j;->c:Landroid/os/Bundle;

    if-eqz v0, :cond_c

    move-object p1, v1

    goto :goto_1b

    :cond_c
    invoke-virtual {v1}, Landroid/os/BaseBundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    move-object p1, v0

    :cond_1b
    :goto_1b
    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object p0, p0, Laqd;->j:Lbpd;

    iget-object p2, p2, Ln3j;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_36

    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    iget-object p0, p0, Lxod;->a:Landroid/media/session/MediaSession;

    invoke-virtual {p0, p2, p1}, Landroid/media/session/MediaSession;->sendSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void

    :cond_36
    const-string p0, "event cannot be null or empty"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object v0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast v0, Lafe;

    new-instance v1, Lcff;

    iget-wide v2, p0, Lypd;->d:J

    invoke-direct {v1, v2, v3}, Lcff;-><init>(J)V

    invoke-interface {v0, v1}, Lafe;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final d0(Lb2l;)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->d0(Lb2l;)V

    return-void
.end method

.method public final e()V
    .registers 5

    iget-object v0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast v0, Lafe;

    new-instance v1, Lcff;

    iget-wide v2, p0, Lypd;->d:J

    invoke-direct {v1, v2, v3}, Lcff;-><init>(J)V

    invoke-interface {v0, v1}, Lafe;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final f()V
    .registers 1

    return-void
.end method

.method public final g0(Ljava/util/Set;Lpdb;Lvr0;Z)V
    .registers 5

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1, p2, p3, p4}, La21;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return-void
.end method

.method public final h(ILc4j;ZZI)V
    .registers 6

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object p1, p0, Laqd;->f:Lnpd;

    iget-object p1, p1, Lnpd;->t:Lxkg;

    invoke-virtual {p0, p1}, Laqd;->Y(Lxkg;)V

    return-void
.end method

.method public final h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 3

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1, p2}, La21;->h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final i(ILcig;)V
    .registers 4

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object p1, p0, Laqd;->f:Lnpd;

    iget-object p1, p1, Lnpd;->t:Lxkg;

    const/16 p2, 0x14

    invoke-virtual {p1, p2}, Lxkg;->C(I)Z

    move-result p2

    if-eqz p2, :cond_12

    const/4 p2, 0x4

    goto :goto_13

    :cond_12
    const/4 p2, 0x0

    :goto_13
    iget-byte v0, p0, Laqd;->q:B

    if-eq v0, p2, :cond_26

    iput-byte p2, p0, Laqd;->q:B

    iget-object v0, p0, Laqd;->j:Lbpd;

    iget-object v0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast v0, Lxod;

    iget-object v0, v0, Lxod;->a:Landroid/media/session/MediaSession;

    or-int/lit8 p2, p2, 0x3

    invoke-virtual {v0, p2}, Landroid/media/session/MediaSession;->setFlags(I)V

    :cond_26
    invoke-virtual {p0, p1}, Laqd;->Y(Lxkg;)V

    return-void
.end method

.method public final j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 3

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1, p2}, La21;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final k(Lp6l;)Lb2l;
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->k(Lp6l;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final k0()V
    .registers 1

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {p0}, Lx9l;->k0()V

    return-void
.end method

.method public final m(Lb2l;)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {p0, p1}, Lx9l;->m(Lb2l;)V

    return-void
.end method

.method public final m0(Ljava/util/LinkedHashSet;)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->m0(Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)I
    .registers 3

    iget-object p0, p0, Lypd;->c:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p0}, Lexg;->u(Landroidx/recyclerview/widget/RecyclerView;)Z

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_28

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result p0

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    invoke-static {v0}, Lzed;->b(F)I

    move-result v0

    add-int/2addr v0, p0

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    div-int/lit8 p0, p0, 0x2

    add-int/2addr p0, v0

    return p0

    :cond_28
    if-nez p0, :cond_45

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    invoke-static {v0}, Lzed;->b(F)I

    move-result v0

    add-int/2addr v0, p0

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    div-int/lit8 p0, p0, 0x2

    add-int/2addr p0, v0

    return p0

    :cond_45
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0
.end method

.method public final o()V
    .registers 1

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {p0}, Lx9l;->o()V

    return-void
.end method

.method public final o0(Ljava/lang/Iterable;ZZ)V
    .registers 4

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p3}, La21;->o0(Ljava/lang/Iterable;ZZ)V

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 3

    iget-object v0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast v0, Lypd;

    iget-object v0, v0, Lypd;->e:Ljava/lang/Object;

    check-cast v0, Laqd;

    iget-object v0, v0, Laqd;->p:Lypd;

    if-eq p0, v0, :cond_d

    return-void

    :cond_d
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Failed to load bitmap: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lw7d;->K(Ljava/lang/String;)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 9

    move-object v5, p1

    check-cast v5, Landroid/graphics/Bitmap;

    iget-object p1, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p1, Lypd;

    iget-object p1, p1, Lypd;->e:Ljava/lang/Object;

    check-cast p1, Laqd;

    iget-object v0, p1, Laqd;->p:Lypd;

    if-eq p0, v0, :cond_10

    return-void

    :cond_10
    iget-object v6, p1, Laqd;->j:Lbpd;

    iget-object v0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast v0, Lvjd;

    iget-object v1, p0, Lypd;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lypd;->c:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    iget-wide v3, p0, Lypd;->d:J

    invoke-static/range {v0 .. v5}, Lnac;->b(Lvjd;Ljava/lang/String;Landroid/net/Uri;JLandroid/graphics/Bitmap;)Lxjd;

    move-result-object p0

    invoke-virtual {v6, p0}, Lbpd;->S(Lxjd;)V

    iget-object p0, p1, Laqd;->f:Lnpd;

    iget-object p1, p0, Lnpd;->o:Landroid/os/Handler;

    new-instance v0, Lgpd;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lgpd;-><init>(Lnpd;B)V

    invoke-static {p1, v0}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final p(Lb2l;Lpdb;)V
    .registers 5

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->y:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    invoke-interface {v0, p2}, Lqdb;->a(Lpdb;)V

    iget-object p0, p0, La21;->d:Ljava/lang/Object;

    check-cast p0, Lk6l;

    invoke-virtual {p0, p1}, Lk6l;->k(Lb2l;)V

    return-void
.end method

.method public final p0(I)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->p0(I)V

    return-void
.end method

.method public final q(I)V
    .registers 3

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    iget-object p0, p0, La21;->m:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_1f
    return-void
.end method

.method public final r(I)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->e(I)V

    return-void
.end method

.method public final s(Lpf2;)V
    .registers 4

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object v0, p0, Laqd;->f:Lnpd;

    iget-object v0, v0, Lnpd;->t:Lxkg;

    invoke-virtual {v0}, Lxkg;->X()Lu67;

    move-result-object v0

    iget v0, v0, Lu67;->a:I

    if-nez v0, :cond_44

    iget-object p0, p0, Laqd;->j:Lbpd;

    iget v0, p1, Lpf2;->b:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eq v0, v1, :cond_2c

    iget p1, p1, Lpf2;->c:I

    packed-switch p1, :pswitch_data_46

    :pswitch_1d
    const/4 v1, 0x3

    goto :goto_2c

    :pswitch_1f
    const/16 v1, 0xa

    goto :goto_2c

    :pswitch_22
    const/4 v1, 0x2

    goto :goto_2c

    :pswitch_24
    const/4 v1, 0x5

    goto :goto_2c

    :pswitch_26
    const/4 v1, 0x4

    goto :goto_2c

    :pswitch_28
    const/16 v1, 0x8

    goto :goto_2c

    :pswitch_2b
    const/4 v1, 0x0

    :cond_2c
    :goto_2c
    :pswitch_2c
    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {p1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    invoke-virtual {p1, v1}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    iget-object p0, p0, Lxod;->a:Landroid/media/session/MediaSession;

    invoke-virtual {p1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setPlaybackToLocal(Landroid/media/AudioAttributes;)V

    :cond_44
    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x2
        :pswitch_2b
        :pswitch_28
        :pswitch_26
        :pswitch_24
        :pswitch_22
        :pswitch_24
        :pswitch_24
        :pswitch_24
        :pswitch_24
        :pswitch_1f
        :pswitch_1d
        :pswitch_2c
    .end packed-switch
.end method

.method public final t()V
    .registers 13

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object v0, p0, Laqd;->j:Lbpd;

    iget-object v1, p0, Laqd;->f:Lnpd;

    iget-object v8, v1, Lnpd;->t:Lxkg;

    invoke-virtual {v8}, Lxkg;->X()Lu67;

    move-result-object v1

    iget v1, v1, Lu67;->a:I

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-nez v1, :cond_17

    const/4 v1, 0x0

    goto :goto_68

    :cond_17
    invoke-virtual {v8}, Lxkg;->P()Lcig;

    move-result-object v1

    const/16 v2, 0x1a

    const/16 v3, 0x22

    filled-new-array {v2, v3}, [I

    move-result-object v2

    iget-object v3, v1, Lcig;->a:Lw69;

    invoke-virtual {v3, v2}, Lw69;->a([I)Z

    move-result v2

    if-eqz v2, :cond_3f

    const/16 v2, 0x19

    const/16 v3, 0x21

    filled-new-array {v2, v3}, [I

    move-result-object v2

    iget-object v1, v1, Lcig;->a:Lw69;

    invoke-virtual {v1, v2}, Lw69;->a([I)Z

    move-result v1

    if-eqz v1, :cond_3d

    move v3, v9

    goto :goto_40

    :cond_3d
    move v3, v10

    goto :goto_40

    :cond_3f
    move v3, v11

    :goto_40
    new-instance v7, Landroid/os/Handler;

    iget-object v1, v8, Lgk9;->b:Lgig;

    invoke-interface {v1}, Lgig;->I()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v7, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/16 v1, 0x17

    invoke-virtual {v8, v1}, Lxkg;->C(I)Z

    move-result v1

    if-eqz v1, :cond_59

    invoke-virtual {v8}, Lxkg;->N()I

    move-result v1

    move v5, v1

    goto :goto_5a

    :cond_59
    move v5, v11

    :goto_5a
    invoke-virtual {v8}, Lxkg;->X()Lu67;

    move-result-object v1

    new-instance v2, Lwpd;

    iget v4, v1, Lu67;->c:I

    iget-object v6, v1, Lu67;->d:Ljava/lang/String;

    invoke-direct/range {v2 .. v8}, Lwpd;-><init>(IIILjava/lang/String;Landroid/os/Handler;Lxkg;)V

    move-object v1, v2

    :goto_68
    iput-object v1, p0, Laqd;->m:Lwpd;

    if-nez v1, :cond_ad

    const/16 p0, 0x15

    invoke-virtual {v8, p0}, Lxkg;->C(I)Z

    move-result p0

    if-eqz p0, :cond_79

    invoke-virtual {v8}, Lxkg;->W()Lpf2;

    move-result-object p0

    goto :goto_7b

    :cond_79
    sget-object p0, Lpf2;->i:Lpf2;

    :goto_7b
    iget v1, p0, Lpf2;->b:I

    and-int/2addr v1, v10

    if-eq v1, v10, :cond_87

    iget p0, p0, Lpf2;->c:I

    packed-switch p0, :pswitch_data_bc

    :pswitch_85
    const/4 v9, 0x3

    goto :goto_94

    :cond_87
    :pswitch_87
    move v9, v10

    goto :goto_94

    :pswitch_89
    const/16 v9, 0xa

    goto :goto_94

    :pswitch_8c
    const/4 v9, 0x5

    goto :goto_94

    :pswitch_8e
    const/4 v9, 0x4

    goto :goto_94

    :pswitch_90
    const/16 v9, 0x8

    goto :goto_94

    :pswitch_93
    move v9, v11

    :goto_94
    :pswitch_94
    iget-object p0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    invoke-virtual {v0, v9}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    iget-object p0, p0, Lxod;->a:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/media/session/MediaSession;->setPlaybackToLocal(Landroid/media/AudioAttributes;)V

    return-void

    :cond_ad
    iget-object p0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    iget-object p0, p0, Lxod;->a:Landroid/media/session/MediaSession;

    invoke-virtual {v1}, Lwpd;->a()Landroid/media/VolumeProvider;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/media/session/MediaSession;->setPlaybackToRemote(Landroid/media/VolumeProvider;)V

    return-void

    nop

    :pswitch_data_bc
    .packed-switch 0x2
        :pswitch_93
        :pswitch_90
        :pswitch_8e
        :pswitch_8c
        :pswitch_94
        :pswitch_8c
        :pswitch_8c
        :pswitch_8c
        :pswitch_8c
        :pswitch_89
        :pswitch_85
        :pswitch_87
    .end packed-switch
.end method

.method public final u(Lbnn;)V
    .registers 5

    iget-object p1, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p1, Lafe;

    new-instance v0, Lcff;

    iget-wide v1, p0, Lypd;->d:J

    invoke-direct {v0, v1, v2}, Lcff;-><init>(J)V

    invoke-interface {p1, v0}, Lafe;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final v(Lqjd;)V
    .registers 3

    invoke-virtual {p0}, Lypd;->M()V

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Laqd;

    iget-object v0, p0, Laqd;->j:Lbpd;

    if-nez p1, :cond_16

    iget-object p1, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast p1, Lxod;

    iget-object p1, p1, Lxod;->a:Landroid/media/session/MediaSession;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/session/MediaSession;->setRatingType(I)V

    goto :goto_27

    :cond_16
    iget-object p1, p1, Lqjd;->e:Lvjd;

    iget-object p1, p1, Lvjd;->i:Lxjh;

    invoke-static {p1}, Lnac;->f(Lxjh;)I

    move-result p1

    iget-object v0, v0, Lbpd;->b:Ljava/lang/Object;

    check-cast v0, Lxod;

    iget-object v0, v0, Lxod;->a:Landroid/media/session/MediaSession;

    invoke-virtual {v0, p1}, Landroid/media/session/MediaSession;->setRatingType(I)V

    :goto_27
    iget-object p1, p0, Laqd;->f:Lnpd;

    iget-object p1, p1, Lnpd;->t:Lxkg;

    invoke-virtual {p0, p1}, Laqd;->Y(Lxkg;)V

    return-void
.end method

.method public final w(Ljava/util/LinkedHashSet;)V
    .registers 2

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0, p1}, La21;->w(Ljava/util/LinkedHashSet;)V

    return-void
.end method

.method public final x(ILxkg;Lxkg;)V
    .registers 6

    iget-object p1, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p1, Laqd;

    invoke-virtual {p3}, Lxkg;->x0()Lgql;

    move-result-object v0

    if-eqz p2, :cond_14

    invoke-virtual {p2}, Lxkg;->x0()Lgql;

    move-result-object v1

    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    :cond_14
    invoke-virtual {p0, v0}, Lypd;->G(Lgql;)V

    :cond_17
    const/16 v0, 0x12

    invoke-virtual {p3, v0}, Lxkg;->C(I)Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {p3}, Lxkg;->d0()Lvjd;

    move-result-object v1

    goto :goto_26

    :cond_24
    sget-object v1, Lvjd;->K:Lvjd;

    :goto_26
    if-eqz p2, :cond_3b

    invoke-virtual {p2, v0}, Lxkg;->C(I)Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-virtual {p2}, Lxkg;->d0()Lvjd;

    move-result-object v0

    goto :goto_35

    :cond_33
    sget-object v0, Lvjd;->K:Lvjd;

    :goto_35
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3e

    :cond_3b
    invoke-virtual {p0, v1}, Lypd;->A(Lvjd;)V

    :cond_3e
    invoke-virtual {p3}, Lxkg;->y0()Lvjd;

    move-result-object v0

    if-eqz p2, :cond_4e

    invoke-virtual {p2}, Lxkg;->y0()Lvjd;

    move-result-object v1

    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_51

    :cond_4e
    invoke-virtual {p0}, Lypd;->M()V

    :cond_51
    if-eqz p2, :cond_5d

    invoke-virtual {p2}, Lxkg;->getShuffleModeEnabled()Z

    move-result v0

    invoke-virtual {p3}, Lxkg;->getShuffleModeEnabled()Z

    move-result v1

    if-eq v0, v1, :cond_64

    :cond_5d
    invoke-virtual {p3}, Lxkg;->getShuffleModeEnabled()Z

    move-result v0

    invoke-virtual {p0, v0}, Lypd;->F(Z)V

    :cond_64
    if-eqz p2, :cond_70

    invoke-virtual {p2}, Lxkg;->getRepeatMode()I

    move-result v0

    invoke-virtual {p3}, Lxkg;->getRepeatMode()I

    move-result v1

    if-eq v0, v1, :cond_77

    :cond_70
    invoke-virtual {p3}, Lxkg;->getRepeatMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lypd;->B(I)V

    :cond_77
    invoke-virtual {p3}, Lxkg;->X()Lu67;

    invoke-virtual {p0}, Lypd;->t()V

    const/16 v0, 0x14

    invoke-virtual {p3, v0}, Lxkg;->C(I)Z

    move-result v0

    if-eqz v0, :cond_87

    const/4 v0, 0x4

    goto :goto_88

    :cond_87
    const/4 v0, 0x0

    :goto_88
    iget-byte v1, p1, Laqd;->q:B

    if-eq v1, v0, :cond_9b

    iput-byte v0, p1, Laqd;->q:B

    iget-object v1, p1, Laqd;->j:Lbpd;

    iget-object v1, v1, Lbpd;->b:Ljava/lang/Object;

    check-cast v1, Lxod;

    iget-object v1, v1, Lxod;->a:Landroid/media/session/MediaSession;

    or-int/lit8 v0, v0, 0x3

    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setFlags(I)V

    :cond_9b
    invoke-virtual {p3}, Lxkg;->w0()Lqjd;

    move-result-object v0

    if-eqz p2, :cond_af

    invoke-virtual {p2}, Lxkg;->w0()Lqjd;

    move-result-object p2

    invoke-static {p2, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_af

    invoke-virtual {p1, p3}, Laqd;->Y(Lxkg;)V

    return-void

    :cond_af
    invoke-virtual {p0, v0}, Lypd;->v(Lqjd;)V

    return-void
.end method

.method public final y()V
    .registers 1

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-virtual {p0}, La21;->y()V

    return-void
.end method

.method public final z(Lcnn;)V
    .registers 7

    iget-wide v0, p0, Lypd;->d:J

    iget-object p1, p1, Lcnn;->a:Lqjn;

    iget-object p1, p1, Lqjn;->g:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lypd;->a:Ljava/lang/Object;

    check-cast v2, Lafe;

    if-eqz p1, :cond_28

    new-instance v3, Lyg3;

    new-instance v4, Lj71;

    invoke-direct {v4, p1}, Lj71;-><init>(Landroid/graphics/Bitmap;)V

    invoke-direct {v3, v4}, Lyg3;-><init>(Lj71;)V

    iget-object p1, p0, Lypd;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/Map;

    iget-object p0, p0, Lypd;->c:Ljava/lang/Object;

    check-cast p0, Lxkn;

    invoke-interface {p1, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ldff;

    const/4 p1, 0x1

    invoke-direct {p0, v3, v0, v1, p1}, Ldff;-><init>(Lyg3;JZ)V

    goto :goto_32

    :cond_28
    new-instance p1, Lbff;

    iget-object p0, p0, Lypd;->e:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-direct {p1, v0, v1, p0}, Lbff;-><init>(JLjava/lang/Integer;)V

    move-object p0, p1

    :goto_32
    invoke-interface {v2, p0}, Lafe;->setValue(Ljava/lang/Object;)V

    return-void
.end method
