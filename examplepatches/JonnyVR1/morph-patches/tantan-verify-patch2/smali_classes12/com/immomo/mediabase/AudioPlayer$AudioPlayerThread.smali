.class Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/AudioPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioPlayerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediabase/AudioPlayer;


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/AudioPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/mediabase/AudioPlayer;->access$000(Lcom/immomo/mediabase/AudioPlayer;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_8

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/immomo/mediabase/AudioPlayer;->access$100(Lcom/immomo/mediabase/AudioPlayer;)Ljava/util/LinkedList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 20
    .line 21
    if-lez v0, :cond_6

    .line 22
    .line 23
    :try_start_0
    invoke-static {v1}, Lcom/immomo/mediabase/AudioPlayer;->access$200(Lcom/immomo/mediabase/AudioPlayer;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {}, Lcom/immomo/mediabase/AudioPlayer;->access$300()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-ne v0, v1, :cond_5

    .line 32
    .line 33
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/immomo/mediabase/AudioPlayer;->access$400(Lcom/immomo/mediabase/AudioPlayer;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :try_start_1
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/immomo/mediabase/AudioPlayer;->access$100(Lcom/immomo/mediabase/AudioPlayer;)Ljava/util/LinkedList;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-lez v1, :cond_4

    .line 51
    .line 52
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/immomo/mediabase/AudioPlayer;->access$100(Lcom/immomo/mediabase/AudioPlayer;)Ljava/util/LinkedList;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lcom/immomo/mediabase/PacketData;

    .line 63
    .line 64
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    :try_start_2
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/immomo/mediabase/AudioPlayer;->audioOriginPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioOriginPtsCallbackListener;

    .line 68
    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/immomo/mediabase/PacketData;->getFrameBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget-wide v2, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 76
    .line 77
    invoke-interface {v0, v2, v3}, Lcom/immomo/mediabase/AudioPlayer$AudioOriginPtsCallbackListener;->onAudioOriginPosition(J)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :catch_0
    move-exception v0

    .line 82
    goto :goto_3

    .line 83
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 84
    .line 85
    iget-object v2, v0, Lcom/immomo/mediabase/AudioPlayer;->audioAvailableBufferCountCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioAvailableBufferCountCallbackListener;

    .line 86
    .line 87
    if-eqz v2, :cond_1

    .line 88
    .line 89
    invoke-static {v0}, Lcom/immomo/mediabase/AudioPlayer;->access$100(Lcom/immomo/mediabase/AudioPlayer;)Ljava/util/LinkedList;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-interface {v2, v0}, Lcom/immomo/mediabase/AudioPlayer$AudioAvailableBufferCountCallbackListener;->onAudioAvailableBufferCount(I)V

    .line 98
    .line 99
    .line 100
    :cond_1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 101
    .line 102
    invoke-static {v0, v1}, Lcom/immomo/mediabase/AudioPlayer;->access$500(Lcom/immomo/mediabase/AudioPlayer;Lcom/immomo/mediabase/PacketData;)Lcom/immomo/mediabase/PacketData;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    if-nez v0, :cond_2

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    invoke-virtual {v0}, Lcom/immomo/mediabase/PacketData;->getFrameBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-wide v1, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 114
    .line 115
    iget-object v3, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 116
    .line 117
    iget-object v3, v3, Lcom/immomo/mediabase/AudioPlayer;->audioPlayingPtsCallbackListener:Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;

    .line 118
    .line 119
    if-eqz v3, :cond_3

    .line 120
    .line 121
    invoke-interface {v3, v1, v2}, Lcom/immomo/mediabase/AudioPlayer$AudioPlayingPtsCallbackListener;->onAudioPlayingPosition(J)V

    .line 122
    .line 123
    .line 124
    :cond_3
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/immomo/mediabase/PacketData;->getFrameBuffer()Ljava/nio/ByteBuffer;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v0}, Lcom/immomo/mediabase/PacketData;->getFrameBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 139
    .line 140
    invoke-virtual {v1, v2, v0}, Lcom/immomo/mediabase/AudioPlayer;->writeAudio([BI)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 141
    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :catchall_0
    move-exception v1

    .line 146
    goto :goto_2

    .line 147
    :cond_4
    :try_start_3
    monitor-exit v0

    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :goto_2
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 151
    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 152
    :cond_5
    const-wide/16 v0, 0x5

    .line 153
    .line 154
    :try_start_5
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 155
    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :catch_1
    move-exception v0

    .line 160
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 161
    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_6
    invoke-static {v1}, Lcom/immomo/mediabase/AudioPlayer;->access$400(Lcom/immomo/mediabase/AudioPlayer;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    monitor-enter v0

    .line 175
    :try_start_7
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 176
    .line 177
    invoke-static {v1}, Lcom/immomo/mediabase/AudioPlayer;->access$000(Lcom/immomo/mediabase/AudioPlayer;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-nez v1, :cond_7

    .line 182
    .line 183
    iget-object v1, p0, Lcom/immomo/mediabase/AudioPlayer$AudioPlayerThread;->this$0:Lcom/immomo/mediabase/AudioPlayer;

    .line 184
    .line 185
    invoke-static {v1}, Lcom/immomo/mediabase/AudioPlayer;->access$400(Lcom/immomo/mediabase/AudioPlayer;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :catchall_1
    move-exception p0

    .line 194
    goto :goto_5

    .line 195
    :catch_2
    move-exception v1

    .line 196
    :try_start_8
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 197
    .line 198
    .line 199
    :cond_7
    :goto_4
    monitor-exit v0

    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :goto_5
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 203
    throw p0

    .line 204
    :cond_8
    return-void
.end method
