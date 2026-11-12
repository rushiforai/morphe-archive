.class public final Lu9g;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Lole;


# direct methods
.method public constructor <init>(IILjava/lang/String;Lole;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput p1, p0, Lu9g;->a:I

    iput p2, p0, Lu9g;->b:I

    iput-object p3, p0, Lu9g;->c:Ljava/lang/String;

    iput-object p4, p0, Lu9g;->d:Lole;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f14056d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140180

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 5

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lu9g;->a:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    move-result-object p1

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lu9g;->c:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    iget p0, p0, Lu9g;->b:I

    invoke-virtual {v0, p0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 2

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_f

    iget-object p0, p0, Lu9g;->d:Lole;

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;->a:J

    invoke-static {p0, p1}, LJ/N;->MLtgcrys(J)V

    :cond_f
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lu9g;->d:Lole;

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;->a:J

    invoke-static {p0, p1}, LJ/N;->MNhLbmh0(J)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lu9g;->d:Lole;

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;->a:J

    invoke-static {p0, p1}, LJ/N;->M9O4cgPp(J)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 2

    const/4 p0, 0x1

    invoke-static {p1, p0}, Lphj;->Q(Lbz0;Z)V

    return-void
.end method
