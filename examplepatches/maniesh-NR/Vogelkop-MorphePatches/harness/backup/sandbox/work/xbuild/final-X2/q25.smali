.class public final Lq25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public constructor <init>(B)V
    .registers 14

    iput-byte p1, p0, Lq25;->f:B

    packed-switch p1, :pswitch_data_38

    new-instance v2, Lrxh;

    const p1, 0x7f141048

    invoke-direct {v2, p1}, Lrxh;-><init>(I)V

    const v4, 0x7f08056a

    sget-object v5, La35;->k:La35;

    const-string v1, "BrowsingHistory"

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_1a
    move-object v0, p0

    new-instance v8, Lrxh;

    const p0, 0x7f14104a

    invoke-direct {v8, p0}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    const p0, 0x7f14104b

    invoke-direct {v9, p0}, Lrxh;-><init>(I)V

    const v10, 0x7f080530

    sget-object v11, La35;->e:La35;

    const-string v7, "CookiesAndData"

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_1a
    .end packed-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V
    .registers 7

    .line 56
    const/4 v0, 0x2

    iput-byte v0, p0, Lq25;->f:B

    invoke-direct/range {p0 .. p5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 7

    iget-byte p0, p0, Lq25;->f:B

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_7c

    iget-object p0, p1, Ls25;->i:Lqln;

    invoke-virtual {p0, v0}, Lqln;->o(Z)V

    iget-object p1, p0, Lqln;->o:Lagm;

    new-instance v0, Lm2n;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lm2n;-><init>(Ljava/lang/Object;B)V

    const-string v1, "most_popular"

    invoke-virtual {p1, v1, v0}, Lagm;->u(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    iget-object p1, p0, Lqln;->j:Lvzk;

    iget-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast v1, Lru9;

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "wallpaper.favorites.list"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    iget-object p1, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p1, p0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v1, "wallpaper_current"

    invoke-interface {v0, v1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4e

    invoke-interface {v0, v1}, Ly9j;->remove(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    :cond_4e
    iget-object p0, p0, Lqln;->f:Lami;

    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    check-cast p0, Ls14;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ly1n;

    const/16 v0, 0x18

    invoke-direct {p1, p0, v0}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Ls14;->G(Ljava/lang/Runnable;)V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_65
    sget-object p0, Llx3;->a:Li7f;

    new-instance p0, Ljx3;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p2, v0}, Ljx3;-><init>(Ljava/lang/String;Ljava/lang/Runnable;B)V

    const/4 p2, 0x1

    invoke-static {p1, p2, p0}, LJ/N;->MO3$NI3G(Ljava/lang/Object;ZLjava/lang/Object;)V

    return-void

    :pswitch_72
    new-instance p0, Lm35;

    invoke-direct {p0, v0, p2}, Lm35;-><init>(ZLjava/lang/Runnable;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_72
        :pswitch_65
    .end packed-switch
.end method

.method public final b()I
    .registers 2

    iget-byte v0, p0, Lq25;->f:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Lr25;->b()I

    move-result p0

    return p0

    :pswitch_a
    const p0, 0x7f14043d

    return p0

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 4

    iget-byte p0, p0, Lq25;->f:B

    packed-switch p0, :pswitch_data_34

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f141091

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    new-instance p0, Lxj;

    check-cast p2, Liu2;

    const/16 v0, 0x1d

    invoke-direct {p0, p2, p1, v0}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p1, Llx3;->a:Li7f;

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, LJ/N;->MOJ0_F$K(Ljava/lang/Object;Ljava/lang/Object;Z)V

    return-void

    :pswitch_25
    new-instance p0, Lp25;

    check-cast p2, Liu2;

    const/4 v0, 0x0

    invoke-direct {p0, p2, p1, v0}, Lp25;-><init>(Liu2;Ls25;B)V

    sget-object p1, Llx3;->a:Li7f;

    invoke-static {p0}, LJ/N;->MCljwZu_(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_25
        :pswitch_14
    .end packed-switch
.end method
