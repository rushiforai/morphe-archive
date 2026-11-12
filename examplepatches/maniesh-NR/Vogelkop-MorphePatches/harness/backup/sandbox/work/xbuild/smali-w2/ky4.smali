.class public final Lky4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz6f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lky4;->a:B

    iput-object p1, p0, Lky4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 5

    iget-byte v0, p0, Lky4;->a:B

    packed-switch v0, :pswitch_data_48

    return-void

    :pswitch_6
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Llg7;->b(Ljava/lang/String;)I

    move-result p1

    iget-object p0, p0, Lky4;->b:Ljava/lang/Object;

    check-cast p0, Liji;

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xff

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f1405b2

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Liji;->o:Lrf2;

    iget-object v1, v1, Lrf2;->i:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Liji;->o:Lrf2;

    iget-object v0, v0, Lrf2;->k:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    if-lez p1, :cond_40

    const/4 p1, 0x1

    goto :goto_41

    :cond_40
    const/4 p1, 0x0

    :goto_41
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Liji;->S()V

    return-void

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final b(Z)V
    .registers 2

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final d(II)V
    .registers 3

    return-void
.end method

.method public final e()V
    .registers 3

    iget-byte v0, p0, Lky4;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lky4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v0

    iget-object v0, v0, Lz5l;->v:Lx2l;

    iget-object v0, v0, Lx2l;->o:Lo2l;

    iget-object v0, v0, Lo2l;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1e

    invoke-virtual {p0}, Lr9l;->u()V

    goto :goto_21

    :cond_1e
    invoke-virtual {p0, v1}, Lr9l;->r(Z)Z

    :goto_21
    return-void

    :pswitch_22
    check-cast p0, Liji;

    invoke-virtual {p0, v1}, Liji;->l(Z)V

    return-void

    :pswitch_28
    check-cast p0, Lly4;

    iget-object p0, p0, Lly4;->u:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_28
        :pswitch_22
    .end packed-switch
.end method

.method public final f(Z)V
    .registers 4

    iget-byte v0, p0, Lky4;->a:B

    iget-object v1, p0, Lky4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_26

    return-void

    :pswitch_8
    if-nez p1, :cond_10

    check-cast v1, Liji;

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Liji;->l(Z)V

    :cond_10
    return-void

    :pswitch_11
    check-cast v1, Lly4;

    iget-object v0, v1, Lly4;->u:Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz p1, :cond_22

    new-instance p1, Lig;

    const/16 v1, 0x11

    invoke-direct {p1, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_25

    :cond_22
    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    :goto_25
    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_11
        :pswitch_8
    .end packed-switch
.end method

.method public final h()V
    .registers 1

    return-void
.end method

.method public final i()V
    .registers 1

    return-void
.end method

.method public final j(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p1, p0, Lky4;->a:B

    packed-switch p1, :pswitch_data_12

    return-void

    :pswitch_6
    if-eqz p3, :cond_a

    if-nez p4, :cond_11

    :cond_a
    iget-object p0, p0, Lky4;->b:Ljava/lang/Object;

    check-cast p0, Lly4;

    invoke-virtual {p0}, Lly4;->G0()V

    :cond_11
    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
