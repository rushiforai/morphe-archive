.class final Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/StickerBitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ReadBitmapThread"
.end annotation


# instance fields
.field private reading:Z

.field final synthetic this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;


# direct methods
.method private constructor <init>(Lcom/momo/mcamera/mask/StickerBitmapCache;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->reading:Z

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/mcamera/mask/StickerBitmapCache;Lcom/momo/mcamera/mask/StickerBitmapCache$1;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;-><init>(Lcom/momo/mcamera/mask/StickerBitmapCache;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$102(Lcom/momo/mcamera/mask/StickerBitmapCache;Z)Z

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$200(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :cond_0
    :goto_0
    :try_start_1
    iget-boolean v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->reading:Z

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$100(Lcom/momo/mcamera/mask/StickerBitmapCache;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$200(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 37
    .line 38
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$100(Lcom/momo/mcamera/mask/StickerBitmapCache;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$300(Lcom/momo/mcamera/mask/StickerBitmapCache;)Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v3}, Lcom/momo/mcamera/mask/StickerBitmapCache;->readNewBitMaps(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception v2

    .line 55
    goto :goto_2

    .line 56
    :cond_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    :try_start_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 58
    .line 59
    invoke-static {v1}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$400(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/util/LinkedList;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 64
    .line 65
    .line 66
    :goto_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$400(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/util/LinkedList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 76
    .line 77
    invoke-static {p0, v0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$402(Lcom/momo/mcamera/mask/StickerBitmapCache;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :catchall_1
    move-exception v1

    .line 82
    goto :goto_4

    .line 83
    :catch_0
    move-exception v1

    .line 84
    goto :goto_3

    .line 85
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 86
    :try_start_4
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 87
    :goto_3
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 88
    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->reading:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :goto_4
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 95
    .line 96
    invoke-static {v2}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$400(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/util/LinkedList;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 104
    .line 105
    invoke-static {p0, v0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->access$402(Lcom/momo/mcamera/mask/StickerBitmapCache;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    .line 106
    .line 107
    .line 108
    throw v1
.end method
