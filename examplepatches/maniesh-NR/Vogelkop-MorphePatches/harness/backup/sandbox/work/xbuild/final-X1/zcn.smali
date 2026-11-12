.class public final synthetic Lzcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbdn;


# direct methods
.method public synthetic constructor <init>(Lbdn;B)V
    .registers 3

    iput-byte p2, p0, Lzcn;->a:B

    iput-object p1, p0, Lzcn;->b:Lbdn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lzcn;->a:B

    iget-object p0, p0, Lzcn;->b:Lbdn;

    packed-switch v0, :pswitch_data_62

    iget-object v0, p0, Lbdn;->l:Lqdc;

    sget-object v1, Lqcc;->a:Lqcc;

    invoke-virtual {v0, v1}, Lqdc;->g(Lqcc;)V

    iget-object v0, p0, Lbdn;->h:Lcdn;

    iget-object v1, p0, Lbdn;->k:Lxcn;

    iget-object v0, v0, Lcdn;->a:Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lbdn;->c:Lydn;

    iget-object p0, p0, Lbdn;->j:Ladn;

    invoke-virtual {v0, p0}, Lydn;->A(Ltdn;)V

    return-void

    :pswitch_1f
    iget-object v0, p0, Lbdn;->c:Lydn;

    iget-object v1, p0, Lbdn;->j:Ladn;

    invoke-virtual {v0, v1}, Lydn;->b(Ltdn;)V

    iget-object v1, p0, Lbdn;->h:Lcdn;

    iget-object v2, p0, Lbdn;->k:Lxcn;

    iget-object v1, v1, Lcdn;->a:Lh7f;

    invoke-virtual {v1, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v1, p0, Lbdn;->d:Lpt1;

    iget-object v1, v1, Lpt1;->b:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_41

    const v0, 0x7f1413ee

    goto :goto_44

    :cond_41
    const v0, 0x7f141408

    :goto_44
    new-instance v2, Lrxh;

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    invoke-virtual {p0}, Lbdn;->b()V

    iget-object p0, p0, Lbdn;->l:Lqdc;

    sget-object v0, Lqcc;->e:Lqcc;

    invoke-virtual {p0, v0}, Lqdc;->g(Lqcc;)V

    return-void

    :pswitch_57
    iget-object p0, p0, Lbdn;->d:Lpt1;

    iget-object p0, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/vpn/LocationButton;

    invoke-static {p0}, Lqe6;->N(Landroid/view/View;)V

    return-void

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_57
        :pswitch_1f
    .end packed-switch
.end method
