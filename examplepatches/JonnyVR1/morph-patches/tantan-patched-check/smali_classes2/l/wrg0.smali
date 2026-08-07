.class public final Ll/wrg0;
.super Ll/okg0;
.source "SourceFile"


# static fields
.field public static final synthetic j:Z = true


# instance fields
.field public b:Ll/ykg0;

.field public final c:Ljava/util/ArrayList;

.field public d:Ll/dkg0;

.field public final e:Ljava/util/ArrayList;

.field public f:Ll/ueg0;

.field public final g:Ljava/util/ArrayList;

.field public h:Ljava/nio/ByteBuffer;

.field public final i:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/okg0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ykg0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ykg0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wrg0;->b:Ll/ykg0;

    .line 10
    .line 11
    new-instance v0, Ljava/util/Random;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/wrg0;->i:Ljava/util/Random;

    .line 17
    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    if-eqz p2, :cond_3

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/wrg0;->e:Ljava/util/ArrayList;

    .line 43
    .line 44
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x0

    .line 56
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ll/ykg0;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const-class v3, Ll/ykg0;

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_0

    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    iget-object v0, p0, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-object p1, p0, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iget-object v1, p0, Ll/wrg0;->b:Ll/ykg0;

    .line 96
    .line 97
    invoke-virtual {p1, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    iget-object p0, p0, Ll/wrg0;->e:Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 107
    .line 108
    .line 109
    const/4 p0, 0x0

    .line 110
    throw p0
.end method


# virtual methods
.method public final c(Ll/xjg0;)I
    .locals 13

    .line 1
    check-cast p1, Ll/mwg0;

    .line 2
    .line 3
    const-string v0, "Sec-WebSocket-Version"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    :try_start_0
    new-instance v1, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    goto :goto_0

    .line 29
    :catch_0
    :cond_0
    const/4 v0, -0x1

    .line 30
    :goto_0
    const/16 v1, 0xd

    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    if-eq v0, v1, :cond_1

    .line 34
    .line 35
    return v2

    .line 36
    :cond_1
    const-string v0, "Sec-WebSocket-Extensions"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/4 v3, 0x1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/ykg0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ll/wrg0;->b:Ll/ykg0;

    .line 64
    .line 65
    move v0, v3

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move v0, v2

    .line 68
    :goto_1
    const-string v1, "Sec-WebSocket-Protocol"

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v1, p0, Ll/wrg0;->e:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    const/4 v5, 0x0

    .line 81
    move v6, v5

    .line 82
    :cond_3
    if-ge v6, v4, :cond_6

    .line 83
    .line 84
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    add-int/lit8 v6, v6, 0x1

    .line 89
    .line 90
    check-cast v7, Ll/dkg0;

    .line 91
    .line 92
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    const-string v8, " "

    .line 96
    .line 97
    const-string v9, ""

    .line 98
    .line 99
    invoke-virtual {p1, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    const-string v10, ","

    .line 104
    .line 105
    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    array-length v10, v8

    .line 110
    move v11, v5

    .line 111
    :goto_2
    if-ge v11, v10, :cond_5

    .line 112
    .line 113
    aget-object v12, v8, v11

    .line 114
    .line 115
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v12

    .line 119
    if-eqz v12, :cond_4

    .line 120
    .line 121
    move v8, v3

    .line 122
    goto :goto_3

    .line 123
    :cond_4
    add-int/lit8 v11, v11, 0x1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_5
    move v8, v5

    .line 127
    :goto_3
    if-eqz v8, :cond_3

    .line 128
    .line 129
    iput-object v7, p0, Ll/wrg0;->d:Ll/dkg0;

    .line 130
    .line 131
    move p0, v3

    .line 132
    goto :goto_4

    .line 133
    :cond_6
    move p0, v2

    .line 134
    :goto_4
    if-ne p0, v3, :cond_7

    .line 135
    .line 136
    if-ne v0, v3, :cond_7

    .line 137
    .line 138
    return v3

    .line 139
    :cond_7
    return v2
.end method

.method public final d(Ll/irg0;Ll/gzg0;)I
    .locals 12

    .line 1
    check-cast p2, Ll/mwg0;

    .line 2
    .line 3
    const-string v0, "Upgrade"

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "websocket"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x2

    .line 16
    if-eqz v0, :cond_7

    .line 17
    .line 18
    const-string v0, "Connection"

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v2, "upgrade"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_7

    .line 37
    .line 38
    iget-object v0, p1, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 39
    .line 40
    const-string v2, "Sec-WebSocket-Key"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_7

    .line 47
    .line 48
    iget-object v0, p2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 49
    .line 50
    const-string v3, "Sec-WebSocket-Accept"

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    goto/16 :goto_3

    .line 59
    .line 60
    :cond_0
    invoke-virtual {p2, v3}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v2}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p1, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    .line 81
    .line 82
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const/4 v2, 0x0

    .line 90
    :try_start_0
    const-string v3, "SHA1"

    .line 91
    .line 92
    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 93
    .line 94
    .line 95
    move-result-object v3
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {v3, p1}, Ljava/security/MessageDigest;->digest([B)[B

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p1}, Ll/ikg0;->a([B)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_1

    .line 113
    .line 114
    return v1

    .line 115
    :cond_1
    const-string p1, "Sec-WebSocket-Extensions"

    .line 116
    .line 117
    invoke-virtual {p2, p1}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    const/4 v3, 0x1

    .line 131
    if-eqz v0, :cond_2

    .line 132
    .line 133
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Ll/ykg0;

    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 140
    .line 141
    .line 142
    iput-object p1, p0, Ll/wrg0;->b:Ll/ykg0;

    .line 143
    .line 144
    move p1, v3

    .line 145
    goto :goto_0

    .line 146
    :cond_2
    move p1, v1

    .line 147
    :goto_0
    const-string v0, "Sec-WebSocket-Protocol"

    .line 148
    .line 149
    invoke-virtual {p2, v0}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    iget-object v0, p0, Ll/wrg0;->e:Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    move v5, v2

    .line 160
    :cond_3
    if-ge v5, v4, :cond_5

    .line 161
    .line 162
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    add-int/lit8 v5, v5, 0x1

    .line 167
    .line 168
    check-cast v6, Ll/dkg0;

    .line 169
    .line 170
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 171
    .line 172
    .line 173
    const-string v7, " "

    .line 174
    .line 175
    const-string v8, ""

    .line 176
    .line 177
    invoke-virtual {p2, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    const-string v9, ","

    .line 182
    .line 183
    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    array-length v9, v7

    .line 188
    move v10, v2

    .line 189
    :goto_1
    if-ge v10, v9, :cond_3

    .line 190
    .line 191
    aget-object v11, v7, v10

    .line 192
    .line 193
    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v11

    .line 197
    if-eqz v11, :cond_4

    .line 198
    .line 199
    iput-object v6, p0, Ll/wrg0;->d:Ll/dkg0;

    .line 200
    .line 201
    move p0, v3

    .line 202
    goto :goto_2

    .line 203
    :cond_4
    add-int/lit8 v10, v10, 0x1

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_5
    move p0, v1

    .line 207
    :goto_2
    if-ne p0, v3, :cond_6

    .line 208
    .line 209
    if-ne p1, v3, :cond_6

    .line 210
    .line 211
    return v3

    .line 212
    :cond_6
    return v1

    .line 213
    :catch_0
    move-exception p0

    .line 214
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 215
    .line 216
    .line 217
    return v2

    .line 218
    :cond_7
    :goto_3
    return v1
.end method

.method public final e()Ljava/nio/ByteBuffer;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    move v5, v4

    .line 11
    :goto_0
    if-ge v5, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    add-int/lit8 v5, v5, 0x1

    .line 18
    .line 19
    check-cast v6, Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    invoke-virtual {v6}, Ljava/nio/Buffer;->limit()I

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    int-to-long v6, v6

    .line 26
    add-long/2addr v2, v6

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-wide/32 v0, 0x7fffffff

    .line 29
    .line 30
    .line 31
    cmp-long v0, v2, v0

    .line 32
    .line 33
    if-gtz v0, :cond_2

    .line 34
    .line 35
    long-to-int v0, v2

    .line 36
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object p0, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :goto_1
    if-ge v4, v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    add-int/lit8 v4, v4, 0x1

    .line 53
    .line 54
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 61
    .line 62
    .line 63
    return-object v0

    .line 64
    :cond_2
    new-instance p0, LSudthrow/Sudtry;

    .line 65
    .line 66
    invoke-direct {p0}, LSudthrow/Sudtry;-><init>()V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-class v3, Ll/wrg0;

    .line 13
    .line 14
    if-eq v3, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    check-cast p1, Ll/wrg0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/wrg0;->b:Ll/ykg0;

    .line 20
    .line 21
    iget-object v3, p1, Ll/wrg0;->b:Ll/ykg0;

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ll/ykg0;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_3

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    if-eqz v3, :cond_3

    .line 33
    .line 34
    :goto_0
    return v1

    .line 35
    :cond_3
    iget-object p0, p0, Ll/wrg0;->d:Ll/dkg0;

    .line 36
    .line 37
    iget-object p1, p1, Ll/wrg0;->d:Ll/dkg0;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/dkg0;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_4
    if-nez p1, :cond_5

    .line 47
    .line 48
    return v0

    .line 49
    :cond_5
    :goto_1
    return v1
.end method

.method public final f(Ll/swg0;Ll/ueg0;)V
    .locals 8

    .line 1
    move-object v0, p2

    .line 2
    check-cast v0, Ll/phg0;

    .line 3
    .line 4
    iget v1, v0, Ll/phg0;->b:I

    .line 5
    .line 6
    const/4 v2, 0x6

    .line 7
    const/4 v3, 0x4

    .line 8
    const/4 v4, 0x1

    .line 9
    if-ne v1, v2, :cond_2

    .line 10
    .line 11
    instance-of p0, p2, Ll/xqg0;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast p2, Ll/xqg0;

    .line 16
    .line 17
    iget p0, p2, Ll/xqg0;->h:I

    .line 18
    .line 19
    iget-object p2, p2, Ll/xqg0;->i:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/16 p0, 0x3ed

    .line 23
    .line 24
    const-string p2, ""

    .line 25
    .line 26
    :goto_0
    iget v0, p1, Ll/swg0;->d:I

    .line 27
    .line 28
    if-ne v0, v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, p0, p2, v4}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p1, p0, p2, v4}, Ll/swg0;->a(ILjava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    if-ne v1, v3, :cond_3

    .line 39
    .line 40
    iget-object p0, p1, Ll/swg0;->b:Ll/kug0;

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2}, Ll/kug0;->a(Ll/hog0;Ll/ueg0;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    const/4 v2, 0x5

    .line 47
    if-ne v1, v2, :cond_4

    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    iput-wide v0, p1, Ll/swg0;->l:J

    .line 54
    .line 55
    iget-object p0, p1, Ll/swg0;->b:Ll/kug0;

    .line 56
    .line 57
    invoke-virtual {p0, p1, p2}, Ll/kug0;->b(Ll/hog0;Ll/ueg0;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    iget-boolean v0, v0, Ll/phg0;->a:Z

    .line 62
    .line 63
    const/4 v2, 0x3

    .line 64
    const/4 v3, 0x2

    .line 65
    const/16 v5, 0x3ea

    .line 66
    .line 67
    if-eqz v0, :cond_9

    .line 68
    .line 69
    if-ne v1, v4, :cond_5

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    iget-object p0, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 73
    .line 74
    if-nez p0, :cond_8

    .line 75
    .line 76
    if-ne v1, v3, :cond_6

    .line 77
    .line 78
    :try_start_0
    iget-object p0, p1, Ll/swg0;->b:Ll/kug0;

    .line 79
    .line 80
    invoke-interface {p2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-static {p2}, Ll/rrg0;->a(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p0, p1, p2}, Ll/kug0;->a(Ll/hog0;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :catch_0
    move-exception p0

    .line 93
    iget-object p2, p1, Ll/swg0;->b:Ll/kug0;

    .line 94
    .line 95
    invoke-virtual {p2, p1, p0}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_5

    .line 99
    .line 100
    :cond_6
    if-ne v1, v2, :cond_7

    .line 101
    .line 102
    :try_start_1
    iget-object p0, p1, Ll/swg0;->b:Ll/kug0;

    .line 103
    .line 104
    invoke-interface {p2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p0, p1, p2}, Ll/kug0;->a(Ll/hog0;Ljava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :catch_1
    move-exception p0

    .line 113
    iget-object p2, p1, Ll/swg0;->b:Ll/kug0;

    .line 114
    .line 115
    invoke-virtual {p2, p1, p0}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 116
    .line 117
    .line 118
    goto/16 :goto_5

    .line 119
    .line 120
    :cond_7
    new-instance p0, LSudthrow/Sudfor;

    .line 121
    .line 122
    const-string p1, "non control or continious frame expected"

    .line 123
    .line 124
    invoke-direct {p0, v5, p1}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw p0

    .line 128
    :cond_8
    new-instance p0, LSudthrow/Sudfor;

    .line 129
    .line 130
    const-string p1, "Continuous frame sequence not completed."

    .line 131
    .line 132
    invoke-direct {p0, v5, p1}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 133
    .line 134
    .line 135
    throw p0

    .line 136
    :cond_9
    :goto_1
    if-eq v1, v4, :cond_b

    .line 137
    .line 138
    iget-object p1, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 139
    .line 140
    if-nez p1, :cond_a

    .line 141
    .line 142
    iput-object p2, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 143
    .line 144
    iget-object p1, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-interface {p2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    goto/16 :goto_3

    .line 154
    .line 155
    :cond_a
    new-instance p0, LSudthrow/Sudfor;

    .line 156
    .line 157
    const-string p1, "Previous continuous frame sequence not completed."

    .line 158
    .line 159
    invoke-direct {p0, v5, p1}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 160
    .line 161
    .line 162
    throw p0

    .line 163
    :cond_b
    iget-object v6, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 164
    .line 165
    const-string v7, "Continuous frame sequence was not started."

    .line 166
    .line 167
    if-eqz v0, :cond_f

    .line 168
    .line 169
    if-eqz v6, :cond_e

    .line 170
    .line 171
    iget-object v0, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 172
    .line 173
    invoke-interface {p2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 181
    .line 182
    check-cast v0, Ll/phg0;

    .line 183
    .line 184
    iget v5, v0, Ll/phg0;->b:I

    .line 185
    .line 186
    if-ne v5, v3, :cond_c

    .line 187
    .line 188
    invoke-virtual {p0}, Ll/wrg0;->e()Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v0, v2}, Ll/phg0;->b(Ljava/nio/ByteBuffer;)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 196
    .line 197
    check-cast v0, Ll/phg0;

    .line 198
    .line 199
    invoke-virtual {v0}, Ll/phg0;->a()V

    .line 200
    .line 201
    .line 202
    :try_start_2
    iget-object v0, p1, Ll/swg0;->b:Ll/kug0;

    .line 203
    .line 204
    iget-object v2, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 205
    .line 206
    invoke-interface {v2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-static {v2}, Ll/rrg0;->a(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v0, p1, v2}, Ll/kug0;->a(Ll/hog0;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :catch_2
    move-exception v0

    .line 219
    iget-object v2, p1, Ll/swg0;->b:Ll/kug0;

    .line 220
    .line 221
    invoke-virtual {v2, p1, v0}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_c
    if-ne v5, v2, :cond_d

    .line 226
    .line 227
    invoke-virtual {p0}, Ll/wrg0;->e()Ljava/nio/ByteBuffer;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-virtual {v0, v2}, Ll/phg0;->b(Ljava/nio/ByteBuffer;)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 235
    .line 236
    check-cast v0, Ll/phg0;

    .line 237
    .line 238
    invoke-virtual {v0}, Ll/phg0;->a()V

    .line 239
    .line 240
    .line 241
    :try_start_3
    iget-object v0, p1, Ll/swg0;->b:Ll/kug0;

    .line 242
    .line 243
    iget-object v2, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 244
    .line 245
    invoke-interface {v2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v0, p1, v2}, Ll/kug0;->a(Ll/hog0;Ljava/nio/ByteBuffer;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_3

    .line 250
    .line 251
    .line 252
    goto :goto_2

    .line 253
    :catch_3
    move-exception v0

    .line 254
    iget-object v2, p1, Ll/swg0;->b:Ll/kug0;

    .line 255
    .line 256
    invoke-virtual {v2, p1, v0}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 257
    .line 258
    .line 259
    :cond_d
    :goto_2
    const/4 p1, 0x0

    .line 260
    iput-object p1, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 261
    .line 262
    iget-object p1, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 263
    .line 264
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 265
    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_e
    new-instance p0, LSudthrow/Sudfor;

    .line 269
    .line 270
    invoke-direct {p0, v5, v7}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 271
    .line 272
    .line 273
    throw p0

    .line 274
    :cond_f
    if-eqz v6, :cond_13

    .line 275
    .line 276
    :goto_3
    if-ne v1, v3, :cond_11

    .line 277
    .line 278
    invoke-interface {p2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-static {p1}, Ll/rrg0;->b(Ljava/nio/ByteBuffer;)Z

    .line 283
    .line 284
    .line 285
    move-result p1

    .line 286
    if-eqz p1, :cond_10

    .line 287
    .line 288
    goto :goto_4

    .line 289
    :cond_10
    new-instance p0, LSudthrow/Sudfor;

    .line 290
    .line 291
    const/16 p1, 0x3ef

    .line 292
    .line 293
    invoke-direct {p0, p1}, LSudthrow/Sudfor;-><init>(I)V

    .line 294
    .line 295
    .line 296
    throw p0

    .line 297
    :cond_11
    :goto_4
    if-ne v1, v4, :cond_12

    .line 298
    .line 299
    iget-object p1, p0, Ll/wrg0;->f:Ll/ueg0;

    .line 300
    .line 301
    if-eqz p1, :cond_12

    .line 302
    .line 303
    iget-object p0, p0, Ll/wrg0;->g:Ljava/util/ArrayList;

    .line 304
    .line 305
    invoke-interface {p2}, Ll/ueg0;->d()Ljava/nio/ByteBuffer;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    :cond_12
    :goto_5
    return-void

    .line 313
    :cond_13
    new-instance p0, LSudthrow/Sudfor;

    .line 314
    .line 315
    invoke-direct {p0, v5, v7}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 316
    .line 317
    .line 318
    throw p0
.end method

.method public final g(Ljava/nio/ByteBuffer;)Ljava/util/List;
    .locals 8

    .line 1
    :goto_0
    new-instance v0, Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    const-string v2, "Negative count"

    .line 9
    .line 10
    const/16 v3, 0x3ea

    .line 11
    .line 12
    if-eqz v1, :cond_4

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    iget-object v5, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    invoke-virtual {v5}, Ljava/nio/Buffer;->remaining()I

    .line 25
    .line 26
    .line 27
    move-result v5
    :try_end_0
    .catch LSudthrow/Suddo; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    iget-object v6, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    if-le v5, v4, :cond_0

    .line 31
    .line 32
    :try_start_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    invoke-virtual {v6, v0, v5, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr v0, v4

    .line 48
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 52
    .line 53
    return-object p0

    .line 54
    :catch_0
    move-exception v0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    invoke-virtual {v6, v4, v7, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    add-int/2addr v4, v5

    .line 72
    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 73
    .line 74
    .line 75
    iget-object v4, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    const/4 v5, 0x0

    .line 82
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    invoke-virtual {p0, v4}, Ll/wrg0;->h(Ljava/nio/ByteBuffer;)Ll/phg0;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    iput-object v1, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;
    :try_end_1
    .catch LSudthrow/Suddo; {:try_start_1 .. :try_end_1} :catch_0

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :goto_1
    iget v0, v0, LSudthrow/Suddo;->Suddo:I

    .line 99
    .line 100
    if-ltz v0, :cond_3

    .line 101
    .line 102
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    sget-boolean v2, Ll/wrg0;->j:Z

    .line 107
    .line 108
    if-nez v2, :cond_2

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    iget-object v3, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-le v2, v3, :cond_1

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_1
    invoke-static {}, Ll/aqg0;->a()V

    .line 124
    .line 125
    .line 126
    return-object v1

    .line 127
    :cond_2
    :goto_2
    iget-object v1, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_3
    new-instance p0, LSudthrow/Sudfor;

    .line 142
    .line 143
    invoke-direct {p0, v3, v2}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    throw p0

    .line 147
    :cond_4
    :goto_3
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_6

    .line 152
    .line 153
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 154
    .line 155
    .line 156
    :try_start_2
    invoke-virtual {p0, p1}, Ll/wrg0;->h(Ljava/nio/ByteBuffer;)Ll/phg0;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch LSudthrow/Suddo; {:try_start_2 .. :try_end_2} :catch_1

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :catch_1
    move-exception v1

    .line 165
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 166
    .line 167
    .line 168
    iget v1, v1, LSudthrow/Suddo;->Suddo:I

    .line 169
    .line 170
    if-ltz v1, :cond_5

    .line 171
    .line 172
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iput-object v1, p0, Ll/wrg0;->h:Ljava/nio/ByteBuffer;

    .line 177
    .line 178
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_5
    new-instance p0, LSudthrow/Sudfor;

    .line 183
    .line 184
    invoke-direct {p0, v3, v2}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 185
    .line 186
    .line 187
    throw p0

    .line 188
    :cond_6
    :goto_4
    return-object v0
.end method

.method public final h(Ljava/nio/ByteBuffer;)Ll/phg0;
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x2

    .line 8
    if-lt v1, v2, :cond_16

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    shr-int/lit8 v4, v3, 0x8

    .line 15
    .line 16
    const/4 v6, 0x1

    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    move v4, v6

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v4, 0x0

    .line 22
    :goto_0
    and-int/lit8 v7, v3, 0x40

    .line 23
    .line 24
    if-eqz v7, :cond_1

    .line 25
    .line 26
    move v7, v6

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const/4 v7, 0x0

    .line 29
    :goto_1
    and-int/lit8 v8, v3, 0x20

    .line 30
    .line 31
    if-eqz v8, :cond_2

    .line 32
    .line 33
    move v8, v6

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    const/4 v8, 0x0

    .line 36
    :goto_2
    and-int/lit8 v9, v3, 0x10

    .line 37
    .line 38
    if-eqz v9, :cond_3

    .line 39
    .line 40
    move v9, v6

    .line 41
    goto :goto_3

    .line 42
    :cond_3
    const/4 v9, 0x0

    .line 43
    :goto_3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 44
    .line 45
    .line 46
    move-result v10

    .line 47
    and-int/lit8 v11, v10, -0x80

    .line 48
    .line 49
    if-eqz v11, :cond_4

    .line 50
    .line 51
    move v11, v6

    .line 52
    goto :goto_4

    .line 53
    :cond_4
    const/4 v11, 0x0

    .line 54
    :goto_4
    and-int/lit8 v10, v10, 0x7f

    .line 55
    .line 56
    int-to-byte v10, v10

    .line 57
    and-int/lit8 v3, v3, 0xf

    .line 58
    .line 59
    int-to-byte v3, v3

    .line 60
    const/4 v12, 0x3

    .line 61
    const/4 v13, 0x6

    .line 62
    const/4 v14, 0x5

    .line 63
    const/4 v15, 0x4

    .line 64
    if-eqz v3, :cond_7

    .line 65
    .line 66
    if-eq v3, v6, :cond_6

    .line 67
    .line 68
    if-eq v3, v2, :cond_5

    .line 69
    .line 70
    packed-switch v3, :pswitch_data_0

    .line 71
    .line 72
    .line 73
    new-instance v0, LSudthrow/Sudint;

    .line 74
    .line 75
    int-to-short v1, v3

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v3, "Unknown opcode "

    .line 79
    .line 80
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-direct {v0, v1}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw v0

    .line 94
    :pswitch_0
    move v3, v14

    .line 95
    goto :goto_5

    .line 96
    :pswitch_1
    move v3, v15

    .line 97
    goto :goto_5

    .line 98
    :pswitch_2
    move v3, v13

    .line 99
    goto :goto_5

    .line 100
    :cond_5
    move v3, v12

    .line 101
    goto :goto_5

    .line 102
    :cond_6
    move v3, v2

    .line 103
    goto :goto_5

    .line 104
    :cond_7
    move v3, v6

    .line 105
    :goto_5
    if-ltz v10, :cond_8

    .line 106
    .line 107
    const/16 v5, 0x7d

    .line 108
    .line 109
    if-le v10, v5, :cond_c

    .line 110
    .line 111
    :cond_8
    if-eq v3, v15, :cond_15

    .line 112
    .line 113
    if-eq v3, v14, :cond_15

    .line 114
    .line 115
    if-eq v3, v13, :cond_15

    .line 116
    .line 117
    const/16 v5, 0x7e

    .line 118
    .line 119
    if-ne v10, v5, :cond_a

    .line 120
    .line 121
    if-lt v1, v15, :cond_9

    .line 122
    .line 123
    new-array v5, v12, [B

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 126
    .line 127
    .line 128
    move-result v10

    .line 129
    aput-byte v10, v5, v6

    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    aput-byte v6, v5, v2

    .line 136
    .line 137
    new-instance v2, Ljava/math/BigInteger;

    .line 138
    .line 139
    invoke-direct {v2, v5}, Ljava/math/BigInteger;-><init>([B)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result v10

    .line 146
    move v2, v15

    .line 147
    goto :goto_7

    .line 148
    :cond_9
    new-instance v0, LSudthrow/Suddo;

    .line 149
    .line 150
    invoke-direct {v0, v15}, LSudthrow/Suddo;-><init>(I)V

    .line 151
    .line 152
    .line 153
    throw v0

    .line 154
    :cond_a
    const/16 v2, 0xa

    .line 155
    .line 156
    if-lt v1, v2, :cond_14

    .line 157
    .line 158
    const/16 v5, 0x8

    .line 159
    .line 160
    new-array v6, v5, [B

    .line 161
    .line 162
    const/4 v10, 0x0

    .line 163
    :goto_6
    if-ge v10, v5, :cond_b

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    aput-byte v12, v6, v10

    .line 170
    .line 171
    add-int/lit8 v10, v10, 0x1

    .line 172
    .line 173
    goto :goto_6

    .line 174
    :cond_b
    new-instance v5, Ljava/math/BigInteger;

    .line 175
    .line 176
    invoke-direct {v5, v6}, Ljava/math/BigInteger;-><init>([B)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v5}, Ljava/math/BigInteger;->longValue()J

    .line 180
    .line 181
    .line 182
    move-result-wide v5

    .line 183
    const-wide/32 v12, 0x7fffffff

    .line 184
    .line 185
    .line 186
    cmp-long v10, v5, v12

    .line 187
    .line 188
    if-gtz v10, :cond_13

    .line 189
    .line 190
    long-to-int v10, v5

    .line 191
    :cond_c
    :goto_7
    if-eqz v11, :cond_d

    .line 192
    .line 193
    move v5, v15

    .line 194
    goto :goto_8

    .line 195
    :cond_d
    const/4 v5, 0x0

    .line 196
    :goto_8
    add-int/2addr v2, v5

    .line 197
    add-int/2addr v2, v10

    .line 198
    if-lt v1, v2, :cond_12

    .line 199
    .line 200
    if-ltz v10, :cond_11

    .line 201
    .line 202
    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    if-eqz v11, :cond_e

    .line 207
    .line 208
    new-array v2, v15, [B

    .line 209
    .line 210
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 211
    .line 212
    .line 213
    const/4 v5, 0x0

    .line 214
    :goto_9
    if-ge v5, v10, :cond_f

    .line 215
    .line 216
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 217
    .line 218
    .line 219
    move-result v6

    .line 220
    rem-int/lit8 v11, v5, 0x4

    .line 221
    .line 222
    aget-byte v11, v2, v11

    .line 223
    .line 224
    xor-int/2addr v6, v11

    .line 225
    int-to-byte v6, v6

    .line 226
    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 227
    .line 228
    .line 229
    add-int/lit8 v5, v5, 0x1

    .line 230
    .line 231
    goto :goto_9

    .line 232
    :cond_e
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 241
    .line 242
    .line 243
    move-result v6

    .line 244
    invoke-virtual {v1, v2, v5, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    add-int/2addr v5, v2

    .line 256
    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 257
    .line 258
    .line 259
    :cond_f
    sget-object v0, Ll/ngg0;->a:[I

    .line 260
    .line 261
    invoke-static {v3}, Ll/pxg0;->a(I)I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    aget v0, v0, v2

    .line 266
    .line 267
    packed-switch v0, :pswitch_data_1

    .line 268
    .line 269
    .line 270
    const-string v0, "Supplied opcode is invalid"

    .line 271
    .line 272
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    const/4 v0, 0x0

    .line 276
    return-object v0

    .line 277
    :pswitch_3
    new-instance v0, Ll/png0;

    .line 278
    .line 279
    invoke-direct {v0}, Ll/png0;-><init>()V

    .line 280
    .line 281
    .line 282
    goto :goto_a

    .line 283
    :pswitch_4
    new-instance v0, Ll/xqg0;

    .line 284
    .line 285
    invoke-direct {v0}, Ll/xqg0;-><init>()V

    .line 286
    .line 287
    .line 288
    goto :goto_a

    .line 289
    :pswitch_5
    new-instance v0, Ll/mjg0;

    .line 290
    .line 291
    invoke-direct {v0}, Ll/mjg0;-><init>()V

    .line 292
    .line 293
    .line 294
    goto :goto_a

    .line 295
    :pswitch_6
    new-instance v0, Ll/ovg0;

    .line 296
    .line 297
    invoke-direct {v0}, Ll/ovg0;-><init>()V

    .line 298
    .line 299
    .line 300
    goto :goto_a

    .line 301
    :pswitch_7
    new-instance v0, Ll/spg0;

    .line 302
    .line 303
    invoke-direct {v0}, Ll/spg0;-><init>()V

    .line 304
    .line 305
    .line 306
    goto :goto_a

    .line 307
    :pswitch_8
    new-instance v0, Ll/qmg0;

    .line 308
    .line 309
    invoke-direct {v0}, Ll/qmg0;-><init>()V

    .line 310
    .line 311
    .line 312
    :goto_a
    iput-boolean v4, v0, Ll/phg0;->a:Z

    .line 313
    .line 314
    iput-boolean v7, v0, Ll/phg0;->e:Z

    .line 315
    .line 316
    iput-boolean v8, v0, Ll/phg0;->f:Z

    .line 317
    .line 318
    iput-boolean v9, v0, Ll/phg0;->g:Z

    .line 319
    .line 320
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v0, v1}, Ll/phg0;->b(Ljava/nio/ByteBuffer;)V

    .line 324
    .line 325
    .line 326
    iget-boolean v1, v0, Ll/phg0;->e:Z

    .line 327
    .line 328
    if-nez v1, :cond_10

    .line 329
    .line 330
    iget-boolean v1, v0, Ll/phg0;->f:Z

    .line 331
    .line 332
    if-nez v1, :cond_10

    .line 333
    .line 334
    iget-boolean v1, v0, Ll/phg0;->g:Z

    .line 335
    .line 336
    if-nez v1, :cond_10

    .line 337
    .line 338
    invoke-virtual {v0}, Ll/phg0;->a()V

    .line 339
    .line 340
    .line 341
    return-object v0

    .line 342
    :cond_10
    new-instance v1, LSudthrow/Sudint;

    .line 343
    .line 344
    iget-boolean v2, v0, Ll/phg0;->e:Z

    .line 345
    .line 346
    iget-boolean v3, v0, Ll/phg0;->f:Z

    .line 347
    .line 348
    iget-boolean v0, v0, Ll/phg0;->g:Z

    .line 349
    .line 350
    new-instance v4, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    const-string v5, "bad rsv RSV1: "

    .line 353
    .line 354
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v2, " RSV2: "

    .line 361
    .line 362
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v2, " RSV3: "

    .line 369
    .line 370
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-direct {v1, v0}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    throw v1

    .line 384
    :cond_11
    new-instance v0, LSudthrow/Sudfor;

    .line 385
    .line 386
    const/16 v1, 0x3ea

    .line 387
    .line 388
    const-string v2, "Negative count"

    .line 389
    .line 390
    invoke-direct {v0, v1, v2}, LSudthrow/Sudfor;-><init>(ILjava/lang/String;)V

    .line 391
    .line 392
    .line 393
    throw v0

    .line 394
    :cond_12
    new-instance v0, LSudthrow/Suddo;

    .line 395
    .line 396
    invoke-direct {v0, v2}, LSudthrow/Suddo;-><init>(I)V

    .line 397
    .line 398
    .line 399
    throw v0

    .line 400
    :cond_13
    new-instance v0, LSudthrow/Sudtry;

    .line 401
    .line 402
    invoke-direct {v0}, LSudthrow/Sudtry;-><init>()V

    .line 403
    .line 404
    .line 405
    throw v0

    .line 406
    :cond_14
    new-instance v0, LSudthrow/Suddo;

    .line 407
    .line 408
    invoke-direct {v0, v2}, LSudthrow/Suddo;-><init>(I)V

    .line 409
    .line 410
    .line 411
    throw v0

    .line 412
    :cond_15
    new-instance v0, LSudthrow/Sudint;

    .line 413
    .line 414
    const-string v1, "more than 125 octets"

    .line 415
    .line 416
    invoke-direct {v0, v1}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    throw v0

    .line 420
    :cond_16
    new-instance v0, LSudthrow/Suddo;

    .line 421
    .line 422
    invoke-direct {v0, v2}, LSudthrow/Suddo;-><init>(I)V

    .line 423
    .line 424
    .line 425
    throw v0

    .line 426
    nop

    .line 427
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    const-class p0, Ll/ykg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-int/lit8 p0, p0, 0x1f

    .line 8
    .line 9
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    const-class v0, Ll/wrg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v0, " extension: "

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-class v0, Ll/ykg0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Ll/wrg0;->d:Ll/dkg0;

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    const-string p0, " protocol: "

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_0
    return-object v0
.end method
