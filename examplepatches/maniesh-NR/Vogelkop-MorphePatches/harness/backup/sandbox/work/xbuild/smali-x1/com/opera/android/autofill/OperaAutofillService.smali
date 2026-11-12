.class public final Lcom/opera/android/autofill/OperaAutofillService;
.super Landroid/service/autofill/AutofillService;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/autofill/OperaAutofillService;",
        "Landroid/service/autofill/AutofillService;",
        "<init>",
        "()V",
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
.field public static final synthetic d:I


# instance fields
.field public final a:Lzyk;

.field public b:Las2;

.field public final c:Lj4c;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroid/service/autofill/AutofillService;-><init>()V

    new-instance v0, Lzif;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lzif;-><init>(Lcom/opera/android/autofill/OperaAutofillService;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->a:Lzyk;

    new-instance v0, Lvx;

    const/16 v2, 0x1d

    invoke-direct {v0, p0, v2}, Lvx;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lj4c;

    invoke-direct {v2, v0, v1}, Lj4c;-><init>(Lesk;B)V

    iput-object v2, p0, Lcom/opera/android/autofill/OperaAutofillService;->c:Lj4c;

    return-void
.end method

.method public static a(Landroid/service/autofill/FillContext;)Z
    .registers 3

    invoke-virtual {p0}, Landroid/service/autofill/FillContext;->getStructure()Landroid/app/assist/AssistStructure;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/assist/AssistStructure;->getActivityComponent()Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.opera.browser"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.android.settings"

    invoke-static {p0, v0, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_1e

    :cond_1d
    return v1

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final onDisconnected()V
    .registers 3

    invoke-super {p0}, Landroid/service/autofill/AutofillService;->onDisconnected()V

    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->b:Las2;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iput-object v1, v0, Las2;->d:Lt3g;

    :cond_a
    iput-object v1, p0, Lcom/opera/android/autofill/OperaAutofillService;->b:Las2;

    return-void
.end method

.method public final onFillRequest(Landroid/service/autofill/FillRequest;Landroid/os/CancellationSignal;Landroid/service/autofill/FillCallback;)V
    .registers 11

    invoke-virtual {p1}, Landroid/service/autofill/FillRequest;->getFillContexts()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_13

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2e

    :cond_13
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/service/autofill/FillContext;

    invoke-static {v1}, Lcom/opera/android/autofill/OperaAutofillService;->a(Landroid/service/autofill/FillContext;)Z

    move-result v1

    if-nez v1, :cond_17

    const/4 p0, 0x0

    invoke-virtual {p3, p0}, Landroid/service/autofill/FillCallback;->onSuccess(Landroid/service/autofill/FillResponse;)V

    return-void

    :cond_2e
    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->b:Las2;

    if-nez v0, :cond_46

    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->a:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxu2;

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->f:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Las2;

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->b:Las2;

    :cond_46
    new-instance v1, Lajf;

    move-object v6, p3

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lajf;-><init>(Lcom/opera/android/autofill/OperaAutofillService;Landroid/service/autofill/FillRequest;Landroid/os/CancellationSignal;Landroid/service/autofill/FillCallback;Landroid/service/autofill/FillCallback;)V

    invoke-virtual {v0, v2, v1}, Las2;->a(Landroid/content/ContextWrapper;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final onSaveRequest(Landroid/service/autofill/SaveRequest;Landroid/service/autofill/SaveCallback;)V
    .registers 10

    invoke-virtual {p1}, Landroid/service/autofill/SaveRequest;->getFillContexts()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_13

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2f

    :cond_13
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/service/autofill/FillContext;

    invoke-static {v1}, Lcom/opera/android/autofill/OperaAutofillService;->a(Landroid/service/autofill/FillContext;)Z

    move-result v1

    if-nez v1, :cond_17

    const-string p0, "SaveRequest not accepted"

    invoke-virtual {p2, p0}, Landroid/service/autofill/SaveCallback;->onFailure(Ljava/lang/CharSequence;)V

    return-void

    :cond_2f
    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->b:Las2;

    if-nez v0, :cond_47

    iget-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->a:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxu2;

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->f:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Las2;

    iput-object v0, p0, Lcom/opera/android/autofill/OperaAutofillService;->b:Las2;

    :cond_47
    new-instance v1, Lbjf;

    const/4 v6, 0x0

    move-object v5, p2

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Lbjf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v1}, Las2;->a(Landroid/content/ContextWrapper;Lcom/opera/api/Callback;)V

    return-void
.end method
