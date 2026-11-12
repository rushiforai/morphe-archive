.class public final synthetic Ly2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Ly2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lhu;)V
    .registers 2

    const/16 p1, 0xd

    iput-byte p1, p0, Ly2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v0, v0, Ly2;->a:B

    const/4 v1, 0x2

    const-string v2, "expired"

    const-string v3, "title"

    const-string v4, "created"

    const-string v5, "session"

    const-string v6, "id"

    const-string v8, "SELECT * from chat ORDER BY created DESC"

    const/4 v9, 0x0

    const/4 v10, 0x1

    packed-switch v0, :pswitch_data_394

    move-object/from16 v0, p1

    check-cast v0, Lk0j;

    invoke-static {v0}, Lioh;->r(Lk0j;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_23
    move-object/from16 v0, p1

    check-cast v0, Loag;

    sget-object v1, Lj41;->a:Lhp7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v1}, Lalo;->d0(Loag;Lg7h;)Ljava/lang/Object;

    sget-object v1, Lj41;->b:Lhp7;

    invoke-static {v0, v1}, Lalo;->d0(Loag;Lg7h;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0

    :pswitch_3c
    move-object/from16 v0, p1

    check-cast v0, Lchg;

    return-object v0

    :pswitch_41
    move-object/from16 v0, p1

    check-cast v0, Lk0j;

    invoke-static {v0}, Lioh;->r(Lk0j;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_4e
    move-object/from16 v0, p1

    check-cast v0, Lvg9;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_55
    move-object/from16 v0, p1

    check-cast v0, Li1a;

    invoke-virtual {v0}, Li1a;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_5e
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/Pair;

    iget-object v1, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v3

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    new-instance v2, Lcom/opera/android/suggestion/Suggestion;

    const-string v5, ""

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v9, 0x7fffffff

    const/4 v11, 0x0

    const/4 v12, -0x1

    const/4 v13, 0x0

    move-object v6, v4

    move-object v10, v5

    invoke-direct/range {v2 .. v13}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v2

    :pswitch_81
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_88
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8f
    move-object/from16 v0, p1

    check-cast v0, Lsfc;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_96
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_9d
    move-object/from16 v0, p1

    check-cast v0, Losk;

    invoke-virtual {v0, v8}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_a5
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    :goto_be
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v8

    if-eqz v8, :cond_fe

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v12

    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_d0

    const/4 v15, 0x0

    goto :goto_d5

    :cond_d0
    invoke-virtual {v1, v5}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    move-object v15, v8

    :goto_d5
    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v16

    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_e2

    const/16 v18, 0x0

    goto :goto_e8

    :cond_e2
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v18, v8

    :goto_e8
    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v7

    long-to-int v7, v7

    if-eqz v7, :cond_f2

    move/from16 v19, v10

    goto :goto_f4

    :cond_f2
    move/from16 v19, v9

    :goto_f4
    new-instance v11, Lhu4;

    const/4 v14, 0x0

    invoke-direct/range {v11 .. v19}, Lhu4;-><init>(JZLjava/lang/String;JLjava/lang/String;Z)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_fd
    .catchall {:try_start_a5 .. :try_end_fd} :catchall_102

    goto :goto_be

    :cond_fe
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v6

    :catchall_102
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_107
    const-string v0, "DELETE FROM chat"

    move-object/from16 v1, p1

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_111
    invoke-virtual {v1}, Lwsk;->n()Z
    :try_end_114
    .catchall {:try_start_111 .. :try_end_114} :catchall_11a

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_11a
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_11f
    move-object/from16 v0, p1

    check-cast v0, Losk;

    invoke-virtual {v0, v8}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_127
    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    :goto_140
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v7

    if-eqz v7, :cond_180

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v12

    invoke-virtual {v1, v5}, Lwsk;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_152

    const/4 v15, 0x0

    goto :goto_157

    :cond_152
    invoke-virtual {v1, v5}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v7

    move-object v15, v7

    :goto_157
    invoke-virtual {v1, v4}, Lwsk;->getLong(I)J

    move-result-wide v16

    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_164

    const/16 v18, 0x0

    goto :goto_16a

    :cond_164
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v18, v7

    :goto_16a
    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v7

    long-to-int v7, v7

    if-eqz v7, :cond_174

    move/from16 v19, v10

    goto :goto_176

    :cond_174
    move/from16 v19, v9

    :goto_176
    new-instance v11, Lhu4;

    const/4 v14, 0x0

    invoke-direct/range {v11 .. v19}, Lhu4;-><init>(JZLjava/lang/String;JLjava/lang/String;Z)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_17f
    .catchall {:try_start_127 .. :try_end_17f} :catchall_184

    goto :goto_140

    :cond_180
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v6

    :catchall_184
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_189
    move-object/from16 v2, p1

    check-cast v2, Ln6j;

    const/4 v7, 0x0

    const/16 v8, 0x38

    const/4 v3, 0x1

    const v4, 0x7f141094

    const v5, 0x7f0a0990

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_19e
    move-object/from16 v0, p1

    check-cast v0, Look;

    new-instance v1, Lst;

    iget-object v2, v0, Look;->a:Ljava/lang/String;

    new-instance v3, Lqxh;

    invoke-direct {v3, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Look;->b:Ljava/lang/String;

    sget-object v6, Lht;->e:Lht;

    const/4 v9, 0x0

    const/16 v10, 0x1e8

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v3

    move-object v3, v0

    invoke-direct/range {v1 .. v10}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_1bc
    move-object/from16 v0, p1

    check-cast v0, Look;

    iget-byte v0, v0, Look;->d:B

    if-eq v0, v1, :cond_265

    const/4 v1, 0x5

    if-ne v0, v1, :cond_266

    goto/16 :goto_265

    :pswitch_1c9
    move-object/from16 v0, p1

    check-cast v0, Lpl3;

    invoke-static {v0}, Lalo;->K(Lpl3;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lqxh;

    invoke-direct {v3, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-interface {v0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0}, Lpl3;->f()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lht;->a:Lht;

    new-instance v2, Lst;

    const v0, 0x7f080505

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x0

    const/16 v11, 0x160

    const/4 v5, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v11}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_1f2
    move-object/from16 v0, p1

    check-cast v0, Lhq8;

    new-instance v1, Lst;

    invoke-virtual {v0}, Lhq8;->h()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lqxh;

    invoke-direct {v3, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    sget-object v2, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v2}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lhq8;->g()Ljava/lang/String;

    move-result-object v4

    sget-object v6, Lht;->f:Lht;

    const/4 v9, 0x0

    const/16 v10, 0x1e8

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v20, v3

    move-object v3, v2

    move-object/from16 v2, v20

    invoke-direct/range {v1 .. v10}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_21c
    move-object/from16 v0, p1

    check-cast v0, Llq8;

    iget-object v1, v0, Llq8;->b:Ljava/lang/String;

    new-instance v3, Lqxh;

    invoke-direct {v3, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v4, v0, Llq8;->d:Ljava/lang/String;

    iget-object v9, v0, Llq8;->e:Ljava/lang/String;

    iget-object v5, v0, Llq8;->c:Ljava/lang/String;

    sget-object v7, Lht;->b:Lht;

    iget-object v8, v0, Llq8;->f:Ljava/util/Set;

    new-instance v2, Lst;

    const/4 v10, 0x0

    const/16 v11, 0x188

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v11}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_23b
    move-object/from16 v0, p1

    check-cast v0, Lst;

    iget-object v1, v0, Lst;->c:Ljava/lang/String;

    if-eqz v1, :cond_249

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_266

    :cond_249
    iget-object v0, v0, Lst;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_266

    const-string v1, "redirector.opera.com"

    invoke-static {v0, v1}, Lwqm;->y(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_265

    const-string v1, "redirector.op-test.net"

    invoke-static {v0, v1}, Lwqm;->y(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_266

    :cond_265
    :goto_265
    move v9, v10

    :cond_266
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_26b
    move-object/from16 v0, p1

    check-cast v0, Lst;

    iget-object v0, v0, Lst;->g:Ljava/lang/String;

    return-object v0

    :pswitch_272
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    return-object v0

    :pswitch_281
    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    const v0, 0x7f14008f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const/16 v6, 0x1c

    const/4 v2, 0x1

    const v3, 0x7f140090

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const v0, 0x7f140093

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const/4 v2, 0x2

    const v3, 0x7f140094

    invoke-static/range {v1 .. v6}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const v0, 0x7f140091

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const/4 v2, 0x3

    const v3, 0x7f140092

    invoke-static/range {v1 .. v6}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2c1
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "speed_dial.large_icons"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_2d0
    move-object/from16 v0, p1

    check-cast v0, Lxnc;

    iget-object v0, v0, Lxnc;->a:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0

    :pswitch_2dd
    move-object/from16 v0, p1

    check-cast v0, Landroid/webkit/WebView;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2e4
    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x1

    const v3, 0x7f1410c4

    const v4, 0x7f0a0a11

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const v0, 0x7f0a0a20

    const v2, 0x7f0a0a1e

    const v3, 0x7f0a0a29

    filled-new-array {v3, v0, v2}, [I

    move-result-object v4

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v2, 0x2

    const v3, 0x7f140563

    invoke-static/range {v1 .. v6}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    const/4 v6, 0x0

    const/4 v2, 0x3

    const v3, 0x7f140efd

    const v4, 0x7f0a09ee

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x4

    const v3, 0x7f140fe1

    const v4, 0x7f0a09c5

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x5

    const v3, 0x7f1410e2

    const v4, 0x7f0a09bb

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_330
    move-object/from16 v0, p1

    check-cast v0, Lvmg;

    if-eqz v0, :cond_33b

    iget-byte v0, v0, Lvmg;->a:B

    if-ne v0, v1, :cond_33b

    move v9, v10

    :cond_33b
    xor-int/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_341
    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    const/4 v6, 0x0

    const/16 v7, 0x30

    const/4 v2, 0x1

    const v3, 0x7f1410dd

    const/4 v4, 0x1

    const v5, 0x7f080618

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v7, 0x38

    const/4 v2, 0x2

    const v3, 0x7f1410e5

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x3

    const v3, 0x7f140ff4

    const/4 v4, 0x3

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x4

    const v3, 0x7f140fac

    const/4 v4, 0x4

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x5

    const v3, 0x7f140fda

    const/4 v4, 0x5

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x6

    const v3, 0x7f141083

    const/4 v4, 0x6

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x7

    const v3, 0x7f14120d

    const/4 v4, 0x7

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0x8

    const v3, 0x7f1410ca

    const/16 v4, 0x8

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_394
    .packed-switch 0x0
        :pswitch_341
        :pswitch_330
        :pswitch_2e4
        :pswitch_2dd
        :pswitch_2d0
        :pswitch_2c1
        :pswitch_281
        :pswitch_272
        :pswitch_26b
        :pswitch_23b
        :pswitch_21c
        :pswitch_1f2
        :pswitch_1c9
        :pswitch_1bc
        :pswitch_19e
        :pswitch_189
        :pswitch_11f
        :pswitch_107
        :pswitch_9d
        :pswitch_96
        :pswitch_8f
        :pswitch_88
        :pswitch_81
        :pswitch_5e
        :pswitch_55
        :pswitch_4e
        :pswitch_41
        :pswitch_3c
        :pswitch_23
    .end packed-switch
.end method
