.class public Ll/ote;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private final a:I

.field private final b:Ljava/nio/channels/FileChannel;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x464c457f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/ote;->a:I

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/io/FileInputStream;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/ote;->b:Ljava/nio/channels/FileChannel;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "File is null or does not exist"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    throw p0
.end method

.method private b(Ll/jte;JJ)J
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    move-wide v2, v0

    .line 4
    :goto_0
    cmp-long p0, v2, p2

    .line 5
    .line 6
    if-gez p0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, v2, v3}, Ll/jte;->b(J)Ll/kte;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-wide v4, p0, Ll/kte;->a:J

    .line 13
    .line 14
    const-wide/16 v6, 0x1

    .line 15
    .line 16
    cmp-long v4, v4, v6

    .line 17
    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    iget-wide v4, p0, Ll/kte;->c:J

    .line 21
    .line 22
    cmp-long v8, v4, p4

    .line 23
    .line 24
    if-gtz v8, :cond_0

    .line 25
    .line 26
    iget-wide v8, p0, Ll/kte;->d:J

    .line 27
    .line 28
    add-long/2addr v8, v4

    .line 29
    cmp-long v8, p4, v8

    .line 30
    .line 31
    if-gtz v8, :cond_0

    .line 32
    .line 33
    sub-long/2addr p4, v4

    .line 34
    iget-wide p0, p0, Ll/kte;->b:J

    .line 35
    .line 36
    add-long/2addr p4, p0

    .line 37
    return-wide p4

    .line 38
    :cond_0
    add-long/2addr v2, v6

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string p0, "Could not map vma to file offset!"

    .line 41
    .line 42
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-wide v0
.end method


# virtual methods
.method public B(Ljava/nio/ByteBuffer;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/ote;->n(Ljava/nio/ByteBuffer;JI)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long p0, p0

    .line 10
    const-wide p2, 0xffffffffL

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    and-long/2addr p0, p2

    .line 16
    return-wide p0
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ote;->b:Ljava/nio/channels/FileChannel;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Ll/jte;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ote;->b:Ljava/nio/channels/FileChannel;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Ll/ote;->B(Ljava/nio/ByteBuffer;J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    const-wide/32 v3, 0x464c457f

    .line 24
    .line 25
    .line 26
    cmp-long v1, v1, v3

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    const-wide/16 v3, 0x4

    .line 32
    .line 33
    invoke-virtual {p0, v0, v3, v4}, Ll/ote;->q(Ljava/nio/ByteBuffer;J)S

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const-wide/16 v3, 0x5

    .line 38
    .line 39
    invoke-virtual {p0, v0, v3, v4}, Ll/ote;->q(Ljava/nio/ByteBuffer;J)S

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v3, 0x1

    .line 44
    const/4 v4, 0x2

    .line 45
    if-ne v0, v4, :cond_0

    .line 46
    .line 47
    move v0, v3

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    :goto_0
    if-ne v1, v3, :cond_1

    .line 51
    .line 52
    new-instance v1, Ll/mte;

    .line 53
    .line 54
    invoke-direct {v1, v0, p0}, Ll/mte;-><init>(ZLl/ote;)V

    .line 55
    .line 56
    .line 57
    return-object v1

    .line 58
    :cond_1
    if-ne v1, v4, :cond_2

    .line 59
    .line 60
    new-instance v1, Ll/nte;

    .line 61
    .line 62
    invoke-direct {v1, v0, p0}, Ll/nte;-><init>(ZLl/ote;)V

    .line 63
    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_2
    const-string p0, "Invalid class type!"

    .line 67
    .line 68
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-object v2

    .line 72
    :cond_3
    const-string p0, "Invalid ELF Magic!"

    .line 73
    .line 74
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-object v2
.end method

.method public m()Ljava/util/List;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ote;->b:Ljava/nio/channels/FileChannel;

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 8
    .line 9
    .line 10
    new-instance v6, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ote;->k()Ll/jte;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/16 v4, 0x8

    .line 20
    .line 21
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    iget-boolean v4, v1, Ll/jte;->a:Z

    .line 26
    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v7, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    iget v4, v1, Ll/jte;->f:I

    .line 38
    .line 39
    int-to-long v4, v4

    .line 40
    const-wide/32 v8, 0xffff

    .line 41
    .line 42
    .line 43
    cmp-long v8, v4, v8

    .line 44
    .line 45
    const/4 v9, 0x0

    .line 46
    if-nez v8, :cond_1

    .line 47
    .line 48
    invoke-virtual {v1, v9}, Ll/jte;->c(I)Ll/lte;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-wide v4, v4, Ll/lte;->a:J

    .line 53
    .line 54
    :cond_1
    move-wide v10, v2

    .line 55
    :goto_1
    cmp-long v8, v10, v4

    .line 56
    .line 57
    const-wide/16 v12, 0x1

    .line 58
    .line 59
    if-gez v8, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1, v10, v11}, Ll/jte;->b(J)Ll/kte;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    iget-wide v14, v8, Ll/kte;->a:J

    .line 66
    .line 67
    const-wide/16 v16, 0x2

    .line 68
    .line 69
    cmp-long v14, v14, v16

    .line 70
    .line 71
    if-nez v14, :cond_2

    .line 72
    .line 73
    iget-wide v10, v8, Ll/kte;->b:J

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_2
    add-long/2addr v10, v12

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    move-wide v10, v2

    .line 79
    :goto_2
    cmp-long v8, v10, v2

    .line 80
    .line 81
    if-nez v8, :cond_4

    .line 82
    .line 83
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    return-object v0

    .line 88
    :cond_4
    new-instance v8, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    move-wide v14, v2

    .line 94
    move-wide/from16 v16, v14

    .line 95
    .line 96
    :goto_3
    invoke-virtual {v1, v10, v11, v9}, Ll/jte;->a(JI)Ll/ite;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    move-wide/from16 v18, v12

    .line 101
    .line 102
    iget-wide v12, v2, Ll/ite;->a:J

    .line 103
    .line 104
    cmp-long v3, v12, v18

    .line 105
    .line 106
    if-nez v3, :cond_5

    .line 107
    .line 108
    iget-wide v12, v2, Ll/ite;->b:J

    .line 109
    .line 110
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_5
    const-wide/16 v20, 0x5

    .line 119
    .line 120
    cmp-long v3, v12, v20

    .line 121
    .line 122
    if-nez v3, :cond_6

    .line 123
    .line 124
    iget-wide v14, v2, Ll/ite;->b:J

    .line 125
    .line 126
    :cond_6
    :goto_4
    add-int/lit8 v9, v9, 0x1

    .line 127
    .line 128
    iget-wide v2, v2, Ll/ite;->a:J

    .line 129
    .line 130
    cmp-long v2, v2, v16

    .line 131
    .line 132
    if-nez v2, :cond_9

    .line 133
    .line 134
    cmp-long v2, v14, v16

    .line 135
    .line 136
    if-eqz v2, :cond_8

    .line 137
    .line 138
    move-wide v2, v4

    .line 139
    move-wide v4, v14

    .line 140
    invoke-direct/range {v0 .. v5}, Ll/ote;->b(Ll/jte;JJ)J

    .line 141
    .line 142
    .line 143
    move-result-wide v1

    .line 144
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-eqz v4, :cond_7

    .line 153
    .line 154
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Ljava/lang/Long;

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 161
    .line 162
    .line 163
    move-result-wide v4

    .line 164
    add-long/2addr v4, v1

    .line 165
    invoke-virtual {v0, v7, v4, v5}, Ll/ote;->v(Ljava/nio/ByteBuffer;J)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    goto :goto_5

    .line 173
    :cond_7
    return-object v6

    .line 174
    :cond_8
    const-string v0, "String table offset not found!"

    .line 175
    .line 176
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    const/4 v0, 0x0

    .line 180
    return-object v0

    .line 181
    :cond_9
    move-wide v2, v4

    .line 182
    move-wide v4, v14

    .line 183
    move-wide/from16 v12, v18

    .line 184
    .line 185
    move-wide v4, v2

    .line 186
    goto :goto_3
.end method

.method public n(Ljava/nio/ByteBuffer;JI)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1, p4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    :goto_0
    int-to-long v3, p4

    .line 11
    cmp-long v3, v1, v3

    .line 12
    .line 13
    if-gez v3, :cond_1

    .line 14
    .line 15
    iget-object v3, p0, Ll/ote;->b:Ljava/nio/channels/FileChannel;

    .line 16
    .line 17
    add-long v4, p2, v1

    .line 18
    .line 19
    invoke-virtual {v3, p1, v4, v5}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, -0x1

    .line 24
    if-eq v3, v4, :cond_0

    .line 25
    .line 26
    int-to-long v3, v3

    .line 27
    add-long/2addr v1, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public q(Ljava/nio/ByteBuffer;J)S
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/ote;->n(Ljava/nio/ByteBuffer;JI)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    and-int/lit16 p0, p0, 0xff

    .line 10
    .line 11
    int-to-short p0, p0

    .line 12
    return p0
.end method

.method public t(Ljava/nio/ByteBuffer;J)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/ote;->n(Ljava/nio/ByteBuffer;JI)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const p1, 0xffff

    .line 10
    .line 11
    .line 12
    and-int/2addr p0, p1

    .line 13
    return p0
.end method

.method public u(Ljava/nio/ByteBuffer;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/ote;->n(Ljava/nio/ByteBuffer;JI)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public v(Ljava/nio/ByteBuffer;J)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
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
    :goto_0
    const-wide/16 v1, 0x1

    .line 7
    .line 8
    add-long/2addr v1, p2

    .line 9
    invoke-virtual {p0, p1, p2, p3}, Ll/ote;->q(Ljava/nio/ByteBuffer;J)S

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    int-to-char p2, p2

    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    move-wide p2, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
