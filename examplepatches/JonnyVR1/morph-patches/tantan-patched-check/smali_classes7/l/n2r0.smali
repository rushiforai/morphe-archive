.class public Ll/n2r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:[C

.field private static final b:[C

.field private static final c:[C

.field private static final d:[C

.field private static final e:[C

.field private static f:Ljava/util/Random;

.field private static g:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "&quot;"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/n2r0;->a:[C

    .line 8
    .line 9
    const-string v0, "&apos;"

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/n2r0;->b:[C

    .line 16
    .line 17
    const-string v0, "&amp;"

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/n2r0;->c:[C

    .line 24
    .line 25
    const-string v0, "&lt;"

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll/n2r0;->d:[C

    .line 32
    .line 33
    const-string v0, "&gt;"

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Ll/n2r0;->e:[C

    .line 40
    .line 41
    new-instance v0, Ljava/util/Random;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 44
    .line 45
    .line 46
    sput-object v0, Ll/n2r0;->f:Ljava/util/Random;

    .line 47
    .line 48
    const-string v0, "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ll/n2r0;->g:[C

    .line 55
    .line 56
    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ge p0, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :cond_0
    new-array v0, p0, [C

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, p0, :cond_1

    .line 10
    .line 11
    sget-object v2, Ll/n2r0;->g:[C

    .line 12
    .line 13
    sget-object v3, Ll/n2r0;->f:Ljava/util/Random;

    .line 14
    .line 15
    const/16 v4, 0x47

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    aget-char v2, v2, v3

    .line 22
    .line 23
    aput-char v2, v0, v1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance p0, Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    array-length v1, v0

    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    int-to-double v3, v1

    .line 13
    const-wide v5, 0x3ff4cccccccccccdL    # 1.3

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-double/2addr v3, v5

    .line 19
    double-to-int v3, v3

    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 21
    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    move v4, v3

    .line 25
    :goto_0
    if-ge v3, v1, :cond_d

    .line 26
    .line 27
    aget-char v5, v0, v3

    .line 28
    .line 29
    const/16 v6, 0x3e

    .line 30
    .line 31
    if-le v5, v6, :cond_1

    .line 32
    .line 33
    goto/16 :goto_1

    .line 34
    .line 35
    :cond_1
    const/16 v7, 0x3c

    .line 36
    .line 37
    if-ne v5, v7, :cond_3

    .line 38
    .line 39
    if-le v3, v4, :cond_2

    .line 40
    .line 41
    sub-int v5, v3, v4

    .line 42
    .line 43
    invoke-virtual {v2, v0, v4, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    :cond_2
    add-int/lit8 v4, v3, 0x1

    .line 47
    .line 48
    sget-object v5, Ll/n2r0;->d:[C

    .line 49
    .line 50
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_3
    if-ne v5, v6, :cond_5

    .line 56
    .line 57
    if-le v3, v4, :cond_4

    .line 58
    .line 59
    sub-int v5, v3, v4

    .line 60
    .line 61
    invoke-virtual {v2, v0, v4, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :cond_4
    add-int/lit8 v4, v3, 0x1

    .line 65
    .line 66
    sget-object v5, Ll/n2r0;->e:[C

    .line 67
    .line 68
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    const/16 v6, 0x26

    .line 73
    .line 74
    if-ne v5, v6, :cond_8

    .line 75
    .line 76
    if-le v3, v4, :cond_6

    .line 77
    .line 78
    sub-int v5, v3, v4

    .line 79
    .line 80
    invoke-virtual {v2, v0, v4, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    :cond_6
    add-int/lit8 v5, v3, 0x5

    .line 84
    .line 85
    if-le v1, v5, :cond_7

    .line 86
    .line 87
    add-int/lit8 v6, v3, 0x1

    .line 88
    .line 89
    aget-char v6, v0, v6

    .line 90
    .line 91
    const/16 v7, 0x23

    .line 92
    .line 93
    if-ne v6, v7, :cond_7

    .line 94
    .line 95
    add-int/lit8 v6, v3, 0x2

    .line 96
    .line 97
    aget-char v6, v0, v6

    .line 98
    .line 99
    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    if-eqz v6, :cond_7

    .line 104
    .line 105
    add-int/lit8 v6, v3, 0x3

    .line 106
    .line 107
    aget-char v6, v0, v6

    .line 108
    .line 109
    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    if-eqz v6, :cond_7

    .line 114
    .line 115
    add-int/lit8 v6, v3, 0x4

    .line 116
    .line 117
    aget-char v6, v0, v6

    .line 118
    .line 119
    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    if-eqz v6, :cond_7

    .line 124
    .line 125
    aget-char v5, v0, v5

    .line 126
    .line 127
    const/16 v6, 0x3b

    .line 128
    .line 129
    if-eq v5, v6, :cond_c

    .line 130
    .line 131
    :cond_7
    add-int/lit8 v4, v3, 0x1

    .line 132
    .line 133
    sget-object v5, Ll/n2r0;->c:[C

    .line 134
    .line 135
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_8
    const/16 v6, 0x22

    .line 140
    .line 141
    if-ne v5, v6, :cond_a

    .line 142
    .line 143
    if-le v3, v4, :cond_9

    .line 144
    .line 145
    sub-int v5, v3, v4

    .line 146
    .line 147
    invoke-virtual {v2, v0, v4, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    :cond_9
    add-int/lit8 v4, v3, 0x1

    .line 151
    .line 152
    sget-object v5, Ll/n2r0;->a:[C

    .line 153
    .line 154
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_a
    const/16 v6, 0x27

    .line 159
    .line 160
    if-ne v5, v6, :cond_c

    .line 161
    .line 162
    if-le v3, v4, :cond_b

    .line 163
    .line 164
    sub-int v5, v3, v4

    .line 165
    .line 166
    invoke-virtual {v2, v0, v4, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    :cond_b
    add-int/lit8 v4, v3, 0x1

    .line 170
    .line 171
    sget-object v5, Ll/n2r0;->b:[C

    .line 172
    .line 173
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    :cond_c
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_d
    if-nez v4, :cond_e

    .line 181
    .line 182
    return-object p0

    .line 183
    :cond_e
    if-le v3, v4, :cond_f

    .line 184
    .line 185
    sub-int/2addr v3, v4

    .line 186
    invoke-virtual {v2, v0, v4, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    :cond_f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    return-object p0
.end method

.method public static final c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ltz v1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    new-instance v4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    array-length v5, v2

    .line 27
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4, v2, v0, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    add-int/2addr v1, v3

    .line 37
    :goto_0
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-lez v0, :cond_1

    .line 42
    .line 43
    sub-int v5, v0, v1

    .line 44
    .line 45
    invoke-virtual {v4, v2, v1, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    add-int v1, v0, v3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    array-length p0, v2

    .line 55
    sub-int/2addr p0, v1

    .line 56
    invoke-virtual {v4, v2, v1, p0}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    :cond_2
    return-object p0
.end method

.method public static d([B)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ptq0;->e([B)[C

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static final e(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "&lt;"

    .line 2
    .line 3
    const-string v1, "<"

    .line 4
    .line 5
    invoke-static {p0, v0, v1}, Ll/n2r0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "&gt;"

    .line 10
    .line 11
    const-string v1, ">"

    .line 12
    .line 13
    invoke-static {p0, v0, v1}, Ll/n2r0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "&quot;"

    .line 18
    .line 19
    const-string v1, "\""

    .line 20
    .line 21
    invoke-static {p0, v0, v1}, Ll/n2r0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "&apos;"

    .line 26
    .line 27
    const-string v1, "\'"

    .line 28
    .line 29
    invoke-static {p0, v0, v1}, Ll/n2r0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "&amp;"

    .line 34
    .line 35
    const-string v1, "&"

    .line 36
    .line 37
    invoke-static {p0, v0, v1}, Ll/n2r0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method
