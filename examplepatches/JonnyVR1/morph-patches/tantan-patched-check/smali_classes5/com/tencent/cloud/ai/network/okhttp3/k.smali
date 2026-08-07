.class public final Lcom/tencent/cloud/ai/network/okhttp3/k;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Ljava/util/regex/Pattern;

.field public static final k:Ljava/util/regex/Pattern;

.field public static final l:Ljava/util/regex/Pattern;

.field public static final m:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "(\\d{2,4})[^\\d]*"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/k;->j:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "(?i)(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec).*"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/k;->k:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    const-string v0, "(\\d{1,2})[^\\d]*"

    .line 18
    .line 19
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/k;->l:Ljava/util/regex/Pattern;

    .line 24
    .line 25
    const-string v0, "(\\d{1,2}):(\\d{1,2}):(\\d{1,2})[^\\d]*"

    .line 26
    .line 27
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/k;->m:Ljava/util/regex/Pattern;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->c:J

    .line 9
    .line 10
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-boolean p7, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->f:Z

    .line 15
    .line 16
    iput-boolean p8, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->g:Z

    .line 17
    .line 18
    iput-boolean p9, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->i:Z

    .line 19
    .line 20
    iput-boolean p10, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->h:Z

    .line 21
    .line 22
    return-void
.end method

.method public static a(Ljava/lang/String;IIZ)I
    .locals 3

    :goto_0
    if-ge p1, p2, :cond_7

    .line 808
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    const/4 v2, 0x1

    if-ge v0, v1, :cond_0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_5

    :cond_0
    const/16 v1, 0x7f

    if-ge v0, v1, :cond_5

    const/16 v1, 0x30

    if-lt v0, v1, :cond_1

    const/16 v1, 0x39

    if-le v0, v1, :cond_5

    :cond_1
    const/16 v1, 0x61

    if-lt v0, v1, :cond_2

    const/16 v1, 0x7a

    if-le v0, v1, :cond_5

    :cond_2
    const/16 v1, 0x41

    if-lt v0, v1, :cond_3

    const/16 v1, 0x5a

    if-le v0, v1, :cond_5

    :cond_3
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    goto :goto_2

    :cond_5
    :goto_1
    move v0, v2

    :goto_2
    xor-int/lit8 v1, p3, 0x1

    if-ne v0, v1, :cond_6

    return p1

    :cond_6
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_7
    return p2
.end method

.method public static a(Ljava/lang/String;II)J
    .locals 12

    const/4 v0, 0x0

    .line 776
    invoke-static {p0, p1, p2, v0}, Lcom/tencent/cloud/ai/network/okhttp3/k;->a(Ljava/lang/String;IIZ)I

    move-result p1

    .line 777
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/k;->m:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const/4 v2, -0x1

    move v3, v2

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    :goto_0
    const/4 v9, 0x2

    const/4 v10, 0x1

    if-ge p1, p2, :cond_4

    add-int/lit8 v11, p1, 0x1

    .line 778
    invoke-static {p0, v11, p2, v10}, Lcom/tencent/cloud/ai/network/okhttp3/k;->a(Ljava/lang/String;IIZ)I

    move-result v11

    .line 779
    invoke-virtual {v1, p1, v11}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    if-ne v4, v2, :cond_0

    .line 780
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->m:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 781
    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 782
    invoke-virtual {v1, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 p1, 0x3

    .line 783
    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_1

    :cond_0
    if-ne v5, v2, :cond_1

    .line 784
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->l:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 785
    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    goto :goto_1

    :cond_1
    if-ne v6, v2, :cond_2

    .line 786
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->k:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/regex/Matcher;->matches()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 787
    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    .line 788
    invoke-virtual {p1}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    div-int/lit8 v6, p1, 0x4

    goto :goto_1

    :cond_2
    if-ne v3, v2, :cond_3

    .line 789
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->j:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 790
    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :cond_3
    :goto_1
    add-int/lit8 v11, v11, 0x1

    .line 791
    invoke-static {p0, v11, p2, v0}, Lcom/tencent/cloud/ai/network/okhttp3/k;->a(Ljava/lang/String;IIZ)I

    move-result p1

    goto/16 :goto_0

    :cond_4
    const/16 p0, 0x46

    if-lt v3, p0, :cond_5

    const/16 p0, 0x63

    if-gt v3, p0, :cond_5

    add-int/lit16 v3, v3, 0x76c

    :cond_5
    if-ltz v3, :cond_6

    const/16 p0, 0x45

    if-gt v3, p0, :cond_6

    add-int/lit16 v3, v3, 0x7d0

    :cond_6
    const/16 p0, 0x641

    const-wide/16 p1, 0x0

    if-lt v3, p0, :cond_c

    if-eq v6, v2, :cond_b

    if-lt v5, v10, :cond_a

    const/16 p0, 0x1f

    if-gt v5, p0, :cond_a

    if-ltz v4, :cond_9

    const/16 p0, 0x17

    if-gt v4, p0, :cond_9

    if-ltz v7, :cond_8

    const/16 p0, 0x3b

    if-gt v7, p0, :cond_8

    if-ltz v8, :cond_7

    if-gt v8, p0, :cond_7

    .line 792
    new-instance p0, Ljava/util/GregorianCalendar;

    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->h:Ljava/util/TimeZone;

    invoke-direct {p0, p1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 793
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setLenient(Z)V

    .line 794
    invoke-virtual {p0, v10, v3}, Ljava/util/Calendar;->set(II)V

    sub-int/2addr v6, v10

    .line 795
    invoke-virtual {p0, v9, v6}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x5

    .line 796
    invoke-virtual {p0, p1, v5}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xb

    .line 797
    invoke-virtual {p0, p1, v4}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    .line 798
    invoke-virtual {p0, p1, v7}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    .line 799
    invoke-virtual {p0, p1, v8}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    .line 800
    invoke-virtual {p0, p1, v0}, Ljava/util/Calendar;->set(II)V

    .line 801
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0

    .line 802
    :cond_7
    invoke-static {}, Ll/fig0;->a()V

    return-wide p1

    .line 803
    :cond_8
    invoke-static {}, Ll/fig0;->a()V

    return-wide p1

    .line 804
    :cond_9
    invoke-static {}, Ll/fig0;->a()V

    return-wide p1

    .line 805
    :cond_a
    invoke-static {}, Ll/fig0;->a()V

    return-wide p1

    .line 806
    :cond_b
    invoke-static {}, Ll/fig0;->a()V

    return-wide p1

    .line 807
    :cond_c
    invoke-static {}, Ll/fig0;->a()V

    return-wide p1
.end method

.method public static a(JLcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/k;
    .locals 30

    .line 1
    move-object/from16 v1, p3

    .line 2
    .line 3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    const/4 v3, 0x0

    .line 8
    const/16 v4, 0x3b

    .line 9
    .line 10
    invoke-static {v1, v3, v2, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v5, 0x3d

    .line 15
    .line 16
    invoke-static {v1, v3, v0, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    const/4 v7, 0x0

    .line 21
    if-ne v6, v0, :cond_0

    .line 22
    .line 23
    return-object v7

    .line 24
    :cond_0
    invoke-static {v1, v3, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->d(Ljava/lang/String;II)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v9

    .line 28
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v8

    .line 32
    if-nez v8, :cond_1

    .line 33
    .line 34
    invoke-static {v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    const/4 v10, -0x1

    .line 39
    if-eq v8, v10, :cond_2

    .line 40
    .line 41
    :cond_1
    move-object/from16 v16, v7

    .line 42
    .line 43
    goto/16 :goto_1e

    .line 44
    .line 45
    :cond_2
    const/4 v8, 0x1

    .line 46
    add-int/2addr v6, v8

    .line 47
    invoke-static {v1, v6, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->d(Ljava/lang/String;II)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-static {v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v11

    .line 55
    if-eq v11, v10, :cond_3

    .line 56
    .line 57
    return-object v7

    .line 58
    :cond_3
    add-int/2addr v0, v8

    .line 59
    move/from16 v19, v3

    .line 60
    .line 61
    move/from16 v22, v19

    .line 62
    .line 63
    move/from16 v23, v22

    .line 64
    .line 65
    move-object v10, v7

    .line 66
    move-object/from16 v16, v10

    .line 67
    .line 68
    move v11, v8

    .line 69
    const-wide/16 v14, -0x1

    .line 70
    .line 71
    const-wide/16 v17, -0x1

    .line 72
    .line 73
    const-wide v20, 0xe677d21fdbffL

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    :goto_0
    const-wide v24, 0x7fffffffffffffffL

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    const-wide/high16 v26, -0x8000000000000000L

    .line 84
    .line 85
    if-ge v0, v2, :cond_11

    .line 86
    .line 87
    const-wide v28, 0xe677d21fdbffL

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    invoke-static {v1, v0, v2, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 93
    .line 94
    .line 95
    move-result v12

    .line 96
    invoke-static {v1, v0, v12, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 97
    .line 98
    .line 99
    move-result v13

    .line 100
    invoke-static {v1, v0, v13}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->d(Ljava/lang/String;II)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    if-ge v13, v12, :cond_4

    .line 105
    .line 106
    add-int/lit8 v13, v13, 0x1

    .line 107
    .line 108
    invoke-static {v1, v13, v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->d(Ljava/lang/String;II)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v13

    .line 112
    goto :goto_1

    .line 113
    :cond_4
    const-string v13, ""

    .line 114
    .line 115
    :goto_1
    const-string v4, "expires"

    .line 116
    .line 117
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    if-eqz v4, :cond_5

    .line 122
    .line 123
    :try_start_0
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    invoke-static {v13, v3, v0}, Lcom/tencent/cloud/ai/network/okhttp3/k;->a(Ljava/lang/String;II)J

    .line 128
    .line 129
    .line 130
    move-result-wide v20
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 131
    goto :goto_3

    .line 132
    :cond_5
    const-string v4, "max-age"

    .line 133
    .line 134
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_9

    .line 139
    .line 140
    :try_start_1
    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 141
    .line 142
    .line 143
    move-result-wide v14
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 144
    const-wide/16 v24, 0x0

    .line 145
    .line 146
    cmp-long v0, v14, v24

    .line 147
    .line 148
    if-gtz v0, :cond_7

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :catch_0
    move-exception v0

    .line 152
    :try_start_2
    const-string v4, "-?\\d+"

    .line 153
    .line 154
    invoke-virtual {v13, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    if-eqz v4, :cond_8

    .line 159
    .line 160
    const-string v0, "-"

    .line 161
    .line 162
    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_6

    .line 167
    .line 168
    :goto_2
    move-wide/from16 v14, v26

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_6
    move-wide/from16 v14, v24

    .line 172
    .line 173
    :cond_7
    :goto_3
    move/from16 v19, v8

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_8
    throw v0
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    .line 177
    :cond_9
    const-string v4, "domain"

    .line 178
    .line 179
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    if-eqz v4, :cond_d

    .line 184
    .line 185
    :try_start_3
    const-string v0, "."

    .line 186
    .line 187
    invoke-virtual {v13, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_c

    .line 192
    .line 193
    const-string v0, "."

    .line 194
    .line 195
    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-eqz v0, :cond_a

    .line 200
    .line 201
    invoke-virtual {v13, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v13

    .line 205
    :cond_a
    invoke-static {v13}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    if-eqz v0, :cond_b

    .line 210
    .line 211
    move-object v7, v0

    .line 212
    move v11, v3

    .line 213
    goto :goto_4

    .line 214
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 215
    .line 216
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 217
    .line 218
    .line 219
    throw v0

    .line 220
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 221
    .line 222
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 223
    .line 224
    .line 225
    throw v0
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1

    .line 226
    :cond_d
    const-string v4, "path"

    .line 227
    .line 228
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    if-eqz v4, :cond_e

    .line 233
    .line 234
    move-object v10, v13

    .line 235
    goto :goto_4

    .line 236
    :cond_e
    const-string v4, "secure"

    .line 237
    .line 238
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    if-eqz v4, :cond_f

    .line 243
    .line 244
    move/from16 v22, v8

    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_f
    const-string v4, "httponly"

    .line 248
    .line 249
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-eqz v0, :cond_10

    .line 254
    .line 255
    move/from16 v23, v8

    .line 256
    .line 257
    :catch_1
    :cond_10
    :goto_4
    add-int/lit8 v0, v12, 0x1

    .line 258
    .line 259
    const/16 v4, 0x3b

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_11
    const-wide v28, 0xe677d21fdbffL

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    cmp-long v0, v14, v26

    .line 269
    .line 270
    if-nez v0, :cond_12

    .line 271
    .line 272
    move-object/from16 v1, p2

    .line 273
    .line 274
    move-wide/from16 v12, v26

    .line 275
    .line 276
    goto :goto_6

    .line 277
    :cond_12
    cmp-long v0, v14, v17

    .line 278
    .line 279
    if-eqz v0, :cond_16

    .line 280
    .line 281
    const-wide v0, 0x20c49ba5e353f7L

    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    cmp-long v0, v14, v0

    .line 287
    .line 288
    if-gtz v0, :cond_13

    .line 289
    .line 290
    const-wide/16 v0, 0x3e8

    .line 291
    .line 292
    mul-long v24, v14, v0

    .line 293
    .line 294
    :cond_13
    add-long v24, p0, v24

    .line 295
    .line 296
    cmp-long v0, v24, p0

    .line 297
    .line 298
    if-ltz v0, :cond_15

    .line 299
    .line 300
    cmp-long v0, v24, v28

    .line 301
    .line 302
    if-lez v0, :cond_14

    .line 303
    .line 304
    goto :goto_5

    .line 305
    :cond_14
    move-object/from16 v1, p2

    .line 306
    .line 307
    move-wide/from16 v12, v24

    .line 308
    .line 309
    goto :goto_6

    .line 310
    :cond_15
    :goto_5
    move-object/from16 v1, p2

    .line 311
    .line 312
    move-wide/from16 v12, v28

    .line 313
    .line 314
    goto :goto_6

    .line 315
    :cond_16
    move-object/from16 v1, p2

    .line 316
    .line 317
    move-wide/from16 v12, v20

    .line 318
    .line 319
    :goto_6
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 320
    .line 321
    const/16 v2, 0x2e

    .line 322
    .line 323
    if-nez v7, :cond_17

    .line 324
    .line 325
    move-object v7, v0

    .line 326
    goto :goto_7

    .line 327
    :cond_17
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v4

    .line 331
    if-eqz v4, :cond_18

    .line 332
    .line 333
    goto :goto_7

    .line 334
    :cond_18
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 335
    .line 336
    .line 337
    move-result v4

    .line 338
    if-eqz v4, :cond_32

    .line 339
    .line 340
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 341
    .line 342
    .line 343
    move-result v4

    .line 344
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 345
    .line 346
    .line 347
    move-result v5

    .line 348
    sub-int/2addr v4, v5

    .line 349
    sub-int/2addr v4, v8

    .line 350
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 351
    .line 352
    .line 353
    move-result v4

    .line 354
    if-ne v4, v2, :cond_32

    .line 355
    .line 356
    sget-object v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->k:Ljava/util/regex/Pattern;

    .line 357
    .line 358
    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    .line 363
    .line 364
    .line 365
    move-result v4

    .line 366
    if-nez v4, :cond_32

    .line 367
    .line 368
    :goto_7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    if-eq v0, v4, :cond_2e

    .line 377
    .line 378
    sget-object v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;

    .line 379
    .line 380
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 381
    .line 382
    .line 383
    invoke-static {v7}, Ljava/net/IDN;->toUnicode(Ljava/lang/String;)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    const-string v5, "\\."

    .line 388
    .line 389
    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v5

    .line 393
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 394
    .line 395
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    if-nez v0, :cond_1a

    .line 400
    .line 401
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 402
    .line 403
    invoke-virtual {v0, v3, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    if-eqz v0, :cond_1a

    .line 408
    .line 409
    move v14, v3

    .line 410
    :goto_8
    :try_start_4
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->a()V
    :try_end_4
    .catch Ljava/io/InterruptedIOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 411
    .line 412
    .line 413
    move/from16 v17, v3

    .line 414
    .line 415
    if-eqz v14, :cond_1b

    .line 416
    .line 417
    goto :goto_9

    .line 418
    :catchall_0
    move-exception v0

    .line 419
    goto :goto_a

    .line 420
    :catch_2
    move-exception v0

    .line 421
    :try_start_5
    sget-object v15, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 422
    .line 423
    const-string v2, "Failed to read public suffix list"

    .line 424
    .line 425
    move/from16 v17, v3

    .line 426
    .line 427
    const/4 v3, 0x5

    .line 428
    invoke-virtual {v15, v3, v2, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(ILjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 429
    .line 430
    .line 431
    if-eqz v14, :cond_1b

    .line 432
    .line 433
    :goto_9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 438
    .line 439
    .line 440
    goto :goto_b

    .line 441
    :catch_3
    move/from16 v17, v3

    .line 442
    .line 443
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 444
    .line 445
    .line 446
    move v14, v8

    .line 447
    move/from16 v3, v17

    .line 448
    .line 449
    const/16 v2, 0x2e

    .line 450
    .line 451
    goto :goto_8

    .line 452
    :goto_a
    if-eqz v14, :cond_19

    .line 453
    .line 454
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 459
    .line 460
    .line 461
    :cond_19
    throw v0

    .line 462
    :cond_1a
    move/from16 v17, v3

    .line 463
    .line 464
    :try_start_7
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->b:Ljava/util/concurrent/CountDownLatch;

    .line 465
    .line 466
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_4

    .line 467
    .line 468
    .line 469
    goto :goto_b

    .line 470
    :catch_4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 475
    .line 476
    .line 477
    :cond_1b
    :goto_b
    monitor-enter v4

    .line 478
    :try_start_8
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->c:[B

    .line 479
    .line 480
    if-eqz v0, :cond_2d

    .line 481
    .line 482
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 483
    array-length v0, v5

    .line 484
    new-array v2, v0, [[B

    .line 485
    .line 486
    move/from16 v3, v17

    .line 487
    .line 488
    :goto_c
    array-length v14, v5

    .line 489
    if-ge v3, v14, :cond_1c

    .line 490
    .line 491
    aget-object v14, v5, v3

    .line 492
    .line 493
    sget-object v15, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 494
    .line 495
    invoke-virtual {v14, v15}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 496
    .line 497
    .line 498
    move-result-object v14

    .line 499
    aput-object v14, v2, v3

    .line 500
    .line 501
    add-int/lit8 v3, v3, 0x1

    .line 502
    .line 503
    goto :goto_c

    .line 504
    :cond_1c
    move/from16 v3, v17

    .line 505
    .line 506
    :goto_d
    if-ge v3, v0, :cond_1e

    .line 507
    .line 508
    iget-object v14, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->c:[B

    .line 509
    .line 510
    invoke-static {v14, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->a([B[[BI)Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object v14

    .line 514
    if-eqz v14, :cond_1d

    .line 515
    .line 516
    goto :goto_e

    .line 517
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    .line 518
    .line 519
    goto :goto_d

    .line 520
    :cond_1e
    move-object/from16 v14, v16

    .line 521
    .line 522
    :goto_e
    if-le v0, v8, :cond_20

    .line 523
    .line 524
    invoke-virtual {v2}, [[B->clone()Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    move-result-object v3

    .line 528
    check-cast v3, [[B

    .line 529
    .line 530
    move/from16 v18, v8

    .line 531
    .line 532
    move/from16 v15, v17

    .line 533
    .line 534
    :goto_f
    array-length v8, v3

    .line 535
    add-int/lit8 v8, v8, -0x1

    .line 536
    .line 537
    if-ge v15, v8, :cond_21

    .line 538
    .line 539
    sget-object v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->e:[B

    .line 540
    .line 541
    aput-object v8, v3, v15

    .line 542
    .line 543
    iget-object v8, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->c:[B

    .line 544
    .line 545
    invoke-static {v8, v3, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->a([B[[BI)Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v8

    .line 549
    if-eqz v8, :cond_1f

    .line 550
    .line 551
    goto :goto_10

    .line 552
    :cond_1f
    add-int/lit8 v15, v15, 0x1

    .line 553
    .line 554
    goto :goto_f

    .line 555
    :cond_20
    move/from16 v18, v8

    .line 556
    .line 557
    :cond_21
    move-object/from16 v8, v16

    .line 558
    .line 559
    :goto_10
    if-eqz v8, :cond_23

    .line 560
    .line 561
    move/from16 v3, v17

    .line 562
    .line 563
    :goto_11
    add-int/lit8 v15, v0, -0x1

    .line 564
    .line 565
    if-ge v3, v15, :cond_23

    .line 566
    .line 567
    iget-object v15, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->d:[B

    .line 568
    .line 569
    invoke-static {v15, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->a([B[[BI)Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v15

    .line 573
    if-eqz v15, :cond_22

    .line 574
    .line 575
    goto :goto_12

    .line 576
    :cond_22
    add-int/lit8 v3, v3, 0x1

    .line 577
    .line 578
    goto :goto_11

    .line 579
    :cond_23
    move-object/from16 v15, v16

    .line 580
    .line 581
    :goto_12
    if-eqz v15, :cond_24

    .line 582
    .line 583
    const-string v0, "!"

    .line 584
    .line 585
    invoke-virtual {v0, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v0

    .line 589
    const-string v2, "\\."

    .line 590
    .line 591
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    goto :goto_15

    .line 596
    :cond_24
    if-nez v14, :cond_25

    .line 597
    .line 598
    if-nez v8, :cond_25

    .line 599
    .line 600
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->g:[Ljava/lang/String;

    .line 601
    .line 602
    goto :goto_15

    .line 603
    :cond_25
    if-eqz v14, :cond_26

    .line 604
    .line 605
    const-string v0, "\\."

    .line 606
    .line 607
    invoke-virtual {v14, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 608
    .line 609
    .line 610
    move-result-object v0

    .line 611
    goto :goto_13

    .line 612
    :cond_26
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->f:[Ljava/lang/String;

    .line 613
    .line 614
    :goto_13
    if-eqz v8, :cond_27

    .line 615
    .line 616
    const-string v2, "\\."

    .line 617
    .line 618
    invoke-virtual {v8, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v2

    .line 622
    goto :goto_14

    .line 623
    :cond_27
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/publicsuffix/a;->f:[Ljava/lang/String;

    .line 624
    .line 625
    :goto_14
    array-length v3, v0

    .line 626
    array-length v4, v2

    .line 627
    if-le v3, v4, :cond_28

    .line 628
    .line 629
    goto :goto_15

    .line 630
    :cond_28
    move-object v0, v2

    .line 631
    :goto_15
    array-length v2, v5

    .line 632
    array-length v3, v0

    .line 633
    const/16 v4, 0x21

    .line 634
    .line 635
    if-ne v2, v3, :cond_29

    .line 636
    .line 637
    aget-object v2, v0, v17

    .line 638
    .line 639
    move/from16 v3, v17

    .line 640
    .line 641
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 642
    .line 643
    .line 644
    move-result v2

    .line 645
    if-eq v2, v4, :cond_2a

    .line 646
    .line 647
    move-object/from16 v0, v16

    .line 648
    .line 649
    goto :goto_19

    .line 650
    :cond_29
    move/from16 v3, v17

    .line 651
    .line 652
    :cond_2a
    aget-object v2, v0, v3

    .line 653
    .line 654
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 655
    .line 656
    .line 657
    move-result v2

    .line 658
    if-ne v2, v4, :cond_2b

    .line 659
    .line 660
    array-length v2, v5

    .line 661
    array-length v0, v0

    .line 662
    :goto_16
    sub-int/2addr v2, v0

    .line 663
    goto :goto_17

    .line 664
    :cond_2b
    array-length v2, v5

    .line 665
    array-length v0, v0

    .line 666
    add-int/lit8 v0, v0, 0x1

    .line 667
    .line 668
    goto :goto_16

    .line 669
    :goto_17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 670
    .line 671
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 672
    .line 673
    .line 674
    const-string v3, "\\."

    .line 675
    .line 676
    invoke-virtual {v7, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object v3

    .line 680
    :goto_18
    array-length v4, v3

    .line 681
    if-ge v2, v4, :cond_2c

    .line 682
    .line 683
    aget-object v4, v3, v2

    .line 684
    .line 685
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    .line 687
    .line 688
    const/16 v4, 0x2e

    .line 689
    .line 690
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 691
    .line 692
    .line 693
    add-int/lit8 v2, v2, 0x1

    .line 694
    .line 695
    goto :goto_18

    .line 696
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 697
    .line 698
    .line 699
    move-result v2

    .line 700
    add-int/lit8 v2, v2, -0x1

    .line 701
    .line 702
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 703
    .line 704
    .line 705
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 706
    .line 707
    .line 708
    move-result-object v0

    .line 709
    :goto_19
    if-nez v0, :cond_2e

    .line 710
    .line 711
    return-object v16

    .line 712
    :catchall_1
    move-exception v0

    .line 713
    goto :goto_1a

    .line 714
    :cond_2d
    :try_start_9
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 715
    .line 716
    const-string v1, "Unable to load publicsuffixes.gz resource from the classpath."

    .line 717
    .line 718
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 719
    .line 720
    .line 721
    throw v0

    .line 722
    :goto_1a
    monitor-exit v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 723
    throw v0

    .line 724
    :cond_2e
    if-eqz v10, :cond_30

    .line 725
    .line 726
    const-string v0, "/"

    .line 727
    .line 728
    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 729
    .line 730
    .line 731
    move-result v0

    .line 732
    if-nez v0, :cond_2f

    .line 733
    .line 734
    goto :goto_1c

    .line 735
    :cond_2f
    :goto_1b
    move-object v14, v10

    .line 736
    goto :goto_1d

    .line 737
    :cond_30
    :goto_1c
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->b()Ljava/lang/String;

    .line 738
    .line 739
    .line 740
    move-result-object v0

    .line 741
    const/16 v1, 0x2f

    .line 742
    .line 743
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 744
    .line 745
    .line 746
    move-result v1

    .line 747
    if-eqz v1, :cond_31

    .line 748
    .line 749
    const/4 v3, 0x0

    .line 750
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 751
    .line 752
    .line 753
    move-result-object v10

    .line 754
    goto :goto_1b

    .line 755
    :cond_31
    const-string v10, "/"

    .line 756
    .line 757
    goto :goto_1b

    .line 758
    :goto_1d
    new-instance v8, Lcom/tencent/cloud/ai/network/okhttp3/k;

    .line 759
    .line 760
    move-object v10, v6

    .line 761
    move/from16 v17, v11

    .line 762
    .line 763
    move-wide v11, v12

    .line 764
    move/from16 v18, v19

    .line 765
    .line 766
    move/from16 v15, v22

    .line 767
    .line 768
    move/from16 v16, v23

    .line 769
    .line 770
    move-object v13, v7

    .line 771
    invoke-direct/range {v8 .. v18}, Lcom/tencent/cloud/ai/network/okhttp3/k;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZ)V

    .line 772
    .line 773
    .line 774
    return-object v8

    .line 775
    :cond_32
    :goto_1e
    return-object v16
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/o;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/cloud/ai/network/okhttp3/p;",
            "Lcom/tencent/cloud/ai/network/okhttp3/o;",
            ")",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/k;",
            ">;"
        }
    .end annotation

    const-string v0, "Set-Cookie"

    .line 809
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;->c(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 810
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 811
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 812
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5, p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/k;->a(JLcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/k;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    if-nez v1, :cond_1

    .line 813
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 814
    :cond_1
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    .line 815
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 816
    :cond_3
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    instance-of v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;

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
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/k;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->d:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->d:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->e:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->e:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-wide v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->c:J

    .line 50
    .line 51
    iget-wide v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->c:J

    .line 52
    .line 53
    cmp-long v0, v2, v4

    .line 54
    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->f:Z

    .line 58
    .line 59
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->f:Z

    .line 60
    .line 61
    if-ne v0, v2, :cond_1

    .line 62
    .line 63
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->g:Z

    .line 64
    .line 65
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->g:Z

    .line 66
    .line 67
    if-ne v0, v2, :cond_1

    .line 68
    .line 69
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->h:Z

    .line 70
    .line 71
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->h:Z

    .line 72
    .line 73
    if-ne v0, v2, :cond_1

    .line 74
    .line 75
    iget-boolean p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/k;->i:Z

    .line 76
    .line 77
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->i:Z

    .line 78
    .line 79
    if-ne p1, p0, :cond_1

    .line 80
    .line 81
    const/4 p0, 0x1

    .line 82
    return p0

    .line 83
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit16 v0, v0, 0x20f

    .line 8
    .line 9
    mul-int/lit8 v0, v0, 0x1f

    .line 10
    .line 11
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->d:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x1f

    .line 28
    .line 29
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->e:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x1f

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->c:J

    .line 39
    .line 40
    const/16 v3, 0x20

    .line 41
    .line 42
    ushr-long v3, v1, v3

    .line 43
    .line 44
    xor-long/2addr v1, v3

    .line 45
    long-to-int v1, v1

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x1f

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->f:Z

    .line 50
    .line 51
    xor-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x1f

    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->g:Z

    .line 57
    .line 58
    xor-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x1f

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->h:Z

    .line 64
    .line 65
    xor-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x1f

    .line 69
    .line 70
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->i:Z

    .line 71
    .line 72
    xor-int/lit8 p0, p0, 0x1

    .line 73
    .line 74
    add-int/2addr v0, p0

    .line 75
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x3d

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->h:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->c:J

    .line 26
    .line 27
    const-wide/high16 v3, -0x8000000000000000L

    .line 28
    .line 29
    cmp-long v1, v1, v3

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    const-string v1, "; max-age=0"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v1, "; expires="

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    new-instance v1, Ljava/util/Date;

    .line 45
    .line 46
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->c:J

    .line 47
    .line 48
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 49
    .line 50
    .line 51
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/b;->a:Ljava/lang/ThreadLocal;

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Ljava/text/DateFormat;

    .line 58
    .line 59
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->i:Z

    .line 67
    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    const-string v1, "; domain="

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->d:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    :cond_2
    const-string v1, "; path="

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->e:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->f:Z

    .line 91
    .line 92
    if-eqz v1, :cond_3

    .line 93
    .line 94
    const-string v1, "; secure"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    :cond_3
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/k;->g:Z

    .line 100
    .line 101
    if-eqz p0, :cond_4

    .line 102
    .line 103
    const-string p0, "; httponly"

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
