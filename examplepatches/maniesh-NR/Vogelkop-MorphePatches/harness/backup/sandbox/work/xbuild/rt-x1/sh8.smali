.class public final synthetic Lsh8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvv3;

.field public final synthetic c:Lbz0;


# direct methods
.method public synthetic constructor <init>(Lvv3;Lbz0;B)V
    .registers 4

    iput-byte p3, p0, Lsh8;->a:B

    iput-object p1, p0, Lsh8;->b:Lvv3;

    iput-object p2, p0, Lsh8;->c:Lbz0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lsh8;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lsh8;->c:Lbz0;

    iget-object p0, p0, Lsh8;->b:Lvv3;

    packed-switch p1, :pswitch_data_4a

    sget-object p1, Lvb0;->b:Lvb0;

    iput-object p1, p0, Lvv3;->d:Lvb0;

    invoke-virtual {p0}, Lvv3;->b()V

    invoke-virtual {v2, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    iget-object p1, p0, Lvv3;->e:Landroid/view/View;

    if-eqz p1, :cond_1c

    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    :cond_1c
    const/4 p1, -0x2

    invoke-virtual {v2, p1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    const/4 p1, -0x1

    invoke-virtual {v2, p1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p1

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    iget-object p0, p0, Lvv3;->h:Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->f1()V

    return-void

    :pswitch_39
    iput-boolean v0, p0, Lvv3;->f:Z

    invoke-virtual {v2}, Lzp1;->dismiss()V

    iget-object p0, p0, Lvv3;->c:Lgjm;

    new-instance p1, Ln35;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_39
    .end packed-switch
.end method
