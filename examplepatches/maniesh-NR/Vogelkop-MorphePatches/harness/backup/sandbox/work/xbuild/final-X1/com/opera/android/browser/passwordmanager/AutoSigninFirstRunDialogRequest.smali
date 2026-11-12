.class public final Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/browser/dialog/DialogDelegate;

.field public b:J

.field public c:Lmm2;


# direct methods
.method public constructor <init>(JLcom/opera/android/browser/dialog/DialogDelegate;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->a:Lcom/opera/android/browser/dialog/DialogDelegate;

    iput-wide p1, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->b:J

    return-void
.end method

.method public static create(JLcom/opera/android/browser/chromium/ChromiumContent;)Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;
    .registers 4
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;

    iget-object p2, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-direct {v0, p0, p1, p2}, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;-><init>(JLcom/opera/android/browser/dialog/DialogDelegate;)V

    return-object v0
.end method


# virtual methods
.method public final destroy()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->b:J

    return-void
.end method

.method public final dismiss()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->c:Lmm2;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object p0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->a:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v0}, Lcom/opera/android/browser/dialog/DialogDelegate;->l(Lb87;)V

    return-void
.end method

.method public final show()V
    .registers 2

    new-instance v0, Lmm2;

    invoke-direct {v0, p0}, Lmm2;-><init>(Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;)V

    iput-object v0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->c:Lmm2;

    iget-object p0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->a:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v0}, Lcom/opera/android/browser/dialog/DialogDelegate;->a(Lnz0;)V

    return-void
.end method
