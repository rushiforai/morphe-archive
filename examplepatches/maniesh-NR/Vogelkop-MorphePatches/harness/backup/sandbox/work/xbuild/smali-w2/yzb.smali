.class public final synthetic Lyzb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;
.implements Ln5o;
.implements Lcom/leanplum/LeanplumOnPushOpenedCallback;
.implements Led2;
.implements Ljr9;
.implements Lm94;
.implements Lbqb;
.implements Lm9n;
.implements Livc;
.implements Lzph;
.implements Lp9n;
.implements Lvlk;
.implements Lnbd;
.implements Lvgd;
.implements Lkid;
.implements Lvid;
.implements Lpa2;
.implements Lvqd;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILandroid/app/PendingIntent;)V
    .registers 3

    const/16 p1, 0x17

    iput-byte p1, p0, Lyzb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyzb;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lyzb;->a:B

    iput-object p1, p0, Lyzb;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, La0c;

    invoke-virtual {p0}, La0c;->g0()V

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 2

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lnna;

    invoke-virtual {p0, p1}, Lnna;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/util/concurrent/ListenableFuture;

    return-object p0
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lyo7;

    .line 11
    invoke-virtual {p0, p1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Void;

    return-object p0
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 5

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lua7;

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lzr9;

    const/16 v2, 0x13

    invoke-direct {v1, p0, p1, v2}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast v0, Lg7a;

    invoke-virtual {v0, v1}, Lg7a;->execute(Ljava/lang/Runnable;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " [fetch@"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lbre;)V
    .registers 3

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lzuc;

    iget-object p0, p0, Lzuc;->d:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    iget-object p0, p0, Luqe;->m:Lc15;

    invoke-virtual {p0, p1}, Lc15;->h(Lbre;)V

    return-void
.end method

.method public final c(Ljava/lang/Object;)I
    .registers 5

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Loj9;

    check-cast p1, Logd;

    iget-object v0, p1, Logd;->b:Ljava/lang/String;

    iget-object v1, p0, Loj9;->n:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1c

    invoke-static {p0}, Lwgd;->b(Loj9;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    return v2

    :cond_1c
    invoke-virtual {p1, p0, v2}, Logd;->c(Loj9;Z)Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-virtual {p1, p0}, Logd;->d(Loj9;)Z

    move-result p0

    if-eqz p0, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    return v2
.end method

.method public final d(Z)V
    .registers 4

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lrld;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    if-eqz v0, :cond_32

    invoke-virtual {v0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v0

    if-eqz v0, :cond_32

    if-eqz p1, :cond_32

    iget-object p1, p0, Lrld;->m:Lhld;

    if-eqz p1, :cond_32

    iget-object p1, p1, Lhld;->n:Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {p1}, Lcom/opera/android/media/PlayerContainerView;->d()Landroid/graphics/Rect;

    move-result-object p1

    if-eqz p1, :cond_32

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    new-instance v0, Landroid/util/Size;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    invoke-static {p0, v0}, La26;->k0(Landroidx/fragment/app/r;Landroid/util/Size;)V

    :cond_32
    return-void
.end method

.method public final e(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lb10;

    invoke-virtual {p0, p2}, Lb10;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final f(Lgid;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lyzb;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object v0, v0, Lyzb;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_18c

    check-cast v0, Landroid/os/Bundle;

    invoke-virtual {v1}, Lgid;->r()Z

    move-result v2

    if-eqz v2, :cond_5b

    iget-object v2, v1, Lgid;->t:Lcsh;

    iget-object v5, v1, Lgid;->u:Lcsh;

    iput-object v0, v1, Lgid;->I:Landroid/os/Bundle;

    iget-object v6, v1, Lgid;->s:Lh1b;

    iget-object v7, v1, Lgid;->r:Lh1b;

    iget-object v8, v1, Lgid;->v:Lo3j;

    iget-object v9, v1, Lgid;->y:Lcig;

    invoke-static {v6, v7, v8, v9, v0}, Lgid;->H(Ljava/util/List;Ljava/util/List;Lo3j;Lcig;Landroid/os/Bundle;)Lcsh;

    move-result-object v0

    iput-object v0, v1, Lgid;->t:Lcsh;

    iget-object v6, v1, Lgid;->r:Lh1b;

    iget-object v7, v1, Lgid;->I:Landroid/os/Bundle;

    iget-object v8, v1, Lgid;->v:Lo3j;

    iget-object v9, v1, Lgid;->y:Lcig;

    invoke-static {v0, v6, v7, v8, v9}, Lgid;->G(Lcsh;Ljava/util/List;Landroid/os/Bundle;Lo3j;Lcig;)Lcsh;

    move-result-object v0

    iput-object v0, v1, Lgid;->u:Lcsh;

    iget-object v0, v1, Lgid;->t:Lcsh;

    invoke-virtual {v0, v2}, Lh1b;->equals(Ljava/lang/Object;)Z

    iget-object v0, v1, Lgid;->u:Lcsh;

    invoke-virtual {v0, v5}, Lh1b;->equals(Ljava/lang/Object;)Z

    iget-object v0, v1, Lgid;->a:Lghd;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, v0, Lghd;->f:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_53

    move v3, v4

    :cond_53
    invoke-static {v3}, Lz4o;->H(Z)V

    iget-object v0, v0, Lghd;->e:La36;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_5b
    return-void

    :pswitch_5c
    check-cast v0, Landroid/app/PendingIntent;

    invoke-virtual {v1}, Lgid;->r()Z

    move-result v2

    if-eqz v2, :cond_88

    iget-object v2, v1, Lgid;->q:Landroid/app/PendingIntent;

    invoke-static {v2, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_88

    iput-object v0, v1, Lgid;->q:Landroid/app/PendingIntent;

    iget-object v0, v1, Lgid;->a:Lghd;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, v0, Lghd;->f:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_80

    move v3, v4

    :cond_80
    invoke-static {v3}, Lz4o;->H(Z)V

    iget-object v0, v0, Lghd;->e:La36;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_88
    return-void

    :pswitch_89
    check-cast v0, Lc4j;

    invoke-virtual {v1}, Lgid;->r()Z

    move-result v2

    if-eqz v2, :cond_b3

    iget-object v2, v1, Lgid;->k:Lt72;

    invoke-virtual {v2}, Lt72;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b3

    iget-object v2, v1, Lgid;->p:Lijg;

    iget-object v2, v2, Lijg;->c:Lc4j;

    iget-wide v3, v2, Lc4j;->c:J

    iget-wide v5, v0, Lc4j;->c:J

    cmp-long v3, v3, v5

    if-gez v3, :cond_b3

    invoke-static {v0, v2}, Lz5i;->n(Lc4j;Lc4j;)Z

    move-result v2

    if-eqz v2, :cond_b3

    iget-object v2, v1, Lgid;->p:Lijg;

    invoke-virtual {v2, v0}, Lijg;->j(Lc4j;)Lijg;

    move-result-object v0

    iput-object v0, v1, Lgid;->p:Lijg;

    :cond_b3
    return-void

    :pswitch_b4
    check-cast v0, Lnm5;

    iget-object v2, v1, Lgid;->e:Lm4j;

    iget-object v5, v1, Lgid;->a:Lghd;

    iget-object v6, v1, Lgid;->D:Lssa;

    if-eqz v6, :cond_c8

    const-string v0, "Cannot be notified about the connection result many times. Probably a bug or malicious app."

    invoke-static {v0}, Lw7d;->q(Ljava/lang/String;)V

    invoke-virtual {v5}, Lghd;->release()V

    goto/16 :goto_18b

    :cond_c8
    iget-object v6, v0, Lnm5;->c:Lssa;

    iget-object v7, v0, Lnm5;->n:Lcsh;

    iget-object v8, v0, Lnm5;->i:Landroid/os/Bundle;

    iput-object v6, v1, Lgid;->D:Lssa;

    iget-object v6, v0, Lnm5;->d:Landroid/app/PendingIntent;

    iput-object v6, v1, Lgid;->q:Landroid/app/PendingIntent;

    iget-object v6, v0, Lnm5;->e:Lo3j;

    iput-object v6, v1, Lgid;->v:Lo3j;

    iget-object v6, v0, Lnm5;->f:Lcig;

    iput-object v6, v1, Lgid;->w:Lcig;

    iget-object v9, v0, Lnm5;->g:Lcig;

    iput-object v9, v1, Lgid;->x:Lcig;

    invoke-static {v6, v9}, Lgid;->d(Lcig;Lcig;)Lcig;

    move-result-object v6

    iput-object v6, v1, Lgid;->y:Lcig;

    iget-object v9, v0, Lnm5;->k:Lh1b;

    iput-object v9, v1, Lgid;->r:Lh1b;

    iget-object v10, v0, Lnm5;->l:Lh1b;

    iput-object v10, v1, Lgid;->s:Lh1b;

    iget-object v11, v1, Lgid;->v:Lo3j;

    invoke-static {v10, v9, v11, v6, v8}, Lgid;->H(Ljava/util/List;Ljava/util/List;Lo3j;Lcig;Landroid/os/Bundle;)Lcsh;

    move-result-object v6

    iput-object v6, v1, Lgid;->t:Lcsh;

    iget-object v9, v1, Lgid;->r:Lh1b;

    iget-object v10, v1, Lgid;->v:Lo3j;

    iget-object v11, v1, Lgid;->y:Lcig;

    invoke-static {v6, v9, v8, v10, v11}, Lgid;->G(Lcsh;Ljava/util/List;Landroid/os/Bundle;Lo3j;Lcig;)Lcsh;

    move-result-object v6

    iput-object v6, v1, Lgid;->u:Lcsh;

    new-instance v6, Lk1b;

    const/4 v9, 0x4

    invoke-direct {v6, v9}, Lk1b;-><init>(I)V

    move v9, v3

    :goto_109
    iget v10, v7, Lcsh;->d:I

    if-ge v9, v10, :cond_123

    invoke-virtual {v7, v9}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lvb5;

    iget-object v11, v10, Lvb5;->a:Ln3j;

    if-eqz v11, :cond_120

    iget v12, v11, Ln3j;->a:I

    if-nez v12, :cond_120

    iget-object v11, v11, Ln3j;->b:Ljava/lang/String;

    invoke-virtual {v6, v11, v10}, Lk1b;->e(Ljava/lang/Object;Ljava/lang/Object;)Lk1b;

    :cond_120
    add-int/lit8 v9, v9, 0x1

    goto :goto_109

    :cond_123
    invoke-virtual {v6, v4}, Lk1b;->b(Z)Lhsh;

    iget-object v6, v0, Lnm5;->j:Lijg;

    iput-object v6, v1, Lgid;->p:Lijg;

    iget-object v6, v0, Lnm5;->m:Landroid/media/session/MediaSession$Token;

    if-nez v6, :cond_132

    iget-object v6, v2, Lm4j;->a:Ln4j;

    iget-object v6, v6, Ln4j;->g:Landroid/media/session/MediaSession$Token;

    :cond_132
    if-eqz v6, :cond_13d

    new-instance v7, Landroid/media/session/MediaController;

    iget-object v9, v1, Lgid;->d:Landroid/content/Context;

    invoke-direct {v7, v9, v6}, Landroid/media/session/MediaController;-><init>(Landroid/content/Context;Landroid/media/session/MediaSession$Token;)V

    iput-object v7, v1, Lgid;->E:Landroid/media/session/MediaController;

    :cond_13d
    :try_start_13d
    iget-object v7, v0, Lnm5;->c:Lssa;

    invoke-interface {v7}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object v7

    iget-object v9, v1, Lgid;->g:Lzhd;

    invoke-interface {v7, v9, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_148
    .catch Landroid/os/RemoteException; {:try_start_13d .. :try_end_148} :catch_188

    new-instance v9, Lm4j;

    iget-object v2, v2, Lm4j;->a:Ln4j;

    iget v10, v2, Ln4j;->a:I

    iget v11, v0, Lnm5;->a:I

    iget v12, v0, Lnm5;->b:I

    iget-object v13, v2, Ln4j;->d:Ljava/lang/String;

    iget-object v14, v0, Lnm5;->c:Lssa;

    iget-object v15, v0, Lnm5;->h:Landroid/os/Bundle;

    move-object/from16 v16, v6

    invoke-direct/range {v9 .. v16}, Lm4j;-><init>(IIILjava/lang/String;Lssa;Landroid/os/Bundle;Landroid/media/session/MediaSession$Token;)V

    iput-object v9, v1, Lgid;->n:Lm4j;

    iput-object v8, v1, Lgid;->I:Landroid/os/Bundle;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, v5, Lghd;->f:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_171

    move v3, v4

    :cond_171
    invoke-static {v3}, Lz4o;->H(Z)V

    iget-boolean v0, v5, Lghd;->h:Z

    xor-int/2addr v0, v4

    invoke-static {v0}, Lz4o;->H(Z)V

    iput-boolean v4, v5, Lghd;->h:Z

    iget-object v0, v5, Lghd;->i:Lmhd;

    iput-boolean v4, v0, Lmhd;->c:Z

    iget-object v1, v0, Lmhd;->b:Lghd;

    if-eqz v1, :cond_18b

    invoke-virtual {v0, v1}, Lm4;->set(Ljava/lang/Object;)Z

    goto :goto_18b

    :catch_188
    invoke-virtual {v5}, Lghd;->release()V

    :cond_18b
    :goto_18b
    return-void

    :pswitch_data_18c
    .packed-switch 0x15
        :pswitch_b4
        :pswitch_89
        :pswitch_5c
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lisd;

    check-cast p1, Ll1c;

    if-eqz p1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    invoke-virtual {p0, p1, v0}, Lisd;->E(Ljava/lang/Object;Z)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h(Landroid/view/View;)V
    .registers 4

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    check-cast p1, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_11

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_11
    return-void
.end method

.method public final i(Lamk;)V
    .registers 2

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lh8d;

    iget-object p1, p1, Lamk;->a:Lzsk;

    iget-object p1, p1, Lzsk;->a:Ljava/lang/String;

    iput-object p1, p0, Lh8d;->k:Ljava/lang/String;

    iget-object p0, p0, Lh8d;->j:Lq5g;

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final isEmpty()Z
    .registers 4

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lzse;

    iget-object v0, p0, Lzse;->t:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    move-object v0, v1

    :cond_a
    iget-object v0, v0, Ly83;->h:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_3c

    invoke-virtual {p0}, Lzse;->G0()Ldte;

    move-result-object v0

    iget-object v0, v0, Ldte;->e:Lbte;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lbte;->b:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3c

    iget-object p0, p0, Lzse;->y:Lwse;

    if-eqz p0, :cond_32

    move-object v1, p0

    :cond_32
    iget-object p0, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-nez p0, :cond_3c

    const/4 p0, 0x1

    return p0

    :cond_3c
    const/4 p0, 0x0

    return p0
.end method

.method public final j()V
    .registers 5

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Llrc;

    iget-object v0, p0, Llrc;->B:Lor2;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    move-object v0, v1

    :cond_a
    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v0

    iget v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v3, 0x6

    if-eq v2, v3, :cond_18

    return-void

    :cond_18
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    iget-object p0, p0, Llrc;->C:Lvl6;

    if-eqz p0, :cond_20

    move-object v1, p0

    :cond_20
    iget-object p0, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    return-void
.end method

.method public final l(Lnpd;Lnod;I)Ljava/lang/Object;
    .registers 5

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Ltqd;

    invoke-virtual {p1}, Lnpd;->i()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object p0, Lr0b;->b:Lr0b;

    return-object p0

    :cond_d
    iget-object v0, p1, Lnpd;->t:Lxkg;

    invoke-interface {p0, v0, p2}, Ltqd;->h(Lxkg;Lnod;)V

    new-instance p0, Le4j;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Le4j;-><init>(I)V

    invoke-static {p1, p2, p3, p0}, Lxqd;->Y0(Lnpd;Lnod;ILe4j;)V

    sget-object p0, Lr0b;->b:Lr0b;

    return-object p0
.end method

.method public final n(Ltw7;)V
    .registers 3

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lnv6;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_11

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    return-void

    :cond_11
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_16

    return-void

    :cond_16
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final onLeanplumPushOpened(Landroid/os/Bundle;)V
    .registers 8

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lz9c;

    new-instance v0, Lcm;

    if-eqz p1, :cond_f

    const-string v1, "lp_messageId"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    invoke-static {p1}, Lz9c;->b(Landroid/os/Bundle;)I

    move-result v2

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Lcm;-><init>(Ljava/lang/String;IB)V

    iget-object p0, p0, Lz9c;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-string v4, "c.o.a.lp.created"

    invoke-virtual {p1, v4, v2, v3}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sub-long/2addr v2, v4

    const/4 v4, 0x1

    invoke-virtual {v1, v0, v4, v2, v3}, Lx5f;->q0(Lqyl;ZJ)V

    invoke-static {p0, p1}, Lz9c;->a(Landroid/content/Context;Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_54

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    invoke-virtual {v0}, Lcm;->f()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lsj0;->b:Lsj0;

    sget-object v2, Lxn0;->b:Lxn0;

    invoke-virtual {p0, v0, p1, v1, v2}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_54
    return-void
.end method

.method public final run(J)V
    .registers 4

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Landroid/media/MediaCrypto;

    sget-object v0, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    invoke-static {p1, p2, p0}, LJ/N;->MV9yuwVC(JLjava/lang/Object;)V

    return-void
.end method
