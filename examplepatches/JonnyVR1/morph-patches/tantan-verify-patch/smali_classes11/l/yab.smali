.class public Ll/yab;
.super Ll/pzi0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pzi0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static C(JJ)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    new-instance v0, Ljava/util/Date;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p3, p0}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-ne p1, p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p3, p0}, Ljava/util/Calendar;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-ne p1, p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p3, p0}, Ljava/util/Calendar;->get(I)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-ne p1, p2, :cond_0

    .line 57
    .line 58
    return p0

    .line 59
    :cond_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public static O(J)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x3e8

    .line 7
    .line 8
    div-long/2addr p0, v1

    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    cmp-long v1, p0, v1

    .line 12
    .line 13
    if-gtz v1, :cond_0

    .line 14
    .line 15
    const-string p0, "0"

    .line 16
    .line 17
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_0
    const-wide/16 v1, 0xe10

    .line 37
    .line 38
    div-long v1, p0, v1

    .line 39
    .line 40
    const-wide/16 v3, 0x3c

    .line 41
    .line 42
    div-long v5, p0, v3

    .line 43
    .line 44
    rem-long/2addr v5, v3

    .line 45
    rem-long/2addr p0, v3

    .line 46
    invoke-static {v1, v2}, Ll/yab;->Y(J)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    invoke-static {v5, v6}, Ll/yab;->Y(J)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    invoke-static {p0, p1}, Ll/yab;->Y(J)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public static P()J
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/32 v2, 0x5265c00

    .line 6
    .line 7
    .line 8
    add-long/2addr v0, v2

    .line 9
    invoke-static {v0, v1}, Ll/tzi0;->c(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public static Q(J)I
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p0

    .line 6
    const-wide/32 p0, 0x36ee80

    .line 7
    .line 8
    .line 9
    div-long/2addr v0, p0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public static R(JJ)I
    .locals 0

    .line 1
    sub-long/2addr p2, p0

    .line 2
    const-wide/32 p0, 0x36ee80

    .line 3
    .line 4
    .line 5
    div-long/2addr p2, p0

    .line 6
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static S(JJ)I
    .locals 1

    .line 1
    cmp-long v0, p0, p2

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    sub-long/2addr p2, p0

    .line 8
    const-wide/32 p0, 0x5265c00

    .line 9
    .line 10
    .line 11
    div-long/2addr p2, p0

    .line 12
    long-to-int p0, p2

    .line 13
    return p0
.end method

.method public static T(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .locals 7

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    move-object v6, p1

    .line 19
    move-object p1, p0

    .line 20
    move-object p0, v6

    .line 21
    :cond_1
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    add-int/2addr v3, v0

    .line 32
    const/4 v4, 0x5

    .line 33
    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    add-int/2addr v2, v0

    .line 46
    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    sub-int v4, v5, v1

    .line 51
    .line 52
    if-eq v1, v5, :cond_3

    .line 53
    .line 54
    if-eq v3, v2, :cond_2

    .line 55
    .line 56
    if-le v3, v2, :cond_3

    .line 57
    .line 58
    sub-int/2addr v4, v0

    .line 59
    return v4

    .line 60
    :cond_2
    if-eq p0, p1, :cond_3

    .line 61
    .line 62
    if-le p0, p1, :cond_3

    .line 63
    .line 64
    sub-int/2addr v4, v0

    .line 65
    :cond_3
    return v4

    .line 66
    :cond_4
    :goto_0
    const/4 p0, 0x0

    .line 67
    return p0
.end method

.method public static U()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/pzi0;->o()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static V()Z
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    return v0

    .line 11
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 22
    .line 23
    double-to-long v3, v3

    .line 24
    const/4 v0, 0x7

    .line 25
    invoke-static {v1, v2, v3, v4, v0}, Ll/tzi0;->h(JJI)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    xor-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    return v0
.end method

.method public static W(ILjava/util/concurrent/TimeUnit;)Z
    .locals 7

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v2, Ll/yab$a;->a:[I

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    aget p1, v2, p1

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-eq p1, v2, :cond_4

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    if-eq p1, v3, :cond_3

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    if-eq p1, v3, :cond_2

    .line 33
    .line 34
    const/4 v3, 0x4

    .line 35
    if-eq p1, v3, :cond_1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 43
    .line 44
    double-to-long v5, v5

    .line 45
    sub-long/2addr v3, v5

    .line 46
    int-to-long p0, p0

    .line 47
    cmp-long p0, v3, p0

    .line 48
    .line 49
    if-lez p0, :cond_5

    .line 50
    .line 51
    :goto_0
    move v1, v2

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 58
    .line 59
    double-to-long v5, v5

    .line 60
    sub-long/2addr v3, v5

    .line 61
    const-wide/32 v5, 0xea60

    .line 62
    .line 63
    .line 64
    div-long/2addr v3, v5

    .line 65
    int-to-long p0, p0

    .line 66
    cmp-long p0, v3, p0

    .line 67
    .line 68
    if-lez p0, :cond_5

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 76
    .line 77
    double-to-long v5, v5

    .line 78
    sub-long/2addr v3, v5

    .line 79
    const-wide/32 v5, 0x36ee80

    .line 80
    .line 81
    .line 82
    div-long/2addr v3, v5

    .line 83
    int-to-long p0, p0

    .line 84
    cmp-long p0, v3, p0

    .line 85
    .line 86
    if-lez p0, :cond_5

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    invoke-static {}, Ll/pzi0;->o()J

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 94
    .line 95
    double-to-long v0, v0

    .line 96
    invoke-static {v3, v4, v0, v1, p0}, Ll/tzi0;->h(JJI)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    :cond_5
    :goto_1
    xor-int/lit8 p0, v1, 0x1

    .line 101
    .line 102
    return p0
.end method

.method public static X(J)Z
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    new-instance v0, Ljava/util/Date;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ljava/util/Date;

    .line 26
    .line 27
    invoke-static {}, Ll/pzi0;->o()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-ne v2, v3, :cond_1

    .line 47
    .line 48
    const/4 v2, 0x3

    .line 49
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ne v3, v2, :cond_1

    .line 58
    .line 59
    const/4 v2, 0x7

    .line 60
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-ne p0, p1, :cond_1

    .line 69
    .line 70
    return v0

    .line 71
    :cond_1
    return v1
.end method

.method public static Y(J)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    cmp-long v1, p0, v1

    .line 9
    .line 10
    const-wide/16 v2, 0xa

    .line 11
    .line 12
    if-ltz v1, :cond_0

    .line 13
    .line 14
    cmp-long v1, p0, v2

    .line 15
    .line 16
    if-gez v1, :cond_0

    .line 17
    .line 18
    const-string v1, "0"

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_0
    div-long v4, p0, v2

    .line 32
    .line 33
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    rem-long/2addr p0, v2

    .line 41
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    return-object v0
.end method
