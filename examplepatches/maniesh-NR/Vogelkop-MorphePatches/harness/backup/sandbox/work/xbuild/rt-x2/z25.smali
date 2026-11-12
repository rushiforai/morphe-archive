.class public final Lz25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public constructor <init>(B)V
    .registers 14

    iput-byte p1, p0, Lz25;->f:B

    packed-switch p1, :pswitch_data_3e

    new-instance v2, Lrxh;

    const p1, 0x7f141053

    invoke-direct {v2, p1}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const p1, 0x7f141054

    invoke-direct {v3, p1}, Lrxh;-><init>(I)V

    const v4, 0x7f080612

    sget-object v5, La35;->c:La35;

    const-string v1, "Tabs"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_21
    move-object v0, p0

    new-instance v8, Lrxh;

    const p0, 0x7f14113a

    invoke-direct {v8, p0}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    const p0, 0x7f14113b

    invoke-direct {v9, p0}, Lrxh;-><init>(I)V

    const v10, 0x7f0805f3

    sget-object v11, La35;->h:La35;

    const-string v7, "SiteSettings"

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_21
    .end packed-switch
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 6

    iget-byte p0, p0, Lz25;->f:B

    packed-switch p0, :pswitch_data_60

    new-instance p0, Lz;

    invoke-direct {p0, p2}, Lz;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lz;->b()Lyqd;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {v0, p2}, Lj14;->t(ZLyqd;)V

    const/4 p2, 0x1

    invoke-virtual {p0}, Lz;->b()Lyqd;

    move-result-object v1

    invoke-static {p2, v1}, Lj14;->t(ZLyqd;)V

    invoke-static {}, LJ/N;->MgUu3OWK()V

    sget-object p2, Lvl8;->b:Lvl8;

    iget-object p2, p2, Lvl8;->a:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->clear()V

    const/4 p2, 0x3

    invoke-static {p2}, Lhj;->a(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v0, p2, v2, v0}, Lhj;->b(IILjava/lang/String;Z)V

    goto :goto_2d

    :cond_3d
    invoke-static {}, LJ/N;->MqE$051l()V

    iget-object p1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const-string p2, "open_in_app_count"

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lz;->e()V

    return-void

    :pswitch_57
    iget-object p0, p1, Ls25;->d:Lk6l;

    invoke-virtual {p0}, Lk6l;->j()V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_57
    .end packed-switch
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 5

    iget-byte p0, p0, Lz25;->f:B

    packed-switch p0, :pswitch_data_84

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    sget-object v0, Ls9g;->h:Ls9g;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ls9g;->i(Z)Ljava/util/Set;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Ls9g;->h:Ls9g;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ls9g;->i(Z)Ljava/util/Set;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, LJ/N;->M9qRRZZC()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    move-result p0

    const/4 v0, 0x3

    invoke-static {v0}, Lhj;->a(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v0, p0

    if-nez v0, :cond_45

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f141059

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_5a

    :cond_45
    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v1, 0x7f12001f

    invoke-virtual {p0, v1, v0, p1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_5a
    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_60
    iget-object p0, p1, Ls25;->d:Lk6l;

    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    iget-object p1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f120021

    invoke-virtual {p1, v1, p0, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_60
    .end packed-switch
.end method
