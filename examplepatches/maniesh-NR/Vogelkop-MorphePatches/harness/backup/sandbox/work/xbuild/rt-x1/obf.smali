.class public final synthetic Lobf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvbf;


# direct methods
.method public synthetic constructor <init>(Lvbf;B)V
    .registers 3

    iput-byte p2, p0, Lobf;->a:B

    iput-object p1, p0, Lobf;->b:Lvbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lobf;->a:B

    iget-object p0, p0, Lobf;->b:Lvbf;

    packed-switch v0, :pswitch_data_28

    iget-object p0, p0, Lvbf;->z:Lubf;

    iget-object p0, p0, Lubf;->f:Lyl2;

    return-object p0

    :pswitch_c
    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_24
    return-object v0

    :pswitch_25
    iget-object p0, p0, Lvbf;->G:Leri;

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_25
        :pswitch_c
    .end packed-switch
.end method
