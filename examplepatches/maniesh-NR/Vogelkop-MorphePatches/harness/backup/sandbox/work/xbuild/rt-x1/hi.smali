.class public final Lhi;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lmi;


# direct methods
.method public synthetic constructor <init>(Lmi;B)V
    .registers 3

    iput-byte p2, p0, Lhi;->e:B

    iput-object p1, p0, Lhi;->f:Lmi;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lhi;->e:B

    const/4 v1, 0x4

    const/4 v2, 0x2

    const/4 v3, 0x0

    iget-object p0, p0, Lhi;->f:Lmi;

    packed-switch v0, :pswitch_data_20e

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lmi;->a:Lhjf;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v9, v2, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v10, v2, Ld6j;->d:Lx5f;

    invoke-virtual {p0}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v11

    const-string p0, "wallpaper_days_counter"

    new-array v2, v3, [Lbg1;

    invoke-static {v0, v1, p0, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v5

    new-instance v4, Lonn;

    new-instance v6, Lni6;

    invoke-direct {v6, v5}, Lni6;-><init>(Lb59;)V

    const-string p0, "system_wallpaper"

    new-array v2, v3, [Lbg1;

    invoke-static {v0, v1, p0, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v7

    new-instance v8, Lmgh;

    invoke-direct {v8, v0}, Lmgh;-><init>(Lcom/opera/android/OperaApplication;)V

    invoke-direct/range {v4 .. v11}, Lonn;-><init>(Lb59;Lni6;Lb59;Lmgh;Lx5f;Lx5f;Lcom/opera/android/settings/SettingsManager;)V

    return-object v4

    :pswitch_46
    new-instance v0, Lnkm;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-direct {v0, p0}, Lnkm;-><init>(Lhjf;)V

    return-object v0

    :pswitch_4e
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Lm8l;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    invoke-direct {v0, v1, p0}, Lm8l;-><init>(Lx5f;Lx5f;)V

    return-object v0

    :pswitch_6a
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lcom/opera/android/OperaApplication;

    new-instance p0, Lxg7;

    new-instance v4, Lli;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-class v6, Lcom/opera/android/OperaApplication;

    const-string v7, "accountManager"

    const-string v8, "getAccountManager()Lcom/opera/android/account/AccountManager;"

    invoke-direct/range {v4 .. v10}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v0, Lki;

    invoke-direct {v0, v4, v3}, Lki;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, v0}, Lxg7;-><init>(Lki;)V

    return-object p0

    :pswitch_8d
    new-instance v0, Lfmk;

    iget-object v1, p0, Lmi;->k:Lhi;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laf3;

    sget-object v3, Lzsk;->f:Ljava/util/Map;

    new-instance v4, Ljvg;

    iget-object v5, p0, Lmi;->a:Lhjf;

    iget-object p0, p0, Lmi;->b:Lumi;

    invoke-direct {v4, v5, p0}, Ljvg;-><init>(Lhjf;Lumi;)V

    new-instance p0, Lauj;

    invoke-direct {p0, v2}, Lauj;-><init>(B)V

    invoke-direct {v0, v1, v3, v4, p0}, Lfmk;-><init>(Laf3;Ljava/util/Map;Ljvg;Lauj;)V

    return-object v0

    :pswitch_ab
    new-instance v0, Lizj;

    iget-object v1, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    new-instance v3, Ly2;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Ly2;-><init>(B)V

    const-string v4, "speed_dial.large_icons"

    invoke-static {v2, v4, v3}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v2

    iget-object p0, p0, Lmi;->B:Lhi;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Likc;

    invoke-direct {v0, v1, v1, v2, p0}, Lizj;-><init>(Landroid/content/Context;Lndc;Likc;Likc;)V

    return-object v0

    :pswitch_cb
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Lktg;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lktg;-><init>(Lydn;Lgmk;)V

    return-object v0

    :pswitch_e3
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lmi;->a:Lhjf;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lx5g;

    iget-object p0, p0, Lmi;->q:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/autofill/PasswordManager;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->R0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvnj;

    invoke-direct {v1, p0, v0}, Lx5g;-><init>(Lcom/opera/android/autofill/PasswordManager;Lvnj;)V

    return-object v1

    :pswitch_105
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lswf;

    new-instance v2, Lni6;

    invoke-direct {v2, p0}, Lni6;-><init>(Lhjf;)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v3

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-direct {v1, v2, p0, v3, v0}, Lswf;-><init>(Lni6;Lx5f;Lbf9;Lcom/opera/android/settings/SettingsManager;)V

    return-object v1

    :pswitch_128
    new-instance v0, Luab;

    iget-object v1, p0, Lmi;->a:Lhjf;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Lmi;->b:Lumi;

    invoke-direct {v0, v1, p0}, Luab;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_136
    new-instance v0, Lxc9;

    iget-object v1, p0, Lmi;->a:Lhjf;

    iget-object p0, p0, Lmi;->b:Lumi;

    invoke-direct {v0, v1, p0}, Lxc9;-><init>(Landroid/content/Context;Ltcl;)V

    return-object v0

    :pswitch_140
    new-instance v0, Lgx8;

    iget-object v1, p0, Lmi;->a:Lhjf;

    iget-object p0, p0, Lmi;->B:Lhi;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Likc;

    invoke-direct {v0, v1, v1, p0}, Lgx8;-><init>(Lhjf;Lhjf;Likc;)V

    return-object v0

    :pswitch_150
    new-instance v0, Lyl6;

    iget-object v1, p0, Lmi;->a:Lhjf;

    iget-object p0, p0, Lmi;->b:Lumi;

    invoke-direct {v0, v1, p0}, Lyl6;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_15a
    iget-object p0, p0, Lmi;->a:Lhjf;

    new-instance v0, Lole;

    invoke-direct {v0, p0}, Lole;-><init>(Lxd5;)V

    iget-object p0, v0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    return-object p0

    :pswitch_166
    iget-object v0, p0, Lmi;->B:Lhi;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Likc;

    iget-object p0, p0, Lmi;->a:Lhjf;

    new-instance v2, Liv0;

    invoke-direct {v2, p0, v1}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-static {v0, v2}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p0

    invoke-static {p0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object p0

    return-object p0

    :pswitch_17e
    new-instance v0, Lwk4;

    iget-object p0, p0, Lmi;->g:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v0, p0}, Lgv2;-><init>(Lcom/opera/android/autofill/AutofillManager;)V

    return-object v0

    :pswitch_18c
    new-instance v0, Laf3;

    iget-object v1, p0, Lmi;->a:Lhjf;

    iget-object p0, p0, Lmi;->b:Lumi;

    invoke-direct {v0, v1, p0}, Laf3;-><init>(Lhjf;Lumi;)V

    return-object v0

    :pswitch_196
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Lnv2;

    new-instance v4, Lji;

    invoke-direct {v4, p0, v3}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v3, Lji;

    const/4 v5, 0x1

    invoke-direct {v3, p0, v5}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v5, p0, Lcom/opera/android/OperaApplication;->z:Lg92;

    new-instance v6, Ly2;

    invoke-direct {v6, v1}, Ly2;-><init>(B)V

    new-instance v1, Lg92;

    invoke-direct {v1, v5, v6}, Lg92;-><init>(Lcom/opera/android/Lazy;Lkotlin/jvm/functions/Function1;)V

    new-instance v5, Lji;

    invoke-direct {v5, p0, v2}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {v0, v4, v3, v1, v5}, Lnv2;-><init>(Lji;Lji;Lg92;Lji;)V

    return-object v0

    :pswitch_1c2
    new-instance v0, Lyu2;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-direct {v0, p0}, Lyu2;-><init>(Lhjf;)V

    return-object v0

    :pswitch_1ca
    new-instance v0, Lwh2;

    iget-object v1, p0, Lmi;->a:Lhjf;

    iget-object p0, p0, Lmi;->g:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v0, v1, p0}, Lwh2;-><init>(Lhjf;Lcom/opera/android/autofill/AutofillManager;)V

    return-object v0

    :pswitch_1da
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Lsk6;

    iget-object v1, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llpe;

    iget-object v1, v1, Llpe;->c:Lcq5;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lsk6;-><init>(Lcq5;Lcom/opera/android/settings/SettingsManager;)V

    return-object v0

    :pswitch_1f8
    new-instance v0, Lv00;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v0, v1, p0, v2}, Lv00;-><init>(Ltcc;Lhjf;Lumi;)V

    return-object v0

    :pswitch_206
    new-instance v0, Lgw;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-direct {v0, p0}, Lgw;-><init>(Lhjf;)V

    return-object v0

    :pswitch_data_20e
    .packed-switch 0x0
        :pswitch_206
        :pswitch_1f8
        :pswitch_1da
        :pswitch_1ca
        :pswitch_1c2
        :pswitch_196
        :pswitch_18c
        :pswitch_17e
        :pswitch_166
        :pswitch_15a
        :pswitch_150
        :pswitch_140
        :pswitch_136
        :pswitch_128
        :pswitch_105
        :pswitch_e3
        :pswitch_cb
        :pswitch_ab
        :pswitch_8d
        :pswitch_6a
        :pswitch_4e
        :pswitch_46
    .end packed-switch
.end method
