.class public final Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/browser/dialog/DialogDelegate;

.field public b:J


# direct methods
.method public constructor <init>(JLcom/opera/android/browser/dialog/DialogDelegate;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->a:Lcom/opera/android/browser/dialog/DialogDelegate;

    iput-wide p1, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->b:J

    return-void
.end method

.method public static create(JLcom/opera/android/browser/chromium/ChromiumContent;)Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;
    .registers 4
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;

    iget-object p2, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-direct {v0, p0, p1, p2}, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;-><init>(JLcom/opera/android/browser/dialog/DialogDelegate;)V

    return-object v0
.end method


# virtual methods
.method public final destroy()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->b:J

    return-void
.end method

.method public final show(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 10
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    array-length v0, p2

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Liy4;

    const/4 v1, 0x0

    :goto_6
    array-length v2, p2

    if-ge v1, v2, :cond_22

    aget-object v2, p2, v1

    add-int/lit8 v3, v1, 0x1

    aget-object v3, p2, v3

    div-int/lit8 v4, v1, 0x2

    new-instance v5, Liy4;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1a

    const/4 v3, 0x0

    :cond_1a
    invoke-direct {v5, v2, v3}, Liy4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v5, v0, v4

    add-int/lit8 v1, v1, 0x2

    goto :goto_6

    :cond_22
    new-instance p2, Lhy4;

    invoke-direct {p2, p0, p1, v0}, Lhy4;-><init>(Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;Ljava/lang/String;[Liy4;)V

    iget-object p0, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->a:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, p2}, Lcom/opera/android/browser/dialog/DialogDelegate;->a(Lnz0;)V

    return-void
.end method
