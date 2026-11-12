.class public final synthetic Lrv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lxv1;B)V
    .registers 3

    iput-byte p2, p0, Lrv1;->a:B

    iput-object p1, p0, Lrv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lrv1;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lrv1;->b:Lxv1;

    packed-switch v0, :pswitch_data_234

    new-instance v0, Lcul;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lcul;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_13
    new-instance v0, Lk3i;

    new-instance v3, Liv1;

    invoke-direct {v3, p0, v2}, Liv1;-><init>(Lxv1;B)V

    new-instance v2, Liv1;

    invoke-direct {v2, p0, v1}, Liv1;-><init>(Lxv1;B)V

    invoke-direct {v0, v3, v2}, Lk3i;-><init>(Liv1;Liv1;)V

    return-object v0

    :pswitch_23
    new-instance v0, Lsyd;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lsyd;-><init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;)V

    return-object v0

    :pswitch_31
    new-instance v0, Lolh;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v1

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v0, v1, p0, v2}, Lolh;-><init>(Lglh;Lcom/opera/android/settings/SettingsManager;Lumi;)V

    return-object v0

    :pswitch_43
    new-instance v0, Lglh;

    iget-object v1, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    iget-object p0, p0, Lxv1;->D0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsyd;

    invoke-direct {v0, v1, v2, p0}, Lglh;-><init>(Landroid/content/Context;Lumi;Lsyd;)V

    return-object v0

    :pswitch_55
    new-instance v0, Lqdh;

    sget-object v2, Lxne;->b:Lii;

    new-instance v3, Lghf;

    iget-object v4, p0, Lxv1;->f:Lg92;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lesk;

    new-instance v5, Luu1;

    invoke-direct {v5, v1}, Luu1;-><init>(B)V

    new-instance v1, Lhv1;

    const/16 v6, 0x18

    invoke-direct {v1, p0, v6}, Lhv1;-><init>(Lxv1;B)V

    const/16 p0, 0x8

    invoke-direct {v3, v4, v5, v1, p0}, Lghf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v2, v3}, Lqdh;-><init>(Lii;Lghf;)V

    return-object v0

    :pswitch_78
    new-instance v0, Lodh;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lodh;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_82
    move v0, v2

    new-instance v2, Lmdh;

    iget-object v1, p0, Lxv1;->N0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lvqi;

    iget-object v1, p0, Lxv1;->P0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/settings/SettingsManager;

    new-instance v5, Lpdh;

    iget-object v1, p0, Lxv1;->K0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpqi;

    iget-object v6, p0, Lxv1;->z0:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lndh;

    invoke-direct {v5, v1, v6}, Lpdh;-><init>(Lpqi;Lndh;)V

    iget-object v1, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v6, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v6, v6, Lxv1;->g1:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcul;

    iget-object v7, p0, Lxv1;->A0:Lj4c;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lqdh;

    iget-object v7, v7, Lqdh;->b:Lghf;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->d:Lx5f;

    iget-object v9, p0, Lxv1;->i0:Lj4c;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Llpe;

    iget-object v9, v9, Llpe;->c:Lcq5;

    new-instance v10, Lnv1;

    invoke-direct {v10, p0, v0}, Lnv1;-><init>(Lxv1;B)V

    invoke-static {v1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v11

    invoke-direct/range {v2 .. v11}, Lmdh;-><init>(Lvqi;Lcom/opera/android/settings/SettingsManager;Lpdh;Lcul;Lghf;Lx5f;Lcq5;Lnv1;Lv1;)V

    return-object v2

    :pswitch_df
    new-instance v0, Lpch;

    iget-object p0, p0, Lxv1;->o0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ludf;

    invoke-direct {v0, p0}, Lpch;-><init>(Ludf;)V

    return-object v0

    :pswitch_ed
    new-instance v1, Lcom/opera/android/PushedContentHandler;

    iget-object v2, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v3, Lvml;->d:Lumi;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    iget-object p0, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->n1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lvwn;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    iget-object p0, v2, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Llpe;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object v7, p0, Ld6j;->c:Lx5f;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object v8, p0, Ld6j;->d:Lx5f;

    invoke-direct/range {v1 .. v8}, Lcom/opera/android/PushedContentHandler;-><init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;Lvwn;Llpe;Lx5f;Lx5f;)V

    return-object v1

    :pswitch_11e
    new-instance v0, Ln7l;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Ln7l;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_128
    new-instance v0, Lgmk;

    iget-object p0, p0, Lxv1;->Y0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lslk;

    invoke-direct {v0, p0}, Lgmk;-><init>(Lslk;)V

    return-object v0

    :pswitch_136
    new-instance v0, Lvk6;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lvk6;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_140
    new-instance v2, Ljtg;

    iget-object v3, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v4, Lvml;->d:Lumi;

    invoke-static {v3}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object v5

    invoke-static {v3}, Lufn;->t(Landroid/content/Context;)Lufn;

    move-result-object v6

    iget-object v7, p0, Lxv1;->s1:Lj4c;

    invoke-direct/range {v2 .. v7}, Ljtg;-><init>(Landroid/content/Context;Lumi;Ltvg;Lufn;Lj4c;)V

    return-object v2

    :pswitch_154
    new-instance v0, Lohg;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v0, p0}, Lohg;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_15c
    new-instance v0, Lvbg;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->d:Lx5f;

    invoke-direct {v0, p0, v1, v2, v3}, Lvbg;-><init>(Landroid/content/Context;Lumi;Lx5f;Lx5f;)V

    return-object v0

    :pswitch_172
    new-instance v0, Ln6g;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v0, p0}, Ln6g;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_17a
    new-instance v0, Lzgf;

    sget-object v1, Lvml;->d:Lumi;

    iget-object p0, p0, Lxv1;->s:Lj4c;

    invoke-direct {v0, v1, p0}, Lzgf;-><init>(Lumi;Lj4c;)V

    return-object v0

    :pswitch_184
    new-instance v0, Ludf;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Ludf;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_18e
    new-instance v2, Lsdf;

    iget-object v0, p0, Lxv1;->i:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lnx5;

    iget-object v0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    iget-object v1, p0, Lxv1;->o0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ludf;

    iget-object p0, p0, Lxv1;->i0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object v6, p0, Llpe;->k:Lcq5;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v7

    invoke-direct/range {v2 .. v7}, Lsdf;-><init>(Lnx5;Lcom/opera/android/settings/SettingsManager;Ludf;Lcq5;Lr65;)V

    return-object v2

    :pswitch_1ba
    new-instance v0, Lldf;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->d:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->g:Lwsf;

    invoke-direct {v0, p0, v1, v2, v3}, Lldf;-><init>(Landroid/content/Context;Lumi;Lx5f;Lwsf;)V

    return-object v0

    :pswitch_1d0
    new-instance v0, Lx0f;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lx0f;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_1da
    new-instance v0, Lfue;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v1

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lfue;-><init>(Landroid/content/Context;Lfqe;Lcom/opera/android/settings/SettingsManager;)V

    return-object v0

    :pswitch_1ea
    new-instance v3, Lyk6;

    iget-object v4, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v5, Lvml;->d:Lumi;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    sget-object p0, Lmv0;->k:Lkv0;

    sget-object p0, Lmv0;->l:Lio7;

    sget-object v0, Lmv0;->n:Lt40;

    invoke-static {v4, p0, v0}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lmv0;

    invoke-static {v4}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v8

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v9

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v10

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object v11, p0, Ld6j;->c:Lx5f;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object v12, p0, Ld6j;->d:Lx5f;

    invoke-direct/range {v3 .. v12}, Lyk6;-><init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;Lmv0;Ldj9;Lxb;Lru9;Lx5f;Lx5f;)V

    return-object v3

    :pswitch_21d
    new-instance v0, Ldse;

    iget-object v1, p0, Lxv1;->P0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    sget-object v2, Lhte;->k:Lite;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lna2;->w(Landroid/content/Context;)Lhte;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ldse;-><init>(Lcom/opera/android/settings/SettingsManager;Lhte;)V

    return-object v0

    nop

    :pswitch_data_234
    .packed-switch 0x0
        :pswitch_21d
        :pswitch_1ea
        :pswitch_1da
        :pswitch_1d0
        :pswitch_1ba
        :pswitch_18e
        :pswitch_184
        :pswitch_17a
        :pswitch_172
        :pswitch_15c
        :pswitch_154
        :pswitch_140
        :pswitch_136
        :pswitch_128
        :pswitch_11e
        :pswitch_ed
        :pswitch_df
        :pswitch_82
        :pswitch_78
        :pswitch_55
        :pswitch_43
        :pswitch_31
        :pswitch_23
        :pswitch_13
    .end packed-switch
.end method
