.class final Lcom/immomo/mmutil/task/c$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/RejectedExecutionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmutil/task/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
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

.method public synthetic constructor <init>(Lcom/immomo/mmutil/task/c$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/immomo/mmutil/task/c$e;-><init>()V

    return-void
.end method


# virtual methods
.method public rejectedExecution(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/immomo/mmutil/task/c;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "Task %s rejected from %s"

    .line 6
    .line 7
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p0, v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/immomo/mmutil/task/SafeExecutor;->Companion:Lcom/immomo/mmutil/task/SafeExecutor$a;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/immomo/mmutil/task/SafeExecutor$a;->b(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {p1, p2}, Ll/myi0;->a(Ljava/lang/Object;Ljava/util/concurrent/ThreadPoolExecutor;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
