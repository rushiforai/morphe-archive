.class public interface abstract Lio/agora/musiccontentcenter/IMusicContentCenterEventHandler;
.super Ljava/lang/Object;


# virtual methods
.method public abstract onLyricResult(Ljava/lang/String;JLjava/lang/String;I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onMusicChartsResult(Ljava/lang/String;[Lio/agora/musiccontentcenter/MusicChartInfo;I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onMusicCollectionResult(Ljava/lang/String;III[Lio/agora/musiccontentcenter/Music;I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPreLoadEvent(Ljava/lang/String;JILjava/lang/String;II)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onSongSimpleInfoResult(Ljava/lang/String;JLjava/lang/String;I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
