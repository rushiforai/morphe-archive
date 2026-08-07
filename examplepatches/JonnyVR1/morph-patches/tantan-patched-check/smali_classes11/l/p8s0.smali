.class public final Ll/p8s0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(JI)J
    .locals 6
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    return-wide p0

    .line 5
    :cond_0
    mul-long v1, p0, p0

    .line 6
    .line 7
    shr-int/lit8 v3, p2, 0x1

    .line 8
    .line 9
    and-int/2addr p2, v0

    .line 10
    const-wide/32 v4, 0x4000ffff

    .line 11
    .line 12
    .line 13
    rem-long/2addr v1, v4

    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Ll/p8s0;->a(JI)J

    .line 17
    .line 18
    .line 19
    move-result-wide p0

    .line 20
    :goto_0
    rem-long/2addr p0, v4

    .line 21
    return-wide p0

    .line 22
    :cond_1
    invoke-static {v1, v2, v3}, Ll/p8s0;->a(JI)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    rem-long/2addr v0, v4

    .line 27
    mul-long/2addr p0, v0

    .line 28
    goto :goto_0
.end method

.method public static b([Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    add-int/2addr p2, p1

    .line 3
    if-ge v0, p2, :cond_0

    .line 4
    .line 5
    const-string p0, "Unable to construct shingle"

    .line 6
    .line 7
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p0, ""

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    :goto_0
    add-int/lit8 v1, p2, -0x1

    .line 19
    .line 20
    if-ge p1, v1, :cond_1

    .line 21
    .line 22
    aget-object v1, p0, p1

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/16 v1, 0x20

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    add-int/lit8 p1, p1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    aget-object p0, p0, v1

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static c([Ljava/lang/String;IILjava/util/PriorityQueue;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    array-length v4, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x6

    .line 6
    if-ge v4, v2, :cond_0

    .line 7
    .line 8
    invoke-static {v0, v1, v4}, Ll/p8s0;->e([Ljava/lang/String;II)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    move-wide v5, v2

    .line 13
    invoke-static {v0, v1, v4}, Ll/p8s0;->b([Ljava/lang/String;II)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    move/from16 v0, p1

    .line 18
    .line 19
    move-wide v1, v5

    .line 20
    move-object/from16 v5, p3

    .line 21
    .line 22
    invoke-static/range {v0 .. v5}, Ll/p8s0;->d(IJLjava/lang/String;ILjava/util/PriorityQueue;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {v0, v1, v2}, Ll/p8s0;->e([Ljava/lang/String;II)J

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    invoke-static {v0, v1, v2}, Ll/p8s0;->b([Ljava/lang/String;II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v10

    .line 34
    const/4 v11, 0x6

    .line 35
    move/from16 v7, p1

    .line 36
    .line 37
    move-object/from16 v12, p3

    .line 38
    .line 39
    invoke-static/range {v7 .. v12}, Ll/p8s0;->d(IJLjava/lang/String;ILjava/util/PriorityQueue;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    :goto_0
    array-length v11, v0

    .line 44
    add-int/lit8 v3, v11, -0x5

    .line 45
    .line 46
    if-ge v1, v3, :cond_1

    .line 47
    .line 48
    add-int/lit8 v3, v1, -0x1

    .line 49
    .line 50
    aget-object v3, v0, v3

    .line 51
    .line 52
    invoke-static {v3}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    add-int/lit8 v4, v1, 0x5

    .line 57
    .line 58
    aget-object v4, v0, v4

    .line 59
    .line 60
    invoke-static {v4}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    int-to-long v5, v3

    .line 65
    const-wide/32 v12, 0x4000ffff

    .line 66
    .line 67
    .line 68
    add-long/2addr v8, v12

    .line 69
    int-to-long v3, v4

    .line 70
    invoke-static {v0, v1, v2}, Ll/p8s0;->b([Ljava/lang/String;II)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    const-wide/32 v14, 0x7fffffff

    .line 75
    .line 76
    .line 77
    add-long/2addr v3, v14

    .line 78
    add-long/2addr v5, v14

    .line 79
    const-wide/32 v14, 0x1001fff

    .line 80
    .line 81
    .line 82
    const/4 v7, 0x5

    .line 83
    invoke-static {v14, v15, v7}, Ll/p8s0;->a(JI)J

    .line 84
    .line 85
    .line 86
    move-result-wide v16

    .line 87
    rem-long/2addr v5, v12

    .line 88
    mul-long v16, v16, v5

    .line 89
    .line 90
    rem-long v16, v16, v12

    .line 91
    .line 92
    sub-long v8, v8, v16

    .line 93
    .line 94
    rem-long/2addr v8, v12

    .line 95
    mul-long/2addr v8, v14

    .line 96
    rem-long/2addr v8, v12

    .line 97
    rem-long/2addr v3, v12

    .line 98
    add-long/2addr v8, v3

    .line 99
    rem-long/2addr v8, v12

    .line 100
    move/from16 v7, p1

    .line 101
    .line 102
    move-object/from16 v12, p3

    .line 103
    .line 104
    invoke-static/range {v7 .. v12}, Ll/p8s0;->d(IJLjava/lang/String;ILjava/util/PriorityQueue;)V

    .line 105
    .line 106
    .line 107
    add-int/lit8 v1, v1, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_1
    return-void
.end method

.method public static d(IJLjava/lang/String;ILjava/util/PriorityQueue;)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    new-instance v0, Ll/o8s0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Ll/o8s0;-><init>(JLjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p5}, Ljava/util/PriorityQueue;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-ne p1, p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p5}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/o8s0;

    .line 17
    .line 18
    iget p1, p1, Ll/o8s0;->c:I

    .line 19
    .line 20
    iget p2, v0, Ll/o8s0;->c:I

    .line 21
    .line 22
    if-gt p1, p2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p5}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ll/o8s0;

    .line 29
    .line 30
    iget-wide p1, p1, Ll/o8s0;->a:J

    .line 31
    .line 32
    iget-wide p3, v0, Ll/o8s0;->a:J

    .line 33
    .line 34
    cmp-long p1, p1, p3

    .line 35
    .line 36
    if-gtz p1, :cond_2

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p5, v0}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {p5, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-virtual {p5}, Ljava/util/PriorityQueue;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-le p1, p0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p5}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    return-void
.end method

.method public static e([Ljava/lang/String;II)J
    .locals 8

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p1, p0, p1

    .line 3
    .line 4
    invoke-static {p1}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-long v0, p1

    .line 9
    const-wide/32 v2, 0x7fffffff

    .line 10
    .line 11
    .line 12
    add-long/2addr v0, v2

    .line 13
    const-wide/32 v4, 0x4000ffff

    .line 14
    .line 15
    .line 16
    rem-long/2addr v0, v4

    .line 17
    const/4 p1, 0x1

    .line 18
    :goto_0
    if-ge p1, p2, :cond_0

    .line 19
    .line 20
    const-wide/32 v6, 0x1001fff

    .line 21
    .line 22
    .line 23
    mul-long/2addr v0, v6

    .line 24
    rem-long/2addr v0, v4

    .line 25
    aget-object v6, p0, p1

    .line 26
    .line 27
    invoke-static {v6}, Ll/l8s0;->a(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    int-to-long v6, v6

    .line 32
    add-long/2addr v6, v2

    .line 33
    rem-long/2addr v6, v4

    .line 34
    add-long/2addr v0, v6

    .line 35
    rem-long/2addr v0, v4

    .line 36
    add-int/lit8 p1, p1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-wide v0
.end method
