.class public Lcom/opera/android/pushmessaging/GCMBackgroundService;
.super Landroid/app/IntentService;
.source "SourceFile"


# static fields
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .registers 2

    const-string v0, "GCMBackgroundService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final onHandleIntent(Landroid/content/Intent;)V
    .registers 4

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    new-instance v0, Lwu5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, v0}, Les9;->a(Ljava/lang/Object;Lcs9;)Les9;

    move-result-object p1

    if-nez p1, :cond_16

    :cond_15
    return-void

    :cond_16
    new-instance v0, Lzr9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lorg/chromium/base/task/PostTask;->a:Ljava/lang/Object;

    new-instance p0, Ljava/util/concurrent/FutureTask;

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    const/4 p1, 0x7

    invoke-static {p1, p0}, Lorg/chromium/base/task/PostTask;->d(ILjava/lang/Runnable;)V

    :try_start_28
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_2c

    return-void

    :catch_2c
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    return-void
.end method
