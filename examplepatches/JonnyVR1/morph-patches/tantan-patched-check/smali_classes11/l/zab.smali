.class public Ll/zab;
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

.method public static O(Ljava/util/Calendar;Ljava/util/Calendar;)I
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
