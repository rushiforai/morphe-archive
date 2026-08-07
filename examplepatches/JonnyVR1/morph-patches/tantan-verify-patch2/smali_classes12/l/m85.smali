.class public Ll/m85;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# instance fields
.field a:I

.field b:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/m85;->a:I

    .line 6
    .line 7
    iput p1, p0, Ll/m85;->b:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public markSupported()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 52
    iget v1, p0, Ll/m85;->a:I

    if-nez v1, :cond_0

    iget v1, p0, Ll/m85;->b:I

    if-nez v1, :cond_0

    const/4 v0, -0x1

    .line 53
    iput v0, p0, Ll/m85;->a:I

    .line 54
    iput v0, p0, Ll/m85;->b:I

    .line 55
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v0

    .line 56
    :cond_0
    iget v1, p0, Ll/m85;->b:I

    iput v1, p0, Ll/m85;->a:I

    .line 57
    iput v0, p0, Ll/m85;->b:I

    return v0
.end method

.method public read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-ltz p2, :cond_4

    .line 6
    .line 7
    if-ltz p3, :cond_4

    .line 8
    .line 9
    array-length v1, p1

    .line 10
    sub-int/2addr v1, p2

    .line 11
    if-gt p3, v1, :cond_4

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/m85;->read()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, -0x1

    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    int-to-byte v0, v0

    .line 25
    aput-byte v0, p1, p2

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    :goto_0
    if-lt v0, p3, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Ll/m85;->read()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-ne v2, v1, :cond_3

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_3
    add-int v3, p2, v0

    .line 39
    .line 40
    int-to-byte v2, v2

    .line 41
    aput-byte v2, p1, v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_0
    :goto_1
    return v0

    .line 47
    :cond_4
    invoke-static {}, Ll/onl;->a()V

    .line 48
    .line 49
    .line 50
    return v0
.end method
