.class public Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# instance fields
.field private closed:Z

.field private final mediaSource:Lcom/momo/xeengine/widget/XUIMediaSource;

.field private position:J

.field private final size:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->closed:Z

    .line 10
    .line 11
    new-instance v0, Lcom/momo/xeengine/widget/XUIMediaSource;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v0, p1}, Lcom/momo/xeengine/widget/XUIMediaSource;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->mediaSource:Lcom/momo/xeengine/widget/XUIMediaSource;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/momo/xeengine/widget/XUIMediaSource;->getSize()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->size:J

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->size:J

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/32 v2, 0x7fffffff

    .line 11
    .line 12
    .line 13
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    long-to-int p0, v0

    .line 18
    return p0

    .line 19
    :cond_0
    const-string p0, "Stream closed"

    .line 20
    .line 21
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->mediaSource:Lcom/momo/xeengine/widget/XUIMediaSource;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/widget/XUIMediaSource;->close()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->closed:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public getPosition()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTotalSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 49
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 50
    invoke-virtual {p0, v1, v2, v0}, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->read([BII)I

    move-result p0

    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    return v0

    .line 51
    :cond_0
    aget-byte p0, v1, v2

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([BII)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->size:J

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    const/4 v5, -0x1

    .line 12
    if-ltz v4, :cond_0

    .line 13
    .line 14
    return v5

    .line 15
    :cond_0
    int-to-long v6, p3

    .line 16
    sub-long/2addr v2, v0

    .line 17
    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    long-to-int v11, v0

    .line 22
    iget-object v6, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->mediaSource:Lcom/momo/xeengine/widget/XUIMediaSource;

    .line 23
    .line 24
    iget-wide v7, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 25
    .line 26
    move-object v9, p1

    .line 27
    move v10, p2

    .line 28
    invoke-virtual/range {v6 .. v11}, Lcom/momo/xeengine/widget/XUIMediaSource;->readAt(J[BII)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-lez p1, :cond_1

    .line 33
    .line 34
    iget-wide p2, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 35
    .line 36
    int-to-long v0, p1

    .line 37
    add-long/2addr p2, v0

    .line 38
    iput-wide p2, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 39
    .line 40
    return p1

    .line 41
    :cond_1
    return v5

    .line 42
    :cond_2
    const-string p0, "Stream closed"

    .line 43
    .line 44
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public skip(J)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->size:J

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    iget-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 15
    .line 16
    add-long/2addr v0, p1

    .line 17
    iput-wide v0, p0, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->position:J

    .line 18
    .line 19
    return-wide p1

    .line 20
    :cond_0
    const-string p0, "Stream closed"

    .line 21
    .line 22
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 p0, 0x0

    .line 26
    .line 27
    return-wide p0
.end method
