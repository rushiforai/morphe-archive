.class public final Lcom/opera/android/browser/passwordmanager/AutoSigninSnackbar;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static show(Lcom/opera/android/browser/chromium/ChromiumContent;Ljava/lang/String;)V
    .registers 4
    .param p0    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lnm2;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lnm2;-><init>(Ljava/lang/String;B)V

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v0}, Lcom/opera/android/browser/dialog/DialogDelegate;->e(Lo93;)V

    return-void
.end method
