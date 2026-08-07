.class Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/express/ExpressDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ExpressThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/express/ExpressDetector;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/momo/mcamera/mask/express/ExpressDetector;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->access$002(Lcom/momo/mcamera/mask/express/ExpressDetector;Z)Z

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->access$100(Lcom/momo/mcamera/mask/express/ExpressDetector;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 19
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->access$000(Lcom/momo/mcamera/mask/express/ExpressDetector;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->access$100(Lcom/momo/mcamera/mask/express/ExpressDetector;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->detect()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    :try_start_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->access$200(Lcom/momo/mcamera/mask/express/ExpressDetector;)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;->this$0:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-static {p0, v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->access$202(Lcom/momo/mcamera/mask/express/ExpressDetector;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 63
    :catchall_1
    move-exception p0

    .line 64
    throw p0

    .line 65
    :catch_0
    move-exception p0

    .line 66
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 67
    .line 68
    .line 69
    return-void
.end method
