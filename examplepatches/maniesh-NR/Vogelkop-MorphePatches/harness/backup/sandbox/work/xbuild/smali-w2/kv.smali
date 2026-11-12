.class public final synthetic Lkv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;B)V
    .registers 3

    iput-byte p2, p0, Lkv;->a:B

    iput-object p1, p0, Lkv;->b:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lkv;->a:B

    iget-object p0, p0, Lkv;->b:Landroid/widget/EditText;

    packed-switch v0, :pswitch_data_1c

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    :cond_16
    return-void

    :pswitch_17
    invoke-static {p0}, Lq9n;->H(Landroid/view/View;)Z

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
