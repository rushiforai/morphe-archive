.class public final Lnwf;
.super Lt0h;
.source "SourceFile"

# interfaces
.implements Lgim;
.implements Lhim;


# instance fields
.field public final synthetic a:B

.field public final b:Lhv3;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lhv3;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lnwf;->a:B

    iput-object p1, p0, Lnwf;->b:Lhv3;

    iput-object p2, p0, Lnwf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    new-instance v0, Lbbl;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lbbl;-><init>(Lnwf;Landroid/view/View;B)V

    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 4

    new-instance v0, Lbbl;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lbbl;-><init>(Lnwf;Landroid/view/View;B)V

    return-void
.end method

.method public final u(Z)V
    .registers 4

    iget-byte v0, p0, Lnwf;->a:B

    packed-switch v0, :pswitch_data_14

    new-instance v0, Lzp3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lzp3;-><init>(Lt0h;ZB)V

    return-void

    :pswitch_c
    new-instance v0, Lmwf;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lmwf;-><init>(Lnwf;ZB)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final v(Lph0;)V
    .registers 2

    iget-object p0, p0, Lnwf;->c:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->f0(Lph0;)V

    return-void
.end method

.method public final w(Lxl0;)V
    .registers 2

    iget-object p0, p0, Lnwf;->c:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->k0(Lxl0;)V

    return-void
.end method

.method public final x(Lrq0;)V
    .registers 4

    iget-object p0, p0, Lnwf;->c:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Lo5f;

    const/4 v1, 0x5

    invoke-direct {v0, p1, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
