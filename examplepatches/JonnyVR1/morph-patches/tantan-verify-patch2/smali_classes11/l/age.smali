.class public Ll/age;
.super Ll/ite;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ote;Ll/jte;JI)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ite;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean p2, p2, Ll/jte;->a:Z

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    sget-object p2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object p2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    mul-int/lit8 p5, p5, 0x10

    .line 22
    .line 23
    int-to-long v1, p5

    .line 24
    add-long/2addr p3, v1

    .line 25
    invoke-virtual {p1, v0, p3, p4}, Ll/ote;->u(Ljava/nio/ByteBuffer;J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iput-wide v1, p0, Ll/ite;->a:J

    .line 30
    .line 31
    const-wide/16 v1, 0x8

    .line 32
    .line 33
    add-long/2addr p3, v1

    .line 34
    invoke-virtual {p1, v0, p3, p4}, Ll/ote;->u(Ljava/nio/ByteBuffer;J)J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    iput-wide p1, p0, Ll/ite;->b:J

    .line 39
    .line 40
    return-void
.end method
