.class Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->onJoinChannelSuccess(Ljava/lang/String;JI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/sink/AgoraWriter$1;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 2
    .line 3
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 4
    .line 5
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroid/view/SurfaceView;

    .line 12
    .line 13
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 14
    .line 15
    iget-object v1, v1, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 16
    .line 17
    invoke-static {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    :goto_0
    move-object v4, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    goto :goto_0

    .line 28
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 29
    .line 30
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 31
    .line 32
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v1, "receiveVideoData: call onVideoChannelAdded()"

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-wide v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->a:J

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "AgoraWriter"

    .line 57
    .line 58
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 62
    .line 63
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 64
    .line 65
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-wide v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$1;->a:J

    .line 70
    .line 71
    long-to-int p0, v2

    .line 72
    int-to-long v2, p0

    .line 73
    const/16 v5, 0xb0

    .line 74
    .line 75
    const/16 v6, 0xb0

    .line 76
    .line 77
    invoke-interface/range {v1 .. v6}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method
