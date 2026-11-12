.class public final Lmm2;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lmm2;->a:B

    .line 12
    iput-object p1, p0, Lmm2;->c:Ljava/lang/Object;

    .line 13
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lmm2;->a:B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lmm2;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lmm2;->b:Z

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-byte p0, p0, Lmm2;->a:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f14056d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f1401f6

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-byte p0, p0, Lmm2;->a:B

    packed-switch p0, :pswitch_data_16

    const p0, 0x7f140180

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f1401f7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 5

    iget-byte v0, p0, Lmm2;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_4e

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f140b67

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    move-result-object p1

    iget-object p0, p0, Lmm2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v2, 0x7f140cd1

    invoke-virtual {v0, v2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    iput-boolean v1, p1, Lwy0;->k:Z

    return-void

    :pswitch_2b
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f1401f8

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    const v0, 0x7f1401b7

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f1401f5

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    iput-boolean v1, p1, Lwy0;->k:Z

    return-void

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    iget-byte v0, p0, Lmm2;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    return-void

    :pswitch_9
    iget-boolean p1, p0, Lmm2;->b:Z

    if-nez p1, :cond_19

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmm2;->b:Z

    iget-object p0, p0, Lmm2;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;

    iget-wide p0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->b:J

    invoke-static {p0, p1}, LJ/N;->MRjqL_BM(J)V

    :cond_19
    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lmm2;->a:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_9
    iget-boolean p1, p0, Lmm2;->b:Z

    if-nez p1, :cond_1a

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmm2;->b:Z

    iget-object p0, p0, Lmm2;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;

    iget-wide p0, p0, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->b:J

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, LJ/N;->M4GRMnKU(JZ)V

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 12

    iget-byte v0, p0, Lmm2;->a:B

    iget-object v1, p0, Lmm2;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "com.opera.android.permissions.PermissionHandlerService"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsz4;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lyi4;->T(Lsz4;)Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-static {p1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    new-instance v2, Lilm;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0, v1, v2}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    goto :goto_39

    :cond_2a
    sget-object v4, Ls9g;->h:Ls9g;

    iget-boolean v5, p0, Lmm2;->b:Z

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    sget-object v8, Lkag;->b:Lkag;

    const/4 v9, 0x1

    sget-object v7, Llag;->b:Llag;

    invoke-virtual/range {v4 .. v9}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :goto_39
    return-void

    :pswitch_3a
    iget-boolean p1, p0, Lmm2;->b:Z

    if-nez p1, :cond_48

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmm2;->b:Z

    check-cast v1, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;

    iget-wide v0, v1, Lcom/opera/android/browser/passwordmanager/AutoSigninFirstRunDialogRequest;->b:J

    invoke-static {v0, v1, p1}, LJ/N;->M4GRMnKU(JZ)V

    :cond_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 2

    iget-byte p0, p0, Lmm2;->a:B

    packed-switch p0, :pswitch_data_10

    const/4 p0, 0x1

    invoke-static {p1, p0}, Lphj;->Q(Lbz0;Z)V

    return-void

    :pswitch_a
    const/4 p0, 0x0

    invoke-static {p1, p0}, Lphj;->Q(Lbz0;Z)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
