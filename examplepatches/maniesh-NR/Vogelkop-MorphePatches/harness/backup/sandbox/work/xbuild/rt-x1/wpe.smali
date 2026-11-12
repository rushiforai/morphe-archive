.class public final Lwpe;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lwpe;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lwpe;->c:Ljava/lang/Object;

    iput-object p2, p0, Lwpe;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Llag;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lwpe;->a:B

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    .line 14
    iput-object p1, p0, Lwpe;->b:Ljava/lang/Object;

    .line 15
    iput-object p2, p0, Lwpe;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkxe;Lcom/opera/android/BrowserActivity;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lwpe;->a:B

    .line 16
    iput-object p2, p0, Lwpe;->b:Ljava/lang/Object;

    iput-object p1, p0, Lwpe;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 17
    invoke-direct {p0, p1, p1}, Lnz0;-><init>(ZZ)V

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lwpe;->a:B

    const v0, 0x7f1403bf

    packed-switch p0, :pswitch_data_1a

    const p0, 0x7f14056d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_15
        :pswitch_10
    .end packed-switch
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-byte p0, p0, Lwpe;->a:B

    packed-switch p0, :pswitch_data_1e

    const p0, 0x7f140180

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140b3b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f140bbb

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 4

    iget-byte v0, p0, Lwpe;->a:B

    iget-object v1, p0, Lwpe;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_70

    check-cast v1, Llag;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_19

    const/4 v1, 0x3

    if-eq v0, v1, :cond_15

    const/4 v0, 0x0

    goto :goto_1c

    :cond_15
    const v0, 0x7f140d66

    goto :goto_1c

    :cond_19
    const v0, 0x7f140806

    :goto_1c
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    move-result-object p1

    iget-object p0, p0, Lwpe;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f140cd1

    invoke-virtual {v1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    const/4 p0, 0x1

    iput-boolean p0, p1, Lwy0;->k:Z

    return-void

    :pswitch_3f
    const p0, 0x7f140cd5

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    check-cast v1, Lkxe;

    const p0, 0x7f1401b7

    invoke-virtual {v1, p0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f141025

    invoke-virtual {v1, v0, p0}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    return-void

    :pswitch_5e
    iget-object p0, p1, Laz0;->a:Lwy0;

    const/4 v0, 0x0

    iput-object v0, p0, Lwy0;->r:Landroid/view/View;

    const v0, 0x7f0d0108

    iput v0, p0, Lwy0;->q:I

    const p0, 0x7f1400db

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    return-void

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_3f
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    iget-byte v0, p0, Lwpe;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    return-void

    :pswitch_9
    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_14

    iget-object p0, p0, Lwpe;->c:Ljava/lang/Object;

    check-cast p0, Lkxe;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lkxe;->L:Z

    :cond_14
    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 10

    iget-byte v0, p0, Lwpe;->a:B

    iget-object v1, p0, Lwpe;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    invoke-super {p0, p1}, Lnz0;->onNegativeButtonClicked(Lbz0;)V

    return-void

    :pswitch_b
    sget-object v2, Ls9g;->h:Ls9g;

    iget-object p0, p0, Lwpe;->b:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Ljava/lang/String;

    move-object v5, v1

    check-cast v5, Llag;

    sget-object v6, Lkag;->c:Lkag;

    const/4 v7, 0x1

    const/4 v3, 0x0

    invoke-virtual/range {v2 .. v7}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    return-void

    :pswitch_1d
    check-cast v1, Lkxe;

    const/4 p0, 0x0

    iput-boolean p0, v1, Lkxe;->L:Z

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_1d
        :pswitch_b
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 10

    iget-byte v0, p0, Lwpe;->a:B

    iget-object v1, p0, Lwpe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8c

    sget-object v2, Ls9g;->h:Ls9g;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    iget-object p0, p0, Lwpe;->c:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Llag;

    sget-object v6, Lkag;->b:Lkag;

    const/4 v7, 0x1

    const/4 v3, 0x0

    invoke-virtual/range {v2 .. v7}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    return-void

    :pswitch_19
    check-cast v1, Lcom/opera/android/BrowserActivity;

    new-instance p1, Ly0a;

    const/16 v0, 0x1c

    invoke-direct {p1, p0, v0}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_2e

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ly0a;->run(Ljava/lang/Object;)V

    goto :goto_5a

    :cond_2e
    new-instance p0, Landroid/content/Intent;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "package:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {p0, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :try_start_4b
    new-instance v0, Lg2b;

    const/4 v2, 0x2

    invoke-direct {v0, v1, p1, v2}, Lg2b;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p0, v0}, Lhjf;->D(Landroid/content/Intent;Lni;)V
    :try_end_54
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4b .. :try_end_54} :catch_55

    goto :goto_5a

    :catch_55
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ly0a;->run(Ljava/lang/Object;)V

    :goto_5a
    return-void

    :pswitch_5b
    const p0, 0x7f0a0362

    invoke-virtual {p1, p0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object v0, p1, Lq6e;->p:Li3j;

    new-instance v2, Lyo7;

    const/16 v3, 0x11

    invoke-direct {v2, p1, v1, p0, v3}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2}, Li3j;->s(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_19
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 5

    iget-byte v0, p0, Lwpe;->a:B

    packed-switch v0, :pswitch_data_3c

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_9
    const v0, 0x7f0a0596

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f1400de

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v1, Lvpe;

    invoke-direct {v1, p0, v0, p1}, Lvpe;-><init>(Lwpe;Landroid/widget/EditText;Lbz0;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    new-instance v1, Llv;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Llv;-><init>(Lnz0;Lbz0;B)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p0, p0, Lwpe;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
