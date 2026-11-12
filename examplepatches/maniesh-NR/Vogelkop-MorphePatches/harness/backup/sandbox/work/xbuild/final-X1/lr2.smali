.class public final Llr2;
.super Lx1p;
.source "SourceFile"


# instance fields
.field public final synthetic p:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Llr2;->p:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final B(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte v0, p0, Llr2;->p:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Lx1p;->B(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_a
    const p0, 0x7f140da2

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_12
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final x()Z
    .registers 2

    iget-byte v0, p0, Llr2;->p:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Lx1p;->x()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x0

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final z(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-byte p0, p0, Llr2;->p:B

    packed-switch p0, :pswitch_data_26

    const p0, 0x7f141264

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d
    const p0, 0x7f14122d

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    const p0, 0x7f141233

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1d
    const p0, 0x7f14025e

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method
