.class public interface abstract Ltv/danmaku/ijk/media/player/IMediaPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/player/IMediaPlayer$RenderTimestampListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;,
        Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;
    }
.end annotation


# static fields
.field public static final MEDIA_ERROR_IO:I = -0x3ec

.field public static final MEDIA_ERROR_MALFORMED:I = -0x3ef

.field public static final MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK:I = 0xc8

.field public static final MEDIA_ERROR_SERVER_DIED:I = 0x64

.field public static final MEDIA_ERROR_TIMED_OUT:I = -0x6e

.field public static final MEDIA_ERROR_UNKNOWN:I = 0x1

.field public static final MEDIA_ERROR_UNSUPPORTED:I = -0x3f2

.field public static final MEDIA_INDEO_V_DECODE_ERROR:I = 0x38b

.field public static final MEDIA_INFO_AUDIO_OPEN_ERROR:I = 0x38d

.field public static final MEDIA_INFO_AUDIO_PTS_ERROR:I = 0x38e

.field public static final MEDIA_INFO_BAD_INTERLEAVING:I = 0x320

.field public static final MEDIA_INFO_BUFFERING_END:I = 0x2be

.field public static final MEDIA_INFO_BUFFERING_START:I = 0x2bd

.field public static final MEDIA_INFO_CHANGE_MAX_BUFFER_CACHE:I = 0x38c

.field public static final MEDIA_INFO_FAST_PALY_END:I = 0x386

.field public static final MEDIA_INFO_FAST_PALY_START:I = 0x385

.field public static final MEDIA_INFO_INITBUFFERING_END:I = 0x2c1

.field public static final MEDIA_INFO_INITBUFFERING_START:I = 0x2c0

.field public static final MEDIA_INFO_METADATA_UPDATE:I = 0x322

.field public static final MEDIA_INFO_ML_DROP_START:I = 0x387

.field public static final MEDIA_INFO_ML_DROP_STOP:I = 0x388

.field public static final MEDIA_INFO_NOT_SEEKABLE:I = 0x321

.field public static final MEDIA_INFO_PULLBUFFER:I = 0x3e9

.field public static final MEDIA_INFO_PULLWATCH:I = 0x3e8

.field public static final MEDIA_INFO_STARTED_AS_NEXT:I = 0x2

.field public static final MEDIA_INFO_TIMED_TEXT_ERROR:I = 0x384

.field public static final MEDIA_INFO_UNKNOWN:I = 0x1

.field public static final MEDIA_INFO_VA_DIFF:I = 0x389

.field public static final MEDIA_INFO_VIDEO_RENDERING_START:I = 0x3

.field public static final MEDIA_INFO_VIDEO_TRACK_LAGGING:I = 0x2bc

.field public static final MEDIA_INFO_V_DELAY:I = 0x38a


# virtual methods
.method public abstract getAudioTrackNum()I
.end method

.method public abstract getCurrentPosition()J
.end method

.method public abstract getCurrentPts()J
.end method

.method public abstract getDataSource()Ljava/lang/String;
.end method

.method public abstract getDuration()J
.end method

.method public abstract getMediaInfo()Ltv/danmaku/ijk/media/player/MediaInfo;
.end method

.method public abstract getRate()F
.end method

.method public abstract getServerIpAddr()Ljava/lang/String;
.end method

.method public abstract getVideoDarDen()I
.end method

.method public abstract getVideoDarNum()I
.end method

.method public abstract getVideoHeight()I
.end method

.method public abstract getVideoSarDen()I
.end method

.method public abstract getVideoSarNum()I
.end method

.method public abstract getVideoWidth()I
.end method

.method public abstract isPlayable()Z
.end method

.method public abstract isPlaying()Z
.end method

.method public abstract pause()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract prepareAsync()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract reset()V
.end method

.method public abstract seekTo(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract selectAudioTrack(I)V
.end method

.method public abstract setAudioStreamType(I)V
.end method

.method public abstract setDataSource(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract setDisplay(Landroid/view/SurfaceHolder;)V
.end method

.method public abstract setKeepInBackground(Z)V
.end method

.method public abstract setLogEnabled(Z)V
.end method

.method public abstract setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V
.end method

.method public abstract setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V
.end method

.method public abstract setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V
.end method

.method public abstract setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V
.end method

.method public abstract setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V
.end method

.method public abstract setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V
.end method

.method public abstract setOnVideoMediacodecChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;)V
.end method

.method public abstract setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V
.end method

.method public abstract setPlayback(Z)V
.end method

.method public abstract setRate(F)V
.end method

.method public abstract setScreenOnWhilePlaying(Z)V
.end method

.method public abstract setSurface(Landroid/view/Surface;)V
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation
.end method

.method public abstract setVolume(FF)V
.end method

.method public abstract setWakeMode(Landroid/content/Context;I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract start()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract stop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract updateScreenSize(II)V
.end method
