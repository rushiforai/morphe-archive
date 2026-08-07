.class public final Lokio/Buffer$UnsafeCursor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UnsafeCursor"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016J\u000e\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u0008J\u0006\u0010\u0014\u001a\u00020\u0008J\u000e\u0010\u0015\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\nJ\u000e\u0010\u0017\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nR\u0014\u0010\u0003\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u00020\u00088\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\t\u001a\u00020\n8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u00020\u000c8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000f\u001a\u00020\u00088\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lokio/Buffer$UnsafeCursor;",
        "Ljava/io/Closeable;",
        "()V",
        "buffer",
        "Lokio/Buffer;",
        "data",
        "",
        "end",
        "",
        "offset",
        "",
        "readWrite",
        "",
        "segment",
        "Lokio/Segment;",
        "start",
        "close",
        "",
        "expandBuffer",
        "minByteCount",
        "next",
        "resizeBuffer",
        "newSize",
        "seek",
        "jvm"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation


# instance fields
.field public buffer:Lokio/Buffer;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public data:[B
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public end:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public offset:J
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public readWrite:Z
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field private segment:Lokio/Segment;

.field public start:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 10
    .line 11
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 7
    .line 8
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 9
    .line 10
    const-wide/16 v1, -0x1

    .line 11
    .line 12
    iput-wide v1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 13
    .line 14
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 18
    .line 19
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "not attached to a buffer"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final expandBuffer(I)J
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-lez p1, :cond_3

    .line 4
    .line 5
    const/16 v2, 0x2000

    .line 6
    .line 7
    if-gt p1, v2, :cond_2

    .line 8
    .line 9
    iget-object v3, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 10
    .line 11
    if-eqz v3, :cond_1

    .line 12
    .line 13
    iget-boolean v4, p0, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {v3}, Lokio/Buffer;->size()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-virtual {v3, p1}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget v4, p1, Lokio/Segment;->limit:I

    .line 26
    .line 27
    rsub-int v4, v4, 0x2000

    .line 28
    .line 29
    iput v2, p1, Lokio/Segment;->limit:I

    .line 30
    .line 31
    int-to-long v5, v4

    .line 32
    add-long v7, v0, v5

    .line 33
    .line 34
    invoke-virtual {v3, v7, v8}, Lokio/Buffer;->setSize$jvm(J)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 38
    .line 39
    iput-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 40
    .line 41
    iget-object p1, p1, Lokio/Segment;->data:[B

    .line 42
    .line 43
    iput-object p1, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 44
    .line 45
    rsub-int p1, v4, 0x2000

    .line 46
    .line 47
    iput p1, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 48
    .line 49
    iput v2, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 50
    .line 51
    return-wide v5

    .line 52
    :cond_0
    const-string p0, "expandBuffer() only permitted for read/write buffers"

    .line 53
    .line 54
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-wide v0

    .line 58
    :cond_1
    const-string p0, "not attached to a buffer"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-wide v0

    .line 64
    :cond_2
    const-string p0, "minByteCount > Segment.SIZE: "

    .line 65
    .line 66
    invoke-static {p0, p1}, Ll/plk0;->a(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    return-wide v0

    .line 70
    :cond_3
    const-string p0, "minByteCount <= 0: "

    .line 71
    .line 72
    invoke-static {p0, p1}, Ll/plk0;->a(Ljava/lang/String;I)V

    .line 73
    .line 74
    .line 75
    return-wide v0
.end method

.method public final next()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 2
    .line 3
    iget-object v2, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {v2}, Lokio/Buffer;->size()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-wide v0, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 19
    .line 20
    const-wide/16 v2, -0x1

    .line 21
    .line 22
    cmp-long v2, v0, v2

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_1
    iget v2, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 34
    .line 35
    iget v3, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 36
    .line 37
    sub-int/2addr v2, v3

    .line 38
    int-to-long v2, v2

    .line 39
    add-long/2addr v0, v2

    .line 40
    invoke-virtual {p0, v0, v1}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_2
    const-string p0, "no more bytes"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method public final resizeBuffer(J)J
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    iget-object v3, v0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    if-eqz v3, :cond_9

    .line 10
    .line 11
    iget-boolean v6, v0, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 12
    .line 13
    if-eqz v6, :cond_8

    .line 14
    .line 15
    invoke-virtual {v3}, Lokio/Buffer;->size()J

    .line 16
    .line 17
    .line 18
    move-result-wide v6

    .line 19
    cmp-long v8, v1, v6

    .line 20
    .line 21
    if-gtz v8, :cond_5

    .line 22
    .line 23
    cmp-long v8, v1, v4

    .line 24
    .line 25
    if-ltz v8, :cond_4

    .line 26
    .line 27
    sub-long v8, v6, v1

    .line 28
    .line 29
    :goto_0
    cmp-long v10, v8, v4

    .line 30
    .line 31
    if-lez v10, :cond_3

    .line 32
    .line 33
    iget-object v10, v3, Lokio/Buffer;->head:Lokio/Segment;

    .line 34
    .line 35
    if-nez v10, :cond_0

    .line 36
    .line 37
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v10, v10, Lokio/Segment;->prev:Lokio/Segment;

    .line 41
    .line 42
    if-nez v10, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget v11, v10, Lokio/Segment;->limit:I

    .line 48
    .line 49
    iget v12, v10, Lokio/Segment;->pos:I

    .line 50
    .line 51
    sub-int v12, v11, v12

    .line 52
    .line 53
    int-to-long v12, v12

    .line 54
    cmp-long v14, v12, v8

    .line 55
    .line 56
    if-gtz v14, :cond_2

    .line 57
    .line 58
    invoke-virtual {v10}, Lokio/Segment;->pop()Lokio/Segment;

    .line 59
    .line 60
    .line 61
    move-result-object v11

    .line 62
    iput-object v11, v3, Lokio/Buffer;->head:Lokio/Segment;

    .line 63
    .line 64
    invoke-static {v10}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 65
    .line 66
    .line 67
    sub-long/2addr v8, v12

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    long-to-int v4, v8

    .line 70
    sub-int/2addr v11, v4

    .line 71
    iput v11, v10, Lokio/Segment;->limit:I

    .line 72
    .line 73
    :cond_3
    const/4 v4, 0x0

    .line 74
    iput-object v4, v0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 75
    .line 76
    iput-wide v1, v0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 77
    .line 78
    iput-object v4, v0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 79
    .line 80
    const/4 v4, -0x1

    .line 81
    iput v4, v0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 82
    .line 83
    iput v4, v0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    const-string v0, "newSize < 0: "

    .line 87
    .line 88
    invoke-static {v0, v1, v2}, Ll/iq70;->a(Ljava/lang/String;J)V

    .line 89
    .line 90
    .line 91
    return-wide v4

    .line 92
    :cond_5
    if-lez v8, :cond_7

    .line 93
    .line 94
    sub-long v8, v1, v6

    .line 95
    .line 96
    const/4 v10, 0x1

    .line 97
    move v11, v10

    .line 98
    :goto_1
    cmp-long v12, v8, v4

    .line 99
    .line 100
    if-lez v12, :cond_7

    .line 101
    .line 102
    invoke-virtual {v3, v10}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 103
    .line 104
    .line 105
    move-result-object v12

    .line 106
    iget v13, v12, Lokio/Segment;->limit:I

    .line 107
    .line 108
    rsub-int v13, v13, 0x2000

    .line 109
    .line 110
    int-to-long v13, v13

    .line 111
    invoke-static {v8, v9, v13, v14}, Ljava/lang/Math;->min(JJ)J

    .line 112
    .line 113
    .line 114
    move-result-wide v13

    .line 115
    long-to-int v13, v13

    .line 116
    iget v14, v12, Lokio/Segment;->limit:I

    .line 117
    .line 118
    add-int/2addr v14, v13

    .line 119
    iput v14, v12, Lokio/Segment;->limit:I

    .line 120
    .line 121
    move-wide v15, v4

    .line 122
    int-to-long v4, v13

    .line 123
    sub-long/2addr v8, v4

    .line 124
    if-eqz v11, :cond_6

    .line 125
    .line 126
    iput-object v12, v0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 127
    .line 128
    iput-wide v6, v0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 129
    .line 130
    iget-object v4, v12, Lokio/Segment;->data:[B

    .line 131
    .line 132
    iput-object v4, v0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 133
    .line 134
    sub-int v4, v14, v13

    .line 135
    .line 136
    iput v4, v0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 137
    .line 138
    iput v14, v0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 139
    .line 140
    const/4 v11, 0x0

    .line 141
    :cond_6
    move-wide v4, v15

    .line 142
    goto :goto_1

    .line 143
    :cond_7
    :goto_2
    invoke-virtual {v3, v1, v2}, Lokio/Buffer;->setSize$jvm(J)V

    .line 144
    .line 145
    .line 146
    return-wide v6

    .line 147
    :cond_8
    move-wide v15, v4

    .line 148
    const-string v0, "resizeBuffer() only permitted for read/write buffers"

    .line 149
    .line 150
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-wide v15

    .line 154
    :cond_9
    move-wide v15, v4

    .line 155
    const-string v0, "not attached to a buffer"

    .line 156
    .line 157
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-wide v15
.end method

.method public final seek(J)I
    .locals 12

    .line 1
    iget-object v0, p0, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_11

    .line 5
    .line 6
    const-wide/16 v2, -0x1

    .line 7
    .line 8
    cmp-long v4, p1, v2

    .line 9
    .line 10
    if-ltz v4, :cond_10

    .line 11
    .line 12
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    cmp-long v4, p1, v4

    .line 17
    .line 18
    if-gtz v4, :cond_10

    .line 19
    .line 20
    cmp-long v1, p1, v2

    .line 21
    .line 22
    if-eqz v1, :cond_f

    .line 23
    .line 24
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    cmp-long v1, p1, v1

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_0
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    iget-object v3, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 39
    .line 40
    iget-object v4, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 41
    .line 42
    const-wide/16 v5, 0x0

    .line 43
    .line 44
    if-eqz v4, :cond_3

    .line 45
    .line 46
    iget-wide v7, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 47
    .line 48
    iget v9, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 49
    .line 50
    if-nez v4, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget v4, v4, Lokio/Segment;->pos:I

    .line 56
    .line 57
    sub-int/2addr v9, v4

    .line 58
    int-to-long v9, v9

    .line 59
    sub-long/2addr v7, v9

    .line 60
    cmp-long v4, v7, p1

    .line 61
    .line 62
    iget-object v9, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 63
    .line 64
    if-lez v4, :cond_2

    .line 65
    .line 66
    move-object v1, v9

    .line 67
    move-object v9, v3

    .line 68
    move-object v3, v1

    .line 69
    move-wide v1, v7

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    move-wide v5, v7

    .line 72
    goto :goto_0

    .line 73
    :cond_3
    move-object v9, v3

    .line 74
    :goto_0
    sub-long v7, v1, p1

    .line 75
    .line 76
    sub-long v10, p1, v5

    .line 77
    .line 78
    cmp-long v4, v7, v10

    .line 79
    .line 80
    if-lez v4, :cond_5

    .line 81
    .line 82
    :goto_1
    if-nez v9, :cond_4

    .line 83
    .line 84
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 85
    .line 86
    .line 87
    :cond_4
    iget v1, v9, Lokio/Segment;->limit:I

    .line 88
    .line 89
    iget v2, v9, Lokio/Segment;->pos:I

    .line 90
    .line 91
    sub-int v3, v1, v2

    .line 92
    .line 93
    int-to-long v3, v3

    .line 94
    add-long/2addr v3, v5

    .line 95
    cmp-long v3, p1, v3

    .line 96
    .line 97
    if-ltz v3, :cond_9

    .line 98
    .line 99
    sub-int/2addr v1, v2

    .line 100
    int-to-long v1, v1

    .line 101
    add-long/2addr v5, v1

    .line 102
    iget-object v9, v9, Lokio/Segment;->next:Lokio/Segment;

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    :goto_2
    cmp-long v4, v1, p1

    .line 106
    .line 107
    if-lez v4, :cond_8

    .line 108
    .line 109
    if-nez v3, :cond_6

    .line 110
    .line 111
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object v3, v3, Lokio/Segment;->prev:Lokio/Segment;

    .line 115
    .line 116
    if-nez v3, :cond_7

    .line 117
    .line 118
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 119
    .line 120
    .line 121
    :cond_7
    iget v4, v3, Lokio/Segment;->limit:I

    .line 122
    .line 123
    iget v5, v3, Lokio/Segment;->pos:I

    .line 124
    .line 125
    sub-int/2addr v4, v5

    .line 126
    int-to-long v4, v4

    .line 127
    sub-long/2addr v1, v4

    .line 128
    goto :goto_2

    .line 129
    :cond_8
    move-wide v5, v1

    .line 130
    move-object v9, v3

    .line 131
    :cond_9
    iget-boolean v1, p0, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 132
    .line 133
    if-eqz v1, :cond_d

    .line 134
    .line 135
    if-nez v9, :cond_a

    .line 136
    .line 137
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 138
    .line 139
    .line 140
    :cond_a
    iget-boolean v1, v9, Lokio/Segment;->shared:Z

    .line 141
    .line 142
    if-eqz v1, :cond_d

    .line 143
    .line 144
    invoke-virtual {v9}, Lokio/Segment;->unsharedCopy()Lokio/Segment;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 149
    .line 150
    if-ne v2, v9, :cond_b

    .line 151
    .line 152
    iput-object v1, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 153
    .line 154
    :cond_b
    invoke-virtual {v9, v1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 155
    .line 156
    .line 157
    move-result-object v9

    .line 158
    iget-object v0, v9, Lokio/Segment;->prev:Lokio/Segment;

    .line 159
    .line 160
    if-nez v0, :cond_c

    .line 161
    .line 162
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 163
    .line 164
    .line 165
    :cond_c
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 166
    .line 167
    .line 168
    :cond_d
    iput-object v9, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 169
    .line 170
    iput-wide p1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 171
    .line 172
    if-nez v9, :cond_e

    .line 173
    .line 174
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 175
    .line 176
    .line 177
    :cond_e
    iget-object v0, v9, Lokio/Segment;->data:[B

    .line 178
    .line 179
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 180
    .line 181
    iget v0, v9, Lokio/Segment;->pos:I

    .line 182
    .line 183
    sub-long/2addr p1, v5

    .line 184
    long-to-int p1, p1

    .line 185
    add-int/2addr v0, p1

    .line 186
    iput v0, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 187
    .line 188
    iget p1, v9, Lokio/Segment;->limit:I

    .line 189
    .line 190
    iput p1, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 191
    .line 192
    sub-int/2addr p1, v0

    .line 193
    return p1

    .line 194
    :cond_f
    :goto_3
    const/4 v0, 0x0

    .line 195
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->segment:Lokio/Segment;

    .line 196
    .line 197
    iput-wide p1, p0, Lokio/Buffer$UnsafeCursor;->offset:J

    .line 198
    .line 199
    iput-object v0, p0, Lokio/Buffer$UnsafeCursor;->data:[B

    .line 200
    .line 201
    const/4 p1, -0x1

    .line 202
    iput p1, p0, Lokio/Buffer$UnsafeCursor;->start:I

    .line 203
    .line 204
    iput p1, p0, Lokio/Buffer$UnsafeCursor;->end:I

    .line 205
    .line 206
    return p1

    .line 207
    :cond_10
    sget-object p0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 208
    .line 209
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 214
    .line 215
    .line 216
    move-result-wide p1

    .line 217
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    const/4 p1, 0x2

    .line 226
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    const-string p1, "offset=%s > size=%s"

    .line 231
    .line 232
    invoke-static {p1, p0}, Ll/zg3;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    return v1

    .line 236
    :cond_11
    const-string p0, "not attached to a buffer"

    .line 237
    .line 238
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    return v1
.end method
