.class public final Ll/jb20;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jb20$c;,
        Ll/jb20$a;,
        Ll/jb20$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:[B

.field public static final b:[F

.field public static final c:Ljava/lang/Object;

.field public static d:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/jb20;->a:[B

    .line 8
    .line 9
    const/16 v0, 0x11

    .line 10
    .line 11
    new-array v0, v0, [F

    .line 12
    .line 13
    fill-array-data v0, :array_1

    .line 14
    .line 15
    .line 16
    sput-object v0, Ll/jb20;->b:[F

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/jb20;->c:Ljava/lang/Object;

    .line 24
    .line 25
    const/16 v0, 0xa

    .line 26
    .line 27
    new-array v0, v0, [I

    .line 28
    .line 29
    sput-object v0, Ll/jb20;->d:[I

    .line 30
    .line 31
    return-void

    .line 32
    nop

    .line 33
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f8ba2e9
        0x3f68ba2f
        0x3fba2e8c
        0x3f9b26ca
        0x400ba2e9
        0x3fe8ba2f
        0x403a2e8c
        0x401b26ca
        0x3fd1745d
        0x3fae8ba3
        0x3ff83e10
        0x3fcede62
        0x3faaaaab
        0x3fc00000    # 1.5f
        0x40000000    # 2.0f
    .end array-data
.end method

.method public static a([Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aput-boolean v0, p0, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aput-boolean v0, p0, v1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    aput-boolean v0, p0, v1

    .line 9
    .line 10
    return-void
.end method

.method public static b(Ljava/nio/ByteBuffer;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    move v3, v2

    .line 8
    :goto_0
    add-int/lit8 v4, v2, 0x1

    .line 9
    .line 10
    if-ge v4, v0, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    and-int/lit16 v5, v5, 0xff

    .line 17
    .line 18
    const/4 v6, 0x3

    .line 19
    if-ne v3, v6, :cond_0

    .line 20
    .line 21
    const/4 v7, 0x1

    .line 22
    if-ne v5, v7, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->get(I)B

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    and-int/lit8 v7, v7, 0x1f

    .line 29
    .line 30
    const/4 v8, 0x7

    .line 31
    if-ne v7, v8, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sub-int/2addr v2, v6

    .line 38
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    if-nez v5, :cond_1

    .line 52
    .line 53
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    :cond_1
    if-eqz v5, :cond_2

    .line 56
    .line 57
    move v3, v1

    .line 58
    :cond_2
    move v2, v4

    .line 59
    goto :goto_0

    .line 60
    :cond_3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static c([BII[Z)I
    .locals 8

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    invoke-static {v3}, Ll/w11;->g(Z)V

    .line 11
    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return p2

    .line 16
    :cond_1
    aget-boolean v3, p3, v1

    .line 17
    .line 18
    if-eqz v3, :cond_2

    .line 19
    .line 20
    invoke-static {p3}, Ll/jb20;->a([Z)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 p1, p1, -0x3

    .line 24
    .line 25
    return p1

    .line 26
    :cond_2
    const/4 v3, 0x2

    .line 27
    if-le v0, v2, :cond_3

    .line 28
    .line 29
    aget-boolean v4, p3, v2

    .line 30
    .line 31
    if-eqz v4, :cond_3

    .line 32
    .line 33
    aget-byte v4, p0, p1

    .line 34
    .line 35
    if-ne v4, v2, :cond_3

    .line 36
    .line 37
    invoke-static {p3}, Ll/jb20;->a([Z)V

    .line 38
    .line 39
    .line 40
    sub-int/2addr p1, v3

    .line 41
    return p1

    .line 42
    :cond_3
    if-le v0, v3, :cond_4

    .line 43
    .line 44
    aget-boolean v4, p3, v3

    .line 45
    .line 46
    if-eqz v4, :cond_4

    .line 47
    .line 48
    aget-byte v4, p0, p1

    .line 49
    .line 50
    if-nez v4, :cond_4

    .line 51
    .line 52
    add-int/lit8 v4, p1, 0x1

    .line 53
    .line 54
    aget-byte v4, p0, v4

    .line 55
    .line 56
    if-ne v4, v2, :cond_4

    .line 57
    .line 58
    invoke-static {p3}, Ll/jb20;->a([Z)V

    .line 59
    .line 60
    .line 61
    sub-int/2addr p1, v2

    .line 62
    return p1

    .line 63
    :cond_4
    add-int/lit8 v4, p2, -0x1

    .line 64
    .line 65
    add-int/2addr p1, v3

    .line 66
    :goto_1
    if-ge p1, v4, :cond_7

    .line 67
    .line 68
    aget-byte v5, p0, p1

    .line 69
    .line 70
    and-int/lit16 v6, v5, 0xfe

    .line 71
    .line 72
    if-eqz v6, :cond_5

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_5
    add-int/lit8 v6, p1, -0x2

    .line 76
    .line 77
    aget-byte v7, p0, v6

    .line 78
    .line 79
    if-nez v7, :cond_6

    .line 80
    .line 81
    add-int/lit8 v7, p1, -0x1

    .line 82
    .line 83
    aget-byte v7, p0, v7

    .line 84
    .line 85
    if-nez v7, :cond_6

    .line 86
    .line 87
    if-ne v5, v2, :cond_6

    .line 88
    .line 89
    invoke-static {p3}, Ll/jb20;->a([Z)V

    .line 90
    .line 91
    .line 92
    return v6

    .line 93
    :cond_6
    add-int/lit8 p1, p1, -0x2

    .line 94
    .line 95
    :goto_2
    add-int/lit8 p1, p1, 0x3

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_7
    if-le v0, v3, :cond_9

    .line 99
    .line 100
    add-int/lit8 p1, p2, -0x3

    .line 101
    .line 102
    aget-byte p1, p0, p1

    .line 103
    .line 104
    if-nez p1, :cond_8

    .line 105
    .line 106
    add-int/lit8 p1, p2, -0x2

    .line 107
    .line 108
    aget-byte p1, p0, p1

    .line 109
    .line 110
    if-nez p1, :cond_8

    .line 111
    .line 112
    aget-byte p1, p0, v4

    .line 113
    .line 114
    if-ne p1, v2, :cond_8

    .line 115
    .line 116
    :goto_3
    move p1, v2

    .line 117
    goto :goto_4

    .line 118
    :cond_8
    move p1, v1

    .line 119
    goto :goto_4

    .line 120
    :cond_9
    if-ne v0, v3, :cond_a

    .line 121
    .line 122
    aget-boolean p1, p3, v3

    .line 123
    .line 124
    if-eqz p1, :cond_8

    .line 125
    .line 126
    add-int/lit8 p1, p2, -0x2

    .line 127
    .line 128
    aget-byte p1, p0, p1

    .line 129
    .line 130
    if-nez p1, :cond_8

    .line 131
    .line 132
    aget-byte p1, p0, v4

    .line 133
    .line 134
    if-ne p1, v2, :cond_8

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_a
    aget-boolean p1, p3, v2

    .line 138
    .line 139
    if-eqz p1, :cond_8

    .line 140
    .line 141
    aget-byte p1, p0, v4

    .line 142
    .line 143
    if-ne p1, v2, :cond_8

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :goto_4
    aput-boolean p1, p3, v1

    .line 147
    .line 148
    if-le v0, v2, :cond_c

    .line 149
    .line 150
    add-int/lit8 p1, p2, -0x2

    .line 151
    .line 152
    aget-byte p1, p0, p1

    .line 153
    .line 154
    if-nez p1, :cond_b

    .line 155
    .line 156
    aget-byte p1, p0, v4

    .line 157
    .line 158
    if-nez p1, :cond_b

    .line 159
    .line 160
    :goto_5
    move p1, v2

    .line 161
    goto :goto_6

    .line 162
    :cond_b
    move p1, v1

    .line 163
    goto :goto_6

    .line 164
    :cond_c
    aget-boolean p1, p3, v3

    .line 165
    .line 166
    if-eqz p1, :cond_b

    .line 167
    .line 168
    aget-byte p1, p0, v4

    .line 169
    .line 170
    if-nez p1, :cond_b

    .line 171
    .line 172
    goto :goto_5

    .line 173
    :goto_6
    aput-boolean p1, p3, v2

    .line 174
    .line 175
    aget-byte p0, p0, v4

    .line 176
    .line 177
    if-nez p0, :cond_d

    .line 178
    .line 179
    move v1, v2

    .line 180
    :cond_d
    aput-boolean v1, p3, v3

    .line 181
    .line 182
    return p2
.end method

.method public static d([BII)I
    .locals 2

    .line 1
    :goto_0
    add-int/lit8 v0, p2, -0x2

    .line 2
    .line 3
    if-ge p1, v0, :cond_1

    .line 4
    .line 5
    aget-byte v0, p0, p1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    add-int/lit8 v0, p1, 0x1

    .line 10
    .line 11
    aget-byte v0, p0, v0

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    add-int/lit8 v0, p1, 0x2

    .line 16
    .line 17
    aget-byte v0, p0, v0

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    return p1

    .line 23
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return p2
.end method

.method public static e([BI)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    aget-byte p0, p0, p1

    .line 4
    .line 5
    and-int/lit8 p0, p0, 0x7e

    .line 6
    .line 7
    shr-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public static f([BI)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    aget-byte p0, p0, p1

    .line 4
    .line 5
    and-int/lit8 p0, p0, 0x1f

    .line 6
    .line 7
    return p0
.end method

.method public static g(Ljava/lang/String;B)Z
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "video/avc"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    and-int/lit8 v0, p1, 0x1f

    .line 11
    .line 12
    const/4 v2, 0x6

    .line 13
    if-eq v0, v2, :cond_1

    .line 14
    .line 15
    :cond_0
    const-string v0, "video/hevc"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    and-int/lit8 p0, p1, 0x7e

    .line 24
    .line 25
    shr-int/2addr p0, v1

    .line 26
    const/16 p1, 0x27

    .line 27
    .line 28
    if-ne p0, p1, :cond_2

    .line 29
    .line 30
    :cond_1
    return v1

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static h([BII)Ll/jb20$a;
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Ll/jb20;->i([BII)Ll/jb20$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static i([BII)Ll/jb20$a;
    .locals 25

    .line 1
    new-instance v0, Ll/jg60;

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/jg60;-><init>([BII)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    invoke-virtual {v0, v1}, Ll/jg60;->l(I)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 22
    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    invoke-virtual {v0, v3}, Ll/jg60;->e(I)I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    const/4 v4, 0x5

    .line 34
    invoke-virtual {v0, v4}, Ll/jg60;->e(I)I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    const/4 v8, 0x0

    .line 39
    move v9, v8

    .line 40
    move v10, v9

    .line 41
    :goto_0
    const/16 v11, 0x20

    .line 42
    .line 43
    const/4 v12, 0x1

    .line 44
    if-ge v9, v11, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 47
    .line 48
    .line 49
    move-result v11

    .line 50
    if-eqz v11, :cond_0

    .line 51
    .line 52
    shl-int v11, v12, v9

    .line 53
    .line 54
    or-int/2addr v8, v11

    .line 55
    :cond_0
    add-int/lit8 v9, v9, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/4 v9, 0x6

    .line 59
    new-array v11, v9, [I

    .line 60
    .line 61
    move v13, v10

    .line 62
    :goto_1
    const/16 v14, 0x8

    .line 63
    .line 64
    if-ge v13, v9, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0, v14}, Ll/jg60;->e(I)I

    .line 67
    .line 68
    .line 69
    move-result v14

    .line 70
    aput v14, v11, v13

    .line 71
    .line 72
    add-int/lit8 v13, v13, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    invoke-virtual {v0, v14}, Ll/jg60;->e(I)I

    .line 76
    .line 77
    .line 78
    move-result v13

    .line 79
    move v9, v10

    .line 80
    move v15, v9

    .line 81
    :goto_2
    if-ge v9, v2, :cond_5

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 84
    .line 85
    .line 86
    move-result v16

    .line 87
    if-eqz v16, :cond_3

    .line 88
    .line 89
    add-int/lit8 v15, v15, 0x59

    .line 90
    .line 91
    :cond_3
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 92
    .line 93
    .line 94
    move-result v16

    .line 95
    if-eqz v16, :cond_4

    .line 96
    .line 97
    add-int/lit8 v15, v15, 0x8

    .line 98
    .line 99
    :cond_4
    add-int/lit8 v9, v9, 0x1

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_5
    invoke-virtual {v0, v15}, Ll/jg60;->l(I)V

    .line 103
    .line 104
    .line 105
    if-lez v2, :cond_6

    .line 106
    .line 107
    rsub-int/lit8 v9, v2, 0x8

    .line 108
    .line 109
    mul-int/2addr v9, v3

    .line 110
    invoke-virtual {v0, v9}, Ll/jg60;->l(I)V

    .line 111
    .line 112
    .line 113
    :cond_6
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    move v15, v9

    .line 118
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 119
    .line 120
    .line 121
    move-result v9

    .line 122
    if-ne v9, v1, :cond_7

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 125
    .line 126
    .line 127
    :cond_7
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 128
    .line 129
    .line 130
    move-result v16

    .line 131
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 132
    .line 133
    .line 134
    move-result v17

    .line 135
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 136
    .line 137
    .line 138
    move-result v18

    .line 139
    if-eqz v18, :cond_b

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 142
    .line 143
    .line 144
    move-result v18

    .line 145
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 146
    .line 147
    .line 148
    move-result v19

    .line 149
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 150
    .line 151
    .line 152
    move-result v20

    .line 153
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 154
    .line 155
    .line 156
    move-result v21

    .line 157
    if-eq v9, v12, :cond_9

    .line 158
    .line 159
    if-ne v9, v3, :cond_8

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_8
    move/from16 v22, v12

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_9
    :goto_3
    move/from16 v22, v3

    .line 166
    .line 167
    :goto_4
    if-ne v9, v12, :cond_a

    .line 168
    .line 169
    move/from16 v23, v3

    .line 170
    .line 171
    goto :goto_5

    .line 172
    :cond_a
    move/from16 v23, v12

    .line 173
    .line 174
    :goto_5
    add-int v18, v18, v19

    .line 175
    .line 176
    mul-int v22, v22, v18

    .line 177
    .line 178
    sub-int v16, v16, v22

    .line 179
    .line 180
    add-int v20, v20, v21

    .line 181
    .line 182
    mul-int v23, v23, v20

    .line 183
    .line 184
    sub-int v17, v17, v23

    .line 185
    .line 186
    :cond_b
    move/from16 v18, v10

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 189
    .line 190
    .line 191
    move-result v10

    .line 192
    move/from16 v19, v12

    .line 193
    .line 194
    move-object v12, v11

    .line 195
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 196
    .line 197
    .line 198
    move-result v11

    .line 199
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 200
    .line 201
    .line 202
    move-result v20

    .line 203
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 204
    .line 205
    .line 206
    move-result v21

    .line 207
    if-eqz v21, :cond_c

    .line 208
    .line 209
    move/from16 v21, v18

    .line 210
    .line 211
    goto :goto_6

    .line 212
    :cond_c
    move/from16 v21, v2

    .line 213
    .line 214
    :goto_6
    move/from16 p0, v4

    .line 215
    .line 216
    move/from16 v4, v21

    .line 217
    .line 218
    :goto_7
    if-gt v4, v2, :cond_d

    .line 219
    .line 220
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 227
    .line 228
    .line 229
    add-int/lit8 v4, v4, 0x1

    .line 230
    .line 231
    goto :goto_7

    .line 232
    :cond_d
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    if-eqz v2, :cond_e

    .line 255
    .line 256
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    if-eqz v2, :cond_e

    .line 261
    .line 262
    invoke-static {v0}, Ll/jb20;->n(Ll/jg60;)V

    .line 263
    .line 264
    .line 265
    :cond_e
    invoke-virtual {v0, v3}, Ll/jg60;->l(I)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    if-eqz v2, :cond_f

    .line 273
    .line 274
    invoke-virtual {v0, v14}, Ll/jg60;->l(I)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 284
    .line 285
    .line 286
    :cond_f
    invoke-static {v0}, Ll/jb20;->p(Ll/jg60;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    if-eqz v2, :cond_10

    .line 294
    .line 295
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 296
    .line 297
    .line 298
    move-result v2

    .line 299
    move/from16 v4, v18

    .line 300
    .line 301
    :goto_8
    if-ge v4, v2, :cond_10

    .line 302
    .line 303
    add-int/lit8 v1, v20, 0x5

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Ll/jg60;->l(I)V

    .line 306
    .line 307
    .line 308
    add-int/lit8 v4, v4, 0x1

    .line 309
    .line 310
    const/4 v1, 0x3

    .line 311
    goto :goto_8

    .line 312
    :cond_10
    invoke-virtual {v0, v3}, Ll/jg60;->l(I)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    const/high16 v4, 0x3f800000    # 1.0f

    .line 320
    .line 321
    if-eqz v1, :cond_1a

    .line 322
    .line 323
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    if-eqz v1, :cond_13

    .line 328
    .line 329
    invoke-virtual {v0, v14}, Ll/jg60;->e(I)I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    const/16 v2, 0xff

    .line 334
    .line 335
    if-ne v1, v2, :cond_11

    .line 336
    .line 337
    const/16 v1, 0x10

    .line 338
    .line 339
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 340
    .line 341
    .line 342
    move-result v2

    .line 343
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-eqz v2, :cond_13

    .line 348
    .line 349
    if-eqz v1, :cond_13

    .line 350
    .line 351
    int-to-float v2, v2

    .line 352
    int-to-float v1, v1

    .line 353
    div-float v4, v2, v1

    .line 354
    .line 355
    goto :goto_9

    .line 356
    :cond_11
    sget-object v2, Ll/jb20;->b:[F

    .line 357
    .line 358
    array-length v3, v2

    .line 359
    if-ge v1, v3, :cond_12

    .line 360
    .line 361
    aget v4, v2, v1

    .line 362
    .line 363
    goto :goto_9

    .line 364
    :cond_12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    const-string v3, "Unexpected aspect_ratio_idc value: "

    .line 367
    .line 368
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    const-string v2, "NalUnitUtil"

    .line 379
    .line 380
    invoke-static {v2, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    :cond_13
    :goto_9
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    if-eqz v1, :cond_14

    .line 388
    .line 389
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 390
    .line 391
    .line 392
    :cond_14
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    if-eqz v1, :cond_17

    .line 397
    .line 398
    const/4 v1, 0x3

    .line 399
    invoke-virtual {v0, v1}, Ll/jg60;->l(I)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 403
    .line 404
    .line 405
    move-result v1

    .line 406
    if-eqz v1, :cond_15

    .line 407
    .line 408
    move/from16 v3, v19

    .line 409
    .line 410
    goto :goto_a

    .line 411
    :cond_15
    const/4 v3, 0x2

    .line 412
    :goto_a
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    if-eqz v1, :cond_16

    .line 417
    .line 418
    invoke-virtual {v0, v14}, Ll/jg60;->e(I)I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    invoke-virtual {v0, v14}, Ll/jg60;->e(I)I

    .line 423
    .line 424
    .line 425
    move-result v2

    .line 426
    invoke-virtual {v0, v14}, Ll/jg60;->l(I)V

    .line 427
    .line 428
    .line 429
    invoke-static {v1}, Ll/df5;->h(I)I

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    invoke-static {v2}, Ll/df5;->i(I)I

    .line 434
    .line 435
    .line 436
    move-result v2

    .line 437
    move/from16 v24, v2

    .line 438
    .line 439
    move v2, v1

    .line 440
    move/from16 v1, v24

    .line 441
    .line 442
    goto :goto_b

    .line 443
    :cond_16
    const/4 v1, -0x1

    .line 444
    const/4 v2, -0x1

    .line 445
    goto :goto_b

    .line 446
    :cond_17
    const/4 v1, -0x1

    .line 447
    const/4 v2, -0x1

    .line 448
    const/4 v3, -0x1

    .line 449
    :goto_b
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 450
    .line 451
    .line 452
    move-result v14

    .line 453
    if-eqz v14, :cond_18

    .line 454
    .line 455
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 456
    .line 457
    .line 458
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 459
    .line 460
    .line 461
    :cond_18
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 465
    .line 466
    .line 467
    move-result v0

    .line 468
    if-eqz v0, :cond_19

    .line 469
    .line 470
    mul-int/lit8 v17, v17, 0x2

    .line 471
    .line 472
    :cond_19
    move/from16 v20, v1

    .line 473
    .line 474
    move/from16 v18, v2

    .line 475
    .line 476
    move/from16 v19, v3

    .line 477
    .line 478
    move v14, v15

    .line 479
    move/from16 v15, v16

    .line 480
    .line 481
    move/from16 v16, v17

    .line 482
    .line 483
    :goto_c
    move/from16 v17, v4

    .line 484
    .line 485
    goto :goto_d

    .line 486
    :cond_1a
    move v14, v15

    .line 487
    move/from16 v15, v16

    .line 488
    .line 489
    move/from16 v16, v17

    .line 490
    .line 491
    const/16 v18, -0x1

    .line 492
    .line 493
    const/16 v19, -0x1

    .line 494
    .line 495
    const/16 v20, -0x1

    .line 496
    .line 497
    goto :goto_c

    .line 498
    :goto_d
    new-instance v4, Ll/jb20$a;

    .line 499
    .line 500
    invoke-direct/range {v4 .. v20}, Ll/jb20$a;-><init>(IZIIIII[IIIIIFIII)V

    .line 501
    .line 502
    .line 503
    return-object v4
.end method

.method public static j([BII)Ll/jb20$b;
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Ll/jb20;->k([BII)Ll/jb20$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static k([BII)Ll/jb20$b;
    .locals 1

    .line 1
    new-instance v0, Ll/jg60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/jg60;-><init>([BII)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    new-instance v0, Ll/jb20$b;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1, p2}, Ll/jb20$b;-><init>(IIZ)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public static l([BII)Ll/jb20$c;
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Ll/jb20;->m([BII)Ll/jb20$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static m([BII)Ll/jb20$c;
    .locals 23

    .line 1
    new-instance v0, Ll/jg60;

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/jg60;-><init>([BII)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    const/16 v2, 0x64

    .line 31
    .line 32
    const/4 v7, 0x3

    .line 33
    const/4 v9, 0x1

    .line 34
    if-eq v3, v2, :cond_1

    .line 35
    .line 36
    const/16 v2, 0x6e

    .line 37
    .line 38
    if-eq v3, v2, :cond_1

    .line 39
    .line 40
    const/16 v2, 0x7a

    .line 41
    .line 42
    if-eq v3, v2, :cond_1

    .line 43
    .line 44
    const/16 v2, 0xf4

    .line 45
    .line 46
    if-eq v3, v2, :cond_1

    .line 47
    .line 48
    const/16 v2, 0x2c

    .line 49
    .line 50
    if-eq v3, v2, :cond_1

    .line 51
    .line 52
    const/16 v2, 0x53

    .line 53
    .line 54
    if-eq v3, v2, :cond_1

    .line 55
    .line 56
    const/16 v2, 0x56

    .line 57
    .line 58
    if-eq v3, v2, :cond_1

    .line 59
    .line 60
    const/16 v2, 0x76

    .line 61
    .line 62
    if-eq v3, v2, :cond_1

    .line 63
    .line 64
    const/16 v2, 0x80

    .line 65
    .line 66
    if-eq v3, v2, :cond_1

    .line 67
    .line 68
    const/16 v2, 0x8a

    .line 69
    .line 70
    if-ne v3, v2, :cond_0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    move v2, v9

    .line 74
    const/4 v11, 0x0

    .line 75
    goto :goto_5

    .line 76
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-ne v2, v7, :cond_2

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 83
    .line 84
    .line 85
    move-result v11

    .line 86
    goto :goto_1

    .line 87
    :cond_2
    const/4 v11, 0x0

    .line 88
    :goto_1
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 98
    .line 99
    .line 100
    move-result v12

    .line 101
    if-eqz v12, :cond_6

    .line 102
    .line 103
    if-eq v2, v7, :cond_3

    .line 104
    .line 105
    move v12, v1

    .line 106
    goto :goto_2

    .line 107
    :cond_3
    const/16 v12, 0xc

    .line 108
    .line 109
    :goto_2
    const/4 v13, 0x0

    .line 110
    :goto_3
    if-ge v13, v12, :cond_6

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 113
    .line 114
    .line 115
    move-result v14

    .line 116
    if-eqz v14, :cond_5

    .line 117
    .line 118
    const/4 v14, 0x6

    .line 119
    if-ge v13, v14, :cond_4

    .line 120
    .line 121
    const/16 v14, 0x10

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_4
    const/16 v14, 0x40

    .line 125
    .line 126
    :goto_4
    invoke-static {v0, v14}, Ll/jb20;->o(Ll/jg60;I)V

    .line 127
    .line 128
    .line 129
    :cond_5
    add-int/lit8 v13, v13, 0x1

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    :goto_5
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 133
    .line 134
    .line 135
    move-result v12

    .line 136
    add-int/lit8 v13, v12, 0x4

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 139
    .line 140
    .line 141
    move-result v14

    .line 142
    if-nez v14, :cond_7

    .line 143
    .line 144
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 145
    .line 146
    .line 147
    move-result v12

    .line 148
    add-int/lit8 v12, v12, 0x4

    .line 149
    .line 150
    move/from16 v16, v9

    .line 151
    .line 152
    move/from16 p1, v11

    .line 153
    .line 154
    move v15, v12

    .line 155
    const/16 p2, 0x10

    .line 156
    .line 157
    const/4 v10, 0x0

    .line 158
    goto :goto_8

    .line 159
    :cond_7
    if-ne v14, v9, :cond_9

    .line 160
    .line 161
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 162
    .line 163
    .line 164
    move-result v12

    .line 165
    invoke-virtual {v0}, Ll/jg60;->g()I

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ll/jg60;->g()I

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 172
    .line 173
    .line 174
    move-result v15

    .line 175
    move/from16 p1, v11

    .line 176
    .line 177
    int-to-long v10, v15

    .line 178
    move/from16 v16, v9

    .line 179
    .line 180
    const/16 p2, 0x10

    .line 181
    .line 182
    const/4 v15, 0x0

    .line 183
    :goto_6
    int-to-long v8, v15

    .line 184
    cmp-long v8, v8, v10

    .line 185
    .line 186
    if-gez v8, :cond_8

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 189
    .line 190
    .line 191
    add-int/lit8 v15, v15, 0x1

    .line 192
    .line 193
    goto :goto_6

    .line 194
    :cond_8
    move v10, v12

    .line 195
    :goto_7
    const/4 v15, 0x0

    .line 196
    goto :goto_8

    .line 197
    :cond_9
    move/from16 v16, v9

    .line 198
    .line 199
    move/from16 p1, v11

    .line 200
    .line 201
    const/16 p2, 0x10

    .line 202
    .line 203
    const/4 v10, 0x0

    .line 204
    goto :goto_7

    .line 205
    :goto_8
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 206
    .line 207
    .line 208
    move-result v8

    .line 209
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 213
    .line 214
    .line 215
    move-result v9

    .line 216
    add-int/lit8 v9, v9, 0x1

    .line 217
    .line 218
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 219
    .line 220
    .line 221
    move-result v11

    .line 222
    add-int/lit8 v11, v11, 0x1

    .line 223
    .line 224
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 225
    .line 226
    .line 227
    move-result v12

    .line 228
    rsub-int/lit8 v17, v12, 0x2

    .line 229
    .line 230
    mul-int v17, v17, v11

    .line 231
    .line 232
    if-nez v12, :cond_a

    .line 233
    .line 234
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 235
    .line 236
    .line 237
    :cond_a
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 238
    .line 239
    .line 240
    mul-int/lit8 v9, v9, 0x10

    .line 241
    .line 242
    mul-int/lit8 v17, v17, 0x10

    .line 243
    .line 244
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 245
    .line 246
    .line 247
    move-result v11

    .line 248
    const/16 v18, 0x2

    .line 249
    .line 250
    if-eqz v11, :cond_e

    .line 251
    .line 252
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 253
    .line 254
    .line 255
    move-result v11

    .line 256
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 257
    .line 258
    .line 259
    move-result v19

    .line 260
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 261
    .line 262
    .line 263
    move-result v20

    .line 264
    invoke-virtual {v0}, Ll/jg60;->h()I

    .line 265
    .line 266
    .line 267
    move-result v21

    .line 268
    if-nez v2, :cond_b

    .line 269
    .line 270
    rsub-int/lit8 v2, v12, 0x2

    .line 271
    .line 272
    move/from16 v7, v16

    .line 273
    .line 274
    goto :goto_b

    .line 275
    :cond_b
    if-ne v2, v7, :cond_c

    .line 276
    .line 277
    move/from16 v7, v16

    .line 278
    .line 279
    goto :goto_9

    .line 280
    :cond_c
    move/from16 v7, v16

    .line 281
    .line 282
    move/from16 v16, v18

    .line 283
    .line 284
    :goto_9
    if-ne v2, v7, :cond_d

    .line 285
    .line 286
    move/from16 v2, v18

    .line 287
    .line 288
    goto :goto_a

    .line 289
    :cond_d
    move v2, v7

    .line 290
    :goto_a
    rsub-int/lit8 v22, v12, 0x2

    .line 291
    .line 292
    mul-int v2, v2, v22

    .line 293
    .line 294
    :goto_b
    add-int v11, v11, v19

    .line 295
    .line 296
    mul-int v11, v11, v16

    .line 297
    .line 298
    sub-int/2addr v9, v11

    .line 299
    add-int v20, v20, v21

    .line 300
    .line 301
    mul-int v20, v20, v2

    .line 302
    .line 303
    sub-int v17, v17, v20

    .line 304
    .line 305
    goto :goto_c

    .line 306
    :cond_e
    move/from16 v7, v16

    .line 307
    .line 308
    :goto_c
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 309
    .line 310
    .line 311
    move-result v2

    .line 312
    const/high16 v16, 0x3f800000    # 1.0f

    .line 313
    .line 314
    if-eqz v2, :cond_15

    .line 315
    .line 316
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 317
    .line 318
    .line 319
    move-result v2

    .line 320
    if-eqz v2, :cond_11

    .line 321
    .line 322
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 323
    .line 324
    .line 325
    move-result v2

    .line 326
    const/16 v7, 0xff

    .line 327
    .line 328
    if-ne v2, v7, :cond_f

    .line 329
    .line 330
    move/from16 v7, p2

    .line 331
    .line 332
    invoke-virtual {v0, v7}, Ll/jg60;->e(I)I

    .line 333
    .line 334
    .line 335
    move-result v2

    .line 336
    invoke-virtual {v0, v7}, Ll/jg60;->e(I)I

    .line 337
    .line 338
    .line 339
    move-result v7

    .line 340
    if-eqz v2, :cond_11

    .line 341
    .line 342
    if-eqz v7, :cond_11

    .line 343
    .line 344
    int-to-float v2, v2

    .line 345
    int-to-float v7, v7

    .line 346
    div-float v16, v2, v7

    .line 347
    .line 348
    goto :goto_d

    .line 349
    :cond_f
    sget-object v7, Ll/jb20;->b:[F

    .line 350
    .line 351
    array-length v11, v7

    .line 352
    if-ge v2, v11, :cond_10

    .line 353
    .line 354
    aget v16, v7, v2

    .line 355
    .line 356
    goto :goto_d

    .line 357
    :cond_10
    new-instance v7, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    const-string v11, "Unexpected aspect_ratio_idc value: "

    .line 360
    .line 361
    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v2

    .line 371
    const-string v7, "NalUnitUtil"

    .line 372
    .line 373
    invoke-static {v7, v2}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    :cond_11
    :goto_d
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    if-eqz v2, :cond_12

    .line 381
    .line 382
    invoke-virtual {v0}, Ll/jg60;->k()V

    .line 383
    .line 384
    .line 385
    :cond_12
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 386
    .line 387
    .line 388
    move-result v2

    .line 389
    if-eqz v2, :cond_15

    .line 390
    .line 391
    const/4 v2, 0x3

    .line 392
    invoke-virtual {v0, v2}, Ll/jg60;->l(I)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    if-eqz v2, :cond_13

    .line 400
    .line 401
    const/16 v18, 0x1

    .line 402
    .line 403
    :cond_13
    invoke-virtual {v0}, Ll/jg60;->d()Z

    .line 404
    .line 405
    .line 406
    move-result v2

    .line 407
    if-eqz v2, :cond_14

    .line 408
    .line 409
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    invoke-virtual {v0, v1}, Ll/jg60;->e(I)I

    .line 414
    .line 415
    .line 416
    move-result v7

    .line 417
    invoke-virtual {v0, v1}, Ll/jg60;->l(I)V

    .line 418
    .line 419
    .line 420
    invoke-static {v2}, Ll/df5;->h(I)I

    .line 421
    .line 422
    .line 423
    move-result v11

    .line 424
    invoke-static {v7}, Ll/df5;->i(I)I

    .line 425
    .line 426
    .line 427
    move-result v0

    .line 428
    move/from16 v19, v0

    .line 429
    .line 430
    goto :goto_f

    .line 431
    :cond_14
    const/4 v11, -0x1

    .line 432
    :goto_e
    const/16 v19, -0x1

    .line 433
    .line 434
    goto :goto_f

    .line 435
    :cond_15
    const/4 v11, -0x1

    .line 436
    const/16 v18, -0x1

    .line 437
    .line 438
    goto :goto_e

    .line 439
    :goto_f
    new-instance v2, Ll/jb20$c;

    .line 440
    .line 441
    move/from16 v7, v16

    .line 442
    .line 443
    move/from16 v16, v10

    .line 444
    .line 445
    move v10, v7

    .line 446
    move v7, v8

    .line 447
    move v8, v9

    .line 448
    move/from16 v9, v17

    .line 449
    .line 450
    move/from16 v17, v11

    .line 451
    .line 452
    move/from16 v11, p1

    .line 453
    .line 454
    invoke-direct/range {v2 .. v19}, Ll/jb20$c;-><init>(IIIIIIIFZZIIIZIII)V

    .line 455
    .line 456
    .line 457
    return-object v2
.end method

.method public static n(Ll/jg60;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x4

    .line 4
    if-ge v1, v2, :cond_5

    .line 5
    .line 6
    move v3, v0

    .line 7
    :goto_1
    const/4 v4, 0x6

    .line 8
    if-ge v3, v4, :cond_4

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/jg60;->d()Z

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const/4 v5, 0x1

    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jg60;->h()I

    .line 18
    .line 19
    .line 20
    goto :goto_3

    .line 21
    :cond_0
    shl-int/lit8 v4, v1, 0x1

    .line 22
    .line 23
    add-int/2addr v4, v2

    .line 24
    shl-int v4, v5, v4

    .line 25
    .line 26
    const/16 v6, 0x40

    .line 27
    .line 28
    invoke-static {v6, v4}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-le v1, v5, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/jg60;->g()I

    .line 35
    .line 36
    .line 37
    :cond_1
    move v6, v0

    .line 38
    :goto_2
    if-ge v6, v4, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/jg60;->g()I

    .line 41
    .line 42
    .line 43
    add-int/lit8 v6, v6, 0x1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    :goto_3
    const/4 v4, 0x3

    .line 47
    if-ne v1, v4, :cond_3

    .line 48
    .line 49
    move v5, v4

    .line 50
    :cond_3
    add-int/2addr v3, v5

    .line 51
    goto :goto_1

    .line 52
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_5
    return-void
.end method

.method public static o(Ll/jg60;I)V
    .locals 3

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    move v1, v0

    .line 6
    :goto_0
    if-ge v2, p1, :cond_2

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/jg60;->g()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/2addr v0, v1

    .line 15
    add-int/lit16 v0, v0, 0x100

    .line 16
    .line 17
    rem-int/lit16 v0, v0, 0x100

    .line 18
    .line 19
    :cond_0
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move v1, v0

    .line 23
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    return-void
.end method

.method public static p(Ll/jg60;)V
    .locals 18

    .line 1
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->h()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [I

    .line 7
    .line 8
    new-array v3, v1, [I

    .line 9
    .line 10
    const/4 v4, -0x1

    .line 11
    move v6, v1

    .line 12
    move v5, v4

    .line 13
    :goto_0
    if-ge v6, v0, :cond_11

    .line 14
    .line 15
    const/4 v7, 0x1

    .line 16
    if-eqz v6, :cond_c

    .line 17
    .line 18
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->d()Z

    .line 19
    .line 20
    .line 21
    move-result v8

    .line 22
    if-eqz v8, :cond_c

    .line 23
    .line 24
    add-int v8, v4, v5

    .line 25
    .line 26
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->d()Z

    .line 27
    .line 28
    .line 29
    move-result v9

    .line 30
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->h()I

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    add-int/2addr v10, v7

    .line 35
    mul-int/lit8 v9, v9, 0x2

    .line 36
    .line 37
    rsub-int/lit8 v9, v9, 0x1

    .line 38
    .line 39
    mul-int/2addr v9, v10

    .line 40
    add-int/lit8 v10, v8, 0x1

    .line 41
    .line 42
    new-array v11, v10, [Z

    .line 43
    .line 44
    move v12, v1

    .line 45
    :goto_1
    if-gt v12, v8, :cond_1

    .line 46
    .line 47
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->d()Z

    .line 48
    .line 49
    .line 50
    move-result v13

    .line 51
    if-nez v13, :cond_0

    .line 52
    .line 53
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->d()Z

    .line 54
    .line 55
    .line 56
    move-result v13

    .line 57
    aput-boolean v13, v11, v12

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_0
    aput-boolean v7, v11, v12

    .line 61
    .line 62
    :goto_2
    add-int/lit8 v12, v12, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    new-array v7, v10, [I

    .line 66
    .line 67
    new-array v10, v10, [I

    .line 68
    .line 69
    add-int/lit8 v12, v5, -0x1

    .line 70
    .line 71
    move v13, v1

    .line 72
    :goto_3
    if-ltz v12, :cond_3

    .line 73
    .line 74
    aget v14, v3, v12

    .line 75
    .line 76
    add-int/2addr v14, v9

    .line 77
    if-gez v14, :cond_2

    .line 78
    .line 79
    add-int v15, v4, v12

    .line 80
    .line 81
    aget-boolean v15, v11, v15

    .line 82
    .line 83
    if-eqz v15, :cond_2

    .line 84
    .line 85
    add-int/lit8 v15, v13, 0x1

    .line 86
    .line 87
    aput v14, v7, v13

    .line 88
    .line 89
    move v13, v15

    .line 90
    :cond_2
    add-int/lit8 v12, v12, -0x1

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_3
    if-gez v9, :cond_4

    .line 94
    .line 95
    aget-boolean v12, v11, v8

    .line 96
    .line 97
    if-eqz v12, :cond_4

    .line 98
    .line 99
    add-int/lit8 v12, v13, 0x1

    .line 100
    .line 101
    aput v9, v7, v13

    .line 102
    .line 103
    move v13, v12

    .line 104
    :cond_4
    move v12, v1

    .line 105
    :goto_4
    if-ge v12, v4, :cond_6

    .line 106
    .line 107
    aget v14, v2, v12

    .line 108
    .line 109
    add-int/2addr v14, v9

    .line 110
    if-gez v14, :cond_5

    .line 111
    .line 112
    aget-boolean v15, v11, v12

    .line 113
    .line 114
    if-eqz v15, :cond_5

    .line 115
    .line 116
    add-int/lit8 v15, v13, 0x1

    .line 117
    .line 118
    aput v14, v7, v13

    .line 119
    .line 120
    move v13, v15

    .line 121
    :cond_5
    add-int/lit8 v12, v12, 0x1

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_6
    invoke-static {v7, v13}, Ljava/util/Arrays;->copyOf([II)[I

    .line 125
    .line 126
    .line 127
    move-result-object v7

    .line 128
    add-int/lit8 v12, v4, -0x1

    .line 129
    .line 130
    move v14, v1

    .line 131
    :goto_5
    if-ltz v12, :cond_8

    .line 132
    .line 133
    aget v15, v2, v12

    .line 134
    .line 135
    add-int/2addr v15, v9

    .line 136
    if-lez v15, :cond_7

    .line 137
    .line 138
    aget-boolean v16, v11, v12

    .line 139
    .line 140
    if-eqz v16, :cond_7

    .line 141
    .line 142
    add-int/lit8 v16, v14, 0x1

    .line 143
    .line 144
    aput v15, v10, v14

    .line 145
    .line 146
    move/from16 v14, v16

    .line 147
    .line 148
    :cond_7
    add-int/lit8 v12, v12, -0x1

    .line 149
    .line 150
    goto :goto_5

    .line 151
    :cond_8
    if-lez v9, :cond_9

    .line 152
    .line 153
    aget-boolean v2, v11, v8

    .line 154
    .line 155
    if-eqz v2, :cond_9

    .line 156
    .line 157
    add-int/lit8 v2, v14, 0x1

    .line 158
    .line 159
    aput v9, v10, v14

    .line 160
    .line 161
    move v14, v2

    .line 162
    :cond_9
    move v2, v1

    .line 163
    :goto_6
    if-ge v2, v5, :cond_b

    .line 164
    .line 165
    aget v8, v3, v2

    .line 166
    .line 167
    add-int/2addr v8, v9

    .line 168
    if-lez v8, :cond_a

    .line 169
    .line 170
    add-int v12, v4, v2

    .line 171
    .line 172
    aget-boolean v12, v11, v12

    .line 173
    .line 174
    if-eqz v12, :cond_a

    .line 175
    .line 176
    add-int/lit8 v12, v14, 0x1

    .line 177
    .line 178
    aput v8, v10, v14

    .line 179
    .line 180
    move v14, v12

    .line 181
    :cond_a
    add-int/lit8 v2, v2, 0x1

    .line 182
    .line 183
    goto :goto_6

    .line 184
    :cond_b
    invoke-static {v10, v14}, Ljava/util/Arrays;->copyOf([II)[I

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    move-object v3, v2

    .line 189
    move-object v2, v7

    .line 190
    move v4, v13

    .line 191
    move v5, v14

    .line 192
    goto :goto_b

    .line 193
    :cond_c
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->h()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->h()I

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    new-array v4, v2, [I

    .line 202
    .line 203
    move v5, v1

    .line 204
    :goto_7
    if-ge v5, v2, :cond_e

    .line 205
    .line 206
    if-lez v5, :cond_d

    .line 207
    .line 208
    add-int/lit8 v8, v5, -0x1

    .line 209
    .line 210
    aget v8, v4, v8

    .line 211
    .line 212
    goto :goto_8

    .line 213
    :cond_d
    move v8, v1

    .line 214
    :goto_8
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->h()I

    .line 215
    .line 216
    .line 217
    move-result v9

    .line 218
    add-int/2addr v9, v7

    .line 219
    sub-int/2addr v8, v9

    .line 220
    aput v8, v4, v5

    .line 221
    .line 222
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->k()V

    .line 223
    .line 224
    .line 225
    add-int/lit8 v5, v5, 0x1

    .line 226
    .line 227
    goto :goto_7

    .line 228
    :cond_e
    new-array v5, v3, [I

    .line 229
    .line 230
    move v8, v1

    .line 231
    :goto_9
    if-ge v8, v3, :cond_10

    .line 232
    .line 233
    if-lez v8, :cond_f

    .line 234
    .line 235
    add-int/lit8 v9, v8, -0x1

    .line 236
    .line 237
    aget v9, v5, v9

    .line 238
    .line 239
    goto :goto_a

    .line 240
    :cond_f
    move v9, v1

    .line 241
    :goto_a
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->h()I

    .line 242
    .line 243
    .line 244
    move-result v10

    .line 245
    add-int/2addr v10, v7

    .line 246
    add-int/2addr v9, v10

    .line 247
    aput v9, v5, v8

    .line 248
    .line 249
    invoke-virtual/range {p0 .. p0}, Ll/jg60;->k()V

    .line 250
    .line 251
    .line 252
    add-int/lit8 v8, v8, 0x1

    .line 253
    .line 254
    goto :goto_9

    .line 255
    :cond_10
    move-object/from16 v17, v4

    .line 256
    .line 257
    move v4, v2

    .line 258
    move-object/from16 v2, v17

    .line 259
    .line 260
    move-object/from16 v17, v5

    .line 261
    .line 262
    move v5, v3

    .line 263
    move-object/from16 v3, v17

    .line 264
    .line 265
    :goto_b
    add-int/lit8 v6, v6, 0x1

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :cond_11
    return-void
.end method

.method public static q([BI)I
    .locals 8

    .line 1
    sget-object v0, Ll/jb20;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    move v3, v2

    .line 7
    :cond_0
    :goto_0
    if-ge v2, p1, :cond_2

    .line 8
    .line 9
    :try_start_0
    invoke-static {p0, v2, p1}, Ll/jb20;->d([BII)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v2, p1, :cond_0

    .line 14
    .line 15
    sget-object v4, Ll/jb20;->d:[I

    .line 16
    .line 17
    array-length v5, v4

    .line 18
    if-gt v5, v3, :cond_1

    .line 19
    .line 20
    array-length v5, v4

    .line 21
    mul-int/lit8 v5, v5, 0x2

    .line 22
    .line 23
    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([II)[I

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    sput-object v4, Ll/jb20;->d:[I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_3

    .line 32
    :cond_1
    :goto_1
    sget-object v4, Ll/jb20;->d:[I

    .line 33
    .line 34
    add-int/lit8 v5, v3, 0x1

    .line 35
    .line 36
    aput v2, v4, v3

    .line 37
    .line 38
    add-int/lit8 v2, v2, 0x3

    .line 39
    .line 40
    move v3, v5

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    sub-int/2addr p1, v3

    .line 43
    move v2, v1

    .line 44
    move v4, v2

    .line 45
    move v5, v4

    .line 46
    :goto_2
    if-ge v2, v3, :cond_3

    .line 47
    .line 48
    sget-object v6, Ll/jb20;->d:[I

    .line 49
    .line 50
    aget v6, v6, v2

    .line 51
    .line 52
    sub-int/2addr v6, v5

    .line 53
    invoke-static {p0, v5, p0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    add-int/2addr v4, v6

    .line 57
    add-int/lit8 v7, v4, 0x1

    .line 58
    .line 59
    aput-byte v1, p0, v4

    .line 60
    .line 61
    add-int/lit8 v4, v4, 0x2

    .line 62
    .line 63
    aput-byte v1, p0, v7

    .line 64
    .line 65
    add-int/lit8 v6, v6, 0x3

    .line 66
    .line 67
    add-int/2addr v5, v6

    .line 68
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    sub-int v1, p1, v4

    .line 72
    .line 73
    invoke-static {p0, v5, p0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 74
    .line 75
    .line 76
    monitor-exit v0

    .line 77
    return p1

    .line 78
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method
