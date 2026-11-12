.class public abstract Llpb;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Lqq6;

.field public final b:Z

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V
    .registers 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Llpb;->a:Lqq6;

    iput-boolean p2, p0, Llpb;->b:Z

    iput-object p3, p0, Llpb;->c:Ljava/lang/String;

    iput-object p4, p0, Llpb;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public b()I
    .registers 1

    const p0, 0x7f1403bf

    return p0
.end method

.method public d()I
    .registers 1

    const p0, 0x7f140bbb

    return p0
.end method

.method public e(Laz0;Landroid/widget/LinearLayout;)V
    .registers 5

    iget-object v0, p0, Llpb;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    iget-object v0, p0, Llpb;->d:Ljava/lang/String;

    iget-object v1, p1, Laz0;->a:Lwy0;

    iput-object v0, v1, Lwy0;->f:Ljava/lang/CharSequence;

    invoke-virtual {p1, p2}, Laz0;->setView(Landroid/view/View;)Laz0;

    iget-boolean p0, p0, Llpb;->b:Z

    if-eqz p0, :cond_22

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 p1, 0x0

    const/4 v0, 0x0

    const v1, 0x7f1408a6

    invoke-static {p0, v1, p1, v0}, Lphj;->I(Landroid/content/Context;IZLav4;)Landroid/widget/FrameLayout;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_22
    return-void
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Llpb;->b()I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Llpb;->d()I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 4

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {p0, p1, v0}, Llpb;->e(Laz0;Landroid/widget/LinearLayout;)V

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

    if-ne p1, v0, :cond_11

    iget-object p0, p0, Llpb;->a:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->a:Lhp2;

    iget-wide p0, p0, Lhp2;->b:J

    invoke-static {p0, p1}, LJ/N;->MLhEAOiz(J)V

    :cond_11
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-boolean v0, p0, Llpb;->b:Z

    if-eqz v0, :cond_d

    const v0, 0x7f0a02a7

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/CheckBox;

    :cond_d
    iget-object p0, p0, Llpb;->a:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->a:Lhp2;

    iget-wide p0, p0, Lhp2;->b:J

    invoke-static {p0, p1}, LJ/N;->MLhEAOiz(J)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    const v0, 0x7f0a0362

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    :cond_14
    const-string v0, ""

    :goto_16
    iget-boolean v1, p0, Llpb;->b:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2d

    const v1, 0x7f0a02a7

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/CheckBox;

    if-nez p1, :cond_28

    move p1, v2

    goto :goto_2a

    :cond_28
    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    :goto_2a
    if-eqz p1, :cond_2d

    const/4 v2, 0x1

    :cond_2d
    iget-object p0, p0, Llpb;->a:Lqq6;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;

    iput-boolean v2, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->c:Z

    iget-object p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->a:Lhp2;

    iget-wide p0, p0, Lhp2;->b:J

    invoke-static {p0, p1, v0}, LJ/N;->MC8l5OlC(JLjava/lang/Object;)V

    return-void
.end method

.method public onShowDialog(Lbz0;)V
    .registers 4

    iget-object p0, p0, Llpb;->c:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    const v0, 0x7f0a00d6

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_20

    new-instance v1, Ldkl;

    invoke-direct {v1, p0}, Ldkl;-><init>(Ljava/lang/String;)V

    new-instance p0, Lwkl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {v0, v1, p0}, Lna2;->R(Landroid/widget/TextView;Lcgh;Ledf;)V

    :cond_20
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->h(Landroid/content/Context;)V

    return-void
.end method

.method public final useTapStealingProtection()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
