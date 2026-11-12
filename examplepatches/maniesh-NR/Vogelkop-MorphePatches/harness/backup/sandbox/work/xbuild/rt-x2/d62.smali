.class public final Ld62;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 29
    iput-byte p3, p0, Ld62;->a:B

    iput-object p1, p0, Ld62;->b:Ljava/lang/Object;

    iput-object p2, p0, Ld62;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lk6l;)V
    .registers 3

    const/16 v0, 0xa

    iput-byte v0, p0, Ld62;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld62;->b:Ljava/lang/Object;

    new-instance p1, Lht3;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lht3;-><init>(B)V

    iput-object p1, p0, Ld62;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lp1f;Lt1f;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Ld62;->a:B

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p2, p0, Ld62;->b:Ljava/lang/Object;

    iput-object p1, p0, Ld62;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqm9;Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Ld62;->a:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p2, p0, Ld62;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ld62;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrmg;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Ld62;->a:B

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p2, p0, Ld62;->c:Ljava/lang/Object;

    .line 28
    new-instance p2, Lit5;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Lit5;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ld62;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;Lyu2;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Ld62;->a:B

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Ld62;->b:Ljava/lang/Object;

    .line 24
    iput-object p2, p0, Ld62;->c:Ljava/lang/Object;

    .line 25
    invoke-virtual {p0}, Ld62;->R()V

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 6

    iget-object v0, p0, Ld62;->b:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object p0, p0, Ld62;->c:Ljava/lang/Object;

    check-cast p0, Lyu2;

    invoke-virtual {p0}, Lyu2;->b()Z

    move-result v1

    if-nez v1, :cond_11

    sget-object p0, Lvd0;->d:Lvd0;

    goto :goto_1c

    :cond_11
    invoke-virtual {p0}, Lyu2;->a()Z

    move-result p0

    if-eqz p0, :cond_1a

    sget-object p0, Lvd0;->b:Lvd0;

    goto :goto_1c

    :cond_1a
    sget-object p0, Lvd0;->c:Lvd0;

    :goto_1c
    iget-boolean v1, v0, Lx5f;->h:Z

    if-nez v1, :cond_21

    return-void

    :cond_21
    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v1

    iget-object v1, v1, Lqp0;->b:Lb66;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x51

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-byte p1, p0, Ld62;->a:B

    iget-object v0, p0, Ld62;->c:Ljava/lang/Object;

    iget-object p0, p0, Ld62;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_26

    return-void

    :sswitch_a
    check-cast p0, Lk6l;

    check-cast v0, Lht3;

    invoke-virtual {p0, v0}, Lk6l;->b(La2l;)V

    return-void

    :sswitch_12
    check-cast p0, Lpde;

    check-cast v0, Ltcc;

    check-cast v0, Lqdc;

    iget-object p1, v0, Lqdc;->i:Lqcc;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :sswitch_1e
    check-cast v0, Landroid/content/Context;

    check-cast p0, Lit5;

    invoke-virtual {v0, p0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    return-void

    :sswitch_data_26
    .sparse-switch
        0x3 -> :sswitch_1e
        0x7 -> :sswitch_12
        0xa -> :sswitch_a
    .end sparse-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 6

    iget-byte v0, p0, Ld62;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Ld62;->c:Ljava/lang/Object;

    iget-object v3, p0, Ld62;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_b2

    :pswitch_a
    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, Lk6l;

    check-cast v2, Lht3;

    invoke-virtual {v3, v2}, Lk6l;->v(La2l;)V

    return-void

    :pswitch_1d
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lp1f;

    check-cast v3, Lt1f;

    iget-object p0, v2, Lp1f;->a:Li7f;

    invoke-virtual {p0, v3}, Li7f;->c(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_35

    iget-object p0, v2, Lp1f;->c:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_35
    return-void

    :pswitch_36
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, Lpde;

    check-cast v2, Ltcc;

    check-cast v2, Lqdc;

    iget-object p0, v2, Lqdc;->i:Lqcc;

    invoke-virtual {v3, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_49
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lqm9;

    iget-object p0, v2, Lqm9;->g:Landroid/view/View;

    check-cast v3, Landroid/view/View;

    if-ne p0, v3, :cond_5a

    iput-object v1, v2, Lqm9;->g:Landroid/view/View;

    :cond_5a
    return-void

    :pswitch_5b
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Landroid/content/Context;

    check-cast v3, Lit5;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    return-void

    :pswitch_6a
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, Ls62;

    iget-object p0, v3, Ls62;->v:Lu02;

    iget-object p1, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p1, Lzz1;

    check-cast v2, Lzz1;

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_83

    iput-object v1, p0, Lu02;->o:Ljava/lang/Object;

    :cond_83
    return-void

    :pswitch_84
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v3, Le62;

    check-cast v2, Lhq3;

    iget-object p0, v3, Le62;->e:Lhq3;

    invoke-static {p0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b0

    iput-object v1, v3, Le62;->e:Lhq3;

    iget-object p0, v3, Le62;->b:Lurn;

    iget-object p1, p0, Lurn;->c:Ltpl;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lf9e;->a:Lf9e;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lf9e;->b()J

    move-result-wide v0

    new-instance p1, Lspl;

    invoke-direct {p1, v0, v1}, Lspl;-><init>(J)V

    iput-object p1, p0, Lurn;->d:Lspl;

    :cond_b0
    return-void

    nop

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_84
        :pswitch_6a
        :pswitch_a
        :pswitch_5b
        :pswitch_a
        :pswitch_49
        :pswitch_a
        :pswitch_36
        :pswitch_1d
        :pswitch_a
        :pswitch_e
    .end packed-switch
.end method

.method public final onPause(Lndc;)V
    .registers 3

    iget-byte p1, p0, Ld62;->a:B

    iget-object v0, p0, Ld62;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_22

    :pswitch_7
    return-void

    :pswitch_8
    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lx3i;

    const/4 p1, 0x0

    iput-object p1, p0, Lx3i;->e:Lnej;

    return-void

    :pswitch_14
    iget-object p0, p0, Ld62;->b:Ljava/lang/Object;

    check-cast p0, Lpde;

    check-cast v0, Ltcc;

    check-cast v0, Lqdc;

    iget-object p1, v0, Lqdc;->i:Lqcc;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_22
    .packed-switch 0x7
        :pswitch_14
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final onResume(Lndc;)V
    .registers 4

    iget-byte p1, p0, Ld62;->a:B

    iget-object v0, p0, Ld62;->b:Ljava/lang/Object;

    iget-object v1, p0, Ld62;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_62

    :pswitch_9
    return-void

    :pswitch_a
    check-cast v1, Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lx3i;

    check-cast v0, Ldu3;

    iget-object p1, v0, Ldu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object p1

    iput-object p1, p0, Lx3i;->e:Lnej;

    return-void

    :pswitch_1d
    check-cast v0, Lpde;

    check-cast v1, Ltcc;

    check-cast v1, Lqdc;

    iget-object p0, v1, Lqdc;->i:Lqcc;

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_29
    check-cast v1, Lwv1;

    iget-object p0, v1, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le59;

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->areNotificationsEnabled()Z

    move-result p1

    sget-object v0, Ld59;->d:Ld59;

    invoke-virtual {p0, v0, p1}, Le59;->c(Ld59;Z)V

    return-void

    :pswitch_3f
    check-cast v0, Lyl6;

    invoke-virtual {v0}, Lyl6;->f()Z

    move-result p0

    if-eqz p0, :cond_54

    check-cast v1, Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly3i;

    sget-object p1, Lbm6;->a:Lbm6;

    invoke-interface {p0, p1}, Ly3i;->n(Lz1e;)V

    :cond_54
    return-void

    :pswitch_55
    invoke-virtual {p0}, Ld62;->R()V

    return-void

    :pswitch_59
    check-cast v0, Ls62;

    iget-object p0, v0, Ls62;->v:Lu02;

    check-cast v1, Lzz1;

    iput-object v1, p0, Lu02;->o:Ljava/lang/Object;

    return-void

    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_59
        :pswitch_55
        :pswitch_9
        :pswitch_3f
        :pswitch_9
        :pswitch_29
        :pswitch_1d
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public final onStart(Lndc;)V
    .registers 2

    iget-byte p1, p0, Ld62;->a:B

    packed-switch p1, :pswitch_data_16

    return-void

    :pswitch_6
    iget-object p1, p0, Ld62;->b:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p0, p0, Ld62;->c:Ljava/lang/Object;

    check-cast p0, Ltcc;

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x7
        :pswitch_6
    .end packed-switch
.end method

.method public final onStop(Lndc;)V
    .registers 2

    iget-byte p1, p0, Ld62;->a:B

    packed-switch p1, :pswitch_data_16

    return-void

    :pswitch_6
    iget-object p1, p0, Ld62;->b:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p0, p0, Ld62;->c:Ljava/lang/Object;

    check-cast p0, Ltcc;

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x7
        :pswitch_6
    .end packed-switch
.end method
