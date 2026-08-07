.class public Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ByteBufferHolder"
.end annotation


# instance fields
.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private volatile isPending:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->isPending:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->setByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->isPending:Z

    .line 2
    .line 3
    return p0
.end method

.method private setByteBuffer(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public getArray()[B
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    new-array v1, v0, [B

    .line 38
    .line 39
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {p0, v1, v2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    return-object p0
.end method

.method public isPending()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->isPending:Z

    .line 2
    .line 3
    return p0
.end method

.method public setPending(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->isPending:Z

    .line 2
    .line 3
    return-void
.end method
