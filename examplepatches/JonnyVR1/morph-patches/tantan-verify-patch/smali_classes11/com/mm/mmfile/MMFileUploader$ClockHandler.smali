.class Lcom/mm/mmfile/MMFileUploader$ClockHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/MMFileUploader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ClockHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mm/mmfile/MMFileUploader;


# direct methods
.method public constructor <init>(Lcom/mm/mmfile/MMFileUploader;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/mm/mmfile/MMFileUploader;->access$400(Lcom/mm/mmfile/MMFileUploader;)Ljava/util/concurrent/locks/Lock;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/mm/mmfile/MMFileUploader;->access$500(Lcom/mm/mmfile/MMFileUploader;)Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    const-string v1, "MMFile"

    .line 24
    .line 25
    if-eq p1, v0, :cond_1

    .line 26
    .line 27
    :try_start_1
    const-string v2, "MMFileUploader: \u88ab\u63d2\u961f\uff0c\u653e\u5f03\u672c\u6b21\u4efb\u52a1\u3002old: %d, new: %d"

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getNextClockTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    const-wide/16 v3, -0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getNextClockTime()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {v1, v2, p1}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    :goto_1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/mm/mmfile/MMFileUploader;->access$400(Lcom/mm/mmfile/MMFileUploader;)Ljava/util/concurrent/locks/Lock;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catchall_0
    move-exception p1

    .line 68
    goto :goto_2

    .line 69
    :cond_1
    :try_start_2
    const-string p1, "MMFileUploader: clock upload mmfile: %s"

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v1, p1, v2}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    new-instance p1, Lcom/mm/mmfile/MMFileUploader$ClockHandler$1;

    .line 83
    .line 84
    invoke-direct {p1, p0, v0}, Lcom/mm/mmfile/MMFileUploader$ClockHandler$1;-><init>(Lcom/mm/mmfile/MMFileUploader$ClockHandler;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p1}, Lcom/mm/mmfile/RadarThreadUtil;->run(Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    invoke-static {p1, v1}, Lcom/mm/mmfile/MMFileUploader;->access$502(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/mm/mmfile/MMFileUploader;->access$600(Lcom/mm/mmfile/MMFileUploader;)Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->nextTime()V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 109
    .line 110
    invoke-static {p1, v0}, Lcom/mm/mmfile/MMFileUploader;->access$700(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :goto_2
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 115
    .line 116
    invoke-static {p0}, Lcom/mm/mmfile/MMFileUploader;->access$400(Lcom/mm/mmfile/MMFileUploader;)Ljava/util/concurrent/locks/Lock;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 121
    .line 122
    .line 123
    throw p1
.end method
