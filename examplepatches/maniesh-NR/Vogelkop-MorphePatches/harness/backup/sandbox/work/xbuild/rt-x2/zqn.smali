.class public final synthetic Lzqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrn;


# direct methods
.method public synthetic constructor <init>(Lmrn;B)V
    .registers 3

    iput-byte p2, p0, Lzqn;->a:B

    iput-object p1, p0, Lzqn;->b:Lmrn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lzqn;->a:B

    iget-object p0, p0, Lzqn;->b:Lmrn;

    packed-switch v0, :pswitch_data_40

    iget-object p0, p0, Lmrn;->p:Lkrn;

    sget-object p1, Ldrn;->j:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_f
    iget-object p0, p0, Lmrn;->p:Lkrn;

    sget-object p1, Ldrn;->b:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_17
    iget-object p1, p0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    iget-object p0, p0, Lmrn;->p:Lkrn;

    sget-object p1, Ldrn;->g:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_24
    iget-object v0, p0, Lmrn;->p:Lkrn;

    sget-object v1, Ldrn;->c:Ldrn;

    invoke-interface {v0, v1}, Lkrn;->f(Ltc2;)V

    new-instance v0, Lxw;

    const/16 v1, 0xd

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p0, v2}, Lxw;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_37
    iget-object p0, p0, Lmrn;->p:Lkrn;

    sget-object p1, Ldrn;->i:Ldrn;

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    return-void

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_37
        :pswitch_24
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
