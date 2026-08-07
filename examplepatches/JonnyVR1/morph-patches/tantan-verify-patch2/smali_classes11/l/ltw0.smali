.class public final Ll/ltw0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(DLjava/math/RoundingMode;)J
    .locals 8

    .line 1
    invoke-static {p0, p1}, Ll/mtw0;->a(D)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    sget-object v0, Ll/ktw0;->a:[I

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    aget v0, v0, v3

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const-wide/16 v4, 0x0

    .line 19
    .line 20
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 21
    .line 22
    packed-switch v0, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/aqg0;->a()V

    .line 26
    .line 27
    .line 28
    return-wide v1

    .line 29
    :pswitch_0
    invoke-static {p0, p1}, Ljava/lang/Math;->rint(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    sub-double v4, p0, v0

    .line 34
    .line 35
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    cmpl-double v2, v4, v6

    .line 40
    .line 41
    if-nez v2, :cond_5

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :pswitch_1
    invoke-static {p0, p1}, Ljava/lang/Math;->rint(D)D

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    sub-double v4, p0, v0

    .line 49
    .line 50
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    .line 51
    .line 52
    .line 53
    move-result-wide v4

    .line 54
    cmpl-double v2, v4, v6

    .line 55
    .line 56
    if-nez v2, :cond_5

    .line 57
    .line 58
    invoke-static {v6, v7, p0, p1}, Ljava/lang/Math;->copySign(DD)D

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    add-double/2addr v0, p0

    .line 63
    goto :goto_3

    .line 64
    :pswitch_2
    invoke-static {p0, p1}, Ljava/lang/Math;->rint(D)D

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    goto :goto_3

    .line 69
    :pswitch_3
    invoke-static {p0, p1}, Ll/ltw0;->b(D)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_0
    double-to-long v0, p0

    .line 77
    cmpl-double v2, p0, v4

    .line 78
    .line 79
    if-lez v2, :cond_1

    .line 80
    .line 81
    move v2, v3

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const/4 v2, -0x1

    .line 84
    :goto_0
    int-to-long v4, v2

    .line 85
    :goto_1
    add-long/2addr v0, v4

    .line 86
    long-to-double v0, v0

    .line 87
    goto :goto_3

    .line 88
    :pswitch_4
    cmpl-double v0, p0, v4

    .line 89
    .line 90
    if-lez v0, :cond_4

    .line 91
    .line 92
    invoke-static {p0, p1}, Ll/ltw0;->b(D)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_2
    double-to-long v0, p0

    .line 100
    const-wide/16 v4, 0x1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :pswitch_5
    cmpl-double v0, p0, v4

    .line 104
    .line 105
    if-gez v0, :cond_4

    .line 106
    .line 107
    invoke-static {p0, p1}, Ll/ltw0;->b(D)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    double-to-long v0, p0

    .line 115
    const-wide/16 v4, -0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :pswitch_6
    invoke-static {p0, p1}, Ll/ltw0;->b(D)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-static {v0}, Ll/rtw0;->b(Z)V

    .line 123
    .line 124
    .line 125
    :cond_4
    :goto_2
    :pswitch_7
    move-wide v0, p0

    .line 126
    :cond_5
    :goto_3
    const-wide/high16 v4, -0x3c20000000000000L    # -9.223372036854776E18

    .line 127
    .line 128
    sub-double/2addr v4, v0

    .line 129
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 130
    .line 131
    cmpg-double v2, v4, v6

    .line 132
    .line 133
    const/4 v4, 0x0

    .line 134
    if-gez v2, :cond_6

    .line 135
    .line 136
    move v2, v3

    .line 137
    goto :goto_4

    .line 138
    :cond_6
    move v2, v4

    .line 139
    :goto_4
    const-wide/high16 v5, 0x43e0000000000000L    # 9.223372036854776E18

    .line 140
    .line 141
    cmpg-double v5, v0, v5

    .line 142
    .line 143
    if-gez v5, :cond_7

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_7
    move v3, v4

    .line 147
    :goto_5
    and-int/2addr v2, v3

    .line 148
    if-eqz v2, :cond_8

    .line 149
    .line 150
    double-to-long p0, v0

    .line 151
    return-wide p0

    .line 152
    :cond_8
    new-instance v0, Ljava/lang/ArithmeticException;

    .line 153
    .line 154
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v2, "rounded value is out of range for input "

    .line 161
    .line 162
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p0, " and rounding mode "

    .line 169
    .line 170
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-direct {v0, p0}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    throw v0

    .line 184
    :cond_9
    const-string p0, "input is infinite or NaN"

    .line 185
    .line 186
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    return-wide v1

    .line 190
    nop

    .line 191
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_7
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(D)Z
    .locals 7

    .line 1
    invoke-static {p0, p1}, Ll/mtw0;->a(D)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmpl-double v0, p0, v2

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/mtw0;->a(D)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v3, "not a normal value"

    .line 20
    .line 21
    invoke-static {v0, v3}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p1}, Ljava/lang/Math;->getExponent(D)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    const-wide v5, 0xfffffffffffffL

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    and-long/2addr v3, v5

    .line 38
    const/16 v5, -0x3ff

    .line 39
    .line 40
    if-ne v0, v5, :cond_0

    .line 41
    .line 42
    add-long/2addr v3, v3

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-wide/high16 v5, 0x10000000000000L

    .line 45
    .line 46
    or-long/2addr v3, v5

    .line 47
    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    rsub-int/lit8 v0, v0, 0x34

    .line 52
    .line 53
    invoke-static {p0, p1}, Ljava/lang/Math;->getExponent(D)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-le v0, p0, :cond_1

    .line 58
    .line 59
    return v1

    .line 60
    :cond_1
    return v2

    .line 61
    :cond_2
    return v1
.end method
