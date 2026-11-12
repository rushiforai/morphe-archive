.class public final Lcom/opera/android/browser/dialog/AuthenticationDialog;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public final e:Lwth;

.field public f:Lbz0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lwth;)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->e:Lwth;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140968

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 9

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d010c

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a07c8

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    const-string v5, "Missing required view with ID: "

    if-eqz v4, :cond_8e

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v6, :cond_8e

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const v1, 0x7f1401f2

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v1, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->a:Ljava/lang/String;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Laz0;->a:Lwy0;

    iput-object v0, v1, Lwy0;->e:Landroid/view/View;

    iget-object v0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->b:Ljava/lang/String;

    iput-object v0, v1, Lwy0;->f:Ljava/lang/CharSequence;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d006e

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a011b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v2, :cond_7e

    const v1, 0x7f0a011c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v3, :cond_7e

    check-cast v0, Landroid/widget/LinearLayout;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v2, v1}, Lbq1;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v1, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->c:Ljava/lang/String;

    if-eqz v1, :cond_7a

    iget-object v4, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->d:Ljava/lang/String;

    if-eqz v4, :cond_7a

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->d:Ljava/lang/String;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_7a
    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :cond_7e
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_8e
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    iput-object p1, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->f:Lbz0;

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_f

    iget-object p0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->e:Lwth;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;->a:J

    invoke-static {p0, p1}, LJ/N;->McS1AktT(J)V

    :cond_f
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->e:Lwth;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;->a:J

    invoke-static {p0, p1}, LJ/N;->McS1AktT(J)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    const v0, 0x7f0a011c

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const v1, 0x7f0a011b

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->e:Lwth;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;

    iget-wide v1, p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;->a:J

    invoke-static {v1, v2, v0, p1}, LJ/N;->M8q7bnnG(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 2

    const/4 p0, 0x0

    invoke-static {p1, p0}, Lphj;->Q(Lbz0;Z)V

    return-void
.end method
