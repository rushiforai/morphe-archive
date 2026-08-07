.class public Ll/p6i;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    const-string v0, "0"

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    return-object p0
.end method

.method public static b(JJ)J
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/Date;

    .line 7
    .line 8
    invoke-direct {p0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ljava/util/GregorianCalendar;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/GregorianCalendar;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance p2, Ljava/util/GregorianCalendar;

    .line 17
    .line 18
    invoke-direct {p2}, Ljava/util/GregorianCalendar;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide p0

    .line 31
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide p2

    .line 35
    sub-long/2addr p0, p2

    .line 36
    const-wide/32 p2, 0x5265c00

    .line 37
    .line 38
    .line 39
    div-long/2addr p0, p2

    .line 40
    return-wide p0
.end method

.method public static c(J)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x5

    .line 14
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x1

    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    const-string p1, "0"

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_0
    return-object p0
.end method

.method public static d(J)I
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public static e(J)I
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public static f(JJ)Z
    .locals 0

    .line 1
    sub-long/2addr p2, p0

    .line 2
    const-wide/16 p0, 0x3e8

    .line 3
    .line 4
    div-long/2addr p2, p0

    .line 5
    const-wide/16 p0, 0x7080

    .line 6
    .line 7
    cmp-long p0, p2, p0

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static g(J)Z
    .locals 7

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ljava/util/Date;

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-direct {p1, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, 0x6

    .line 39
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/4 v4, 0x0

    .line 48
    if-ne v2, v1, :cond_0

    .line 49
    .line 50
    sub-int/2addr p0, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_0
    move v5, v4

    .line 53
    :goto_0
    if-ge v1, v2, :cond_2

    .line 54
    .line 55
    invoke-static {v1}, Ll/p6i;->k(I)Z

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-eqz v6, :cond_1

    .line 60
    .line 61
    add-int/lit16 v5, v5, 0x16e

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    add-int/lit16 v5, v5, 0x16d

    .line 65
    .line 66
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    add-int/2addr v5, p0

    .line 70
    sub-int p0, v5, v0

    .line 71
    .line 72
    :goto_2
    if-gt p0, v3, :cond_3

    .line 73
    .line 74
    return p1

    .line 75
    :cond_3
    return v4
.end method

.method public static h(D)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    double-to-long p0, p0

    .line 6
    sub-long/2addr v0, p0

    .line 7
    const-wide/16 p0, 0x3e8

    .line 8
    .line 9
    div-long/2addr v0, p0

    .line 10
    const-wide/32 p0, 0x15180

    .line 11
    .line 12
    .line 13
    cmp-long p0, v0, p0

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static i(D)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    double-to-long p0, p0

    .line 6
    sub-long/2addr v0, p0

    .line 7
    const-wide/16 p0, 0x3e8

    .line 8
    .line 9
    div-long/2addr v0, p0

    .line 10
    const-wide/32 p0, 0x93a80

    .line 11
    .line 12
    .line 13
    cmp-long p0, v0, p0

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static j(JJ)Z
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
    const/4 p0, 0x1

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
    move-result p2

    .line 34
    if-ne p1, p2, :cond_0

    .line 35
    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public static k(I)Z
    .locals 2

    .line 1
    rem-int/lit8 v0, p0, 0x64

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    rem-int/lit16 v0, p0, 0x190

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    rem-int/lit8 p0, p0, 0x4

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v1
.end method

.method public static l(JJ)Z
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

.method public static m(J)Z
    .locals 6

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long v2, v0, p0

    .line 6
    .line 7
    const-wide v4, 0x9fa52400L

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v2, v2, v4

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    if-lez v2, :cond_0

    .line 16
    .line 17
    return v3

    .line 18
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v4, 0x2

    .line 31
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-virtual {v5, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v5, p0}, Ljava/util/Calendar;->get(I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {v5, v4}, Ljava/util/Calendar;->get(I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-ne p1, v0, :cond_1

    .line 51
    .line 52
    if-ne v2, v1, :cond_1

    .line 53
    .line 54
    return p0

    .line 55
    :cond_1
    return v3
.end method

.method public static n(J)Z
    .locals 6

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long v2, v0, p0

    .line 6
    .line 7
    const-wide/32 v4, 0x5265c00

    .line 8
    .line 9
    .line 10
    cmp-long v2, v2, v4

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    return v3

    .line 16
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x5

    .line 24
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-ne p1, p0, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    return v3
.end method

.method public static o(D)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1, p0, p1}, Ll/p6i;->p(JD)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static p(JD)Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    double-to-long p2, p2

    .line 8
    invoke-virtual {v1, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x7b2

    .line 17
    .line 18
    if-gt v1, v2, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z2:I

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    sub-long/2addr p2, p0

    .line 28
    const-wide/16 p0, 0x3e8

    .line 29
    .line 30
    div-long/2addr p2, p0

    .line 31
    const-wide/32 p0, 0x1e13380

    .line 32
    .line 33
    .line 34
    cmp-long v1, p2, p0

    .line 35
    .line 36
    const-wide/16 v2, 0x1

    .line 37
    .line 38
    if-lez v1, :cond_2

    .line 39
    .line 40
    div-long/2addr p2, p0

    .line 41
    long-to-int p0, p2

    .line 42
    int-to-long p0, p0

    .line 43
    cmp-long p2, p0, v2

    .line 44
    .line 45
    if-lez p2, :cond_1

    .line 46
    .line 47
    sget p2, Lcom/p1/mobile/putong/common/R$string;->p:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget p2, Lcom/p1/mobile/putong/common/R$string;->o:I

    .line 51
    .line 52
    :goto_0
    move-wide v2, p0

    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_2
    const-wide/32 p0, 0x278d00

    .line 56
    .line 57
    .line 58
    cmp-long v1, p2, p0

    .line 59
    .line 60
    if-lez v1, :cond_4

    .line 61
    .line 62
    div-long/2addr p2, p0

    .line 63
    long-to-int p0, p2

    .line 64
    int-to-long p0, p0

    .line 65
    cmp-long p2, p0, v2

    .line 66
    .line 67
    if-lez p2, :cond_3

    .line 68
    .line 69
    sget p2, Lcom/p1/mobile/putong/common/R$string;->l:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    sget p2, Lcom/p1/mobile/putong/common/R$string;->k:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const-wide/32 p0, 0x93a80

    .line 76
    .line 77
    .line 78
    cmp-long v1, p2, p0

    .line 79
    .line 80
    if-lez v1, :cond_6

    .line 81
    .line 82
    div-long/2addr p2, p0

    .line 83
    long-to-int p0, p2

    .line 84
    int-to-long p0, p0

    .line 85
    cmp-long p2, p0, v2

    .line 86
    .line 87
    if-lez p2, :cond_5

    .line 88
    .line 89
    sget p2, Lcom/p1/mobile/putong/common/R$string;->n:I

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    sget p2, Lcom/p1/mobile/putong/common/R$string;->m:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    const-wide/32 p0, 0x15180

    .line 96
    .line 97
    .line 98
    cmp-long v1, p2, p0

    .line 99
    .line 100
    if-lez v1, :cond_8

    .line 101
    .line 102
    div-long/2addr p2, p0

    .line 103
    long-to-int p0, p2

    .line 104
    int-to-long p0, p0

    .line 105
    cmp-long p2, p0, v2

    .line 106
    .line 107
    if-lez p2, :cond_7

    .line 108
    .line 109
    sget p2, Lcom/p1/mobile/putong/common/R$string;->j:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    sget p2, Lcom/p1/mobile/putong/common/R$string;->i:I

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_8
    const-wide/16 p0, 0xe10

    .line 116
    .line 117
    cmp-long v1, p2, p0

    .line 118
    .line 119
    if-lez v1, :cond_a

    .line 120
    .line 121
    div-long/2addr p2, p0

    .line 122
    long-to-int p0, p2

    .line 123
    int-to-long p0, p0

    .line 124
    cmp-long p2, p0, v2

    .line 125
    .line 126
    if-lez p2, :cond_9

    .line 127
    .line 128
    sget p2, Lcom/p1/mobile/putong/common/R$string;->x2:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    sget p2, Lcom/p1/mobile/putong/common/R$string;->w2:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_a
    const-wide/16 p0, 0x3c

    .line 135
    .line 136
    cmp-long v1, p2, p0

    .line 137
    .line 138
    if-lez v1, :cond_c

    .line 139
    .line 140
    div-long/2addr p2, p0

    .line 141
    long-to-int p0, p2

    .line 142
    int-to-long p0, p0

    .line 143
    cmp-long p2, p0, v2

    .line 144
    .line 145
    if-lez p2, :cond_b

    .line 146
    .line 147
    sget p2, Lcom/p1/mobile/putong/common/R$string;->B2:I

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_b
    sget p2, Lcom/p1/mobile/putong/common/R$string;->A2:I

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_c
    sget p2, Lcom/p1/mobile/putong/common/R$string;->B2:I

    .line 154
    .line 155
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method

.method public static q(D)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1, p0, p1}, Ll/p6i;->r(JD)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static r(JD)Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    double-to-long p2, p2

    .line 8
    invoke-virtual {v1, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v3, 0x7b2

    .line 17
    .line 18
    if-gt v1, v3, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z2:I

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    sub-long/2addr p0, p2

    .line 28
    const-wide/16 p2, 0x3e8

    .line 29
    .line 30
    div-long/2addr p0, p2

    .line 31
    const-wide/32 p2, 0x1e13380

    .line 32
    .line 33
    .line 34
    cmp-long v1, p0, p2

    .line 35
    .line 36
    const-wide/16 v3, 0x1

    .line 37
    .line 38
    if-lez v1, :cond_2

    .line 39
    .line 40
    div-long/2addr p0, p2

    .line 41
    long-to-int p0, p0

    .line 42
    int-to-long p0, p0

    .line 43
    cmp-long p2, p0, v3

    .line 44
    .line 45
    if-lez p2, :cond_1

    .line 46
    .line 47
    sget p2, Lcom/p1/mobile/putong/common/R$string;->p:I

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    sget p2, Lcom/p1/mobile/putong/common/R$string;->o:I

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_2
    const-wide/32 p2, 0x278d00

    .line 56
    .line 57
    .line 58
    cmp-long v1, p0, p2

    .line 59
    .line 60
    if-lez v1, :cond_4

    .line 61
    .line 62
    div-long/2addr p0, p2

    .line 63
    long-to-int p0, p0

    .line 64
    int-to-long p0, p0

    .line 65
    cmp-long p2, p0, v3

    .line 66
    .line 67
    if-lez p2, :cond_3

    .line 68
    .line 69
    sget p2, Lcom/p1/mobile/putong/common/R$string;->l:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    sget p2, Lcom/p1/mobile/putong/common/R$string;->k:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const-wide/32 p2, 0x93a80

    .line 76
    .line 77
    .line 78
    cmp-long v1, p0, p2

    .line 79
    .line 80
    if-lez v1, :cond_6

    .line 81
    .line 82
    div-long/2addr p0, p2

    .line 83
    long-to-int p0, p0

    .line 84
    int-to-long p0, p0

    .line 85
    cmp-long p2, p0, v3

    .line 86
    .line 87
    if-lez p2, :cond_5

    .line 88
    .line 89
    sget p2, Lcom/p1/mobile/putong/common/R$string;->n:I

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    sget p2, Lcom/p1/mobile/putong/common/R$string;->m:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    const-wide/32 p2, 0x15180

    .line 96
    .line 97
    .line 98
    cmp-long v1, p0, p2

    .line 99
    .line 100
    if-lez v1, :cond_8

    .line 101
    .line 102
    div-long/2addr p0, p2

    .line 103
    long-to-int p0, p0

    .line 104
    int-to-long p0, p0

    .line 105
    cmp-long p2, p0, v3

    .line 106
    .line 107
    if-lez p2, :cond_7

    .line 108
    .line 109
    sget p2, Lcom/p1/mobile/putong/common/R$string;->j:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    sget p2, Lcom/p1/mobile/putong/common/R$string;->i:I

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_8
    const-wide/16 p2, 0xe10

    .line 116
    .line 117
    cmp-long v1, p0, p2

    .line 118
    .line 119
    if-lez v1, :cond_a

    .line 120
    .line 121
    div-long/2addr p0, p2

    .line 122
    long-to-int p0, p0

    .line 123
    int-to-long p0, p0

    .line 124
    cmp-long p2, p0, v3

    .line 125
    .line 126
    if-lez p2, :cond_9

    .line 127
    .line 128
    sget p2, Lcom/p1/mobile/putong/common/R$string;->x2:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    sget p2, Lcom/p1/mobile/putong/common/R$string;->w2:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_a
    const-wide/16 p2, 0x3c

    .line 135
    .line 136
    cmp-long v1, p0, p2

    .line 137
    .line 138
    if-lez v1, :cond_c

    .line 139
    .line 140
    div-long/2addr p0, p2

    .line 141
    long-to-int p0, p0

    .line 142
    int-to-long p0, p0

    .line 143
    cmp-long p2, p0, v3

    .line 144
    .line 145
    if-lez p2, :cond_b

    .line 146
    .line 147
    sget p2, Lcom/p1/mobile/putong/common/R$string;->B2:I

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_b
    sget p2, Lcom/p1/mobile/putong/common/R$string;->A2:I

    .line 151
    .line 152
    :goto_0
    sget p3, Lcom/p1/mobile/putong/common/R$string;->v2:I

    .line 153
    .line 154
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_c
    const-wide/16 p2, 0x0

    .line 172
    .line 173
    cmp-long p2, p0, p2

    .line 174
    .line 175
    if-lez p2, :cond_d

    .line 176
    .line 177
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->p1:I

    .line 178
    .line 179
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {v0, p2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    return-object p0

    .line 192
    :cond_d
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->p1:I

    .line 193
    .line 194
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {v0, p0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    return-object p0
.end method
