.class public final Ll/ujg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wng0;
.implements Ll/ztg0;


# static fields
.field public static final a:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, ".*\\d+ *- *(\\d+) */ *\\d+"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/ujg0;->a:Ljava/util/regex/Pattern;

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


# virtual methods
.method public final a(Ll/jgg0;)J
    .locals 14

    .line 1
    iget-wide v4, p1, Ll/jgg0;->i:J

    .line 2
    .line 3
    iget p0, p1, Ll/jgg0;->a:I

    .line 4
    .line 5
    const-wide/16 v0, -0x1

    .line 6
    .line 7
    cmp-long v2, v4, v0

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    move v2, v3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v2, 0x0

    .line 15
    :goto_0
    iget-object v6, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 16
    .line 17
    invoke-virtual {v6}, Ll/ixg0;->a()Ll/vfg0;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    const-wide/16 v7, 0x0

    .line 22
    .line 23
    move-wide v9, v0

    .line 24
    move v0, v2

    .line 25
    move-wide v1, v7

    .line 26
    :goto_1
    :try_start_0
    iget v11, p1, Ll/jgg0;->h:I

    .line 27
    .line 28
    iget-object v12, p1, Ll/jgg0;->f:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v12

    .line 34
    if-ne v11, v12, :cond_1

    .line 35
    .line 36
    iget v11, p1, Ll/jgg0;->h:I

    .line 37
    .line 38
    sub-int/2addr v11, v3

    .line 39
    iput v11, p1, Ll/jgg0;->h:I

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    goto/16 :goto_5

    .line 44
    .line 45
    :cond_1
    :goto_2
    invoke-virtual {p1}, Ll/jgg0;->b()J

    .line 46
    .line 47
    .line 48
    move-result-wide v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    cmp-long v13, v11, v9

    .line 50
    .line 51
    if-nez v13, :cond_7

    .line 52
    .line 53
    iget-wide v9, p1, Ll/jgg0;->k:J

    .line 54
    .line 55
    cmp-long v3, v9, v7

    .line 56
    .line 57
    if-nez v3, :cond_2

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_2
    iget-object v3, p1, Ll/jgg0;->m:Ll/d0h0;

    .line 61
    .line 62
    iget-object v3, v3, Ll/d0h0;->a:Ll/oyg0;

    .line 63
    .line 64
    iget-object v11, p1, Ll/jgg0;->b:Ll/aug0;

    .line 65
    .line 66
    iget v12, p1, Ll/jgg0;->a:I

    .line 67
    .line 68
    invoke-virtual {v3, v11, v12, v9, v10}, Ll/oyg0;->b(Ll/aug0;IJ)V

    .line 69
    .line 70
    .line 71
    iput-wide v7, p1, Ll/jgg0;->k:J

    .line 72
    .line 73
    :goto_3
    iget-object p1, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 74
    .line 75
    iget-boolean p1, p1, Ll/ixg0;->d:Z

    .line 76
    .line 77
    if-nez p1, :cond_3

    .line 78
    .line 79
    invoke-virtual {v6, p0}, Ll/vfg0;->h(I)V

    .line 80
    .line 81
    .line 82
    :cond_3
    if-eqz v0, :cond_6

    .line 83
    .line 84
    iget-object p1, v6, Ll/vfg0;->i:Ll/bog0;

    .line 85
    .line 86
    iget-object p1, p1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    check-cast p1, Ll/akg0;

    .line 93
    .line 94
    iget-object v0, p1, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 97
    .line 98
    .line 99
    move-result-wide v9

    .line 100
    iget-wide v11, p1, Ll/akg0;->b:J

    .line 101
    .line 102
    cmp-long v0, v9, v11

    .line 103
    .line 104
    if-nez v0, :cond_5

    .line 105
    .line 106
    cmp-long p0, v1, v4

    .line 107
    .line 108
    if-nez p0, :cond_4

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_4
    const-string v0, "Fetch-length isn\'t equal to the response content-length, "

    .line 112
    .line 113
    const-string v3, "!= "

    .line 114
    .line 115
    invoke-static/range {v0 .. v5}, Ll/hig0;->a(Ljava/lang/String;JLjava/lang/Object;J)V

    .line 116
    .line 117
    .line 118
    return-wide v7

    .line 119
    :cond_5
    new-instance v0, Ljava/io/IOException;

    .line 120
    .line 121
    iget-object v1, p1, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 124
    .line 125
    .line 126
    move-result-wide v1

    .line 127
    iget-wide v3, p1, Ll/akg0;->b:J

    .line 128
    .line 129
    new-instance p1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v5, "The current offset on block-info isn\'t update correct, "

    .line 132
    .line 133
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v1, " != "

    .line 140
    .line 141
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, " on "

    .line 148
    .line 149
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    throw v0

    .line 163
    :cond_6
    :goto_4
    return-wide v1

    .line 164
    :cond_7
    add-long/2addr v1, v11

    .line 165
    goto/16 :goto_1

    .line 166
    .line 167
    :goto_5
    iget-wide v1, p1, Ll/jgg0;->k:J

    .line 168
    .line 169
    cmp-long v3, v1, v7

    .line 170
    .line 171
    if-nez v3, :cond_8

    .line 172
    .line 173
    goto :goto_6

    .line 174
    :cond_8
    iget-object v3, p1, Ll/jgg0;->m:Ll/d0h0;

    .line 175
    .line 176
    iget-object v3, v3, Ll/d0h0;->a:Ll/oyg0;

    .line 177
    .line 178
    iget-object v4, p1, Ll/jgg0;->b:Ll/aug0;

    .line 179
    .line 180
    iget v5, p1, Ll/jgg0;->a:I

    .line 181
    .line 182
    invoke-virtual {v3, v4, v5, v1, v2}, Ll/oyg0;->b(Ll/aug0;IJ)V

    .line 183
    .line 184
    .line 185
    iput-wide v7, p1, Ll/jgg0;->k:J

    .line 186
    .line 187
    :goto_6
    iget-object p1, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 188
    .line 189
    iget-boolean p1, p1, Ll/ixg0;->d:Z

    .line 190
    .line 191
    if-nez p1, :cond_9

    .line 192
    .line 193
    invoke-virtual {v6, p0}, Ll/vfg0;->h(I)V

    .line 194
    .line 195
    .line 196
    :cond_9
    throw v0
.end method

.method public final b(Ll/jgg0;)Ll/vkg0;
    .locals 19

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "Update store failed!"

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jgg0;->c()Ll/vkg0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v3, v0, Ll/jgg0;->c:Ll/bog0;

    .line 10
    .line 11
    iget-object v4, v0, Ll/jgg0;->d:Ll/ixg0;

    .line 12
    .line 13
    invoke-virtual {v4}, Ll/ixg0;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-nez v4, :cond_7

    .line 18
    .line 19
    iget-object v4, v3, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/4 v5, 0x1

    .line 26
    if-ne v4, v5, :cond_5

    .line 27
    .line 28
    iget-boolean v4, v3, Ll/bog0;->i:Z

    .line 29
    .line 30
    if-nez v4, :cond_5

    .line 31
    .line 32
    move-object v4, v2

    .line 33
    check-cast v4, Ll/rug0;

    .line 34
    .line 35
    const-string v6, "Content-Range"

    .line 36
    .line 37
    invoke-virtual {v4, v6}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    invoke-static {v6}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    const-wide/16 v8, -0x1

    .line 46
    .line 47
    const-wide/16 v10, 0x0

    .line 48
    .line 49
    if-nez v7, :cond_1

    .line 50
    .line 51
    sget-object v7, Ll/ujg0;->a:Ljava/util/regex/Pattern;

    .line 52
    .line 53
    invoke-virtual {v7, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    if-eqz v7, :cond_0

    .line 62
    .line 63
    invoke-virtual {v6, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 68
    .line 69
    .line 70
    move-result-wide v6

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    move-wide v6, v8

    .line 73
    :goto_0
    cmp-long v12, v6, v10

    .line 74
    .line 75
    if-lez v12, :cond_1

    .line 76
    .line 77
    const-wide/16 v8, 0x1

    .line 78
    .line 79
    add-long/2addr v8, v6

    .line 80
    :cond_1
    cmp-long v6, v8, v10

    .line 81
    .line 82
    if-gez v6, :cond_2

    .line 83
    .line 84
    const-string v6, "Content-Length"

    .line 85
    .line 86
    invoke-virtual {v4, v6}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-static {v4}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-nez v6, :cond_2

    .line 95
    .line 96
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 97
    .line 98
    .line 99
    move-result-wide v8

    .line 100
    :cond_2
    move-wide v15, v8

    .line 101
    invoke-virtual {v3}, Ll/bog0;->c()J

    .line 102
    .line 103
    .line 104
    move-result-wide v6

    .line 105
    cmp-long v4, v15, v10

    .line 106
    .line 107
    if-lez v4, :cond_5

    .line 108
    .line 109
    cmp-long v4, v15, v6

    .line 110
    .line 111
    if-eqz v4, :cond_5

    .line 112
    .line 113
    iget-object v4, v3, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 114
    .line 115
    const/4 v6, 0x0

    .line 116
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    check-cast v4, Ll/akg0;

    .line 121
    .line 122
    iget-wide v7, v4, Ll/akg0;->a:J

    .line 123
    .line 124
    iget-object v4, v4, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 125
    .line 126
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 127
    .line 128
    .line 129
    move-result-wide v12

    .line 130
    add-long/2addr v12, v7

    .line 131
    cmp-long v4, v12, v10

    .line 132
    .line 133
    if-eqz v4, :cond_3

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_3
    move v5, v6

    .line 137
    :goto_1
    new-instance v12, Ll/akg0;

    .line 138
    .line 139
    const-wide/16 v13, 0x0

    .line 140
    .line 141
    const-wide/16 v17, 0x0

    .line 142
    .line 143
    invoke-direct/range {v12 .. v18}, Ll/akg0;-><init>(JJJ)V

    .line 144
    .line 145
    .line 146
    iget-object v4, v3, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 149
    .line 150
    .line 151
    iget-object v4, v3, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    if-nez v5, :cond_4

    .line 157
    .line 158
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    iget-object v4, v4, Ll/jwg0;->b:Ll/d0h0;

    .line 163
    .line 164
    iget-object v4, v4, Ll/d0h0;->a:Ll/oyg0;

    .line 165
    .line 166
    iget-object v5, v0, Ll/jgg0;->b:Ll/aug0;

    .line 167
    .line 168
    const/16 v6, 0x8

    .line 169
    .line 170
    invoke-virtual {v4, v5, v3, v6}, Ll/oyg0;->g(Ll/aug0;Ll/bog0;I)V

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_4
    new-instance v0, LSudchar/Sudtry;

    .line 175
    .line 176
    invoke-direct {v0}, LSudchar/Sudtry;-><init>()V

    .line 177
    .line 178
    .line 179
    throw v0

    .line 180
    :cond_5
    :goto_2
    iget-object v0, v0, Ll/jgg0;->n:Ll/ehg0;

    .line 181
    .line 182
    :try_start_0
    invoke-interface {v0, v3}, Ll/ehg0;->b(Ll/bog0;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_6

    .line 187
    .line 188
    return-object v2

    .line 189
    :cond_6
    new-instance v0, Ljava/io/IOException;

    .line 190
    .line 191
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    :catch_0
    move-exception v0

    .line 196
    new-instance v2, Ljava/io/IOException;

    .line 197
    .line 198
    invoke-direct {v2, v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 199
    .line 200
    .line 201
    throw v2

    .line 202
    :cond_7
    sget-object v0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 203
    .line 204
    throw v0
.end method
