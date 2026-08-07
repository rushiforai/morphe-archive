.class public Lcom/alibaba/sdk/android/oss/common/utils/StringUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final UTF8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "utf-8"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/alibaba/sdk/android/oss/common/utils/StringUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public static join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    add-int/lit8 v3, v3, -0x1

    .line 31
    .line 32
    if-ge v2, v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static varargs join(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 46
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 47
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    array-length v0, p1

    .line 2
    array-length v1, p2

    .line 3
    invoke-static {p0}, Lcom/alibaba/sdk/android/oss/common/utils/StringUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-nez v2, :cond_13

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_8

    .line 14
    .line 15
    :cond_0
    if-ne v0, v1, :cond_12

    .line 16
    .line 17
    new-array v1, v0, [Z

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, -0x1

    .line 21
    move v4, v2

    .line 22
    move v5, v3

    .line 23
    move v6, v5

    .line 24
    :goto_0
    const/4 v7, 0x1

    .line 25
    if-ge v4, v0, :cond_5

    .line 26
    .line 27
    aget-boolean v8, v1, v4

    .line 28
    .line 29
    if-nez v8, :cond_4

    .line 30
    .line 31
    aget-object v8, p1, v4

    .line 32
    .line 33
    invoke-static {v8}, Lcom/alibaba/sdk/android/oss/common/utils/StringUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    if-nez v8, :cond_4

    .line 38
    .line 39
    aget-object v8, p2, v4

    .line 40
    .line 41
    if-nez v8, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    aget-object v8, p1, v4

    .line 45
    .line 46
    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    if-ne v8, v3, :cond_2

    .line 51
    .line 52
    aput-boolean v7, v1, v4

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    if-eq v5, v3, :cond_3

    .line 56
    .line 57
    if-ge v8, v5, :cond_4

    .line 58
    .line 59
    :cond_3
    move v6, v4

    .line 60
    move v5, v8

    .line 61
    :cond_4
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_5
    if-ne v5, v3, :cond_6

    .line 65
    .line 66
    goto/16 :goto_8

    .line 67
    .line 68
    :cond_6
    move v4, v2

    .line 69
    move v8, v4

    .line 70
    :goto_2
    array-length v9, p1

    .line 71
    if-ge v4, v9, :cond_9

    .line 72
    .line 73
    aget-object v9, p1, v4

    .line 74
    .line 75
    if-eqz v9, :cond_8

    .line 76
    .line 77
    aget-object v9, p2, v4

    .line 78
    .line 79
    if-nez v9, :cond_7

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_7
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    aget-object v10, p1, v4

    .line 87
    .line 88
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    sub-int/2addr v9, v10

    .line 93
    if-lez v9, :cond_8

    .line 94
    .line 95
    mul-int/lit8 v9, v9, 0x3

    .line 96
    .line 97
    add-int/2addr v8, v9

    .line 98
    :cond_8
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    div-int/lit8 v4, v4, 0x5

    .line 106
    .line 107
    invoke-static {v8, v4}, Ljava/lang/Math;->min(II)I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    new-instance v8, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    add-int/2addr v9, v4

    .line 118
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 119
    .line 120
    .line 121
    move v4, v2

    .line 122
    :cond_a
    if-eq v5, v3, :cond_10

    .line 123
    .line 124
    :goto_4
    if-ge v4, v5, :cond_b

    .line 125
    .line 126
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 127
    .line 128
    .line 129
    move-result v9

    .line 130
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    add-int/lit8 v4, v4, 0x1

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_b
    aget-object v4, p2, v6

    .line 137
    .line 138
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    aget-object v4, p1, v6

    .line 142
    .line 143
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    add-int/2addr v4, v5

    .line 148
    move v9, v2

    .line 149
    move v5, v3

    .line 150
    move v6, v5

    .line 151
    :goto_5
    if-ge v9, v0, :cond_a

    .line 152
    .line 153
    aget-boolean v10, v1, v9

    .line 154
    .line 155
    if-nez v10, :cond_f

    .line 156
    .line 157
    aget-object v10, p1, v9

    .line 158
    .line 159
    if-eqz v10, :cond_f

    .line 160
    .line 161
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    .line 162
    .line 163
    .line 164
    move-result v10

    .line 165
    if-nez v10, :cond_f

    .line 166
    .line 167
    aget-object v10, p2, v9

    .line 168
    .line 169
    if-nez v10, :cond_c

    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_c
    aget-object v10, p1, v9

    .line 173
    .line 174
    invoke-virtual {p0, v10, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 175
    .line 176
    .line 177
    move-result v10

    .line 178
    if-ne v10, v3, :cond_d

    .line 179
    .line 180
    aput-boolean v7, v1, v9

    .line 181
    .line 182
    goto :goto_6

    .line 183
    :cond_d
    if-eq v5, v3, :cond_e

    .line 184
    .line 185
    if-ge v10, v5, :cond_f

    .line 186
    .line 187
    :cond_e
    move v6, v9

    .line 188
    move v5, v10

    .line 189
    :cond_f
    :goto_6
    add-int/lit8 v9, v9, 0x1

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    :goto_7
    if-ge v4, p1, :cond_11

    .line 197
    .line 198
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    add-int/lit8 v4, v4, 0x1

    .line 206
    .line 207
    goto :goto_7

    .line 208
    :cond_11
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    return-object p0

    .line 213
    :cond_12
    const-string p0, "Search and Replace array lengths don\'t match: "

    .line 214
    .line 215
    const-string p1, " vs "

    .line 216
    .line 217
    invoke-static {p0, v0, p1, v1}, Ll/itq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 218
    .line 219
    .line 220
    const/4 p0, 0x0

    .line 221
    :cond_13
    :goto_8
    return-object p0
.end method

.method public static trim(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
