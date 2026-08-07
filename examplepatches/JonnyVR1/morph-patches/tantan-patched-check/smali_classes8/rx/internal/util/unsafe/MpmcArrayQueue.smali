.class public Lrx/internal/util/unsafe/MpmcArrayQueue;
.super Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField<",
        "TE;>;"
    }
.end annotation


# instance fields
.field p30:J

.field p31:J

.field p32:J

.field p33:J

.field p34:J

.field p35:J

.field p36:J

.field p37:J

.field p40:J

.field p41:J

.field p42:J

.field p43:J

.field p44:J

.field p45:J

.field p46:J


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->lvConsumerIndex()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueProducerField;->lvProducerIndex()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-eqz v1, :cond_4

    .line 6
    .line 7
    iget-wide v2, v0, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->mask:J

    .line 8
    .line 9
    const-wide/16 v4, 0x1

    .line 10
    .line 11
    add-long/2addr v2, v4

    .line 12
    iget-object v6, v0, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->sequenceBuffer:[J

    .line 13
    .line 14
    const-wide v7, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0}, Lrx/internal/util/unsafe/MpmcArrayQueueProducerField;->lvProducerIndex()J

    .line 20
    .line 21
    .line 22
    move-result-wide v9

    .line 23
    move-wide v11, v2

    .line 24
    invoke-virtual {v0, v9, v10}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->calcSequenceOffset(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    invoke-virtual {v0, v6, v2, v3}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->lvSequence([JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v13

    .line 32
    sub-long/2addr v13, v9

    .line 33
    const-wide/16 v15, 0x0

    .line 34
    .line 35
    cmp-long v13, v13, v15

    .line 36
    .line 37
    if-nez v13, :cond_1

    .line 38
    .line 39
    move-wide v14, v4

    .line 40
    add-long v4, v9, v14

    .line 41
    .line 42
    invoke-virtual {v0, v9, v10, v4, v5}, Lrx/internal/util/unsafe/MpmcArrayQueueProducerField;->casProducerIndex(JJ)Z

    .line 43
    .line 44
    .line 45
    move-result v13

    .line 46
    if-eqz v13, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0, v9, v10}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->calcElementOffset(J)J

    .line 49
    .line 50
    .line 51
    move-result-wide v7

    .line 52
    invoke-virtual {v0, v7, v8, v1}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->spElement(JLjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    move-object v1, v6

    .line 56
    invoke-virtual/range {v0 .. v5}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->soSequence([JJJ)V

    .line 57
    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    return v0

    .line 61
    :cond_0
    move-object v0, v6

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    move-wide v14, v4

    .line 64
    move-object v0, v6

    .line 65
    if-gez v13, :cond_3

    .line 66
    .line 67
    sub-long/2addr v9, v11

    .line 68
    cmp-long v2, v9, v7

    .line 69
    .line 70
    if-gtz v2, :cond_3

    .line 71
    .line 72
    invoke-virtual/range {p0 .. p0}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->lvConsumerIndex()J

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    cmp-long v4, v9, v2

    .line 77
    .line 78
    if-gtz v4, :cond_2

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    return v0

    .line 82
    :cond_2
    move-wide v7, v2

    .line 83
    :cond_3
    :goto_1
    move-object v6, v0

    .line 84
    move-wide v2, v11

    .line 85
    move-wide v4, v14

    .line 86
    move-object/from16 v0, p0

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    const-string v0, "Null is not a valid element"

    .line 90
    .line 91
    invoke-static {v0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const/4 v0, 0x0

    .line 95
    return v0
.end method

.method public peek()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    :cond_0
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->lvConsumerIndex()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->calcElementOffset(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p0, v2, v3}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->lpElement(J)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueProducerField;->lvProducerIndex()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    cmp-long v0, v0, v3

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    :cond_1
    return-object v2
.end method

.method public poll()Ljava/lang/Object;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->sequenceBuffer:[J

    .line 4
    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    :goto_0
    invoke-virtual {v0}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->lvConsumerIndex()J

    .line 8
    .line 9
    .line 10
    move-result-wide v4

    .line 11
    move-wide v6, v2

    .line 12
    invoke-virtual {v0, v4, v5}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->calcSequenceOffset(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    invoke-virtual {v0, v1, v2, v3}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->lvSequence([JJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide v8

    .line 20
    const-wide/16 v10, 0x1

    .line 21
    .line 22
    add-long v12, v4, v10

    .line 23
    .line 24
    sub-long/2addr v8, v12

    .line 25
    const-wide/16 v14, 0x0

    .line 26
    .line 27
    cmp-long v8, v8, v14

    .line 28
    .line 29
    const/4 v9, 0x0

    .line 30
    if-nez v8, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, v4, v5, v12, v13}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->casConsumerIndex(JJ)Z

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    if-eqz v8, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0, v4, v5}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->calcElementOffset(J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v6

    .line 42
    invoke-virtual {v0, v6, v7}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->lpElement(J)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    invoke-virtual {v0, v6, v7, v9}, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->spElement(JLjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iget-wide v6, v0, Lrx/internal/util/unsafe/ConcurrentCircularArrayQueue;->mask:J

    .line 50
    .line 51
    add-long/2addr v4, v6

    .line 52
    add-long/2addr v4, v10

    .line 53
    invoke-virtual/range {v0 .. v5}, Lrx/internal/util/unsafe/ConcurrentSequencedCircularArrayQueue;->soSequence([JJJ)V

    .line 54
    .line 55
    .line 56
    return-object v8

    .line 57
    :cond_0
    if-gez v8, :cond_1

    .line 58
    .line 59
    cmp-long v0, v4, v6

    .line 60
    .line 61
    if-ltz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual/range {p0 .. p0}, Lrx/internal/util/unsafe/MpmcArrayQueueProducerField;->lvProducerIndex()J

    .line 64
    .line 65
    .line 66
    move-result-wide v2

    .line 67
    cmp-long v0, v4, v2

    .line 68
    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    return-object v9

    .line 72
    :cond_1
    move-wide v2, v6

    .line 73
    :cond_2
    move-object/from16 v0, p0

    .line 74
    .line 75
    goto :goto_0
.end method

.method public size()I
    .locals 6

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->lvConsumerIndex()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :goto_0
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueProducerField;->lvProducerIndex()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p0}, Lrx/internal/util/unsafe/MpmcArrayQueueConsumerField;->lvConsumerIndex()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    cmp-long v0, v0, v4

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sub-long/2addr v2, v4

    .line 18
    long-to-int p0, v2

    .line 19
    return p0

    .line 20
    :cond_0
    move-wide v0, v4

    .line 21
    goto :goto_0
.end method
