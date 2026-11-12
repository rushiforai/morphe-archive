.class public final synthetic Lfhd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmhd;

.field public final synthetic c:Lghd;


# direct methods
.method public synthetic constructor <init>(Lmhd;Lghd;B)V
    .registers 4

    iput-byte p3, p0, Lfhd;->a:B

    iput-object p1, p0, Lfhd;->b:Lmhd;

    iput-object p2, p0, Lfhd;->c:Lghd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lfhd;->a:B

    iget-object v1, p0, Lfhd;->c:Lghd;

    iget-object p0, p0, Lfhd;->b:Lmhd;

    packed-switch v0, :pswitch_data_2c

    invoke-virtual {p0}, Lm4;->isCancelled()Z

    move-result p0

    if-eqz p0, :cond_12

    invoke-virtual {v1}, Lghd;->release()V

    :cond_12
    return-void

    :pswitch_13
    iput-object v1, p0, Lmhd;->b:Lghd;

    iget-boolean v0, p0, Lmhd;->c:Z

    if-eqz v0, :cond_1c

    invoke-virtual {p0, v1}, Lm4;->set(Ljava/lang/Object;)Z

    :cond_1c
    new-instance v0, Lfhd;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lfhd;-><init>(Lmhd;Lghd;B)V

    new-instance v1, Lk31;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lk31;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, v1}, Lm4;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
