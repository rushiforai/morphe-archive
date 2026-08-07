.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WarmedUpReceiver"
.end annotation


# instance fields
.field private mCurrentBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;->mCurrentBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v2, "Matrix.WarmUpDelegate"

    .line 5
    .line 6
    const-string v3, "Warm-up received."

    .line 7
    .line 8
    invoke-static {v2, v3, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v1, "action.backtrace.warmed-up"

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_1
    const/4 p2, 0x1

    .line 28
    invoke-static {p2}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setWarmedUp(Z)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;->mCurrentBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 32
    .line 33
    invoke-static {p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$800(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    const-string p1, "Unregister receiver twice."

    .line 42
    .line 43
    new-array p2, v0, [Ljava/lang/Object;

    .line 44
    .line 45
    invoke-static {v2, p0, p1, p2}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
