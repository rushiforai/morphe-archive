.class public final synthetic Ljx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Runnable;B)V
    .registers 4

    iput-byte p3, p0, Ljx3;->a:B

    iput-object p1, p0, Ljx3;->b:Ljava/lang/String;

    iput-object p2, p0, Ljx3;->c:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Ljx3;->a:B

    const-string v1, " running callback"

    iget-object v2, p0, Ljx3;->c:Ljava/lang/Runnable;

    iget-object p0, p0, Ljx3;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_70

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnUserExecutor "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Llni;->h(Ljava/lang/String;)V

    :try_start_1f
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_26

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_26
    move-exception p0

    :try_start_27
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_2b

    goto :goto_2f

    :catchall_2b
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2f
    throw p0

    :pswitch_30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Cronet JavaUrlRequest#executeOnExecutor "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Llni;->h(Ljava/lang/String;)V

    :try_start_44
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_4b

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_4b
    move-exception p0

    :try_start_4c
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_50

    goto :goto_54

    :catchall_50
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_54
    throw p0

    :pswitch_55
    sget-object v0, Llx3;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_5b
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkx3;

    invoke-interface {v1, p0}, Lkx3;->b(Ljava/lang/String;)V

    goto :goto_5b

    :cond_6b
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    return-void

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_55
        :pswitch_30
    .end packed-switch
.end method
