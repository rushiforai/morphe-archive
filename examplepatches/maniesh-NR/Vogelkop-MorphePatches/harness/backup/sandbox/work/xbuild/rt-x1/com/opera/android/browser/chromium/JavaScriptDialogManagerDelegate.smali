.class public Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhp2;

.field public final b:Lcom/opera/android/browser/dialog/DialogDelegate;

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4
    .param p1    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lhp2;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lhp2;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->a:Lhp2;

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    iput-object p1, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    return-void
.end method


# virtual methods
.method public final cancelActiveAndPendingDialogs()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-interface {p0}, Lcom/opera/android/browser/dialog/DialogDelegate;->i()V

    return-void
.end method

.method public final getNativeClosedCallbackPointer()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->a:Lhp2;

    iget-wide v0, p0, Lhp2;->b:J

    return-wide v0
.end method

.method public final getSuppressMessages()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->c:Z

    return p0
.end method

.method public final handleJavaScriptDialog(ZLjava/lang/String;)V
    .registers 3
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-interface {p0}, Lcom/opera/android/browser/dialog/DialogDelegate;->m()V

    return-void
.end method

.method public final runAlertDialog(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v1, Lqq6;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    xor-int/lit8 p3, p3, 0x1

    invoke-interface {v0, v1, p3, p1, p2}, Lcom/opera/android/browser/dialog/DialogDelegate;->g(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final runBeforeUnloadDialog(Z)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v1, Lqq6;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1, p1}, Lcom/opera/android/browser/dialog/DialogDelegate;->f(Lqq6;Z)V

    return-void
.end method

.method public final runConfirmDialog(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v1, Lqq6;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    xor-int/lit8 p3, p3, 0x1

    invoke-interface {v0, v1, p3, p1, p2}, Lcom/opera/android/browser/dialog/DialogDelegate;->k(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final runPromptDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 11
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v1, Lqq6;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    xor-int/lit8 v2, p4, 0x1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-interface/range {v0 .. v5}, Lcom/opera/android/browser/dialog/DialogDelegate;->b(Lqq6;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final suppressMessages()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/browser/chromium/JavaScriptDialogManagerDelegate;->c:Z

    return-void
.end method
