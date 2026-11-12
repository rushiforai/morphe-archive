.class public final Lgzd;
.super Ljava/io/ByteArrayInputStream;
.source "SourceFile"


# virtual methods
.method public final h()Ljava/lang/String;
    .registers 5

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Ljava/io/ByteArrayInputStream;->buf:[B

    iget v3, p0, Ljava/io/ByteArrayInputStream;->pos:I

    iget p0, p0, Ljava/io/ByteArrayInputStream;->count:I

    sub-int/2addr p0, v3

    invoke-direct {v1, v2, v3, p0, v0}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v1
.end method
