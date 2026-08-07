.class public Lcom/tencent/rtmp/TXLivePlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;,
        Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;,
        Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;,
        Lcom/tencent/rtmp/TXLivePlayer$TXLiteAVTexture;,
        Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;,
        Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;
    }
.end annotation


# static fields
.field public static final PLAY_TYPE_LIVE_FLV:I = 0x1

.field public static final PLAY_TYPE_LIVE_RTMP:I = 0x0

.field public static final PLAY_TYPE_LIVE_RTMP_ACC:I = 0x5

.field public static final PLAY_TYPE_LOCAL_VIDEO:I = 0x6

.field public static final PLAY_TYPE_VOD_FLV:I = 0x2

.field public static final PLAY_TYPE_VOD_HLS:I = 0x3

.field public static final PLAY_TYPE_VOD_MP4:I = 0x4

.field public static final TAG:Ljava/lang/String; = "TXLivePlayer"


# instance fields
.field private mTXLivePlayerImpl:Lcom/tencent/rtmp/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/rtmp/a;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lcom/tencent/rtmp/a;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addVideoRawData([B)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a([B)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public callExperimentalAPI(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public enableAudioVolumeEvaluation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->e(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public enableHardwareDecode(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->b(Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public pause()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public prepareLiveSeek(Ljava/lang/String;I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/a;->b(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public resume()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public resumeLive()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->e()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public seek(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->g(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAudioRawDataListener(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAudioRoute(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->d(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAudioVolumeEvaluationListener(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAutoPlay(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->d(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setConfig(Lcom/tencent/rtmp/TXLivePlayConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayConfig;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMute(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->c(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPlayListener(Lcom/tencent/rtmp/ITXLivePlayListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/ITXLivePlayListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPlayerView(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRate(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRenderRotation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurfaceSize(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/a;->a(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideoRawDataListener(Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXVideoRawDataListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideoRecordListener(Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVideoRenderListener(Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXLivePlayVideoRenderListener;Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setVolume(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public snapshot(Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public startPlay(Ljava/lang/String;I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/a;->a(Ljava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public startRecord(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->f(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public stopPlay(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public stopRecord()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/rtmp/a;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public switchStream(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXLivePlayer;->mTXLivePlayerImpl:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/a;->a(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
