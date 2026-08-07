.class Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EventHandler"
.end annotation


# instance fields
.field private mWeakPlayer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;->mWeakPlayer:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer$EventHandler;->mWeakPlayer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 8
    .line 9
    if-eqz p0, :cond_8

    .line 10
    .line 11
    invoke-static {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->access$000(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    if-eqz v0, :cond_7

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-eq v0, v1, :cond_7

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    const/4 v4, 0x0

    .line 32
    if-eq v0, v1, :cond_6

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    if-eq v0, v1, :cond_3

    .line 36
    .line 37
    const/4 v1, 0x4

    .line 38
    if-eq v0, v1, :cond_7

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    if-eq v0, v1, :cond_7

    .line 42
    .line 43
    const/16 v1, 0x63

    .line 44
    .line 45
    if-eq v0, v1, :cond_7

    .line 46
    .line 47
    const/16 v1, 0x64

    .line 48
    .line 49
    if-eq v0, v1, :cond_2

    .line 50
    .line 51
    const/16 p0, 0xc8

    .line 52
    .line 53
    if-eq v0, p0, :cond_1

    .line 54
    .line 55
    const/16 p0, 0x2711

    .line 56
    .line 57
    if-eq v0, p0, :cond_7

    .line 58
    .line 59
    const/16 p0, 0x2712

    .line 60
    .line 61
    if-eq v0, p0, :cond_7

    .line 62
    .line 63
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->access$100()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v1, "Unknown message type "

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget p1, p1, Landroid/os/Message;->what:I

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void

    .line 87
    :cond_2
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->access$100()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v2, "Error ("

    .line 94
    .line 95
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, ","

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 109
    .line 110
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string p1, ")"

    .line 114
    .line 115
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    invoke-static {p0, v4}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->access$200(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Z)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_3
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 130
    .line 131
    int-to-long v0, p1

    .line 132
    cmp-long p1, v0, v2

    .line 133
    .line 134
    if-gez p1, :cond_4

    .line 135
    .line 136
    move-wide v0, v2

    .line 137
    :cond_4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->getDuration()J

    .line 138
    .line 139
    .line 140
    move-result-wide p0

    .line 141
    cmp-long v2, p0, v2

    .line 142
    .line 143
    if-lez v2, :cond_5

    .line 144
    .line 145
    const-wide/16 v2, 0x64

    .line 146
    .line 147
    mul-long/2addr v0, v2

    .line 148
    div-long/2addr v0, p0

    .line 149
    :cond_5
    return-void

    .line 150
    :cond_6
    invoke-static {p0, v4}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->access$200(Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;Z)V

    .line 151
    .line 152
    .line 153
    :cond_7
    return-void

    .line 154
    :cond_8
    :goto_0
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->access$100()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p1, "IjkConfMediaPlayer went away with unhandled events"

    .line 159
    .line 160
    invoke-static {p0, p1}, Ll/t9c;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void
.end method
