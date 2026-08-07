.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RecyclerCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RecyclerCallback"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RecyclerCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget p0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    const/4 v0, 0x0

    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const-string p0, "Suicide."

    .line 8
    .line 9
    new-array p1, v0, [Ljava/lang/Object;

    .line 10
    .line 11
    const-string v1, "Matrix.WarmUpService"

    .line 12
    .line 13
    invoke-static {v1, p0, p1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return v0
.end method
