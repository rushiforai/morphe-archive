.class Lcom/tencent/iliveroom/a/a$41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->onAVMemberEnter(JLjava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:J

.field final synthetic c:I

.field final synthetic d:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;JJI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$41;->d:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$41;->a:J

    .line 4
    .line 5
    iput-wide p4, p0, Lcom/tencent/iliveroom/a/a$41;->b:J

    .line 6
    .line 7
    iput p6, p0, Lcom/tencent/iliveroom/a/a$41;->c:I

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
    .locals 6

    .line 1
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$41;->b:J

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$41;->a:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/tencent/iliveroom/a/b/a;->a(JJ)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$41;->d:Lcom/tencent/iliveroom/a/a;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string p0, "TRTCAdapter-ext"

    .line 19
    .line 20
    const-string v0, "TRTCAdapter: on av member enter. params is null."

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget v1, p0, Lcom/tencent/iliveroom/a/a$41;->c:I

    .line 27
    .line 28
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, 0x1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$41;->d:Lcom/tencent/iliveroom/a/a;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 38
    .line 39
    iget-object v3, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 40
    .line 41
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/a$41;->b:J

    .line 42
    .line 43
    invoke-virtual {v1, v3, v4, v5, v2}, Lcom/tencent/iliveroom/a/c/e;->onRoomAudioMuted(Ljava/lang/String;JZ)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget v1, p0, Lcom/tencent/iliveroom/a/a$41;->c:I

    .line 47
    .line 48
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$41;->d:Lcom/tencent/iliveroom/a/a;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 59
    .line 60
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$41;->b:J

    .line 61
    .line 62
    invoke-virtual {v1, v0, v3, v4, v2}, Lcom/tencent/iliveroom/a/c/e;->onRoomVideoMuted(Ljava/lang/String;JZ)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method
