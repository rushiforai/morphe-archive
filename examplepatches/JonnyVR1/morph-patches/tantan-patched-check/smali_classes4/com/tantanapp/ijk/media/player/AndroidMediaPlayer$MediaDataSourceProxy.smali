.class Lcom/tantanapp/ijk/media/player/AndroidMediaPlayer$MediaDataSourceProxy;
.super Landroid/media/MediaDataSource;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/player/AndroidMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaDataSourceProxy"
.end annotation


# instance fields
.field private final mMediaDataSource:Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/media/MediaDataSource;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AndroidMediaPlayer$MediaDataSourceProxy;->mMediaDataSource:Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/AndroidMediaPlayer$MediaDataSourceProxy;->mMediaDataSource:Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/AndroidMediaPlayer$MediaDataSourceProxy;->mMediaDataSource:Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;->getSize()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public readAt(J[BII)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/AndroidMediaPlayer$MediaDataSourceProxy;->mMediaDataSource:Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;->readAt(J[BII)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
