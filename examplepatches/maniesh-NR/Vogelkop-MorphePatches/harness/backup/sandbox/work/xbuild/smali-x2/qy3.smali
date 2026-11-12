.class public final Lqy3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqy3;->a:B

    iput-object p1, p0, Lqy3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte p0, p0, Lqy3;->a:B

    packed-switch p0, :pswitch_data_c

    const/4 p0, 0x2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Le7d;->b(ILjava/lang/Throwable;)V

    :pswitch_a
    return-void

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final c()V
    .registers 9

    iget-byte v0, p0, Lqy3;->a:B

    packed-switch v0, :pswitch_data_5a

    iget-object p0, p0, Lqy3;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    new-instance v0, Lcom/opera/android/browser/NativeStatsTracker;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    invoke-direct {v0, p0}, Lcom/opera/android/browser/NativeStatsTracker;-><init>(Lx5f;)V

    invoke-static {v0}, LJ/N;->MqKMb1xK(Ljava/lang/Object;)V

    sget-object v1, Le7d;->a:Ljava/lang/Object;

    monitor-enter v1

    const/4 p0, 0x3

    :try_start_1b
    sput p0, Le7d;->b:I

    sget-object p0, Le7d;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_24
    if-ge v2, v0, :cond_32

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lc7d;

    invoke-interface {v3}, Lc7d;->onSuccess()V

    goto :goto_24

    :cond_32
    sget-object p0, Le7d;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v1

    return-void

    :goto_39
    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_1b .. :try_end_3a} :catchall_3b

    throw p0

    :catchall_3b
    move-exception v0

    move-object p0, v0

    goto :goto_39

    :pswitch_3e
    sget-object v2, Lt8;->a:Landroid/content/Context;

    iget-object p0, p0, Lqy3;->b:Ljava/lang/Object;

    check-cast p0, Lry3;

    iget-object p0, p0, Lry3;->b:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    new-instance v0, Lorg/chromium/content/browser/TracingControllerAndroidImpl;

    invoke-direct {v0, v2}, Lorg/chromium/content/browser/TracingControllerAndroidImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->j:Lorg/chromium/content/browser/TracingControllerAndroidImpl;

    iget-object p0, p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->j:Lorg/chromium/content/browser/TracingControllerAndroidImpl;

    iget-object v3, p0, Lorg/chromium/content/browser/TracingControllerAndroidImpl;->b:Lup1;

    iget-object v4, p0, Lorg/chromium/content/browser/TracingControllerAndroidImpl;->c:Lorg/chromium/content/browser/TracingControllerAndroidImpl$TracingIntentFilter;

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    return-void

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_3e
    .end packed-switch
.end method
