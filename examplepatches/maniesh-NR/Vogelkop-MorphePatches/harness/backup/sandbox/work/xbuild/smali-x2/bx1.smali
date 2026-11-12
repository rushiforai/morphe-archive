.class public final synthetic Lbx1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lbx1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Ljava/lang/Runnable;)V
    .registers 2

    return-void
.end method

.method private final b(Ljava/lang/Runnable;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 2

    iget-byte p0, p0, Lbx1;->a:B

    packed-switch p0, :pswitch_data_2a

    return-void

    :pswitch_6
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_a
    invoke-static {p1}, Lorg/chromium/net/Proxy;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_e
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->a()Landroid/os/Handler;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :pswitch_16
    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1a
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :pswitch_1d
    return-void

    :pswitch_1e
    invoke-static {}, Lcx1;->C()Lcx1;

    move-result-object p0

    iget-object p0, p0, Lcx1;->a:Lqw6;

    iget-object p0, p0, Lqw6;->b:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_1d
        :pswitch_1a
        :pswitch_16
        :pswitch_e
        :pswitch_a
        :pswitch_6
    .end packed-switch
.end method
