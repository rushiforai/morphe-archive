.class public final Lw0a;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lw0a;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 4

    iget-byte p0, p0, Lw0a;->c:B

    const/16 v0, 0x1388

    packed-switch p0, :pswitch_data_54

    const p0, 0x7f140f44

    const/4 v0, -0x2

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    invoke-virtual {p0}, Lgtj;->i()V

    return-object p0

    :pswitch_13
    const p0, 0x7f141228

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_1b
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v1, 0x7f140748

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v0}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_2b
    const p0, 0x7f14106e

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_33
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f140ead

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p1, p0, v0}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_44
    const p0, 0x7f140871

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_4c
    const p0, 0x7f141112

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_44
        :pswitch_33
        :pswitch_2b
        :pswitch_1b
        :pswitch_13
    .end packed-switch
.end method
