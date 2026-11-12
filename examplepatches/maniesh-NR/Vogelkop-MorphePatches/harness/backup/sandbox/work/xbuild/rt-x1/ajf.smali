.class public final Lajf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Lcom/opera/android/autofill/OperaAutofillService;

.field public final synthetic b:Landroid/service/autofill/FillRequest;

.field public final synthetic c:Landroid/os/CancellationSignal;

.field public final synthetic d:Landroid/service/autofill/FillCallback;

.field public final synthetic e:Landroid/service/autofill/FillCallback;


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/OperaAutofillService;Landroid/service/autofill/FillRequest;Landroid/os/CancellationSignal;Landroid/service/autofill/FillCallback;Landroid/service/autofill/FillCallback;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lajf;->a:Lcom/opera/android/autofill/OperaAutofillService;

    iput-object p2, p0, Lajf;->b:Landroid/service/autofill/FillRequest;

    iput-object p3, p0, Lajf;->c:Landroid/os/CancellationSignal;

    iput-object p4, p0, Lajf;->d:Landroid/service/autofill/FillCallback;

    iput-object p5, p0, Lajf;->e:Landroid/service/autofill/FillCallback;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    iget-object v3, v0, Lajf;->a:Lcom/opera/android/autofill/OperaAutofillService;

    iget-object v2, v3, Lcom/opera/android/autofill/OperaAutofillService;->a:Lzyk;

    instance-of v4, v1, Lrw7;

    const/4 v11, 0x2

    const/4 v12, 0x0

    const/4 v13, 0x1

    if-eqz v4, :cond_31

    check-cast v1, Lrw7;

    iget-object v1, v1, Lrw7;->a:Ljava/lang/Object;

    check-cast v1, Ljd6;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    iget-object v0, v0, Lajf;->e:Landroid/service/autofill/FillCallback;

    if-eqz v1, :cond_2b

    if-eq v1, v13, :cond_2b

    if-ne v1, v11, :cond_27

    invoke-virtual {v0, v12}, Landroid/service/autofill/FillCallback;->onSuccess(Landroid/service/autofill/FillResponse;)V

    return-void

    :cond_27
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2b
    const-string v1, "DataSourceFactory is not initialized yet."

    invoke-virtual {v0, v1}, Landroid/service/autofill/FillCallback;->onFailure(Ljava/lang/CharSequence;)V

    return-void

    :cond_31
    instance-of v4, v1, Lsw7;

    if-eqz v4, :cond_417

    check-cast v1, Lsw7;

    iget-object v1, v1, Lsw7;->a:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Las2;

    move-object v1, v2

    new-instance v2, Lm39;

    sget v5, Lcom/opera/android/autofill/OperaAutofillService;->d:I

    new-instance v14, Lx77;

    iget-object v5, v3, Lcom/opera/android/autofill/OperaAutofillService;->c:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lrye;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxu2;

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v16

    new-instance v5, Lzif;

    invoke-direct {v5, v3, v13}, Lzif;-><init>(Lcom/opera/android/autofill/OperaAutofillService;B)V

    const/16 v19, 0xb

    const/16 v18, 0x0

    move-object/from16 v17, v5

    invoke-direct/range {v14 .. v19}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxu2;

    check-cast v5, Lcom/opera/android/OperaApplication;

    iget-object v5, v5, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v5, v5, Lxv1;->j:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lub2;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxu2;

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v7

    iget-object v8, v0, Lajf;->b:Landroid/service/autofill/FillRequest;

    iget-object v9, v0, Lajf;->c:Landroid/os/CancellationSignal;

    iget-object v10, v0, Lajf;->d:Landroid/service/autofill/FillCallback;

    move-object v5, v14

    invoke-direct/range {v2 .. v10}, Lm39;-><init>(Landroid/content/Context;Las2;Lx77;Lub2;Lvu2;Landroid/service/autofill/FillRequest;Landroid/os/CancellationSignal;Landroid/service/autofill/FillCallback;)V

    invoke-virtual {v8}, Landroid/service/autofill/FillRequest;->getFillContexts()Ljava/util/List;

    move-result-object v0

    invoke-virtual {v14, v0}, Lx77;->k(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lg39;

    const/4 v4, 0x0

    if-eqz v1, :cond_cf

    iget-object v1, v1, Lg39;->a:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-interface {v1, v5}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    :cond_aa
    invoke-interface {v1}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v5

    if-eqz v5, :cond_bc

    invoke-interface {v1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lk2g;

    instance-of v6, v6, Ld16;

    if-eqz v6, :cond_aa

    goto :goto_bd

    :cond_bc
    move-object v5, v12

    :goto_bd
    check-cast v5, Lk2g;

    new-instance v1, Lxr2;

    invoke-virtual {v8}, Landroid/service/autofill/FillRequest;->getFlags()I

    move-result v6

    and-int/2addr v6, v13

    if-ne v6, v13, :cond_ca

    move v6, v13

    goto :goto_cb

    :cond_ca
    move v6, v4

    :goto_cb
    invoke-direct {v1, v0, v6, v5}, Lxr2;-><init>(Ljava/util/ArrayList;ZLk2g;)V

    goto :goto_d0

    :cond_cf
    move-object v1, v12

    :goto_d0
    if-eqz v1, :cond_d5

    iget-object v0, v1, Lxr2;->c:Lk2g;

    goto :goto_d6

    :cond_d5
    move-object v0, v12

    :goto_d6
    if-eqz v0, :cond_412

    instance-of v5, v0, Ld16;

    if-eqz v5, :cond_412

    move-object v5, v0

    check-cast v5, Ld16;

    iget-object v6, v5, Ld16;->c:[Lvz8;

    iget-object v7, v5, Ld16;->d:Lj2g;

    invoke-virtual {v2}, Lm39;->b()Ls45;

    move-result-object v8

    iget-boolean v9, v7, Lj2g;->b:Z

    iget-object v14, v7, Lj2g;->a:Ljava/lang/String;

    if-eqz v9, :cond_f6

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-static {v9, v14}, Lrab;->c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_102

    :cond_f6
    invoke-static {v14}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lnxg;->e(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_102
    iget-object v15, v8, Ls45;->a:Landroid/os/Bundle;

    if-nez v15, :cond_10d

    new-instance v15, Landroid/os/Bundle;

    invoke-direct {v15}, Landroid/os/Bundle;-><init>()V

    iput-object v15, v8, Ls45;->a:Landroid/os/Bundle;

    :cond_10d
    const-string v8, "com.opera.android.autofill.EXTRA_DOMAIN"

    invoke-virtual {v15, v8, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    instance-of v8, v7, Li2g;

    const-string v9, ""

    if-eqz v8, :cond_1bc

    iget-object v8, v2, Lm39;->c:Lub2;

    if-eqz v8, :cond_1bc

    move-object v15, v7

    check-cast v15, Li2g;

    iget-object v15, v15, Li2g;->c:Ljava/lang/String;

    :try_start_121
    new-instance v12, Lugb;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v12, v15}, Lugb;-><init>(Ljava/lang/String;)V
    :try_end_129
    .catch Ljava/lang/IllegalArgumentException; {:try_start_121 .. :try_end_129} :catch_12b
    .catch Ljava/lang/IllegalStateException; {:try_start_121 .. :try_end_129} :catch_155

    move v12, v13

    goto :goto_12c

    :catch_12b
    move v12, v4

    :goto_12c
    if-eqz v12, :cond_155

    :try_start_12e
    new-instance v12, Lugb;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v12, v15}, Lugb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lugb;->a()I

    move-result v16

    if-lez v16, :cond_13f

    move/from16 v16, v13

    goto :goto_141

    :cond_13f
    move/from16 v16, v4

    :goto_141
    if-nez v16, :cond_155

    sget-object v11, Lx7d;->i:[Ljava/lang/String;

    invoke-virtual {v12}, Lugb;->b()Lugb;

    move-result-object v12

    iget-object v12, v12, Lugb;->b:Lh1b;

    invoke-static {v12}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v12, v11}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result v11
    :try_end_153
    .catch Ljava/lang/IllegalStateException; {:try_start_12e .. :try_end_153} :catch_155
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12e .. :try_end_153} :catch_155

    if-gez v11, :cond_1bc

    :catch_155
    :cond_155
    :try_start_155
    invoke-static {v15}, Lub2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11
    :try_end_159
    .catch Ljava/lang/IllegalArgumentException; {:try_start_155 .. :try_end_159} :catch_1bc

    iget-object v12, v8, Lub2;->a:Lumi;

    new-instance v15, Lrml;

    sget-object v13, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v15, v13, v12}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v12, Ltb2;

    invoke-direct {v12, v8, v11, v4}, Ltb2;-><init>(Lub2;Ljava/lang/String;B)V

    invoke-virtual {v15, v12}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v12

    iget-object v13, v12, Lplk;->a:Ljava/lang/Object;

    check-cast v13, Ltcl;

    new-instance v15, Ltb2;

    const/4 v4, 0x1

    invoke-direct {v15, v8, v11, v4}, Ltb2;-><init>(Lub2;Ljava/lang/String;B)V

    iget-object v4, v12, Lplk;->c:Ljava/lang/Object;

    check-cast v4, Leyi;

    move-object/from16 v18, v9

    iget-boolean v9, v4, Leyi;->b:Z

    if-nez v9, :cond_1b8

    new-instance v9, Lplk;

    move-object/from16 v19, v14

    new-instance v14, Lcrk;

    move-object/from16 v20, v0

    const/16 v0, 0xd

    invoke-direct {v14, v15, v0}, Lcrk;-><init>(Ljava/lang/Object;B)V

    move-object v0, v13

    check-cast v0, Lumi;

    invoke-virtual {v0, v14}, Lumi;->g(Ln5o;)Lnml;

    move-result-object v14

    invoke-direct {v9, v13, v14, v4, v12}, Lplk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v12, Ltb2;

    const/4 v14, 0x2

    invoke-direct {v12, v8, v11, v14}, Ltb2;-><init>(Lub2;Ljava/lang/String;B)V

    iget-boolean v8, v4, Leyi;->b:Z

    if-nez v8, :cond_1b4

    new-instance v8, Lplk;

    new-instance v11, Lcrk;

    const/16 v14, 0xe

    invoke-direct {v11, v12, v14}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v11}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    invoke-direct {v8, v13, v0, v4, v9}, Lplk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v8}, Lplk;->l()Loml;

    goto :goto_1c2

    :cond_1b4
    invoke-static/range {v18 .. v18}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_1b8
    invoke-static/range {v18 .. v18}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :catch_1bc
    :cond_1bc
    move-object/from16 v20, v0

    move-object/from16 v18, v9

    move-object/from16 v19, v14

    :goto_1c2
    array-length v0, v6

    const/4 v4, 0x0

    :goto_1c4
    if-ge v4, v0, :cond_203

    aget-object v8, v6, v4

    iget-object v9, v8, Lvz8;->c:Lnf2;

    iget-object v8, v8, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    packed-switch v9, :pswitch_data_41c

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_1d7
    invoke-virtual {v2}, Lm39;->b()Ls45;

    move-result-object v9

    iget-object v11, v9, Ls45;->a:Landroid/os/Bundle;

    if-nez v11, :cond_1e6

    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    iput-object v11, v9, Ls45;->a:Landroid/os/Bundle;

    :cond_1e6
    const-string v9, "com.opera.android.autofill.EXTRA_PASSWORD_FIELD_ID"

    invoke-virtual {v11, v9, v8}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_200

    :pswitch_1ec
    invoke-virtual {v2}, Lm39;->b()Ls45;

    move-result-object v9

    iget-object v11, v9, Ls45;->a:Landroid/os/Bundle;

    if-nez v11, :cond_1fb

    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    iput-object v11, v9, Ls45;->a:Landroid/os/Bundle;

    :cond_1fb
    const-string v9, "com.opera.android.autofill.EXTRA_USER_FIELD_ID"

    invoke-virtual {v11, v9, v8}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :goto_200
    :pswitch_200
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c4

    :cond_203
    iget-object v0, v1, Lxr2;->a:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v8, 0x0

    :goto_20f
    if-ge v8, v4, :cond_221

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lg39;

    iget-object v9, v9, Lg39;->a:Ljava/util/List;

    check-cast v9, Ljava/lang/Iterable;

    invoke-static {v9, v1}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_20f

    :cond_221
    invoke-virtual {v2}, Lm39;->b()Ls45;

    move-result-object v0

    new-instance v4, Ldv4;

    invoke-direct {v4, v1, v0}, Ldv4;-><init>(Ljava/util/ArrayList;Ls45;)V

    iget-boolean v0, v4, Ldv4;->a:Z

    if-eqz v0, :cond_3aa

    new-instance v0, Landroid/service/autofill/FillResponse$Builder;

    invoke-direct {v0}, Landroid/service/autofill/FillResponse$Builder;-><init>()V

    invoke-virtual {v2}, Lm39;->b()Ls45;

    move-result-object v1

    iget-object v1, v1, Ls45;->a:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/service/autofill/FillResponse$Builder;->setClientState(Landroid/os/Bundle;)Landroid/service/autofill/FillResponse$Builder;

    invoke-virtual {v2}, Lm39;->c()Landroid/widget/inline/InlinePresentationSpec;

    move-result-object v1

    sget v4, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v8, "com.opera.android.autofill.EXTRA_PARTITION"

    invoke-virtual {v4, v8, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x1e

    if-lt v8, v9, :cond_257

    const-string v8, "com.opera.android.autofill.EXTRA_INLINE_SPEC"

    invoke-virtual {v4, v8, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_257
    new-instance v8, Landroid/content/Intent;

    const-class v11, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-direct {v8, v3, v11}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v11, "com.opera.android.autofill.ACTION_ADD_PASSWORD"

    invoke-virtual {v8, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v8

    const-string v11, "com.opera.android.autofill.EXTRA_BUNDLE"

    invoke-virtual {v8, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v4

    const/high16 v8, 0x12000000

    const/4 v11, 0x0

    invoke-static {v3, v11, v4, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    if-eqz v1, :cond_279

    new-instance v8, Lynk;

    invoke-direct {v8, v1, v4}, Lynk;-><init>(Landroid/widget/inline/InlinePresentationSpec;Landroid/app/PendingIntent;)V

    goto :goto_27a

    :cond_279
    const/4 v8, 0x0

    :goto_27a
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lfsp;->v()Ljava/lang/String;

    move-result-object v12

    array-length v13, v6

    move v14, v11

    :goto_285
    if-ge v14, v13, :cond_308

    aget-object v15, v6, v14

    iget-object v11, v15, Lvz8;->c:Lnf2;

    sget-object v9, Lnf2;->g:Lnf2;

    if-eq v11, v9, :cond_29a

    sget-object v9, Lnf2;->m:Lnf2;

    if-eq v11, v9, :cond_29a

    move-object/from16 v21, v4

    move-object/from16 v22, v6

    move-object/from16 v23, v8

    goto :goto_2fe

    :cond_29a
    new-instance v9, Log6;

    iget-object v11, v15, Lvz8;->d:Lp09;

    invoke-virtual {v11, v12}, Lp09;->d(Ljava/lang/String;)Landroid/view/autofill/AutofillValue;

    move-result-object v17

    new-instance v11, Landroid/widget/RemoteViews;

    move-object/from16 v21, v4

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v22, v6

    const v6, 0x7f0d03ca

    invoke-direct {v11, v4, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1e

    if-lt v4, v6, :cond_2e8

    if-eqz v8, :cond_2e8

    iget-object v4, v8, Lynk;->a:Landroid/widget/inline/InlinePresentationSpec;

    const v6, 0x7f1402ad

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v16, v9

    iget-object v9, v8, Lynk;->b:Landroid/app/PendingIntent;

    move-object/from16 v23, v8

    new-instance v8, Lx79;

    invoke-direct {v8, v9}, Lx79;-><init>(Landroid/app/PendingIntent;)V

    iput-object v6, v8, Lx79;->d:Ljava/lang/Object;

    iput-object v6, v8, Lx79;->e:Ljava/lang/Object;

    const v6, 0x7f080606

    invoke-static {v3, v6}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v6

    iput-object v6, v8, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {v8}, Lx79;->j()Lh8b;

    move-result-object v6

    iget-object v6, v6, Lh8b;->a:Landroid/app/slice/Slice;

    invoke-static {v6, v4}, Ldz0;->g(Landroid/app/slice/Slice;Landroid/widget/inline/InlinePresentationSpec;)Landroid/service/autofill/InlinePresentation;

    move-result-object v4

    move-object/from16 v20, v4

    goto :goto_2ee

    :cond_2e8
    move-object/from16 v23, v8

    move-object/from16 v16, v9

    const/16 v20, 0x0

    :goto_2ee
    const/16 v19, 0x0

    move-object/from16 v18, v16

    move-object/from16 v16, v15

    move-object/from16 v15, v18

    move-object/from16 v18, v11

    invoke-direct/range {v15 .. v20}, Log6;-><init>(Lvz8;Landroid/view/autofill/AutofillValue;Landroid/widget/RemoteViews;Landroid/widget/RemoteViews;Landroid/service/autofill/InlinePresentation;)V

    invoke-virtual {v1, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2fe
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v4, v21

    move-object/from16 v6, v22

    move-object/from16 v8, v23

    goto/16 :goto_285

    :cond_308
    move-object/from16 v21, v4

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_35b

    invoke-virtual/range {v21 .. v21}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v4

    new-instance v6, Landroid/service/autofill/Dataset$Builder;

    invoke-direct {v6}, Landroid/service/autofill/Dataset$Builder;-><init>()V

    const-string v8, "suggest-password"

    invoke-virtual {v6, v8}, Landroid/service/autofill/Dataset$Builder;->setId(Ljava/lang/String;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/service/autofill/Dataset$Builder;->setAuthentication(Landroid/content/IntentSender;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v8, 0x0

    :goto_328
    if-ge v8, v6, :cond_356

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Log6;

    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x21

    if-lt v11, v12, :cond_33c

    invoke-static {v4, v9}, Lt8;->e(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_328

    :cond_33c
    const/16 v12, 0x1f

    if-lt v11, v12, :cond_344

    invoke-static {v4, v9}, Lr9n;->a(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_328

    :cond_344
    const/16 v12, 0x1e

    if-lt v11, v12, :cond_34c

    invoke-static {v4, v9}, Lr9n;->c(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_328

    :cond_34c
    iget-object v11, v9, Log6;->a:Lvz8;

    iget-object v11, v11, Lvz8;->a:Landroid/view/autofill/AutofillId;

    iget-object v9, v9, Log6;->b:Landroid/view/autofill/AutofillValue;

    invoke-virtual {v4, v11, v9}, Landroid/service/autofill/Dataset$Builder;->setValue(Landroid/view/autofill/AutofillId;Landroid/view/autofill/AutofillValue;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_328

    :cond_356
    invoke-virtual {v4}, Landroid/service/autofill/Dataset$Builder;->build()Landroid/service/autofill/Dataset;

    move-result-object v12

    goto :goto_35c

    :cond_35b
    const/4 v12, 0x0

    :goto_35c
    if-nez v12, :cond_367

    invoke-virtual {v0}, Landroid/service/autofill/FillResponse$Builder;->build()Landroid/service/autofill/FillResponse;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/service/autofill/FillCallback;->onSuccess(Landroid/service/autofill/FillResponse;)V

    goto/16 :goto_411

    :cond_367
    invoke-virtual {v0, v12}, Landroid/service/autofill/FillResponse$Builder;->addDataset(Landroid/service/autofill/Dataset;)Landroid/service/autofill/FillResponse$Builder;

    invoke-virtual {v2}, Lm39;->c()Landroid/widget/inline/InlinePresentationSpec;

    move-result-object v1

    invoke-virtual {v5, v3, v1}, Ld16;->d(Landroid/content/Context;Landroid/widget/inline/InlinePresentationSpec;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_376
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_386

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/service/autofill/Dataset;

    invoke-virtual {v0, v3}, Landroid/service/autofill/FillResponse$Builder;->addDataset(Landroid/service/autofill/Dataset;)Landroid/service/autofill/FillResponse$Builder;

    goto :goto_376

    :cond_386
    instance-of v1, v7, Lh2g;

    if-eqz v1, :cond_396

    check-cast v7, Lh2g;

    iget-object v1, v7, Lh2g;->d:Lsq2;

    iget-boolean v1, v1, Lsq2;->c:Z

    if-eqz v1, :cond_399

    invoke-virtual {v2, v0, v5}, Lm39;->a(Landroid/service/autofill/FillResponse$Builder;Ld16;)V

    goto :goto_399

    :cond_396
    invoke-virtual {v2, v0, v5}, Lm39;->a(Landroid/service/autofill/FillResponse$Builder;Ld16;)V

    :cond_399
    :goto_399
    iget-object v1, v2, Lm39;->d:Lvu2;

    iget-object v1, v1, Lvu2;->a:Lx5f;

    const/16 v2, 0x16

    invoke-virtual {v1, v2}, Lx5f;->S(I)V

    invoke-virtual {v0}, Landroid/service/autofill/FillResponse$Builder;->build()Landroid/service/autofill/FillResponse;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/service/autofill/FillCallback;->onSuccess(Landroid/service/autofill/FillResponse;)V

    goto :goto_411

    :cond_3aa
    new-instance v0, Lyo7;

    move-object/from16 v12, v20

    const/4 v4, 0x1

    invoke-direct {v0, v2, v12, v7, v4}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v2, Lm39;->b:Las2;

    iget-object v2, v1, Las2;->d:Lt3g;

    if-nez v2, :cond_3c2

    iget-object v2, v1, Las2;->c:Lkotlin/jvm/functions/Function0;

    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt3g;

    iput-object v2, v1, Las2;->d:Lt3g;

    :cond_3c2
    iget-boolean v1, v7, Lj2g;->b:Z

    if-eqz v1, :cond_3d8

    new-instance v1, Lq3g;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    move-object/from16 v4, v19

    invoke-static {v3, v4}, Lrab;->c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-direct {v1, v5, v5, v3, v4}, Lq3g;-><init>(Ljava/net/URI;Ljava/net/URI;Ljava/lang/String;I)V

    goto :goto_408

    :cond_3d8
    move-object/from16 v4, v19

    new-instance v1, Lq3g;

    invoke-static {v4}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    invoke-static {v3}, Lnxg;->e(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_3ed

    move-object/from16 v9, v18

    goto :goto_3ff

    :cond_3ed
    sget-object v5, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    const/16 v5, 0xa

    invoke-static {v4, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    const-string v5, "opera-user://"

    invoke-static {v5, v4}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :goto_3ff
    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    const/4 v5, 0x4

    const/4 v6, 0x0

    invoke-direct {v1, v3, v4, v6, v5}, Lq3g;-><init>(Ljava/net/URI;Ljava/net/URI;Ljava/lang/String;I)V

    :goto_408
    new-instance v3, Ltu;

    const/4 v14, 0x2

    invoke-direct {v3, v0, v14}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v2, v1, v3}, Lt3g;->a(Lq3g;Ltu;)V

    :goto_411
    return-void

    :cond_412
    move-object v6, v12

    invoke-virtual {v10, v6}, Landroid/service/autofill/FillCallback;->onSuccess(Landroid/service/autofill/FillResponse;)V

    return-void

    :cond_417
    invoke-static {}, Lh9o;->p()V

    return-void

    nop

    :pswitch_data_41c
    .packed-switch 0x0
        :pswitch_200
        :pswitch_200
        :pswitch_200
        :pswitch_1ec
        :pswitch_200
        :pswitch_1d7
        :pswitch_1ec
        :pswitch_200
        :pswitch_200
        :pswitch_200
        :pswitch_1ec
        :pswitch_1d7
        :pswitch_200
    .end packed-switch
.end method
