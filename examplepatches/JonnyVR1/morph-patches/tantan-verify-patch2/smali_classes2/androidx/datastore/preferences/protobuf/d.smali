.class public final Landroidx/datastore/preferences/protobuf/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/datastore/preferences/protobuf/d$b;
    }
.end annotation


# direct methods
.method public static A(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/r;

    .line 2
    .line 3
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 14
    .line 15
    .line 16
    :goto_0
    if-ge p2, p3, :cond_1

    .line 17
    .line 18
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 23
    .line 24
    if-eq p0, v1, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 32
    .line 33
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :goto_1
    return p2
.end method

.method public static B(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/x;

    .line 2
    .line 3
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget-wide v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p4, v0, v1}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 14
    .line 15
    .line 16
    :goto_0
    if-ge p2, p3, :cond_1

    .line 17
    .line 18
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 23
    .line 24
    if-eq p0, v1, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iget-wide v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-virtual {p4, v0, v1}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :goto_1
    return p2
.end method

.method public static C([BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p2, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 6
    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    iput-object p0, p2, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 14
    .line 15
    return p1

    .line 16
    :cond_0
    new-instance v1, Ljava/lang/String;

    .line 17
    .line 18
    sget-object v2, Landroidx/datastore/preferences/protobuf/s;->a:Ljava/nio/charset/Charset;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, v0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p2, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 24
    .line 25
    add-int/2addr p1, v0

    .line 26
    return p1

    .line 27
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    throw p0
.end method

.method public static D(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 6
    .line 7
    if-ltz v0, :cond_5

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    new-instance v2, Ljava/lang/String;

    .line 18
    .line 19
    sget-object v3, Landroidx/datastore/preferences/protobuf/s;->a:Ljava/nio/charset/Charset;

    .line 20
    .line 21
    invoke-direct {v2, p1, p2, v0, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :goto_0
    add-int/2addr p2, v0

    .line 28
    :goto_1
    if-ge p2, p3, :cond_4

    .line 29
    .line 30
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget v2, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 35
    .line 36
    if-eq p0, v2, :cond_1

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_1
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 44
    .line 45
    if-ltz v0, :cond_3

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    new-instance v2, Ljava/lang/String;

    .line 54
    .line 55
    sget-object v3, Landroidx/datastore/preferences/protobuf/s;->a:Ljava/nio/charset/Charset;

    .line 56
    .line 57
    invoke-direct {v2, p1, p2, v0, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    throw p0

    .line 69
    :cond_4
    :goto_2
    return p2

    .line 70
    :cond_5
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    throw p0
.end method

.method public static E(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 6
    .line 7
    if-ltz v0, :cond_7

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    add-int v2, p2, v0

    .line 18
    .line 19
    invoke-static {p1, p2, v2}, Landroidx/datastore/preferences/protobuf/Utf8;->t([BII)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_6

    .line 24
    .line 25
    new-instance v3, Ljava/lang/String;

    .line 26
    .line 27
    sget-object v4, Landroidx/datastore/preferences/protobuf/s;->a:Ljava/nio/charset/Charset;

    .line 28
    .line 29
    invoke-direct {v3, p1, p2, v0, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :goto_0
    move p2, v2

    .line 36
    :goto_1
    if-ge p2, p3, :cond_5

    .line 37
    .line 38
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget v2, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 43
    .line 44
    if-eq p0, v2, :cond_1

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 52
    .line 53
    if-ltz v0, :cond_4

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    add-int v2, p2, v0

    .line 62
    .line 63
    invoke-static {p1, p2, v2}, Landroidx/datastore/preferences/protobuf/Utf8;->t([BII)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    new-instance v3, Ljava/lang/String;

    .line 70
    .line 71
    sget-object v4, Landroidx/datastore/preferences/protobuf/s;->a:Ljava/nio/charset/Charset;

    .line 72
    .line 73
    invoke-direct {v3, p1, p2, v0, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 74
    .line 75
    .line 76
    invoke-interface {p4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidUtf8()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    throw p0

    .line 85
    :cond_4
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    throw p0

    .line 90
    :cond_5
    :goto_2
    return p2

    .line 91
    :cond_6
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidUtf8()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    throw p0

    .line 96
    :cond_7
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    throw p0
.end method

.method public static F([BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p2, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 6
    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    iput-object p0, p2, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 14
    .line 15
    return p1

    .line 16
    :cond_0
    invoke-static {p0, p1, v0}, Landroidx/datastore/preferences/protobuf/Utf8;->h([BII)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iput-object p0, p2, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 21
    .line 22
    add-int/2addr p1, v0

    .line 23
    return p1

    .line 24
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    throw p0
.end method

.method public static G(I[BIILandroidx/datastore/preferences/protobuf/m0;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/WireFormat;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_b

    .line 6
    .line 7
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/WireFormat;->b(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_a

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_9

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_5

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    const/4 p3, 0x5

    .line 23
    if-ne v0, p3, :cond_0

    .line 24
    .line 25
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p4, p0, p1}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 p2, p2, 0x4

    .line 37
    .line 38
    return p2

    .line 39
    :cond_0
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidTag()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    throw p0

    .line 44
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->l()Landroidx/datastore/preferences/protobuf/m0;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    and-int/lit8 v0, p0, -0x8

    .line 49
    .line 50
    or-int/lit8 v6, v0, 0x4

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    :goto_0
    if-ge p2, p3, :cond_2

    .line 54
    .line 55
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 60
    .line 61
    if-ne v0, v6, :cond_3

    .line 62
    .line 63
    move p2, v2

    .line 64
    :cond_2
    move v3, p3

    .line 65
    goto :goto_1

    .line 66
    :cond_3
    move-object v1, p1

    .line 67
    move v3, p3

    .line 68
    move-object v5, p5

    .line 69
    invoke-static/range {v0 .. v5}, Landroidx/datastore/preferences/protobuf/d;->G(I[BIILandroidx/datastore/preferences/protobuf/m0;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    goto :goto_0

    .line 74
    :goto_1
    if-gt p2, v3, :cond_4

    .line 75
    .line 76
    if-ne v0, v6, :cond_4

    .line 77
    .line 78
    invoke-virtual {p4, p0, v4}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return p2

    .line 82
    :cond_4
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->parseFailure()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    throw p0

    .line 87
    :cond_5
    move-object v1, p1

    .line 88
    move-object v5, p5

    .line 89
    invoke-static {v1, p2, v5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iget p2, v5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 94
    .line 95
    if-ltz p2, :cond_8

    .line 96
    .line 97
    array-length p3, v1

    .line 98
    sub-int/2addr p3, p1

    .line 99
    if-gt p2, p3, :cond_7

    .line 100
    .line 101
    if-nez p2, :cond_6

    .line 102
    .line 103
    sget-object p3, Landroidx/datastore/preferences/protobuf/ByteString;->EMPTY:Landroidx/datastore/preferences/protobuf/ByteString;

    .line 104
    .line 105
    invoke-virtual {p4, p0, p3}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    invoke-static {v1, p1, p2}, Landroidx/datastore/preferences/protobuf/ByteString;->copyFrom([BII)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    invoke-virtual {p4, p0, p3}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    :goto_2
    add-int/2addr p1, p2

    .line 117
    return p1

    .line 118
    :cond_7
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    throw p0

    .line 123
    :cond_8
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    throw p0

    .line 128
    :cond_9
    move-object v1, p1

    .line 129
    invoke-static {v1, p2}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 130
    .line 131
    .line 132
    move-result-wide v0

    .line 133
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p4, p0, p1}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    add-int/lit8 p2, p2, 0x8

    .line 141
    .line 142
    return p2

    .line 143
    :cond_a
    move-object v1, p1

    .line 144
    move-object v5, p5

    .line 145
    invoke-static {v1, p2, v5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iget-wide p2, v5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 150
    .line 151
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p4, p0, p2}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    return p1

    .line 159
    :cond_b
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidTag()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    throw p0
.end method

.method public static H(I[BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2

    .line 1
    and-int/lit8 p0, p0, 0x7f

    .line 2
    .line 3
    add-int/lit8 v0, p2, 0x1

    .line 4
    .line 5
    aget-byte v1, p1, p2

    .line 6
    .line 7
    if-ltz v1, :cond_0

    .line 8
    .line 9
    shl-int/lit8 p1, v1, 0x7

    .line 10
    .line 11
    or-int/2addr p0, p1

    .line 12
    iput p0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    and-int/lit8 v1, v1, 0x7f

    .line 16
    .line 17
    shl-int/lit8 v1, v1, 0x7

    .line 18
    .line 19
    or-int/2addr p0, v1

    .line 20
    add-int/lit8 v1, p2, 0x2

    .line 21
    .line 22
    aget-byte v0, p1, v0

    .line 23
    .line 24
    if-ltz v0, :cond_1

    .line 25
    .line 26
    shl-int/lit8 p1, v0, 0xe

    .line 27
    .line 28
    or-int/2addr p0, p1

    .line 29
    iput p0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    and-int/lit8 v0, v0, 0x7f

    .line 33
    .line 34
    shl-int/lit8 v0, v0, 0xe

    .line 35
    .line 36
    or-int/2addr p0, v0

    .line 37
    add-int/lit8 v0, p2, 0x3

    .line 38
    .line 39
    aget-byte v1, p1, v1

    .line 40
    .line 41
    if-ltz v1, :cond_2

    .line 42
    .line 43
    shl-int/lit8 p1, v1, 0x15

    .line 44
    .line 45
    or-int/2addr p0, p1

    .line 46
    iput p0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 47
    .line 48
    return v0

    .line 49
    :cond_2
    and-int/lit8 v1, v1, 0x7f

    .line 50
    .line 51
    shl-int/lit8 v1, v1, 0x15

    .line 52
    .line 53
    or-int/2addr p0, v1

    .line 54
    add-int/lit8 p2, p2, 0x4

    .line 55
    .line 56
    aget-byte v0, p1, v0

    .line 57
    .line 58
    if-ltz v0, :cond_3

    .line 59
    .line 60
    shl-int/lit8 p1, v0, 0x1c

    .line 61
    .line 62
    or-int/2addr p0, p1

    .line 63
    iput p0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 64
    .line 65
    return p2

    .line 66
    :cond_3
    and-int/lit8 v0, v0, 0x7f

    .line 67
    .line 68
    shl-int/lit8 v0, v0, 0x1c

    .line 69
    .line 70
    or-int/2addr p0, v0

    .line 71
    :goto_0
    add-int/lit8 v0, p2, 0x1

    .line 72
    .line 73
    aget-byte p2, p1, p2

    .line 74
    .line 75
    if-gez p2, :cond_4

    .line 76
    .line 77
    move p2, v0

    .line 78
    goto :goto_0

    .line 79
    :cond_4
    iput p0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 80
    .line 81
    return v0
.end method

.method public static I([BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 1

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    aget-byte p1, p0, p1

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    iput p1, p2, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    invoke-static {p1, p0, v0, p2}, Landroidx/datastore/preferences/protobuf/d;->H(I[BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static J(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/r;

    .line 2
    .line 3
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 10
    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 19
    .line 20
    if-eq p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 28
    .line 29
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return p2
.end method

.method public static K(J[BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 7

    .line 1
    const-wide/16 v0, 0x7f

    .line 2
    .line 3
    and-long/2addr p0, v0

    .line 4
    add-int/lit8 v0, p3, 0x1

    .line 5
    .line 6
    aget-byte p3, p2, p3

    .line 7
    .line 8
    and-int/lit8 v1, p3, 0x7f

    .line 9
    .line 10
    int-to-long v1, v1

    .line 11
    const/4 v3, 0x7

    .line 12
    shl-long/2addr v1, v3

    .line 13
    or-long/2addr p0, v1

    .line 14
    move v1, v3

    .line 15
    :goto_0
    if-gez p3, :cond_0

    .line 16
    .line 17
    add-int/lit8 p3, v0, 0x1

    .line 18
    .line 19
    aget-byte v0, p2, v0

    .line 20
    .line 21
    add-int/2addr v1, v3

    .line 22
    and-int/lit8 v2, v0, 0x7f

    .line 23
    .line 24
    int-to-long v4, v2

    .line 25
    shl-long/2addr v4, v1

    .line 26
    or-long/2addr p0, v4

    .line 27
    move v6, v0

    .line 28
    move v0, p3

    .line 29
    move p3, v6

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iput-wide p0, p4, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 32
    .line 33
    return v0
.end method

.method public static L([BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 5

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    aget-byte p1, p0, p1

    .line 4
    .line 5
    int-to-long v1, p1

    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long p1, v1, v3

    .line 9
    .line 10
    if-ltz p1, :cond_0

    .line 11
    .line 12
    iput-wide v1, p2, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    invoke-static {v1, v2, p0, v0, p2}, Landroidx/datastore/preferences/protobuf/d;->K(J[BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public static M(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/x;

    .line 2
    .line 3
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget-wide v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 8
    .line 9
    invoke-virtual {p4, v0, v1}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 10
    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 19
    .line 20
    if-eq p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iget-wide v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 28
    .line 29
    invoke-virtual {p4, v0, v1}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return p2
.end method

.method public static N(I[BIILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/WireFormat;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/WireFormat;->b(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_7

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_6

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_5

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x5

    .line 23
    if-ne v0, p0, :cond_0

    .line 24
    .line 25
    add-int/lit8 p2, p2, 0x4

    .line 26
    .line 27
    return p2

    .line 28
    :cond_0
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidTag()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    throw p0

    .line 33
    :cond_1
    and-int/lit8 p0, p0, -0x8

    .line 34
    .line 35
    or-int/lit8 p0, p0, 0x4

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    :goto_0
    if-ge p2, p3, :cond_3

    .line 39
    .line 40
    invoke-static {p1, p2, p4}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iget v0, p4, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 45
    .line 46
    if-ne v0, p0, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    invoke-static {v0, p1, p2, p3, p4}, Landroidx/datastore/preferences/protobuf/d;->N(I[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    :goto_1
    if-gt p2, p3, :cond_4

    .line 55
    .line 56
    if-ne v0, p0, :cond_4

    .line 57
    .line 58
    return p2

    .line 59
    :cond_4
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->parseFailure()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    throw p0

    .line 64
    :cond_5
    invoke-static {p1, p2, p4}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    iget p1, p4, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 69
    .line 70
    add-int/2addr p0, p1

    .line 71
    return p0

    .line 72
    :cond_6
    add-int/lit8 p2, p2, 0x8

    .line 73
    .line 74
    return p2

    .line 75
    :cond_7
    invoke-static {p1, p2, p4}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0

    .line 80
    :cond_8
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidTag()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    throw p0
.end method

.method public static a(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/f;

    .line 2
    .line 3
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget-wide v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v4, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    move v0, v4

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    :goto_0
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/f;->h(Z)V

    .line 21
    .line 22
    .line 23
    :goto_1
    if-ge p2, p3, :cond_3

    .line 24
    .line 25
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v5, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 30
    .line 31
    if-eq p0, v5, :cond_1

    .line 32
    .line 33
    goto :goto_3

    .line 34
    :cond_1
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iget-wide v5, p5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 39
    .line 40
    cmp-long v0, v5, v2

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    move v0, v4

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    move v0, v1

    .line 47
    :goto_2
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/f;->h(Z)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    :goto_3
    return p2
.end method

.method public static b([BILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p2, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 6
    .line 7
    if-ltz v0, :cond_2

    .line 8
    .line 9
    array-length v1, p0

    .line 10
    sub-int/2addr v1, p1

    .line 11
    if-gt v0, v1, :cond_1

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Landroidx/datastore/preferences/protobuf/ByteString;->EMPTY:Landroidx/datastore/preferences/protobuf/ByteString;

    .line 16
    .line 17
    iput-object p0, p2, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 18
    .line 19
    return p1

    .line 20
    :cond_0
    invoke-static {p0, p1, v0}, Landroidx/datastore/preferences/protobuf/ByteString;->copyFrom([BII)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iput-object p0, p2, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 25
    .line 26
    add-int/2addr p1, v0

    .line 27
    return p1

    .line 28
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    throw p0

    .line 33
    :cond_2
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    throw p0
.end method

.method public static c(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 6
    .line 7
    if-ltz v0, :cond_7

    .line 8
    .line 9
    array-length v1, p1

    .line 10
    sub-int/2addr v1, p2

    .line 11
    if-gt v0, v1, :cond_6

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Landroidx/datastore/preferences/protobuf/ByteString;->EMPTY:Landroidx/datastore/preferences/protobuf/ByteString;

    .line 16
    .line 17
    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-static {p1, p2, v0}, Landroidx/datastore/preferences/protobuf/ByteString;->copyFrom([BII)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :goto_0
    add-int/2addr p2, v0

    .line 29
    :goto_1
    if-ge p2, p3, :cond_5

    .line 30
    .line 31
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 36
    .line 37
    if-eq p0, v1, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    invoke-static {p1, v0, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iget v0, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 45
    .line 46
    if-ltz v0, :cond_4

    .line 47
    .line 48
    array-length v1, p1

    .line 49
    sub-int/2addr v1, p2

    .line 50
    if-gt v0, v1, :cond_3

    .line 51
    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    sget-object v0, Landroidx/datastore/preferences/protobuf/ByteString;->EMPTY:Landroidx/datastore/preferences/protobuf/ByteString;

    .line 55
    .line 56
    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    invoke-static {p1, p2, v0}, Landroidx/datastore/preferences/protobuf/ByteString;->copyFrom([BII)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    throw p0

    .line 73
    :cond_4
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    throw p0

    .line 78
    :cond_5
    :goto_2
    return p2

    .line 79
    :cond_6
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    throw p0

    .line 84
    :cond_7
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->negativeSize()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    throw p0
.end method

.method public static d([BI)D
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public static e(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/j;

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p4, v0, v1}, Landroidx/datastore/preferences/protobuf/j;->g(D)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 p2, p2, 0x8

    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 19
    .line 20
    if-eq p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {p1, v0}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-virtual {p4, v1, v2}, Landroidx/datastore/preferences/protobuf/j;->g(D)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 p2, v0, 0x8

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return p2
.end method

.method public static f(I[BIILandroidx/datastore/preferences/protobuf/GeneratedMessageLite$c;Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$c<",
            "**>;",
            "Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e<",
            "**>;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "Landroidx/datastore/preferences/protobuf/m0;",
            "Landroidx/datastore/preferences/protobuf/m0;",
            ">;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p4, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$c;->extensions:Landroidx/datastore/preferences/protobuf/p;

    .line 2
    .line 3
    ushr-int/lit8 p0, p0, 0x3

    .line 4
    .line 5
    iget-object v1, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;->isRepeated()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    iget-object v1, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;->isPacked()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    sget-object p3, Landroidx/datastore/preferences/protobuf/d$a;->a:[I

    .line 24
    .line 25
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->a()Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    aget p3, p3, v1

    .line 34
    .line 35
    packed-switch p3, :pswitch_data_0

    .line 36
    .line 37
    .line 38
    iget-object p0, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;->D()Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "Type cannot be packed: "

    .line 45
    .line 46
    invoke-static {p1, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return v2

    .line 50
    :pswitch_0
    new-instance p3, Landroidx/datastore/preferences/protobuf/r;

    .line 51
    .line 52
    invoke-direct {p3}, Landroidx/datastore/preferences/protobuf/r;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, p2, p3, p7}, Landroidx/datastore/preferences/protobuf/d;->y([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object p2, p4, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 60
    .line 61
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->e()Landroidx/datastore/preferences/protobuf/m0;

    .line 62
    .line 63
    .line 64
    move-result-object p7

    .line 65
    if-ne p2, p7, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    move-object v3, p2

    .line 69
    :goto_0
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 70
    .line 71
    invoke-virtual {p2}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;->b()Landroidx/datastore/preferences/protobuf/s$d;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-static {p0, p3, p2, v3, p6}, Landroidx/datastore/preferences/protobuf/j0;->z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/s$d;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Landroidx/datastore/preferences/protobuf/m0;

    .line 80
    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    iput-object p0, p4, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 84
    .line 85
    :cond_1
    iget-object p0, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 86
    .line 87
    invoke-virtual {v0, p0, p3}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return p1

    .line 91
    :pswitch_1
    new-instance p0, Landroidx/datastore/preferences/protobuf/x;

    .line 92
    .line 93
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/x;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->x([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 101
    .line 102
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return p1

    .line 106
    :pswitch_2
    new-instance p0, Landroidx/datastore/preferences/protobuf/r;

    .line 107
    .line 108
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/r;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->w([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 116
    .line 117
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    return p1

    .line 121
    :pswitch_3
    new-instance p0, Landroidx/datastore/preferences/protobuf/f;

    .line 122
    .line 123
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/f;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->r([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 131
    .line 132
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return p1

    .line 136
    :pswitch_4
    new-instance p0, Landroidx/datastore/preferences/protobuf/r;

    .line 137
    .line 138
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/r;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->t([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 146
    .line 147
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    return p1

    .line 151
    :pswitch_5
    new-instance p0, Landroidx/datastore/preferences/protobuf/x;

    .line 152
    .line 153
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/x;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->u([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 161
    .line 162
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    return p1

    .line 166
    :pswitch_6
    new-instance p0, Landroidx/datastore/preferences/protobuf/r;

    .line 167
    .line 168
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/r;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->y([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 176
    .line 177
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    return p1

    .line 181
    :pswitch_7
    new-instance p0, Landroidx/datastore/preferences/protobuf/x;

    .line 182
    .line 183
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/x;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->z([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 191
    .line 192
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    return p1

    .line 196
    :pswitch_8
    new-instance p0, Landroidx/datastore/preferences/protobuf/q;

    .line 197
    .line 198
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/q;-><init>()V

    .line 199
    .line 200
    .line 201
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->v([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 206
    .line 207
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 208
    .line 209
    .line 210
    return p1

    .line 211
    :pswitch_9
    new-instance p0, Landroidx/datastore/preferences/protobuf/j;

    .line 212
    .line 213
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/j;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-static {p1, p2, p0, p7}, Landroidx/datastore/preferences/protobuf/d;->s([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    iget-object p2, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 221
    .line 222
    invoke-virtual {v0, p2, p0}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    return p1

    .line 226
    :cond_2
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->a()Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    sget-object v4, Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;->ENUM:Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 231
    .line 232
    if-ne v1, v4, :cond_5

    .line 233
    .line 234
    invoke-static {p1, p2, p7}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 235
    .line 236
    .line 237
    move-result p2

    .line 238
    iget-object p1, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 239
    .line 240
    invoke-virtual {p1}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;->b()Landroidx/datastore/preferences/protobuf/s$d;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iget p3, p7, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 245
    .line 246
    invoke-interface {p1, p3}, Landroidx/datastore/preferences/protobuf/s$d;->findValueByNumber(I)Landroidx/datastore/preferences/protobuf/s$c;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    if-nez p1, :cond_4

    .line 251
    .line 252
    iget-object p1, p4, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 253
    .line 254
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->e()Landroidx/datastore/preferences/protobuf/m0;

    .line 255
    .line 256
    .line 257
    move-result-object p3

    .line 258
    if-ne p1, p3, :cond_3

    .line 259
    .line 260
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->l()Landroidx/datastore/preferences/protobuf/m0;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iput-object p1, p4, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 265
    .line 266
    :cond_3
    iget p3, p7, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 267
    .line 268
    invoke-static {p0, p3, p1, p6}, Landroidx/datastore/preferences/protobuf/j0;->L(IILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    return p2

    .line 272
    :cond_4
    iget p0, p7, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 273
    .line 274
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    goto/16 :goto_4

    .line 279
    .line 280
    :cond_5
    sget-object p4, Landroidx/datastore/preferences/protobuf/d$a;->a:[I

    .line 281
    .line 282
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->a()Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 283
    .line 284
    .line 285
    move-result-object p6

    .line 286
    invoke-virtual {p6}, Ljava/lang/Enum;->ordinal()I

    .line 287
    .line 288
    .line 289
    move-result p6

    .line 290
    aget p4, p4, p6

    .line 291
    .line 292
    packed-switch p4, :pswitch_data_1

    .line 293
    .line 294
    .line 295
    goto/16 :goto_4

    .line 296
    .line 297
    :pswitch_a
    invoke-static {}, Ll/g7b0;->a()Ll/g7b0;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b()Landroidx/datastore/preferences/protobuf/b0;

    .line 302
    .line 303
    .line 304
    move-result-object p4

    .line 305
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    .line 307
    .line 308
    move-result-object p4

    .line 309
    invoke-virtual {p0, p4}, Ll/g7b0;->d(Ljava/lang/Class;)Landroidx/datastore/preferences/protobuf/i0;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-static {p0, p1, p2, p3, p7}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 314
    .line 315
    .line 316
    move-result p2

    .line 317
    iget-object v3, p7, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 318
    .line 319
    goto/16 :goto_4

    .line 320
    .line 321
    :pswitch_b
    shl-int/lit8 p0, p0, 0x3

    .line 322
    .line 323
    or-int/lit8 v5, p0, 0x4

    .line 324
    .line 325
    invoke-static {}, Ll/g7b0;->a()Ll/g7b0;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b()Landroidx/datastore/preferences/protobuf/b0;

    .line 330
    .line 331
    .line 332
    move-result-object p4

    .line 333
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 334
    .line 335
    .line 336
    move-result-object p4

    .line 337
    invoke-virtual {p0, p4}, Ll/g7b0;->d(Ljava/lang/Class;)Landroidx/datastore/preferences/protobuf/i0;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    move-object v2, p1

    .line 342
    move v3, p2

    .line 343
    move v4, p3

    .line 344
    move-object v6, p7

    .line 345
    invoke-static/range {v1 .. v6}, Landroidx/datastore/preferences/protobuf/d;->n(Landroidx/datastore/preferences/protobuf/i0;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 346
    .line 347
    .line 348
    move-result p2

    .line 349
    iget-object v3, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 350
    .line 351
    goto/16 :goto_4

    .line 352
    .line 353
    :pswitch_c
    move-object p0, p1

    .line 354
    move v3, p2

    .line 355
    move-object v6, p7

    .line 356
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->C([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 357
    .line 358
    .line 359
    move-result p2

    .line 360
    iget-object v3, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 361
    .line 362
    goto/16 :goto_4

    .line 363
    .line 364
    :pswitch_d
    move-object p0, p1

    .line 365
    move v3, p2

    .line 366
    move-object v6, p7

    .line 367
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->b([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 368
    .line 369
    .line 370
    move-result p2

    .line 371
    iget-object v3, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 372
    .line 373
    goto/16 :goto_4

    .line 374
    .line 375
    :pswitch_e
    const-string p0, "Shouldn\'t reach here."

    .line 376
    .line 377
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    return v2

    .line 381
    :pswitch_f
    move-object p0, p1

    .line 382
    move v3, p2

    .line 383
    move-object v6, p7

    .line 384
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 385
    .line 386
    .line 387
    move-result p2

    .line 388
    iget-wide p0, v6, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 389
    .line 390
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 391
    .line 392
    .line 393
    move-result-wide p0

    .line 394
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    goto/16 :goto_4

    .line 399
    .line 400
    :pswitch_10
    move-object p0, p1

    .line 401
    move v3, p2

    .line 402
    move-object v6, p7

    .line 403
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 404
    .line 405
    .line 406
    move-result p2

    .line 407
    iget p0, v6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 408
    .line 409
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 410
    .line 411
    .line 412
    move-result p0

    .line 413
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    goto/16 :goto_4

    .line 418
    .line 419
    :pswitch_11
    move-object p0, p1

    .line 420
    move v3, p2

    .line 421
    move-object v6, p7

    .line 422
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 423
    .line 424
    .line 425
    move-result p2

    .line 426
    iget-wide p0, v6, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 427
    .line 428
    const-wide/16 p3, 0x0

    .line 429
    .line 430
    cmp-long p0, p0, p3

    .line 431
    .line 432
    if-eqz p0, :cond_6

    .line 433
    .line 434
    const/4 v2, 0x1

    .line 435
    :cond_6
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 436
    .line 437
    .line 438
    move-result-object v3

    .line 439
    goto :goto_4

    .line 440
    :pswitch_12
    move-object p0, p1

    .line 441
    move v3, p2

    .line 442
    invoke-static {p0, v3}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 443
    .line 444
    .line 445
    move-result p0

    .line 446
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    :goto_1
    add-int/lit8 p2, v3, 0x4

    .line 451
    .line 452
    :goto_2
    move-object v3, p0

    .line 453
    goto :goto_4

    .line 454
    :pswitch_13
    move-object p0, p1

    .line 455
    move v3, p2

    .line 456
    invoke-static {p0, v3}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 457
    .line 458
    .line 459
    move-result-wide p0

    .line 460
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 461
    .line 462
    .line 463
    move-result-object p0

    .line 464
    :goto_3
    add-int/lit8 p2, v3, 0x8

    .line 465
    .line 466
    goto :goto_2

    .line 467
    :pswitch_14
    move-object p0, p1

    .line 468
    move v3, p2

    .line 469
    move-object v6, p7

    .line 470
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 471
    .line 472
    .line 473
    move-result p2

    .line 474
    iget p0, v6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 475
    .line 476
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 477
    .line 478
    .line 479
    move-result-object v3

    .line 480
    goto :goto_4

    .line 481
    :pswitch_15
    move-object p0, p1

    .line 482
    move v3, p2

    .line 483
    move-object v6, p7

    .line 484
    invoke-static {p0, v3, v6}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 485
    .line 486
    .line 487
    move-result p2

    .line 488
    iget-wide p0, v6, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 489
    .line 490
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    goto :goto_4

    .line 495
    :pswitch_16
    move-object p0, p1

    .line 496
    move v3, p2

    .line 497
    invoke-static {p0, v3}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 498
    .line 499
    .line 500
    move-result p0

    .line 501
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    goto :goto_1

    .line 506
    :pswitch_17
    move-object p0, p1

    .line 507
    move v3, p2

    .line 508
    invoke-static {p0, v3}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 509
    .line 510
    .line 511
    move-result-wide p0

    .line 512
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 513
    .line 514
    .line 515
    move-result-object p0

    .line 516
    goto :goto_3

    .line 517
    :goto_4
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->d()Z

    .line 518
    .line 519
    .line 520
    move-result p0

    .line 521
    if-eqz p0, :cond_7

    .line 522
    .line 523
    iget-object p0, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 524
    .line 525
    invoke-virtual {v0, p0, v3}, Landroidx/datastore/preferences/protobuf/p;->a(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 526
    .line 527
    .line 528
    return p2

    .line 529
    :cond_7
    sget-object p0, Landroidx/datastore/preferences/protobuf/d$a;->a:[I

    .line 530
    .line 531
    invoke-virtual {p5}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->a()Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 532
    .line 533
    .line 534
    move-result-object p1

    .line 535
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 536
    .line 537
    .line 538
    move-result p1

    .line 539
    aget p0, p0, p1

    .line 540
    .line 541
    const/16 p1, 0x11

    .line 542
    .line 543
    if-eq p0, p1, :cond_8

    .line 544
    .line 545
    const/16 p1, 0x12

    .line 546
    .line 547
    if-eq p0, p1, :cond_8

    .line 548
    .line 549
    goto :goto_5

    .line 550
    :cond_8
    iget-object p0, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 551
    .line 552
    invoke-virtual {v0, p0}, Landroidx/datastore/preferences/protobuf/p;->i(Landroidx/datastore/preferences/protobuf/p$b;)Ljava/lang/Object;

    .line 553
    .line 554
    .line 555
    move-result-object p0

    .line 556
    if-eqz p0, :cond_9

    .line 557
    .line 558
    invoke-static {p0, v3}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v3

    .line 562
    :cond_9
    :goto_5
    iget-object p0, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;->b:Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$d;

    .line 563
    .line 564
    invoke-virtual {v0, p0, v3}, Landroidx/datastore/preferences/protobuf/p;->x(Landroidx/datastore/preferences/protobuf/p$b;Ljava/lang/Object;)V

    .line 565
    .line 566
    .line 567
    return p2

    .line 568
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_15
        :pswitch_14
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch
.end method

.method public static g(I[BIILjava/lang/Object;Landroidx/datastore/preferences/protobuf/b0;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Ljava/lang/Object;",
            "Landroidx/datastore/preferences/protobuf/b0;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "Landroidx/datastore/preferences/protobuf/m0;",
            "Landroidx/datastore/preferences/protobuf/m0;",
            ">;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    ushr-int/lit8 v0, p0, 0x3

    .line 2
    .line 3
    iget-object v1, p7, Landroidx/datastore/preferences/protobuf/d$b;->d:Landroidx/datastore/preferences/protobuf/l;

    .line 4
    .line 5
    invoke-virtual {v1, p5, v0}, Landroidx/datastore/preferences/protobuf/l;->a(Landroidx/datastore/preferences/protobuf/b0;I)Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;

    .line 6
    .line 7
    .line 8
    move-result-object p5

    .line 9
    if-nez p5, :cond_0

    .line 10
    .line 11
    invoke-static {p4}, Landroidx/datastore/preferences/protobuf/d0;->w(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/m0;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    move v0, p0

    .line 16
    move-object v1, p1

    .line 17
    move v2, p2

    .line 18
    move v3, p3

    .line 19
    move-object v5, p7

    .line 20
    invoke-static/range {v0 .. v5}, Landroidx/datastore/preferences/protobuf/d;->G(I[BIILandroidx/datastore/preferences/protobuf/m0;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    check-cast p4, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$c;

    .line 26
    .line 27
    invoke-virtual {p4}, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$c;->C()Landroidx/datastore/preferences/protobuf/p;

    .line 28
    .line 29
    .line 30
    invoke-static/range {p0 .. p7}, Landroidx/datastore/preferences/protobuf/d;->f(I[BIILandroidx/datastore/preferences/protobuf/GeneratedMessageLite$c;Landroidx/datastore/preferences/protobuf/GeneratedMessageLite$e;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public static h([BI)I
    .locals 2

    .line 1
    aget-byte v0, p0, p1

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    add-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    aget-byte v1, p0, v1

    .line 8
    .line 9
    and-int/lit16 v1, v1, 0xff

    .line 10
    .line 11
    shl-int/lit8 v1, v1, 0x8

    .line 12
    .line 13
    or-int/2addr v0, v1

    .line 14
    add-int/lit8 v1, p1, 0x2

    .line 15
    .line 16
    aget-byte v1, p0, v1

    .line 17
    .line 18
    and-int/lit16 v1, v1, 0xff

    .line 19
    .line 20
    shl-int/lit8 v1, v1, 0x10

    .line 21
    .line 22
    or-int/2addr v0, v1

    .line 23
    add-int/lit8 p1, p1, 0x3

    .line 24
    .line 25
    aget-byte p0, p0, p1

    .line 26
    .line 27
    and-int/lit16 p0, p0, 0xff

    .line 28
    .line 29
    shl-int/lit8 p0, p0, 0x18

    .line 30
    .line 31
    or-int/2addr p0, v0

    .line 32
    return p0
.end method

.method public static i(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/r;

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 p2, p2, 0x4

    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 19
    .line 20
    if-eq p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {p1, v0}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    invoke-virtual {p4, p2}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 p2, v0, 0x4

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return p2
.end method

.method public static j([BI)J
    .locals 7

    .line 1
    aget-byte v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide/16 v2, 0xff

    .line 5
    .line 6
    and-long/2addr v0, v2

    .line 7
    add-int/lit8 v4, p1, 0x1

    .line 8
    .line 9
    aget-byte v4, p0, v4

    .line 10
    .line 11
    int-to-long v4, v4

    .line 12
    and-long/2addr v4, v2

    .line 13
    const/16 v6, 0x8

    .line 14
    .line 15
    shl-long/2addr v4, v6

    .line 16
    or-long/2addr v0, v4

    .line 17
    add-int/lit8 v4, p1, 0x2

    .line 18
    .line 19
    aget-byte v4, p0, v4

    .line 20
    .line 21
    int-to-long v4, v4

    .line 22
    and-long/2addr v4, v2

    .line 23
    const/16 v6, 0x10

    .line 24
    .line 25
    shl-long/2addr v4, v6

    .line 26
    or-long/2addr v0, v4

    .line 27
    add-int/lit8 v4, p1, 0x3

    .line 28
    .line 29
    aget-byte v4, p0, v4

    .line 30
    .line 31
    int-to-long v4, v4

    .line 32
    and-long/2addr v4, v2

    .line 33
    const/16 v6, 0x18

    .line 34
    .line 35
    shl-long/2addr v4, v6

    .line 36
    or-long/2addr v0, v4

    .line 37
    add-int/lit8 v4, p1, 0x4

    .line 38
    .line 39
    aget-byte v4, p0, v4

    .line 40
    .line 41
    int-to-long v4, v4

    .line 42
    and-long/2addr v4, v2

    .line 43
    const/16 v6, 0x20

    .line 44
    .line 45
    shl-long/2addr v4, v6

    .line 46
    or-long/2addr v0, v4

    .line 47
    add-int/lit8 v4, p1, 0x5

    .line 48
    .line 49
    aget-byte v4, p0, v4

    .line 50
    .line 51
    int-to-long v4, v4

    .line 52
    and-long/2addr v4, v2

    .line 53
    const/16 v6, 0x28

    .line 54
    .line 55
    shl-long/2addr v4, v6

    .line 56
    or-long/2addr v0, v4

    .line 57
    add-int/lit8 v4, p1, 0x6

    .line 58
    .line 59
    aget-byte v4, p0, v4

    .line 60
    .line 61
    int-to-long v4, v4

    .line 62
    and-long/2addr v4, v2

    .line 63
    const/16 v6, 0x30

    .line 64
    .line 65
    shl-long/2addr v4, v6

    .line 66
    or-long/2addr v0, v4

    .line 67
    add-int/lit8 p1, p1, 0x7

    .line 68
    .line 69
    aget-byte p0, p0, p1

    .line 70
    .line 71
    int-to-long p0, p0

    .line 72
    and-long/2addr p0, v2

    .line 73
    const/16 v2, 0x38

    .line 74
    .line 75
    shl-long/2addr p0, v2

    .line 76
    or-long/2addr p0, v0

    .line 77
    return-wide p0
.end method

.method public static k(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/x;

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p4, v0, v1}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 p2, p2, 0x8

    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 19
    .line 20
    if-eq p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {p1, v0}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-virtual {p4, v1, v2}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 p2, v0, 0x8

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return p2
.end method

.method public static l([BI)F
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static m(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .line 1
    check-cast p4, Landroidx/datastore/preferences/protobuf/q;

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p4, v0}, Landroidx/datastore/preferences/protobuf/q;->M(F)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 p2, p2, 0x4

    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, p5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 19
    .line 20
    if-eq p0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-static {p1, v0}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    invoke-virtual {p4, p2}, Landroidx/datastore/preferences/protobuf/q;->M(F)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 p2, v0, 0x4

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return p2
.end method

.method public static n(Landroidx/datastore/preferences/protobuf/i0;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object v0, p0

    .line 2
    check-cast v0, Landroidx/datastore/preferences/protobuf/d0;

    .line 3
    .line 4
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/d0;->h()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    move-object v2, p1

    .line 9
    move v3, p2

    .line 10
    move v4, p3

    .line 11
    move v5, p4

    .line 12
    move-object v6, p5

    .line 13
    invoke-virtual/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->d0(Ljava/lang/Object;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v0, v1}, Landroidx/datastore/preferences/protobuf/d0;->f(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 21
    .line 22
    return p0
.end method

.method public static o(Landroidx/datastore/preferences/protobuf/i0;I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/datastore/preferences/protobuf/i0;",
            "I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    and-int/lit8 v0, p1, -0x8

    .line 2
    .line 3
    or-int/lit8 v5, v0, 0x4

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p2

    .line 7
    move v3, p3

    .line 8
    move v4, p4

    .line 9
    move-object v6, p6

    .line 10
    invoke-static/range {v1 .. v6}, Landroidx/datastore/preferences/protobuf/d;->n(Landroidx/datastore/preferences/protobuf/i0;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    iget-object p2, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-interface {p5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :goto_0
    if-ge p0, v4, :cond_1

    .line 20
    .line 21
    invoke-static {v2, p0, v6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    iget p2, v6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 26
    .line 27
    if-eq p1, p2, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-static/range {v1 .. v6}, Landroidx/datastore/preferences/protobuf/d;->n(Landroidx/datastore/preferences/protobuf/i0;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    iget-object p2, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-interface {p5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    :goto_1
    return p0
.end method

.method public static p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    aget-byte p2, p1, p2

    .line 4
    .line 5
    if-gez p2, :cond_0

    .line 6
    .line 7
    invoke-static {p2, p1, v0, p4}, Landroidx/datastore/preferences/protobuf/d;->H(I[BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget p2, p4, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 12
    .line 13
    :cond_0
    move v3, v0

    .line 14
    if-ltz p2, :cond_1

    .line 15
    .line 16
    sub-int/2addr p3, v3

    .line 17
    if-gt p2, p3, :cond_1

    .line 18
    .line 19
    invoke-interface {p0}, Landroidx/datastore/preferences/protobuf/i0;->h()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    add-int v4, v3, p2

    .line 24
    .line 25
    move-object v0, p0

    .line 26
    move-object v2, p1

    .line 27
    move-object v5, p4

    .line 28
    invoke-interface/range {v0 .. v5}, Landroidx/datastore/preferences/protobuf/i0;->j(Ljava/lang/Object;[BIILandroidx/datastore/preferences/protobuf/d$b;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Landroidx/datastore/preferences/protobuf/i0;->f(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, v5, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 35
    .line 36
    return v4

    .line 37
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    throw p0
.end method

.method public static q(Landroidx/datastore/preferences/protobuf/i0;I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/datastore/preferences/protobuf/i0<",
            "*>;I[BII",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p2, p3, p4, p6}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-object v0, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :goto_0
    if-ge p3, p4, :cond_1

    .line 11
    .line 12
    invoke-static {p2, p3, p6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v1, p6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 17
    .line 18
    if-eq p1, v1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-static {p0, p2, v0, p4, p6}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    iget-object v0, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    return p3
.end method

.method public static r([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/f;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget v0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    :goto_0
    if-ge p1, v0, :cond_1

    .line 11
    .line 12
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-wide v1, p3, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 17
    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    cmp-long v1, v1, v3

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    :goto_1
    invoke-virtual {p2, v1}, Landroidx/datastore/preferences/protobuf/f;->h(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    if-ne p1, v0, :cond_2

    .line 32
    .line 33
    return p1

    .line 34
    :cond_2
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    throw p0
.end method

.method public static s([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/j;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p3, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr p3, p1

    .line 10
    :goto_0
    if-ge p1, p3, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-virtual {p2, v0, v1}, Landroidx/datastore/preferences/protobuf/j;->g(D)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x8

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-ne p1, p3, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public static t([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/r;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p3, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr p3, p1

    .line 10
    :goto_0
    if-ge p1, p3, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p2, v0}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x4

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-ne p1, p3, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public static u([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/x;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p3, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr p3, p1

    .line 10
    :goto_0
    if-ge p1, p3, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-virtual {p2, v0, v1}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x8

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-ne p1, p3, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public static v([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/q;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p3, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr p3, p1

    .line 10
    :goto_0
    if-ge p1, p3, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p2, v0}, Landroidx/datastore/preferences/protobuf/q;->M(F)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x4

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-ne p1, p3, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public static w([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/r;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget v0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    :goto_0
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget v1, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 17
    .line 18
    invoke-static {v1}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p2, v1}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-ne p1, v0, :cond_1

    .line 27
    .line 28
    return p1

    .line 29
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    throw p0
.end method

.method public static x([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/x;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget v0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    :goto_0
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-wide v1, p3, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 17
    .line 18
    invoke-static {v1, v2}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-virtual {p2, v1, v2}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-ne p1, v0, :cond_1

    .line 27
    .line 28
    return p1

    .line 29
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    throw p0
.end method

.method public static y([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/r;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget v0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    :goto_0
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget v1, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 17
    .line 18
    invoke-virtual {p2, v1}, Landroidx/datastore/preferences/protobuf/r;->U(I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public static z([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroidx/datastore/preferences/protobuf/s$i<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p2, Landroidx/datastore/preferences/protobuf/x;

    .line 2
    .line 3
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget v0, p3, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    add-int/2addr v0, p1

    .line 10
    :goto_0
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-wide v1, p3, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 17
    .line 18
    invoke-virtual {p2, v1, v2}, Landroidx/datastore/preferences/protobuf/x;->u(J)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method
