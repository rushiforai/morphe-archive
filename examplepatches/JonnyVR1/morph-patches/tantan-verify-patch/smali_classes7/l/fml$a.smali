.class public final Ll/fml$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Lokio/BufferedSource;

.field public b:I

.field public c:B

.field public d:I

.field public e:I

.field public f:S


# direct methods
.method public constructor <init>(Lokio/BufferedSource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fml$a;->a:Lokio/BufferedSource;

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
    return-void
.end method

.method public final k()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/fml$a;->d:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/fml$a;->a:Lokio/BufferedSource;

    .line 4
    .line 5
    invoke-static {v1}, Ll/fml;->k(Lokio/BufferedSource;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iput v1, p0, Ll/fml$a;->e:I

    .line 10
    .line 11
    iput v1, p0, Ll/fml$a;->b:I

    .line 12
    .line 13
    iget-object v1, p0, Ll/fml$a;->a:Lokio/BufferedSource;

    .line 14
    .line 15
    invoke-interface {v1}, Lokio/BufferedSource;->readByte()B

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    and-int/lit16 v1, v1, 0xff

    .line 20
    .line 21
    int-to-byte v1, v1

    .line 22
    iget-object v2, p0, Ll/fml$a;->a:Lokio/BufferedSource;

    .line 23
    .line 24
    invoke-interface {v2}, Lokio/BufferedSource;->readByte()B

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    and-int/lit16 v2, v2, 0xff

    .line 29
    .line 30
    int-to-byte v2, v2

    .line 31
    iput-byte v2, p0, Ll/fml$a;->c:B

    .line 32
    .line 33
    sget-object v2, Ll/fml;->e:Ljava/util/logging/Logger;

    .line 34
    .line 35
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    iget v3, p0, Ll/fml$a;->d:I

    .line 44
    .line 45
    iget v4, p0, Ll/fml$a;->b:I

    .line 46
    .line 47
    iget-byte v5, p0, Ll/fml$a;->c:B

    .line 48
    .line 49
    const/4 v6, 0x1

    .line 50
    invoke-static {v6, v3, v4, v1, v5}, Ll/cml;->b(ZIIBB)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v2, p0, Ll/fml$a;->a:Lokio/BufferedSource;

    .line 58
    .line 59
    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    const v3, 0x7fffffff

    .line 64
    .line 65
    .line 66
    and-int/2addr v2, v3

    .line 67
    iput v2, p0, Ll/fml$a;->d:I

    .line 68
    .line 69
    const/16 p0, 0x9

    .line 70
    .line 71
    if-ne v1, p0, :cond_2

    .line 72
    .line 73
    if-ne v2, v0, :cond_1

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    const/4 p0, 0x0

    .line 77
    new-array p0, p0, [Ljava/lang/Object;

    .line 78
    .line 79
    const-string v0, "TYPE_CONTINUATION streamId changed"

    .line 80
    .line 81
    invoke-static {v0, p0}, Ll/cml;->d(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    throw p0

    .line 86
    :cond_2
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string v0, "%s != TYPE_CONTINUATION"

    .line 95
    .line 96
    invoke-static {v0, p0}, Ll/cml;->d(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    throw p0
.end method

.method public read(Lokio/Buffer;J)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget v0, p0, Ll/fml$a;->e:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/fml$a;->a:Lokio/BufferedSource;

    .line 4
    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-short v0, p0, Ll/fml$a;->f:S

    .line 10
    .line 11
    int-to-long v4, v0

    .line 12
    invoke-interface {v1, v4, v5}, Lokio/BufferedSource;->skip(J)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-short v0, p0, Ll/fml$a;->f:S

    .line 17
    .line 18
    iget-byte v0, p0, Ll/fml$a;->c:B

    .line 19
    .line 20
    and-int/lit8 v0, v0, 0x4

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    return-wide v2

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/fml$a;->k()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    int-to-long v4, v0

    .line 30
    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide p2

    .line 34
    invoke-interface {v1, p1, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    cmp-long p3, p1, v2

    .line 39
    .line 40
    if-nez p3, :cond_2

    .line 41
    .line 42
    return-wide v2

    .line 43
    :cond_2
    iget p3, p0, Ll/fml$a;->e:I

    .line 44
    .line 45
    int-to-long v0, p3

    .line 46
    sub-long/2addr v0, p1

    .line 47
    long-to-int p3, v0

    .line 48
    iput p3, p0, Ll/fml$a;->e:I

    .line 49
    .line 50
    return-wide p1
.end method

.method public timeout()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fml$a;->a:Lokio/BufferedSource;

    .line 2
    .line 3
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
