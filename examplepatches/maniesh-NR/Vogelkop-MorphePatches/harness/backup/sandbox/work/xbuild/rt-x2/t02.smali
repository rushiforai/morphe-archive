.class public final synthetic Lt02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 8
    iput-byte p2, p0, Lt02;->a:B

    iput-object p1, p0, Lt02;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lu02;Lbqb;B)V
    .registers 4

    iput-byte p3, p0, Lt02;->a:B

    iput-object p2, p0, Lt02;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Lt02;->a:B

    sget-object v2, Lj02;->a:Lj02;

    sget-object v3, Lh02;->a:Lh02;

    const-string v4, "result"

    const/4 v5, 0x4

    const/4 v6, 0x5

    const-string v7, "message"

    const-string v8, "code"

    const-string v9, "error"

    const/4 v11, 0x0

    const/4 v12, 0x0

    iget-object v0, v0, Lt02;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_4f0

    check-cast v0, Lwx;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    invoke-virtual {v0, v1}, Lwx;->run(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_25
    check-cast v0, Lm9d;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Lm9d;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4c

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_37
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    :try_start_43
    sget-object v2, Lt0i;->b:Lp0i;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_48
    .catchall {:try_start_43 .. :try_end_48} :catchall_49

    goto :goto_37

    :catchall_49
    sget-object v1, Lt0i;->b:Lp0i;

    goto :goto_37

    :cond_4c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f
    check-cast v0, Lpi3;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_6d

    sget-object v2, Lpn7;->b:Lon7;

    iget-object v2, v0, Lpi3;->b:Lu55;

    check-cast v2, Lulp;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v4, Lun7;->d:Lun7;

    invoke-static {v2, v3, v4}, Lcs5;->y0(JLun7;)J

    move-result-wide v2

    invoke-virtual {v0, v11, v2, v3, v1}, Lpi3;->a(ZJLjava/util/Set;)V

    :cond_6d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_70
    check-cast v0, Loi3;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Set;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7c
    check-cast v0, Lmi3;

    move-object/from16 v1, p1

    check-cast v1, Losk;

    const-string v2, "SELECT * FROM active_block_lists"

    invoke-virtual {v1, v2}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_88
    const-string v2, "name"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "kind"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "checksum"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v5, "addedTimestampMillis"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v6, "ttlMillis"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    const-string v7, "version"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    const-string v8, "active"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    :goto_b7
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v12

    if-eqz v12, :cond_f4

    invoke-virtual {v1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12}, Lmi3;->b(Ljava/lang/String;)Lsj3;

    move-result-object v15

    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v17

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v19

    invoke-virtual {v1, v7}, Lwsk;->getLong(I)J

    move-result-wide v12

    long-to-int v12, v12

    invoke-virtual {v1, v8}, Lwsk;->getLong(I)J

    move-result-wide v10

    long-to-int v10, v10

    if-eqz v10, :cond_e7

    const/16 v22, 0x1

    goto :goto_e9

    :cond_e7
    const/16 v22, 0x0

    :goto_e9
    new-instance v13, Ldj3;

    move/from16 v21, v12

    invoke-direct/range {v13 .. v22}, Ldj3;-><init>(Ljava/lang/String;Lsj3;Ljava/lang/String;JJIZ)V

    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f3
    .catchall {:try_start_88 .. :try_end_f3} :catchall_f8

    goto :goto_b7

    :cond_f4
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v9

    :catchall_f8
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_fd
    check-cast v0, Lztl;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    new-instance v1, Lci;

    invoke-direct {v1, v0, v6}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :pswitch_109
    check-cast v0, Lfb3;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    new-instance v1, Lci;

    invoke-direct {v1, v0, v5}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :pswitch_115
    check-cast v0, Ljava/util/LinkedHashSet;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_121
    check-cast v0, Lta1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lta1;->e:Ljava/util/LinkedHashSet;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_12f
    check-cast v0, Ly53;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Ly53;->c:Lor2;

    if-eqz v1, :cond_146

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lei;

    iget-object v0, v0, Lei;->d:Landroid/view/View;

    check-cast v0, Landroid/view/ViewStub;

    goto :goto_14e

    :cond_146
    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lei;

    iget-object v0, v0, Lei;->c:Landroid/view/View;

    check-cast v0, Landroid/view/ViewStub;

    :goto_14e
    return-object v0

    :pswitch_14f
    check-cast v0, Lb33;

    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    iget-object v2, v0, Lb33;->a:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->b:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->c:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->d:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->e:Ljava/lang/String;

    invoke-interface {v1, v5, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->f:Ljava/lang/String;

    invoke-interface {v1, v6, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->g:Ljava/lang/String;

    const/4 v3, 0x6

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->h:Ljava/lang/String;

    const/4 v3, 0x7

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->i:Ljava/lang/String;

    const/16 v3, 0x8

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->j:Ljava/lang/String;

    const/16 v3, 0x9

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->k:Ljava/lang/String;

    const/16 v3, 0xa

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->l:Ljava/lang/String;

    const/16 v3, 0xb

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Lb33;->m:Ljava/lang/String;

    const/16 v3, 0xc

    invoke-interface {v1, v3, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-wide v2, v0, Lb33;->n:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/16 v2, 0xd

    invoke-interface {v1, v2, v0}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1b4
    check-cast v0, Ln03;

    move-object/from16 v1, p1

    check-cast v1, Ll03;

    iget-object v2, v1, Ll03;->a:Lqjn;

    new-instance v3, Lwx;

    const/16 v4, 0xe

    invoke-direct {v3, v0, v1, v4}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lqjn;->c(Lcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c9
    check-cast v0, Llu2;

    move-object/from16 v1, p1

    check-cast v1, Lpkj;

    sget-object v2, Lpkj;->a:Lpkj;

    if-ne v1, v2, :cond_1f5

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.LOCK_SCREEN_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000

    invoke-static {v2, v1}, Lqvf;->b(ILandroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-nez v2, :cond_1e9

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :cond_1e9
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :try_start_1ee
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1f5
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1ee .. :try_end_1f5} :catch_1f5

    :catch_1f5
    :cond_1f5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f8
    check-cast v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->l:Ld5o;

    iget-object v2, v2, Ld5o;->a:Ljava/lang/Object;

    check-cast v2, Lxbf;

    iget-object v2, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast v2, Lmi;

    iget-object v2, v2, Lmi;->r:Lhi;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx5g;

    new-instance v3, Ltt2;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v0, v4}, Ltt2;-><init>(ILjava/lang/Object;B)V

    invoke-static {v2, v3}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_220
    check-cast v0, Ll6g;

    move-object/from16 v1, p1

    check-cast v1, Ln7j;

    invoke-virtual {v0}, Ll6g;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_22c
    check-cast v0, Loc2;

    move-object/from16 v1, p1

    check-cast v1, Lpkj;

    sget-object v2, Lpkj;->a:Lpkj;

    if-ne v1, v2, :cond_239

    invoke-virtual {v0}, Loc2;->invoke()Ljava/lang/Object;

    :cond_239
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23c
    check-cast v0, Lz8b;

    move-object/from16 v1, p1

    check-cast v1, Lpg;

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_25a

    sget-object v2, Log;->a:Log;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_256

    invoke-virtual {v0}, Lz8b;->F()V

    goto :goto_25a

    :cond_256
    invoke-static {}, Lh9o;->p()V

    goto :goto_25c

    :cond_25a
    :goto_25a
    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_25c
    return-object v12

    :pswitch_25d
    check-cast v0, Lcg2;

    move-object/from16 v1, p1

    check-cast v1, Lei7;

    iput-object v12, v0, Lcg2;->j:Lgg2;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_268
    check-cast v0, Lub2;

    move-object/from16 v1, p1

    check-cast v1, Ls0o;

    iget-object v0, v0, Lub2;->d:Lob2;

    iget-object v2, v0, Lob2;->a:Ly5i;

    new-instance v3, Lq3;

    const/16 v4, 0x1a

    invoke-direct {v3, v0, v1, v4}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v0, 0x1

    const/4 v4, 0x0

    invoke-static {v2, v4, v0, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_281
    check-cast v0, Lbi;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2ab

    invoke-virtual {v1, v9}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcqb;

    invoke-direct {v3, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lbi;->n(Ltw7;)V

    goto :goto_2b5

    :cond_2ab
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lbi;->n(Ltw7;)V

    :goto_2b5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2b8
    check-cast v0, Lbi;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e2

    invoke-virtual {v1, v9}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcqb;

    invoke-direct {v3, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lbi;->n(Ltw7;)V

    goto :goto_317

    :cond_2e2
    invoke-virtual {v1, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2f7

    invoke-virtual {v1, v9}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v1, Lr32;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_30f

    :cond_2f7
    const-string v1, "success"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_30a

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    new-instance v2, Ls32;

    invoke-direct {v2, v1}, Ls32;-><init>(Z)V

    move-object v1, v2

    goto :goto_30f

    :cond_30a
    new-instance v1, Lu32;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :goto_30f
    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lbi;->n(Ltw7;)V

    :goto_317
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_31a
    check-cast v0, Lbi;

    iget-object v0, v0, Lbi;->b:Ljava/lang/Object;

    check-cast v0, Lp62;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_345

    invoke-virtual {v1, v9}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    invoke-virtual {v1, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, v0, Lp62;->c:Lg22;

    iget-object v1, v1, Lg22;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, v0, Lp62;->b:Lqyj;

    invoke-virtual {v0}, Lqyj;->m()V

    goto :goto_351

    :cond_345
    iget-object v1, v0, Lp62;->c:Lg22;

    iget-object v1, v1, Lg22;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, v0, Lp62;->b:Lqyj;

    invoke-virtual {v0}, Lqyj;->m()V

    :goto_351
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_354
    check-cast v0, Lws1;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_37e

    invoke-virtual {v1, v9}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcqb;

    invoke-direct {v3, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lws1;->n(Ltw7;)V

    goto :goto_396

    :cond_37e
    invoke-virtual {v1, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    const-string v2, "id"

    iget-object v1, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lws1;->n(Ltw7;)V

    :goto_396
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_399
    check-cast v0, Lig;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    invoke-virtual {v0}, Lig;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a5
    check-cast v0, Llx1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Llx1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3b1
    check-cast v0, Lfka;

    move-object/from16 v1, p1

    check-cast v1, Lvke;

    if-nez v1, :cond_3c2

    new-instance v1, Lsw7;

    invoke-direct {v1, v12}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lfka;->n(Ltw7;)V

    goto :goto_3f4

    :cond_3c2
    iget-object v2, v1, Lvke;->a:Ljava/lang/String;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v3

    iget-boolean v4, v1, Lvke;->c:Z

    if-eqz v4, :cond_3d1

    sget-object v4, Lzha;->c:Lzha;

    invoke-virtual {v3, v4}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_3d1
    iget-boolean v4, v1, Lvke;->b:Z

    if-eqz v4, :cond_3da

    sget-object v4, Lzha;->d:Lzha;

    invoke-virtual {v3, v4}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_3da
    iget-boolean v1, v1, Lvke;->d:Z

    if-eqz v1, :cond_3e3

    sget-object v1, Lzha;->e:Lzha;

    invoke-virtual {v3, v1}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_3e3
    invoke-static {v3}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v1

    new-instance v3, Lyha;

    invoke-direct {v3, v2, v1}, Lyha;-><init>(Ljava/lang/String;Lehc;)V

    new-instance v1, Lsw7;

    invoke-direct {v1, v3}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lfka;->n(Ltw7;)V

    :goto_3f4
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3f7
    move-object v1, v0

    check-cast v1, Lfka;

    move-object/from16 v0, p1

    check-cast v0, Ltw7;

    instance-of v2, v0, Lrw7;

    if-eqz v2, :cond_40e

    check-cast v0, Lrw7;

    iget-object v0, v0, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    new-instance v2, Lrw7;

    invoke-direct {v2, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_42c

    :cond_40e
    instance-of v2, v0, Lsw7;

    if-eqz v2, :cond_432

    check-cast v0, Lsw7;

    iget-object v0, v0, Lsw7;->a:Ljava/lang/Object;

    :try_start_416
    check-cast v0, Ltfb;

    if-eqz v0, :cond_41f

    new-instance v12, Lbka;

    invoke-direct {v12, v0}, Lbka;-><init>(Ltfb;)V

    :cond_41f
    new-instance v0, Lsw7;

    invoke-direct {v0, v12}, Lsw7;-><init>(Ljava/lang/Object;)V
    :try_end_424
    .catch Ljava/lang/Exception; {:try_start_416 .. :try_end_424} :catch_426

    move-object v2, v0

    goto :goto_42c

    :catch_426
    move-exception v0

    new-instance v2, Lrw7;

    invoke-direct {v2, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_42c
    invoke-static {v2, v1}, Lu02;->I(Ltw7;Lbqb;)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_435

    :cond_432
    invoke-static {}, Lh9o;->p()V

    :goto_435
    return-object v12

    :pswitch_436
    move-object v1, v0

    check-cast v1, Lgka;

    move-object/from16 v0, p1

    check-cast v0, Ltw7;

    instance-of v2, v0, Lrw7;

    if-eqz v2, :cond_44d

    check-cast v0, Lrw7;

    iget-object v0, v0, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    new-instance v2, Lrw7;

    invoke-direct {v2, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_46b

    :cond_44d
    instance-of v2, v0, Lsw7;

    if-eqz v2, :cond_471

    check-cast v0, Lsw7;

    iget-object v0, v0, Lsw7;->a:Ljava/lang/Object;

    :try_start_455
    check-cast v0, Lsfb;

    if-eqz v0, :cond_45e

    new-instance v12, Laka;

    invoke-direct {v12, v0}, Laka;-><init>(Lsfb;)V

    :cond_45e
    new-instance v0, Lsw7;

    invoke-direct {v0, v12}, Lsw7;-><init>(Ljava/lang/Object;)V
    :try_end_463
    .catch Ljava/lang/Exception; {:try_start_455 .. :try_end_463} :catch_465

    move-object v2, v0

    goto :goto_46b

    :catch_465
    move-exception v0

    new-instance v2, Lrw7;

    invoke-direct {v2, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_46b
    invoke-static {v2, v1}, Lu02;->I(Ltw7;Lbqb;)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_474

    :cond_471
    invoke-static {}, Lh9o;->p()V

    :goto_474
    return-object v12

    :pswitch_475
    check-cast v0, Lgka;

    move-object/from16 v1, p1

    check-cast v1, Lk02;

    instance-of v4, v1, Li02;

    if-eqz v4, :cond_485

    new-instance v1, Lyja;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_4a0

    :cond_485
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_493

    new-instance v1, Lwja;

    sget-object v2, Lxja;->c:Lxja;

    invoke-direct {v1, v2}, Lwja;-><init>(Lxja;)V

    goto :goto_4a0

    :cond_493
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4ab

    new-instance v1, Lwja;

    sget-object v2, Lxja;->d:Lxja;

    invoke-direct {v1, v2}, Lwja;-><init>(Lxja;)V

    :goto_4a0
    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lgka;->n(Ltw7;)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4ae

    :cond_4ab
    invoke-static {}, Lh9o;->p()V

    :goto_4ae
    return-object v12

    :pswitch_4af
    check-cast v0, Lgka;

    move-object/from16 v1, p1

    check-cast v1, Lk02;

    instance-of v4, v1, Li02;

    if-eqz v4, :cond_4c4

    new-instance v2, Loja;

    check-cast v1, Li02;

    iget-object v1, v1, Li02;->a:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v2, v1, v4}, Loja;-><init>(Ljava/lang/Object;B)V

    goto :goto_4e1

    :cond_4c4
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d3

    new-instance v2, Loja;

    sget-object v1, Lpja;->c:Lpja;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Loja;-><init>(Ljava/lang/Object;B)V

    goto :goto_4e1

    :cond_4d3
    const/4 v3, 0x1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4ec

    new-instance v2, Loja;

    sget-object v1, Lpja;->d:Lpja;

    invoke-direct {v2, v1, v3}, Loja;-><init>(Ljava/lang/Object;B)V

    :goto_4e1
    new-instance v1, Lsw7;

    invoke-direct {v1, v2}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lgka;->n(Ltw7;)V

    sget-object v12, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4ef

    :cond_4ec
    invoke-static {}, Lh9o;->p()V

    :goto_4ef
    return-object v12

    :pswitch_data_4f0
    .packed-switch 0x0
        :pswitch_4af
        :pswitch_475
        :pswitch_436
        :pswitch_3f7
        :pswitch_3b1
        :pswitch_3a5
        :pswitch_399
        :pswitch_354
        :pswitch_31a
        :pswitch_2b8
        :pswitch_281
        :pswitch_268
        :pswitch_25d
        :pswitch_23c
        :pswitch_22c
        :pswitch_220
        :pswitch_1f8
        :pswitch_1c9
        :pswitch_1b4
        :pswitch_14f
        :pswitch_12f
        :pswitch_121
        :pswitch_115
        :pswitch_109
        :pswitch_fd
        :pswitch_7c
        :pswitch_70
        :pswitch_4f
        :pswitch_25
    .end packed-switch
.end method
