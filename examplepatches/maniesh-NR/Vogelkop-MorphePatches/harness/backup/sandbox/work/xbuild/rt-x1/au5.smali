.class public final Lau5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw1n;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lau5;->a:B

    iput-object p1, p0, Lau5;->b:Ljava/lang/Object;

    iput-object p2, p0, Lau5;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;Ltq8;)V
    .registers 7

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    :goto_7
    if-ge v1, v0, :cond_3b

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhq8;

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v3

    if-eqz v3, :cond_1d

    check-cast v2, Ltq8;

    invoke-static {p0, v2}, Lau5;->a(Ljava/lang/String;Ltq8;)V

    goto :goto_7

    :cond_1d
    sget-object v3, Lp6l;->a:Lp6l;

    invoke-virtual {v2, v3}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "ofa://ui/aria?source=sd_plus"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {v2}, Lhq8;->h()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Aria"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {v2, p0}, Lhq8;->q(Ljava/lang/String;)V

    goto :goto_7

    :cond_3b
    return-void
.end method


# virtual methods
.method public final apply(I)V
    .registers 9

    iget-byte v0, p0, Lau5;->a:B

    sget-object v1, Lh70;->c:Lh70;

    sget-object v2, Ld7j;->g:Ld7j;

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object v5, p0, Lau5;->b:Ljava/lang/Object;

    iget-object v6, p0, Lau5;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_226

    if-eqz p1, :cond_39

    const v0, 0x71cf21c0

    if-ge p1, v0, :cond_39

    check-cast v5, Lnr8;

    new-instance p1, Ly1n;

    invoke-direct {p1, p0, v4}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, p1}, Lnr8;->f(Ljava/lang/Runnable;)V

    check-cast v6, Lcom/opera/android/BrowserActivity;

    const p0, 0x7f1401dc

    invoke-virtual {v6, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lvml;->d:Lumi;

    new-instance v0, Lfv3;

    invoke-direct {v0, v6, p0}, Lfv3;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_39
    return-void

    :pswitch_3a
    if-lez p1, :cond_86

    const p0, 0xb6075d8

    if-ge p1, p0, :cond_86

    check-cast v5, Ltt3;

    invoke-virtual {v5}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object p0

    if-ne p0, v2, :cond_86

    check-cast v6, Lwv1;

    iget-object p1, v6, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorm;

    iget-object p0, p0, Ld7j;->a:Ljava/lang/String;

    check-cast p1, Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_86

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v0, v2}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v0

    iget-object v0, v0, Lqp0;->d:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lg70;

    iget-object v5, v0, Lg70;->a:Lf70;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5, v3, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p0, v0, Lg70;->a:Lf70;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v4, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p1, v2}, Lx5f;->U0(Lx56;)V

    :cond_86
    return-void

    :pswitch_87
    check-cast v6, Lwv1;

    iget-object p0, v6, Lwv1;->b:Lb6h;

    if-lez p1, :cond_e6

    const v0, 0x71c47748

    if-ge p1, v0, :cond_e6

    check-cast v5, Ltt3;

    invoke-virtual {v5}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object p1

    if-eq p1, v2, :cond_e6

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorm;

    const/16 v2, 0x1c

    check-cast v0, Lx5f;

    invoke-virtual {v0, v2}, Lx5f;->S(I)V

    iget-boolean v0, p1, Ld7j;->d:Z

    if-eqz v0, :cond_b3

    sget-object v1, Lh70;->b:Lh70;

    :cond_b3
    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    iget-object p1, p1, Ld7j;->a:Ljava/lang/String;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_e6

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v0, v2}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v0

    iget-object v0, v0, Lqp0;->d:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lg70;

    iget-object v5, v0, Lg70;->a:Lf70;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p1, v0, Lg70;->a:Lf70;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v4, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_e6
    return-void

    :pswitch_e7
    const p0, 0x71b53120

    if-ge p1, p0, :cond_11c

    check-cast v5, Ltt3;

    invoke-virtual {v5}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "ai.tos_accepted"

    invoke-interface {p0, p1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_11c

    check-cast v6, Lwv1;

    iget-object p0, v6, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lskm;

    check-cast p0, Lx5f;

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx56;->O(Lzpa;)Le66;

    move-result-object p1

    const/16 v1, 0x13

    invoke-virtual {p1, v1, v4, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    :cond_11c
    return-void

    :pswitch_11d
    if-lez p1, :cond_158

    const p0, 0x71877a00

    if-ge p1, p0, :cond_158

    check-cast v6, Lwv1;

    iget-object p0, v6, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldb;

    invoke-virtual {p0}, Ldb;->f()Z

    move-result p0

    if-eqz p0, :cond_158

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    check-cast v5, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->Z0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lswk;

    invoke-virtual {p0}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "password.promote"

    invoke-interface {p0, p1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_158
    return-void

    :pswitch_159
    const p0, 0x71952600

    if-lt p1, p0, :cond_197

    const p0, 0x7196aca0

    if-ge p1, p0, :cond_197

    check-cast v5, Lwv1;

    iget-object p0, v5, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldb;

    invoke-virtual {p0}, Ldb;->f()Z

    move-result p0

    if-eqz p0, :cond_197

    check-cast v6, Lwv1;

    iget-object p0, v6, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnr8;

    check-cast p0, Lcom/opera/android/favorites/e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MYJauVto()Z

    move-result p1

    if-eqz p1, :cond_18e

    invoke-static {}, LJ/N;->MjFpzBBk()V

    goto :goto_197

    :cond_18e
    new-instance p1, Lyqd;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lnr8;->f(Ljava/lang/Runnable;)V

    :cond_197
    :goto_197
    return-void

    :pswitch_198
    if-lez p1, :cond_1ae

    const v0, 0x71de6400

    if-ge p1, v0, :cond_1ae

    check-cast v6, Lumi;

    new-instance p1, Ly1n;

    invoke-direct {p1, p0, v3}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v6, p1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_1ae
    return-void

    :pswitch_1af
    if-lez p1, :cond_1e8

    const p0, 0x71bb6ec8

    if-ge p1, p0, :cond_1e8

    check-cast v6, Lwv1;

    iget-object p0, v6, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsl6;

    invoke-virtual {p0}, Lsl6;->b()Z

    move-result p0

    if-eqz p0, :cond_1e8

    check-cast v5, Ltt3;

    invoke-virtual {v5}, Ltt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    iget-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "default_browser.first_set.timestamp"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1e8

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-wide/16 v1, 0x0

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_1e8
    return-void

    :pswitch_1e9
    if-eqz p1, :cond_224

    const p0, 0x71d3bd70

    if-ge p1, p0, :cond_224

    check-cast v6, Lpv3;

    invoke-virtual {v6}, Lpv3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lku5;

    iget-object p1, p0, Lku5;->a:Lc5o;

    invoke-virtual {p1}, Lc5o;->s()Llu5;

    move-result-object p1

    sget-object v0, Llu5;->d:Llu5;

    if-eq p1, v0, :cond_20c

    iget-object p0, p0, Lku5;->a:Lc5o;

    invoke-virtual {p0}, Lc5o;->s()Llu5;

    move-result-object p0

    sget-object p1, Llu5;->c:Llu5;

    if-ne p0, p1, :cond_224

    :cond_20c
    check-cast v5, Lmt3;

    invoke-virtual {v5}, Lmt3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "startpage.continue_booking_shown"

    invoke-interface {p1, v0, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_224
    return-void

    nop

    :pswitch_data_226
    .packed-switch 0x0
        :pswitch_1e9
        :pswitch_1af
        :pswitch_198
        :pswitch_159
        :pswitch_11d
        :pswitch_e7
        :pswitch_87
        :pswitch_3a
    .end packed-switch
.end method
