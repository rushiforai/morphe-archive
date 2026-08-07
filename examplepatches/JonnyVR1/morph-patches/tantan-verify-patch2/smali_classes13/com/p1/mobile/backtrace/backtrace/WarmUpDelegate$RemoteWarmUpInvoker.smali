.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;
.implements Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RemoteWarmUpInvoker"
.end annotation


# instance fields
.field private mArgs:Landroid/os/Bundle;

.field private mContext:Landroid/content/Context;

.field mImpl:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

.field private final mSavingPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mImpl:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mSavingPath:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public connect(Landroid/content/Context;Landroid/os/Bundle;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mArgs:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mImpl:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->connect(Landroid/content/Context;Landroid/os/Bundle;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public disconnect(Landroid/content/Context;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mImpl:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->disconnect(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isConnected()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mImpl:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public warmUp(Ljava/lang/String;I)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->isConnected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mContext:Landroid/content/Context;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mArgs:Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->connect(Landroid/content/Context;Landroid/os/Bundle;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "saving-path"

    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mSavingPath:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "path-of-elf"

    .line 32
    .line 33
    invoke-virtual {v0, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "elf-start-offset"

    .line 37
    .line 38
    invoke-virtual {v0, v2, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->mImpl:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 42
    .line 43
    const/16 v2, 0x64

    .line 44
    .line 45
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->call(ILandroid/os/Bundle;)Landroid/os/Bundle;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    const-string v0, "warm-up-result"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/16 p0, -0x64

    .line 59
    .line 60
    :goto_0
    if-nez p0, :cond_2

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    :cond_2
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-static {p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->notifyWarmedUp(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    :cond_3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {p1, p2, p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, "Matrix.WarmUpDelegate"

    .line 81
    .line 82
    const-string p2, "Warm-up %s:%s - retCode %s"

    .line 83
    .line 84
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return v1
.end method
