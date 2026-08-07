.class public Lcom/xiaomi/push/l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Lorg/xmlpull/v1/XmlPullParser;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static a(Lorg/xmlpull/v1/XmlPullParser;Ll/u1r0;)Lcom/xiaomi/push/j;
    .locals 13

    .line 1
    const-string v0, "id"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-interface {p0, v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v2, "to"

    .line 10
    .line 11
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "from"

    .line 16
    .line 17
    invoke-interface {p0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "chid"

    .line 22
    .line 23
    invoke-interface {p0, v1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v5, "type"

    .line 28
    .line 29
    invoke-interface {p0, v1, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-static {v5}, Lcom/xiaomi/push/j$a;->a(Ljava/lang/String;)Lcom/xiaomi/push/j$a;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    new-instance v6, Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    move v8, v7

    .line 44
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    if-ge v8, v9, :cond_0

    .line 49
    .line 50
    invoke-interface {p0, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v9

    .line 54
    invoke-interface {p0, v1, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    invoke-virtual {v6, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    add-int/lit8 v8, v8, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const/4 v1, 0x0

    .line 65
    move-object v8, v1

    .line 66
    move-object v9, v8

    .line 67
    :cond_1
    :goto_1
    if-nez v7, :cond_4

    .line 68
    .line 69
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    const/4 v11, 0x2

    .line 74
    if-ne v10, v11, :cond_3

    .line 75
    .line 76
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v10

    .line 80
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    const-string v12, "error"

    .line 85
    .line 86
    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v12

    .line 90
    if-eqz v12, :cond_2

    .line 91
    .line 92
    invoke-static {p0}, Lcom/xiaomi/push/l;->c(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/push/k;

    .line 93
    .line 94
    .line 95
    move-result-object v9

    .line 96
    goto :goto_1

    .line 97
    :cond_2
    new-instance v8, Lcom/xiaomi/push/j;

    .line 98
    .line 99
    invoke-direct {v8}, Lcom/xiaomi/push/j;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {v10, v11, p0}, Lcom/xiaomi/push/l;->e(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Ll/e2r0;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    invoke-virtual {v8, v10}, Ll/g2r0;->i(Ll/e2r0;)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    const/4 v11, 0x3

    .line 111
    if-ne v10, v11, :cond_1

    .line 112
    .line 113
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v10

    .line 117
    const-string v11, "iq"

    .line 118
    .line 119
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v10

    .line 123
    if-eqz v10, :cond_1

    .line 124
    .line 125
    const/4 v7, 0x1

    .line 126
    goto :goto_1

    .line 127
    :cond_4
    if-nez v8, :cond_7

    .line 128
    .line 129
    sget-object p0, Lcom/xiaomi/push/j$a;->b:Lcom/xiaomi/push/j$a;

    .line 130
    .line 131
    if-eq p0, v5, :cond_6

    .line 132
    .line 133
    sget-object p0, Lcom/xiaomi/push/j$a;->c:Lcom/xiaomi/push/j$a;

    .line 134
    .line 135
    if-ne p0, v5, :cond_5

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_5
    new-instance v8, Lcom/xiaomi/push/l$b;

    .line 139
    .line 140
    invoke-direct {v8}, Lcom/xiaomi/push/l$b;-><init>()V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_6
    :goto_2
    new-instance p0, Lcom/xiaomi/push/l$a;

    .line 145
    .line 146
    invoke-direct {p0}, Lcom/xiaomi/push/l$a;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0}, Ll/g2r0;->n(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v3}, Ll/g2r0;->r(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v2}, Ll/g2r0;->t(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    sget-object v0, Lcom/xiaomi/push/j$a;->e:Lcom/xiaomi/push/j$a;

    .line 159
    .line 160
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/j;->z(Lcom/xiaomi/push/j$a;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, v4}, Ll/g2r0;->p(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    new-instance v0, Lcom/xiaomi/push/k;

    .line 167
    .line 168
    sget-object v2, Lcom/xiaomi/push/k$a;->f:Lcom/xiaomi/push/k$a;

    .line 169
    .line 170
    invoke-direct {v0, v2}, Lcom/xiaomi/push/k;-><init>(Lcom/xiaomi/push/k$a;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, v0}, Ll/g2r0;->h(Lcom/xiaomi/push/k;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, p0}, Ll/u1r0;->o(Ll/g2r0;)V

    .line 177
    .line 178
    .line 179
    const-string p0, "iq usage error. send packet in packet parser."

    .line 180
    .line 181
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-object v1

    .line 185
    :cond_7
    :goto_3
    invoke-virtual {v8, v0}, Ll/g2r0;->n(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v8, v2}, Ll/g2r0;->r(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v8, v4}, Ll/g2r0;->p(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v8, v3}, Ll/g2r0;->t(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v8, v5}, Lcom/xiaomi/push/j;->z(Lcom/xiaomi/push/j$a;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v8, v9}, Ll/g2r0;->h(Lcom/xiaomi/push/k;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v8, v6}, Lcom/xiaomi/push/j;->A(Ljava/util/Map;)V

    .line 204
    .line 205
    .line 206
    return-object v8
.end method

.method public static b(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/push/fq;
    .locals 7

    .line 1
    sget-object v0, Lcom/xiaomi/push/fq$b;->a:Lcom/xiaomi/push/fq$b;

    .line 2
    .line 3
    const-string v1, "type"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-interface {p0, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    :try_start_0
    invoke-static {v1}, Lcom/xiaomi/push/fq$b;->valueOf(Ljava/lang/String;)Lcom/xiaomi/push/fq$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    goto :goto_0

    .line 24
    :catch_0
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 25
    .line 26
    const-string v4, "Found invalid presence type "

    .line 27
    .line 28
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v3, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    :goto_0
    new-instance v1, Lcom/xiaomi/push/fq;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Lcom/xiaomi/push/fq;-><init>(Lcom/xiaomi/push/fq$b;)V

    .line 38
    .line 39
    .line 40
    const-string v0, "to"

    .line 41
    .line 42
    invoke-interface {p0, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v1, v0}, Ll/g2r0;->r(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v0, "from"

    .line 50
    .line 51
    invoke-interface {p0, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v1, v0}, Ll/g2r0;->t(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-string v0, "chid"

    .line 59
    .line 60
    invoke-interface {p0, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v1, v0}, Ll/g2r0;->p(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const-string v0, "id"

    .line 68
    .line 69
    invoke-interface {p0, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    const-string v0, "ID_NOT_AVAILABLE"

    .line 76
    .line 77
    :cond_1
    invoke-virtual {v1, v0}, Ll/g2r0;->n(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    move v2, v0

    .line 82
    :catch_1
    :cond_2
    :goto_1
    if-nez v2, :cond_8

    .line 83
    .line 84
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const/4 v4, 0x2

    .line 89
    if-ne v3, v4, :cond_7

    .line 90
    .line 91
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    const-string v5, "status"

    .line 100
    .line 101
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-eqz v5, :cond_3

    .line 106
    .line 107
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v1, v3}, Lcom/xiaomi/push/fq;->B(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_3
    const-string v5, "priority"

    .line 116
    .line 117
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-eqz v5, :cond_4

    .line 122
    .line 123
    :try_start_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    invoke-virtual {v1, v3}, Lcom/xiaomi/push/fq;->y(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :catch_2
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/fq;->y(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_4
    const-string v5, "show"

    .line 140
    .line 141
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    if-eqz v5, :cond_5

    .line 146
    .line 147
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    :try_start_2
    invoke-static {v3}, Lcom/xiaomi/push/fq$a;->valueOf(Ljava/lang/String;)Lcom/xiaomi/push/fq$a;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-virtual {v1, v4}, Lcom/xiaomi/push/fq;->z(Lcom/xiaomi/push/fq$a;)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :catch_3
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 160
    .line 161
    new-instance v5, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v6, "Found invalid presence mode "

    .line 164
    .line 165
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {v4, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_5
    const-string v5, "error"

    .line 180
    .line 181
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    if-eqz v5, :cond_6

    .line 186
    .line 187
    invoke-static {p0}, Lcom/xiaomi/push/l;->c(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/push/k;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v1, v3}, Ll/g2r0;->h(Lcom/xiaomi/push/k;)V

    .line 192
    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_6
    invoke-static {v3, v4, p0}, Lcom/xiaomi/push/l;->e(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Ll/e2r0;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    invoke-virtual {v1, v3}, Ll/g2r0;->i(Ll/e2r0;)V

    .line 200
    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_7
    const/4 v4, 0x3

    .line 204
    if-ne v3, v4, :cond_2

    .line 205
    .line 206
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    const-string v4, "presence"

    .line 211
    .line 212
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-eqz v3, :cond_2

    .line 217
    .line 218
    const/4 v2, 0x1

    .line 219
    goto/16 :goto_1

    .line 220
    .line 221
    :cond_8
    return-object v1
.end method

.method public static c(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/push/k;
    .locals 10

    .line 1
    new-instance v6, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "-1"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    move-object v4, v1

    .line 11
    move-object v5, v4

    .line 12
    move v3, v2

    .line 13
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    if-ge v3, v7, :cond_3

    .line 18
    .line 19
    invoke-interface {p0, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    const-string v8, "code"

    .line 24
    .line 25
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    const-string v9, ""

    .line 30
    .line 31
    if-eqz v7, :cond_0

    .line 32
    .line 33
    invoke-interface {p0, v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_0
    invoke-interface {p0, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    const-string v8, "type"

    .line 42
    .line 43
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-eqz v7, :cond_1

    .line 48
    .line 49
    invoke-interface {p0, v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    :cond_1
    invoke-interface {p0, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    const-string v8, "reason"

    .line 58
    .line 59
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eqz v7, :cond_2

    .line 64
    .line 65
    invoke-interface {p0, v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    move-object v3, v5

    .line 73
    move-object v5, v1

    .line 74
    :cond_4
    :goto_1
    if-nez v2, :cond_9

    .line 75
    .line 76
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    const/4 v8, 0x2

    .line 81
    if-ne v7, v8, :cond_7

    .line 82
    .line 83
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    const-string v8, "text"

    .line 88
    .line 89
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-eqz v7, :cond_5

    .line 94
    .line 95
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    goto :goto_1

    .line 100
    :cond_5
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    const-string v9, "urn:ietf:params:xml:ns:xmpp-stanzas"

    .line 109
    .line 110
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    if-eqz v9, :cond_6

    .line 115
    .line 116
    move-object v1, v7

    .line 117
    goto :goto_1

    .line 118
    :cond_6
    invoke-static {v7, v8, p0}, Lcom/xiaomi/push/l;->e(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Ll/e2r0;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_7
    const/4 v8, 0x3

    .line 127
    if-ne v7, v8, :cond_8

    .line 128
    .line 129
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    const-string v8, "error"

    .line 134
    .line 135
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    if-eqz v7, :cond_4

    .line 140
    .line 141
    const/4 v2, 0x1

    .line 142
    goto :goto_1

    .line 143
    :cond_8
    const/4 v8, 0x4

    .line 144
    if-ne v7, v8, :cond_4

    .line 145
    .line 146
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    goto :goto_1

    .line 151
    :cond_9
    if-nez v4, :cond_a

    .line 152
    .line 153
    const-string v4, "cancel"

    .line 154
    .line 155
    :cond_a
    move-object p0, v0

    .line 156
    move-object v2, v4

    .line 157
    new-instance v0, Lcom/xiaomi/push/k;

    .line 158
    .line 159
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    move-object v4, v1

    .line 164
    move v1, p0

    .line 165
    invoke-direct/range {v0 .. v6}, Lcom/xiaomi/push/k;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 166
    .line 167
    .line 168
    return-object v0
.end method

.method private static d(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x3

    .line 12
    if-ne v2, v3, :cond_1

    .line 13
    .line 14
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eq v2, v0, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    return-object v1

    .line 22
    :cond_1
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    goto :goto_0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Ll/e2r0;
    .locals 1

    .line 1
    invoke-static {}, Ll/m2r0;->c()Ll/m2r0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "all"

    .line 6
    .line 7
    const-string v0, "xm:chat"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/m2r0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    instance-of p1, p0, Lcom/xiaomi/push/service/i;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    check-cast p0, Lcom/xiaomi/push/service/i;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/i;->b(Lorg/xmlpull/v1/XmlPullParser;)Ll/e2r0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static f(Lorg/xmlpull/v1/XmlPullParser;)Ll/g2r0;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const-string v2, "s"

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "1"

    .line 12
    .line 13
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const-string v4, "message"

    .line 18
    .line 19
    const/4 v6, 0x2

    .line 20
    const-string v7, "type"

    .line 21
    .line 22
    const-string v8, "to"

    .line 23
    .line 24
    const-string v9, "from"

    .line 25
    .line 26
    const-string v10, "id"

    .line 27
    .line 28
    const-string v11, "chid"

    .line 29
    .line 30
    const/4 v12, 0x0

    .line 31
    const/4 v13, 0x1

    .line 32
    const/4 v14, 0x0

    .line 33
    if-eqz v3, :cond_a

    .line 34
    .line 35
    invoke-interface {v0, v1, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v0, v1, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-interface {v0, v1, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v9

    .line 47
    invoke-interface {v0, v1, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    invoke-interface {v0, v1, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    invoke-virtual {v7, v3, v8}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    if-nez v7, :cond_0

    .line 64
    .line 65
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-virtual {v7, v3, v9}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    :cond_0
    if-eqz v7, :cond_9

    .line 74
    .line 75
    move-object v11, v14

    .line 76
    :cond_1
    :goto_0
    const-string v15, "error while receiving a encrypted message with wrong format"

    .line 77
    .line 78
    if-nez v12, :cond_7

    .line 79
    .line 80
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    if-ne v5, v6, :cond_6

    .line 85
    .line 86
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_5

    .line 95
    .line 96
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    const/4 v11, 0x4

    .line 101
    if-ne v5, v11, :cond_4

    .line 102
    .line 103
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    const-string v11, "5"

    .line 108
    .line 109
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v11

    .line 113
    if-nez v11, :cond_3

    .line 114
    .line 115
    const-string v11, "6"

    .line 116
    .line 117
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v11

    .line 121
    if-eqz v11, :cond_2

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    iget-object v11, v7, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v11, v10}, Lcom/xiaomi/push/service/ar;->a(Ljava/lang/String;Ljava/lang/String;)[B

    .line 127
    .line 128
    .line 129
    move-result-object v11

    .line 130
    invoke-static {v11, v5}, Lcom/xiaomi/push/service/ar;->a([BLjava/lang/String;)[B

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-static {v5}, Lcom/xiaomi/push/l;->h([B)V

    .line 135
    .line 136
    .line 137
    sget-object v5, Lcom/xiaomi/push/l;->a:Lorg/xmlpull/v1/XmlPullParser;

    .line 138
    .line 139
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 140
    .line 141
    .line 142
    sget-object v5, Lcom/xiaomi/push/l;->a:Lorg/xmlpull/v1/XmlPullParser;

    .line 143
    .line 144
    invoke-static {v5}, Lcom/xiaomi/push/l;->f(Lorg/xmlpull/v1/XmlPullParser;)Ll/g2r0;

    .line 145
    .line 146
    .line 147
    move-result-object v11

    .line 148
    goto :goto_0

    .line 149
    :cond_3
    :goto_1
    new-instance v0, Ll/f2r0;

    .line 150
    .line 151
    invoke-direct {v0}, Ll/f2r0;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v3}, Ll/g2r0;->p(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v13}, Ll/f2r0;->D(Z)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v9}, Ll/g2r0;->t(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v8}, Ll/g2r0;->r(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v10}, Ll/g2r0;->n(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ll/f2r0;->L(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    new-instance v1, Ll/e2r0;

    .line 173
    .line 174
    invoke-direct {v1, v2, v14, v14, v14}, Ll/e2r0;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1, v5}, Ll/e2r0;->f(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ll/g2r0;->i(Ll/e2r0;)V

    .line 181
    .line 182
    .line 183
    return-object v0

    .line 184
    :cond_4
    new-instance v0, Lcom/xiaomi/push/fi;

    .line 185
    .line 186
    invoke-direct {v0, v15}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    throw v0

    .line 190
    :cond_5
    new-instance v0, Lcom/xiaomi/push/fi;

    .line 191
    .line 192
    invoke-direct {v0, v15}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    throw v0

    .line 196
    :cond_6
    const/4 v15, 0x3

    .line 197
    if-ne v5, v15, :cond_1

    .line 198
    .line 199
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    if-eqz v5, :cond_1

    .line 208
    .line 209
    move v12, v13

    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :cond_7
    if-eqz v11, :cond_8

    .line 213
    .line 214
    return-object v11

    .line 215
    :cond_8
    new-instance v0, Lcom/xiaomi/push/fi;

    .line 216
    .line 217
    invoke-direct {v0, v15}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    throw v0

    .line 221
    :cond_9
    new-instance v0, Lcom/xiaomi/push/fi;

    .line 222
    .line 223
    const-string v1, "the channel id is wrong while receiving a encrypted message"

    .line 224
    .line 225
    invoke-direct {v0, v1}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    throw v0

    .line 229
    :cond_a
    new-instance v2, Ll/f2r0;

    .line 230
    .line 231
    invoke-direct {v2}, Ll/f2r0;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-interface {v0, v1, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    if-nez v3, :cond_b

    .line 239
    .line 240
    const-string v3, "ID_NOT_AVAILABLE"

    .line 241
    .line 242
    :cond_b
    invoke-virtual {v2, v3}, Ll/g2r0;->n(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-interface {v0, v1, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    invoke-virtual {v2, v3}, Ll/g2r0;->r(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-interface {v0, v1, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-virtual {v2, v3}, Ll/g2r0;->t(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-interface {v0, v1, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    invoke-virtual {v2, v3}, Ll/g2r0;->p(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    const-string v3, "appid"

    .line 267
    .line 268
    invoke-interface {v0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v2, v3}, Ll/f2r0;->y(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    :try_start_0
    const-string v3, "transient"

    .line 276
    .line 277
    invoke-interface {v0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    goto :goto_2

    .line 282
    :catch_0
    move-object v3, v14

    .line 283
    :goto_2
    :try_start_1
    const-string v5, "seq"

    .line 284
    .line 285
    invoke-interface {v0, v1, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 290
    .line 291
    .line 292
    move-result v8

    .line 293
    if-nez v8, :cond_c

    .line 294
    .line 295
    invoke-virtual {v2, v5}, Ll/f2r0;->C(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 296
    .line 297
    .line 298
    :catch_1
    :cond_c
    :try_start_2
    const-string v5, "mseq"

    .line 299
    .line 300
    invoke-interface {v0, v1, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v5

    .line 304
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 305
    .line 306
    .line 307
    move-result v8

    .line 308
    if-nez v8, :cond_d

    .line 309
    .line 310
    invoke-virtual {v2, v5}, Ll/f2r0;->F(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 311
    .line 312
    .line 313
    :catch_2
    :cond_d
    :try_start_3
    const-string v5, "fseq"

    .line 314
    .line 315
    invoke-interface {v0, v1, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result v8

    .line 323
    if-nez v8, :cond_e

    .line 324
    .line 325
    invoke-virtual {v2, v5}, Ll/f2r0;->H(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 326
    .line 327
    .line 328
    :catch_3
    :cond_e
    :try_start_4
    const-string v5, "status"

    .line 329
    .line 330
    invoke-interface {v0, v1, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v5

    .line 334
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 335
    .line 336
    .line 337
    move-result v8

    .line 338
    if-nez v8, :cond_f

    .line 339
    .line 340
    invoke-virtual {v2, v5}, Ll/f2r0;->J(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 341
    .line 342
    .line 343
    :catch_4
    :cond_f
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    if-nez v5, :cond_10

    .line 348
    .line 349
    const-string v5, "true"

    .line 350
    .line 351
    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 352
    .line 353
    .line 354
    move-result v3

    .line 355
    if-eqz v3, :cond_10

    .line 356
    .line 357
    move v3, v13

    .line 358
    goto :goto_3

    .line 359
    :cond_10
    move v3, v12

    .line 360
    :goto_3
    invoke-virtual {v2, v3}, Ll/f2r0;->A(Z)V

    .line 361
    .line 362
    .line 363
    invoke-interface {v0, v1, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    invoke-virtual {v2, v3}, Ll/f2r0;->L(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    invoke-static {v0}, Lcom/xiaomi/push/l;->i(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    if-eqz v3, :cond_11

    .line 375
    .line 376
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v5

    .line 380
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result v5

    .line 384
    if-nez v5, :cond_11

    .line 385
    .line 386
    invoke-virtual {v2, v3}, Ll/f2r0;->R(Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    goto :goto_4

    .line 390
    :cond_11
    invoke-static {}, Ll/g2r0;->x()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    :cond_12
    :goto_4
    if-nez v12, :cond_1b

    .line 394
    .line 395
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    if-ne v3, v6, :cond_1a

    .line 400
    .line 401
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v3

    .line 405
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v5

    .line 409
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 410
    .line 411
    .line 412
    move-result v7

    .line 413
    if-eqz v7, :cond_13

    .line 414
    .line 415
    const-string v5, "xm"

    .line 416
    .line 417
    :cond_13
    const-string v7, "subject"

    .line 418
    .line 419
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    move-result v7

    .line 423
    if-eqz v7, :cond_14

    .line 424
    .line 425
    invoke-static {v0}, Lcom/xiaomi/push/l;->i(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    invoke-static {v0}, Lcom/xiaomi/push/l;->d(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v3

    .line 432
    invoke-virtual {v2, v3}, Ll/f2r0;->N(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    goto :goto_5

    .line 436
    :cond_14
    const-string v7, "body"

    .line 437
    .line 438
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v7

    .line 442
    if-eqz v7, :cond_16

    .line 443
    .line 444
    const-string v3, "encode"

    .line 445
    .line 446
    invoke-interface {v0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v3

    .line 450
    invoke-static {v0}, Lcom/xiaomi/push/l;->d(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v5

    .line 454
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 455
    .line 456
    .line 457
    move-result v7

    .line 458
    if-nez v7, :cond_15

    .line 459
    .line 460
    invoke-virtual {v2, v5, v3}, Ll/f2r0;->z(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    goto :goto_5

    .line 464
    :cond_15
    invoke-virtual {v2, v5}, Ll/f2r0;->P(Ljava/lang/String;)V

    .line 465
    .line 466
    .line 467
    goto :goto_5

    .line 468
    :cond_16
    const-string v7, "thread"

    .line 469
    .line 470
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    move-result v7

    .line 474
    if-eqz v7, :cond_17

    .line 475
    .line 476
    if-nez v14, :cond_19

    .line 477
    .line 478
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v14

    .line 482
    goto :goto_5

    .line 483
    :cond_17
    const-string v7, "error"

    .line 484
    .line 485
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 486
    .line 487
    .line 488
    move-result v7

    .line 489
    if-eqz v7, :cond_18

    .line 490
    .line 491
    invoke-static {v0}, Lcom/xiaomi/push/l;->c(Lorg/xmlpull/v1/XmlPullParser;)Lcom/xiaomi/push/k;

    .line 492
    .line 493
    .line 494
    move-result-object v3

    .line 495
    invoke-virtual {v2, v3}, Ll/g2r0;->h(Lcom/xiaomi/push/k;)V

    .line 496
    .line 497
    .line 498
    goto :goto_5

    .line 499
    :cond_18
    invoke-static {v3, v5, v0}, Lcom/xiaomi/push/l;->e(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Ll/e2r0;

    .line 500
    .line 501
    .line 502
    move-result-object v3

    .line 503
    invoke-virtual {v2, v3}, Ll/g2r0;->i(Ll/e2r0;)V

    .line 504
    .line 505
    .line 506
    :cond_19
    :goto_5
    const/4 v15, 0x3

    .line 507
    goto :goto_4

    .line 508
    :cond_1a
    const/4 v15, 0x3

    .line 509
    if-ne v3, v15, :cond_12

    .line 510
    .line 511
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v3

    .line 515
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 516
    .line 517
    .line 518
    move-result v3

    .line 519
    if-eqz v3, :cond_12

    .line 520
    .line 521
    move v12, v13

    .line 522
    goto/16 :goto_4

    .line 523
    .line 524
    :cond_1b
    invoke-virtual {v2, v14}, Ll/f2r0;->Q(Ljava/lang/String;)V

    .line 525
    .line 526
    .line 527
    return-object v2
.end method

.method public static g(Lorg/xmlpull/v1/XmlPullParser;)Ll/j2r0;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x2

    .line 10
    if-ne v2, v3, :cond_1

    .line 11
    .line 12
    new-instance v0, Ll/j2r0;

    .line 13
    .line 14
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v0, v2}, Ll/j2r0;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v3, 0x3

    .line 23
    if-ne v2, v3, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "error"

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return-object v0
.end method

.method private static h([B)V
    .locals 3

    .line 1
    sget-object v0, Lcom/xiaomi/push/l;->a:Lorg/xmlpull/v1/XmlPullParser;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/xiaomi/push/l;->a:Lorg/xmlpull/v1/XmlPullParser;

    .line 14
    .line 15
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception v0

    .line 23
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    sget-object v0, Lcom/xiaomi/push/l;->a:Lorg/xmlpull/v1/XmlPullParser;

    .line 27
    .line 28
    new-instance v1, Ljava/io/InputStreamReader;

    .line 29
    .line 30
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private static i(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_2

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "xml:lang"

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    const-string v2, "lang"

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    const-string v1, "xml"

    .line 29
    .line 30
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributePrefix(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    :goto_1
    invoke-interface {p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method
