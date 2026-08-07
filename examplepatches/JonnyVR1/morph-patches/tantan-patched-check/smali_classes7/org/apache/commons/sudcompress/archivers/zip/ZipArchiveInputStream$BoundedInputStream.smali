.class Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BoundedInputStream"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final max:J

.field private pos:J

.field final synthetic this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;Ljava/io/InputStream;J)V
    .locals 2

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 9
    .line 10
    iput-wide p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    .line 11
    .line 12
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-ltz v2, :cond_0

    .line 8
    .line 9
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 10
    .line 11
    cmp-long v0, v2, v0

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public read()I
    .locals 5

    .line 70
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    cmp-long v0, v2, v0

    if-ltz v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 71
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 72
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 73
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->access$000(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;I)V

    .line 74
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;

    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-result-object p0

    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v1

    add-long/2addr v1, v3

    invoke-static {p0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V

    return v0
.end method

.method public read([B)I
    .locals 2

    .line 69
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->read([BII)I

    move-result p0

    return p0
.end method

.method public read([BII)I
    .locals 8

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    const/4 v3, -0x1

    .line 12
    if-ltz v2, :cond_1

    .line 13
    .line 14
    iget-wide v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 15
    .line 16
    cmp-long v4, v4, v0

    .line 17
    .line 18
    if-ltz v4, :cond_1

    .line 19
    .line 20
    return v3

    .line 21
    :cond_1
    if-ltz v2, :cond_2

    .line 22
    .line 23
    int-to-long v4, p3

    .line 24
    iget-wide v6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 25
    .line 26
    sub-long/2addr v0, v6

    .line 27
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    int-to-long v0, p3

    .line 33
    :goto_0
    iget-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    .line 34
    .line 35
    long-to-int v0, v0

    .line 36
    invoke-virtual {p3, p1, p2, v0}, Ljava/io/InputStream;->read([BII)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-ne p1, v3, :cond_3

    .line 41
    .line 42
    return v3

    .line 43
    :cond_3
    iget-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 44
    .line 45
    int-to-long v0, p1

    .line 46
    add-long/2addr p2, v0

    .line 47
    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 48
    .line 49
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;

    .line 50
    .line 51
    invoke-static {p2, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->access$100(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;

    .line 55
    .line 56
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    .line 61
    .line 62
    .line 63
    move-result-wide p2

    .line 64
    add-long/2addr p2, v0

    .line 65
    invoke-static {p0, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->i(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)V

    .line 66
    .line 67
    .line 68
    return p1
.end method

.method public skip(J)J
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-ltz v2, :cond_0

    .line 8
    .line 9
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 13
    .line 14
    .line 15
    move-result-wide p1

    .line 16
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    .line 17
    .line 18
    invoke-static {v0, p1, p2}, Ll/xeg0;->b(Ljava/io/InputStream;J)J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 23
    .line 24
    add-long/2addr v0, p1

    .line 25
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 26
    .line 27
    return-wide p1
.end method
