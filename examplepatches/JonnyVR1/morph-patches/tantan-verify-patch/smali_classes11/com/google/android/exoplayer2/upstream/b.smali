.class public Lcom/google/android/exoplayer2/upstream/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/c;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, -0x1

    .line 7
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/upstream/b;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/exoplayer2/upstream/b;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/upstream/c$c;)J
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/google/android/exoplayer2/upstream/c$c;->c:Ljava/io/IOException;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/google/android/exoplayer2/ParserException;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    instance-of v0, p0, Ljava/io/FileNotFoundException;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    instance-of v0, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$CleartextNotPermittedException;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    instance-of v0, p0, Lcom/google/android/exoplayer2/upstream/Loader$UnexpectedLoaderException;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {p0}, Lcom/google/android/exoplayer2/upstream/DataSourceException;->isCausedByPositionOutOfRange(Ljava/io/IOException;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget p0, p1, Lcom/google/android/exoplayer2/upstream/c$c;->d:I

    .line 27
    .line 28
    add-int/lit8 p0, p0, -0x1

    .line 29
    .line 30
    mul-int/lit16 p0, p0, 0x3e8

    .line 31
    .line 32
    const/16 p1, 0x1388

    .line 33
    .line 34
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    int-to-long p0, p0

    .line 39
    return-wide p0

    .line 40
    :cond_1
    :goto_0
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    return-wide p0
.end method

.method public b(Lcom/google/android/exoplayer2/upstream/c$a;Lcom/google/android/exoplayer2/upstream/c$c;)Lcom/google/android/exoplayer2/upstream/c$b;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p2, p2, Lcom/google/android/exoplayer2/upstream/c$c;->c:Ljava/io/IOException;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/upstream/b;->e(Ljava/io/IOException;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p2, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-object p2

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/upstream/c$a;->a(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    new-instance p1, Lcom/google/android/exoplayer2/upstream/c$b;

    .line 19
    .line 20
    const-wide/32 v0, 0x493e0

    .line 21
    .line 22
    .line 23
    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/exoplayer2/upstream/c$b;-><init>(IJ)V

    .line 24
    .line 25
    .line 26
    return-object p1

    .line 27
    :cond_1
    const/4 p0, 0x2

    .line 28
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/upstream/c$a;->a(I)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    new-instance p1, Lcom/google/android/exoplayer2/upstream/c$b;

    .line 35
    .line 36
    const-wide/32 v0, 0xea60

    .line 37
    .line 38
    .line 39
    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/exoplayer2/upstream/c$b;-><init>(IJ)V

    .line 40
    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_2
    return-object p2
.end method

.method public d(I)I
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/upstream/b;->a:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-ne p0, v0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x7

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x6

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x3

    .line 12
    :cond_1
    return p0
.end method

.method public e(Ljava/io/IOException;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    check-cast p1, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 8
    .line 9
    iget p0, p1, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    .line 10
    .line 11
    const/16 p1, 0x193

    .line 12
    .line 13
    if-eq p0, p1, :cond_2

    .line 14
    .line 15
    const/16 p1, 0x194

    .line 16
    .line 17
    if-eq p0, p1, :cond_2

    .line 18
    .line 19
    const/16 p1, 0x19a

    .line 20
    .line 21
    if-eq p0, p1, :cond_2

    .line 22
    .line 23
    const/16 p1, 0x1a0

    .line 24
    .line 25
    if-eq p0, p1, :cond_2

    .line 26
    .line 27
    const/16 p1, 0x1f4

    .line 28
    .line 29
    if-eq p0, p1, :cond_2

    .line 30
    .line 31
    const/16 p1, 0x1f7

    .line 32
    .line 33
    if-ne p0, p1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return v0

    .line 37
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
.end method
