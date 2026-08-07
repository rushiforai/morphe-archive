.class public Lcom/tencent/rtmp/sharp/jni/RingBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final DEFAULT_SIZE:I

.field public c_totalSize:I

.field public m_isEmpty:Z

.field public m_pBuf:[B

.field public m_read:I

.field public m_write:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e8

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->DEFAULT_SIZE:I

    .line 7
    .line 8
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_isEmpty:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 15
    .line 16
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 17
    .line 18
    new-array v0, v0, [B

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3e8

    .line 24
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->DEFAULT_SIZE:I

    .line 25
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_isEmpty:Z

    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 28
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 29
    new-array p1, p1, [B

    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    return-void
.end method


# virtual methods
.method public Clear()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 3
    .line 4
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_isEmpty:Z

    .line 8
    .line 9
    return-void
.end method

.method public Pop([BI)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lt v0, p2, :cond_4

    .line 12
    .line 13
    if-gtz p2, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 17
    .line 18
    iget v2, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 19
    .line 20
    sub-int v3, v0, v2

    .line 21
    .line 22
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 23
    .line 24
    if-lt v3, p2, :cond_2

    .line 25
    .line 26
    invoke-static {v4, v2, p1, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sub-int/2addr v0, v2

    .line 31
    invoke-static {v4, v2, p1, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 35
    .line 36
    iget v2, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 37
    .line 38
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 39
    .line 40
    sub-int v4, v2, v3

    .line 41
    .line 42
    sub-int/2addr v2, v3

    .line 43
    sub-int v2, p2, v2

    .line 44
    .line 45
    invoke-static {v0, v1, p1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget p1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 49
    .line 50
    add-int/2addr p1, p2

    .line 51
    iget p2, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 52
    .line 53
    rem-int/2addr p1, p2

    .line 54
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 55
    .line 56
    iget p2, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    if-ne p1, p2, :cond_3

    .line 60
    .line 61
    move v1, v0

    .line 62
    :cond_3
    iput-boolean v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_isEmpty:Z

    .line 63
    .line 64
    return v0

    .line 65
    :cond_4
    :goto_1
    return v1
.end method

.method public Push([BI)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainWrite()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge v0, p2, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 14
    .line 15
    iget v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 16
    .line 17
    sub-int v2, v0, v1

    .line 18
    .line 19
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-lt v2, p2, :cond_2

    .line 23
    .line 24
    invoke-static {p1, v4, v3, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    sub-int/2addr v0, v1

    .line 29
    invoke-static {p1, v4, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 33
    .line 34
    iget v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 35
    .line 36
    sub-int v2, v0, v1

    .line 37
    .line 38
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_pBuf:[B

    .line 39
    .line 40
    sub-int/2addr v0, v1

    .line 41
    sub-int v0, p2, v0

    .line 42
    .line 43
    invoke-static {p1, v2, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    :goto_1
    iget p1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 47
    .line 48
    add-int/2addr p1, p2

    .line 49
    iget p2, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 50
    .line 51
    rem-int/2addr p1, p2

    .line 52
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 53
    .line 54
    iput-boolean v4, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_isEmpty:Z

    .line 55
    .line 56
    return-void
.end method

.method public RemainRead()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_write:I

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_read:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 8
    .line 9
    sub-int/2addr p0, v1

    .line 10
    add-int/2addr p0, v0

    .line 11
    return p0

    .line 12
    :cond_0
    if-le v0, v1, :cond_1

    .line 13
    .line 14
    sub-int/2addr v0, v1

    .line 15
    return v0

    .line 16
    :cond_1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->m_isEmpty:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_2
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 23
    .line 24
    return p0
.end method

.method public RemainWrite()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->c_totalSize:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sub-int/2addr v0, p0

    .line 8
    return v0
.end method
