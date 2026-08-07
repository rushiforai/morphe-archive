.class Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CmdHandler"
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----CmdHandler handleMessage what:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Landroid/os/Message;->what:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ";msg.arg1:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ";;msg.arg2:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p1, Landroid/os/Message;->arg2:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ";mPlayStatus:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 39
    .line 40
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "ijkMediaStreamer"

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget v0, p1, Landroid/os/Message;->what:I

    .line 57
    .line 58
    const/16 v2, 0xc8

    .line 59
    .line 60
    if-eq v0, v2, :cond_2

    .line 61
    .line 62
    const/16 v2, 0x258

    .line 63
    .line 64
    if-eq v0, v2, :cond_0

    .line 65
    .line 66
    packed-switch v0, :pswitch_data_0

    .line 67
    .line 68
    .line 69
    new-instance p0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v0, "Unknown message type "

    .line 72
    .line 73
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget p1, p1, Landroid/os/Message;->what:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 90
    .line 91
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    const/4 v0, 0x1

    .line 96
    if-ne p1, v0, :cond_1

    .line 97
    .line 98
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 99
    .line 100
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$300(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :pswitch_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 105
    .line 106
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_1

    .line 111
    .line 112
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 113
    .line 114
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$1000(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 119
    .line 120
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$1100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    if-eqz p1, :cond_1

    .line 125
    .line 126
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 127
    .line 128
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$1100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1}, Lcom/immomo/mediacore/sink/SinkBase;->stopRecording()V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 136
    .line 137
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$1100(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 145
    .line 146
    const/4 p1, 0x0

    .line 147
    invoke-static {p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$1102(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Lcom/immomo/mediacore/sink/SinkBase;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 148
    .line 149
    .line 150
    :cond_1
    :pswitch_2
    return-void

    .line 151
    :cond_2
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$CmdHandler;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 152
    .line 153
    invoke-static {}, Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;->values()[Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 158
    .line 159
    aget-object v0, v0, v1

    .line 160
    .line 161
    iget v1, p1, Landroid/os/Message;->arg2:I

    .line 162
    .line 163
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 164
    .line 165
    check-cast p1, Ljava/lang/Integer;

    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    invoke-static {p0, v0, v1, p1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->access$1200(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;II)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method
