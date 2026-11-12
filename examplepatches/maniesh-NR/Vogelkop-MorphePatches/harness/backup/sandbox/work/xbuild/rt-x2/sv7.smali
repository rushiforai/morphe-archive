.class public final synthetic Lsv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyv7;


# direct methods
.method public synthetic constructor <init>(Lyv7;B)V
    .registers 3

    iput-byte p2, p0, Lsv7;->a:B

    iput-object p1, p0, Lsv7;->b:Lyv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lsv7;->a:B

    iget-object p0, p0, Lsv7;->b:Lyv7;

    packed-switch v0, :pswitch_data_3e

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHighlightColor()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12
    iget-object p0, p0, Lyv7;->n:Lxv7;

    iget-object p0, p0, Lxv7;->a:Lyl2;

    return-object p0

    :pswitch_17
    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_31

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_31
    return-object v0

    :pswitch_32
    iget-object p0, p0, Lyv7;->d:Liv7;

    iget-object p0, p0, Liv7;->f:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leri;

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_32
        :pswitch_17
        :pswitch_12
    .end packed-switch
.end method
