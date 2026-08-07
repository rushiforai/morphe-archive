.class public abstract Lcom/ss/bytertc/ktv/IKTVManagerEventHandler;
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
.method public abstract onClearCacheResult(Lcom/ss/bytertc/ktv/data/KTVErrorCode;)V
.end method

.method public abstract onDownloadFailed(ILcom/ss/bytertc/ktv/data/KTVErrorCode;)V
.end method

.method public abstract onDownloadMusicProgress(II)V
.end method

.method public abstract onDownloadSuccess(ILcom/ss/bytertc/ktv/data/DownloadResult;)V
.end method

.method public abstract onHotMusicResult([Lcom/ss/bytertc/ktv/data/HotMusicInfo;Lcom/ss/bytertc/ktv/data/KTVErrorCode;)V
.end method

.method public abstract onMusicDetailResult(Lcom/ss/bytertc/ktv/data/MusicInfo;Lcom/ss/bytertc/ktv/data/KTVErrorCode;)V
.end method

.method public abstract onMusicListResult([Lcom/ss/bytertc/ktv/data/MusicInfo;ILcom/ss/bytertc/ktv/data/KTVErrorCode;)V
.end method

.method public abstract onSearchMusicResult([Lcom/ss/bytertc/ktv/data/MusicInfo;ILcom/ss/bytertc/ktv/data/KTVErrorCode;)V
.end method
