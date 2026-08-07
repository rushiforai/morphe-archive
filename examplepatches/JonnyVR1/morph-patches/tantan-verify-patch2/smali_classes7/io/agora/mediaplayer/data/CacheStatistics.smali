.class public Lio/agora/mediaplayer/data/CacheStatistics;
.super Ljava/lang/Object;


# instance fields
.field private cacheSize:J

.field private downloadSize:J

.field private fileSize:J


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/mediaplayer/data/CacheStatistics;->fileSize:J

    iput-wide v0, p0, Lio/agora/mediaplayer/data/CacheStatistics;->cacheSize:J

    iput-wide v0, p0, Lio/agora/mediaplayer/data/CacheStatistics;->downloadSize:J

    return-void
.end method


# virtual methods
.method public getCacheSize()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/CacheStatistics;->cacheSize:J

    return-wide v0
.end method

.method public getDownloadSize()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/CacheStatistics;->downloadSize:J

    return-wide v0
.end method

.method public getFileSize()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/CacheStatistics;->fileSize:J

    return-wide v0
.end method

.method public setCacheSize(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/CacheStatistics;->cacheSize:J

    return-void
.end method

.method public setDownloadSize(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/CacheStatistics;->downloadSize:J

    return-void
.end method

.method public setFileSize(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/CacheStatistics;->fileSize:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CacheStatistics{fileSize="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/agora/mediaplayer/data/CacheStatistics;->fileSize:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", cacheSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/mediaplayer/data/CacheStatistics;->cacheSize:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", downloadSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/mediaplayer/data/CacheStatistics;->downloadSize:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
