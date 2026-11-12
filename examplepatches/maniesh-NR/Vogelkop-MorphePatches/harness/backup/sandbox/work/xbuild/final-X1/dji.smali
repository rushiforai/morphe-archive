.class public final Ldji;
.super Ly0j;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Liji;


# direct methods
.method public synthetic constructor <init>(Liji;B)V
    .registers 3

    iput-byte p2, p0, Ldji;->c:B

    iput-object p1, p0, Ldji;->d:Liji;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ly0j;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Ldji;->c:B

    const/4 v0, 0x1

    iget-object p0, p0, Ldji;->d:Liji;

    packed-switch p1, :pswitch_data_46

    invoke-virtual {p0}, Liji;->C()V

    iget-object p1, p0, Liji;->c:Ldx3;

    iget-object v0, p0, Liji;->p:Landroid/net/Uri;

    new-instance v1, Lvii;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lvii;-><init>(Liji;B)V

    invoke-static {p1, v0, v2, v1}, Llcp;->G(Ldx3;Landroid/net/Uri;ZLcom/opera/api/Callback;)V

    return-void

    :pswitch_19
    invoke-virtual {p0}, Liji;->D()V

    invoke-virtual {p0}, Ldej;->b()V

    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v1, Lwii;

    invoke-direct {v1, p0, v0}, Lwii;-><init>(Liji;B)V

    invoke-virtual {p0, p1, v1}, Liji;->w(Landroid/content/Context;Lwii;)V

    return-void

    :pswitch_2e
    invoke-virtual {p0}, Liji;->I()V

    return-void

    :pswitch_32
    invoke-virtual {p0}, Liji;->z()V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_39
    invoke-virtual {p0}, Liji;->H()V

    return-void

    :pswitch_3d
    invoke-virtual {p0}, Liji;->y()V

    return-void

    :pswitch_41
    invoke-virtual {p0, v0}, Liji;->l(Z)V

    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_41
        :pswitch_3d
        :pswitch_39
        :pswitch_32
        :pswitch_2e
        :pswitch_19
    .end packed-switch
.end method
