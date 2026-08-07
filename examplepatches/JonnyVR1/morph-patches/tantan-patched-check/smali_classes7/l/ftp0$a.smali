.class public final Ll/ftp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ftp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:J

.field public c:Z

.field public d:Z

.field public final synthetic e:Ll/ftp0;


# direct methods
.method public constructor <init>(Ll/ftp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public close()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ftp0$a;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 6
    .line 7
    iget v2, p0, Ll/ftp0$a;->a:I

    .line 8
    .line 9
    iget-object v0, v1, Ll/ftp0;->f:Lokio/Buffer;

    .line 10
    .line 11
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget-boolean v5, p0, Ll/ftp0$a;->c:Z

    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    invoke-virtual/range {v1 .. v6}, Ll/ftp0;->d(IJZZ)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ll/ftp0$a;->d:Z

    .line 23
    .line 24
    iget-object p0, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/ftp0;->h:Z

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const-string p0, "closed"

    .line 31
    .line 32
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public flush()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ftp0$a;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 6
    .line 7
    iget v2, p0, Ll/ftp0$a;->a:I

    .line 8
    .line 9
    iget-object v0, v1, Ll/ftp0;->f:Lokio/Buffer;

    .line 10
    .line 11
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget-boolean v5, p0, Ll/ftp0$a;->c:Z

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    invoke-virtual/range {v1 .. v6}, Ll/ftp0;->d(IJZZ)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/ftp0$a;->c:Z

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "closed"

    .line 26
    .line 27
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public timeout()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ftp0;->c:Lokio/BufferedSink;

    .line 4
    .line 5
    invoke-interface {p0}, Lokio/Sink;->timeout()Lokio/Timeout;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ftp0$a;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/ftp0;->f:Lokio/Buffer;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/ftp0$a;->c:Z

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-wide v0, p0, Ll/ftp0$a;->b:J

    .line 18
    .line 19
    const-wide/16 v2, -0x1

    .line 20
    .line 21
    cmp-long p1, v0, v2

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 26
    .line 27
    iget-object p1, p1, Ll/ftp0;->f:Lokio/Buffer;

    .line 28
    .line 29
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iget-wide v2, p0, Ll/ftp0$a;->b:J

    .line 34
    .line 35
    const-wide/16 v4, 0x2000

    .line 36
    .line 37
    sub-long/2addr v2, v4

    .line 38
    cmp-long p1, v0, v2

    .line 39
    .line 40
    if-lez p1, :cond_0

    .line 41
    .line 42
    const/4 p1, 0x1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move p1, p2

    .line 45
    :goto_0
    iget-object p3, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 46
    .line 47
    iget-object p3, p3, Ll/ftp0;->f:Lokio/Buffer;

    .line 48
    .line 49
    invoke-virtual {p3}, Lokio/Buffer;->completeSegmentByteCount()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    const-wide/16 v0, 0x0

    .line 54
    .line 55
    cmp-long p3, v2, v0

    .line 56
    .line 57
    if-lez p3, :cond_1

    .line 58
    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Ll/ftp0$a;->e:Ll/ftp0;

    .line 62
    .line 63
    iget v1, p0, Ll/ftp0$a;->a:I

    .line 64
    .line 65
    iget-boolean v4, p0, Ll/ftp0$a;->c:Z

    .line 66
    .line 67
    const/4 v5, 0x0

    .line 68
    invoke-virtual/range {v0 .. v5}, Ll/ftp0;->d(IJZZ)V

    .line 69
    .line 70
    .line 71
    iput-boolean p2, p0, Ll/ftp0$a;->c:Z

    .line 72
    .line 73
    :cond_1
    return-void

    .line 74
    :cond_2
    const-string p0, "closed"

    .line 75
    .line 76
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
