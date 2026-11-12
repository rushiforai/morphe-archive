.class public final synthetic Ldu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Ldu3;->a:B

    iput-object p1, p0, Ldu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Ldu3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Ldu3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_1da

    invoke-static {v3}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->n()Lcom/opera/android/Lazy;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Laf3;

    return-object p0

    :pswitch_1d
    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_26
    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2f
    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_38
    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->Z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpgf;

    return-object p0

    :pswitch_41
    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz p0, :cond_46

    move-object v2, p0

    :cond_46
    invoke-virtual {v2}, Lgbf;->p()Landroid/view/View;

    move-result-object p0

    return-object p0

    :pswitch_4b
    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object p0

    return-object p0

    :pswitch_50
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v3, p0, Ldu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v2, Lkwf;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->t()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lswf;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v5

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    new-instance v7, Lnwf;

    new-instance v0, Lhv3;

    invoke-direct {v0, v3}, Lhv3;-><init>(Lcom/opera/android/BrowserActivity;)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->c:Lx5f;

    invoke-direct {v7, v0, v8, v1}, Lnwf;-><init>(Lhv3;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v8, v0, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v9, v0, Ld6j;->d:Lx5f;

    new-instance v10, Ldu3;

    const/16 v0, 0x11

    invoke-direct {v10, v3, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v11, Lk5o;

    invoke-direct {v11, v3}, Lk5o;-><init>(Lcom/opera/android/BrowserActivity;)V

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->r:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v12, p0

    check-cast v12, Lin3;

    invoke-direct/range {v2 .. v12}, Lkwf;-><init>(Landroid/content/Context;Lswf;Lbf9;Lcom/opera/android/settings/SettingsManager;Lnwf;Lx5f;Lx5f;Ldu3;Lk5o;Lin3;)V

    return-object v2

    :pswitch_ac
    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->I:Lr22;

    if-eqz p0, :cond_b1

    move-object v2, p0

    :cond_b1
    return-object v2

    :pswitch_b2
    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->X:Lbvl;

    if-eqz p0, :cond_b7

    move-object v2, p0

    :cond_b7
    return-object v2

    :pswitch_b8
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->Q0()Lqln;

    move-result-object p0

    const v0, 0x7f0602b7

    invoke-virtual {v3, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    const v2, 0x7f0602b6

    invoke-virtual {v3, v2}, Landroid/content/Context;->getColor(I)I

    move-result v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lo2c;

    invoke-direct {v3, v1, v1, v1, v1}, Lo2c;-><init>(ZIIZ)V

    new-instance v1, La56;

    invoke-direct {v1, v0, v2}, La56;-><init>(II)V

    iget-object v0, p0, Lqln;->a:Landroid/content/Context;

    invoke-virtual {v1, v0, v3}, La56;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object v0

    iget-object p0, p0, Lqln;->g:Lagm;

    new-instance v1, Lvk2;

    const/16 v2, 0x19

    invoke-direct {v1, v2}, Lvk2;-><init>(B)V

    new-instance v2, Lqjn;

    invoke-direct {v2, p0, v0, v1, v3}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    return-object v2

    :pswitch_ee
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->O0()Lntl;

    move-result-object p0

    return-object p0

    :pswitch_f5
    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez p0, :cond_fa

    move-object p0, v2

    :cond_fa
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez v0, :cond_104

    move-object v1, v2

    goto :goto_105

    :cond_104
    move-object v1, v0

    :goto_105
    iget v1, v1, Lcom/opera/android/RootView;->o:I

    sub-int/2addr p0, v1

    if-nez v0, :cond_10b

    move-object v0, v2

    :cond_10b
    iget v0, v0, Lcom/opera/android/RootView;->p:I

    sub-int/2addr p0, v0

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->X:Lbvl;

    if-nez v0, :cond_113

    move-object v0, v2

    :cond_113
    invoke-interface {v0}, Lbvl;->getState()Lpde;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lavl;

    iget v0, v0, Lavl;->c:I

    sub-int/2addr p0, v0

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->I:Lr22;

    if-eqz v0, :cond_125

    move-object v2, v0

    :cond_125
    iget-object v0, v2, Lr22;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnp3;

    iget v0, v0, Lnp3;->b:I

    sub-int/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_137
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_13e

    move-object v2, p0

    :cond_13e
    iget-object p0, v2, Lk6l;->i:Lld7;

    return-object p0

    :pswitch_141
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    return-object p0

    :pswitch_152
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Ldx3;->W()Lk6l;

    move-result-object p0

    return-object p0

    :pswitch_159
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance p0, Lwv3;

    invoke-direct {p0, v3}, Lwv3;-><init>(Lcom/opera/android/BrowserActivity;)V

    return-object p0

    :pswitch_161
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    return-object p0

    :pswitch_16c
    const-class p0, Lkxk;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, p0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    return-object p0

    :pswitch_177
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, v3, Ldx3;->o:Lqim;

    iget-object p0, p0, Lqim;->f:Laal;

    return-object p0

    :pswitch_17e
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    return-object p0

    :pswitch_185
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    return-object p0

    :pswitch_18c
    const-class p0, Ld8j;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, p0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    return-object p0

    :pswitch_197
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, v3, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    :pswitch_19f
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance p0, Lj8l;

    invoke-virtual {v3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    iget-object v1, v3, Lcom/opera/android/BrowserActivity;->w0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc8l;

    iget-object v3, v3, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v3, :cond_1b4

    move-object v2, v3

    :cond_1b4
    invoke-direct {p0, v0, v1, v2}, Lj8l;-><init>(Ltcc;Lc8l;Lk6l;)V

    return-object p0

    :pswitch_1b8
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, v3, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    :pswitch_1c0
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, v3, Lcom/opera/android/BrowserActivity;->Z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpgf;

    return-object p0

    :pswitch_1cb
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, v3, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    :pswitch_1d3
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    return-object p0

    :pswitch_data_1da
    .packed-switch 0x0
        :pswitch_1d3
        :pswitch_1cb
        :pswitch_1c0
        :pswitch_1b8
        :pswitch_19f
        :pswitch_197
        :pswitch_18c
        :pswitch_185
        :pswitch_17e
        :pswitch_177
        :pswitch_16c
        :pswitch_161
        :pswitch_159
        :pswitch_152
        :pswitch_141
        :pswitch_137
        :pswitch_f5
        :pswitch_ee
        :pswitch_b8
        :pswitch_b2
        :pswitch_ac
        :pswitch_50
        :pswitch_4b
        :pswitch_41
        :pswitch_38
        :pswitch_2f
        :pswitch_26
        :pswitch_1d
        :pswitch_e
    .end packed-switch
.end method
