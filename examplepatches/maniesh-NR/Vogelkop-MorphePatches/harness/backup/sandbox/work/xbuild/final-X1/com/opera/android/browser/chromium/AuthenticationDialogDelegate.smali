.class public Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lwth;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lcom/opera/android/browser/dialog/AuthenticationDialog;

    invoke-direct {v1, p3, p4, v0}, Lcom/opera/android/browser/dialog/AuthenticationDialog;-><init>(Ljava/lang/String;Ljava/lang/String;Lwth;)V

    invoke-static {p1, p2, v1}, LJ/N;->MTyv4zKw(JLjava/lang/Object;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;->a:J

    return-void
.end method

.method public static onCancelled(Lcom/opera/android/browser/dialog/AuthenticationDialog;)V
    .registers 2
    .param p0    # Lcom/opera/android/browser/dialog/AuthenticationDialog;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Ld63;->finish(Lhjm;)V

    return-void
.end method

.method public static onShow(Lcom/opera/android/browser/dialog/AuthenticationDialog;Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2
    .param p0    # Lcom/opera/android/browser/dialog/AuthenticationDialog;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p1, p0}, Lcom/opera/android/browser/dialog/DialogDelegate;->a(Lnz0;)V

    return-void
.end method

.method public static savedDataAvailable(Lcom/opera/android/browser/dialog/AuthenticationDialog;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0    # Lcom/opera/android/browser/dialog/AuthenticationDialog;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_41

    if-eqz p2, :cond_41

    iput-object p1, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->c:Ljava/lang/String;

    iput-object p2, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->d:Ljava/lang/String;

    iget-object p1, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->f:Lbz0;

    if-eqz p1, :cond_41

    const p2, 0x7f0a011c

    invoke-virtual {p1, p2}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iget-object p2, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->f:Lbz0;

    const v0, 0x7f0a011b

    invoke-virtual {p2, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-gtz v0, :cond_41

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-gtz v0, :cond_41

    iget-object v0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/opera/android/browser/dialog/AuthenticationDialog;->d:Ljava/lang/String;

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_41
    return-void
.end method


# virtual methods
.method public final finalize()V
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/AuthenticationDialogDelegate;->a:J

    invoke-static {v0, v1}, LJ/N;->MND51mcr(J)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
