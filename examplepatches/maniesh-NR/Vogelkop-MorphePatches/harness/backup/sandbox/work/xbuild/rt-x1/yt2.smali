.class public final synthetic Lyt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzt2;

.field public final synthetic c:Lw3g;


# direct methods
.method public synthetic constructor <init>(Lzt2;Lw3g;B)V
    .registers 4

    iput-byte p3, p0, Lyt2;->a:B

    iput-object p1, p0, Lyt2;->b:Lzt2;

    iput-object p2, p0, Lyt2;->c:Lw3g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lyt2;->a:B

    iget-object v1, p0, Lyt2;->c:Lw3g;

    iget-object p0, p0, Lyt2;->b:Lzt2;

    packed-switch v0, :pswitch_data_2c

    new-instance v0, Lxw;

    iget-object p0, p0, Lzt2;->c:Lwth;

    const/4 v2, 0x2

    invoke-direct {v0, v1, p0, v2}, Lxw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_15
    iget-object p0, p0, Lzt2;->c:Lwth;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Leu2;

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p0

    iget-object p1, p0, Lhu2;->e:Lx5g;

    new-instance v0, Lwx;

    const/16 v2, 0xd

    invoke-direct {v0, p0, v1, v2}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
