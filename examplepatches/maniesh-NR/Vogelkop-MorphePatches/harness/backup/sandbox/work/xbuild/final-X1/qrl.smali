.class public final synthetic Lqrl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ZZB)V
    .registers 5

    iput-byte p4, p0, Lqrl;->a:B

    iput-object p1, p0, Lqrl;->d:Ljava/lang/Object;

    iput-boolean p2, p0, Lqrl;->b:Z

    iput-boolean p3, p0, Lqrl;->c:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lqrl;->a:B

    iget-boolean v1, p0, Lqrl;->c:Z

    iget-boolean v2, p0, Lqrl;->b:Z

    iget-object p0, p0, Lqrl;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lev4;

    iget-object p0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast p0, Ljvg;

    invoke-virtual {p0, v2, v1}, Ljvg;->E(ZZ)V

    return-void

    :pswitch_15
    check-cast p0, Lev4;

    iget-object p0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast p0, Lwci;

    invoke-virtual {p0, v2, v1}, Lwci;->p(ZZ)V

    return-void

    :pswitch_1f
    check-cast p0, Lk8;

    invoke-virtual {p0, v2}, Lk8;->k0(Z)V

    new-instance v0, Lgh2;

    const/16 v2, 0xd

    invoke-direct {v0, v2, p0, v1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_15
    .end packed-switch
.end method
