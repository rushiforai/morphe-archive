.class Ltv/danmaku/ijk/media/sink/AgoraWriter$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/sink/AgoraWriter;->v(JII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Ltv/danmaku/ijk/media/sink/AgoraWriter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;JII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->a:J

    .line 4
    .line 5
    iput p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->b:I

    .line 6
    .line 7
    iput p5, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    new-instance v3, Landroid/view/SurfaceView;

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 4
    .line 5
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {v3, v0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 13
    .line 14
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-static {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->l(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lio/agora/rtc2/RtcEngine;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 29
    .line 30
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->l(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lio/agora/rtc2/RtcEngine;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Lio/agora/rtc2/video/VideoCanvas;

    .line 35
    .line 36
    iget-wide v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->a:J

    .line 37
    .line 38
    long-to-int v2, v4

    .line 39
    const/4 v4, 0x1

    .line 40
    invoke-direct {v1, v3, v4, v2}, Lio/agora/rtc2/video/VideoCanvas;-><init>(Landroid/view/View;II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->setupRemoteVideo(Lio/agora/rtc2/video/VideoCanvas;)I

    .line 44
    .line 45
    .line 46
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v1, "doRenderRemoteUi:"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 54
    .line 55
    invoke-static {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "AgoraWriter"

    .line 67
    .line 68
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 72
    .line 73
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 80
    .line 81
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-wide v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->a:J

    .line 86
    .line 87
    iget v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->b:I

    .line 88
    .line 89
    iget v5, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->c:I

    .line 90
    .line 91
    invoke-interface/range {v0 .. v5}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    invoke-static {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 102
    .line 103
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iget-wide v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->a:J

    .line 108
    .line 109
    iget v5, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->b:I

    .line 110
    .line 111
    iget v6, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->c:I

    .line 112
    .line 113
    const/4 v4, 0x0

    .line 114
    invoke-interface/range {v1 .. v6}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 118
    .line 119
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;->d:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 126
    .line 127
    invoke-static {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundFrames()V

    .line 132
    .line 133
    .line 134
    :cond_2
    return-void
.end method
