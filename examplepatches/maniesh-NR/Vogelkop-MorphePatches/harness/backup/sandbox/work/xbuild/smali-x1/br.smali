.class public final synthetic Lbr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lbr;->a:B

    iput p1, p0, Lbr;->b:I

    iput-object p2, p0, Lbr;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 10
    iput-byte p3, p0, Lbr;->a:B

    iput-object p1, p0, Lbr;->c:Ljava/lang/Object;

    iput p2, p0, Lbr;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Lbr;->a:B

    const/16 v1, 0x8

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_338

    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iget p0, p0, Lbr;->b:I

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    return-void

    :pswitch_15
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lx77;

    iget p0, p0, Lbr;->b:I

    iget-object v2, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v2, Lod9;

    invoke-virtual {v2}, Lryl;->g0()V

    and-int/lit8 v2, p0, 0x2

    if-eqz v2, :cond_31

    new-instance p0, Ln99;

    invoke-direct {p0}, Ln99;-><init>()V

    const v1, 0x7f140793

    iput v1, p0, Ln99;->m:I

    goto :goto_53

    :cond_31
    and-int/lit8 v2, p0, 0x4

    if-eqz v2, :cond_40

    new-instance p0, Ln99;

    invoke-direct {p0}, Ln99;-><init>()V

    const v1, 0x7f1407a4

    iput v1, p0, Ln99;->m:I

    goto :goto_53

    :cond_40
    and-int/2addr p0, v1

    if-eqz p0, :cond_4e

    new-instance p0, Ln99;

    invoke-direct {p0}, Ln99;-><init>()V

    const v1, 0x7f140798

    iput v1, p0, Ln99;->m:I

    goto :goto_53

    :cond_4e
    new-instance p0, Ln99;

    invoke-direct {p0}, Ln99;-><init>()V

    :goto_53
    iget-object v1, v0, Lx77;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v1}, Ls63;->w0(Landroid/content/Context;)V

    iget-object p0, v0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_64
    iget v0, p0, Lbr;->b:I

    iget-object p0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast p0, Lgal;

    const/16 v1, -0x3e8

    if-ge v0, v1, :cond_7d

    invoke-virtual {p0}, Lgal;->f()Z

    move-result v0

    if-nez v0, :cond_77

    sget-object v0, Lp6l;->b:Lp6l;

    goto :goto_79

    :cond_77
    sget-object v0, Lp6l;->a:Lp6l;

    :goto_79
    invoke-virtual {p0, v0}, Lgal;->g(Lp6l;)V

    goto :goto_8f

    :cond_7d
    const/16 v1, 0x3e8

    if-le v0, v1, :cond_8f

    invoke-virtual {p0}, Lgal;->f()Z

    move-result v0

    if-eqz v0, :cond_8a

    sget-object v0, Lp6l;->b:Lp6l;

    goto :goto_8c

    :cond_8a
    sget-object v0, Lp6l;->a:Lp6l;

    :goto_8c
    invoke-virtual {p0, v0}, Lgal;->g(Lp6l;)V

    :cond_8f
    :goto_8f
    return-void

    :pswitch_90
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Ld7l;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0, p0}, Le7l;->h(I)V

    return-void

    :pswitch_9c
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lmrk;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Lmrk;->C:Lhqk;

    invoke-virtual {v0, p0}, Lhqk;->G(I)V

    return-void

    :pswitch_a8
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lshf;

    iget p0, p0, Lbr;->b:I

    iget-object v1, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Landroidx/fragment/app/w;

    invoke-virtual {v1, p0, v4}, Landroidx/fragment/app/w;->W(IZ)V

    iget-object p0, v0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Lp7l;

    invoke-virtual {p0}, Lp7l;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_bd
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Le8i;

    iget p0, p0, Lbr;->b:I

    iget-object v1, v0, Le8i;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_d4

    iget-object v0, v0, Le8i;->a:Lcrk;

    iget-object v0, v0, Lcrk;->b:Ljava/lang/Object;

    check-cast v0, Lqrm;

    invoke-virtual {v0, p0}, Lqrm;->w(I)V

    :cond_d4
    return-void

    :pswitch_d5
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lmoh;

    iget p0, p0, Lbr;->b:I

    iget v1, v0, Lmoh;->B:I

    iput p0, v0, Lmoh;->B:I

    if-eq v1, p0, :cond_11b

    const/4 v1, 0x3

    if-ne p0, v1, :cond_101

    iget-object p0, v0, Lmoh;->q:Landroid/view/Surface;

    if-nez p0, :cond_11b

    iget-object p0, v0, Lmoh;->y:Lkoh;

    if-eqz p0, :cond_fd

    iget-boolean v1, p0, Lkoh;->d:Z

    if-nez v1, :cond_fb

    iput-boolean v5, p0, Lkoh;->d:Z

    iget-object v1, p0, Lkoh;->f:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_fb

    invoke-interface {v1, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v3, p0, Lkoh;->f:Ljava/util/concurrent/ScheduledFuture;

    :cond_fb
    iput-object v3, v0, Lmoh;->y:Lkoh;

    :cond_fd
    invoke-virtual {v0}, Lmoh;->o()V

    goto :goto_11b

    :cond_101
    if-ne p0, v2, :cond_11b

    iget-object p0, v0, Lmoh;->v:Ljava/util/concurrent/ScheduledFuture;

    if-eqz p0, :cond_11b

    invoke-interface {p0, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result p0

    if-eqz p0, :cond_11b

    iget-object p0, v0, Lmoh;->s:Lf28;

    if-eqz p0, :cond_11b

    iget-object v0, p0, Lf28;->g:Lb2j;

    new-instance v2, Ly18;

    invoke-direct {v2, p0, v1}, Ly18;-><init>(Lf28;B)V

    invoke-virtual {v0, v2}, Lb2j;->execute(Ljava/lang/Runnable;)V

    :cond_11b
    :goto_11b
    return-void

    :pswitch_11c
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lyvg;

    iget p0, p0, Lbr;->b:I

    iput-object v3, v0, Lyvg;->e:Loml;

    iget-object v6, v0, Lyvg;->h:Lgkj;

    if-nez v6, :cond_17c

    if-eq p0, v5, :cond_131

    if-ne p0, v2, :cond_130

    const v6, 0x7f1407d6

    goto :goto_134

    :cond_130
    throw v3

    :cond_131
    const v6, 0x7f141338

    :goto_134
    if-eq p0, v5, :cond_13d

    if-ne p0, v2, :cond_13c

    const p0, 0x7f1407d5

    goto :goto_140

    :cond_13c
    throw v3

    :cond_13d
    const p0, 0x7f141337

    :goto_140
    new-instance v2, Lrxh;

    invoke-direct {v2, p0}, Lrxh;-><init>(I)V

    new-instance p0, Lr9g;

    invoke-direct {p0, v0, v1}, Lr9g;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lgkj;

    invoke-direct {v1, v4, v4}, Lnz0;-><init>(ZZ)V

    iput-object v3, v1, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->c:Ljava/lang/String;

    iput-object v3, v1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v1, Lgkj;->e:Lekj;

    iput-object p0, v1, Lgkj;->f:Lfkj;

    iput-object v3, v1, Lgkj;->g:Lqp2;

    iput-object v3, v1, Lgkj;->h:Ldkj;

    iput-object v3, v1, Lgkj;->i:Ldkj;

    iput-object v3, v1, Lgkj;->j:Lql;

    const p0, 0x7f140812

    iput p0, v1, Lgkj;->k:I

    iput v4, v1, Lgkj;->l:I

    iput v6, v1, Lgkj;->m:I

    iput-boolean v5, v1, Lgkj;->n:Z

    iput-object v2, v1, Lgkj;->o:Lpxh;

    iput-object v1, v0, Lyvg;->h:Lgkj;

    iget-object p0, v0, Lyvg;->c:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_17c
    return-void

    :pswitch_17d
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Luff;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Luff;->c:Ljava/util/function/IntConsumer;

    invoke-interface {v0, p0}, Ljava/util/function/IntConsumer;->accept(I)V

    return-void

    :pswitch_189
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lwub;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Ll2f;

    invoke-virtual {v0, p0, v3}, Ll2f;->a(ILjava/lang/String;)V

    return-void

    :pswitch_197
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/ModalDialogWrapper;

    iget p0, p0, Lbr;->b:I

    iget-wide v0, v0, Lorg/chromium/ui/ModalDialogWrapper;->a:J

    invoke-static {v0, v1, p0}, LJ/N;->MFGXE2ht(JI)V

    return-void

    :pswitch_1a3
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lgid;

    iget p0, p0, Lbr;->b:I

    iget-object v1, v0, Lgid;->k:Lt72;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lt72;->remove(Ljava/lang/Object;)Z

    iget-object v2, v0, Lgid;->l:Landroid/util/SparseArray;

    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->delete(I)V

    iget-object p0, v0, Lgid;->n:Lm4j;

    if-eqz p0, :cond_1d4

    iget-object p0, p0, Lm4j;->a:Ln4j;

    iget p0, p0, Ln4j;->c:I

    const/4 v2, 0x5

    if-ge p0, v2, :cond_1d4

    invoke-virtual {v1}, Lt72;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1d4

    iget-object p0, v0, Lgid;->m:Landroid/os/Handler;

    new-instance v1, Lohd;

    invoke-direct {v1, v0, v4}, Lohd;-><init>(Lgid;B)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1d4
    return-void

    :pswitch_1d5
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iget p0, p0, Lbr;->b:I

    sget-object v1, Lcom/google/android/material/button/MaterialButton;->O:[I

    invoke-virtual {v0, p0}, Lcom/google/android/material/button/MaterialButton;->E(I)V

    return-void

    :pswitch_1e1
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Ld2n;

    iget p0, p0, Lbr;->b:I

    invoke-virtual {v0, p0}, Ld2n;->onStatus(I)V

    return-void

    :pswitch_1eb
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lkba;

    iget p0, p0, Lbr;->b:I

    iget-object v1, v0, Lkba;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v3, v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v3, :cond_210

    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v3

    if-gt v3, p0, :cond_207

    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v2

    if-le p0, v2, :cond_210

    :cond_207
    iput p0, v0, Lkba;->b:I

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    invoke-virtual {v1, p0}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    goto :goto_21b

    :cond_210
    invoke-virtual {v1, p0}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object p0

    if-eqz p0, :cond_21b

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0}, Lqe6;->N(Landroid/view/View;)V

    :cond_21b
    :goto_21b
    return-void

    :pswitch_21c
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lcd9;

    iget p0, p0, Lbr;->b:I

    invoke-virtual {v0, p0}, Lcd9;->B0(I)V

    return-void

    :pswitch_226
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lrr8;

    iget p0, p0, Lbr;->b:I

    iget v1, v0, Lrr8;->m:I

    if-eq p0, v1, :cond_23b

    iput p0, v0, Lrr8;->m:I

    iget-object v0, v0, Lrr8;->k:Lvuh;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lvuh;->run(Ljava/lang/Object;)V

    :cond_23b
    return-void

    :pswitch_23c
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Ld28;

    iget p0, p0, Lbr;->b:I

    iget-boolean v1, v0, Ld28;->j:Z

    iget-object v0, v0, Ld28;->l:Lf28;

    if-nez v1, :cond_26d

    iget v1, v0, Lf28;->E:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    packed-switch v1, :pswitch_data_374

    iget p0, v0, Lf28;->E:I

    invoke-static {p0}, Lo18;->v(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Unknown state: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_26d

    :pswitch_261
    iget-object v1, v0, Lf28;->j:Ljava/util/ArrayDeque;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lf28;->b()V

    :cond_26d
    :goto_26d
    :pswitch_26d
    return-void

    :pswitch_26e
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/display/DisplayAndroidManager;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Lorg/chromium/ui/display/DisplayAndroidManager;->e:Ljava/util/HashSet;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v5

    const-string v0, "Android.Display.IsNullDisplayRemoved"

    invoke-static {v0, p0}, Lioh;->t(Ljava/lang/String;Z)V

    return-void

    :pswitch_285
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, La06;

    iget p0, p0, Lbr;->b:I

    add-int/2addr p0, v5

    invoke-virtual {v0, p0}, La06;->G0(I)V

    return-void

    :pswitch_290
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lsb4;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Lsb4;->b:Ljava/lang/Object;

    check-cast v0, Ligi;

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Ls1h;

    if-eqz v0, :cond_2a3

    invoke-virtual {v0, p0}, Ls1h;->a(I)V

    :cond_2a3
    return-void

    :pswitch_2a4
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lrb4;

    iget p0, p0, Lbr;->b:I

    invoke-virtual {v0, p0}, Lrb4;->a(I)V

    return-void

    :pswitch_2ae
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lth3;

    iget p0, p0, Lbr;->b:I

    iget-boolean v1, v0, Lth3;->e:Z

    if-nez v1, :cond_2c1

    if-nez p0, :cond_2be

    invoke-virtual {v0}, Lth3;->k()V

    goto :goto_2c1

    :cond_2be
    invoke-virtual {v0, p0}, Lth3;->l(I)V

    :cond_2c1
    :goto_2c1
    return-void

    :pswitch_2c2
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lim7;

    iget p0, p0, Lbr;->b:I

    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_2d1

    invoke-static {p0}, Lqe6;->N(Landroid/view/View;)V

    :cond_2d1
    return-void

    :pswitch_2d2
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Lpad;

    iget p0, p0, Lbr;->b:I

    iget-object v0, v0, Lpad;->c:Ljava/lang/Object;

    check-cast v0, Lmi8;

    sget-object v2, Ltym;->a:Ljava/lang/String;

    iget-object v0, v0, Lmi8;->a:Lqi8;

    iget-object v0, v0, Lqi8;->D:Lpr;

    new-instance v2, Lli8;

    invoke-direct {v2, p0}, Lli8;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    iget-object v6, v0, Lpr;->c:Ljava/lang/Object;

    check-cast v6, Lszk;

    iget-object v6, v6, Lszk;->a:Landroid/os/Handler;

    invoke-virtual {v6}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v6

    if-ne v3, v6, :cond_2fb

    move v4, v5

    :cond_2fb
    invoke-static {v4}, Lz4o;->H(Z)V

    iget v3, v0, Lpr;->a:I

    add-int/2addr v3, v5

    iput v3, v0, Lpr;->a:I

    new-instance v3, Lbi2;

    invoke-direct {v3, v0, v2, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lpr;->A(Ljava/lang/Runnable;)V

    iget-object v1, v0, Lpr;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lpr;->G(Ljava/lang/Object;)V

    return-void

    :pswitch_317
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/function/IntConsumer;

    iget p0, p0, Lbr;->b:I

    invoke-interface {v0, p0}, Ljava/util/function/IntConsumer;->accept(I)V

    return-void

    :pswitch_321
    iget v0, p0, Lbr;->b:I

    iget-object p0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_32e
    iget-object v0, p0, Lbr;->c:Ljava/lang/Object;

    check-cast v0, Ldr;

    iget p0, p0, Lbr;->b:I

    iput p0, v0, Ldr;->d:I

    return-void

    nop

    :pswitch_data_338
    .packed-switch 0x0
        :pswitch_32e
        :pswitch_321
        :pswitch_317
        :pswitch_2d2
        :pswitch_2c2
        :pswitch_2ae
        :pswitch_2a4
        :pswitch_290
        :pswitch_285
        :pswitch_26e
        :pswitch_23c
        :pswitch_226
        :pswitch_21c
        :pswitch_1eb
        :pswitch_1e1
        :pswitch_1d5
        :pswitch_1a3
        :pswitch_197
        :pswitch_189
        :pswitch_17d
        :pswitch_11c
        :pswitch_d5
        :pswitch_bd
        :pswitch_a8
        :pswitch_9c
        :pswitch_90
        :pswitch_64
        :pswitch_15
    .end packed-switch

    :pswitch_data_374
    .packed-switch 0x0
        :pswitch_26d
        :pswitch_261
        :pswitch_261
        :pswitch_261
        :pswitch_261
        :pswitch_261
        :pswitch_261
        :pswitch_26d
        :pswitch_26d
    .end packed-switch
.end method
