.class public final Lx25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public constructor <init>(B)V
    .registers 14

    iput-byte p1, p0, Lx25;->f:B

    packed-switch p1, :pswitch_data_30

    new-instance v2, Lrxh;

    const p1, 0x7f141055

    invoke-direct {v2, p1}, Lrxh;-><init>(I)V

    const v4, 0x7f0805a8

    sget-object v5, La35;->b:La35;

    const-string v1, "Passwords"

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_1a
    move-object v0, p0

    new-instance v8, Lrxh;

    const p0, 0x7f141051

    invoke-direct {v8, p0}, Lrxh;-><init>(I)V

    const v10, 0x7f0805d3

    sget-object v11, La35;->i:La35;

    const-string v7, "NewsPersonalization"

    const/4 v9, 0x0

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_1a
    .end packed-switch
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 10

    iget-byte p0, p0, Lx25;->f:B

    packed-switch p0, :pswitch_data_d8

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p1

    iget-object v0, p1, Luqe;->e:Lqag;

    invoke-virtual {v0}, Lqag;->removeAll()Z

    iget-object p1, p1, Luqe;->j:Lstm;

    iget-object v0, p1, Lstm;->j:Lta7;

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "user_id"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_47
    :goto_47
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "known_user_id_"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_47

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_47

    :cond_5f
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7f

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_6e
    if-ge v5, v4, :cond_7c

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    invoke-interface {v2, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_6e

    :cond_7c
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_7f
    iget-object v1, v0, Lta7;->b:Ljava/lang/Object;

    check-cast v1, Li16;

    iget-object v2, v1, Li16;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    iget-object v4, v1, Li16;->b:Ljava/lang/Object;

    check-cast v4, Li32;

    if-nez v2, :cond_90

    invoke-virtual {v4}, Lldk;->i()V

    :cond_90
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v2, v1, Li16;->c:Ljava/lang/Object;

    invoke-virtual {v4, v2}, Lldk;->g(Ljava/lang/Object;)V

    iput-object v3, v0, Lta7;->m:Ljava/lang/Object;

    iput-object v3, v0, Lta7;->h:Ljava/lang/Object;

    iget-object v1, v0, Lta7;->c:Ljava/lang/Object;

    check-cast v1, Lqb7;

    iget-object v4, v1, Lqb7;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    iget-object v5, v1, Lqb7;->a:Ljava/lang/Object;

    check-cast v5, Li32;

    if-nez v4, :cond_ac

    invoke-virtual {v5}, Lldk;->i()V

    :cond_ac
    iput-object v2, v1, Lqb7;->b:Ljava/lang/Object;

    invoke-virtual {v5, v2}, Lldk;->g(Ljava/lang/Object;)V

    iput-object v3, v0, Lta7;->i:Ljava/lang/Object;

    iput-object v3, v0, Lta7;->j:Ljava/lang/Object;

    invoke-virtual {p1}, Lt7j;->c()V

    iget-object p0, p0, Lfqe;->a:Landroid/content/Context;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p1, "recommendations_language_region"

    invoke-virtual {p0, p1, v3}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_cf
    sget-object p0, Llx3;->a:Li7f;

    invoke-static {}, LJ/N;->Mxlx0ho4()V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_data_d8
    .packed-switch 0x0
        :pswitch_cf
    .end packed-switch
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 4

    iget-byte p0, p0, Lx25;->f:B

    packed-switch p0, :pswitch_data_22

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f141091

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    new-instance p0, Lp25;

    check-cast p2, Liu2;

    const/4 v0, 0x1

    invoke-direct {p0, p2, p1, v0}, Lp25;-><init>(Liu2;Ls25;B)V

    sget-object p1, Llx3;->a:Li7f;

    invoke-static {p0}, LJ/N;->MjVrCWbP(Ljava/lang/Object;)V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
