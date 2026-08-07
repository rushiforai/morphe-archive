.class public abstract Lcom/ss/bytertc/ktv/IKTVManager;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract cancelDownload(I)V
.end method

.method public abstract clearCache()V
.end method

.method public abstract downloadLyric(Ljava/lang/String;Lcom/ss/bytertc/ktv/data/DownloadLyricType;)I
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/bytertc/ktv/data/DownloadLyricType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract downloadMidi(Ljava/lang/String;)I
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract downloadMusic(Ljava/lang/String;)I
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getHotMusic(Ljava/util/List;[Lcom/ss/bytertc/ktv/data/MusicFilterType;)V
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/ss/bytertc/ktv/data/MusicFilterType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;[",
            "Lcom/ss/bytertc/ktv/data/MusicFilterType;",
            ")V"
        }
    .end annotation
.end method

.method public abstract getKTVPlayer()Lcom/ss/bytertc/ktv/IKTVPlayer;
.end method

.method public abstract getMusicDetail(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract getMusicList(II[Lcom/ss/bytertc/ktv/data/MusicFilterType;)V
    .param p3    # [Lcom/ss/bytertc/ktv/data/MusicFilterType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract searchMusic(Ljava/lang/String;II[Lcom/ss/bytertc/ktv/data/MusicFilterType;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [Lcom/ss/bytertc/ktv/data/MusicFilterType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract setKTVManagerEventHandler(Lcom/ss/bytertc/ktv/IKTVManagerEventHandler;)V
.end method

.method public abstract setMaxCacheSize(I)V
.end method
