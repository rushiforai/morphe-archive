.class public Ll/ej80;
.super Ljava/io/InputStream;
.source "SourceFile"


# instance fields
.field public final a:Ljava/io/InputStream;

.field public final b:[B

.field public final c:Ll/w4d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/w4d0<",
            "[B>;"
        }
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;[BLl/w4d0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "[B",
            "Ll/w4d0<",
            "[B>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ljava/io/InputStream;

    .line 9
    .line 10
    iput-object p1, p0, Ll/ej80;->a:Ljava/io/InputStream;

    .line 11
    .line 12
    invoke-static {p2}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, [B

    .line 17
    .line 18
    iput-object p1, p0, Ll/ej80;->b:[B

    .line 19
    .line 20
    invoke-static {p3}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ll/w4d0;

    .line 25
    .line 26
    iput-object p1, p0, Ll/ej80;->c:Ll/w4d0;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput p1, p0, Ll/ej80;->d:I

    .line 30
    .line 31
    iput p1, p0, Ll/ej80;->e:I

    .line 32
    .line 33
    iput-boolean p1, p0, Ll/ej80;->f:Z

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/ej80;->e:I

    .line 2
    .line 3
    iget v1, p0, Ll/ej80;->d:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ej80;->m()V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Ll/ej80;->d:I

    .line 17
    .line 18
    iget v1, p0, Ll/ej80;->e:I

    .line 19
    .line 20
    sub-int/2addr v0, v1

    .line 21
    iget-object p0, p0, Ll/ej80;->a:Ljava/io/InputStream;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-int/2addr v0, p0

    .line 28
    return v0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ej80;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ej80;->f:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/ej80;->c:Ll/w4d0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ej80;->b:[B

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ll/w4d0;->release(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0}, Ljava/io/InputStream;->close()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ej80;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "PooledByteInputStream"

    .line 6
    .line 7
    const-string v1, "Finalized without closing"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/huf;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ej80;->close()V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final k()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/ej80;->e:I

    .line 2
    .line 3
    iget v1, p0, Ll/ej80;->d:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    iget-object v0, p0, Ll/ej80;->a:Ljava/io/InputStream;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ej80;->b:[B

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-gtz v0, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    iput v0, p0, Ll/ej80;->d:I

    .line 22
    .line 23
    iput v1, p0, Ll/ej80;->e:I

    .line 24
    .line 25
    return v2
.end method

.method public final m()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/ej80;->f:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "stream already closed"

    .line 7
    .line 8
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget v0, p0, Ll/ej80;->e:I

    iget v1, p0, Ll/ej80;->d:I

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 47
    invoke-virtual {p0}, Ll/ej80;->m()V

    .line 48
    invoke-virtual {p0}, Ll/ej80;->k()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p0, -0x1

    return p0

    .line 49
    :cond_1
    iget-object v0, p0, Ll/ej80;->b:[B

    iget v1, p0, Ll/ej80;->e:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ll/ej80;->e:I

    aget-byte p0, v0, v1

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/ej80;->e:I

    .line 2
    .line 3
    iget v1, p0, Ll/ej80;->d:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ej80;->m()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ej80;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    const/4 p0, -0x1

    .line 23
    return p0

    .line 24
    :cond_1
    iget v0, p0, Ll/ej80;->d:I

    .line 25
    .line 26
    iget v1, p0, Ll/ej80;->e:I

    .line 27
    .line 28
    sub-int/2addr v0, v1

    .line 29
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    iget-object v0, p0, Ll/ej80;->b:[B

    .line 34
    .line 35
    iget v1, p0, Ll/ej80;->e:I

    .line 36
    .line 37
    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Ll/ej80;->e:I

    .line 41
    .line 42
    add-int/2addr p1, p3

    .line 43
    iput p1, p0, Ll/ej80;->e:I

    .line 44
    .line 45
    return p3
.end method

.method public skip(J)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/ej80;->e:I

    .line 2
    .line 3
    iget v1, p0, Ll/ej80;->d:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ej80;->m()V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Ll/ej80;->d:I

    .line 17
    .line 18
    iget v1, p0, Ll/ej80;->e:I

    .line 19
    .line 20
    sub-int v2, v0, v1

    .line 21
    .line 22
    int-to-long v2, v2

    .line 23
    cmp-long v4, v2, p1

    .line 24
    .line 25
    if-ltz v4, :cond_1

    .line 26
    .line 27
    int-to-long v0, v1

    .line 28
    add-long/2addr v0, p1

    .line 29
    long-to-int v0, v0

    .line 30
    iput v0, p0, Ll/ej80;->e:I

    .line 31
    .line 32
    return-wide p1

    .line 33
    :cond_1
    iput v0, p0, Ll/ej80;->e:I

    .line 34
    .line 35
    iget-object p0, p0, Ll/ej80;->a:Ljava/io/InputStream;

    .line 36
    .line 37
    sub-long/2addr p1, v2

    .line 38
    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    .line 39
    .line 40
    .line 41
    move-result-wide p0

    .line 42
    add-long/2addr v2, p0

    .line 43
    return-wide v2
.end method
