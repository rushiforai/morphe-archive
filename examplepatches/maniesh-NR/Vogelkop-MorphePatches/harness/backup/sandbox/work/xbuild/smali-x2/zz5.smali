.class public final Lzz5;
.super Lca3;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic b:La06;


# direct methods
.method public constructor <init>(La06;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lca3;-><init>(B)V

    iput-object p1, p0, Lzz5;->b:La06;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    const/4 p1, 0x0

    iget-object p0, p0, Lzz5;->b:La06;

    invoke-virtual {p0, p1}, La06;->H0(Z)Z

    move-result p1

    iget-object p0, p0, La06;->s:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 5

    const/4 p1, 0x6

    const/4 v0, 0x0

    if-eq p2, p1, :cond_15

    if-eqz p3, :cond_14

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_14

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-eq p1, p2, :cond_15

    :cond_14
    return v0

    :cond_15
    iget-object p0, p0, Lzz5;->b:La06;

    invoke-virtual {p0, v0}, La06;->H0(Z)Z

    move-result p1

    iget-object p2, p0, La06;->s:Lpq3;

    iget-object p2, p2, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p2, p1}, Landroid/view/View;->setEnabled(Z)V

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 3

    if-nez p2, :cond_10

    const/4 p1, 0x0

    iget-object p0, p0, Lzz5;->b:La06;

    invoke-virtual {p0, p1}, La06;->H0(Z)Z

    move-result p1

    iget-object p0, p0, La06;->s:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    :cond_10
    return-void
.end method
