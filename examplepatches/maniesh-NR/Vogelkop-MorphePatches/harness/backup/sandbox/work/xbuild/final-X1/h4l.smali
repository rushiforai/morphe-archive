.class public final Lh4l;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Landroid/content/Context;

.field public final c:Ltvk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltvk;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Lh4l;->b:Landroid/content/Context;

    iput-object p2, p0, Lh4l;->c:Ltvk;

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 2

    const p0, 0x7f0809d2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/Integer;
    .registers 2

    const p0, 0x7f0807b0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f141243

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140595

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f141255

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150295

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f141244

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_a

    iget-object p0, p0, Lh4l;->c:Ltvk;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Ltvk;->n(ZZ)V

    :cond_a
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    const/4 p1, 0x0

    const/4 v0, 0x1

    iget-object p0, p0, Lh4l;->c:Ltvk;

    invoke-virtual {p0, p1, v0}, Ltvk;->n(ZZ)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 3

    const/4 p1, 0x1

    const/4 v0, 0x0

    iget-object p0, p0, Lh4l;->c:Ltvk;

    invoke-virtual {p0, p1, v0}, Ltvk;->n(ZZ)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 4

    invoke-super {p0, p1}, Lb23;->onShowDialog(Lbz0;)V

    iget-object p0, p0, Lh4l;->c:Ltvk;

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lg4l;

    iput-object p1, p0, Lg4l;->l:Lbz0;

    iget-object p0, p0, Lg4l;->c:Lc4l;

    iget-object p0, p0, Lc4l;->a:Lnw3;

    iget-object p0, p0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "tab_gallery.tabui2_upgrade_dialog_shown"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final wrapContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 2

    iget-object p0, p0, Lh4l;->b:Landroid/content/Context;

    return-object p0
.end method
