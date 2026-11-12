.class public final synthetic Le5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqfb;


# direct methods
.method public synthetic constructor <init>(Lqfb;B)V
    .registers 3

    iput-byte p2, p0, Le5g;->a:B

    iput-object p1, p0, Le5g;->b:Lqfb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Le5g;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Le5g;->b:Lqfb;

    packed-switch p1, :pswitch_data_50

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iput-boolean v0, p0, Lt6g;->q:Z

    iget-object p1, p0, Lt6g;->i:Lzwk;

    iget-object v1, p0, Lt6g;->t:Lfn3;

    invoke-virtual {p1, v1}, Lzwk;->a(Lywk;)V

    iget-object p1, p0, Lt6g;->p:Lkze;

    iget-object v1, p0, Lt6g;->u:Lt77;

    invoke-virtual {p1, v1}, Lekc;->k(Lf7f;)V

    iget-object p1, p0, Lt6g;->b:Lot2;

    iget-object p1, p1, Lot2;->l:Landroidx/fragment/app/w;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    iget-object p0, p0, Lt6g;->k:Lorm;

    sget-object p1, Lgm0;->c:Lgm0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->l0(Lgm0;)V

    return-void

    :pswitch_32
    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p1, p0, Lt6g;->b:Lot2;

    iget-object p1, p1, Lot2;->b:Lgjm;

    new-instance v1, Ld3b;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, v1, v0}, Lgjm;->e(Ln37;Z)V

    iget-object p0, p0, Lt6g;->k:Lorm;

    sget-object p1, Lgm0;->b:Lgm0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->l0(Lgm0;)V

    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
