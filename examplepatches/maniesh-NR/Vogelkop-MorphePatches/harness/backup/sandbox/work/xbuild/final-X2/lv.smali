.class public final Llv;
.super Lca3;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lbz0;


# direct methods
.method public synthetic constructor <init>(Lnz0;Lbz0;B)V
    .registers 4

    iput-byte p3, p0, Llv;->b:B

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lca3;-><init>(B)V

    iput-object p2, p0, Llv;->c:Lbz0;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 4

    iget-byte v0, p0, Llv;->b:B

    packed-switch v0, :pswitch_data_30

    return-void

    :pswitch_6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const/4 v1, -0x1

    iget-object p0, p0, Llv;->c:Lbz0;

    invoke-virtual {p0, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p0

    const-class v0, Landroid/text/style/CharacterStyle;

    const/4 v1, 0x0

    invoke-interface {p1, v1, p0, v0}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/text/style/CharacterStyle;

    :goto_23
    array-length v0, p0

    if-ge v1, v0, :cond_2e

    aget-object v0, p0, v1

    invoke-interface {p1, v0}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6

    iget-byte v0, p0, Llv;->b:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1, p2, p3, p4}, Lca3;->onTextChanged(Ljava/lang/CharSequence;III)V

    return-void

    :pswitch_9
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    const/4 p2, -0x1

    iget-object p0, p0, Llv;->c:Lbz0;

    invoke-virtual {p0, p2}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
