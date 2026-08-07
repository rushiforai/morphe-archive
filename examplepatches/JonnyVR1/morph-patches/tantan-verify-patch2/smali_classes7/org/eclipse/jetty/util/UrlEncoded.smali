.class public Lorg/eclipse/jetty/util/UrlEncoded;
.super Lorg/eclipse/jetty/util/MultiMap;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final ENCODING:Ljava/lang/String;

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Lorg/eclipse/jetty/util/UrlEncoded;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const-string v0, "org.eclipse.jetty.util.UrlEncoding.charset"

    .line 10
    .line 11
    const-string v1, "UTF-8"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x6

    .line 11
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/MultiMap;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/MultiMap;-><init>(I)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/util/UrlEncoded;->decode(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x6

    .line 13
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/MultiMap;-><init>(I)V

    .line 14
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decode(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/util/UrlEncoded;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/util/MultiMap;-><init>(Lorg/eclipse/jetty/util/MultiMap;)V

    return-void
.end method

.method public static decode88591To(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;II)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    move-object v3, v1

    .line 10
    move v4, v2

    .line 11
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    if-ltz v5, :cond_d

    .line 16
    .line 17
    int-to-char v5, v5

    .line 18
    const/16 v6, 0x25

    .line 19
    .line 20
    if-eq v5, v6, :cond_9

    .line 21
    .line 22
    const/16 v6, 0x26

    .line 23
    .line 24
    if-eq v5, v6, :cond_4

    .line 25
    .line 26
    const/16 v6, 0x2b

    .line 27
    .line 28
    if-eq v5, v6, :cond_3

    .line 29
    .line 30
    const/16 v6, 0x3d

    .line 31
    .line 32
    if-eq v5, v6, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 35
    .line 36
    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto/16 :goto_6

    .line 41
    .line 42
    :cond_1
    if-eqz v3, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 45
    .line 46
    .line 47
    goto/16 :goto_3

    .line 48
    .line 49
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_3

    .line 57
    :cond_3
    const/16 v5, 0x20

    .line 58
    .line 59
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 60
    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-nez v5, :cond_5

    .line 68
    .line 69
    const-string v5, ""

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 77
    .line 78
    .line 79
    if-eqz v3, :cond_6

    .line 80
    .line 81
    invoke-virtual {p1, v3, v5}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_6
    if-eqz v5, :cond_7

    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-lez v3, :cond_7

    .line 92
    .line 93
    const-string v3, ""

    .line 94
    .line 95
    invoke-virtual {p1, v5, v3}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_7
    :goto_2
    if-lez p3, :cond_8

    .line 99
    .line 100
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/MultiMap;->size()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-le v3, p3, :cond_8

    .line 105
    .line 106
    sget-object p0, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 107
    .line 108
    const-string p2, "maxFormKeys limit exceeded keys>{}"

    .line 109
    .line 110
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-interface {p0, p2, p3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    monitor-exit p1

    .line 122
    return-void

    .line 123
    :cond_8
    move-object v3, v1

    .line 124
    goto :goto_3

    .line 125
    :cond_9
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    if-ltz v5, :cond_b

    .line 134
    .line 135
    if-gez v6, :cond_a

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_a
    int-to-byte v5, v5

    .line 139
    invoke-static {v5}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    shl-int/lit8 v5, v5, 0x4

    .line 144
    .line 145
    int-to-byte v6, v6

    .line 146
    invoke-static {v6}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    add-int/2addr v5, v6

    .line 151
    int-to-char v5, v5

    .line 152
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 153
    .line 154
    .line 155
    :cond_b
    :goto_3
    if-ltz p2, :cond_0

    .line 156
    .line 157
    add-int/lit8 v4, v4, 0x1

    .line 158
    .line 159
    if-gt v4, p2, :cond_c

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 164
    .line 165
    const-string p2, "Form too large"

    .line 166
    .line 167
    invoke-direct {p0, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    throw p0

    .line 171
    :cond_d
    if-eqz v3, :cond_f

    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-nez p0, :cond_e

    .line 178
    .line 179
    const-string p0, ""

    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    :goto_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v3, p0}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    goto :goto_5

    .line 193
    :cond_f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-lez p0, :cond_10

    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    const-string p2, ""

    .line 204
    .line 205
    invoke-virtual {p1, p0, p2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    :cond_10
    :goto_5
    monitor-exit p1

    .line 209
    return-void

    .line 210
    :goto_6
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 211
    throw p0
.end method

.method public static decodeString(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    move/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v4, p3

    .line 8
    .line 9
    const/16 v5, 0x10

    .line 10
    .line 11
    const/16 v7, 0x20

    .line 12
    .line 13
    const/16 v8, 0x2b

    .line 14
    .line 15
    const/16 v9, 0xff

    .line 16
    .line 17
    const/4 v10, 0x0

    .line 18
    const/4 v11, 0x2

    .line 19
    const/16 v12, 0x25

    .line 20
    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    invoke-static {v4}, Lorg/eclipse/jetty/util/StringUtil;->isUTF8(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    const/16 v16, 0x0

    .line 30
    .line 31
    goto/16 :goto_a

    .line 32
    .line 33
    :cond_1
    move v0, v10

    .line 34
    const/4 v13, 0x0

    .line 35
    :goto_0
    if-ge v0, v3, :cond_10

    .line 36
    .line 37
    add-int v14, v2, v0

    .line 38
    .line 39
    :try_start_0
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v15

    .line 43
    if-ltz v15, :cond_2

    .line 44
    .line 45
    if-le v15, v9, :cond_3

    .line 46
    .line 47
    :cond_2
    const/16 v16, 0x0

    .line 48
    .line 49
    goto/16 :goto_7

    .line 50
    .line 51
    :cond_3
    if-ne v15, v8, :cond_5

    .line 52
    .line 53
    if-nez v13, :cond_4

    .line 54
    .line 55
    new-instance v13, Ljava/lang/StringBuffer;

    .line 56
    .line 57
    invoke-direct {v13, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v13, v1, v2, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catch_0
    move-exception v0

    .line 65
    const/16 v16, 0x0

    .line 66
    .line 67
    goto/16 :goto_9

    .line 68
    .line 69
    :cond_4
    :goto_1
    invoke-virtual {v13, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    const/16 v16, 0x0

    .line 73
    .line 74
    goto/16 :goto_8

    .line 75
    .line 76
    :cond_5
    if-ne v15, v12, :cond_c

    .line 77
    .line 78
    const/16 v16, 0x0

    .line 79
    .line 80
    add-int/lit8 v6, v0, 0x2

    .line 81
    .line 82
    if-ge v6, v3, :cond_d

    .line 83
    .line 84
    if-nez v13, :cond_6

    .line 85
    .line 86
    :try_start_1
    new-instance v6, Ljava/lang/StringBuffer;

    .line 87
    .line 88
    invoke-direct {v6, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v1, v2, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 92
    .line 93
    .line 94
    move-object v13, v6

    .line 95
    goto :goto_2

    .line 96
    :catch_1
    move-exception v0

    .line 97
    goto/16 :goto_9

    .line 98
    .line 99
    :cond_6
    :goto_2
    new-array v6, v3, [B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    .line 101
    move v14, v0

    .line 102
    move/from16 v17, v10

    .line 103
    .line 104
    :goto_3
    if-ltz v15, :cond_a

    .line 105
    .line 106
    if-gt v15, v9, :cond_a

    .line 107
    .line 108
    if-ne v15, v12, :cond_8

    .line 109
    .line 110
    add-int/lit8 v0, v14, 0x2

    .line 111
    .line 112
    if-ge v0, v3, :cond_7

    .line 113
    .line 114
    add-int v0, v2, v14

    .line 115
    .line 116
    add-int/lit8 v0, v0, 0x1

    .line 117
    .line 118
    :try_start_2
    invoke-static {v1, v0, v11, v5}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt(Ljava/lang/String;III)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    int-to-byte v0, v0

    .line 123
    aput-byte v0, v6, v17
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    .line 124
    .line 125
    add-int/lit8 v17, v17, 0x1

    .line 126
    .line 127
    add-int/lit8 v14, v14, 0x3

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :catch_2
    move-exception v0

    .line 131
    :try_start_3
    sget-object v15, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 132
    .line 133
    invoke-interface {v15, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    add-int/lit8 v0, v17, 0x1

    .line 137
    .line 138
    aput-byte v12, v6, v17

    .line 139
    .line 140
    :goto_4
    add-int/lit8 v14, v14, 0x1

    .line 141
    .line 142
    move/from16 v17, v0

    .line 143
    .line 144
    goto :goto_5

    .line 145
    :cond_7
    add-int/lit8 v0, v17, 0x1

    .line 146
    .line 147
    aput-byte v12, v6, v17

    .line 148
    .line 149
    goto :goto_4

    .line 150
    :cond_8
    if-ne v15, v8, :cond_9

    .line 151
    .line 152
    add-int/lit8 v0, v17, 0x1

    .line 153
    .line 154
    aput-byte v7, v6, v17

    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_9
    add-int/lit8 v0, v17, 0x1

    .line 158
    .line 159
    int-to-byte v15, v15

    .line 160
    aput-byte v15, v6, v17

    .line 161
    .line 162
    goto :goto_4

    .line 163
    :goto_5
    if-lt v14, v3, :cond_b

    .line 164
    .line 165
    :cond_a
    move/from16 v0, v17

    .line 166
    .line 167
    goto :goto_6

    .line 168
    :cond_b
    add-int v0, v2, v14

    .line 169
    .line 170
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 171
    .line 172
    .line 173
    move-result v15

    .line 174
    goto :goto_3

    .line 175
    :goto_6
    add-int/lit8 v14, v14, -0x1

    .line 176
    .line 177
    new-instance v15, Ljava/lang/String;

    .line 178
    .line 179
    invoke-direct {v15, v6, v10, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v13, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 183
    .line 184
    .line 185
    move v0, v14

    .line 186
    goto :goto_8

    .line 187
    :cond_c
    const/16 v16, 0x0

    .line 188
    .line 189
    :cond_d
    if-eqz v13, :cond_f

    .line 190
    .line 191
    invoke-virtual {v13, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 192
    .line 193
    .line 194
    goto :goto_8

    .line 195
    :goto_7
    if-nez v13, :cond_e

    .line 196
    .line 197
    new-instance v13, Ljava/lang/StringBuffer;

    .line 198
    .line 199
    invoke-direct {v13, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 200
    .line 201
    .line 202
    add-int/lit8 v14, v14, 0x1

    .line 203
    .line 204
    invoke-virtual {v13, v1, v2, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 205
    .line 206
    .line 207
    goto :goto_8

    .line 208
    :cond_e
    invoke-virtual {v13, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 209
    .line 210
    .line 211
    :cond_f
    :goto_8
    add-int/lit8 v0, v0, 0x1

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_10
    const/16 v16, 0x0

    .line 216
    .line 217
    if-nez v13, :cond_12

    .line 218
    .line 219
    if-nez v2, :cond_11

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-ne v0, v3, :cond_11

    .line 226
    .line 227
    return-object v1

    .line 228
    :cond_11
    add-int v0, v2, v3

    .line 229
    .line 230
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    return-object v0

    .line 235
    :cond_12
    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1

    .line 239
    return-object v0

    .line 240
    :goto_9
    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 241
    .line 242
    .line 243
    return-object v16

    .line 244
    :goto_a
    move-object/from16 v6, v16

    .line 245
    .line 246
    :goto_b
    if-ge v10, v3, :cond_1b

    .line 247
    .line 248
    add-int v0, v2, v10

    .line 249
    .line 250
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 251
    .line 252
    .line 253
    move-result v4

    .line 254
    if-ltz v4, :cond_18

    .line 255
    .line 256
    if-le v4, v9, :cond_13

    .line 257
    .line 258
    goto :goto_c

    .line 259
    :cond_13
    if-ne v4, v8, :cond_15

    .line 260
    .line 261
    if-nez v6, :cond_14

    .line 262
    .line 263
    new-instance v6, Lorg/eclipse/jetty/util/Utf8StringBuffer;

    .line 264
    .line 265
    invoke-direct {v6, v3}, Lorg/eclipse/jetty/util/Utf8StringBuffer;-><init>(I)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    invoke-virtual {v4, v1, v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 273
    .line 274
    .line 275
    :cond_14
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 280
    .line 281
    .line 282
    goto :goto_d

    .line 283
    :cond_15
    if-ne v4, v12, :cond_17

    .line 284
    .line 285
    add-int/lit8 v13, v10, 0x2

    .line 286
    .line 287
    if-ge v13, v3, :cond_17

    .line 288
    .line 289
    if-nez v6, :cond_16

    .line 290
    .line 291
    new-instance v6, Lorg/eclipse/jetty/util/Utf8StringBuffer;

    .line 292
    .line 293
    invoke-direct {v6, v3}, Lorg/eclipse/jetty/util/Utf8StringBuffer;-><init>(I)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    invoke-virtual {v4, v1, v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 301
    .line 302
    .line 303
    :cond_16
    add-int/lit8 v0, v0, 0x1

    .line 304
    .line 305
    :try_start_4
    invoke-static {v1, v0, v11, v5}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt(Ljava/lang/String;III)I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    int-to-byte v0, v0

    .line 310
    invoke-virtual {v6, v0}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_3

    .line 311
    .line 312
    .line 313
    move v10, v13

    .line 314
    goto :goto_d

    .line 315
    :catch_3
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 320
    .line 321
    .line 322
    goto :goto_d

    .line 323
    :cond_17
    if-eqz v6, :cond_1a

    .line 324
    .line 325
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 330
    .line 331
    .line 332
    goto :goto_d

    .line 333
    :cond_18
    :goto_c
    if-nez v6, :cond_19

    .line 334
    .line 335
    new-instance v4, Lorg/eclipse/jetty/util/Utf8StringBuffer;

    .line 336
    .line 337
    invoke-direct {v4, v3}, Lorg/eclipse/jetty/util/Utf8StringBuffer;-><init>(I)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 341
    .line 342
    .line 343
    move-result-object v6

    .line 344
    add-int/lit8 v0, v0, 0x1

    .line 345
    .line 346
    invoke-virtual {v6, v1, v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 347
    .line 348
    .line 349
    move-object v6, v4

    .line 350
    goto :goto_d

    .line 351
    :cond_19
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 356
    .line 357
    .line 358
    :cond_1a
    :goto_d
    add-int/lit8 v10, v10, 0x1

    .line 359
    .line 360
    goto :goto_b

    .line 361
    :cond_1b
    if-nez v6, :cond_1d

    .line 362
    .line 363
    if-nez v2, :cond_1c

    .line 364
    .line 365
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-ne v0, v3, :cond_1c

    .line 370
    .line 371
    return-object v1

    .line 372
    :cond_1c
    add-int v0, v2, v3

    .line 373
    .line 374
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    return-object v0

    .line 379
    :cond_1d
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    return-object v0
.end method

.method public static decodeTo(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;II)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 4
    .line 5
    :cond_0
    const-string v0, "UTF-8"

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p0, p1, p3, p4}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeUtf8To(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    const-string v0, "ISO-8859-1"

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {p0, p1, p3, p4}, Lorg/eclipse/jetty/util/UrlEncoded;->decode88591To(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const-string v0, "UTF-16"

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-static {p0, p1, p3, p4}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeUtf16To(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;II)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    monitor-enter p1

    .line 42
    :try_start_0
    new-instance p4, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 43
    .line 44
    invoke-direct {p4}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    const/4 v1, 0x0

    .line 49
    move-object v2, v0

    .line 50
    move v3, v1

    .line 51
    move v4, v3

    .line 52
    move v5, v4

    .line 53
    :cond_4
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-lez v6, :cond_11

    .line 58
    .line 59
    int-to-char v7, v6

    .line 60
    const/16 v8, 0x25

    .line 61
    .line 62
    const/4 v9, 0x2

    .line 63
    const/4 v10, 0x1

    .line 64
    if-eq v7, v8, :cond_f

    .line 65
    .line 66
    const/16 v8, 0x26

    .line 67
    .line 68
    if-eq v7, v8, :cond_b

    .line 69
    .line 70
    const/16 v8, 0x2b

    .line 71
    .line 72
    if-eq v7, v8, :cond_a

    .line 73
    .line 74
    const/16 v8, 0x3d

    .line 75
    .line 76
    if-eq v7, v8, :cond_7

    .line 77
    .line 78
    if-ne v3, v9, :cond_5

    .line 79
    .line 80
    int-to-byte v3, v6

    .line 81
    invoke-static {v3}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    move v3, v10

    .line 86
    goto :goto_4

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    goto/16 :goto_7

    .line 89
    .line 90
    :cond_5
    if-ne v3, v10, :cond_6

    .line 91
    .line 92
    shl-int/lit8 v3, v4, 0x4

    .line 93
    .line 94
    int-to-byte v6, v6

    .line 95
    invoke-static {v6}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    add-int/2addr v3, v6

    .line 100
    invoke-virtual {p4, v3}, Ljava/io/OutputStream;->write(I)V

    .line 101
    .line 102
    .line 103
    move v3, v1

    .line 104
    goto :goto_4

    .line 105
    :cond_6
    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 106
    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_7
    if-eqz v2, :cond_8

    .line 110
    .line 111
    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 112
    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_8
    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-nez v2, :cond_9

    .line 120
    .line 121
    const-string v2, ""

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_9
    invoke-virtual {p4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    :goto_1
    invoke-virtual {p4, v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->setCount(I)V

    .line 129
    .line 130
    .line 131
    goto :goto_4

    .line 132
    :cond_a
    const/16 v6, 0x20

    .line 133
    .line 134
    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    .line 135
    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_b
    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    if-nez v6, :cond_c

    .line 143
    .line 144
    const-string v6, ""

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_c
    invoke-virtual {p4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    :goto_2
    invoke-virtual {p4, v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->setCount(I)V

    .line 152
    .line 153
    .line 154
    if-eqz v2, :cond_d

    .line 155
    .line 156
    invoke-virtual {p1, v2, v6}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_d
    if-eqz v6, :cond_e

    .line 161
    .line 162
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-lez v2, :cond_e

    .line 167
    .line 168
    const-string v2, ""

    .line 169
    .line 170
    invoke-virtual {p1, v6, v2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    :cond_e
    :goto_3
    move-object v2, v0

    .line 174
    goto :goto_4

    .line 175
    :cond_f
    move v3, v9

    .line 176
    :goto_4
    add-int/2addr v5, v10

    .line 177
    if-ltz p3, :cond_4

    .line 178
    .line 179
    if-gt v5, p3, :cond_10

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_10
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 184
    .line 185
    const-string p2, "Form too large"

    .line 186
    .line 187
    invoke-direct {p0, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    throw p0

    .line 191
    :cond_11
    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    if-eqz v2, :cond_13

    .line 196
    .line 197
    if-nez p0, :cond_12

    .line 198
    .line 199
    const-string p0, ""

    .line 200
    .line 201
    goto :goto_5

    .line 202
    :cond_12
    invoke-virtual {p4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    :goto_5
    invoke-virtual {p4, v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->setCount(I)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, v2, p0}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    goto :goto_6

    .line 213
    :cond_13
    if-lez p0, :cond_14

    .line 214
    .line 215
    invoke-virtual {p4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    const-string p2, ""

    .line 220
    .line 221
    invoke-virtual {p1, p0, p2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    :cond_14
    :goto_6
    monitor-exit p1

    .line 225
    return-void

    .line 226
    :goto_7
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    throw p0
.end method

.method public static decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    .line 248
    invoke-static {p0, p1, p2, v0}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;I)V

    return-void
.end method

.method public static decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;I)V
    .locals 9

    if-nez p2, :cond_0

    .line 228
    sget-object p2, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 229
    :cond_0
    monitor-enter p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, -0x1

    move-object v4, v0

    move v3, v1

    move v5, v3

    .line 230
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ge v3, v6, :cond_b

    .line 231
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v8, 0x25

    if-eq v6, v8, :cond_4

    const/16 v8, 0x26

    if-eq v6, v8, :cond_5

    const/16 v8, 0x2b

    if-eq v6, v8, :cond_4

    const/16 v8, 0x3d

    if-eq v6, v8, :cond_1

    goto/16 :goto_5

    :cond_1
    if-eqz v4, :cond_2

    goto/16 :goto_5

    :cond_2
    if-eqz v5, :cond_3

    add-int/lit8 v4, v2, 0x1

    sub-int v2, v3, v2

    sub-int/2addr v2, v7

    .line 232
    invoke-static {p0, v4, v2, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeString(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_1
    move-object v4, v2

    goto :goto_2

    :catchall_0
    move-exception p0

    goto/16 :goto_9

    :cond_3
    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :goto_2
    move v5, v1

    move v2, v3

    goto :goto_5

    :cond_4
    move v5, v7

    goto :goto_5

    :cond_5
    sub-int v6, v3, v2

    sub-int/2addr v6, v7

    if-nez v6, :cond_6

    .line 233
    const-string v2, ""

    goto :goto_3

    :cond_6
    add-int/lit8 v2, v2, 0x1

    if-eqz v5, :cond_7

    invoke-static {p0, v2, v6, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeString(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    :cond_7
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :goto_3
    if-eqz v4, :cond_8

    .line 234
    invoke-virtual {p1, v4, v2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4

    :cond_8
    if-eqz v2, :cond_9

    .line 235
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_9

    .line 236
    const-string v4, ""

    invoke-virtual {p1, v2, v4}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_9
    :goto_4
    if-lez p3, :cond_a

    .line 237
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/MultiMap;->size()I

    move-result v2

    if-le v2, p3, :cond_a

    .line 238
    sget-object p0, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    const-string p2, "maxFormKeys limit exceeded keys>{}"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p0, p2, p3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 239
    monitor-exit p1

    return-void

    :cond_a
    move-object v4, v0

    goto :goto_2

    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_b
    if-eqz v4, :cond_e

    .line 240
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    sub-int/2addr p3, v2

    sub-int/2addr p3, v7

    if-nez p3, :cond_c

    .line 241
    const-string p0, ""

    goto :goto_6

    :cond_c
    add-int/2addr v2, v7

    if-eqz v5, :cond_d

    invoke-static {p0, v2, p3, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeString(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_6

    :cond_d
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 242
    :goto_6
    invoke-virtual {p1, v4, p0}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_8

    .line 243
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    if-ge v2, p3, :cond_10

    if-eqz v5, :cond_f

    add-int/lit8 p3, v2, 0x1

    .line 244
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v2

    sub-int/2addr v0, v7

    invoke-static {p0, p3, v0, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeString(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_7

    :cond_f
    add-int/2addr v2, v7

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :goto_7
    if-eqz p0, :cond_10

    .line 245
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_10

    .line 246
    const-string p2, ""

    invoke-virtual {p1, p0, p2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 247
    :cond_10
    :goto_8
    monitor-exit p1

    return-void

    :goto_9
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static decodeUtf16To(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;II)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/InputStreamReader;

    .line 2
    .line 3
    const-string v1, "UTF-16"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/io/StringWriter;

    .line 9
    .line 10
    const/16 v1, 0x2000

    .line 11
    .line 12
    invoke-direct {p0, v1}, Ljava/io/StringWriter;-><init>(I)V

    .line 13
    .line 14
    .line 15
    int-to-long v1, p2

    .line 16
    invoke-static {v0, p0, v1, v2}, Lorg/eclipse/jetty/util/IO;->copy(Ljava/io/Reader;Ljava/io/Writer;J)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object p2, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, p1, p2, p3}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static decodeUtf8To(Ljava/io/InputStream;Lorg/eclipse/jetty/util/MultiMap;II)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :try_start_0
    new-instance v0, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    .line 3
    .line 4
    invoke-direct {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    move v4, v1

    .line 10
    move-object v3, v2

    .line 11
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 12
    .line 13
    .line 14
    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    if-ltz v5, :cond_d

    .line 16
    .line 17
    int-to-char v6, v5

    .line 18
    const/16 v7, 0x25

    .line 19
    .line 20
    if-eq v6, v7, :cond_9

    .line 21
    .line 22
    const/16 v7, 0x26

    .line 23
    .line 24
    if-eq v6, v7, :cond_4

    .line 25
    .line 26
    const/16 v7, 0x2b

    .line 27
    .line 28
    if-eq v6, v7, :cond_3

    .line 29
    .line 30
    const/16 v7, 0x3d

    .line 31
    .line 32
    if-eq v6, v7, :cond_1

    .line 33
    .line 34
    int-to-byte v5, v5

    .line 35
    :try_start_1
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V

    .line 36
    .line 37
    .line 38
    goto/16 :goto_4

    .line 39
    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto/16 :goto_7

    .line 42
    .line 43
    :catch_0
    move-exception v5

    .line 44
    goto/16 :goto_3

    .line 45
    .line 46
    :cond_1
    if-eqz v3, :cond_2

    .line 47
    .line 48
    int-to-byte v5, v5

    .line 49
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_2
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 59
    .line 60
    .line 61
    goto/16 :goto_4

    .line 62
    .line 63
    :cond_3
    const/16 v5, 0x20

    .line 64
    .line 65
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V

    .line 66
    .line 67
    .line 68
    goto/16 :goto_4

    .line 69
    .line 70
    :cond_4
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->length()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-nez v5, :cond_5

    .line 75
    .line 76
    const-string v5, ""

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_5
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    :goto_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 84
    .line 85
    .line 86
    if-eqz v3, :cond_6

    .line 87
    .line 88
    invoke-virtual {p1, v3, v5}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_6
    if-eqz v5, :cond_7

    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-lez v6, :cond_7

    .line 99
    .line 100
    const-string v6, ""

    .line 101
    .line 102
    invoke-virtual {p1, v5, v6}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/eclipse/jetty/util/Utf8Appendable$NotUtf8Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    .line 104
    .line 105
    :cond_7
    :goto_2
    if-lez p3, :cond_8

    .line 106
    .line 107
    :try_start_2
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/MultiMap;->size()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-le v3, p3, :cond_8

    .line 112
    .line 113
    sget-object v3, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 114
    .line 115
    const-string v5, "maxFormKeys limit exceeded keys>{}"

    .line 116
    .line 117
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    invoke-interface {v3, v5, v6}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catch Lorg/eclipse/jetty/util/Utf8Appendable$NotUtf8Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    .line 127
    .line 128
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 129
    return-void

    .line 130
    :catch_1
    move-exception v5

    .line 131
    move-object v3, v2

    .line 132
    goto :goto_3

    .line 133
    :cond_8
    move-object v3, v2

    .line 134
    goto :goto_4

    .line 135
    :cond_9
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-ltz v5, :cond_b

    .line 144
    .line 145
    if-gez v6, :cond_a

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_a
    int-to-byte v5, v5

    .line 149
    invoke-static {v5}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    shl-int/lit8 v5, v5, 0x4

    .line 154
    .line 155
    int-to-byte v6, v6

    .line 156
    invoke-static {v6}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    add-int/2addr v5, v6

    .line 161
    int-to-byte v5, v5

    .line 162
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V
    :try_end_4
    .catch Lorg/eclipse/jetty/util/Utf8Appendable$NotUtf8Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 163
    .line 164
    .line 165
    goto :goto_4

    .line 166
    :goto_3
    :try_start_5
    sget-object v6, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 167
    .line 168
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    new-array v8, v1, [Ljava/lang/Object;

    .line 173
    .line 174
    invoke-interface {v6, v7, v8}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    invoke-interface {v6, v5}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 178
    .line 179
    .line 180
    :cond_b
    :goto_4
    if-ltz p2, :cond_0

    .line 181
    .line 182
    add-int/lit8 v4, v4, 0x1

    .line 183
    .line 184
    if-gt v4, p2, :cond_c

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 189
    .line 190
    const-string p2, "Form too large"

    .line 191
    .line 192
    invoke-direct {p0, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    throw p0

    .line 196
    :cond_d
    if-eqz v3, :cond_f

    .line 197
    .line 198
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->length()I

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-nez p0, :cond_e

    .line 203
    .line 204
    const-string p0, ""

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_e
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    :goto_5
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1, v3, p0}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    goto :goto_6

    .line 218
    :cond_f
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->length()I

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-lez p0, :cond_10

    .line 223
    .line 224
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    const-string p2, ""

    .line 229
    .line 230
    invoke-virtual {p1, p0, p2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    :cond_10
    :goto_6
    monitor-exit p1

    .line 234
    return-void

    .line 235
    :goto_7
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 236
    throw p0
.end method

.method public static decodeUtf8To([BIILorg/eclipse/jetty/util/MultiMap;)V
    .locals 1

    .line 258
    new-instance v0, Lorg/eclipse/jetty/util/Utf8StringBuilder;

    invoke-direct {v0}, Lorg/eclipse/jetty/util/Utf8StringBuilder;-><init>()V

    invoke-static {p0, p1, p2, p3, v0}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeUtf8To([BIILorg/eclipse/jetty/util/MultiMap;Lorg/eclipse/jetty/util/Utf8StringBuilder;)V

    return-void
.end method

.method public static decodeUtf8To([BIILorg/eclipse/jetty/util/MultiMap;Lorg/eclipse/jetty/util/Utf8StringBuilder;)V
    .locals 7

    .line 237
    monitor-enter p3

    add-int/2addr p2, p1

    const/4 v0, 0x0

    move-object v1, v0

    :goto_0
    if-ge p1, p2, :cond_9

    .line 238
    :try_start_0
    aget-byte v2, p0, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/lit16 v3, v2, 0xff

    int-to-char v3, v3

    const/16 v4, 0x25

    if-eq v3, v4, :cond_7

    const/16 v4, 0x26

    if-eq v3, v4, :cond_3

    const/16 v4, 0x2b

    if-eq v3, v4, :cond_2

    const/16 v4, 0x3d

    if-eq v3, v4, :cond_0

    .line 239
    :try_start_1
    invoke-virtual {p4, v2}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V

    goto/16 :goto_4

    :catchall_0
    move-exception p0

    goto/16 :goto_7

    :catch_0
    move-exception v2

    goto :goto_3

    :cond_0
    if-eqz v1, :cond_1

    .line 240
    invoke-virtual {p4, v2}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V

    goto :goto_4

    .line 241
    :cond_1
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 242
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    goto :goto_4

    :cond_2
    const/16 v2, 0x20

    .line 243
    invoke-virtual {p4, v2}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V

    goto :goto_4

    .line 244
    :cond_3
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_4

    const-string v2, ""

    goto :goto_1

    :cond_4
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 245
    :goto_1
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    if-eqz v1, :cond_5

    .line 246
    invoke-virtual {p3, v1, v2}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    :cond_5
    if-eqz v2, :cond_6

    .line 247
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    .line 248
    const-string v3, ""

    invoke-virtual {p3, v2, v3}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/eclipse/jetty/util/Utf8Appendable$NotUtf8Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_6
    :goto_2
    move-object v1, v0

    goto :goto_4

    :cond_7
    add-int/lit8 v2, p1, 0x2

    if-ge v2, p2, :cond_8

    add-int/lit8 v2, p1, 0x1

    .line 249
    :try_start_2
    aget-byte v3, p0, v2

    invoke-static {v3}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    move-result v2
    :try_end_2
    .catch Lorg/eclipse/jetty/util/Utf8Appendable$NotUtf8Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    shl-int/lit8 v2, v2, 0x4

    add-int/lit8 p1, p1, 0x2

    :try_start_3
    aget-byte v3, p0, p1

    invoke-static {v3}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    move-result v3

    add-int/2addr v2, v3

    int-to-byte v2, v2

    invoke-virtual {p4, v2}, Lorg/eclipse/jetty/util/Utf8Appendable;->append(B)V
    :try_end_3
    .catch Lorg/eclipse/jetty/util/Utf8Appendable$NotUtf8Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :catch_1
    move-exception p1

    move v6, v2

    move-object v2, p1

    move p1, v6

    .line 250
    :goto_3
    :try_start_4
    sget-object v3, Lorg/eclipse/jetty/util/UrlEncoded;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 251
    invoke-interface {v3, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    :cond_8
    :goto_4
    add-int/lit8 p1, p1, 0x1

    goto/16 :goto_0

    :cond_9
    if-eqz v1, :cond_b

    .line 252
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_a

    const-string p0, ""

    goto :goto_5

    :cond_a
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 253
    :goto_5
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->reset()V

    .line 254
    invoke-virtual {p3, v1, p0}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6

    .line 255
    :cond_b
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_c

    .line 256
    invoke-virtual {p4}, Lorg/eclipse/jetty/util/Utf8StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, ""

    invoke-virtual {p3, p0, p1}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 257
    :cond_c
    :goto_6
    monitor-exit p3

    return-void

    :goto_7
    monitor-exit p3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0
.end method

.method public static encode(Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 4
    .line 5
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const/16 v1, 0x80

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiMap;->entrySet()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_8

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/util/Map$Entry;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/16 v4, 0x26

    .line 49
    .line 50
    const/16 v5, 0x3d

    .line 51
    .line 52
    if-nez v3, :cond_2

    .line 53
    .line 54
    invoke-static {v2, p1}, Lorg/eclipse/jetty/util/UrlEncoded;->encodeString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    if-eqz p2, :cond_7

    .line 62
    .line 63
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_2
    const/4 v6, 0x0

    .line 68
    :goto_1
    if-ge v6, v3, :cond_7

    .line 69
    .line 70
    if-lez v6, :cond_3

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-static {v1, v6}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    invoke-static {v2, p1}, Lorg/eclipse/jetty/util/UrlEncoded;->encodeString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    if-eqz v7, :cond_5

    .line 87
    .line 88
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    if-lez v8, :cond_4

    .line 97
    .line 98
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-static {v7, p1}, Lorg/eclipse/jetty/util/UrlEncoded;->encodeString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    if-eqz p2, :cond_6

    .line 110
    .line 111
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_5
    if-eqz p2, :cond_6

    .line 116
    .line 117
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    :cond_6
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_7
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_1

    .line 128
    .line 129
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    return-object p0
.end method

.method public static encodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 142
    sget-object v0, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    invoke-static {p0, v0}, Lorg/eclipse/jetty/util/UrlEncoded;->encodeString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encodeString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 4
    .line 5
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    array-length v1, v0

    .line 15
    array-length v2, v0

    .line 16
    mul-int/lit8 v2, v2, 0x3

    .line 17
    .line 18
    new-array v2, v2, [B

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x1

    .line 22
    move v5, v3

    .line 23
    move v6, v5

    .line 24
    :goto_1
    if-ge v5, v1, :cond_8

    .line 25
    .line 26
    aget-byte v7, v0, v5

    .line 27
    .line 28
    const/16 v8, 0x20

    .line 29
    .line 30
    if-ne v7, v8, :cond_1

    .line 31
    .line 32
    add-int/lit8 v4, v6, 0x1

    .line 33
    .line 34
    const/16 v7, 0x2b

    .line 35
    .line 36
    aput-byte v7, v2, v6

    .line 37
    .line 38
    move v6, v4

    .line 39
    move v4, v3

    .line 40
    goto :goto_4

    .line 41
    :cond_1
    const/16 v8, 0x61

    .line 42
    .line 43
    if-lt v7, v8, :cond_2

    .line 44
    .line 45
    const/16 v8, 0x7a

    .line 46
    .line 47
    if-le v7, v8, :cond_4

    .line 48
    .line 49
    :cond_2
    const/16 v8, 0x41

    .line 50
    .line 51
    if-lt v7, v8, :cond_3

    .line 52
    .line 53
    const/16 v8, 0x5a

    .line 54
    .line 55
    if-le v7, v8, :cond_4

    .line 56
    .line 57
    :cond_3
    const/16 v8, 0x30

    .line 58
    .line 59
    if-lt v7, v8, :cond_5

    .line 60
    .line 61
    const/16 v8, 0x39

    .line 62
    .line 63
    if-gt v7, v8, :cond_5

    .line 64
    .line 65
    :cond_4
    add-int/lit8 v8, v6, 0x1

    .line 66
    .line 67
    aput-byte v7, v2, v6

    .line 68
    .line 69
    move v6, v8

    .line 70
    goto :goto_4

    .line 71
    :cond_5
    add-int/lit8 v4, v6, 0x1

    .line 72
    .line 73
    const/16 v8, 0x25

    .line 74
    .line 75
    aput-byte v8, v2, v6

    .line 76
    .line 77
    and-int/lit16 v8, v7, 0xf0

    .line 78
    .line 79
    shr-int/lit8 v8, v8, 0x4

    .line 80
    .line 81
    int-to-byte v8, v8

    .line 82
    const/16 v9, 0xa

    .line 83
    .line 84
    if-lt v8, v9, :cond_6

    .line 85
    .line 86
    add-int/lit8 v6, v6, 0x2

    .line 87
    .line 88
    add-int/lit8 v8, v8, 0x37

    .line 89
    .line 90
    int-to-byte v8, v8

    .line 91
    aput-byte v8, v2, v4

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_6
    add-int/lit8 v6, v6, 0x2

    .line 95
    .line 96
    add-int/lit8 v8, v8, 0x30

    .line 97
    .line 98
    int-to-byte v8, v8

    .line 99
    aput-byte v8, v2, v4

    .line 100
    .line 101
    :goto_2
    and-int/lit8 v4, v7, 0xf

    .line 102
    .line 103
    int-to-byte v4, v4

    .line 104
    if-lt v4, v9, :cond_7

    .line 105
    .line 106
    add-int/lit8 v7, v6, 0x1

    .line 107
    .line 108
    add-int/lit8 v4, v4, 0x37

    .line 109
    .line 110
    int-to-byte v4, v4

    .line 111
    aput-byte v4, v2, v6

    .line 112
    .line 113
    :goto_3
    move v4, v3

    .line 114
    move v6, v7

    .line 115
    goto :goto_4

    .line 116
    :cond_7
    add-int/lit8 v7, v6, 0x1

    .line 117
    .line 118
    add-int/lit8 v4, v4, 0x30

    .line 119
    .line 120
    int-to-byte v4, v4

    .line 121
    aput-byte v4, v2, v6

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_8
    if-eqz v4, :cond_9

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_9
    :try_start_1
    new-instance p0, Ljava/lang/String;

    .line 131
    .line 132
    invoke-direct {p0, v2, v3, v6, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 133
    .line 134
    .line 135
    return-object p0

    .line 136
    :catch_1
    new-instance p0, Ljava/lang/String;

    .line 137
    .line 138
    invoke-direct {p0, v2, v3, v6}, Ljava/lang/String;-><init>([BII)V

    .line 139
    .line 140
    .line 141
    return-object p0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Lorg/eclipse/jetty/util/UrlEncoded;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/util/UrlEncoded;-><init>(Lorg/eclipse/jetty/util/UrlEncoded;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public decode(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-static {p1, p0, v0, v1}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public decode(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    .line 8
    invoke-static {p1, p0, p2, v0}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;I)V

    return-void
.end method

.method public encode()Ljava/lang/String;
    .locals 2

    .line 140
    sget-object v0, Lorg/eclipse/jetty/util/UrlEncoded;->ENCODING:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/UrlEncoded;->encode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 138
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/util/UrlEncoded;->encode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public declared-synchronized encode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 0

    monitor-enter p0

    .line 139
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->encode(Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
