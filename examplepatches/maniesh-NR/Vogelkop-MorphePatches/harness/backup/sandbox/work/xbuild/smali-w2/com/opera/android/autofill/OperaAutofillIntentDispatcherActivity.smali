.class public final Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;
.super Lxd5;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;",
        "Lxd5;",
        "<init>",
        "()V",
        "yif",
        "autofill-service"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic i:I


# instance fields
.field public final a:Lzyk;

.field public final b:Lzyk;

.field public final c:Lzyk;

.field public d:Lt3g;

.field public final e:Lzyk;

.field public f:Lth;

.field public g:Lth;

.field public final h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lxd5;-><init>()V

    new-instance v0, Lxif;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lxif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->a:Lzyk;

    new-instance v0, Lxif;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lxif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->b:Lzyk;

    new-instance v0, Lxif;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lxif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->c:Lzyk;

    new-instance v0, Lxif;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lxif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->e:Lzyk;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->h:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final A(Z)V
    .registers 6

    if-nez p1, :cond_c

    new-instance p1, Lwif;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lwif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->s(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_c
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_16

    iget-object p1, p1, Lyif;->b:Lr3g;

    goto :goto_17

    :cond_16
    move-object p1, v0

    :goto_17
    if-nez p1, :cond_1a

    return-void

    :cond_1a
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->r()Lsv1;

    move-result-object v1

    iget-object v1, v1, Lsv1;->a:Lxv1;

    iget-object v1, v1, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x800000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    invoke-interface {p1}, Lr3g;->getId()Ljava/lang/String;

    move-result-object p1

    const-string v2, "AutofillIntent.Action.EDIT"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "AutofillIntent.EXTRA_PASSWORD_ID"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->f:Lth;

    if-nez p0, :cond_4a

    move-object p0, v0

    :cond_4a
    invoke-virtual {p0, p1, v0}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void
.end method

.method public final B(Z)V
    .registers 4

    if-nez p1, :cond_c

    new-instance p1, Lwif;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lwif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->s(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_c
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->r()Lsv1;

    move-result-object p1

    iget-object p1, p1, Lsv1;->a:Lxv1;

    iget-object p1, p1, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 p1, 0x40000000    # 2.0f

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p1

    const/high16 v0, 0x800000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "AutofillIntent.Action.VIEW_ALL"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->f:Lth;

    const/4 v0, 0x0

    if-nez p0, :cond_33

    move-object p0, v0

    :cond_33
    invoke-virtual {p0, p1, v0}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void
.end method

.method public final C(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/KeyguardManager;

    invoke-virtual {v1}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v1

    if-nez v1, :cond_12

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_12
    iget-object v1, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->h:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->g:Lth;

    const/4 v1, 0x0

    if-nez p2, :cond_1d

    move-object p2, v1

    :cond_1d
    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Landroid/app/KeyguardManager;->createConfirmDeviceCredentialIntent(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p2, p0, v1}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Lxd5;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lsh;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lsh;-><init>(B)V

    new-instance v0, Lvif;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lvif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0, p1, v0}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->f:Lth;

    new-instance p1, Lsh;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lsh;-><init>(B)V

    new-instance v0, Lvif;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lvif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0, p1, v0}, Lxd5;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->g:Lth;

    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->f:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Las2;

    new-instance v0, Lo8f;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v0}, Las2;->a(Landroid/content/ContextWrapper;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final r()Lsv1;
    .registers 3

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v1, v0, Lxu2;

    if-eqz v1, :cond_b

    check-cast v0, Lxu2;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_1d

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->k:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsv1;

    if-eqz v0, :cond_1d

    return-object v0

    :cond_1d
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " doesn\'t implement AutofillServiceDependencyProvider"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final s(Lkotlin/jvm/functions/Function1;)V
    .registers 12

    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v0, v0, Lyif;->a:Lk2g;

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    if-eqz v0, :cond_d1

    invoke-virtual {v0}, Lk2g;->a()Lj2g;

    move-result-object v0

    instance-of v1, v0, Li2g;

    if-nez v1, :cond_1a

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1a
    iget-object v1, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lub2;

    check-cast v0, Li2g;

    iget-object v2, v0, Li2g;->d:Ljava/lang/String;

    iget-object v3, v0, Li2g;->c:Ljava/lang/String;

    new-instance v4, Lyo7;

    const/16 v5, 0x18

    invoke-direct {v4, p0, v0, p1, v5}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    const/4 p1, 0x1

    :try_start_34
    new-instance v0, Lugb;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v3}, Lugb;-><init>(Ljava/lang/String;)V
    :try_end_3c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_34 .. :try_end_3c} :catch_3e
    .catch Ljava/lang/IllegalStateException; {:try_start_34 .. :try_end_3c} :catch_6a

    move v0, p1

    goto :goto_3f

    :catch_3e
    move v0, p0

    :goto_3f
    if-eqz v0, :cond_6a

    :try_start_41
    new-instance v0, Lugb;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v3}, Lugb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lugb;->a()I

    move-result v5

    if-gtz v5, :cond_50

    move p1, p0

    :cond_50
    if-nez p1, :cond_6a

    sget-object p1, Lx7d;->i:[Ljava/lang/String;

    invoke-virtual {v0}, Lugb;->b()Lugb;

    move-result-object v0

    iget-object v0, v0, Lugb;->b:Lh1b;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1
    :try_end_62
    .catch Ljava/lang/IllegalStateException; {:try_start_41 .. :try_end_62} :catch_6a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_41 .. :try_end_62} :catch_6a

    if-ltz p1, :cond_6a

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, p0}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :catch_6a
    :cond_6a
    sget-object p1, Lrab;->a:Lqab;

    iget-object p1, v1, Lub2;->b:Landroid/content/pm/PackageManager;

    const-string v0, "SHA-256"

    sget-object v5, Lqab;->b:Lqab;

    invoke-static {p1, v2, v0, v5}, Lrab;->b(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;Lqab;)Ljava/util/HashSet;

    move-result-object p1

    :try_start_76
    invoke-static {v3}, Lub2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v5, v1, Lub2;->a:Lumi;

    new-instance v6, Lrml;

    sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v6, v7, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v5, Ltb2;

    const/4 v7, 0x3

    invoke-direct {v5, v1, v3, v7}, Ltb2;-><init>(Lub2;Ljava/lang/String;B)V

    invoke-virtual {v6, v5}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v3

    new-instance v5, Ltb2;

    const/4 v6, 0x4

    invoke-direct {v5, v1, v0, v6}, Ltb2;-><init>(Lub2;Ljava/lang/String;B)V

    iget-object v1, v3, Lplk;->c:Ljava/lang/Object;

    check-cast v1, Leyi;

    iget-boolean v6, v1, Leyi;->b:Z

    if-nez v6, :cond_c4

    new-instance v6, Lplk;

    iget-object v7, v3, Lplk;->a:Ljava/lang/Object;

    check-cast v7, Ltcl;

    new-instance v8, Lra;

    const/16 v9, 0x11

    invoke-direct {v8, v5, v9}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    new-instance v5, Lpml;

    invoke-direct {v5, v8, p0}, Lpml;-><init>(Lra;B)V

    move-object p0, v7

    check-cast p0, Lumi;

    invoke-virtual {p0, v5}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    invoke-direct {v6, v7, p0, v1, v3}, Lplk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Lq3;

    invoke-direct {p0, v4, p1, v0, v2}, Lq3;-><init>(Lyo7;Ljava/util/HashSet;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    goto :goto_d1

    :cond_c4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, ""

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_cc
    .catch Ljava/lang/IllegalArgumentException; {:try_start_76 .. :try_end_cc} :catch_cc

    :catch_cc
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4, p0}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d1
    :goto_d1
    return-void
.end method

.method public final t(Landroid/os/Bundle;)V
    .registers 7

    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iget-object v0, v0, Lyif;->a:Lk2g;

    goto :goto_b

    :cond_a
    move-object v0, v1

    :goto_b
    if-eqz v0, :cond_2e

    if-eqz p1, :cond_24

    const-string v2, "AutofillIntent.EXTRA_DATA"

    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_24

    const-class v1, Lr3g;

    invoke-static {p1, v2, v1}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    move-object v1, p1

    check-cast v1, Lr3g;

    goto :goto_2c

    :cond_24
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object p1

    if-eqz p1, :cond_2c

    iget-object v1, p1, Lyif;->b:Lr3g;

    :cond_2c
    :goto_2c
    if-nez v1, :cond_2f

    :cond_2e
    return-void

    :cond_2f
    iget-object p1, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->d:Lt3g;

    if-eqz p1, :cond_3e

    new-instance v2, Lhu5;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v0, v3}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v1, v2}, Lt3g;->d(Lr3g;Lhu5;)V

    return-void

    :cond_3e
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final u()Lxu2;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxu2;

    return-object p0
.end method

.method public final v()Lyif;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyif;

    return-object p0
.end method

.method public final w()Lyif;
    .registers 7

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_4a

    const-string v0, "com.opera.android.autofill.EXTRA_BUNDLE"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_4a

    new-instance v0, Lyif;

    const-string v1, "com.opera.android.autofill.EXTRA_PARTITION"

    const-class v2, Lk2g;

    invoke-static {p0, v1, v2}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    check-cast v1, Lk2g;

    const-string v2, "com.opera.android.autofill.EXTRA_DATA"

    const-class v3, Lr3g;

    invoke-static {p0, v2, v3}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    check-cast v2, Lr3g;

    const-string v3, "com.opera.android.autofill.EXTRA_INLINE_SPEC"

    const-class v4, Landroid/widget/inline/InlinePresentationSpec;

    invoke-static {p0, v3, v4}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Parcelable;

    invoke-static {v3}, Lyt7;->a(Ljava/lang/Object;)Landroid/widget/inline/InlinePresentationSpec;

    move-result-object v3

    const-string v4, "com.opera.android.autofill.EXTRA_SAVE_DATA"

    const-class v5, Ls3g;

    invoke-static {p0, v4, v5}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Parcelable;

    check-cast p0, Ls3g;

    invoke-direct {v0, v1, v2, v3, p0}, Lyif;-><init>(Lk2g;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Ls3g;)V

    return-object v0

    :cond_4a
    const/4 p0, 0x0

    return-object p0
.end method

.method public final y(Z)V
    .registers 6

    if-nez p1, :cond_c

    new-instance p1, Lwif;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lwif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->s(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_c
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1c

    iget-object p1, p1, Lyif;->a:Lk2g;

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Lk2g;->a()Lj2g;

    move-result-object p1

    goto :goto_1d

    :cond_1c
    move-object p1, v0

    :goto_1d
    if-nez p1, :cond_20

    return-void

    :cond_20
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->r()Lsv1;

    move-result-object v1

    iget-object v1, v1, Lsv1;->a:Lxv1;

    iget-object v1, v1, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x800000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "AutofillIntent.Action.ADD_PASSWORD"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "AutofillIntent.EXTRA_DOMAIN"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->f:Lth;

    if-nez p0, :cond_4c

    move-object p0, v0

    :cond_4c
    invoke-virtual {p0, p1, v0}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void
.end method

.method public final z(Z)V
    .registers 5

    if-nez p1, :cond_c

    new-instance p1, Lwif;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lwif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->s(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_c
    invoke-virtual {p0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object p1

    if-eqz p1, :cond_46

    iget-object p1, p1, Lyif;->a:Lk2g;

    if-eqz p1, :cond_46

    invoke-virtual {p1}, Lk2g;->a()Lj2g;

    move-result-object p1

    if-eqz p1, :cond_46

    iget-boolean v0, p1, Lj2g;->b:Z

    iget-object p1, p1, Lj2g;->a:Ljava/lang/String;

    const v1, 0x7f140c75

    if-eqz v0, :cond_3d

    sget-object v0, Lrab;->a:Lqab;

    :try_start_27
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageItemInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p1
    :try_end_34
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_27 .. :try_end_34} :catch_34
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_34} :catch_34

    :catch_34
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4d

    :cond_3d
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4d

    :cond_46
    const p1, 0x7f140c74

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_4d
    new-instance v0, Lvdf;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->C(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method
