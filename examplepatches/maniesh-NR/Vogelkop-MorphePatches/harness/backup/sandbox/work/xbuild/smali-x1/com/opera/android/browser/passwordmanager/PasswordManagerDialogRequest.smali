.class public final Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/browser/dialog/DialogDelegate;

.field public final c:Leej;

.field public d:Lv4g;

.field public e:J


# direct methods
.method public constructor <init>(JLdx3;Lcom/opera/android/browser/dialog/DialogDelegate;Leej;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    iput-object p3, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->a:Landroid/content/Context;

    iput-object p4, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    iput-object p5, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->c:Leej;

    iput-wide p1, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->e:J

    return-void
.end method

.method public static create(JLcom/opera/android/browser/chromium/ChromiumContent;)Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;
    .registers 9
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v3

    iget-object v4, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    iget-object v5, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->G:Leej;

    if-eqz v5, :cond_11

    move-wide v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;-><init>(JLdx3;Lcom/opera/android/browser/dialog/DialogDelegate;Leej;)V

    return-object v0

    :cond_11
    const-string p0, "Error"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final destroy()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    if-eqz v0, :cond_c

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-interface {v0, v1}, Ljjm;->finish(Lhjm;)V

    :cond_c
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->e:J

    return-void
.end method

.method public final showRememberPasswordDialog()V
    .registers 7

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "password_manager_autosave"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_3d

    new-instance v0, Lglj;

    new-instance v1, Lrxh;

    const v3, 0x7f1401b7

    invoke-direct {v1, v3}, Lrxh;-><init>(I)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    new-instance v3, Lsxh;

    const v4, 0x7f140c62

    invoke-direct {v3, v4, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    const/16 v1, 0x9c4

    invoke-direct {v0, v3, v1}, Lglj;-><init>(Lpxh;I)V

    iget-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->b:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {v1, v0}, Lcom/opera/android/browser/dialog/DialogDelegate;->e(Lo93;)V

    iget-wide v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->e:J

    invoke-static {v0, v1, v2}, LJ/N;->M1EqC_CK(JZ)V

    return-void

    :cond_3d
    iget-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    if-eqz v1, :cond_49

    const/4 v3, 0x0

    iput-object v3, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    sget-object v3, Lhjm;->b:Lhjm;

    invoke-interface {v1, v3}, Ljjm;->finish(Lhjm;)V

    :cond_49
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v1

    new-instance v3, Llld;

    const/16 v4, 0xc

    invoke-direct {v3, p0, v4}, Llld;-><init>(Ljava/lang/Object;B)V

    iget-object v4, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->c:Leej;

    const/4 v5, 0x0

    invoke-virtual {v4, v1, v3, v5}, Leej;->a(Lzwk;Llld;Z)Lv4g;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_74

    return-void

    :cond_74
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->H(Lzpa;)Lhm0;

    move-result-object v3

    invoke-virtual {v3, v0}, Lhm0;->x(Lzpa;)Lbp0;

    move-result-object v0

    invoke-virtual {v0, v5, v2}, Ljf0;->d(II)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final showReplacePasswordDialog()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    if-eqz v0, :cond_c

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-interface {v0, v1}, Ljjm;->finish(Lhjm;)V

    :cond_c
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v0

    new-instance v1, Llld;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Llld;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->c:Leej;

    invoke-virtual {v3, v0, v1, v2}, Leej;->a(Lzwk;Llld;Z)Lv4g;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    return-void
.end method
