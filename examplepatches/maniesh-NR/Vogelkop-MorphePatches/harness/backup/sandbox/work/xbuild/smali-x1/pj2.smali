.class public final Lpj2;
.super Lltl;
.source "SourceFile"


# instance fields
.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/EditText;

.field public t:Landroid/widget/EditText;

.field public u:Landroid/widget/Button;

.field public v:Lcom/opera/android/custom_views/Spinner;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public final y:Ldb;

.field public final z:Lnj2;


# direct methods
.method public constructor <init>(Ldb;)V
    .registers 4

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f141154

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lnj2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lpj2;->z:Lnj2;

    iput-object p1, p0, Lpj2;->y:Ldb;

    return-void
.end method


# virtual methods
.method public final G0(Z)V
    .registers 6

    iget-object v0, p0, Lpj2;->u:Landroid/widget/Button;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_9

    move v3, v2

    goto :goto_a

    :cond_9
    move v3, v1

    :goto_a
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lpj2;->v:Lcom/opera/android/custom_views/Spinner;

    if-nez p1, :cond_12

    move v1, v2

    :cond_12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lpj2;->t:Landroid/widget/EditText;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lpj2;->s:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    if-eqz p1, :cond_28

    iget-object p0, p0, Lpj2;->r:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_28
    return-void
.end method

.method public final onPause()V
    .registers 3

    iget-object v0, p0, Lpj2;->y:Ldb;

    iget-object v1, p0, Lpj2;->z:Lnj2;

    invoke-virtual {v0, v1}, Ldb;->h(Lcb;)V

    invoke-super {p0}, Lltl;->onPause()V

    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Lltl;->onResume()V

    iget-object v0, p0, Lpj2;->y:Ldb;

    iget-object p0, p0, Lpj2;->z:Lnj2;

    invoke-virtual {v0, p0}, Ldb;->a(Lcb;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 15

    const v0, 0x7f0d006d

    const/4 v1, 0x1

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a03a9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lpj2;->r:Landroid/widget/TextView;

    const p2, 0x7f0a0a94

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lpj2;->s:Landroid/widget/EditText;

    const p2, 0x7f0a0368

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lpj2;->t:Landroid/widget/EditText;

    const p2, 0x7f0a025e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lpj2;->u:Landroid/widget/Button;

    const p2, 0x7f0a057e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/Spinner;

    iput-object p2, p0, Lpj2;->v:Lcom/opera/android/custom_views/Spinner;

    new-instance p2, Lmj2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lmj2;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lpj2;->s:Landroid/widget/EditText;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v1, p0, Lpj2;->t:Landroid/widget/EditText;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p2, p0, Lpj2;->u:Landroid/widget/Button;

    new-instance v1, Lic;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v1, "1"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    iget-object v2, p0, Lpj2;->s:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string v1, "2"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    iget-object v2, p0, Lpj2;->t:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string v1, "0"

    invoke-virtual {p2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lpj2;->w:Ljava/lang/String;

    const-string v1, "3"

    invoke-virtual {p2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lpj2;->x:Ljava/lang/String;

    const p2, 0x7f0a02eb

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const p2, 0x7f141083

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    const v1, 0x7f14120d

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f141158

    filled-new-array {p2, v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f040a52

    invoke-static {v5, v4}, Lf03;->V(ILandroid/content/Context;)Z

    move-result v11

    invoke-virtual {v2, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x101009b

    const v7, 0x7f06063b

    invoke-static {v6, v5, v7}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v8

    new-instance v6, Loj2;

    new-instance v10, Lqxh;

    invoke-direct {v10, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    const-string v9, "https://www.opera.com/privacy"

    move-object v7, p0

    invoke-direct/range {v6 .. v11}, Loj2;-><init>(Lpj2;ILjava/lang/String;Lqxh;Z)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p0

    add-int/2addr p0, v4

    const/16 p2, 0x21

    invoke-virtual {v3, v6, v4, p0, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    new-instance v6, Loj2;

    new-instance v10, Lqxh;

    invoke-direct {v10, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    const-string v9, "https://www.opera.com/terms"

    invoke-direct/range {v6 .. v11}, Loj2;-><init>(Lpj2;ILjava/lang/String;Lqxh;Z)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, p0

    invoke-virtual {v3, v6, p0, v1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    sget-object p0, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p1, v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHighlightColor(I)V

    return-void
.end method
