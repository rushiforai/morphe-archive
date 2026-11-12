.class public final Ldn3;
.super Le7n;
.source "SourceFile"


# instance fields
.field public final synthetic k:Lgn3;


# direct methods
.method public constructor <init>(Lgn3;Landroid/view/View;Ltzi;B)V
    .registers 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p4, :pswitch_data_4c

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ldn3;->k:Lgn3;

    invoke-direct {p0, p2, p3}, Lak7;-><init>(Landroid/view/View;Ltzi;)V

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p1, Lcn3;

    invoke-direct {p1, p0, v1}, Lcn3;-><init>(Ldn3;B)V

    iget-object p3, p2, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p3, p3, Lei;->f:Ljava/lang/Object;

    check-cast p3, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lcn3;

    invoke-direct {p1, p0, v0}, Lcn3;-><init>(Ldn3;B)V

    invoke-virtual {p2, p1}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_26
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ldn3;->k:Lgn3;

    invoke-direct {p0, p2, p3}, Lak7;-><init>(Landroid/view/View;Ltzi;)V

    invoke-static {p2}, Llwk;->a(Landroid/view/View;)Llwk;

    move-result-object p1

    iget-object p1, p1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance p2, Len3;

    invoke-direct {p2, p0, v1}, Len3;-><init>(Ldn3;B)V

    iget-object p3, p1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p3, p3, Lei;->f:Ljava/lang/Object;

    check-cast p3, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Len3;

    invoke-direct {p2, p0, v0}, Len3;-><init>(Ldn3;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_26
    .end packed-switch
.end method
