.class public Ll/k4b0;
.super Ll/kte;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ote;Ll/jte;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/kte;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-boolean v1, p2, Ll/jte;->a:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    iget-wide v1, p2, Ll/jte;->c:J

    .line 23
    .line 24
    iget p2, p2, Ll/jte;->e:I

    .line 25
    .line 26
    int-to-long v3, p2

    .line 27
    mul-long/2addr p3, v3

    .line 28
    add-long/2addr v1, p3

    .line 29
    invoke-virtual {p1, v0, v1, v2}, Ll/ote;->B(Ljava/nio/ByteBuffer;J)J

    .line 30
    .line 31
    .line 32
    move-result-wide p2

    .line 33
    iput-wide p2, p0, Ll/kte;->a:J

    .line 34
    .line 35
    const-wide/16 p2, 0x8

    .line 36
    .line 37
    add-long/2addr p2, v1

    .line 38
    invoke-virtual {p1, v0, p2, p3}, Ll/ote;->u(Ljava/nio/ByteBuffer;J)J

    .line 39
    .line 40
    .line 41
    move-result-wide p2

    .line 42
    iput-wide p2, p0, Ll/kte;->b:J

    .line 43
    .line 44
    const-wide/16 p2, 0x10

    .line 45
    .line 46
    add-long/2addr p2, v1

    .line 47
    invoke-virtual {p1, v0, p2, p3}, Ll/ote;->u(Ljava/nio/ByteBuffer;J)J

    .line 48
    .line 49
    .line 50
    move-result-wide p2

    .line 51
    iput-wide p2, p0, Ll/kte;->c:J

    .line 52
    .line 53
    const-wide/16 p2, 0x28

    .line 54
    .line 55
    add-long/2addr v1, p2

    .line 56
    invoke-virtual {p1, v0, v1, v2}, Ll/ote;->u(Ljava/nio/ByteBuffer;J)J

    .line 57
    .line 58
    .line 59
    move-result-wide p1

    .line 60
    iput-wide p1, p0, Ll/kte;->d:J

    .line 61
    .line 62
    return-void
.end method
