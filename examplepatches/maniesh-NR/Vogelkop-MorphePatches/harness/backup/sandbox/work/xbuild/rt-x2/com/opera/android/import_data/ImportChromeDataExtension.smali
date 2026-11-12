.class public final Lcom/opera/android/import_data/ImportChromeDataExtension;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static reportError(Ljava/lang/String;)V
    .registers 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    const-string v1, "passwords:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    const/16 v1, 0x9

    invoke-virtual {v0, v1, p0}, Lx5f;->R(ILjava/lang/String;)V

    return-void

    :cond_25
    const/4 v1, 0x7

    invoke-virtual {v0, v1, p0}, Lx5f;->R(ILjava/lang/String;)V

    return-void
.end method
