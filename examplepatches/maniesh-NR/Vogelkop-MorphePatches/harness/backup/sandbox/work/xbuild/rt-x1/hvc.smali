.class public final synthetic Lhvc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;ZZB)V
    .registers 6

    iput-byte p5, p0, Lhvc;->a:B

    iput-object p1, p0, Lhvc;->d:Ljava/lang/Object;

    iput-object p2, p0, Lhvc;->e:Ljava/lang/Object;

    iput-boolean p3, p0, Lhvc;->b:Z

    iput-boolean p4, p0, Lhvc;->c:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lhvc;->a:B

    const/4 v1, 0x0

    iget-boolean v2, p0, Lhvc;->c:Z

    iget-boolean v3, p0, Lhvc;->b:Z

    iget-object v4, p0, Lhvc;->e:Ljava/lang/Object;

    iget-object p0, p0, Lhvc;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_60

    check-cast p0, Lev4;

    check-cast v4, Lttn;

    iget-object v0, p0, Lev4;->f:Ljava/lang/Object;

    check-cast v0, Lszk;

    iget-object v0, v0, Lszk;->a:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast p0, Ljvg;

    invoke-virtual {p0, v3, v2}, Ljvg;->E(ZZ)V

    return-void

    :pswitch_23
    check-cast p0, Lev4;

    check-cast v4, Ly1n;

    iget-object v0, p0, Lev4;->f:Ljava/lang/Object;

    check-cast v0, Lszk;

    iget-object v0, v0, Lszk;->a:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast p0, Lwci;

    invoke-virtual {p0, v3, v2}, Lwci;->p(ZZ)V

    return-void

    :pswitch_38
    check-cast p0, Lnlh;

    check-cast v4, Lilh;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, v3, v2, v1}, Lnlh;->K0(Ljava/util/List;ZZZ)V

    return-void

    :pswitch_44
    check-cast p0, Li3j;

    check-cast v4, Lcre;

    iget-object v0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast v0, Lta7;

    invoke-virtual {v0, v4, v3}, Lta7;->F(Lcre;Z)V

    iget-object v0, p0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Lcre;

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5e

    if-eqz v2, :cond_5e

    invoke-virtual {p0, v3, v1}, Li3j;->H(ZZ)V

    :cond_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_44
        :pswitch_38
        :pswitch_23
    .end packed-switch
.end method
