.class public Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;,
        Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;
    }
.end annotation


# static fields
.field private static MAX_BYTE_BUFFER_POOL_SIZE:I = 0x2

.field private static final TAG:Ljava/lang/String; = "VideoFrameConverter"


# instance fields
.field private abandonFrameCount:I

.field private byteBufferPool:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;",
            ">;"
        }
    .end annotation
.end field

.field private byteBuffers:[Ljava/nio/ByteBuffer;

.field private isBufferDirect:Z

.field final steps:[I

.field final strides:[I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    new-array v1, v0, [Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    iput-object v1, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBuffers:[Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->strides:[I

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    new-array v0, v0, [I

    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->steps:[I

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBufferPool:Ljava/util/ArrayList;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    .line 27
    .line 28
    :goto_0
    sget v1, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->MAX_BYTE_BUFFER_POOL_SIZE:I

    .line 29
    .line 30
    if-ge v0, v1, :cond_0

    .line 31
    .line 32
    new-instance v1, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    .line 33
    .line 34
    invoke-direct {v1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBufferPool:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->isBufferDirect:Z

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->setPending(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->setPending(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->setPending(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private convertRawYUV2ByteArray([BLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIII)Z
    .locals 2
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->strides:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p5, v0, v1

    .line 5
    .line 6
    const/4 p5, 0x1

    .line 7
    aput p6, v0, p5

    .line 8
    .line 9
    const/4 p6, 0x2

    .line 10
    aput p7, v0, p6

    .line 11
    .line 12
    iget-object p7, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->steps:[I

    .line 13
    .line 14
    aput p8, p7, v1

    .line 15
    .line 16
    add-int/lit8 v0, p8, 0x1

    .line 17
    .line 18
    div-int/2addr v0, p6

    .line 19
    aput v0, p7, p5

    .line 20
    .line 21
    mul-int/2addr p8, p9

    .line 22
    mul-int/2addr v0, p6

    .line 23
    mul-int/2addr v0, p9

    .line 24
    add-int/2addr p8, v0

    .line 25
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_5

    .line 35
    .line 36
    array-length p7, p1

    .line 37
    if-le p8, p7, :cond_0

    .line 38
    .line 39
    goto :goto_4

    .line 40
    :cond_0
    iget-object p7, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBuffers:[Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    aput-object p2, p7, v1

    .line 43
    .line 44
    aput-object p3, p7, p5

    .line 45
    .line 46
    aput-object p4, p7, p6

    .line 47
    .line 48
    move p2, v1

    .line 49
    move p3, p2

    .line 50
    :goto_0
    iget-object p4, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBuffers:[Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    array-length p7, p4

    .line 53
    if-ge p2, p7, :cond_4

    .line 54
    .line 55
    aget-object p4, p4, p2

    .line 56
    .line 57
    iget-object p7, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->strides:[I

    .line 58
    .line 59
    aget p7, p7, p2

    .line 60
    .line 61
    iget-object p8, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->steps:[I

    .line 62
    .line 63
    if-nez p2, :cond_1

    .line 64
    .line 65
    aget p8, p8, v1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    aget p8, p8, p5

    .line 69
    .line 70
    :goto_1
    sub-int p9, p7, p8

    .line 71
    .line 72
    if-ne p7, p8, :cond_2

    .line 73
    .line 74
    invoke-virtual {p4}, Ljava/nio/Buffer;->remaining()I

    .line 75
    .line 76
    .line 77
    move-result p7

    .line 78
    invoke-virtual {p4, p1, p3, p7}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    add-int/2addr p3, p7

    .line 82
    goto :goto_3

    .line 83
    :cond_2
    :goto_2
    invoke-virtual {p4}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 84
    .line 85
    .line 86
    move-result p7

    .line 87
    if-eqz p7, :cond_3

    .line 88
    .line 89
    invoke-virtual {p4}, Ljava/nio/Buffer;->position()I

    .line 90
    .line 91
    .line 92
    move-result p7

    .line 93
    add-int/2addr p7, p8

    .line 94
    invoke-virtual {p4}, Ljava/nio/Buffer;->capacity()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-gt p7, v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {p4, p1, p3, p8}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    add-int/2addr p3, p8

    .line 104
    invoke-virtual {p4}, Ljava/nio/Buffer;->position()I

    .line 105
    .line 106
    .line 107
    move-result p7

    .line 108
    add-int/2addr p7, p9

    .line 109
    invoke-virtual {p4}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    invoke-virtual {p4}, Ljava/nio/Buffer;->capacity()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-gt p7, v0, :cond_3

    .line 120
    .line 121
    invoke-virtual {p4, p7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_3
    :goto_3
    add-int/lit8 p2, p2, 0x1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_4
    const/4 p0, 0x0

    .line 129
    aput-object p0, p4, v1

    .line 130
    .line 131
    aput-object p0, p4, p5

    .line 132
    .line 133
    aput-object p0, p4, p6

    .line 134
    .line 135
    return p5

    .line 136
    :cond_5
    :goto_4
    return v1
.end method

.method private convertRawYUV2ByteBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIII)Z
    .locals 2
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->strides:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p5, v0, v1

    .line 5
    .line 6
    const/4 p5, 0x1

    .line 7
    aput p6, v0, p5

    .line 8
    .line 9
    const/4 p6, 0x2

    .line 10
    aput p7, v0, p6

    .line 11
    .line 12
    iget-object p7, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->steps:[I

    .line 13
    .line 14
    aput p8, p7, v1

    .line 15
    .line 16
    add-int/lit8 v0, p8, 0x1

    .line 17
    .line 18
    div-int/2addr v0, p6

    .line 19
    aput v0, p7, p5

    .line 20
    .line 21
    mul-int/2addr p8, p9

    .line 22
    mul-int/2addr v0, p6

    .line 23
    mul-int/2addr v0, p9

    .line 24
    add-int/2addr p8, v0

    .line 25
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_5

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 37
    .line 38
    .line 39
    move-result p7

    .line 40
    if-le p8, p7, :cond_0

    .line 41
    .line 42
    goto :goto_4

    .line 43
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 44
    .line 45
    .line 46
    iget-object p7, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBuffers:[Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    aput-object p2, p7, v1

    .line 49
    .line 50
    aput-object p3, p7, p5

    .line 51
    .line 52
    aput-object p4, p7, p6

    .line 53
    .line 54
    move p2, v1

    .line 55
    :goto_0
    iget-object p3, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBuffers:[Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    array-length p4, p3

    .line 58
    if-ge p2, p4, :cond_4

    .line 59
    .line 60
    aget-object p3, p3, p2

    .line 61
    .line 62
    iget-object p4, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->strides:[I

    .line 63
    .line 64
    aget p4, p4, p2

    .line 65
    .line 66
    iget-object p7, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->steps:[I

    .line 67
    .line 68
    if-nez p2, :cond_1

    .line 69
    .line 70
    aget p7, p7, v1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    aget p7, p7, p5

    .line 74
    .line 75
    :goto_1
    sub-int p8, p4, p7

    .line 76
    .line 77
    if-ne p4, p7, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_2
    :goto_2
    invoke-virtual {p3}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 84
    .line 85
    .line 86
    move-result p4

    .line 87
    if-eqz p4, :cond_3

    .line 88
    .line 89
    invoke-virtual {p3}, Ljava/nio/Buffer;->position()I

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    add-int/2addr p4, p7

    .line 94
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 95
    .line 96
    .line 97
    move-result p9

    .line 98
    if-gt p4, p9, :cond_3

    .line 99
    .line 100
    invoke-virtual {p3}, Ljava/nio/Buffer;->position()I

    .line 101
    .line 102
    .line 103
    move-result p4

    .line 104
    add-int/2addr p4, p7

    .line 105
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p3}, Ljava/nio/Buffer;->position()I

    .line 112
    .line 113
    .line 114
    move-result p4

    .line 115
    add-int/2addr p4, p8

    .line 116
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 117
    .line 118
    .line 119
    move-result p9

    .line 120
    if-gt p4, p9, :cond_3

    .line 121
    .line 122
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 123
    .line 124
    .line 125
    move-result p9

    .line 126
    invoke-virtual {p3, p9}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_3
    :goto_3
    add-int/lit8 p2, p2, 0x1

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_4
    const/4 p0, 0x0

    .line 137
    aput-object p0, p3, v1

    .line 138
    .line 139
    aput-object p0, p3, p5

    .line 140
    .line 141
    aput-object p0, p3, p6

    .line 142
    .line 143
    return p5

    .line 144
    :cond_5
    :goto_4
    return v1
.end method

.method public static synthetic d(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->setPending(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private getPendingBuffer()Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->byteBufferPool:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->access$200(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->setPending(Z)V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method


# virtual methods
.method public checkReuseByteBuffer(ILcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge v0, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->isBufferDirect:Z

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_1
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    invoke-static {p2, p0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->access$100(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;Ljava/nio/ByteBuffer;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public convert2YUV(Lcom/bytedance/realx/video/VideoFrame;)Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;
    .locals 12

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->getPendingBuffer()Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    const/4 v10, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-object v10

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v9

    .line 25
    new-instance v11, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;

    .line 26
    .line 27
    invoke-direct {v11, p1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;-><init>(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v11}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getStrideY()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getStrideU()I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;->getStrideV()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    move-object v0, p0

    .line 59
    invoke-virtual/range {v0 .. v9}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertRawYUV2ByteHolder(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIII)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {v11}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->release()V

    .line 64
    .line 65
    .line 66
    if-nez p0, :cond_1

    .line 67
    .line 68
    return-object v10

    .line 69
    :cond_1
    return-object v1
.end method

.method public convertRawYUV2ByteArray([B[B[BIIIII)Ljava/nio/ByteBuffer;
    .locals 13

    move-object/from16 v1, p3

    .line 137
    array-length v2, p1

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 138
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 139
    invoke-virtual {v5, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    const/4 p1, 0x0

    .line 140
    invoke-virtual {v5, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 141
    array-length v2, p2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 142
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 143
    invoke-virtual {v6, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 144
    invoke-virtual {v6, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 145
    array-length v0, v1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 146
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 147
    invoke-virtual {v7, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 148
    invoke-virtual {v7, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    add-int/lit8 p1, p7, 0x1

    .line 149
    div-int/lit8 p1, p1, 0x2

    mul-int v0, p7, p8

    mul-int/lit8 p1, p1, 0x2

    mul-int p1, p1, p7

    add-int/2addr v0, p1

    .line 150
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 151
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 152
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    move-object v3, p0

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, p6

    move/from16 v11, p7

    move/from16 v12, p8

    invoke-direct/range {v3 .. v12}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertRawYUV2ByteArray([BLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIII)Z

    return-object p1
.end method

.method public convertRawYUV2ByteHolder(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIII)Z
    .locals 2

    .line 1
    add-int/lit8 v0, p8, 0x1

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    mul-int v1, p8, p9

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    mul-int/2addr v0, p9

    .line 10
    add-int/2addr v1, v0

    .line 11
    invoke-virtual {p0, v1, p1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->checkReuseByteBuffer(ILcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->access$000(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct/range {p0 .. p9}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->convertRawYUV2ByteBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIII)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public convertToJavaI420Buffer(Ljava/nio/ByteBuffer;IIZ)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 14

    .line 1
    const/4 v1, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v1

    .line 5
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->getPendingBuffer()Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_2

    .line 11
    .line 12
    iget v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    iput v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    .line 17
    .line 18
    const/16 v2, 0x3c

    .line 19
    .line 20
    if-lt v0, v2, :cond_1

    .line 21
    .line 22
    const-string v0, "VideoFrameConverter"

    .line 23
    .line 24
    const-string v2, "drop frame > 60 !!! please check Buffer for release"

    .line 25
    .line 26
    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput v3, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    .line 30
    .line 31
    :cond_1
    return-object v1

    .line 32
    :cond_2
    iput v3, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    .line 33
    .line 34
    add-int/lit8 v1, p3, 0x1

    .line 35
    .line 36
    div-int/lit8 v1, v1, 0x2

    .line 37
    .line 38
    add-int/lit8 v4, p2, 0x1

    .line 39
    .line 40
    div-int/lit8 v10, v4, 0x2

    .line 41
    .line 42
    mul-int v4, p2, p3

    .line 43
    .line 44
    mul-int/lit8 v5, v10, 0x2

    .line 45
    .line 46
    mul-int/2addr v5, v1

    .line 47
    add-int/2addr v5, v4

    .line 48
    invoke-virtual {p0, v5, v2}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->checkReuseByteBuffer(ILcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-le v6, v5, :cond_3

    .line 66
    .line 67
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 68
    .line 69
    .line 70
    :cond_3
    invoke-virtual {p0, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    mul-int/2addr v1, v10

    .line 77
    add-int v0, v4, v1

    .line 78
    .line 79
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 100
    .line 101
    .line 102
    add-int/2addr v0, v1

    .line 103
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 107
    .line 108
    .line 109
    move-result-object v11

    .line 110
    if-eqz p4, :cond_4

    .line 111
    .line 112
    new-instance v13, Ll/eel0;

    .line 113
    .line 114
    invoke-direct {v13, v2}, Ll/eel0;-><init>(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    .line 115
    .line 116
    .line 117
    move/from16 v8, p2

    .line 118
    .line 119
    move v12, v10

    .line 120
    move/from16 v5, p2

    .line 121
    .line 122
    move/from16 v6, p3

    .line 123
    .line 124
    invoke-static/range {v5 .. v13}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :cond_4
    new-instance v13, Ll/fel0;

    .line 130
    .line 131
    invoke-direct {v13, v2}, Ll/fel0;-><init>(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    .line 132
    .line 133
    .line 134
    move/from16 v8, p2

    .line 135
    .line 136
    move v12, v10

    .line 137
    move/from16 v5, p2

    .line 138
    .line 139
    move/from16 v6, p3

    .line 140
    .line 141
    invoke-static/range {v5 .. v13}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0
.end method

.method public convertToJavaI420Buffer([BIIZ)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 14

    const/4 v1, 0x0

    if-nez p1, :cond_0

    return-object v1

    .line 146
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->getPendingBuffer()Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 147
    iget v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    const/16 v2, 0x3c

    if-lt v0, v2, :cond_1

    .line 148
    const-string v0, "VideoFrameConverter"

    const-string v2, "drop frame > 60 !!! please check Buffer for release "

    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    iput v3, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    :cond_1
    return-object v1

    .line 150
    :cond_2
    iput v3, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->abandonFrameCount:I

    add-int/lit8 v1, p3, 0x1

    .line 151
    div-int/lit8 v1, v1, 0x2

    add-int/lit8 v4, p2, 0x1

    .line 152
    div-int/lit8 v10, v4, 0x2

    mul-int v4, p2, p3

    mul-int/lit8 v5, v10, 0x2

    mul-int/2addr v5, v1

    add-int/2addr v5, v4

    .line 153
    invoke-virtual {p0, v5, v2}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->checkReuseByteBuffer(ILcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    .line 154
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 155
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    invoke-virtual {p0, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 157
    array-length v6, p1

    invoke-static {v6, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 158
    invoke-virtual {p0, p1, v3, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    mul-int/2addr v1, v10

    add-int v0, v4, v1

    .line 159
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 160
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 161
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 162
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 163
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 164
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 165
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    add-int/2addr v0, v1

    .line 166
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 167
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v11

    if-eqz p4, :cond_3

    .line 168
    new-instance v13, Ll/gel0;

    invoke-direct {v13, v2}, Ll/gel0;-><init>(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    move/from16 v8, p2

    move v12, v10

    move/from16 v5, p2

    move/from16 v6, p3

    invoke-static/range {v5 .. v13}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    move-result-object p0

    return-object p0

    .line 169
    :cond_3
    new-instance v13, Ll/hel0;

    invoke-direct {v13, v2}, Ll/hel0;-><init>(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    move/from16 v8, p2

    move v12, v10

    move/from16 v5, p2

    move/from16 v6, p3

    invoke-static/range {v5 .. v13}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    move-result-object p0

    return-object p0
.end method
