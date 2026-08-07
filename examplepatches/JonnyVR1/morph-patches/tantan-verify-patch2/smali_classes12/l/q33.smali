.class public Ll/q33;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static f:I


# instance fields
.field private a:Ljava/io/InputStream;

.field private b:I

.field private c:I

.field d:I

.field protected e:Ll/vs4;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
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
    new-instance v0, Ll/vs4;

    .line 5
    .line 6
    const/16 v1, 0x32

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/vs4;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/q33;->e:Ll/vs4;

    .line 12
    .line 13
    iput-object p1, p0, Ll/q33;->a:Ljava/io/InputStream;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/q33;->b:I

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Ll/q33;->c:I

    .line 26
    .line 27
    return-void
.end method

.method private a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/q33;->c:I

    .line 2
    .line 3
    iput v0, p0, Ll/q33;->b:I

    .line 4
    .line 5
    iget-object v0, p0, Ll/q33;->a:Ljava/io/InputStream;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/q33;->c:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Ll/q33;->d:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public b()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/q33;->d:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/q33;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget v0, p0, Ll/q33;->d:I

    .line 11
    .line 12
    rsub-int/lit8 v0, v0, 0x7

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    shl-int v0, v1, v0

    .line 16
    .line 17
    shl-int/lit8 v2, v0, 0x1

    .line 18
    .line 19
    sub-int/2addr v2, v1

    .line 20
    iget v3, p0, Ll/q33;->b:I

    .line 21
    .line 22
    and-int/2addr v2, v3

    .line 23
    const/4 v4, 0x0

    .line 24
    if-ne v2, v0, :cond_1

    .line 25
    .line 26
    move v0, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v0, v4

    .line 29
    :goto_0
    const/4 v2, -0x1

    .line 30
    if-eq v3, v2, :cond_3

    .line 31
    .line 32
    iget p0, p0, Ll/q33;->c:I

    .line 33
    .line 34
    if-ne p0, v2, :cond_2

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    return v1

    .line 40
    :cond_3
    :goto_1
    return v4
.end method

.method public c()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/q33;->d:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/q33;->a()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Ll/q33;->b:I

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
    iget v0, p0, Ll/q33;->b:I

    .line 17
    .line 18
    iget v1, p0, Ll/q33;->d:I

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
    iput v1, p0, Ll/q33;->d:I

    .line 28
    .line 29
    iget-object p0, p0, Ll/q33;->e:Ll/vs4;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const/16 v1, 0x30

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/16 v1, 0x31

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0, v1}, Ll/vs4;->a(C)V

    .line 39
    .line 40
    .line 41
    sget p0, Ll/q33;->f:I

    .line 42
    .line 43
    add-int/lit8 p0, p0, 0x1

    .line 44
    .line 45
    sput p0, Ll/q33;->f:I

    .line 46
    .line 47
    return v0
.end method

.method public d(I)J
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
    if-lt v2, p1, :cond_0

    .line 9
    .line 10
    return-wide v0

    .line 11
    :cond_0
    const/4 v3, 0x1

    .line 12
    shl-long/2addr v0, v3

    .line 13
    invoke-virtual {p0}, Ll/q33;->c()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    int-to-long v3, v3

    .line 18
    or-long/2addr v0, v3

    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

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

.method public e()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/q33;->d:I

    .line 2
    .line 3
    rsub-int/lit8 v0, v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/q33;->d(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method
