.class public final Lnom;
.super Lb23;
.source "SourceFile"


# virtual methods
.method public final b(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 3

    const p0, 0x7f040a55

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 3

    const p0, 0x7f040a56

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final e()I
    .registers 1

    const p0, 0x7f070921

    return p0
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f14132f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140b4b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f141328

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150291

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f14132e    # 1.9682533E38f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lz5i;->f0(Landroid/content/Context;)V

    return-void
.end method
