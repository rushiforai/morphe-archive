.class public final Lbjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Lbjf;->a:B

    iput-object p1, p0, Lbjf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lbjf;->c:Ljava/lang/Object;

    iput-object p3, p0, Lbjf;->d:Ljava/lang/Object;

    iput-object p4, p0, Lbjf;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 6

    iget-object v0, p0, Lbjf;->d:Ljava/lang/Object;

    check-cast v0, Lorm;

    sget-object v1, Lijm;->b:Lijm;

    if-eqz p1, :cond_20

    iget-object p0, p0, Lbjf;->b:Ljava/lang/Object;

    check-cast p0, Lysj;

    new-instance p1, Lw0a;

    const/4 v2, 0x3

    invoke-direct {p1, v2}, Lw0a;-><init>(B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    const/16 p0, 0x15

    check-cast v0, Lx5f;

    invoke-virtual {v0, p0}, Lx5f;->S(I)V

    return-void

    :cond_20
    iget-object p1, p0, Lbjf;->c:Ljava/lang/Object;

    check-cast p1, Lz77;

    new-instance v2, Lwen;

    iget-object p0, p0, Lbjf;->e:Ljava/lang/Object;

    check-cast p0, Le6g;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v3}, Lwen;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v2, v1}, Lr22;->b(Ljjm;Lijm;)V

    const-string p0, "Failed export"

    check-cast v0, Lx5f;

    const/16 p1, 0x13

    invoke-virtual {v0, p1, p0}, Lx5f;->R(ILjava/lang/String;)V

    return-void
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 14

    iget-byte v0, p0, Lbjf;->a:B

    packed-switch v0, :pswitch_data_16c

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lbjf;->a(Z)V

    return-void

    :pswitch_f
    check-cast p1, Ltw7;

    iget-object v0, p0, Lbjf;->e:Ljava/lang/Object;

    check-cast v0, Landroid/service/autofill/SaveCallback;

    instance-of v1, p1, Lrw7;

    const/4 v2, 0x1

    if-eqz v1, :cond_3a

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Ljd6;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_37

    if-eq p0, v2, :cond_37

    const/4 p1, 0x2

    if-ne p0, p1, :cond_32

    const-string p0, "A new request has been made, this callback is outdated."

    :goto_2d
    invoke-virtual {v0, p0}, Landroid/service/autofill/SaveCallback;->onFailure(Ljava/lang/CharSequence;)V

    goto/16 :goto_16b

    :cond_32
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_16b

    :cond_37
    const-string p0, "DataSourceFactory is not initialized yet."

    goto :goto_2d

    :cond_3a
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_168

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Las2;

    iget-object p1, p0, Lbjf;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/autofill/OperaAutofillService;

    sget v0, Lcom/opera/android/autofill/OperaAutofillService;->d:I

    new-instance v3, Lx77;

    iget-object v0, p1, Lcom/opera/android/autofill/OperaAutofillService;->c:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lrye;

    iget-object v0, p1, Lcom/opera/android/autofill/OperaAutofillService;->a:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxu2;

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->f()Lvu2;

    move-result-object v5

    new-instance v6, Lzif;

    invoke-direct {v6, p1, v2}, Lzif;-><init>(Lcom/opera/android/autofill/OperaAutofillService;B)V

    const/16 v8, 0xb

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v8}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    iget-object v0, p0, Lbjf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/service/autofill/SaveRequest;

    iget-object p0, p0, Lbjf;->d:Ljava/lang/Object;

    check-cast p0, Landroid/service/autofill/SaveCallback;

    invoke-virtual {v0}, Landroid/service/autofill/SaveRequest;->getClientState()Landroid/os/Bundle;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_85

    const-string v4, "com.opera.android.autofill.EXTRA_DOMAIN"

    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v7, v4

    goto :goto_86

    :cond_85
    move-object v7, v2

    :goto_86
    const-string v4, ""

    if-nez v7, :cond_8f

    invoke-virtual {p0, v4}, Landroid/service/autofill/SaveCallback;->onFailure(Ljava/lang/CharSequence;)V

    goto/16 :goto_16b

    :cond_8f
    invoke-virtual {v0}, Landroid/service/autofill/SaveRequest;->getFillContexts()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3, v5}, Lx77;->k(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v11, 0x0

    move v8, v11

    :goto_a2
    if-ge v8, v6, :cond_b4

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lg39;

    iget-object v9, v9, Lg39;->a:Ljava/util/List;

    check-cast v9, Ljava/lang/Iterable;

    invoke-static {v9, v5}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_a2

    :cond_b4
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v8, v11

    :goto_be
    if-ge v8, v6, :cond_d6

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lk2g;

    invoke-virtual {v9}, Lk2g;->b()[Lvz8;

    move-result-object v9

    invoke-static {v9}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    check-cast v9, Ljava/lang/Iterable;

    invoke-static {v9, v3}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_be

    :cond_d6
    const-class v5, Landroid/view/autofill/AutofillId;

    if-eqz v1, :cond_e5

    const-string v6, "com.opera.android.autofill.EXTRA_USER_FIELD_ID"

    invoke-static {v1, v6, v5}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Parcelable;

    check-cast v6, Landroid/view/autofill/AutofillId;

    goto :goto_e6

    :cond_e5
    move-object v6, v2

    :goto_e6
    invoke-static {v3, v6}, Lu0h;->l(Ljava/util/ArrayList;Landroid/view/autofill/AutofillId;)Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v1, :cond_f7

    const-string v8, "com.opera.android.autofill.EXTRA_PASSWORD_FIELD_ID"

    invoke-static {v1, v8, v5}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    check-cast v1, Landroid/view/autofill/AutofillId;

    goto :goto_f8

    :cond_f7
    move-object v1, v2

    :goto_f8
    invoke-static {v3, v1}, Lu0h;->l(Ljava/util/ArrayList;Landroid/view/autofill/AutofillId;)Ljava/lang/CharSequence;

    move-result-object v1

    if-nez v1, :cond_102

    invoke-virtual {p0, v4}, Landroid/service/autofill/SaveCallback;->onFailure(Ljava/lang/CharSequence;)V

    goto :goto_16b

    :cond_102
    invoke-virtual {v0}, Landroid/service/autofill/SaveRequest;->getDatasetIds()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_116

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_116

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_117

    :cond_116
    move-object v0, v2

    :cond_117
    new-instance v5, Ls3g;

    if-eqz v6, :cond_11f

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_11f
    move-object v9, v2

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    move-object v8, v7

    move-object v6, v0

    invoke-direct/range {v5 .. v10}, Ls3g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "com.opera.android.autofill.EXTRA_SAVE_DATA"

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.opera.android.autofill.ACTION_SAVE_PASSWORD"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.opera.android.autofill.EXTRA_BUNDLE"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x800000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x10000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x12000000

    invoke-static {p1, v11, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/service/autofill/SaveCallback;->onSuccess(Landroid/content/IntentSender;)V

    goto :goto_16b

    :cond_168
    invoke-static {}, Lh9o;->p()V

    :goto_16b
    return-void

    :pswitch_data_16c
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
