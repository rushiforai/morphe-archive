.class public final Lzv3;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lzv3;->e:B

    iput-object p1, p0, Lzv3;->f:Ltw3;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 55

    move-object/from16 v0, p0

    iget-byte v1, v0, Lzv3;->e:B

    const/16 v4, 0x13

    const/16 v5, 0x18

    const/16 v6, 0x17

    const/16 v7, 0xa

    const/16 v8, 0x16

    const/16 v9, 0x1d

    const/16 v10, 0x15

    const/16 v11, 0x12

    const/16 v12, 0xb

    const/16 v13, 0x14

    const/16 v2, 0x19

    const/16 v3, 0x9

    const/4 v14, 0x3

    iget-object v15, v0, Lzv3;->f:Ltw3;

    packed-switch v1, :pswitch_data_90a

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v0

    new-instance v2, Lwcd;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    iget-object v0, v0, Lipk;->k:Lxbf;

    iget-object v3, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v3, Lode;

    iget-object v0, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    new-instance v4, Lew3;

    invoke-direct {v4, v15, v12}, Lew3;-><init>(Ltw3;B)V

    invoke-direct {v2, v1, v3, v0, v4}, Lwcd;-><init>(Lcom/opera/android/settings/SettingsManager;Lode;Lode;Lew3;)V

    return-object v2

    :pswitch_49
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v16, Lxg7;

    new-instance v12, Ldw3;

    invoke-direct {v12, v1, v11}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->w()Lj4c;

    move-result-object v19

    new-instance v11, Ldw3;

    invoke-direct {v11, v1, v10}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v10, Luu1;

    invoke-direct {v10, v9}, Luu1;-><init>(B)V

    new-instance v9, Ldw3;

    invoke-direct {v9, v1, v8}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v8, Lew3;

    invoke-direct {v8, v15, v3}, Lew3;-><init>(Ltw3;B)V

    new-instance v3, Lew3;

    invoke-direct {v3, v15, v7}, Lew3;-><init>(Ltw3;B)V

    iget-object v7, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v7, v7, Lxv1;->m1:Lj4c;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v25, v7

    check-cast v25, Lwyn;

    sget-object v26, Lvml;->d:Lumi;

    new-instance v7, Ldw3;

    invoke-direct {v7, v1, v6}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v6, Ldw3;

    invoke-direct {v6, v1, v5}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Ldw3;

    invoke-direct {v5, v1, v2}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Ldw3;

    invoke-direct {v2, v1, v4}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Ldw3;

    invoke-direct {v4, v1, v13}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object/from16 v17, v0

    move-object/from16 v30, v2

    move-object/from16 v24, v3

    move-object/from16 v31, v4

    move-object/from16 v29, v5

    move-object/from16 v28, v6

    move-object/from16 v27, v7

    move-object/from16 v23, v8

    move-object/from16 v22, v9

    move-object/from16 v21, v10

    move-object/from16 v20, v11

    move-object/from16 v18, v12

    invoke-direct/range {v16 .. v31}, Lxg7;-><init>(Ldx3;Ldw3;Lj4c;Ldw3;Luu1;Ldw3;Lew3;Lew3;Lwyn;Lumi;Ldw3;Ldw3;Ldw3;Ldw3;Ldw3;)V

    return-object v16

    :pswitch_ba
    new-instance v0, Llm3;

    new-instance v1, Lew3;

    const/16 v2, 0x8

    invoke-direct {v1, v15, v2}, Lew3;-><init>(Ltw3;B)V

    invoke-direct {v0, v1}, Llm3;-><init>(Lew3;)V

    return-object v0

    :pswitch_c7
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lz8b;

    iget-object v3, v1, Lcom/opera/android/OperaApplication;->y:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv1a;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->G:Lj4c;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v3, v2, Lz8b;->a:Ljava/lang/Object;

    iput-object v1, v2, Lz8b;->b:Ljava/lang/Object;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v1

    new-instance v3, Lfg6;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v2, v4, v13}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v1, v4, v4, v3, v14}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-object v2

    :pswitch_f6
    new-instance v0, Lm0a;

    iget-object v1, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->x:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lh0a;

    new-instance v3, Ltah;

    new-instance v4, Lcw3;

    const/4 v5, 0x4

    invoke-direct {v4, v15, v5}, Lcw3;-><init>(Ltw3;B)V

    iget-object v5, v15, Ltw3;->c:Lumi;

    iget-object v6, v15, Ltw3;->m0:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lq32;

    iget-object v7, v15, Ltw3;->n0:Lj4c;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lx12;

    iget-object v8, v15, Ltw3;->o0:Lj4c;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lny1;

    iget-object v9, v15, Ltw3;->p0:Lj4c;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lqy1;

    new-instance v10, Lf0a;

    new-instance v11, Lcw3;

    const/4 v12, 0x5

    invoke-direct {v11, v15, v12}, Lcw3;-><init>(Ltw3;B)V

    invoke-direct {v10, v11}, Lf0a;-><init>(Lcw3;)V

    invoke-direct/range {v3 .. v10}, Ltah;-><init>(Lcw3;Lumi;Lq32;Lx12;Lny1;Lqy1;Lf0a;)V

    iget-object v4, v15, Ltw3;->a:Lhx3;

    iget-object v4, v4, Lhx3;->l:Lfx3;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Liv7;

    invoke-direct {v0, v1, v2, v3, v4}, Lm0a;-><init>(Lndc;Lh0a;Ltah;Liv7;)V

    return-object v0

    :pswitch_150
    new-instance v0, Llm3;

    iget-object v1, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v1

    new-instance v2, Lgw3;

    const/4 v3, 0x0

    invoke-direct {v2, v15, v3}, Lgw3;-><init>(Ltw3;B)V

    invoke-direct {v0, v1, v2}, Llm3;-><init>(Lgjm;Lqcf;)V

    return-object v0

    :pswitch_162
    new-instance v0, Lul9;

    iget-object v1, v15, Ltw3;->y:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh1b;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lul9;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_171
    invoke-static {}, Lh1b;->p()Lz0b;

    move-result-object v0

    iget-object v1, v15, Ltw3;->A:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->N:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->T:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->j0:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->Y:Lrw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->B:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->W:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->a:Lhx3;

    iget-object v2, v1, Lhx3;->k:Lfx3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v1, Lhx3;->a:Lxbf;

    iget-object v1, v1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lmi;

    iget-object v1, v1, Lmi;->x:Lhi;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->l:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->v:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->t:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->w:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->n:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->C:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->G:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->H:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->J:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->P:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->h0:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    iget-object v1, v15, Ltw3;->B0:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lz0b;->g()Lcsh;

    move-result-object v0

    return-object v0

    :pswitch_23f
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Ltr8;

    iget-object v2, v15, Ltw3;->c:Lumi;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/opera/android/favorites/data/FavoriteRemovedSuggestionsDatabase;

    const-string v5, "add_favorite_removed_suggestions.db"

    invoke-static {v3, v4, v5}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object v3

    invoke-virtual {v3}, Lu5i;->b()Ly5i;

    move-result-object v3

    check-cast v3, Lcom/opera/android/favorites/data/FavoriteRemovedSuggestionsDatabase;

    invoke-virtual {v3}, Lcom/opera/android/favorites/data/FavoriteRemovedSuggestionsDatabase;->x()Lur8;

    move-result-object v3

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v4

    check-cast v4, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object v0

    invoke-direct {v1, v2, v3, v4, v0}, Ltr8;-><init>(Lumi;Lur8;Lcom/opera/android/bookmarks/h;Lmdh;)V

    return-object v1

    :pswitch_271
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v24, Lor8;

    iget-object v2, v15, Ltw3;->c:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v26

    new-instance v3, Ldw3;

    invoke-direct {v3, v1, v12}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Ldw3;

    const/16 v5, 0xf

    invoke-direct {v4, v1, v5}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Ldw3;

    const/16 v6, 0x10

    invoke-direct {v5, v1, v6}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v6, Lew3;

    const/4 v7, 0x4

    invoke-direct {v6, v15, v7}, Lew3;-><init>(Ltw3;B)V

    new-instance v7, Lew3;

    const/4 v12, 0x5

    invoke-direct {v7, v15, v12}, Lew3;-><init>(Ltw3;B)V

    new-instance v8, Lew3;

    const/4 v9, 0x6

    invoke-direct {v8, v15, v9}, Lew3;-><init>(Ltw3;B)V

    new-instance v9, Lew3;

    const/4 v10, 0x7

    invoke-direct {v9, v15, v10}, Lew3;-><init>(Ltw3;B)V

    new-instance v10, Ldw3;

    const/16 v11, 0x11

    invoke-direct {v10, v1, v11}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v11, Ldw3;

    const/16 v12, 0xc

    invoke-direct {v11, v1, v12}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v12, Ldw3;

    const/16 v13, 0xd

    invoke-direct {v12, v1, v13}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v13, Lew3;

    invoke-direct {v13, v15, v14}, Lew3;-><init>(Ltw3;B)V

    iget-object v14, v15, Ltw3;->a:Lhx3;

    invoke-virtual {v14}, Lhx3;->m()Lcom/opera/android/Lazy;

    move-result-object v38

    iget-object v14, v15, Ltw3;->x:Lzv3;

    new-instance v15, Ldw3;

    move-object/from16 v25, v2

    const/16 v2, 0xe

    invoke-direct {v15, v1, v2}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->r()Lcom/opera/android/Lazy;

    move-result-object v41

    move-object/from16 v27, v3

    move-object/from16 v28, v4

    move-object/from16 v29, v5

    move-object/from16 v30, v6

    move-object/from16 v31, v7

    move-object/from16 v32, v8

    move-object/from16 v33, v9

    move-object/from16 v34, v10

    move-object/from16 v35, v11

    move-object/from16 v36, v12

    move-object/from16 v37, v13

    move-object/from16 v39, v14

    move-object/from16 v40, v15

    invoke-direct/range {v24 .. v41}, Lor8;-><init>(Lumi;Lgjm;Ldw3;Ldw3;Ldw3;Lew3;Lew3;Lew3;Lew3;Ldw3;Ldw3;Ldw3;Lew3;Lcom/opera/android/Lazy;Lzv3;Ldw3;Lcom/opera/android/Lazy;)V

    return-object v24

    :pswitch_2ff
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lxg7;

    new-instance v2, Ldw3;

    invoke-direct {v2, v0, v3}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v3, Ldw3;

    invoke-direct {v3, v0, v7}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Lew3;

    const/4 v4, 0x2

    invoke-direct {v0, v15, v4}, Lew3;-><init>(Ltw3;B)V

    invoke-direct {v1, v2, v3, v0}, Lxg7;-><init>(Ldw3;Ldw3;Lew3;)V

    return-object v1

    :pswitch_31f
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lob6;

    iget-object v3, v15, Ltw3;->c:Lumi;

    new-instance v4, Ldw3;

    const/16 v5, 0x8

    invoke-direct {v4, v1, v5}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v0

    invoke-direct {v2, v3, v4, v0}, Lob6;-><init>(Lumi;Ldw3;Lgjm;)V

    return-object v2

    :pswitch_33c
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Ldu5;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->j()Lku5;

    move-result-object v3

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    new-instance v5, Let3;

    const/4 v7, 0x4

    invoke-direct {v5, v1, v7}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-static {v5}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v1

    invoke-direct {v2, v0, v3, v4, v1}, Ldu5;-><init>(Lndc;Lku5;Lcom/opera/android/settings/SettingsManager;Lzyk;)V

    return-object v2

    :pswitch_35e
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v4, Lkt5;

    new-instance v7, Luu1;

    const/16 v2, 0x1c

    invoke-direct {v7, v2}, Luu1;-><init>(B)V

    iget-object v8, v15, Ltw3;->z0:Lj4c;

    sget-object v2, Lxne;->b:Lii;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->t:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lnx5;

    sget-object v1, Lvml;->e:Lwjh;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v5, Lki;

    invoke-direct {v5, v0, v3}, Lki;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Lghf;

    const-string v0, "https://composer-cms.opera-api.com/api/v1/ai_prompts/for_client/ofa_chat/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v6, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v6, Ljg8;

    invoke-direct {v9, v0, v2, v6, v3}, Lghf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v1, Lwjh;->d:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Ljg8;

    sget-object v0, Ln08;->a:Ln08;

    new-instance v6, Lvx;

    const/16 v1, 0x10

    invoke-direct {v6, v5, v1}, Lvx;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->h:Lun7;

    const/4 v10, 0x7

    invoke-static {v10, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v10

    move-object v5, v0

    invoke-direct/range {v4 .. v13}, Lkt5;-><init>(Ljava/lang/Object;Lesk;Lesk;Lj4c;Lghf;JLnx5;Ljg8;)V

    return-object v4

    :pswitch_3b4
    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lvml;->d:Lumi;

    iget-object v2, v15, Ltw3;->a:Lhx3;

    iget-object v2, v2, Lhx3;->a:Lxbf;

    iget-object v2, v2, Lxbf;->e:Ljava/lang/Object;

    check-cast v2, Lj4c;

    iget-object v3, v0, Ldx3;->o:Lqim;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v3, Lqim;->c:Lz77;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v5, Lbk5;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v6

    iget-object v8, v0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Llpe;

    new-instance v9, Ls49;

    const/4 v10, 0x5

    invoke-direct {v9, v10}, Ls49;-><init>(B)V

    new-instance v10, Lik5;

    new-instance v11, Lfch;

    invoke-direct {v11, v9}, Lfch;-><init>(Lhcb;)V

    invoke-direct {v10, v1, v8, v11}, Lik5;-><init>(Lumi;Llpe;Lfch;)V

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v1

    new-instance v23, Lpw3;

    const/16 v28, 0x0

    const/16 v29, 0x4

    const-class v25, Lcom/opera/android/OperaApplication;

    const-string v26, "newsFacade"

    const-string v27, "getNewsFacade()Lcom/opera/android/news/NewsFacade;"

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v29}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v8, v23

    new-instance v9, Lwv1;

    invoke-direct {v9, v8, v14}, Lwv1;-><init>(Lb6h;B)V

    new-instance v8, Lox3;

    invoke-direct {v8, v0, v14}, Lox3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v11, Lkw3;

    invoke-direct {v11, v12}, Lkw3;-><init>(B)V

    new-instance v12, Lqb7;

    new-instance v13, Lc37;

    new-instance v15, Lvzk;

    invoke-direct {v15, v9, v8, v11}, Lvzk;-><init>(Lwv1;Lesk;Lesk;)V

    invoke-direct {v13, v1, v15}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lzy9;

    invoke-direct {v1, v2}, Lzy9;-><init>(Ljava/lang/Object;)V

    new-instance v8, Lqii;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    invoke-direct {v12, v13, v1, v8}, Lqb7;-><init>(Lc37;Lzy9;Lqii;)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    new-instance v23, Lpw3;

    const/16 v29, 0x5

    const-string v26, "newsFacade"

    const-string v27, "getNewsFacade()Lcom/opera/android/news/NewsFacade;"

    invoke-direct/range {v23 .. v29}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v8, v23

    new-instance v9, Lwv1;

    invoke-direct {v9, v8, v14}, Lwv1;-><init>(Lb6h;B)V

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v8

    new-instance v11, Lagm;

    new-instance v13, Lr9i;

    new-instance v14, Li16;

    new-instance v15, Li3j;

    invoke-direct {v15, v9, v1, v8}, Li3j;-><init>(Lwv1;Lcom/opera/android/settings/SettingsManager;Lru9;)V

    invoke-direct {v14, v1, v15, v7}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lu59;

    const/16 v8, 0x1c

    invoke-direct {v7, v2, v8}, Lu59;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Ls99;

    const/4 v8, 0x0

    invoke-direct {v2, v1, v8}, Ls99;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    invoke-direct {v13, v14, v7, v2}, Lr9i;-><init>(Li16;Lu59;Ls99;)V

    const/4 v1, 0x2

    invoke-direct {v11, v3, v13, v4, v1}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lr99;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lr99;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object/from16 v28, v1

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    move-object/from16 v25, v10

    move-object/from16 v27, v11

    move-object/from16 v26, v12

    invoke-direct/range {v23 .. v28}, Lbk5;-><init>(Ljk5;Lik5;Lqb7;Ljw1;Ljava/lang/Runnable;)V

    return-object v23

    :pswitch_48a
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v2, v15, Ltw3;->a:Lhx3;

    invoke-virtual {v2}, Lhx3;->w()Lcom/opera/android/settings/SettingsManager;

    move-result-object v23

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->d:Lx5f;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v26

    iget-object v5, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v6, 0x0

    if-nez v5, :cond_4b6

    move-object/from16 v27, v6

    goto :goto_4b8

    :cond_4b6
    move-object/from16 v27, v5

    :goto_4b8
    iget-object v5, v0, Ldx3;->l:Ltni;

    iget-object v7, v15, Ltw3;->o:Lzv3;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v29, v7

    check-cast v29, Lbq3;

    iget-object v7, v0, Lcom/opera/android/BrowserActivity;->i0:Lkze;

    iget-object v8, v15, Ltw3;->E:Lhw3;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v31, v8

    check-cast v31, Lnue;

    iget-object v8, v15, Ltw3;->F:Lhw3;

    iget-object v9, v1, Lcom/opera/android/OperaApplication;->z:Lg92;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lxnc;

    iget-object v9, v9, Lxnc;->a:Lkze;

    iget-object v10, v1, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lk3i;

    invoke-virtual {v10}, Lk3i;->a()Likc;

    move-result-object v35

    new-instance v10, Lew3;

    const/4 v11, 0x1

    invoke-direct {v10, v15, v11}, Lew3;-><init>(Ltw3;B)V

    iget-object v11, v0, Ldx3;->o:Lqim;

    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v12, v0, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-eqz v12, :cond_4fa

    move-object/from16 v40, v12

    goto :goto_4fc

    :cond_4fa
    move-object/from16 v40, v6

    :goto_4fc
    new-instance v6, Lzu3;

    invoke-direct {v6, v0}, Lzu3;-><init>(Lcom/opera/android/BrowserActivity;)V

    new-instance v12, Lpt3;

    const/16 v13, 0xe

    invoke-direct {v12, v0, v13}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v13, Ldw3;

    const/4 v15, 0x6

    invoke-direct {v13, v1, v15}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v15, Ldw3;

    const/4 v14, 0x7

    invoke-direct {v15, v1, v14}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v14, v1, Lcom/opera/android/OperaApplication;->s:Lj4c;

    iget-object v2, v2, Lhx3;->p:Lfx3;

    new-instance v21, Ljt3;

    move-object/from16 v22, v0

    new-instance v0, Let3;

    move-object/from16 v44, v2

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object/from16 v34, v0

    move-object/from16 v24, v3

    move-object/from16 v25, v4

    move-object/from16 v28, v5

    move-object/from16 v41, v6

    move-object/from16 v30, v7

    move-object/from16 v32, v8

    move-object/from16 v33, v9

    move-object/from16 v36, v10

    move-object/from16 v39, v11

    move-object/from16 v42, v12

    move-object/from16 v43, v13

    move-object/from16 v38, v14

    move-object/from16 v37, v15

    invoke-direct/range {v21 .. v44}, Ljt3;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;Lx5f;Lx5f;Lxnh;Lk6l;Ltni;Lbq3;Lkze;Lnue;Lhw3;Lkze;Let3;Likc;Lew3;Ldw3;Lj4c;Lqim;Landroid/view/View;Lzu3;Lpt3;Ldw3;Lcom/opera/android/Lazy;)V

    return-object v21

    :pswitch_544
    new-instance v0, Lbq3;

    iget-object v1, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v2, Lhv3;

    invoke-direct {v2, v1}, Lhv3;-><init>(Lcom/opera/android/BrowserActivity;)V

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-direct {v0, v2, v1}, Lbq3;-><init>(Lhv3;Lx5f;)V

    return-object v0

    :pswitch_55f
    iget-object v0, v15, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->w()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    new-instance v1, Lpo3;

    new-instance v2, Lk7d;

    iget-object v3, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v4, Lyv3;

    invoke-direct {v4, v15, v9}, Lyv3;-><init>(Ltw3;B)V

    invoke-direct {v2, v3, v0, v4}, Lk7d;-><init>(Landroid/app/Activity;Lcom/opera/android/settings/SettingsManager;Lyv3;)V

    new-instance v3, Ly8l;

    new-instance v4, Lew3;

    const/4 v8, 0x0

    invoke-direct {v4, v15, v8}, Lew3;-><init>(Ltw3;B)V

    invoke-direct {v3, v0, v4}, Ly8l;-><init>(Lcom/opera/android/settings/SettingsManager;Lew3;)V

    invoke-direct {v1, v2, v3}, Lpo3;-><init>(Lk7d;Ly8l;)V

    return-object v1

    :pswitch_582
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Llm3;

    new-instance v2, Lyv3;

    const/16 v3, 0x1b

    invoke-direct {v2, v15, v3}, Lyv3;-><init>(Ltw3;B)V

    new-instance v3, Lyv3;

    const/16 v8, 0x1c

    invoke-direct {v3, v15, v8}, Lyv3;-><init>(Ltw3;B)V

    new-instance v4, Ldw3;

    const/4 v7, 0x4

    invoke-direct {v4, v0, v7}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Ldw3;

    const/4 v12, 0x5

    invoke-direct {v5, v0, v12}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v15, Ltw3;->a:Lhx3;

    iget-object v6, v0, Lhx3;->p:Lfx3;

    invoke-direct/range {v1 .. v6}, Llm3;-><init>(Lyv3;Lyv3;Ldw3;Ldw3;Lcom/opera/android/Lazy;)V

    return-object v1

    :pswitch_5b0
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->o:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsi3;

    new-instance v1, Lij3;

    iget-object v2, v0, Lsi3;->b:Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lech;

    iget-object v3, v0, Lsi3;->o:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcj3;

    iget-object v4, v0, Lsi3;->p:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-object v0, v0, Lsi3;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf9d;

    invoke-direct {v1, v2, v3, v4, v0}, Lij3;-><init>(Lech;Lcj3;Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;Lf9d;)V

    return-object v1

    :pswitch_5ec
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lzv3;->f:Ltw3;

    iget-object v1, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    new-instance v4, Lit2;

    iget-object v7, v0, Ltw3;->c:Lumi;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v1

    new-instance v11, Lyv3;

    invoke-direct {v11, v0, v13}, Lyv3;-><init>(Ltw3;B)V

    new-instance v12, Lyv3;

    const/16 v13, 0x1a

    invoke-direct {v12, v0, v13}, Lyv3;-><init>(Ltw3;B)V

    new-instance v13, Ldw3;

    const/4 v14, 0x1

    invoke-direct {v13, v3, v14}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v14, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v14}, Lhx3;->u()Lcom/opera/android/Lazy;

    move-result-object v15

    invoke-virtual {v14}, Lhx3;->j()Lcom/opera/android/Lazy;

    move-result-object v30

    invoke-virtual {v14}, Lhx3;->c()Lcom/opera/android/Lazy;

    move-result-object v31

    new-instance v2, Ldw3;

    const/4 v9, 0x2

    invoke-direct {v2, v3, v9}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v9, Ldw3;

    const/4 v5, 0x3

    invoke-direct {v9, v3, v5}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v5, v14, Lhx3;->a:Lxbf;

    iget-object v5, v5, Lxbf;->b:Ljava/lang/Object;

    check-cast v5, Lmi;

    iget-object v5, v5, Lmi;->z:Lhi;

    new-instance v6, Lji;

    const/16 v8, 0x1a

    invoke-direct {v6, v3, v8}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v14}, Lhx3;->l()Lcom/opera/android/Lazy;

    move-result-object v36

    new-instance v8, Lji;

    const/16 v10, 0x1b

    invoke-direct {v8, v3, v10}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v23, Lpv3;

    const/16 v28, 0x0

    const/16 v29, 0x1a

    const-class v25, Ltw3;

    const-string v26, "accountStatusProvider"

    const-string v27, "getAccountStatusProvider()Lcom/opera/android/account/AccountStatusProvider;"

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v29}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v25, v1

    move-object/from16 v0, v23

    move-object/from16 v10, v24

    new-instance v1, Lwv1;

    move-object/from16 p0, v2

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lwv1;-><init>(Lb6h;B)V

    new-instance v0, Lji;

    const/16 v2, 0x1c

    invoke-direct {v0, v3, v2}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Lyv3;

    move-object/from16 v39, v0

    const/16 v0, 0x15

    invoke-direct {v2, v10, v0}, Lyv3;-><init>(Ltw3;B)V

    new-instance v0, Lyv3;

    move-object/from16 v38, v1

    const/16 v1, 0x16

    invoke-direct {v0, v10, v1}, Lyv3;-><init>(Ltw3;B)V

    new-instance v1, Lyv3;

    move-object/from16 v41, v0

    const/16 v0, 0x17

    invoke-direct {v1, v10, v0}, Lyv3;-><init>(Ltw3;B)V

    new-instance v0, Lyv3;

    move-object/from16 v42, v1

    const/16 v1, 0x18

    invoke-direct {v0, v10, v1}, Lyv3;-><init>(Ltw3;B)V

    iget-object v1, v10, Ltw3;->a:Lhx3;

    iget-object v1, v1, Lhx3;->a:Lxbf;

    iget-object v1, v1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lmi;

    iget-object v1, v1, Lmi;->o:Lhi;

    move-object/from16 v43, v0

    new-instance v0, Lji;

    move-object/from16 v44, v1

    const/16 v1, 0x1d

    invoke-direct {v0, v3, v1}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v1, Lyv3;

    move-object/from16 v45, v0

    const/16 v0, 0x19

    invoke-direct {v1, v10, v0}, Lyv3;-><init>(Ltw3;B)V

    new-instance v0, Ldw3;

    const/4 v10, 0x0

    invoke-direct {v0, v3, v10}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v14}, Lhx3;->v()Lcom/opera/android/Lazy;

    move-result-object v48

    iget-object v3, v14, Lhx3;->a:Lxbf;

    iget-object v3, v3, Lxbf;->b:Ljava/lang/Object;

    check-cast v3, Lmi;

    iget-object v3, v3, Lmi;->l:Lhi;

    invoke-virtual {v14}, Lhx3;->g()Lcom/opera/android/Lazy;

    move-result-object v50

    move-object/from16 v32, p0

    move-object/from16 v47, v0

    move-object/from16 v46, v1

    move-object/from16 v40, v2

    move-object/from16 v49, v3

    move-object/from16 v23, v4

    move-object/from16 v34, v5

    move-object/from16 v35, v6

    move-object/from16 v24, v7

    move-object/from16 v37, v8

    move-object/from16 v33, v9

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    move-object/from16 v29, v15

    invoke-direct/range {v23 .. v50}, Lit2;-><init>(Lumi;Lgjm;Lyv3;Lyv3;Ldw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Ldw3;Ldw3;Lcom/opera/android/Lazy;Lji;Lcom/opera/android/Lazy;Lji;Lwv1;Lji;Lyv3;Lyv3;Lyv3;Lyv3;Lcom/opera/android/Lazy;Lji;Lyv3;Ldw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;)V

    return-object v23

    :pswitch_6e6
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/OperaApplication;

    new-instance v1, Lcg2;

    new-instance v3, Lq2;

    iget-object v7, v15, Ltw3;->u:Lii;

    const/4 v11, 0x0

    const/16 v12, 0xc

    const/4 v6, 0x0

    const-class v8, Lcom/opera/android/Lazy;

    const-string v9, "get"

    const-string v10, "get()Ljava/lang/Object;"

    move-object v5, v3

    invoke-direct/range {v5 .. v12}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v0, v5

    new-instance v3, Lpv3;

    const/4 v8, 0x0

    const/16 v9, 0x18

    const-class v5, Lcom/opera/android/OperaApplication;

    const-string v6, "mediaPlayerManager"

    const-string v7, "getMediaPlayerManager()Lcom/opera/android/media/PlayerManager;"

    invoke-direct/range {v3 .. v9}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v10, v3

    new-instance v11, Lcw3;

    const/4 v8, 0x0

    invoke-direct {v11, v15, v8}, Lcw3;-><init>(Ltw3;B)V

    new-instance v12, Lcw3;

    const/4 v14, 0x1

    invoke-direct {v12, v15, v14}, Lcw3;-><init>(Ltw3;B)V

    new-instance v13, Lcw3;

    const/4 v9, 0x2

    invoke-direct {v13, v15, v9}, Lcw3;-><init>(Ltw3;B)V

    new-instance v14, Lcw3;

    const/4 v3, 0x3

    invoke-direct {v14, v15, v3}, Lcw3;-><init>(Ltw3;B)V

    new-instance v3, Lpv3;

    const/4 v8, 0x0

    const/16 v9, 0x19

    const-string v6, "usageReporter"

    const-string v7, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v3 .. v9}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v5, v10

    new-instance v10, Lji;

    const/16 v6, 0x19

    invoke-direct {v10, v4, v6}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object v4, v5

    move-object v5, v11

    iget-object v11, v2, Lcom/opera/android/BrowserActivity;->f0:Lkze;

    move-object v9, v3

    move-object v6, v12

    move-object v7, v13

    move-object v8, v14

    move-object v3, v0

    invoke-direct/range {v1 .. v11}, Lcg2;-><init>(Lndc;Lq2;Lpv3;Lcw3;Lcw3;Lcw3;Lcw3;Lpv3;Lji;Lkze;)V

    return-object v1

    :pswitch_74e
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lzv3;->f:Ltw3;

    iget-object v1, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v3, v0, Ltw3;->c:Lumi;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v36

    new-instance v5, Lji;

    const/16 v6, 0x16

    invoke-direct {v5, v2, v6}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v38

    iget-object v6, v0, Ltw3;->j:Lj4c;

    iget-object v7, v0, Ltw3;->a:Lhx3;

    iget-object v7, v7, Lhx3;->q:Lfx3;

    new-instance v23, Lpv3;

    const/16 v28, 0x0

    const/16 v29, 0x17

    const-class v25, Ltw3;

    const-string v26, "accountStatusProvider"

    const-string v27, "getAccountStatusProvider()Lcom/opera/android/account/AccountStatusProvider;"

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v29}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v0, v23

    move-object/from16 v8, v24

    new-instance v9, Lwv1;

    const/4 v10, 0x2

    invoke-direct {v9, v0, v10}, Lwv1;-><init>(Lb6h;B)V

    new-instance v0, Lyv3;

    const/16 v10, 0x11

    invoke-direct {v0, v8, v10}, Lyv3;-><init>(Ltw3;B)V

    new-instance v10, Lyv3;

    invoke-direct {v10, v8, v11}, Lyv3;-><init>(Ltw3;B)V

    iget-object v11, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v11, v11, Lxv1;->m1:Lj4c;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v11

    move-object/from16 v44, v11

    check-cast v44, Lwyn;

    iget-object v11, v8, Ltw3;->s0:Lj4c;

    iget-object v12, v8, Ltw3;->c0:Lzv3;

    iget-object v13, v8, Ltw3;->d0:Lzv3;

    iget-object v14, v8, Ltw3;->b0:Lzv3;

    new-instance v15, Lyv3;

    invoke-direct {v15, v8, v4}, Lyv3;-><init>(Ltw3;B)V

    new-instance v4, Lji;

    move-object/from16 v42, v0

    const/16 v0, 0x17

    invoke-direct {v4, v2, v0}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Lji;

    move-object/from16 v25, v1

    const/16 v1, 0x18

    invoke-direct {v0, v2, v1}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v1, v8, Ltw3;->e:Lzv3;

    new-instance v53, Lr2;

    const/16 v29, 0x0

    const/16 v30, 0xd

    const/16 v24, 0x1

    const-class v26, Lcom/opera/android/BrowserActivity;

    const-string v27, "getEncryptionKeyForOpenAiAssistant"

    const-string v28, "getEncryptionKeyForOpenAiAssistant(Lcom/opera/api/Callback;)V"

    move-object/from16 v23, v53

    invoke-direct/range {v23 .. v30}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v33, Lj62;

    move-object/from16 v50, v0

    move-object/from16 v51, v1

    move-object/from16 v35, v3

    move-object/from16 v49, v4

    move-object/from16 v37, v5

    move-object/from16 v39, v6

    move-object/from16 v40, v7

    move-object/from16 v41, v9

    move-object/from16 v43, v10

    move-object/from16 v52, v11

    move-object/from16 v45, v12

    move-object/from16 v46, v13

    move-object/from16 v47, v14

    move-object/from16 v48, v15

    move-object/from16 v34, v25

    invoke-direct/range {v33 .. v53}, Lj62;-><init>(Ldx3;Lumi;Lgjm;Lji;Lj4c;Lj4c;Lcom/opera/android/Lazy;Lwv1;Lyv3;Lyv3;Lwyn;Lzv3;Lzv3;Lzv3;Lyv3;Lji;Lji;Lzv3;Lj4c;Lr2;)V

    return-object v33

    :pswitch_7fc
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lq52;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v1

    iget-object v3, v15, Ltw3;->c0:Lzv3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lk42;

    invoke-direct {v2, v0, v1, v3}, Lq52;-><init>(Lndc;Lxb;Lk42;)V

    return-object v2

    :pswitch_818
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lk42;

    new-instance v2, Lji;

    invoke-direct {v2, v0, v13}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v3, Lji;

    const/16 v4, 0x15

    invoke-direct {v3, v0, v4}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {v1, v2, v3}, Lk42;-><init>(Lji;Lji;)V

    return-object v1

    :pswitch_834
    new-instance v0, Li12;

    iget-object v1, v15, Ltw3;->c:Lumi;

    invoke-direct {v0, v1}, Li12;-><init>(Lumi;)V

    return-object v0

    :pswitch_83c
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Ll02;

    new-instance v2, Lji;

    invoke-direct {v2, v0, v4}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Lyv3;

    const/16 v3, 0xf

    invoke-direct {v0, v15, v3}, Lyv3;-><init>(Ltw3;B)V

    new-instance v3, Lyv3;

    const/16 v6, 0x10

    invoke-direct {v3, v15, v6}, Lyv3;-><init>(Ltw3;B)V

    invoke-direct {v1, v2, v0, v3}, Ll02;-><init>(Lji;Lyv3;Lyv3;)V

    return-object v1

    :pswitch_85f
    iget-object v0, v15, Ltw3;->g:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgz1;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v0, Lgz1;->a:Landroid/content/Context;

    iget-object v3, v0, Lgz1;->b:Lumi;

    iget-object v1, v0, Lgz1;->f:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ll32;

    iget-object v1, v0, Lgz1;->d:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lkul;

    iget-object v1, v0, Lgz1;->g:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lbw3;

    new-instance v9, Lk51;

    const/16 v1, 0x19

    invoke-direct {v9, v1}, Lk51;-><init>(B)V

    iget-object v1, v0, Lgz1;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lnx5;

    iget-object v0, v0, Lgz1;->c:Lwjh;

    iget-object v0, v0, Lwjh;->d:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ljg8;

    new-instance v1, Ltz1;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v4, Lcom/opera/android/webaiassistant/db/HistoryDatabase;

    const-string v7, "ai_history"

    invoke-static {v0, v4, v7}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object v0

    invoke-virtual {v0}, Lu5i;->b()Ly5i;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/webaiassistant/db/HistoryDatabase;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v7

    invoke-direct/range {v1 .. v11}, Ltz1;-><init>(Landroid/content/Context;Lumi;Lcom/opera/android/webaiassistant/db/HistoryDatabase;Ll32;Lkul;Lru9;Lbw3;Lk51;Lnx5;Ljg8;)V

    return-object v1

    :pswitch_8bd
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v5, v2, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v6, v2, Ld6j;->d:Lx5f;

    iget-object v7, v0, Lcom/opera/android/BrowserActivity;->d0:Lwth;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->K:Lhw3;

    new-instance v3, Luv0;

    new-instance v8, Let3;

    const/4 v9, 0x2

    invoke-direct {v8, v1, v9}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct/range {v3 .. v8}, Luv0;-><init>(Lcom/opera/android/settings/SettingsManager;Lx5f;Lx5f;Lwth;Let3;)V

    return-object v3

    :pswitch_8e9
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v15, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lqb;

    new-instance v3, Lji;

    invoke-direct {v3, v1, v11}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v1

    new-instance v4, Lyv3;

    const/16 v5, 0xe

    invoke-direct {v4, v15, v5}, Lyv3;-><init>(Ltw3;B)V

    invoke-direct {v2, v3, v1, v0, v4}, Lqb;-><init>(Lji;Lxb;Lndc;Lyv3;)V

    return-object v2

    nop

    :pswitch_data_90a
    .packed-switch 0x0
        :pswitch_8e9
        :pswitch_8bd
        :pswitch_85f
        :pswitch_83c
        :pswitch_834
        :pswitch_818
        :pswitch_7fc
        :pswitch_74e
        :pswitch_6e6
        :pswitch_5ec
        :pswitch_5b0
        :pswitch_582
        :pswitch_55f
        :pswitch_544
        :pswitch_48a
        :pswitch_3b4
        :pswitch_35e
        :pswitch_33c
        :pswitch_31f
        :pswitch_2ff
        :pswitch_271
        :pswitch_23f
        :pswitch_171
        :pswitch_162
        :pswitch_150
        :pswitch_f6
        :pswitch_c7
        :pswitch_ba
        :pswitch_49
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lzv3;->e:B

    packed-switch v0, :pswitch_data_16

    return-void

    :pswitch_6
    check-cast p1, Lbk5;

    new-instance v0, Lbi2;

    const/16 v1, 0x14

    iget-object p0, p0, Lzv3;->f:Ltw3;

    invoke-direct {v0, p0, p1, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0xf
        :pswitch_6
    .end packed-switch
.end method
