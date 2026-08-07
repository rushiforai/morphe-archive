.class Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediacore/audio/AudioProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioProcessRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediacore/audio/AudioProcess;


# direct methods
.method private constructor <init>(Lcom/immomo/mediacore/audio/AudioProcess;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/mediacore/audio/AudioProcess;Lcom/immomo/mediacore/audio/AudioProcess$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;-><init>(Lcom/immomo/mediacore/audio/AudioProcess;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 1
    :catch_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->access$100(Lcom/immomo/mediacore/audio/AudioProcess;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "AudioProcess"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "AudioProcessRunnable exit"

    .line 12
    .line 13
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "mAudioFrames.take()"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->access$200(Lcom/immomo/mediacore/audio/AudioProcess;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/oxd0;

    .line 33
    .line 34
    const-wide/16 v2, -0x3039

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v4, v0, Ll/oxd0;->a:[B

    .line 39
    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/oxd0;->d()J

    .line 43
    .line 44
    .line 45
    move-result-wide v4

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    move-wide v4, v2

    .line 48
    :goto_1
    const/4 v6, 0x0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v7, v0, Ll/oxd0;->a:[B

    .line 52
    .line 53
    if-nez v7, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 56
    .line 57
    invoke-static {v0, v6}, Lcom/immomo/mediacore/audio/AudioProcess;->access$102(Lcom/immomo/mediacore/audio/AudioProcess;Z)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    iget-object v7, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 62
    .line 63
    invoke-virtual {v7}, Lcom/immomo/mediacore/audio/AudioProcess;->getMixedSurroundData()Ll/oxd0;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    if-eqz v7, :cond_3

    .line 68
    .line 69
    iget-object v8, v7, Ll/oxd0;->a:[B

    .line 70
    .line 71
    if-nez v8, :cond_3

    .line 72
    .line 73
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 74
    .line 75
    invoke-static {p0, v6}, Lcom/immomo/mediacore/audio/AudioProcess;->access$102(Lcom/immomo/mediacore/audio/AudioProcess;Z)Z

    .line 76
    .line 77
    .line 78
    :goto_2
    return-void

    .line 79
    :cond_3
    invoke-virtual {v7}, Ll/oxd0;->d()J

    .line 80
    .line 81
    .line 82
    move-result-wide v8

    .line 83
    cmp-long v10, v4, v2

    .line 84
    .line 85
    if-eqz v10, :cond_5

    .line 86
    .line 87
    cmp-long v2, v8, v2

    .line 88
    .line 89
    if-nez v2, :cond_4

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    const-string v2, "outPutFrame = ByteBuffer.allocate"

    .line 93
    .line 94
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/oxd0;->c()[B

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v7}, Ll/oxd0;->c()[B

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    iget v9, v0, Ll/oxd0;->e:I

    .line 108
    .line 109
    invoke-virtual {v2, v3, v8, v9}, Lcom/immomo/mediacore/audio/AudioProcess;->normalize_mix([B[BI)Ljava/nio/ByteBuffer;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v0}, Ll/oxd0;->f()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v7}, Ll/oxd0;->f()V

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/oxd0;

    .line 120
    .line 121
    invoke-direct {v0, v2, v4, v5, v6}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 122
    .line 123
    .line 124
    :try_start_1
    const-string v2, "AudioProcessRunnable offer begin"

    .line 125
    .line 126
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 130
    .line 131
    invoke-static {v2}, Lcom/immomo/mediacore/audio/AudioProcess;->access$500(Lcom/immomo/mediacore/audio/AudioProcess;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    const-string v0, "AudioProcessRunnable offer end"

    .line 139
    .line 140
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 141
    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :catch_1
    move-exception v0

    .line 146
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 147
    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_5
    :goto_3
    const-string v0, "AudioProcessRunnable exit FINISH_ID"

    .line 152
    .line 153
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 157
    .line 158
    invoke-static {p0, v6}, Lcom/immomo/mediacore/audio/AudioProcess;->access$102(Lcom/immomo/mediacore/audio/AudioProcess;Z)Z

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public take()Ll/oxd0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/immomo/mediacore/audio/AudioProcess;->access$100(Lcom/immomo/mediacore/audio/AudioProcess;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->this$0:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->access$500(Lcom/immomo/mediacore/audio/AudioProcess;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/oxd0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    return-object p0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-object v0

    .line 26
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method
