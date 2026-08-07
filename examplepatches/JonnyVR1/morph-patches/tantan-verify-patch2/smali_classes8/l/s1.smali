.class public Ll/s1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/nio/ByteBuffer;

.field public b:Ll/r1;

.field public c:I

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/o1;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/s1;->c:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/s1;->d:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x8

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    if-ge v1, v2, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    sget-object v4, Ll/p1;->a:[B

    .line 13
    .line 14
    aget-byte v4, v4, v1

    .line 15
    .line 16
    if-eq v2, v4, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 19
    .line 20
    iput v3, p0, Ll/uo0;->a:I

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v3
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 2
    .line 3
    iget p0, p0, Ll/uo0;->a:I

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public c()Ll/r1;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s1;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/s1;->i()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 18
    .line 19
    iget v0, p0, Ll/uo0;->b:I

    .line 20
    .line 21
    if-gez v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput v0, p0, Ll/uo0;->a:I

    .line 25
    .line 26
    :cond_1
    return-object p0

    .line 27
    :cond_2
    const-string p0, "You must call setData() before parseHeader()"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iput v1, v0, Ll/uo0;->b:I

    .line 8
    .line 9
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    iput p0, v0, Ll/uo0;->g:I

    .line 16
    .line 17
    return-void
.end method

.method public final e()B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final f()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Ll/s1;->s(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    new-instance v0, Ll/q1;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q1;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/s1;->b:Ll/r1;

    .line 7
    .line 8
    iput-object v0, v1, Ll/uo0;->c:Ll/to0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget v2, p0, Ll/s1;->c:I

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    if-eq v1, v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 20
    .line 21
    iput v3, p0, Ll/uo0;->a:I

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    add-int/2addr v2, v3

    .line 25
    iput v2, p0, Ll/s1;->c:I

    .line 26
    .line 27
    iput v1, v0, Ll/q1;->d:I

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, v0, Ll/q1;->e:I

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Ll/q1;->f:I

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iput v1, v0, Ll/q1;->g:I

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput v1, v0, Ll/q1;->h:I

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/s1;->o()S

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {p0}, Ll/s1;->o()S

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v0, v1, v2}, Ll/q1;->b(SS)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Ll/q1;->c(B)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {v0, v1}, Ll/q1;->a(B)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    add-int/lit8 v1, v1, 0x4

    .line 85
    .line 86
    iget-object v2, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-ge v1, v2, :cond_1

    .line 93
    .line 94
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 95
    .line 96
    iget-object p0, p0, Ll/uo0;->d:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method

.method public final h(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/s1;->c:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 11
    .line 12
    iput v2, p0, Ll/uo0;->a:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-le p1, v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 24
    .line 25
    iget-object v0, v0, Ll/uo0;->d:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v1, v2

    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget v0, p0, Ll/s1;->c:I

    .line 37
    .line 38
    add-int/2addr v0, v2

    .line 39
    iput v0, p0, Ll/s1;->c:I

    .line 40
    .line 41
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 42
    .line 43
    iget-object v0, v0, Ll/uo0;->c:Ll/to0;

    .line 44
    .line 45
    check-cast v0, Ll/q1;

    .line 46
    .line 47
    iget-object v1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iput v1, v0, Ll/to0;->c:I

    .line 54
    .line 55
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 56
    .line 57
    iget-object v0, v0, Ll/uo0;->c:Ll/to0;

    .line 58
    .line 59
    move-object v1, v0

    .line 60
    check-cast v1, Ll/q1;

    .line 61
    .line 62
    add-int/lit8 v3, p1, -0x4

    .line 63
    .line 64
    iput v3, v1, Ll/q1;->j:I

    .line 65
    .line 66
    check-cast v0, Ll/q1;

    .line 67
    .line 68
    iput-boolean v2, v0, Ll/q1;->k:Z

    .line 69
    .line 70
    :goto_0
    add-int/lit8 p1, p1, -0x4

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/s1;->s(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/s1;->j(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final j(I)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/s1;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :cond_1
    move v1, v0

    .line 11
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/s1;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_6

    .line 16
    .line 17
    if-nez v1, :cond_6

    .line 18
    .line 19
    iget v2, p0, Ll/s1;->c:I

    .line 20
    .line 21
    if-ge v2, p1, :cond_6

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/16 v4, 0x8

    .line 32
    .line 33
    const/4 v5, 0x1

    .line 34
    sparse-switch v3, :sswitch_data_0

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v2}, Ll/s1;->s(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :sswitch_0
    iget-object v3, p0, Ll/s1;->d:Ljava/util/List;

    .line 42
    .line 43
    new-instance v6, Ll/o1;

    .line 44
    .line 45
    add-int/lit8 v7, v2, 0xc

    .line 46
    .line 47
    iget-object v8, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v8}, Ljava/nio/Buffer;->position()I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    sub-int/2addr v8, v4

    .line 54
    invoke-direct {v6, v7, v8}, Ll/o1;-><init>(II)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v2}, Ll/s1;->s(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :sswitch_1
    invoke-virtual {p0, v2}, Ll/s1;->h(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :sswitch_2
    const/16 v3, 0x1a

    .line 69
    .line 70
    if-eq v2, v3, :cond_3

    .line 71
    .line 72
    iget-object v2, p0, Ll/s1;->b:Ll/r1;

    .line 73
    .line 74
    iput v5, v2, Ll/uo0;->a:I

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    invoke-virtual {p0}, Ll/s1;->g()V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :sswitch_3
    if-eq v2, v4, :cond_4

    .line 82
    .line 83
    iget-object v2, p0, Ll/s1;->b:Ll/r1;

    .line 84
    .line 85
    iput v5, v2, Ll/uo0;->a:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    invoke-virtual {p0}, Ll/s1;->d()V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :sswitch_4
    invoke-virtual {p0, v2}, Ll/s1;->n(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :sswitch_5
    const/16 v3, 0xd

    .line 97
    .line 98
    if-eq v2, v3, :cond_5

    .line 99
    .line 100
    iget-object v2, p0, Ll/s1;->b:Ll/r1;

    .line 101
    .line 102
    iput v5, v2, Ll/uo0;->a:I

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    invoke-virtual {p0}, Ll/s1;->l()V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :sswitch_6
    iget-object v1, p0, Ll/s1;->b:Ll/r1;

    .line 110
    .line 111
    iget-object v2, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    sub-int/2addr v2, v4

    .line 118
    iput v2, v1, Ll/r1;->p:I

    .line 119
    .line 120
    move v1, v5

    .line 121
    goto :goto_1

    .line 122
    :sswitch_7
    invoke-virtual {p0, v2}, Ll/s1;->k(I)V

    .line 123
    .line 124
    .line 125
    :goto_1
    invoke-virtual {p0}, Ll/s1;->f()V

    .line 126
    .line 127
    .line 128
    if-nez v1, :cond_2

    .line 129
    .line 130
    iget-object v1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iget-object v2, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-lt v1, v2, :cond_1

    .line 143
    .line 144
    move v1, v5

    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_6
    iget-object p1, p0, Ll/s1;->d:Ljava/util/List;

    .line 148
    .line 149
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-nez p1, :cond_7

    .line 154
    .line 155
    iget-object p1, p0, Ll/s1;->b:Ll/r1;

    .line 156
    .line 157
    iget-object v1, p0, Ll/s1;->d:Ljava/util/List;

    .line 158
    .line 159
    new-array v0, v0, [Ll/o1;

    .line 160
    .line 161
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, [Ll/o1;

    .line 166
    .line 167
    iput-object v0, p1, Ll/r1;->q:[Ll/o1;

    .line 168
    .line 169
    :cond_7
    iget-object p1, p0, Ll/s1;->b:Ll/r1;

    .line 170
    .line 171
    iget v0, p1, Ll/uo0;->b:I

    .line 172
    .line 173
    iget-object p1, p1, Ll/uo0;->d:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eq v0, p1, :cond_8

    .line 180
    .line 181
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 182
    .line 183
    iget-object p1, p0, Ll/uo0;->d:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    iput p1, p0, Ll/uo0;->b:I

    .line 190
    .line 191
    :cond_8
    :goto_2
    return-void

    .line 192
    nop

    .line 193
    :sswitch_data_0
    .sparse-switch
        0x49444154 -> :sswitch_7
        0x49454e44 -> :sswitch_6
        0x49484452 -> :sswitch_5
        0x504c5445 -> :sswitch_4
        0x6163544c -> :sswitch_3
        0x6663544c -> :sswitch_2
        0x66644154 -> :sswitch_1
        0x69545874 -> :sswitch_0
        0x74455874 -> :sswitch_0
        0x74494d45 -> :sswitch_0
        0x7a545874 -> :sswitch_0
    .end sparse-switch
.end method

.method public final k(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 2
    .line 3
    iget v1, v0, Ll/r1;->m:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, -0x8

    .line 14
    .line 15
    iput v1, v0, Ll/r1;->n:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    add-int/lit8 v1, v1, -0x8

    .line 23
    .line 24
    iput v1, v0, Ll/r1;->m:I

    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Ll/s1;->d:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Ll/s1;->c:I

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    iput-boolean v1, v0, Ll/r1;->o:Z

    .line 39
    .line 40
    iget-object v0, v0, Ll/uo0;->c:Ll/to0;

    .line 41
    .line 42
    check-cast v0, Ll/q1;

    .line 43
    .line 44
    iget-object v1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iput v1, v0, Ll/to0;->c:I

    .line 51
    .line 52
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 53
    .line 54
    iget-object v0, v0, Ll/uo0;->c:Ll/to0;

    .line 55
    .line 56
    check-cast v0, Ll/q1;

    .line 57
    .line 58
    iget-object v1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/nio/Buffer;->remaining()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput v1, v0, Ll/q1;->j:I

    .line 69
    .line 70
    :cond_1
    invoke-virtual {p0, p1}, Ll/s1;->s(I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iput v1, v0, Ll/uo0;->e:I

    .line 8
    .line 9
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/s1;->m()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Ll/uo0;->f:I

    .line 16
    .line 17
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput-byte v1, v0, Ll/r1;->h:B

    .line 24
    .line 25
    :try_start_0
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-static {v1}, Lv/emoji/base/apngdecoder/PngColourType;->fromByte(B)Lv/emoji/base/apngdecoder/PngColourType;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Ll/r1;->i:Lv/emoji/base/apngdecoder/PngColourType;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    iput v1, v0, Ll/uo0;->a:I

    .line 46
    .line 47
    :goto_0
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iput-byte v1, v0, Ll/r1;->j:B

    .line 54
    .line 55
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput-byte v1, v0, Ll/r1;->k:B

    .line 62
    .line 63
    iget-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/s1;->e()B

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    iput-byte p0, v0, Ll/r1;->l:B

    .line 70
    .line 71
    return-void
.end method

.method public final m()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final n(I)V
    .locals 1

    .line 1
    rem-int/lit8 v0, p1, 0x3

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/s1;->b:Ll/r1;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput p1, p0, Ll/uo0;->a:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/s1;->s(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o()S
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const v0, 0xffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p0, v0

    .line 11
    int-to-short p0, p0

    .line 12
    return p0
.end method

.method public final p()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    new-instance v0, Ll/r1;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/r1;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s1;->b:Ll/r1;

    .line 10
    .line 11
    return-void
.end method

.method public q(Ljava/nio/ByteBuffer;)Ll/s1;
    .locals 1
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/s1;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public r([B)Ll/s1;
    .locals 1
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/s1;->q(Ljava/nio/ByteBuffer;)Ll/s1;

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iget-object p1, p0, Ll/s1;->b:Ll/r1;

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    iput v0, p1, Ll/uo0;->a:I

    .line 18
    .line 19
    return-object p0
.end method

.method public final s(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/2addr v0, p1

    .line 8
    iget-object p1, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p0, p0, Ll/s1;->a:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 21
    .line 22
    .line 23
    return-void
.end method
