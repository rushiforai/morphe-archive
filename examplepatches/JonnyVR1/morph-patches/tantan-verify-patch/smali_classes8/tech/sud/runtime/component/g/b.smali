.class public Ltech/sud/runtime/component/g/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/g/b;->b(Ljava/io/InputStream;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static a(Ljava/io/InputStream;)Ltech/sud/runtime/component/g/e;
    .locals 2

    .line 62
    new-instance v0, Ltech/sud/runtime/component/g/e;

    invoke-direct {v0}, Ltech/sud/runtime/component/g/e;-><init>()V

    .line 63
    new-instance v1, Ltech/sud/runtime/component/g/b;

    invoke-direct {v1, p0}, Ltech/sud/runtime/component/g/b;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0, v1}, Ltech/sud/runtime/component/g/e;->a(Ltech/sud/runtime/component/g/b;)V

    return-object v0
.end method

.method private b(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ltech/sud/runtime/component/g/c;->a(Ljava/io/InputStream;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ltech/sud/runtime/component/g/b;->c:[B

    .line 6
    .line 7
    array-length p1, p1

    .line 8
    iput p1, p0, Ltech/sud/runtime/component/g/b;->a:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 12
    .line 13
    return-void
.end method

.method private g()B
    .locals 3

    .line 1
    iget v0, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 2
    .line 3
    iget v1, p0, Ltech/sud/runtime/component/g/b;->a:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ltech/sud/runtime/component/g/b;->c:[B

    .line 8
    .line 9
    add-int/lit8 v2, v0, 0x1

    .line 10
    .line 11
    iput v2, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 12
    .line 13
    aget-byte p0, v1, v0

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    .line 17
    .line 18
    iget p0, p0, Ltech/sud/runtime/component/g/b;->a:I

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "Reached EOF, file size="

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-direct {v0, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 61
    iget p0, p0, Ltech/sud/runtime/component/g/b;->b:I

    return p0
.end method

.method public a(I)Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 2
    .line 3
    add-int v1, p1, v0

    .line 4
    .line 5
    iget v2, p0, Ltech/sud/runtime/component/g/b;->a:I

    .line 6
    .line 7
    if-gt v1, v2, :cond_1

    .line 8
    .line 9
    new-array v1, p1, [B

    .line 10
    .line 11
    iget-object v2, p0, Ltech/sud/runtime/component/g/b;->c:[B

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v2, v0, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    iput v0, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 21
    .line 22
    if-lez p1, :cond_0

    .line 23
    .line 24
    aget-byte p0, v1, v3

    .line 25
    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    const-string p0, "UTF-16BE"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p0, "ISO-8859-1"

    .line 32
    .line 33
    :goto_0
    new-instance p1, Ljava/lang/String;

    .line 34
    .line 35
    invoke-direct {p1, v1, p0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object p1

    .line 39
    :cond_1
    new-instance p1, Ljava/io/EOFException;

    .line 40
    .line 41
    iget p0, p0, Ltech/sud/runtime/component/g/b;->a:I

    .line 42
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v1, "Reached EOF, file size="

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-direct {p1, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public a(II)Ljava/lang/String;
    .locals 3

    .line 64
    iget p2, p0, Ltech/sud/runtime/component/g/b;->b:I

    add-int v0, p1, p2

    iget v1, p0, Ltech/sud/runtime/component/g/b;->a:I

    if-gt v0, v1, :cond_0

    .line 65
    new-array v0, p1, [B

    .line 66
    iget-object v1, p0, Ltech/sud/runtime/component/g/b;->c:[B

    const/4 v2, 0x0

    invoke-static {v1, p2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    iget p2, p0, Ltech/sud/runtime/component/g/b;->b:I

    add-int/2addr p2, p1

    iput p2, p0, Ltech/sud/runtime/component/g/b;->b:I

    .line 68
    new-instance p0, Ljava/lang/String;

    const-string p1, "UTF-16BE"

    invoke-direct {p0, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0

    .line 69
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    iget p0, p0, Ltech/sud/runtime/component/g/b;->a:I

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Reached EOF, file size="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(J)V
    .locals 3

    .line 70
    iget v0, p0, Ltech/sud/runtime/component/g/b;->a:I

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    long-to-int p1, p1

    .line 71
    iput p1, p0, Ltech/sud/runtime/component/g/b;->b:I

    return-void

    .line 72
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    iget p0, p0, Ltech/sud/runtime/component/g/b;->a:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Reached EOF, file size="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " offset="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public b()B
    .locals 0

    .line 14
    invoke-direct {p0}, Ltech/sud/runtime/component/g/b;->g()B

    move-result p0

    return p0
.end method

.method public b(J)V
    .locals 2

    .line 15
    iget v0, p0, Ltech/sud/runtime/component/g/b;->b:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    invoke-virtual {p0, v0, v1}, Ltech/sud/runtime/component/g/b;->a(J)V

    return-void
.end method

.method public c()I
    .locals 5

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    shl-long/2addr v0, v2

    .line 9
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    int-to-long v3, v3

    .line 14
    add-long/2addr v0, v3

    .line 15
    shl-long/2addr v0, v2

    .line 16
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-long v3, v3

    .line 21
    add-long/2addr v0, v3

    .line 22
    shl-long/2addr v0, v2

    .line 23
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    int-to-long v2, p0

    .line 28
    add-long/2addr v0, v2

    .line 29
    long-to-int p0, v0

    .line 30
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/component/g/b;->g()B

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    add-int/lit16 p0, p0, 0x100

    .line 8
    .line 9
    :cond_0
    return p0
.end method

.method public e()J
    .locals 5

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    shl-long/2addr v0, v2

    .line 9
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    int-to-long v3, v3

    .line 14
    add-long/2addr v0, v3

    .line 15
    shl-long/2addr v0, v2

    .line 16
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-long v3, v3

    .line 21
    add-long/2addr v0, v3

    .line 22
    shl-long/2addr v0, v2

    .line 23
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    int-to-long v2, p0

    .line 28
    add-long/2addr v0, v2

    .line 29
    return-wide v0
.end method

.method public f()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    shl-int/lit8 v0, v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->d()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr p0, v0

    .line 12
    return p0
.end method
