.class public final Lcom/opera/android/browser/autofill/SaveProfileDialog;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static showDialog(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/autofill/Address;J)V
    .registers 7
    .param p0    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/autofill/Address;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->G:Leej;

    if-eqz v1, :cond_2b

    new-instance v2, Lqq8;

    invoke-direct {v2, p2, p3, v0, p0}, Lqq8;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, v1, Leej;->a:Lnej;

    new-instance p2, Lxq3;

    const/16 p3, 0xa

    invoke-direct {p2, p1, v2, p3}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, p2, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_2b
    const-string p0, "Error"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
