.class public final synthetic Lcu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;

.field public final synthetic c:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/OperaApplication;B)V
    .registers 4

    iput-byte p3, p0, Lcu3;->a:B

    iput-object p1, p0, Lcu3;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lcu3;->c:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 12

    iget-byte v0, p0, Lcu3;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lcu3;->c:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_ee

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lcu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/h;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->u()Lcom/opera/android/Lazy;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/autofill/PasswordManager;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v3

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    new-instance v4, Lvuh;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5}, Lvuh;-><init>(Lx5f;B)V

    iget-object v5, v3, Lglh;->d:Lqie;

    iget-object v6, v3, Lglh;->c:Lumi;

    iget-object v3, v3, Lglh;->a:Ljlh;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Ljjg;

    const/4 v8, 0x4

    invoke-direct {v7, v3, v8}, Ljjg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v6, v7}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v3

    new-instance v7, Lr9g;

    const/16 v8, 0x11

    invoke-direct {v7, v4, v8}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v7}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnml;->b(Lnml;)V

    new-instance v4, Loml;

    invoke-direct {v4, v3}, Loml;-><init>(Lnml;)V

    const/4 v3, 0x0

    invoke-virtual {v5, v4, v3}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    new-instance v3, Lvuh;

    invoke-direct {v3, v2, v1}, Lvuh;-><init>(Lx5f;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    new-instance p0, Lq2g;

    const/16 v1, 0x19

    invoke-direct {p0, v2, v0, v1}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v0, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    invoke-virtual {v0, p0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void

    :pswitch_7a
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v5, p0, Lcu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p0

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v3, Lqcc;->e:Lqcc;

    invoke-virtual {p0, v3}, Lqcc;->d(Lqcc;)Z

    move-result p0

    if-eqz p0, :cond_ec

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object v4

    iget-object v3, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v3}, Lhx3;->x()Lcom/opera/android/Lazy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lizj;

    iget-object v3, v3, Lizj;->d:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Ltta;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->r()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgx8;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    new-instance v10, Lvr3;

    new-instance v3, Lvuh;

    const/4 v7, 0x2

    invoke-direct {v3, v2, v7}, Lvuh;-><init>(Lx5f;B)V

    invoke-direct {v10, v3}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v10}, Lvr3;->b()Ltt2;

    move-result-object v2

    new-instance v3, La0k;

    invoke-direct {v3, p0, v2}, La0k;-><init>(Lnr8;Lcom/opera/api/Callback;)V

    invoke-virtual {p0, v3}, Lnr8;->f(Ljava/lang/Runnable;)V

    iget-object v7, v0, Lgx8;->c:Lpde;

    invoke-virtual {v10}, Lvr3;->b()Ltt2;

    move-result-object v8

    new-instance p0, Lr62;

    iget-object v0, v4, Lmdh;->h:Lh42;

    new-instance v3, Lay1;

    const/4 v9, 0x3

    invoke-direct/range {v3 .. v9}, Lay1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v0, v3, v1}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    invoke-virtual {v10}, Lvr3;->d()V

    :cond_ec
    return-void

    nop

    :pswitch_data_ee
    .packed-switch 0x0
        :pswitch_7a
    .end packed-switch
.end method
