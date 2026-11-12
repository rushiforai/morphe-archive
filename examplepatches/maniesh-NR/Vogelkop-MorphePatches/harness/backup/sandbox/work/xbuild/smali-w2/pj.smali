.class public final Lpj;
.super Lq37;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(I[IB)V
    .registers 4

    iput-byte p3, p0, Lpj;->c:B

    invoke-direct {p0, p1, p2}, Lq37;-><init>(I[I)V

    return-void
.end method

.method public static d(Landroid/content/Context;Ljy3;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_30

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2f

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1a

    const/4 p0, 0x3

    if-eq p1, p0, :cond_2f

    const/4 p0, 0x4

    if-eq p1, p0, :cond_2f

    const/4 p0, 0x5

    if-eq p1, p0, :cond_2f

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :cond_1a
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->b()Z

    move-result p0

    return p0

    :cond_2f
    return v0

    :cond_30
    new-instance p1, Lyl6;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {p1, p0, v0}, Lyl6;-><init>(Landroid/content/Context;Lumi;)V

    invoke-virtual {p1}, Lyl6;->k()Z

    move-result p0

    return p0
.end method

.method public static e(Landroid/content/Context;)Z
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v0

    sget-object v1, Lb7j;->c:Lb7j;

    if-ne v0, v1, :cond_1e

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object p0

    sget-object v0, Le7j;->c:Le7j;

    if-ne p0, v0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public static f(Landroid/content/Context;)Z
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->c:Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    invoke-virtual {p0}, Lf8f;->f()Z

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p0}, Lf8f;->g()Z

    move-result p0

    if-nez p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    iget-byte v4, v0, Lpj;->c:B

    const/4 v5, 0x0

    const-string v6, "flash"

    const/4 v7, 0x0

    const-string v8, "ACTION_DESTINATION_VIEW"

    const-string v9, "DESTINATION_VIEW_ID"

    const-string v10, "VIEWS_TO_HIGHLIGHT"

    const-string v11, "android.intent.category.LAUNCHER"

    const-string v12, "android.intent.action.MAIN"

    iget v13, v0, Lq37;->a:I

    const/4 v14, 0x1

    sparse-switch v4, :sswitch_data_29c

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    return-void

    :sswitch_22
    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result v4

    if-eqz v4, :cond_2b

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    :cond_2b
    return-void

    :sswitch_2c
    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    iget-object v4, v4, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk3i;

    invoke-virtual {v4}, Lk3i;->b()Z

    move-result v4

    if-eqz v4, :cond_46

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    return-void

    :cond_46
    new-instance v0, Leva;

    const-string v1, "RewardsOfaLinkCallback not supported."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_4e
    sget-object v4, Lg8f;->a:Lg8f;

    if-ne v3, v4, :cond_79

    if-nez p3, :cond_79

    const-string v4, "enable_news"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "true"

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_79

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    const-string v5, "enable_newsfeed"

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_79

    invoke-virtual {v4, v14, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_79
    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    return-void

    :sswitch_7d
    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    iget-object v4, v4, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llpe;

    iget-object v4, v4, Llpe;->c:Lcq5;

    invoke-virtual {v4}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lf8f;

    invoke-virtual {v4}, Lf8f;->g()Z

    move-result v4

    if-nez v4, :cond_9e

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    :cond_9e
    return-void

    :sswitch_9f
    invoke-static {v1}, Lpj;->f(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_a8

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    :cond_a8
    return-void

    :sswitch_a9
    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    iget-object v4, v4, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llpe;

    iget-object v4, v4, Llpe;->c:Lcq5;

    invoke-virtual {v4}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lf8f;

    invoke-virtual {v4}, Lf8f;->f()Z

    move-result v4

    if-nez v4, :cond_ca

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    :cond_ca
    return-void

    :sswitch_cb
    move-object v0, v2

    check-cast v0, Ll1b;

    invoke-virtual {v0, v6}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_fe

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v4, Ljy3;->c:Ly55;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Ly55;->y(Ljava/lang/String;)Ljy3;

    move-result-object v4

    if-eqz v4, :cond_fe

    invoke-static {v1, v4}, Lpj;->d(Landroid/content/Context;Ljy3;)Z

    move-result v6

    if-eqz v6, :cond_f2

    new-array v7, v14, [I

    iget v0, v4, Ljy3;->b:I

    aput v0, v7, v5

    goto :goto_fe

    :cond_f2
    new-instance v1, Leva;

    const-string v2, "Flash argument unsupported: "

    invoke-static {v2, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_fe
    :goto_fe
    sget-object v0, Lg8f;->a:Lg8f;

    if-ne v3, v0, :cond_14d

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_10f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10f

    :cond_12b
    invoke-static {v1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v12}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v11}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    if-eqz v7, :cond_140

    array-length v0, v7

    if-lez v0, :cond_140

    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    :cond_140
    invoke-static {v13}, Lj7c;->f(I)B

    move-result v0

    invoke-virtual {v2, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v2, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_14d
    return-void

    :sswitch_14e
    sget-object v2, Lg8f;->a:Lg8f;

    if-ne v3, v2, :cond_185

    invoke-static {v1}, Lpj;->e(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_185

    sget-object v2, Lwo3;->K:Lpsp;

    sget-object v3, Luo3;->f:Luo3;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lpsp;->j(Luo3;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v12}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v3, v11}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v3, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object v0, v0, Lq37;->b:[I

    array-length v2, v0

    if-lez v2, :cond_178

    invoke-virtual {v3, v10, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    :cond_178
    invoke-static {v13}, Lj7c;->f(I)B

    move-result v0

    invoke-virtual {v3, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v3, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_185
    return-void

    :sswitch_186
    sget-object v0, Lg8f;->a:Lg8f;

    if-ne v3, v0, :cond_210

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_197
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v15, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_197

    :cond_1b3
    move-object v3, v2

    check-cast v3, Ll1b;

    invoke-virtual {v3, v6}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1ee

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lsu1;->c:Lydp;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lsu1;->e:Lh58;

    invoke-virtual {v3}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1cd
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lsu1;

    iget-object v6, v6, Lsu1;->a:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1cd

    goto :goto_1e4

    :cond_1e3
    move-object v4, v7

    :goto_1e4
    check-cast v4, Lsu1;

    if-eqz v4, :cond_1ee

    new-array v7, v14, [I

    iget v2, v4, Lsu1;->b:I

    aput v2, v7, v5

    :cond_1ee
    invoke-static {v1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v12}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v11}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    if-eqz v7, :cond_203

    array-length v0, v7

    if-lez v0, :cond_203

    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    :cond_203
    invoke-static {v13}, Lj7c;->f(I)B

    move-result v0

    invoke-virtual {v2, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v2, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_210
    return-void

    :sswitch_211
    sget-object v0, Lg8f;->a:Lg8f;

    if-ne v3, v0, :cond_29b

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_222
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_23e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v15, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_222

    :cond_23e
    move-object v3, v2

    check-cast v3, Ll1b;

    invoke-virtual {v3, v6}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_279

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Loj;->c:Lujp;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Loj;->e:Lh58;

    invoke-virtual {v3}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_258
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_26e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Loj;

    iget-object v6, v6, Loj;->a:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_258

    goto :goto_26f

    :cond_26e
    move-object v4, v7

    :goto_26f
    check-cast v4, Loj;

    if-eqz v4, :cond_279

    new-array v7, v14, [I

    iget v2, v4, Loj;->b:I

    aput v2, v7, v5

    :cond_279
    invoke-static {v1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v12}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v11}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    if-eqz v7, :cond_28e

    array-length v0, v7

    if-lez v0, :cond_28e

    invoke-virtual {v2, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    :cond_28e
    invoke-static {v13}, Lj7c;->f(I)B

    move-result v0

    invoke-virtual {v2, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v2, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_29b
    return-void

    :sswitch_data_29c
    .sparse-switch
        0x0 -> :sswitch_211
        0x2 -> :sswitch_186
        0x7 -> :sswitch_14e
        0x8 -> :sswitch_cb
        0xe -> :sswitch_a9
        0xf -> :sswitch_9f
        0x10 -> :sswitch_7d
        0x14 -> :sswitch_4e
        0x1a -> :sswitch_2c
        0x1b -> :sswitch_22
    .end sparse-switch
.end method

.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lpj;->c:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    sparse-switch v0, :sswitch_data_ea

    invoke-super {p0, p1, p2, p3}, Lq37;->b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :sswitch_c
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_25
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object p0

    iget-object p1, p0, Lm9c;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string p2, "has_premium_subscription"

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_59

    iget-object p0, p0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "premium_subscription_source"

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "ofa_free_trial"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_59

    move v1, v2

    :cond_59
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_5e
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->c:Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    invoke-virtual {p0}, Lf8f;->g()Z

    move-result p0

    xor-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_80
    invoke-static {p1}, Lpj;->f(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_89
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->c:Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    invoke-virtual {p0}, Lf8f;->f()Z

    move-result p0

    xor-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_ab
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result p0

    if-nez p0, :cond_b6

    move v1, v2

    :cond_b6
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_bb
    const-string p0, "flash"

    invoke-virtual {p2, p0}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_dd

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    sget-object p2, Ljy3;->c:Ly55;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Ly55;->y(Ljava/lang/String;)Ljy3;

    move-result-object p0

    if-eqz p0, :cond_dd

    invoke-static {p1, p0}, Lpj;->d(Landroid/content/Context;Ljy3;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_df

    :cond_dd
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_df
    return-object p0

    :sswitch_e0
    invoke-static {p1}, Lpj;->e(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_ea
    .sparse-switch
        0x7 -> :sswitch_e0
        0x8 -> :sswitch_bb
        0xc -> :sswitch_ab
        0xe -> :sswitch_89
        0xf -> :sswitch_80
        0x10 -> :sswitch_5e
        0x12 -> :sswitch_25
        0x1a -> :sswitch_c
    .end sparse-switch
.end method

.method public final c(Landroid/content/Context;Lkk6;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lpj;->c:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    sparse-switch v0, :sswitch_data_5e

    invoke-super {p0, p1, p2}, Lq37;->c(Landroid/content/Context;Lkk6;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :sswitch_c
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->e1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm6l;

    iget-object p0, p0, Lm6l;->a:Lode;

    invoke-virtual {p0}, Lekc;->i()Z

    move-result p1

    if-nez p1, :cond_29

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_3d

    :cond_29
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk6l;

    if-nez p0, :cond_34

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_3d

    :cond_34
    iget p0, p0, Lk6l;->n:I

    if-lez p0, :cond_39

    move v1, v2

    :cond_39
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_3d
    return-object p0

    :sswitch_3e
    invoke-static {p1}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object p0

    iget-object p0, p0, Lgom;->a:Llom;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_57

    if-eq p0, v2, :cond_58

    const/4 p1, 0x2

    if-eq p0, p1, :cond_58

    const/4 p1, 0x3

    if-eq p0, p1, :cond_58

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    goto :goto_5c

    :cond_57
    move v1, v2

    :cond_58
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    :goto_5c
    return-object p0

    nop

    :sswitch_data_5e
    .sparse-switch
        0xc -> :sswitch_3e
        0x19 -> :sswitch_c
    .end sparse-switch
.end method
