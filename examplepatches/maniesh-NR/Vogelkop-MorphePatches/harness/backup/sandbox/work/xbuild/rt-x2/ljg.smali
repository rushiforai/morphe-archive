.class public final synthetic Lljg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltjg;


# direct methods
.method public synthetic constructor <init>(Ltjg;B)V
    .registers 3

    iput-byte p2, p0, Lljg;->a:B

    iput-object p1, p0, Lljg;->b:Ltjg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lljg;->a:B

    iget-object p0, p0, Lljg;->b:Ltjg;

    packed-switch v0, :pswitch_data_34

    invoke-virtual {p0}, Ltjg;->l()V

    return-void

    :pswitch_b
    iget-object p0, p0, Ltjg;->o:Lxbf;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgig;

    invoke-interface {p0}, Lgig;->getCurrentTimeline()Lgql;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lgql;->c(Z)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_26

    invoke-interface {p0, v0}, Lgig;->seekToDefaultPosition(I)V

    :cond_26
    return-void

    :pswitch_27
    :try_start_27
    iget-object p0, p0, Ltjg;->m:Lmhd;

    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lghd;

    invoke-virtual {p0}, Lghd;->play()V
    :try_end_32
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_27 .. :try_end_32} :catch_32
    .catch Ljava/lang/InterruptedException; {:try_start_27 .. :try_end_32} :catch_32

    :catch_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_27
        :pswitch_b
    .end packed-switch
.end method
