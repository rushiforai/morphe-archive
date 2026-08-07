.class final Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/gesture/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "GestureDetectThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/gesture/GestureDetector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 2
    .line 3
    const-string p1, "GestureDetect"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$002(Lcom/momo/mcamera/mask/gesture/GestureDetector;Z)Z

    .line 5
    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$100(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$000(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$100(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$200(Lcom/momo/mcamera/mask/gesture/GestureDetector;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    :try_start_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$300(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-static {p0, v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->access$302(Lcom/momo/mcamera/mask/gesture/GestureDetector;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 58
    :catchall_1
    move-exception p0

    .line 59
    throw p0

    .line 60
    :catch_0
    move-exception p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    return-void
.end method
