.class public final Ltjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Ldjg;

.field public final d:Lzkd;

.field public final e:Lode;

.field public final f:Lx5f;

.field public g:Landroidx/media3/exoplayer/ExoPlayer;

.field public h:Lzo4;

.field public i:Lujc;

.field public j:Lpod;

.field public k:Lokg;

.field public l:Lhd;

.field public m:Lmhd;

.field public n:Ljx6;

.field public o:Lxbf;

.field public p:Z

.field public final q:Li7f;

.field public final r:Lqjg;

.field public final s:Ljava/util/ArrayDeque;

.field public final t:Ljava/util/ArrayList;

.field public final u:Lhp2;

.field public final v:Ljava/util/ArrayList;

.field public w:Lsjg;

.field public x:Lnjg;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ldjg;Lzkd;Lx5f;)V
    .registers 23

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p4

    move-object/from16 v0, p5

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v15, Lode;

    invoke-direct {v15}, Lekc;-><init>()V

    iput-object v15, v1, Ltjg;->e:Lode;

    new-instance v2, Li7f;

    invoke-direct {v2}, Li7f;-><init>()V

    iput-object v2, v1, Ltjg;->q:Li7f;

    new-instance v2, Lqjg;

    invoke-direct {v2, v1}, Lqjg;-><init>(Ltjg;)V

    iput-object v2, v1, Ltjg;->r:Lqjg;

    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v2, v1, Ltjg;->s:Ljava/util/ArrayDeque;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Ltjg;->t:Ljava/util/ArrayList;

    new-instance v2, Lhp2;

    const/4 v4, 0x7

    const/4 v5, 0x0

    invoke-direct {v2, v4, v5}, Lhp2;-><init>(BZ)V

    iput-object v2, v1, Ltjg;->u:Lhp2;

    new-instance v2, Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, v1, Ltjg;->v:Ljava/util/ArrayList;

    iput-object v3, v1, Ltjg;->a:Landroid/content/Context;

    iput-object v13, v1, Ltjg;->b:Lumi;

    move-object/from16 v2, p3

    iput-object v2, v1, Ltjg;->c:Ldjg;

    iput-object v14, v1, Ltjg;->d:Lzkd;

    iput-object v0, v1, Ltjg;->f:Lx5f;

    invoke-virtual {v1}, Ltjg;->l()V

    iget-object v2, v1, Ltjg;->k:Lokg;

    new-instance v6, Lfpd;

    iget-object v7, v1, Ltjg;->i:Lujc;

    invoke-direct {v6, v7, v0, v1}, Lfpd;-><init>(Lujc;Lx5f;Ltjg;)V

    iget-object v0, v6, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->n()Z

    move-result v0

    invoke-static {v0}, Lz4o;->w(Z)V

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    sget-object v0, Lh1b;->b:La1b;

    move-object v0, v6

    sget-object v6, Lcsh;->e:Lcsh;

    iget-object v2, v2, Lokg;->c:Llkg;

    invoke-interface {v2}, Llkg;->f()Lkod;

    move-result-object v9

    sget-object v2, Lpod;->b:Ljava/lang/Object;

    sget-object v2, Lnpd;->C:Ldsk;

    invoke-interface {v2}, Ldsk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    new-instance v12, Lbpd;

    new-instance v7, Lgd6;

    invoke-direct {v7, v3, v5}, Lgd6;-><init>(Landroid/content/Context;B)V

    iput v2, v7, Lgd6;->c:I

    iput-boolean v4, v7, Lgd6;->b:Z

    new-instance v2, Lhd6;

    invoke-direct {v2, v7}, Lhd6;-><init>(Lgd6;)V

    invoke-direct {v12, v2}, Lbpd;-><init>(Lhd6;)V

    new-instance v2, Lpod;

    const-string v4, "PlayerManager"

    move-object v7, v6

    move-object v8, v6

    move/from16 v16, v5

    move-object v5, v0

    move/from16 v0, v16

    invoke-direct/range {v2 .. v12}, Lpod;-><init>(Landroid/content/Context;Ljava/lang/String;Lgk9;Lcsh;Lcsh;Lcsh;Lkod;Landroid/os/Bundle;Landroid/os/Bundle;Lbpd;)V

    iput-object v2, v1, Ltjg;->j:Lpod;

    iget-object v2, v1, Ltjg;->i:Lujc;

    invoke-virtual {v2}, Lgk9;->a()V

    iget-object v2, v1, Ltjg;->j:Lpod;

    iget-object v2, v2, Lpod;->a:Lnpd;

    iget-object v4, v2, Lnpd;->j:Lm4j;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    new-instance v5, La36;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-eqz v2, :cond_c5

    :goto_c3
    move-object v6, v2

    goto :goto_ca

    :cond_c5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    goto :goto_c3

    :goto_ca
    new-instance v7, Lmhd;

    invoke-direct {v7, v6}, Lmhd;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lghd;

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lghd;-><init>(Landroid/content/Context;Lm4j;La36;Landroid/os/Looper;Lmhd;)V

    move-object v4, v3

    move-object v3, v2

    move-object v2, v6

    move-object v6, v4

    move-object v4, v7

    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lfhd;

    invoke-direct {v2, v4, v3, v0}, Lfhd;-><init>(Lmhd;Lghd;B)V

    invoke-static {v5, v2}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    iput-object v4, v1, Ltjg;->m:Lmhd;

    new-instance v2, Lxbf;

    iget-object v3, v1, Ltjg;->j:Lpod;

    new-instance v5, Ljjg;

    invoke-direct {v5, v1, v0}, Ljjg;-><init>(Ljava/lang/Object;B)V

    move-object v0, v2

    move-object v2, v15

    invoke-direct/range {v0 .. v5}, Lxbf;-><init>(Ltjg;Lode;Lpod;Lmhd;Ljjg;)V

    iput-object v0, v1, Ltjg;->o:Lxbf;

    new-instance v2, Lhd;

    invoke-direct {v2, v6, v13, v0}, Lhd;-><init>(Landroid/content/Context;Lumi;Lxbf;)V

    iput-object v2, v1, Ltjg;->l:Lhd;

    iget-object v0, v1, Ltjg;->o:Lxbf;

    iget-object v1, v14, Lzkd;->e:Lwe7;

    invoke-virtual {v1, v0}, Lhkg;->a(Lxbf;)V

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iput-object v0, v14, Lzkd;->c:Ltjg;

    iget-object v1, v14, Lzkd;->d:Lxkd;

    invoke-virtual {v0, v1}, Ltjg;->a(Lrjg;)V

    invoke-virtual {v14}, Lzkd;->T()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lrjg;

    invoke-virtual {p0, p1}, Ltjg;->a(Lrjg;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lrjg;

    invoke-virtual {p0, p1}, Ltjg;->i(Lrjg;)V

    return-void
.end method

.method public final a(Lrjg;)V
    .registers 2

    iget-object p0, p0, Ltjg;->q:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lsjg;Z)V
    .registers 4

    iget-object v0, p0, Ltjg;->t:Ljava/util/ArrayList;

    if-eqz p2, :cond_9

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    goto :goto_a

    :cond_9
    const/4 p2, 0x0

    :goto_a
    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0}, Ltjg;->n()V

    iget-object p0, p0, Ltjg;->q:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_16
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_26

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lrjg;

    invoke-interface {p2, p1}, Lrjg;->d(Lsjg;)V

    goto :goto_16

    :cond_26
    return-void
.end method

.method public final c()Ljx6;
    .registers 5

    iget-object v0, p0, Ltjg;->i:Lujc;

    if-eqz v0, :cond_b

    iget-object v0, v0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->L()Lnyl;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    iget-object p0, p0, Ltjg;->a:Landroid/content/Context;

    if-nez v0, :cond_16

    new-instance v0, Ljx6;

    invoke-direct {v0, p0}, Ljx6;-><init>(Landroid/content/Context;)V

    return-object v0

    :cond_16
    new-instance v1, Ljx6;

    new-instance v2, Ln9a;

    const/16 v3, 0xf

    invoke-direct {v2, v3}, Ln9a;-><init>(B)V

    invoke-direct {v1, v0, v2, p0}, Ljx6;-><init>(Lnyl;Ln9a;Landroid/content/Context;)V

    return-object v1
.end method

.method public final e([Legd;Lk37;)V
    .registers 6

    new-instance v0, Lojg;

    invoke-direct {v0, p0, p2}, Lojg;-><init>(Ltjg;Lk37;)V

    iget-object p2, p0, Ltjg;->s:Ljava/util/ArrayDeque;

    invoke-virtual {p2, v0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    new-instance p2, Lwjh;

    new-instance v1, Lr9g;

    const/4 v2, 0x3

    invoke-direct {v1, v0, v2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Ltjg;->a:Landroid/content/Context;

    iget-object p0, p0, Ltjg;->b:Lumi;

    invoke-direct {p2, v0, p0, p1, v1}, Lwjh;-><init>(Landroid/content/Context;Lumi;[Legd;Lr9g;)V

    return-void
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Ltjg;->i:Lujc;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Ltjg;->l()V

    iget-object v0, p0, Ltjg;->o:Lxbf;

    iget-object v1, p0, Ltjg;->d:Lzkd;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Lzkd;->S(Lykd;Lx79;)V

    iget-object v3, v1, Lzkd;->e:Lwe7;

    invoke-virtual {v3, v0}, Lhkg;->b(Lxbf;)V

    iget-object v0, v1, Lzkd;->c:Ltjg;

    iget-object v3, v1, Lzkd;->d:Lxkd;

    invoke-virtual {v0, v3}, Ltjg;->i(Lrjg;)V

    iput-object v2, v1, Lzkd;->c:Ltjg;

    iget-object v0, p0, Ltjg;->i:Lujc;

    invoke-virtual {v0}, Lujc;->stop()V

    iget-object v0, p0, Ltjg;->q:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_29
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrjg;

    invoke-interface {v1}, Lrjg;->k()V

    goto :goto_29

    :cond_39
    iget-object v0, p0, Ltjg;->j:Lpod;

    invoke-virtual {v0}, Lpod;->a()V

    iput-object v2, p0, Ltjg;->j:Lpod;

    :try_start_40
    iget-object v0, p0, Ltjg;->m:Lmhd;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lghd;

    invoke-virtual {v0}, Lghd;->release()V
    :try_end_4b
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_40 .. :try_end_4b} :catch_4b
    .catch Ljava/lang/InterruptedException; {:try_start_40 .. :try_end_4b} :catch_4b

    :catch_4b
    iput-object v2, p0, Ltjg;->m:Lmhd;

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v1, p0, Ltjg;->r:Lqjg;

    invoke-virtual {v0, v1}, Lgk9;->g0(Leig;)V

    iget-object v0, p0, Ltjg;->i:Lujc;

    invoke-virtual {v0}, Lgk9;->release()V

    iput-object v2, p0, Ltjg;->g:Landroidx/media3/exoplayer/ExoPlayer;

    iput-object v2, p0, Ltjg;->i:Lujc;

    iput-object v2, p0, Ltjg;->n:Ljx6;

    iget-object v0, p0, Ltjg;->l:Lhd;

    iget-boolean v1, v0, Lhd;->b:Z

    if-eqz v1, :cond_6c

    iget-object v0, v0, Lhd;->e:Ljava/lang/Object;

    check-cast v0, Lse3;

    invoke-virtual {v0}, Ld17;->c()V

    :cond_6c
    iput-object v2, p0, Ltjg;->l:Lhd;

    iget-object v0, p0, Ltjg;->k:Lokg;

    invoke-virtual {v0}, Lokg;->b()V

    iput-object v2, p0, Ltjg;->k:Lokg;

    iput-object v2, p0, Ltjg;->o:Lxbf;

    return-void
.end method

.method public final g()V
    .registers 5

    iget-object p0, p0, Ltjg;->v:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_16

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_16
    invoke-virtual {p0, v1, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public final h()V
    .registers 3

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v0, v0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_10

    iget-object p0, p0, Ltjg;->i:Lujc;

    invoke-virtual {p0}, Lgk9;->a()V

    :cond_10
    return-void
.end method

.method public final i(Lrjg;)V
    .registers 2

    iget-object p0, p0, Ltjg;->q:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final j(Lsjg;)V
    .registers 4

    iget-object v0, p0, Ltjg;->t:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Ltjg;->q:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_b
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrjg;

    invoke-interface {v1, p1}, Lrjg;->i(Lsjg;)V

    goto :goto_b

    :cond_1b
    invoke-virtual {p0}, Ltjg;->n()V

    iget-object p0, p1, Lsjg;->b:Landroidx/media3/ui/PlayerView;

    if-eqz p0, :cond_26

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/media3/ui/PlayerView;->g(Lgig;)V

    :cond_26
    return-void
.end method

.method public final k(Lqjd;)Lkg7;
    .registers 5

    iget-object p0, p0, Ltjg;->k:Lokg;

    invoke-virtual {p0, p1}, Lokg;->c(Lqjd;)Legd;

    move-result-object p0

    iget-object p1, p1, Lqjd;->e:Lvjd;

    const/4 v0, 0x0

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Legd;->b()Lo29;

    move-result-object p0

    goto :goto_11

    :cond_10
    move-object p0, v0

    :goto_11
    if-eqz p0, :cond_17

    sget-object v1, Lo29;->c:Lo29;

    if-ne p0, v1, :cond_44

    :cond_17
    invoke-static {p1}, Lsfe;->d0(Lvjd;)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_44

    iget-object p1, p1, Lvjd;->I:Landroid/os/Bundle;

    if-eqz p1, :cond_27

    const-string v2, "com.opera.android.media.FILE_TYPE"

    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_27
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Llg7;->a:[[I

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object p1

    invoke-static {p1}, Llg7;->g(Lo29;)Lkg7;

    move-result-object p1

    if-eqz p0, :cond_43

    sget-object v0, Lkg7;->g:Lkg7;

    if-eq p1, v0, :cond_43

    sget-object v0, Lkg7;->h:Lkg7;

    if-ne p1, v0, :cond_44

    :cond_43
    return-object p1

    :cond_44
    if-nez p0, :cond_49

    sget-object p0, Lkg7;->f:Lkg7;

    return-object p0

    :cond_49
    invoke-static {p0}, Llg7;->g(Lo29;)Lkg7;

    move-result-object p0

    return-object p0
.end method

.method public final l()V
    .registers 7

    iget-object v0, p0, Ltjg;->g:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Ltjg;->x:Lnjg;

    if-eqz v0, :cond_13

    iget-object v1, v0, Lnjg;->t:Lcom/google/android/gms/cast/framework/SessionManager;

    const-class v2, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/cast/framework/SessionManager;->removeSessionManagerListener(Lcom/google/android/gms/cast/framework/SessionManagerListener;Ljava/lang/Class;)V

    const/4 v0, 0x0

    iput-object v0, p0, Ltjg;->x:Lnjg;

    :cond_13
    new-instance v0, Lai8;

    iget-object v1, p0, Ltjg;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Lai8;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Ltjg;->c()Ljx6;

    move-result-object v2

    iget-boolean v3, v0, Lai8;->o:Z

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    invoke-static {v3}, Lz4o;->H(Z)V

    new-instance v3, Lst6;

    invoke-direct {v3, v2, v4}, Lst6;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v0, Lai8;->d:Ldsk;

    iget-boolean v2, v0, Lai8;->o:Z

    xor-int/2addr v2, v4

    invoke-static {v2}, Lz4o;->H(Z)V

    const/16 v2, 0x2710

    iput-short v2, v0, Lai8;->k:S

    iget-boolean v2, v0, Lai8;->o:Z

    xor-int/2addr v2, v4

    invoke-static {v2}, Lz4o;->H(Z)V

    const/16 v2, 0x7530

    iput-short v2, v0, Lai8;->l:S

    invoke-virtual {v0}, Lai8;->a()Lqi8;

    move-result-object v0

    invoke-virtual {v0, v4}, Lqi8;->S0(I)V

    new-instance v2, Lokg;

    new-instance v3, Lkjg;

    invoke-direct {v3, p0, v4}, Lkjg;-><init>(Ltjg;B)V

    new-instance v4, Lmgf;

    const/4 v5, 0x5

    invoke-direct {v4, p0, v0, v5}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v1, v3, v4}, Lokg;-><init>(Landroid/content/Context;Lkjg;Ljr9;)V

    invoke-virtual {p0, v0, v2}, Ltjg;->m(Lg83;Lokg;)V

    return-void
.end method

.method public final m(Lg83;Lokg;)V
    .registers 11

    iget-object v0, p0, Ltjg;->k:Lokg;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_36

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v0, Lokg;->e:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v4, v0, Lokg;->c:Llkg;

    new-instance v5, Lkkg;

    invoke-direct {v5, v0, v3, v1}, Lkkg;-><init>(Lokg;Ljava/util/ArrayList;B)V

    invoke-interface {v4, v5, v2}, Llkg;->h(Lod3;Z)V

    new-array v0, v1, [Lmkg;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmkg;

    iget-object v3, p0, Ltjg;->i:Lujc;

    iget-object v3, v3, Lgk9;->b:Lgig;

    invoke-interface {v3}, Lgig;->getCurrentWindowIndex()I

    move-result v3

    iget-object v4, p0, Ltjg;->i:Lujc;

    iget-object v4, v4, Lgk9;->b:Lgig;

    invoke-interface {v4}, Lgig;->getCurrentPosition()J

    move-result-wide v4

    invoke-virtual {p2, v0, v3, v4, v5}, Lokg;->d([Lmkg;IJ)V

    :cond_36
    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v3, p0, Ltjg;->k:Lokg;

    iget-object v4, p0, Ltjg;->r:Lqjg;

    if-eqz v0, :cond_41

    invoke-virtual {v0, v4}, Lgk9;->g0(Leig;)V

    :cond_41
    new-instance v5, Lujc;

    invoke-direct {v5, p1, v2}, Lujc;-><init>(Lgig;B)V

    iput-object v5, p0, Ltjg;->i:Lujc;

    instance-of v5, p1, Landroidx/media3/exoplayer/ExoPlayer;

    const/4 v6, 0x0

    if-eqz v5, :cond_51

    move-object v5, p1

    check-cast v5, Landroidx/media3/exoplayer/ExoPlayer;

    goto :goto_52

    :cond_51
    move-object v5, v6

    :goto_52
    iput-object v5, p0, Ltjg;->g:Landroidx/media3/exoplayer/ExoPlayer;

    instance-of v7, p1, Lzo4;

    if-eqz v7, :cond_5b

    check-cast p1, Lzo4;

    goto :goto_5c

    :cond_5b
    move-object p1, v6

    :goto_5c
    iput-object p1, p0, Ltjg;->h:Lzo4;

    iput-object p2, p0, Ltjg;->k:Lokg;

    if-eqz v5, :cond_69

    sget-object p1, Lpf2;->i:Lpf2;

    check-cast v5, Lqi8;

    invoke-virtual {v5, p1, v2}, Lqi8;->A(Lpf2;Z)V

    :cond_69
    iget-object p1, p0, Ltjg;->i:Lujc;

    invoke-virtual {p1, v4}, Lgk9;->S(Leig;)V

    iget-object p1, p0, Ltjg;->o:Lxbf;

    if-eqz p1, :cond_9d

    iget-object p1, p1, Lxbf;->g:Ljava/lang/Object;

    check-cast p1, Luuj;

    iget-object p2, p0, Ltjg;->i:Lujc;

    invoke-virtual {p1}, Luuj;->i()I

    move-result v4

    iput-object p2, p1, Luuj;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Luuj;->i()I

    move-result p2

    if-eq p2, v4, :cond_9d

    iget-object p1, p1, Luuj;->b:Ljava/lang/Object;

    check-cast p1, Lh7f;

    new-instance v4, Lg7f;

    invoke-direct {v4, p1}, Lg7f;-><init>(Lh7f;)V

    :goto_8d
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_9d

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lald;

    invoke-virtual {p1, p2}, Lald;->a(I)V

    goto :goto_8d

    :cond_9d
    iget-object p1, p0, Ltjg;->e:Lode;

    iget-object p2, p0, Ltjg;->i:Lujc;

    invoke-virtual {p1, p2}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p1, p0, Ltjg;->g:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz p1, :cond_b2

    check-cast p1, Lqi8;

    invoke-virtual {p1}, Lqi8;->Y0()V

    iget-object p1, p1, Lqi8;->j:Ljx6;

    iput-object p1, p0, Ltjg;->n:Ljx6;

    goto :goto_b8

    :cond_b2
    iget-object p1, p0, Ltjg;->h:Lzo4;

    iget-object p1, p1, Lzo4;->h:Ljx6;

    iput-object p1, p0, Ltjg;->n:Ljx6;

    :goto_b8
    if-eqz v3, :cond_bd

    invoke-virtual {v3}, Lokg;->b()V

    :cond_bd
    if-eqz v0, :cond_f3

    iget-object p1, p0, Ltjg;->t:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    move v3, v1

    :cond_c6
    :goto_c6
    if-ge v3, p2, :cond_e4

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lsjg;

    iget-object v5, v4, Lsjg;->b:Landroidx/media3/ui/PlayerView;

    if-eqz v5, :cond_c6

    iget-object v7, v5, Landroidx/media3/ui/PlayerView;->q:Lgig;

    if-ne v7, v0, :cond_c6

    iget-object v7, p0, Ltjg;->w:Lsjg;

    if-ne v7, v4, :cond_df

    iget-object v4, p0, Ltjg;->i:Lujc;

    goto :goto_e0

    :cond_df
    move-object v4, v6

    :goto_e0
    invoke-virtual {v5, v4}, Landroidx/media3/ui/PlayerView;->g(Lgig;)V

    goto :goto_c6

    :cond_e4
    iget-object p1, p0, Ltjg;->i:Lujc;

    iget-object p2, v0, Lgk9;->b:Lgig;

    invoke-interface {p2}, Lgig;->e0()Z

    move-result p2

    invoke-virtual {p1, p2}, Lgk9;->setPlayWhenReady(Z)V

    invoke-virtual {v0}, Lgk9;->release()V

    goto :goto_f8

    :cond_f3
    iget-object p1, p0, Ltjg;->i:Lujc;

    invoke-virtual {p1, v1}, Lgk9;->setPlayWhenReady(Z)V

    :goto_f8
    iget-object p1, p0, Ltjg;->j:Lpod;

    if-eqz p1, :cond_145

    new-instance p2, Lfpd;

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v3, p0, Ltjg;->f:Lx5f;

    invoke-direct {p2, v0, v3, p0}, Lfpd;-><init>(Lujc;Lx5f;Ltjg;)V

    iget-object v0, p2, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->n()Z

    move-result v3

    invoke-static {v3}, Lz4o;->w(Z)V

    invoke-interface {v0}, Lgig;->I()Landroid/os/Looper;

    move-result-object v3

    iget-object p1, p1, Lpod;->a:Lnpd;

    iget-object v4, p1, Lnpd;->t:Lxkg;

    iget-object v4, v4, Lgk9;->b:Lgig;

    invoke-interface {v4}, Lgig;->I()Landroid/os/Looper;

    move-result-object v4

    if-ne v3, v4, :cond_120

    move v3, v2

    goto :goto_121

    :cond_120
    move v3, v1

    :goto_121
    invoke-static {v3}, Lz4o;->w(Z)V

    invoke-interface {v0}, Lgig;->I()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    if-ne v0, v3, :cond_12f

    move v1, v2

    :cond_12f
    invoke-static {v1}, Lz4o;->H(Z)V

    iget-object v0, p1, Lnpd;->t:Lxkg;

    iget-object v1, v0, Lgk9;->b:Lgig;

    if-eq p2, v1, :cond_140

    new-instance v1, Lxkg;

    invoke-direct {v1, p2}, Lgk9;-><init>(Lgig;)V

    invoke-virtual {p1, v0, v1}, Lnpd;->t(Lxkg;Lxkg;)V

    :cond_140
    iget-object p0, p0, Ltjg;->i:Lujc;

    invoke-virtual {p0}, Lgk9;->a()V

    :cond_145
    return-void
.end method

.method public final n()V
    .registers 4

    iget-object v0, p0, Ltjg;->t:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_b

    move-object v0, v2

    goto :goto_12

    :cond_b
    const/4 v1, 0x1

    invoke-static {v1, v0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsjg;

    :goto_12
    iget-object v1, p0, Ltjg;->w:Lsjg;

    if-eq v0, v1, :cond_3c

    if-eqz v0, :cond_24

    iget-object v1, v0, Lsjg;->b:Landroidx/media3/ui/PlayerView;

    if-eqz v1, :cond_24

    invoke-virtual {v1, v2}, Landroidx/media3/ui/PlayerView;->g(Lgig;)V

    iget-object v2, p0, Ltjg;->i:Lujc;

    invoke-virtual {v1, v2}, Landroidx/media3/ui/PlayerView;->g(Lgig;)V

    :cond_24
    iput-object v0, p0, Ltjg;->w:Lsjg;

    iget-object p0, p0, Ltjg;->q:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_2c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrjg;

    invoke-interface {v0}, Lrjg;->e()V

    goto :goto_2c

    :cond_3c
    return-void
.end method
