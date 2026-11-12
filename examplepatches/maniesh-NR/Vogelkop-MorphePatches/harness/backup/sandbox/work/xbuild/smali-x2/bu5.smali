.class public final synthetic Lbu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzt5;


# direct methods
.method public synthetic constructor <init>(Lzt5;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lbu5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbu5;->b:Lzt5;

    return-void
.end method

.method public synthetic constructor <init>(Lzt5;Lcu5;)V
    .registers 3

    .line 9
    const/4 p2, 0x0

    iput-byte p2, p0, Lbu5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbu5;->b:Lzt5;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lbu5;->a:B

    iget-object p0, p0, Lbu5;->b:Lzt5;

    packed-switch v0, :pswitch_data_40

    check-cast p1, Lvr8;

    iget-object v0, p1, Lvr8;->b:Llaj;

    iget-object p0, p0, Lzt5;->c:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Llaj;->a(Landroid/widget/TextView;)V

    iget-object p1, p1, Lvr8;->f:Lcxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void

    :pswitch_1e
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lzt5;->c:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez p1, :cond_30

    const p1, 0x7f1404cf

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_3b

    :cond_30
    const v1, 0x7f1404ce

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_3b
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
