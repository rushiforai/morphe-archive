.class public final LQ/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LQ/d;LR/h;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LQ/c;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ/c;->c:Ljava/lang/Object;

    iput-object p2, p0, LQ/c;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    iput p2, p0, LQ/c;->a:I

    iput-object p1, p0, LQ/c;->b:Ljava/lang/Object;

    iput-object p3, p0, LQ/c;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget v0, p0, LQ/c;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, LQ/c;->b:Ljava/lang/Object;

    check-cast v0, Lv/d;

    iget-object v1, p0, LQ/c;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lv/d;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_0
    iget-object v0, p0, LQ/c;->b:Ljava/lang/Object;

    check-cast v0, LC/j;

    iget-object v0, v0, LC/j;->b:Ljava/lang/Object;

    check-cast v0, Li/U;

    if-eqz v0, :cond_0

    iget-object v1, p0, LQ/c;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Li/U;->b(Landroid/graphics/Typeface;)V

    :cond_0
    return-void

    :pswitch_1
    :try_start_0
    sget-object v0, Lo/d;->d:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, LQ/c;->c:Ljava/lang/Object;

    iget-object v2, p0, LQ/c;->b:Ljava/lang/Object;

    if-eqz v0, :cond_1

    :try_start_1
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v4, "AppCompat recreation"

    filled-new-array {v1, v3, v4}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_1
    sget-object v0, Lo/d;->e:Ljava/lang/reflect/Method;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :goto_0
    const-string v1, "ActivityRecreator"

    const-string v2, "Exception while invoking performStopActivity"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    :goto_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Ljava/lang/RuntimeException;

    if-ne v1, v2, :cond_3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unable to stop"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    throw v0

    :cond_3
    :goto_2
    return-void

    :pswitch_2
    iget-object v0, p0, LQ/c;->b:Ljava/lang/Object;

    check-cast v0, Landroid/app/Application;

    iget-object v1, p0, LQ/c;->c:Ljava/lang/Object;

    check-cast v1, Lo/c;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void

    :pswitch_3
    iget-object v0, p0, LQ/c;->b:Ljava/lang/Object;

    check-cast v0, Lo/c;

    iget-object v1, p0, LQ/c;->c:Ljava/lang/Object;

    iput-object v1, v0, Lo/c;->a:Ljava/lang/Object;

    return-void

    :pswitch_4
    :try_start_2
    iget-object v0, p0, LQ/c;->c:Ljava/lang/Object;

    check-cast v0, LQ/d;

    iget-object v0, v0, LQ/d;->b:Ljava/util/concurrent/PriorityBlockingQueue;

    iget-object v1, p0, LQ/c;->b:Ljava/lang/Object;

    check-cast v1, LR/h;

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
