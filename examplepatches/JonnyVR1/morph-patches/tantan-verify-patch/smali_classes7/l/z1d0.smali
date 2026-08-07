.class public abstract Ll/z1d0;
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

.method public static create(Ll/e7y;Ljava/io/File;)Ll/z1d0;
    .locals 1

    if-eqz p1, :cond_0

    .line 48
    new-instance v0, Ll/z1d0$c;

    invoke-direct {v0, p0, p1}, Ll/z1d0$c;-><init>(Ll/e7y;Ljava/io/File;)V

    return-object v0

    .line 49
    :cond_0
    const-string p0, "file == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;
    .locals 2

    .line 1
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e7y;->a()Ljava/nio/charset/Charset;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "; charset=utf-8"

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object v0, v1

    .line 34
    :cond_1
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p0, p1}, Ll/z1d0;->create(Ll/e7y;[B)Ll/z1d0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static create(Ll/e7y;Lokio/ByteString;)Ll/z1d0;
    .locals 1

    .line 43
    new-instance v0, Ll/z1d0$a;

    invoke-direct {v0, p0, p1}, Ll/z1d0$a;-><init>(Ll/e7y;Lokio/ByteString;)V

    return-object v0
.end method

.method public static create(Ll/e7y;[B)Ll/z1d0;
    .locals 2

    const/4 v0, 0x0

    .line 44
    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Ll/z1d0;->create(Ll/e7y;[BII)Ll/z1d0;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ll/e7y;[BII)Ll/z1d0;
    .locals 7

    if-eqz p1, :cond_0

    .line 45
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Ll/zlk0;->f(JJJ)V

    .line 46
    new-instance v0, Ll/z1d0$b;

    invoke-direct {v0, p0, p3, p1, p2}, Ll/z1d0$b;-><init>(Ll/e7y;I[BI)V

    return-object v0

    .line 47
    :cond_0
    const-string p0, "content == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public contentLength()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    return-wide v0
.end method

.method public abstract contentType()Ll/e7y;
.end method

.method public isDuplex()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isOneShot()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract writeTo(Lokio/BufferedSink;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
