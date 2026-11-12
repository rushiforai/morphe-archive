.class public final Lix;
.super Llu8;
.source "SourceFile"


# static fields
.field public static final synthetic m:I

.field public static final synthetic n:I

.field public static final synthetic o:I


# instance fields
.field public final synthetic l:B


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lize;B)V
    .registers 4

    iput-byte p3, p0, Lix;->l:B

    invoke-direct {p0, p1, p2}, Llu8;-><init>(Landroid/view/View;Lize;)V

    return-void
.end method


# virtual methods
.method public final h0(Landroid/widget/RelativeLayout$LayoutParams;)V
    .registers 3

    iget-byte v0, p0, Lix;->l:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Llu8;->h0(Landroid/widget/RelativeLayout$LayoutParams;)V

    return-void

    :pswitch_9
    const/4 p0, -0x2

    iput p0, p1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iput p0, p1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    const/16 p0, 0xe

    invoke-virtual {p1, p0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    return-void

    :pswitch_data_14
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final i0()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lix;->l:B

    packed-switch v0, :pswitch_data_2c

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lejf;

    iget-object p0, p0, Lejf;->u:Lz13;

    return-object p0

    :pswitch_12
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lvo8;

    iget-object p0, p0, Lvo8;->u:Lqo8;

    return-object p0

    :pswitch_1f
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lbo;

    iget-object p0, p0, Lbo;->w:Lzq;

    return-object p0

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_12
    .end packed-switch
.end method
