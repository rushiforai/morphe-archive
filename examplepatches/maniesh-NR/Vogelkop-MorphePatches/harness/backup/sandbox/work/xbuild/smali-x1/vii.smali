.class public final synthetic Lvii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liji;


# direct methods
.method public synthetic constructor <init>(Liji;B)V
    .registers 3

    iput-byte p2, p0, Lvii;->a:B

    iput-object p1, p0, Lvii;->b:Liji;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lvii;->a:B

    iget-object p0, p0, Lvii;->b:Liji;

    packed-switch v0, :pswitch_data_5a

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Liji;->c:Ldx3;

    new-instance v1, Lw8d;

    const/4 v2, 0x2

    invoke-direct {v1, v2, p0, p1}, Lw8d;-><init>(BLjava/lang/Object;Z)V

    sget-object p0, Llg7;->a:[[I

    invoke-static {v0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_23

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Lw8d;->run(Ljava/lang/Object;)V

    goto :goto_2f

    :cond_23
    iget-object p0, v0, Ldx3;->j:Lqi;

    new-instance p1, Ldz4;

    invoke-direct {p1, v1}, Ldz4;-><init>(Lcom/opera/api/Callback;)V

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v0, p1}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    :goto_2f
    return-void

    :pswitch_30
    check-cast p1, Landroid/net/Uri;

    iget-object v0, p0, Liji;->p:Landroid/net/Uri;

    invoke-virtual {v0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_58

    iput-object p1, p0, Liji;->p:Landroid/net/Uri;

    invoke-virtual {p0}, Liji;->Z()Z

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Liji;->m(Z)V

    iget-object p1, p0, Liji;->o:Lrf2;

    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaChip;

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Liji;->p:Landroid/net/Uri;

    invoke-static {v0, p0}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_58
    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_30
    .end packed-switch
.end method
