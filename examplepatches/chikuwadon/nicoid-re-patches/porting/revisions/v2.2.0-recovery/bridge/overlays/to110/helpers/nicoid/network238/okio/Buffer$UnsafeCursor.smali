.class public final Lnicoid/network238/okio/Buffer$UnsafeCursor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UnsafeCursor"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u0015\u001a\u00020\u0013J\u000e\u0010\u0016\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\u000fJ\u000e\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u000fJ\u000e\u0010\u0019\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u0013J\u0008\u0010\u001b\u001a\u00020\u001cH\u0016R\u0014\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u0012\u0010\u000e\u001a\u00020\u000f8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0010\u001a\u0004\u0018\u00010\u00118\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0012\u001a\u00020\u00138\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0014\u001a\u00020\u00138\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okio/Buffer$UnsafeCursor;",
        "Ljava/io/Closeable;",
        "<init>",
        "()V",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "readWrite",
        "",
        "segment",
        "Lnicoid/network238/okio/Segment;",
        "getSegment$okio",
        "()Lnicoid/network238/okio/Segment;",
        "setSegment$okio",
        "(Lnicoid/network238/okio/Segment;)V",
        "offset",
        "",
        "data",
        "",
        "start",
        "",
        "end",
        "next",
        "seek",
        "resizeBuffer",
        "newSize",
        "expandBuffer",
        "minByteCount",
        "close",
        "",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public buffer:Lnicoid/network238/okio/Buffer;

.field public data:[B

.field public end:I

.field public offset:J

.field public readWrite:Z

.field private segment:Lnicoid/network238/okio/Segment;

.field public start:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 688
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 695
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 699
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 701
    iput v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 863
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v0, :cond_0

    .line 865
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    .line 866
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 867
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 868
    iput-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 869
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 870
    iput v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    return-void

    .line 863
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not attached to a buffer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final expandBuffer(I)J
    .registers 11

    if-lez p1, :cond_3

    const/16 v0, 0x2000

    if-gt p1, v0, :cond_2

    .line 846
    iget-object v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v1, :cond_1

    .line 847
    iget-boolean v2, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v2, :cond_0

    .line 849
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    .line 850
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object p1

    .line 851
    iget v4, p1, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v4, v4, 0x2000

    .line 852
    iput v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v5, v4

    add-long v7, v2, v5

    .line 853
    invoke-virtual {v1, v7, v8}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 856
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 857
    iput-wide v2, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 858
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->data:[B

    iput-object p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    rsub-int p1, v4, 0x2000

    .line 859
    iput p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 860
    iput v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    return-wide v5

    .line 847
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "expandBuffer() only permitted for read/write buffers"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 846
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "not attached to a buffer"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 845
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "minByteCount > Segment.SIZE: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 843
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "minByteCount <= 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getSegment$okio()Lnicoid/network238/okio/Segment;
    .registers 2

    .line 693
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->segment:Lnicoid/network238/okio/Segment;

    return-object v0
.end method

.method public final next()I
    .registers 5

    .line 717
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    iget-object v2, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 719
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const-wide/16 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->seek(J)I

    move-result v0

    return v0

    :cond_0
    iget v2, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    iget v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0

    .line 717
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no more bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final resizeBuffer(J)J
    .registers 16

    .line 790
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v0, :cond_7

    .line 792
    iget-boolean v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v1, :cond_6

    .line 794
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v3, p1, v1

    const-wide/16 v4, 0x0

    if-gtz v3, :cond_3

    cmp-long v3, p1, v4

    if-ltz v3, :cond_2

    sub-long v6, v1, p1

    :goto_0
    cmp-long v3, v6, v4

    if-lez v3, :cond_1

    .line 800
    iget-object v3, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 801
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v8, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v9, v3, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v9, v8, v9

    int-to-long v9, v9

    cmp-long v11, v9, v6

    if-gtz v11, :cond_0

    .line 803
    invoke-virtual {v3}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v8

    iput-object v8, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 804
    invoke-static {v3}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    sub-long/2addr v6, v9

    goto :goto_0

    :cond_0
    long-to-int v4, v6

    sub-int/2addr v8, v4

    .line 807
    iput v8, v3, Lnicoid/network238/okio/Segment;->limit:I

    :cond_1
    nop

    .line 812
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 813
    iput-wide p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 814
    iput-object v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 815
    const/4 v3, -0x1

    iput v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 816
    iput v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    goto :goto_2

    .line 796
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "newSize < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    if-lez v3, :cond_5

    sub-long v6, p1, v1

    const/4 v3, 0x1

    move v8, v3

    :goto_1
    cmp-long v9, v6, v4

    if-lez v9, :cond_5

    .line 822
    invoke-virtual {v0, v3}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v9

    .line 823
    iget v10, v9, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v10, v10, 0x2000

    int-to-long v10, v10

    .line 824
    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    long-to-int v10, v10

    .line 825
    iget v11, v9, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v11, v10

    iput v11, v9, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v11, v10

    sub-long/2addr v6, v11

    if-eqz v8, :cond_4

    .line 830
    invoke-virtual {p0, v9}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 831
    iput-wide v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 832
    iget-object v8, v9, Lnicoid/network238/okio/Segment;->data:[B

    iput-object v8, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 833
    iget v8, v9, Lnicoid/network238/okio/Segment;->limit:I

    sub-int v9, v8, v10

    iput v9, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 834
    iput v8, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    const/4 v8, 0x0

    goto :goto_1

    :cond_4
    goto :goto_1

    .line 840
    :cond_5
    :goto_2
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-wide v1

    .line 792
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "resizeBuffer() only permitted for read/write buffers"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 790
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "not attached to a buffer"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final seek(J)I
    .registers 14

    .line 720
    iget-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v0, :cond_9

    const-wide/16 v1, -0x1

    cmp-long v1, p1, v1

    if-ltz v1, :cond_8

    .line 722
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v2, p1, v2

    if-gtz v2, :cond_8

    if-eqz v1, :cond_7

    .line 726
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-eqz v1, :cond_7

    .line 737
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .line 738
    iget-object v3, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 740
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v4

    const-wide/16 v5, 0x0

    if-eqz v4, :cond_1

    .line 741
    iget-wide v7, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    iget v4, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v9, v9, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v9

    int-to-long v9, v4

    sub-long/2addr v7, v9

    cmp-long v4, v7, p1

    if-lez v4, :cond_0

    .line 745
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v1

    move-object v4, v3

    move-object v3, v1

    move-wide v1, v7

    goto :goto_0

    .line 749
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v4

    move-wide v5, v7

    goto :goto_0

    :cond_1
    move-object v4, v3

    :goto_0
    sub-long v7, v1, p1

    sub-long v9, p1, v5

    cmp-long v7, v7, v9

    if-lez v7, :cond_2

    .line 759
    :goto_1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v4, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    add-long/2addr v1, v5

    cmp-long v3, p1, v1

    if-ltz v3, :cond_4

    .line 761
    iget-object v4, v4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    move-wide v5, v1

    goto :goto_1

    :cond_2
    nop

    :goto_2
    cmp-long v4, v1, p1

    if-lez v4, :cond_3

    .line 768
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 769
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v4, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v5

    int-to-long v4, v4

    sub-long/2addr v1, v4

    goto :goto_2

    .line 761
    :cond_3
    move-wide v5, v1

    move-object v4, v3

    .line 774
    :cond_4
    iget-boolean v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v1, :cond_6

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v1, v4, Lnicoid/network238/okio/Segment;->shared:Z

    if-eqz v1, :cond_6

    .line 775
    invoke-virtual {v4}, Lnicoid/network238/okio/Segment;->unsharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 776
    iget-object v2, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-ne v2, v4, :cond_5

    .line 777
    iput-object v1, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 779
    :cond_5
    invoke-virtual {v4, v1}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    move-result-object v4

    .line 780
    iget-object v0, v4, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    .line 784
    :cond_6
    invoke-virtual {p0, v4}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 785
    iput-wide p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 786
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v4, Lnicoid/network238/okio/Segment;->data:[B

    iput-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 787
    iget v0, v4, Lnicoid/network238/okio/Segment;->pos:I

    sub-long/2addr p1, v5

    long-to-int p1, p1

    add-int/2addr v0, p1

    iput v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 788
    iget p1, v4, Lnicoid/network238/okio/Segment;->limit:I

    iput p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    sub-int/2addr p1, v0

    return p1

    :cond_7
    nop

    .line 727
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 728
    iput-wide p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 729
    iput-object v0, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 730
    const/4 p1, -0x1

    iput p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 731
    iput p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    return p1

    .line 723
    :cond_8
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "offset="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " > size="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 720
    :cond_9
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "not attached to a buffer"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setSegment$okio(Lnicoid/network238/okio/Segment;)V
    .registers 2

    .line 693
    iput-object p1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->segment:Lnicoid/network238/okio/Segment;

    return-void
.end method
