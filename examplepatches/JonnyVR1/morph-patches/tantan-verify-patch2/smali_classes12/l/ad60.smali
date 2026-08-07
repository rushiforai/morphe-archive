.class public Ll/ad60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/nio/ByteBuffer;

.field private b:Landroid/media/MediaCodec$BufferInfo;

.field private c:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 70
    iput-object v0, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 71
    iput-object v0, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    const/4 v0, -0x1

    .line 72
    iput v0, p0, Ll/ad60;->c:I

    .line 73
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 74
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object p1, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    const/4 v0, -0x1

    .line 66
    iput v0, p0, Ll/ad60;->c:I

    .line 67
    iput-object p1, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 68
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object p1, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    iput-object v0, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Ll/ad60;->c:I

    .line 11
    .line 12
    iget v0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 13
    .line 14
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 31
    .line 32
    invoke-virtual {p1, v1, v0, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 46
    .line 47
    iget p0, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 48
    .line 49
    iput p0, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 50
    .line 51
    iget p0, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 52
    .line 53
    iput p0, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 54
    .line 55
    iget p0, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 56
    .line 57
    iput p0, p1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 58
    .line 59
    iget-wide v0, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 60
    .line 61
    iput-wide v0, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public a()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ad60;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public d(IIIJI)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ad60;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    iput p1, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 4
    .line 5
    iput p2, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 6
    .line 7
    iput p3, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 8
    .line 9
    iput-wide p4, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 10
    .line 11
    iput p6, p0, Ll/ad60;->c:I

    .line 12
    .line 13
    return-void
.end method

.method public e(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ad60;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method
