.class public final Ln25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final f:Lii;

.field public g:I

.field public h:I

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>()V
    .registers 7

    new-instance v2, Lrxh;

    const v0, 0x7f141044

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v0, 0x7f141045

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    const v4, 0x7f0803fe

    sget-object v5, La35;->l:La35;

    const-string v1, "Autofill"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    new-instance p0, Lii;

    const/4 v1, 0x7

    invoke-direct {p0, v1}, Lii;-><init>(B)V

    iput-object p0, v0, Ln25;->f:Lii;

    return-void
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 5

    iget-object p0, p0, Ln25;->f:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lft2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lft2;-><init>(Lcom/opera/android/autofill/AutofillManager;B)V

    invoke-virtual {p0, v0}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    new-instance v0, Lft2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lft2;-><init>(Lcom/opera/android/autofill/AutofillManager;B)V

    invoke-virtual {p0, v0}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p1, Ls25;->b:Lumi;

    iget-object p1, p1, Ls25;->g:Lt1;

    invoke-static {p0, v0, p1}, Li16;->r(Landroid/content/Context;Lumi;Lt1;)Li16;

    move-result-object p0

    invoke-virtual {p0}, Li16;->k()V

    sget-object p0, Llx3;->a:Li7f;

    invoke-static {}, LJ/N;->M2mWEj0S()V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 10

    iget-object v0, p0, Ln25;->f:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/AutofillManager;

    new-instance v2, Ll25;

    check-cast p2, Liu2;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, p2, v3}, Ll25;-><init>(Ln25;Ls25;Liu2;B)V

    iget-object v4, v1, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v5, v4, Lnrl;->a:Z

    if-eqz v5, :cond_22

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v1}, LJ/N;->M_nAabU4(Ljava/lang/Object;)V

    invoke-virtual {v2, v1}, Ll25;->run(Ljava/lang/Object;)V

    goto :goto_2b

    :cond_22
    new-instance v5, Lbi2;

    const/4 v6, 0x7

    invoke-direct {v5, v1, v2, v6}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :goto_2b
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/autofill/AutofillManager;

    new-instance v1, Ll25;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Ll25;-><init>(Ln25;Ls25;Liu2;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    new-instance v0, Lm25;

    invoke-direct {v0, p0, p1, p2, v3}, Lm25;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Llx3;->a:Li7f;

    invoke-static {v0}, LJ/N;->MQS4iFQv(Ljava/lang/Object;)V

    return-void
.end method

.method public final e(Ls25;Liu2;)V
    .registers 8

    iget v0, p0, Ln25;->j:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ln25;->j:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_a

    return-void

    :cond_a
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget v1, p0, Ln25;->g:I

    if-lez v1, :cond_2d

    iget-object v1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Ln25;->g:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f120017

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2d
    iget v1, p0, Ln25;->h:I

    if-lez v1, :cond_4b

    iget-object v1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Ln25;->h:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f120019

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4b
    iget v1, p0, Ln25;->i:I

    if-lez v1, :cond_73

    iget-object v1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5f

    const v2, 0x7f120020

    goto :goto_62

    :cond_5f
    const v2, 0x7f12001c

    :goto_62
    iget p0, p0, Ln25;->i:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, p0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_73
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_86

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f141046

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :cond_86
    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f140b27

    const-string v1, ""

    filled-new-array {v1, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method
