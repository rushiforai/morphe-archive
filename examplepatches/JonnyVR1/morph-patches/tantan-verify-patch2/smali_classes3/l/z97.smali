.class public interface abstract Ll/z97;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r97;


# direct methods
.method public static synthetic Fp(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    const-string v0, "dialog"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic T6(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/TagCategories;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TagCategories;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic Tk(Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;)Lkotlin/Unit;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic e7()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic im(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic rp()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y9(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public A0(Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->X:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public A1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public A3(I)I
    .locals 0

    .line 1
    invoke-static {p1}, Ll/a5i0;->w0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public A5(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->A2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public B0(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-boolean p1, p0, Ll/gj40$h;->a:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/match/b;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B2(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->N1()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public B3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/sh00;->i(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public B4()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->k0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public C(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ln7;->a(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public C0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/fdw;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->c2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public C4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/c7d0;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public C5(Z)V
    .locals 0

    .line 1
    sget-object p0, Ll/qt4;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public D()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public D0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->g0(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public D1(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/a0g;->E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/u97;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/u97;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x5566

    .line 11
    .line 12
    invoke-static {v1, p0, v0}, Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment;->z4(ILandroid/content/Intent;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;)Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment;->A4(Landroidx/fragment/app/FragmentManager;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public D2()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->X0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public D3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->h0(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public D4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/pci;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public E()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public E0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/rcn;->q()Ll/rcn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rcn;->C()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E1(Landroid/content/Context;)V
    .locals 0

    .line 1
    new-instance p0, Ll/dtf0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/dtf0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dtf0;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E2(Ljava/lang/String;)Ll/bkj0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/baj;->T(Ljava/lang/String;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/w250;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public E4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 0

    .line 1
    new-instance p0, Ll/fcw;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/fcw;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Ll/fcw;->R(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fcw;->show()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public F1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->k0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F3(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->E0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public G0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->q3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public G1()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->D1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public G3(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/s75;->k(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public G4()V
    .locals 0

    .line 1
    invoke-static {}, Ll/fph0;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G5(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->x1()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public H()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->U0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public H1()V
    .locals 0

    .line 1
    invoke-static {}, Ll/fph0;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H2()V
    .locals 0

    .line 1
    invoke-static {}, Ll/rcn;->q()Ll/rcn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rcn;->B()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/wyb0;->j0(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public H4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public H5(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/gj40;->E(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->l0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public I1(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/d79;->r0(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public I2(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/nmp;->d(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public I3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/syu;->i(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vb0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public J0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    const-string p0, "dialog"

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, p0, v0, v0}, Ll/hxf;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public J1()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s75;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public J2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->d2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public J3(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p8}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->p1(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    invoke-direct {v0, p3, p2}, Lcom/p1/mobile/putong/core/data/MessageAndMedia;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->r2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of p2, p3, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p2, Ll/n900;

    .line 19
    .line 20
    invoke-direct {p2}, Ll/n900;-><init>()V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public J5(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 17

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget v4, Ll/dbc0;->v8:I

    .line 16
    .line 17
    new-instance v6, Ll/w97;

    .line 18
    .line 19
    move-object/from16 v1, p1

    .line 20
    .line 21
    move-object/from16 v0, p2

    .line 22
    .line 23
    invoke-direct {v6, v1, v0}, Ll/w97;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 24
    .line 25
    .line 26
    new-instance v9, Ll/x97;

    .line 27
    .line 28
    invoke-direct {v9}, Ll/x97;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v10, Ll/y97;

    .line 32
    .line 33
    invoke-direct {v10}, Ll/y97;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v15, 0x0

    .line 37
    const/16 v16, 0x0

    .line 38
    .line 39
    const-string v2, "\u8bf7\u5148\u5b8c\u6210\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 40
    .line 41
    const-string v3, "\u8ba4\u8bc1\u771f\u5b9e\u4e5f\u662f\u8868\u8fbe\u771f\u8bda\u7684\u4e00\u90e8\u5206\uff0c\u8bda\u610f\u6ee1\u6ee1\u7684\u60c5\u4e66\u66f4\u52a8\u4eba"

    .line 42
    .line 43
    const-string v5, "\u53bb\u8ba4\u8bc1"

    .line 44
    .line 45
    const/4 v7, 0x1

    .line 46
    const-string v8, "\u4ee5\u540e\u518d\u8bf4"

    .line 47
    .line 48
    const/4 v11, 0x0

    .line 49
    const/4 v12, 0x1

    .line 50
    const/4 v13, 0x0

    .line 51
    const/4 v14, 0x0

    .line 52
    invoke-static/range {v1 .. v16}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public K()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/c7d0;->g0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public K0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x6d0;->j0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K1(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->R(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public K2(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/c7d0;->h0(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public K3(Landroid/content/Intent;)V
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;->checkConv:Z

    .line 8
    .line 9
    const-string v0, "profile_create_data"

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public K5()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->v0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public L(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/wyb0;->z0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L1(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->k(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public L2(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p11}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->K1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L3()V
    .locals 0

    .line 1
    invoke-static {}, Ll/iz40;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L4(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0, p0}, Lcom/p1/mobile/putong/core/map/IntlMapAct;->h2(Landroid/content/Context;IZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public M()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public M0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/e1b;->I0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M3(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    const-string p0, "from_message"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public M4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public M5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/Media;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ")",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->O1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public N()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public N0()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->L6:I

    .line 2
    .line 3
    return p0
.end method

.method public N1(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->e2(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N2()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->hf:I

    .line 2
    .line 3
    return p0
.end method

.method public N3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/yab;->V()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public N4()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gj40;->r()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public N5(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/fcp;->i()Ll/fcp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/fcp;->A(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public O3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/a5i0;->u1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)Ll/fe5;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O4()V
    .locals 1

    .line 1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "voice_entry_media_item"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O5(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Privilege;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/dk90;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P()V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->W0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->g1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public P2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P5(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/e1b;->R0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u17;->F()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Q0()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->E()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Q1(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->P(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/match/a;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q4(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fcp;->n(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Q5(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->c0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/xg50;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public R1()V
    .locals 0

    .line 1
    invoke-static {}, Ll/iz40;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R2(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/w250;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public R4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public R5()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->fj:I

    .line 2
    .line 3
    return p0
.end method

.method public S()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->p:Z

    .line 7
    .line 8
    return-void
.end method

.method public S0()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->d8()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public S1()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->j0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public S2(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    new-instance p0, Ll/q0;

    .line 2
    .line 3
    new-instance v0, Ll/v97;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/v97;-><init>(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Ll/q0;-><init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/q0;->show()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public S3(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/tx0;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S4(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Ll/x6d0;->c:Z

    .line 7
    .line 8
    return-void
.end method

.method public S5(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/x6d0;->o0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-static {}, Ll/iz40;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T0()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->i0:I

    .line 2
    .line 3
    return p0
.end method

.method public T1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->F(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public T2(Lcom/p1/mobile/android/app/Act;)V
    .locals 12

    .line 1
    sget v6, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object v9, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 12
    .line 13
    const-string v10, ""

    .line 14
    .line 15
    const/4 v11, 0x0

    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x1

    .line 20
    const/4 v5, 0x0

    .line 21
    const/4 v7, 0x0

    .line 22
    const/4 v8, 0x0

    .line 23
    move-object v0, p1

    .line 24
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->k2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/16 p1, 0x312

    .line 29
    .line 30
    invoke-virtual {v0, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public T4()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->S0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public T5(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/wyb0;->S(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public U0()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->V0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public U1(Ll/x20;Landroid/app/Activity;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/wyb0;->Companion:Ll/wyb0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wyb0$a;->k(Ll/x20;Landroid/app/Activity;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public U2()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/t97;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/t97;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public U3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public U5(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public V(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, p1, p2, p3, v0}, Ll/z97;->Q3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public V0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->D2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public V1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/c9e0;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public V2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->n2(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public V4()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->w0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public V5(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->b0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/data/User;)J
    .locals 0

    .line 1
    invoke-static {p1}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public W0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;ZLl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;",
            "Z",
            "Ll/x20;",
            "Z",
            "Ljava/lang/String;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p8}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;ZLl/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->l1()Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public W3(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public W4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->W1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W5(ZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->i1(ZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public X0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Gender;IZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/rgk0;->d(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Gender;IZLcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->g0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->U(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/core/data/WechatNotifyConfig;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->m1()Lcom/p1/mobile/putong/core/data/WechatNotifyConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Y(Landroid/app/Activity;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->L(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Y2()V
    .locals 0

    .line 1
    invoke-static {}, Ll/y6d0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->u1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/a5i0;->o1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Z1()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/qt4;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hxd0;->obs()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Z2(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/qyp;->i()Ll/qyp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qyp;->n(Lcom/p1/mobile/android/app/Act;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;->Home:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->s0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatStartClickFrom;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->v2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a1()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->i0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public a2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/t450;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public a4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/a;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Ll/fdw;->j:Z

    .line 6
    .line 7
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vq8;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->J(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public b1(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/dk90;->e(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->h:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rm50;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->M()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c0(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->X(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public c1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->o1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c3(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wr2;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c4(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->K(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public c5(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->O(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ey6;->b(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->N()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping$Builder;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping$Builder;->setOtherUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/pq60;

    .line 36
    .line 37
    sget-object v2, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_CHAT_TYPING:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 38
    .line 39
    invoke-direct {v1, v2, p0, p1}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ll/pq60;->a()Lokio/ByteString;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->i0(Lokio/ByteString;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public d1(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->k0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public d5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/yr4;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->J1(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e1(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->Y(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->i0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/sh00;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public f0(D)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->J(D)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f1(Landroid/content/Context;Lcom/p1/mobile/putong/data/MessageLocation;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/MessageLocation;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f2(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/x6d0;->r0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f3()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->hm:I

    .line 2
    .line 3
    return p0
.end method

.method public f4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->Y1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public f5(Landroid/content/Context;)Landroid/content/Intent;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROLOGUE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 10
    .line 11
    filled-new-array {p0}, [Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v4, 0x1

    .line 20
    const/4 v5, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    move-object v0, p1

    .line 23
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/util/ArrayList;ZZZ)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rum0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public g0()I
    .locals 0

    .line 1
    sget p0, Ll/xfc0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public g1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g2()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/gj40;->j:Lrx/subjects/b;

    .line 6
    .line 7
    return-object p0
.end method

.method public g3(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->N(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMainWithNav(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/syu;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/iz40;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public h1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h2(Landroidx/recyclerview/widget/RecyclerView;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/c7d0;->f0(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public h3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/ndk;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i1(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p1}, Ll/upm;->S(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public i2(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ey6;->f(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i3(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->W(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/ResultReceiver;)Landroid/content/Intent;
    .locals 6

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/ReportFrom;->CHAT:Lcom/p1/mobile/putong/core/data/ReportFrom;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ReportFrom;->getFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v5

    .line 7
    const-string v2, ""

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    move-object v0, p1

    .line 11
    move-object v1, p2

    .line 12
    move-object v4, p3

    .line 13
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->d2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLandroid/os/ResultReceiver;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public j2()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Jq:I

    .line 2
    .line 3
    return p0
.end method

.method public j4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->o2(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j5(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/wyb0;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public k0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public k1()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->p:Z

    .line 6
    .line 7
    return p0
.end method

.method public k3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fdw;->f()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public k5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vb0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public l2()I
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->i0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public l4(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->a0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public m(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/baj;->M(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m0()Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->k1()Lcom/p1/mobile/putong/core/data/WarmingUpEmoResConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m1()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "cm"

    .line 2
    .line 3
    return-object p0
.end method

.method public m4(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->A1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m5()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->W7:I

    .line 2
    .line 3
    return p0
.end method

.method public n0(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "group_notification_anonymity"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "group_notification"

    .line 7
    .line 8
    return-object p0
.end method

.method public n1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    invoke-direct {v0, p3, p2}, Lcom/p1/mobile/putong/core/data/MessageAndMedia;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    invoke-static {p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->s2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Z)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of p2, p3, Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance p2, Ll/n900;

    .line 20
    .line 21
    invoke-direct {p2}, Ll/n900;-><init>()V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ll/z20;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/material/bottomsheet/BottomSheetDialog;"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p11}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->P1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ll/z20;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n3(Z)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/c7d0;->i0(Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/a5i0;->p1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->A1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public o1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/match/b;->v(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o2()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->o2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2, p3, p4}, Ll/x6d0;->u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o4(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fcp;->m(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public p1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p2()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->v1:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p3(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/wyb0;->Z(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public p4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->K3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public p5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x6d0;->k0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public q1()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public q2()Ll/vxd0;
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/gj40;->h:Ll/vxd0;

    .line 6
    .line 7
    return-object p0
.end method

.method public q3(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ll/y20;Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/c7d0;->k0(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ll/y20;Ll/qcj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q5(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/epc0;->a(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->d0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p9}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->J1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->i0(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r3(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->Z(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public r4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->a0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r5(I)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->z(I)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/asj0;->f0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->J()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->h2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/vb0;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public t0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/iz40;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t1()Z
    .locals 0

    .line 1
    sget-object p0, Ll/qt4;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public t3()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wr2;->o()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t4(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public u1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->c0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u2(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/fph0;->j0(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u3(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wr2;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public v1()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->r:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public v2()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->e1()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public v3(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public v5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/eu4;->g()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public w0(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public w1(Ll/ovb0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->i:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x6d0;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public w3(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, -0x1

    .line 9
    sparse-switch p0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string p0, "movie"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x2

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string p0, "book"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string p0, "teleplay"

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v0, 0x0

    .line 45
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    return-object p0

    .line 50
    :pswitch_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p1, Ll/dbc0;->xn:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :pswitch_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    sget p1, Ll/dbc0;->wn:I

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :pswitch_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget p1, Ll/dbc0;->yn:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :sswitch_data_0
    .sparse-switch
        -0x51131622 -> :sswitch_2
        0x2e3ae9 -> :sswitch_1
        0x6343f30 -> :sswitch_0
    .end sparse-switch

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public w4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public w5(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public x()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public x0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/qtk;->E0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public x4(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gj40;->x()Ll/gj40$i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/gj40$i;->a()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/s97;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/s97;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TagCategories;->name:Ljava/lang/String;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    const-string p0, ""

    .line 34
    .line 35
    return-object p0
.end method

.method public x5(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->p:Z

    .line 7
    .line 8
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->P1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public y0()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->p3()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public y1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->x(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gs50;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y5(Lcom/p1/mobile/putong/core/data/ChallengeMsgList;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChallengeMsg;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/yr4;->a(Lcom/p1/mobile/putong/core/data/ChallengeMsgList;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChallengeMsg;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vb0;->h(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public z0()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->o:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public z2()V
    .locals 0

    .line 1
    invoke-static {}, Ll/fcp;->i()Ll/fcp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fcp;->u()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z3(Ljava/lang/Throwable;)I
    .locals 0

    .line 1
    invoke-static {p1}, Ll/sh00;->g(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public z4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fph0;->V(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
