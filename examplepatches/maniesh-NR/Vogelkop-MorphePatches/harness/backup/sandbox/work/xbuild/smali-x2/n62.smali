.class public final Ln62;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls62;


# direct methods
.method public synthetic constructor <init>(Ls62;B)V
    .registers 3

    iput-byte p2, p0, Ln62;->a:B

    iput-object p1, p0, Ln62;->b:Ls62;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 4

    iget-byte v0, p0, Ln62;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_9
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Ln62;->b:Ls62;

    iget-object p1, p0, Ls62;->l:Lwth;

    iget-object p1, p1, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Ld12;

    invoke-interface {p1}, Ld12;->d()V

    iget-object p1, p0, Ls62;->w:Lr9i;

    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v0, p1, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    invoke-static {v0, v1}, LJ/N;->MVisE3We(J)V

    const-wide/16 v0, 0x0

    iput-wide v0, p1, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    invoke-virtual {p0}, Ls62;->m()V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onStop(Lndc;)V
    .registers 2

    iget-byte p1, p0, Ln62;->a:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Ln62;->b:Ls62;

    invoke-virtual {p0}, Ls62;->f()Lqyj;

    move-result-object p0

    invoke-virtual {p0}, Lqyj;->f()V

    return-void

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
