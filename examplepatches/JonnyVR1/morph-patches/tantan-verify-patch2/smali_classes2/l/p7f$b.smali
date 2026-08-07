.class public Ll/p7f$b;
.super Ljava/io/InputStream;
.source "SourceFile"

# interfaces
.implements Ljava/io/DataInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p7f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final e:Ljava/nio/ByteOrder;

.field public static final f:Ljava/nio/ByteOrder;


# instance fields
.field public final a:Ljava/io/DataInputStream;

.field public b:Ljava/nio/ByteOrder;

.field public c:I

.field public d:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 2
    .line 3
    sput-object v0, Ll/p7f$b;->e:Ljava/nio/ByteOrder;

    .line 4
    .line 5
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    sput-object v0, Ll/p7f$b;->f:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, p1, v0}, Ll/p7f$b;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 5
    .line 6
    iput-object v0, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 7
    .line 8
    new-instance v0, Ljava/io/DataInputStream;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 17
    .line 18
    .line 19
    iput p1, p0, Ll/p7f$b;->c:I

    .line 20
    .line 21
    iput-object p2, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    sget-object p1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, v0, p1}, Ll/p7f$b;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    return-void
.end method


# virtual methods
.method public available()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public m()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/p7f$b;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-long v0, p0

    .line 6
    const-wide v2, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v0, v2

    .line 12
    return-wide v0
.end method

.method public mark(I)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "Mark is currently unsupported"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public n(Ljava/nio/ByteOrder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 2
    .line 3
    return-void
.end method

.method public q(I)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p1, :cond_3

    .line 4
    .line 5
    iget-object v2, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 6
    .line 7
    sub-int v3, p1, v1

    .line 8
    .line 9
    int-to-long v4, v3

    .line 10
    invoke-virtual {v2, v4, v5}, Ljava/io/InputStream;->skip(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v4

    .line 14
    long-to-int v2, v4

    .line 15
    if-gtz v2, :cond_2

    .line 16
    .line 17
    iget-object v2, p0, Ll/p7f$b;->d:[B

    .line 18
    .line 19
    const/16 v4, 0x2000

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    new-array v2, v4, [B

    .line 24
    .line 25
    iput-object v2, p0, Ll/p7f$b;->d:[B

    .line 26
    .line 27
    :cond_0
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 32
    .line 33
    iget-object v4, p0, Ll/p7f$b;->d:[B

    .line 34
    .line 35
    invoke-virtual {v3, v4, v0, v2}, Ljava/io/DataInputStream;->read([BII)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, -0x1

    .line 40
    if-eq v2, v3, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v1, "Reached EOF while skipping "

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p1, " bytes."

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p0

    .line 68
    :cond_2
    :goto_1
    add-int/2addr v1, v2

    .line 69
    goto :goto_0

    .line 70
    :cond_3
    iget p1, p0, Ll/p7f$b;->c:I

    .line 71
    .line 72
    add-int/2addr p1, v1

    .line 73
    iput p1, p0, Ll/p7f$b;->c:I

    .line 74
    .line 75
    return-void
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    iget-object v0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->read([BII)I

    move-result p1

    .line 15
    iget p2, p0, Ll/p7f$b;->c:I

    add-int/2addr p2, p1

    iput p2, p0, Ll/p7f$b;->c:I

    return p1
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readBoolean()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public readByte()B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ltz p0, :cond_0

    .line 14
    .line 15
    int-to-byte p0, p0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public readChar()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readChar()C

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/p7f$b;->readLong()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public readFloat()F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/p7f$b;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public readFully([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public readFully([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    iget v0, p0, Ll/p7f$b;->c:I

    add-int/2addr v0, p3

    iput v0, p0, Ll/p7f$b;->c:I

    .line 14
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/DataInputStream;->readFully([BII)V

    return-void
.end method

.method public readInt()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    or-int v4, v0, v1

    .line 32
    .line 33
    or-int/2addr v4, v2

    .line 34
    or-int/2addr v4, v3

    .line 35
    if-ltz v4, :cond_2

    .line 36
    .line 37
    iget-object v4, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 38
    .line 39
    sget-object v5, Ll/p7f$b;->e:Ljava/nio/ByteOrder;

    .line 40
    .line 41
    if-ne v4, v5, :cond_0

    .line 42
    .line 43
    shl-int/lit8 p0, v3, 0x18

    .line 44
    .line 45
    shl-int/lit8 v2, v2, 0x10

    .line 46
    .line 47
    add-int/2addr p0, v2

    .line 48
    shl-int/lit8 v1, v1, 0x8

    .line 49
    .line 50
    add-int/2addr p0, v1

    .line 51
    add-int/2addr p0, v0

    .line 52
    return p0

    .line 53
    :cond_0
    sget-object v5, Ll/p7f$b;->f:Ljava/nio/ByteOrder;

    .line 54
    .line 55
    if-ne v4, v5, :cond_1

    .line 56
    .line 57
    shl-int/lit8 p0, v0, 0x18

    .line 58
    .line 59
    shl-int/lit8 v0, v1, 0x10

    .line 60
    .line 61
    add-int/2addr p0, v0

    .line 62
    shl-int/lit8 v0, v2, 0x8

    .line 63
    .line 64
    add-int/2addr p0, v0

    .line 65
    add-int/2addr p0, v3

    .line 66
    return p0

    .line 67
    :cond_1
    const-string v0, "Invalid byte order: "

    .line 68
    .line 69
    iget-object p0, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 70
    .line 71
    invoke-static {v0, p0}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0

    .line 76
    :cond_2
    invoke-static {}, Ll/vg3;->a()V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x0

    .line 80
    return p0
.end method

.method public readLine()Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public readLong()J
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/p7f$b;->c:I

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    add-int/2addr v1, v2

    .line 8
    iput v1, v0, Ll/p7f$b;->c:I

    .line 9
    .line 10
    iget-object v1, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v3, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    iget-object v4, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 23
    .line 24
    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    iget-object v5, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 29
    .line 30
    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    iget-object v6, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 35
    .line 36
    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    iget-object v7, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 41
    .line 42
    invoke-virtual {v7}, Ljava/io/InputStream;->read()I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    iget-object v8, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 47
    .line 48
    invoke-virtual {v8}, Ljava/io/InputStream;->read()I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    iget-object v9, v0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 53
    .line 54
    invoke-virtual {v9}, Ljava/io/InputStream;->read()I

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    or-int v10, v1, v3

    .line 59
    .line 60
    or-int/2addr v10, v4

    .line 61
    or-int/2addr v10, v5

    .line 62
    or-int/2addr v10, v6

    .line 63
    or-int/2addr v10, v7

    .line 64
    or-int/2addr v10, v8

    .line 65
    or-int/2addr v10, v9

    .line 66
    if-ltz v10, :cond_2

    .line 67
    .line 68
    iget-object v10, v0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 69
    .line 70
    sget-object v11, Ll/p7f$b;->e:Ljava/nio/ByteOrder;

    .line 71
    .line 72
    const/16 v14, 0x20

    .line 73
    .line 74
    const/16 v15, 0x28

    .line 75
    .line 76
    const/16 v16, 0x30

    .line 77
    .line 78
    const/16 v17, 0x38

    .line 79
    .line 80
    if-ne v10, v11, :cond_0

    .line 81
    .line 82
    int-to-long v9, v9

    .line 83
    shl-long v9, v9, v17

    .line 84
    .line 85
    const/16 v11, 0x10

    .line 86
    .line 87
    const/16 v18, 0x18

    .line 88
    .line 89
    int-to-long v12, v8

    .line 90
    shl-long v12, v12, v16

    .line 91
    .line 92
    add-long/2addr v9, v12

    .line 93
    int-to-long v7, v7

    .line 94
    shl-long/2addr v7, v15

    .line 95
    add-long/2addr v9, v7

    .line 96
    int-to-long v6, v6

    .line 97
    shl-long/2addr v6, v14

    .line 98
    add-long/2addr v9, v6

    .line 99
    int-to-long v5, v5

    .line 100
    shl-long v5, v5, v18

    .line 101
    .line 102
    add-long/2addr v9, v5

    .line 103
    int-to-long v4, v4

    .line 104
    shl-long/2addr v4, v11

    .line 105
    add-long/2addr v9, v4

    .line 106
    int-to-long v3, v3

    .line 107
    shl-long v2, v3, v2

    .line 108
    .line 109
    add-long/2addr v9, v2

    .line 110
    int-to-long v0, v1

    .line 111
    add-long/2addr v9, v0

    .line 112
    return-wide v9

    .line 113
    :cond_0
    const/16 v11, 0x10

    .line 114
    .line 115
    const/16 v18, 0x18

    .line 116
    .line 117
    sget-object v12, Ll/p7f$b;->f:Ljava/nio/ByteOrder;

    .line 118
    .line 119
    if-ne v10, v12, :cond_1

    .line 120
    .line 121
    int-to-long v0, v1

    .line 122
    shl-long v0, v0, v17

    .line 123
    .line 124
    int-to-long v12, v3

    .line 125
    shl-long v12, v12, v16

    .line 126
    .line 127
    add-long/2addr v0, v12

    .line 128
    int-to-long v3, v4

    .line 129
    shl-long/2addr v3, v15

    .line 130
    add-long/2addr v0, v3

    .line 131
    int-to-long v3, v5

    .line 132
    shl-long/2addr v3, v14

    .line 133
    add-long/2addr v0, v3

    .line 134
    int-to-long v3, v6

    .line 135
    shl-long v3, v3, v18

    .line 136
    .line 137
    add-long/2addr v0, v3

    .line 138
    int-to-long v3, v7

    .line 139
    shl-long/2addr v3, v11

    .line 140
    add-long/2addr v0, v3

    .line 141
    int-to-long v3, v8

    .line 142
    shl-long v2, v3, v2

    .line 143
    .line 144
    add-long/2addr v0, v2

    .line 145
    int-to-long v2, v9

    .line 146
    add-long/2addr v0, v2

    .line 147
    return-wide v0

    .line 148
    :cond_1
    const-string v1, "Invalid byte order: "

    .line 149
    .line 150
    iget-object v0, v0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 151
    .line 152
    invoke-static {v1, v0}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    const-wide/16 v0, 0x0

    .line 156
    .line 157
    return-wide v0

    .line 158
    :cond_2
    invoke-static {}, Ll/vg3;->a()V

    .line 159
    .line 160
    .line 161
    const-wide/16 v0, 0x0

    .line 162
    .line 163
    return-wide v0
.end method

.method public readShort()S
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    or-int v2, v0, v1

    .line 20
    .line 21
    if-ltz v2, :cond_2

    .line 22
    .line 23
    iget-object v2, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 24
    .line 25
    sget-object v3, Ll/p7f$b;->e:Ljava/nio/ByteOrder;

    .line 26
    .line 27
    if-ne v2, v3, :cond_0

    .line 28
    .line 29
    shl-int/lit8 p0, v1, 0x8

    .line 30
    .line 31
    add-int/2addr p0, v0

    .line 32
    int-to-short p0, p0

    .line 33
    return p0

    .line 34
    :cond_0
    sget-object v3, Ll/p7f$b;->f:Ljava/nio/ByteOrder;

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    shl-int/lit8 p0, v0, 0x8

    .line 39
    .line 40
    add-int/2addr p0, v1

    .line 41
    int-to-short p0, p0

    .line 42
    return p0

    .line 43
    :cond_1
    const-string v0, "Invalid byte order: "

    .line 44
    .line 45
    iget-object p0, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_2
    invoke-static {}, Ll/vg3;->a()V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public readUTF()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public readUnsignedByte()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public readUnsignedShort()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p7f$b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Ll/p7f$b;->c:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/p7f$b;->a:Ljava/io/DataInputStream;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    or-int v2, v0, v1

    .line 20
    .line 21
    if-ltz v2, :cond_2

    .line 22
    .line 23
    iget-object v2, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 24
    .line 25
    sget-object v3, Ll/p7f$b;->e:Ljava/nio/ByteOrder;

    .line 26
    .line 27
    if-ne v2, v3, :cond_0

    .line 28
    .line 29
    shl-int/lit8 p0, v1, 0x8

    .line 30
    .line 31
    add-int/2addr p0, v0

    .line 32
    return p0

    .line 33
    :cond_0
    sget-object v3, Ll/p7f$b;->f:Ljava/nio/ByteOrder;

    .line 34
    .line 35
    if-ne v2, v3, :cond_1

    .line 36
    .line 37
    shl-int/lit8 p0, v0, 0x8

    .line 38
    .line 39
    add-int/2addr p0, v1

    .line 40
    return p0

    .line 41
    :cond_1
    const-string v0, "Invalid byte order: "

    .line 42
    .line 43
    iget-object p0, p0, Ll/p7f$b;->b:Ljava/nio/ByteOrder;

    .line 44
    .line 45
    invoke-static {v0, p0}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_2
    invoke-static {}, Ll/vg3;->a()V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public reset()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "Reset is currently unsupported"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public skipBytes(I)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "skipBytes is currently unsupported"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
