.class Ll/dyx$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dyx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/nio/ByteBuffer;

.field private b:Landroid/media/MediaCodec$BufferInfo;

.field final synthetic c:Ll/dyx;


# direct methods
.method public constructor <init>(Ll/dyx;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dyx$a;->c:Ll/dyx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/dyx$a;->a:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    iput-object p1, p0, Ll/dyx$a;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 10
    .line 11
    iget p1, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 12
    .line 13
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/dyx$a;->a:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/dyx$a;->a:Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 32
    .line 33
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/dyx$a;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 37
    .line 38
    iget p0, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 39
    .line 40
    iput p0, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 41
    .line 42
    iget p0, p3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 43
    .line 44
    iput p0, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 45
    .line 46
    iget p0, p3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 47
    .line 48
    iput p0, p1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 49
    .line 50
    iget-wide p2, p3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 51
    .line 52
    iput-wide p2, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public a()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyx$a;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyx$a;->b:Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    return-object p0
.end method
