.class public final Lyz5;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x7

    iput-byte v0, p0, Lyz5;->a:B

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    return-void
.end method

.method public synthetic constructor <init>(ZZB)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lyz5;->a:B

    invoke-direct {p0, p1, p2}, Lnz0;-><init>(ZZ)V

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    iget-byte v0, p0, Lyz5;->a:B

    const v1, 0x7f1403bf

    sparse-switch v0, :sswitch_data_22

    invoke-super {p0, p1}, Lnz0;->getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_d
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_12
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_17
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_1c
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_22
    .sparse-switch
        0x0 -> :sswitch_1c
        0x1 -> :sswitch_17
        0x4 -> :sswitch_12
        0x7 -> :sswitch_d
    .end sparse-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Lyz5;->a:B

    const v1, 0x7f1412e1

    const v2, 0x7f140812

    packed-switch v0, :pswitch_data_3c

    :pswitch_b
    invoke-super {p0, p1}, Lnz0;->getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    const p0, 0x7f141372

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_18
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1d
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_22
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_27
    const p0, 0x7f140bbb

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2f
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_34
    const p0, 0x7f1411f9

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_34
        :pswitch_2f
        :pswitch_27
        :pswitch_b
        :pswitch_22
        :pswitch_1d
        :pswitch_18
        :pswitch_10
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 6

    iget-byte v0, p0, Lyz5;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_ba

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    iget-object p0, p0, Lydn;->l:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "vpn.enabled.timestamp.normal"

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    const p0, 0x7f1413f4

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    const p0, 0x7f1413f3

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_3d
    const p0, 0x7f1411a3

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    const p0, 0x7f1411a2

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_4a
    const p0, 0x7f140871

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    iget-object p0, p1, Laz0;->a:Lwy0;

    iput-boolean v1, p0, Lwy0;->k:Z

    const p0, 0x7f140c6e

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_5b
    const p0, 0x7f14052d

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    iget-object p0, p1, Laz0;->a:Lwy0;

    iput-boolean v1, p0, Lwy0;->k:Z

    const p0, 0x7f140c6c

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_6c
    const p0, 0x7f14079d

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    const p0, 0x7f1407a4

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_79
    const v0, 0x7f1411b6

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lphj;->J(Landroid/content/Context;)Lcom/opera/android/custom_views/StylingTextView;

    move-result-object v1

    const v2, 0x7f1411c2

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ldg7;

    const/16 v3, 0x9

    invoke-direct {v2, p0, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0, v2}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    invoke-virtual {p1, v1}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_9c
    const p0, 0x7f14052c

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    iget-object p0, p1, Laz0;->a:Lwy0;

    iput-boolean v1, p0, Lwy0;->k:Z

    const p0, 0x7f14052b

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_ad
    const p0, 0x7f1411fa

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    const p0, 0x7f1411f8

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    return-void

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_ad
        :pswitch_9c
        :pswitch_79
        :pswitch_6c
        :pswitch_5b
        :pswitch_4a
        :pswitch_3d
    .end packed-switch
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 3

    iget-byte v0, p0, Lyz5;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0, p1}, Lnz0;->onDialogCreated(Lbz0;)V

    return-void

    :pswitch_9
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void

    :pswitch_data_e
    .packed-switch 0x7
        :pswitch_9
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 8

    iget-byte v0, p0, Lyz5;->a:B

    packed-switch v0, :pswitch_data_54

    :pswitch_5
    return-void

    :pswitch_6
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lydn;->C(Z)V

    return-void

    :pswitch_1b
    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    return-void

    :pswitch_21
    sget p0, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->b0:I

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v3, Lrxh;

    const p0, 0x7f140c6a

    invoke-direct {v3, p0}, Lrxh;-><init>(I)V

    sget-object v5, Llqm;->d:Llqm;

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/import_data/ImportChromePasswordsActivity;

    const-string v2, "https://passwords.google.com/options"

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_3e
    sget p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lj2b;->c:Lj2b;

    invoke-static {p0, p1}, Lir5;->i(Landroid/content/Context;Lj2b;)V

    return-void

    :pswitch_4a
    new-instance p0, Lyzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_3e
        :pswitch_5
        :pswitch_5
        :pswitch_21
        :pswitch_1b
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
