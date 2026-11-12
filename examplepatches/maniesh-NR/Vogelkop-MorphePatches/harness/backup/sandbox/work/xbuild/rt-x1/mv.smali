.class public final Lmv;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 4

    iput-byte p2, p0, Lmv;->a:B

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lmv;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lmv;->a:B

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    .line 11
    iput-object p1, p0, Lmv;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lmv;->a:B

    const v0, 0x7f1403bf

    packed-switch p0, :pswitch_data_1a

    const p0, 0x7f141410

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

    iget-byte p0, p0, Lmv;->a:B

    packed-switch p0, :pswitch_data_1e

    const p0, 0x7f1408a3

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f140bbb

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f1400d5

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
    .registers 6

    iget-byte v0, p0, Lmv;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_84

    const p0, 0x7f14037e

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    const p0, 0x7f14037d

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    const/4 p0, 0x1

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-boolean p0, p1, Lwy0;->k:Z

    return-void

    :pswitch_18
    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d0140

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f0a0c64

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v2, Landroid/widget/EditText;

    iget-object p0, p0, Lmv;->b:Ljava/lang/Object;

    check-cast p0, Lhq8;

    invoke-virtual {p0}, Lhq8;->h()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5e

    const p0, 0x7f14017c

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(I)V

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_69

    :cond_5e
    invoke-virtual {p0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getEditableString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_69
    const p0, 0x7f140752

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :pswitch_73
    iget-object p0, p1, Laz0;->a:Lwy0;

    iput-object v1, p0, Lwy0;->r:Landroid/view/View;

    const v0, 0x7f0d0108

    iput v0, p0, Lwy0;->q:I

    const p0, 0x7f1400e5

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    return-void

    nop

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_73
        :pswitch_18
    .end packed-switch
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-byte p1, p0, Lmv;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lmv;->b:Ljava/lang/Object;

    check-cast p0, Lfv;

    invoke-interface {p0}, Lfv;->c()V

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 6

    iget-byte v0, p0, Lmv;->a:B

    iget-object p0, p0, Lmv;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_70

    return-void

    :pswitch_8
    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_e
    const v0, 0x7f0a06c5

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const v1, 0x7f0a0c64

    invoke-virtual {p1, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    check-cast p0, Lhq8;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lhq8;->q(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_6f

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lp6l;->a:Lp6l;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {p1, v1, v2}, Leti;->a(Ljava/lang/String;Lshf;I)Lorg/chromium/url/GURL;

    move-result-object p1

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lcom/opera/android/favorites/a;

    iget-object v1, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    if-eqz v1, :cond_6f

    invoke-virtual {p0, v0}, Lcom/opera/android/favorites/a;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1, v1}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v0

    iget-object v2, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v2, v2, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v2, v3, p1}, LJ/N;->MZwxl2qE(JLjava/lang/Object;)V

    if-nez v0, :cond_6f

    iget-object p1, p0, Lcom/opera/android/favorites/a;->e:Lcom/opera/android/favorites/e;

    invoke-virtual {p0}, Lcom/opera/android/favorites/a;->e()J

    move-result-wide v2

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v2, v3, v1}, LJ/N;->MzRSq0ia(JZ)V

    iget-object p1, p1, Lcom/opera/android/favorites/e;->d:Lvzk;

    invoke-virtual {p1, p0, v1}, Lvzk;->w(Lhq8;Z)V

    :cond_6f
    return-void

    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 6

    iget-byte v0, p0, Lmv;->a:B

    packed-switch v0, :pswitch_data_62

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    return-void

    :pswitch_9
    const v0, 0x7f0a0c64

    invoke-virtual {p1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    new-instance v1, Lvp2;

    invoke-direct {v1, p0, p1, v0}, Lvp2;-><init>(Lmv;Lbz0;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void

    :pswitch_1b
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

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    new-instance v2, Llv;

    invoke-direct {v2, p0, p1, v1}, Llv;-><init>(Lnz0;Lbz0;B)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lmv;->b:Ljava/lang/Object;

    check-cast v1, Lfv;

    new-instance v2, Lbi;

    const/16 v3, 0xa

    invoke-direct {v2, v0, v3}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v1, v2}, Lfv;->b(Lbi;)V

    new-instance v0, Lnf;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_9
    .end packed-switch
.end method
