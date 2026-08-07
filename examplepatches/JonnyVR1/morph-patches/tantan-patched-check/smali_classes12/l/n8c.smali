.class public Ll/n8c;
.super Ll/if2;
.source "SourceFile"


# instance fields
.field public c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

.field private final d:Ljava/lang/StringBuilder;

.field private final e:Z

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    .line 1
    sget v0, Ll/eec0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/if2;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/n8c;->d:Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    iput-object v0, p0, Ll/n8c;->f:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Ll/if2;->a:Landroid/content/Context;

    .line 18
    .line 19
    iput-boolean p2, p0, Ll/n8c;->e:Z

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/n8c;)Ljava/lang/StringBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n8c;->d:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    return-object p0
.end method

.method private static g(I)Z
    .locals 1

    .line 1
    rem-int/lit8 v0, p0, 0x4

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    rem-int/lit8 v0, p0, 0x64

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    rem-int/lit16 p0, p0, 0x190

    .line 10
    .line 11
    if-nez p0, :cond_2

    .line 12
    .line 13
    :cond_1
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_2
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static h(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    sub-int/2addr v1, v2

    .line 11
    const/4 v2, 0x2

    .line 12
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    const/4 v5, 0x0

    .line 21
    const/4 v6, 0x5

    .line 22
    if-ne v3, v4, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1, v6}, Ljava/util/Calendar;->get(I)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-ne v3, v4, :cond_0

    .line 33
    .line 34
    move v3, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v3, v5

    .line 37
    :goto_0
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ne v4, v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/16 v4, 0x1d

    .line 48
    .line 49
    if-ne p0, v4, :cond_2

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ll/n8c;->g(I)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_2

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-ne p0, v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {p1, v6}, Ljava/util/Calendar;->get(I)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    const/16 p1, 0x1c

    .line 72
    .line 73
    if-ne p0, p1, :cond_1

    .line 74
    .line 75
    move v3, v0

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move v3, v5

    .line 78
    :cond_2
    :goto_1
    if-eq v1, v6, :cond_3

    .line 79
    .line 80
    const/16 p0, 0xa

    .line 81
    .line 82
    if-eq v1, p0, :cond_3

    .line 83
    .line 84
    const/16 p0, 0x14

    .line 85
    .line 86
    if-ne v1, p0, :cond_4

    .line 87
    .line 88
    :cond_3
    if-eqz v3, :cond_4

    .line 89
    .line 90
    return v0

    .line 91
    :cond_4
    return v5
.end method

.method public static j(Ljava/lang/String;)Ljava/util/Calendar;
    .locals 3

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy-MM-dd"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-object v1

    .line 24
    :catch_0
    move-exception v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "Invalid date format: "

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0
.end method


# virtual methods
.method public b()Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/n8c;->e:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "-"

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    new-instance v0, Ljava/util/Date;

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    invoke-direct {v0, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 18
    .line 19
    const-string v4, "yyyy-MM-dd"

    .line 20
    .line 21
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 26
    .line 27
    .line 28
    new-instance v4, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v5, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 34
    .line 35
    invoke-virtual {v5}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->getCurrentYear()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v5, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 46
    .line 47
    invoke-virtual {v5}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->getCurrentMonth()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v5, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 58
    .line 59
    invoke-virtual {v5}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->getCurrentDay()I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3, v0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-lez v0, :cond_0

    .line 79
    .line 80
    iget-object v0, p0, Ll/n8c;->d:Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    .line 85
    return v1

    .line 86
    :catch_0
    :cond_0
    invoke-virtual {p0}, Ll/n8c;->d()Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->getCurrentMonth()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p0, v0}, Ll/n8c;->c(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v3, p0, Ll/n8c;->d:Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/n8c;->d:Ljava/lang/StringBuilder;

    .line 104
    .line 105
    iget-object v3, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 106
    .line 107
    invoke-virtual {v3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->getCurrentYear()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ll/n8c;->d()Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->getCurrentDay()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    invoke-virtual {p0, v0}, Ll/n8c;->c(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const/4 p0, 0x1

    .line 139
    return p0
.end method

.method public c(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    if-ge p1, p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public d()Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/scc0;->k:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 12
    .line 13
    iput-object v0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 16
    .line 17
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/n8c;->e:Z

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/n8c;->f(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/n8c;->d:Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public f(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/n8c;->d()Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 6
    .line 7
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setNeedCheckEndDate(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/n8c;->f:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Ll/f8g0;->a(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 v1, 0x2

    .line 25
    const/4 v2, 0x1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {p1, v3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedYear(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v1, v2

    .line 44
    rem-int/lit8 v1, v1, 0xc

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedMonth(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 50
    .line 51
    const/4 p1, 0x5

    .line 52
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedDay(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object p1, p0, Ll/n8c;->f:Ljava/lang/String;

    .line 61
    .line 62
    const-string v0, "-"

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    array-length v0, p1

    .line 71
    if-le v0, v1, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 74
    .line 75
    const/4 v3, 0x0

    .line 76
    aget-object v3, p1, v3

    .line 77
    .line 78
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {v0, v3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedYear(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 86
    .line 87
    aget-object v2, p1, v2

    .line 88
    .line 89
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {v0, v2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedMonth(I)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/n8c;->c:Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;

    .line 97
    .line 98
    aget-object p1, p1, v1

    .line 99
    .line 100
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelDatePicker;->setSelectedDay(I)V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n8c;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/if2;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Ll/n8c;->e:Z

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/n8c;->f(Z)V

    .line 7
    .line 8
    .line 9
    sget p1, Ll/scc0;->m:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/n8c$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/n8c$a;-><init>(Ll/n8c;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    sget p1, Ll/scc0;->l:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    new-instance v0, Ll/n8c$b;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/n8c$b;-><init>(Ll/n8c;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method
