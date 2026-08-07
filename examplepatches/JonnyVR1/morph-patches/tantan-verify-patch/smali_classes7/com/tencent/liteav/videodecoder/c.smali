.class Lcom/tencent/liteav/videodecoder/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:Lcom/tencent/liteav/videodecoder/a;

.field b:I

.field private c:Ljava/io/InputStream;

.field private d:I

.field private e:I

.field private final f:Ljava/io/OutputStream;

.field private g:[I

.field private h:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/liteav/videodecoder/a;

    .line 5
    .line 6
    const/16 v1, 0x32

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/tencent/liteav/videodecoder/a;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/c;->a:Lcom/tencent/liteav/videodecoder/a;

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    new-array v0, v0, [I

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/c;->g:[I

    .line 18
    .line 19
    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/c;->c:Ljava/io/InputStream;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/tencent/liteav/videodecoder/c;->f:Ljava/io/OutputStream;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iput p2, p0, Lcom/tencent/liteav/videodecoder/c;->d:I

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/tencent/liteav/videodecoder/c;->e:I

    .line 34
    .line 35
    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 31
    return-void
.end method

.method private d()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->e:I

    iput v0, p0, Lcom/tencent/liteav/videodecoder/c;->d:I

    .line 27
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/c;->c:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    iput v0, p0, Lcom/tencent/liteav/videodecoder/c;->e:I

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/tencent/liteav/videodecoder/c;->b:I

    return-void
.end method

.method private e()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x1

    .line 36
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/videodecoder/c;->b(Z)I

    move-result v3

    if-nez v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    if-lez v1, :cond_1

    .line 37
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/videodecoder/c;->a(I)J

    move-result-wide v3

    shl-int p0, v2, v1

    sub-int/2addr p0, v2

    int-to-long v0, p0

    add-long/2addr v0, v3

    long-to-int p0, v0

    return p0

    :cond_1
    return v0
.end method

.method private f()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/videodecoder/c;->b(Z)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-lez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videodecoder/c;->b(I)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method private g()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/c;->g:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x7

    .line 7
    shl-int/2addr v1, v2

    .line 8
    const/4 v3, 0x1

    .line 9
    aget v4, v0, v3

    .line 10
    .line 11
    const/4 v5, 0x6

    .line 12
    shl-int/2addr v4, v5

    .line 13
    or-int/2addr v1, v4

    .line 14
    const/4 v4, 0x2

    .line 15
    aget v6, v0, v4

    .line 16
    .line 17
    const/4 v7, 0x5

    .line 18
    shl-int/2addr v6, v7

    .line 19
    or-int/2addr v1, v6

    .line 20
    const/4 v6, 0x3

    .line 21
    aget v8, v0, v6

    .line 22
    .line 23
    const/4 v9, 0x4

    .line 24
    shl-int/2addr v8, v9

    .line 25
    or-int/2addr v1, v8

    .line 26
    aget v8, v0, v9

    .line 27
    .line 28
    shl-int/lit8 v6, v8, 0x3

    .line 29
    .line 30
    or-int/2addr v1, v6

    .line 31
    aget v6, v0, v7

    .line 32
    .line 33
    shl-int/lit8 v4, v6, 0x2

    .line 34
    .line 35
    or-int/2addr v1, v4

    .line 36
    aget v4, v0, v5

    .line 37
    .line 38
    shl-int/lit8 v3, v4, 0x1

    .line 39
    .line 40
    or-int/2addr v1, v3

    .line 41
    aget v0, v0, v2

    .line 42
    .line 43
    or-int/2addr v0, v1

    .line 44
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/c;->f:Ljava/io/OutputStream;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/c;->e()I

    move-result v0

    .line 35
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public a(I)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    if-gt p1, v0, :cond_1

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, p1, :cond_0

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    shl-long/2addr v0, v3

    .line 12
    invoke-virtual {p0, v3}, Lcom/tencent/liteav/videodecoder/c;->b(Z)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    int-to-long v3, v3

    .line 17
    or-long/2addr v0, v3

    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-wide v0

    .line 22
    :cond_1
    const-string p0, "Can not readByte more then 64 bit"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 p0, 0x0

    .line 28
    .line 29
    return-wide p0
.end method

.method public a(ILjava/lang/String;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videodecoder/c;->a(I)J

    move-result-wide v0

    .line 33
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v0
.end method

.method public a()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    :goto_0
    const/16 v1, 0x8

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 37
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/c;->g:[I

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 38
    :cond_0
    iput v2, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    .line 39
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/c;->g()V

    return-void
.end method

.method public a(JI)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_0

    sub-int v1, p3, v0

    add-int/lit8 v1, v1, -0x1

    shr-long v1, p1, v1

    long-to-int v1, v1

    and-int/lit8 v1, v1, 0x1

    .line 40
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/videodecoder/c;->d(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public a(ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videodecoder/c;->d(I)V

    return-void
.end method

.method public a(Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videodecoder/c;->b(Z)I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_0

    return p1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public b(Z)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->b:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/c;->d()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->d:I

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->d:I

    .line 17
    .line 18
    iget v1, p0, Lcom/tencent/liteav/videodecoder/c;->b:I

    .line 19
    .line 20
    rsub-int/lit8 v2, v1, 0x7

    .line 21
    .line 22
    shr-int/2addr v0, v2

    .line 23
    and-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    iput v1, p0, Lcom/tencent/liteav/videodecoder/c;->b:I

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/c;->f:Ljava/io/OutputStream;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videodecoder/c;->d(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return v0
.end method

.method public b()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    rsub-int/lit8 v0, v0, 0x8

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2, v0}, Lcom/tencent/liteav/videodecoder/c;->a(JI)V

    return-void
.end method

.method public b(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x40

    if-gt p1, v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    const/4 v1, 0x1

    .line 39
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/videodecoder/c;->b(Z)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 40
    :cond_1
    const-string p0, "Can not skip more then 64 bit"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public b(ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videodecoder/c;->b(I)V

    .line 42
    const-string p1, "skip NBits"

    invoke-direct {p0, p2, p1}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/c;->f()V

    .line 44
    const-string v0, "skip UE"

    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public c(Ljava/lang/String;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/c;->e()I

    move-result v0

    and-int/lit8 v1, v0, 0x1

    shl-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, -0x1

    shr-int/lit8 v0, v0, 0x1

    add-int/2addr v0, v1

    mul-int/2addr v0, v2

    .line 34
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public c()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 36
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videodecoder/c;->d(I)V

    .line 37
    invoke-virtual {p0}, Lcom/tencent/liteav/videodecoder/c;->b()V

    .line 38
    invoke-virtual {p0}, Lcom/tencent/liteav/videodecoder/c;->a()V

    return-void
.end method

.method public c(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-array v0, p1, [I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v3, p1, :cond_2

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "deltaScale"

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/videodecoder/c;->c(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/2addr v1, v2

    .line 19
    add-int/lit16 v1, v1, 0x100

    .line 20
    .line 21
    rem-int/lit16 v1, v1, 0x100

    .line 22
    .line 23
    :cond_0
    if-nez v1, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v2, v1

    .line 27
    :goto_1
    aput v2, v0, v3

    .line 28
    .line 29
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    return-void
.end method

.method public c(ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videodecoder/c;->e(I)V

    return-void
.end method

.method public d(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/c;->g()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/c;->g:[I

    .line 14
    .line 15
    iget v1, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    .line 16
    .line 17
    add-int/lit8 v2, v1, 0x1

    .line 18
    .line 19
    iput v2, p0, Lcom/tencent/liteav/videodecoder/c;->h:I

    .line 20
    .line 21
    aput p1, v0, v1

    .line 22
    .line 23
    return-void
.end method

.method public d(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videodecoder/c;->a(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    const-string v1, "1"

    goto :goto_0

    :cond_0
    const-string v1, "0"

    :goto_0
    invoke-direct {p0, p1, v1}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public e(I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    const/16 v3, 0xf

    .line 5
    .line 6
    const/4 v4, 0x1

    .line 7
    if-ge v1, v3, :cond_1

    .line 8
    .line 9
    shl-int v3, v4, v1

    .line 10
    .line 11
    add-int/2addr v3, v2

    .line 12
    if-ge p1, v3, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    move v2, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    :goto_1
    const-wide/16 v5, 0x0

    .line 21
    .line 22
    invoke-virtual {p0, v5, v6, v0}, Lcom/tencent/liteav/videodecoder/c;->a(JI)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v4}, Lcom/tencent/liteav/videodecoder/c;->d(I)V

    .line 26
    .line 27
    .line 28
    sub-int/2addr p1, v2

    .line 29
    int-to-long v1, p1

    .line 30
    invoke-virtual {p0, v1, v2, v0}, Lcom/tencent/liteav/videodecoder/c;->a(JI)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public e(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videodecoder/c;->a(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 35
    const-string v1, "1"

    goto :goto_0

    :cond_0
    const-string v1, "0"

    :goto_0
    invoke-direct {p0, p1, v1}, Lcom/tencent/liteav/videodecoder/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method
