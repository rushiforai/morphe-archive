.class public final synthetic Lgrl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwjj;


# direct methods
.method public synthetic constructor <init>(Lwjj;B)V
    .registers 3

    iput-byte p2, p0, Lgrl;->a:B

    iput-object p1, p0, Lgrl;->b:Lwjj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lgrl;->a:B

    iget-object p0, p0, Lgrl;->b:Lwjj;

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Larl;

    iput-object v0, p0, Lwjj;->d:Ljava/lang/Object;

    if-eqz v0, :cond_25

    iget-object v0, v0, Larl;->a:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v0, Lhrl;

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p0, Larl;

    invoke-interface {v0, p0}, Lhrl;->a(Larl;)V

    :cond_25
    return-void

    :pswitch_26
    iget-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    new-instance v1, Lgrl;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lgrl;-><init>(Lwjj;B)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method
