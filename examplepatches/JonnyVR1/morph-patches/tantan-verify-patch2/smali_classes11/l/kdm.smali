.class public final Ll/kdm;
.super Ll/gpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kdm$a;,
        Ll/kdm$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final b:Ll/kdm$a;


# instance fields
.field public final a:Ll/kdm$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jdm;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jdm;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/kdm;->b:Ll/kdm$a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0}, Ll/kdm;-><init>(Ll/kdm$a;)V

    return-void
.end method

.method public constructor <init>(Ll/kdm$a;)V
    .locals 0
    .param p1    # Ll/kdm$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/gpf0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kdm;->a:Ll/kdm$a;

    .line 5
    .line 6
    return-void
.end method

.method public static A(Ll/ig60;I)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    move v1, p0

    .line 10
    :goto_0
    add-int/lit8 v2, v1, 0x1

    .line 11
    .line 12
    add-int v3, p0, p1

    .line 13
    .line 14
    if-ge v2, v3, :cond_1

    .line 15
    .line 16
    aget-byte v3, v0, v1

    .line 17
    .line 18
    const/16 v4, 0xff

    .line 19
    .line 20
    and-int/2addr v3, v4

    .line 21
    if-ne v3, v4, :cond_0

    .line 22
    .line 23
    aget-byte v3, v0, v2

    .line 24
    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    sub-int v3, v1, p0

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    sub-int v3, p1, v3

    .line 32
    .line 33
    add-int/lit8 v3, v3, -0x2

    .line 34
    .line 35
    invoke-static {v0, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 p1, p1, -0x1

    .line 39
    .line 40
    :cond_0
    move v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return p1
.end method

.method public static B(Ll/ig60;IIZ)Z
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/ig60;->f()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x1

    .line 14
    move/from16 v5, p2

    .line 15
    .line 16
    if-lt v3, v5, :cond_c

    .line 17
    .line 18
    const/4 v3, 0x3

    .line 19
    const/4 v6, 0x0

    .line 20
    if-lt v0, v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/ig60;->q()I

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    invoke-virtual {v1}, Ll/ig60;->N()I

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto/16 :goto_5

    .line 37
    .line 38
    :cond_0
    invoke-virtual {v1}, Ll/ig60;->K()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    invoke-virtual {v1}, Ll/ig60;->K()I

    .line 43
    .line 44
    .line 45
    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    int-to-long v8, v8

    .line 47
    move v10, v6

    .line 48
    :goto_1
    const-wide/16 v11, 0x0

    .line 49
    .line 50
    if-nez v7, :cond_1

    .line 51
    .line 52
    cmp-long v7, v8, v11

    .line 53
    .line 54
    if-nez v7, :cond_1

    .line 55
    .line 56
    if-nez v10, :cond_1

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 59
    .line 60
    .line 61
    return v4

    .line 62
    :cond_1
    const/4 v7, 0x4

    .line 63
    if-ne v0, v7, :cond_3

    .line 64
    .line 65
    if-nez p3, :cond_3

    .line 66
    .line 67
    const-wide/32 v13, 0x808080

    .line 68
    .line 69
    .line 70
    and-long/2addr v13, v8

    .line 71
    cmp-long v11, v13, v11

    .line 72
    .line 73
    if-eqz v11, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 76
    .line 77
    .line 78
    return v6

    .line 79
    :cond_2
    const-wide/16 v11, 0xff

    .line 80
    .line 81
    and-long v13, v8, v11

    .line 82
    .line 83
    const/16 v15, 0x8

    .line 84
    .line 85
    shr-long v15, v8, v15

    .line 86
    .line 87
    and-long/2addr v15, v11

    .line 88
    const/16 v17, 0x7

    .line 89
    .line 90
    shl-long v15, v15, v17

    .line 91
    .line 92
    or-long/2addr v13, v15

    .line 93
    const/16 v15, 0x10

    .line 94
    .line 95
    shr-long v15, v8, v15

    .line 96
    .line 97
    and-long/2addr v15, v11

    .line 98
    const/16 v17, 0xe

    .line 99
    .line 100
    shl-long v15, v15, v17

    .line 101
    .line 102
    or-long/2addr v13, v15

    .line 103
    const/16 v15, 0x18

    .line 104
    .line 105
    shr-long/2addr v8, v15

    .line 106
    and-long/2addr v8, v11

    .line 107
    const/16 v11, 0x15

    .line 108
    .line 109
    shl-long/2addr v8, v11

    .line 110
    or-long/2addr v8, v13

    .line 111
    :cond_3
    if-ne v0, v7, :cond_6

    .line 112
    .line 113
    and-int/lit8 v3, v10, 0x40

    .line 114
    .line 115
    if-eqz v3, :cond_4

    .line 116
    .line 117
    move v3, v4

    .line 118
    goto :goto_2

    .line 119
    :cond_4
    move v3, v6

    .line 120
    :goto_2
    and-int/lit8 v7, v10, 0x1

    .line 121
    .line 122
    if-eqz v7, :cond_5

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_5
    move v4, v6

    .line 126
    goto :goto_4

    .line 127
    :cond_6
    if-ne v0, v3, :cond_8

    .line 128
    .line 129
    and-int/lit8 v3, v10, 0x20

    .line 130
    .line 131
    if-eqz v3, :cond_7

    .line 132
    .line 133
    move v3, v4

    .line 134
    goto :goto_3

    .line 135
    :cond_7
    move v3, v6

    .line 136
    :goto_3
    and-int/lit16 v7, v10, 0x80

    .line 137
    .line 138
    if-eqz v7, :cond_5

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_8
    move v3, v6

    .line 142
    move v4, v3

    .line 143
    :goto_4
    if-eqz v4, :cond_9

    .line 144
    .line 145
    add-int/lit8 v3, v3, 0x4

    .line 146
    .line 147
    :cond_9
    int-to-long v3, v3

    .line 148
    cmp-long v3, v8, v3

    .line 149
    .line 150
    if-gez v3, :cond_a

    .line 151
    .line 152
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 153
    .line 154
    .line 155
    return v6

    .line 156
    :cond_a
    :try_start_1
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 157
    .line 158
    .line 159
    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 160
    int-to-long v3, v3

    .line 161
    cmp-long v3, v3, v8

    .line 162
    .line 163
    if-gez v3, :cond_b

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 166
    .line 167
    .line 168
    return v6

    .line 169
    :cond_b
    long-to-int v3, v8

    .line 170
    :try_start_2
    invoke-virtual {v1, v3}, Ll/ig60;->V(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 171
    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_c
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 176
    .line 177
    .line 178
    return v4

    .line 179
    :goto_5
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 180
    .line 181
    .line 182
    throw v0
.end method

.method public static synthetic c(IIIII)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static d([BII)[B
    .locals 0

    .line 1
    if-gt p2, p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/bmk0;->f:[B

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static f(Ll/ig60;II)Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/kdm;->w(I)Ljava/nio/charset/Charset;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    new-array v2, p1, [B

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p0, v2, v3, p1}, Ll/ig60;->l([BII)V

    .line 15
    .line 16
    .line 17
    const-string p0, "image/"

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    if-ne p2, v4, :cond_1

    .line 21
    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ljava/lang/String;

    .line 28
    .line 29
    const/4 v5, 0x3

    .line 30
    sget-object v6, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 31
    .line 32
    invoke-direct {p0, v2, v3, v5, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Ll/i11;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p2, "image/jpg"

    .line 47
    .line 48
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    const-string p0, "image/jpeg"

    .line 55
    .line 56
    :cond_0
    move p2, v4

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-static {v2, v3}, Ll/kdm;->z([BI)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    new-instance v5, Ljava/lang/String;

    .line 63
    .line 64
    sget-object v6, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 65
    .line 66
    invoke-direct {v5, v2, v3, p2, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v5}, Ll/i11;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const/16 v5, 0x2f

    .line 74
    .line 75
    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    const/4 v6, -0x1

    .line 80
    if-ne v5, v6, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    goto :goto_0

    .line 87
    :cond_2
    move-object p0, v3

    .line 88
    :goto_0
    add-int/lit8 v3, p2, 0x1

    .line 89
    .line 90
    aget-byte v3, v2, v3

    .line 91
    .line 92
    and-int/lit16 v3, v3, 0xff

    .line 93
    .line 94
    add-int/2addr p2, v4

    .line 95
    invoke-static {v2, p2, v0}, Ll/kdm;->y([BII)I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    new-instance v5, Ljava/lang/String;

    .line 100
    .line 101
    sub-int v6, v4, p2

    .line 102
    .line 103
    invoke-direct {v5, v2, p2, v6, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Ll/kdm;->v(I)I

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    add-int/2addr v4, p2

    .line 111
    invoke-static {v2, v4, p1}, Ll/kdm;->d([BII)[B

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance p2, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;

    .line 116
    .line 117
    invoke-direct {p2, p0, v5, v3, p1}, Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;-><init>(Ljava/lang/String;Ljava/lang/String;I[B)V

    .line 118
    .line 119
    .line 120
    return-object p2
.end method

.method public static g(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;
    .locals 2

    .line 1
    new-array v0, p1, [B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1, p1}, Ll/ig60;->l([BII)V

    .line 5
    .line 6
    .line 7
    new-instance p0, Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;

    .line 8
    .line 9
    invoke-direct {p0, p2, v0}, Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;-><init>(Ljava/lang/String;[B)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public static h(Ll/ig60;IIZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;
    .locals 14
    .param p5    # Ll/kdm$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1, v0}, Ll/kdm;->z([BI)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    new-instance v3, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sub-int v4, v1, v0

    .line 20
    .line 21
    sget-object v5, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 22
    .line 23
    invoke-direct {v3, v2, v0, v4, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ll/ig60;->U(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    const-wide v6, 0xffffffffL

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    cmp-long v8, v1, v6

    .line 49
    .line 50
    const-wide/16 v9, -0x1

    .line 51
    .line 52
    if-nez v8, :cond_0

    .line 53
    .line 54
    move-wide v1, v9

    .line 55
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 56
    .line 57
    .line 58
    move-result-wide v11

    .line 59
    cmp-long v6, v11, v6

    .line 60
    .line 61
    if-nez v6, :cond_1

    .line 62
    .line 63
    move-wide v8, v9

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    move-wide v8, v11

    .line 66
    :goto_0
    new-instance v6, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    add-int/2addr v0, p1

    .line 72
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    if-ge v7, v0, :cond_3

    .line 77
    .line 78
    move/from16 v7, p2

    .line 79
    .line 80
    move/from16 v10, p3

    .line 81
    .line 82
    move/from16 v11, p4

    .line 83
    .line 84
    move-object/from16 v12, p5

    .line 85
    .line 86
    invoke-static {v7, p0, v10, v11, v12}, Ll/kdm;->k(ILl/ig60;ZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 87
    .line 88
    .line 89
    move-result-object v13

    .line 90
    if-eqz v13, :cond_2

    .line 91
    .line 92
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    const/4 p0, 0x0

    .line 97
    new-array p0, p0, [Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 98
    .line 99
    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    move-object v10, p0

    .line 104
    check-cast v10, [Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 105
    .line 106
    move-wide v6, v1

    .line 107
    new-instance v2, Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;

    .line 108
    .line 109
    invoke-direct/range {v2 .. v10}, Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;-><init>(Ljava/lang/String;IIJJ[Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;)V

    .line 110
    .line 111
    .line 112
    return-object v2
.end method

.method public static i(Ll/ig60;IIZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;
    .locals 16
    .param p5    # Ll/kdm$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2, v1}, Ll/kdm;->z([BI)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    new-instance v3, Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    sub-int v5, v2, v1

    .line 22
    .line 23
    sget-object v6, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 24
    .line 25
    invoke-direct {v3, v4, v1, v5, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 26
    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    add-int/2addr v2, v4

    .line 30
    invoke-virtual {v0, v2}, Ll/ig60;->U(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    and-int/lit8 v5, v2, 0x2

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    if-eqz v5, :cond_0

    .line 41
    .line 42
    move v5, v4

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move v5, v6

    .line 45
    :goto_0
    and-int/2addr v2, v4

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    move v2, v4

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v2, v6

    .line 51
    :goto_1
    invoke-virtual {v0}, Ll/ig60;->H()I

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    new-array v8, v7, [Ljava/lang/String;

    .line 56
    .line 57
    move v9, v6

    .line 58
    :goto_2
    if-ge v9, v7, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    invoke-static {v11, v10}, Ll/kdm;->z([BI)I

    .line 69
    .line 70
    .line 71
    move-result v11

    .line 72
    new-instance v12, Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 75
    .line 76
    .line 77
    move-result-object v13

    .line 78
    sub-int v14, v11, v10

    .line 79
    .line 80
    sget-object v15, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 81
    .line 82
    invoke-direct {v12, v13, v10, v14, v15}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 83
    .line 84
    .line 85
    aput-object v12, v8, v9

    .line 86
    .line 87
    add-int/2addr v11, v4

    .line 88
    invoke-virtual {v0, v11}, Ll/ig60;->U(I)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v9, v9, 0x1

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    add-int v1, v1, p1

    .line 100
    .line 101
    :cond_3
    :goto_3
    invoke-virtual {v0}, Ll/ig60;->f()I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    if-ge v7, v1, :cond_4

    .line 106
    .line 107
    move/from16 v7, p2

    .line 108
    .line 109
    move/from16 v9, p3

    .line 110
    .line 111
    move/from16 v10, p4

    .line 112
    .line 113
    move-object/from16 v11, p5

    .line 114
    .line 115
    invoke-static {v7, v0, v9, v10, v11}, Ll/kdm;->k(ILl/ig60;ZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    if-eqz v12, :cond_3

    .line 120
    .line 121
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_4
    new-array v0, v6, [Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 126
    .line 127
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, [Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 132
    .line 133
    new-instance v1, Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;

    .line 134
    .line 135
    move-object/from16 p5, v0

    .line 136
    .line 137
    move-object/from16 p0, v1

    .line 138
    .line 139
    move/from16 p3, v2

    .line 140
    .line 141
    move-object/from16 p1, v3

    .line 142
    .line 143
    move/from16 p2, v5

    .line 144
    .line 145
    move-object/from16 p4, v8

    .line 146
    .line 147
    invoke-direct/range {p0 .. p5}, Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;-><init>(Ljava/lang/String;ZZ[Ljava/lang/String;[Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;)V

    .line 148
    .line 149
    .line 150
    move-object/from16 v0, p0

    .line 151
    .line 152
    return-object v0
.end method

.method public static j(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ll/kdm;->w(I)Ljava/nio/charset/Charset;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x3

    .line 15
    new-array v4, v3, [B

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-virtual {p0, v4, v5, v3}, Ll/ig60;->l([BII)V

    .line 19
    .line 20
    .line 21
    new-instance v6, Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v6, v4, v5, v3}, Ljava/lang/String;-><init>([BII)V

    .line 24
    .line 25
    .line 26
    sub-int/2addr p1, v0

    .line 27
    new-array v0, p1, [B

    .line 28
    .line 29
    invoke-virtual {p0, v0, v5, p1}, Ll/ig60;->l([BII)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v5, v1}, Ll/kdm;->y([BII)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    new-instance p1, Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {p1, v0, v5, p0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/kdm;->v(I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    add-int/2addr p0, v3

    .line 46
    invoke-static {v0, p0, v1}, Ll/kdm;->y([BII)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-static {v0, p0, v1, v2}, Ll/kdm;->p([BIILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance v0, Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;

    .line 55
    .line 56
    invoke-direct {v0, v6, p1, p0}, Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public static k(ILl/ig60;ZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;
    .locals 19
    .param p4    # Ll/kdm$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move/from16 v3, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    const-string v7, "Failed to decode frame: id="

    .line 6
    .line 7
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v8, 0x0

    .line 20
    const/4 v9, 0x3

    .line 21
    if-lt v3, v9, :cond_0

    .line 22
    .line 23
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    move v5, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v5, v8

    .line 30
    :goto_0
    const/4 v10, 0x4

    .line 31
    if-ne v3, v10, :cond_2

    .line 32
    .line 33
    invoke-virtual {v6}, Ll/ig60;->L()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez p2, :cond_1

    .line 38
    .line 39
    and-int/lit16 v11, v1, 0xff

    .line 40
    .line 41
    shr-int/lit8 v12, v1, 0x8

    .line 42
    .line 43
    and-int/lit16 v12, v12, 0xff

    .line 44
    .line 45
    shl-int/lit8 v12, v12, 0x7

    .line 46
    .line 47
    or-int/2addr v11, v12

    .line 48
    shr-int/lit8 v12, v1, 0x10

    .line 49
    .line 50
    and-int/lit16 v12, v12, 0xff

    .line 51
    .line 52
    shl-int/lit8 v12, v12, 0xe

    .line 53
    .line 54
    or-int/2addr v11, v12

    .line 55
    shr-int/lit8 v1, v1, 0x18

    .line 56
    .line 57
    and-int/lit16 v1, v1, 0xff

    .line 58
    .line 59
    shl-int/lit8 v1, v1, 0x15

    .line 60
    .line 61
    or-int/2addr v1, v11

    .line 62
    :cond_1
    :goto_1
    move v11, v1

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    if-ne v3, v9, :cond_3

    .line 65
    .line 66
    invoke-virtual {v6}, Ll/ig60;->L()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_1

    .line 71
    :cond_3
    invoke-virtual {v6}, Ll/ig60;->K()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_1

    .line 76
    :goto_2
    if-lt v3, v9, :cond_4

    .line 77
    .line 78
    invoke-virtual {v6}, Ll/ig60;->N()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    move v12, v1

    .line 83
    goto :goto_3

    .line 84
    :cond_4
    move v12, v8

    .line 85
    :goto_3
    const/4 v13, 0x0

    .line 86
    if-nez v2, :cond_5

    .line 87
    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    if-nez v4, :cond_5

    .line 91
    .line 92
    if-nez v5, :cond_5

    .line 93
    .line 94
    if-nez v11, :cond_5

    .line 95
    .line 96
    if-nez v12, :cond_5

    .line 97
    .line 98
    invoke-virtual {v6}, Ll/ig60;->g()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-virtual {v6, v0}, Ll/ig60;->U(I)V

    .line 103
    .line 104
    .line 105
    return-object v13

    .line 106
    :cond_5
    invoke-virtual {v6}, Ll/ig60;->f()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    add-int v14, v1, v11

    .line 111
    .line 112
    invoke-virtual {v6}, Ll/ig60;->g()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    const-string v15, "Id3Decoder"

    .line 117
    .line 118
    if-le v14, v1, :cond_6

    .line 119
    .line 120
    const-string v0, "Frame size exceeds remaining tag data"

    .line 121
    .line 122
    invoke-static {v15, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v6}, Ll/ig60;->g()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {v6, v0}, Ll/ig60;->U(I)V

    .line 130
    .line 131
    .line 132
    return-object v13

    .line 133
    :cond_6
    if-eqz p4, :cond_7

    .line 134
    .line 135
    move v1, v3

    .line 136
    move v3, v0

    .line 137
    move-object/from16 v0, p4

    .line 138
    .line 139
    invoke-interface/range {v0 .. v5}, Ll/kdm$a;->a(IIIII)Z

    .line 140
    .line 141
    .line 142
    move-result v16

    .line 143
    move v0, v3

    .line 144
    move v3, v1

    .line 145
    move v1, v0

    .line 146
    move v0, v2

    .line 147
    move v2, v4

    .line 148
    move v4, v5

    .line 149
    if-nez v16, :cond_8

    .line 150
    .line 151
    invoke-virtual {v6, v14}, Ll/ig60;->U(I)V

    .line 152
    .line 153
    .line 154
    return-object v13

    .line 155
    :cond_7
    move v1, v0

    .line 156
    move v0, v2

    .line 157
    move v2, v4

    .line 158
    move v4, v5

    .line 159
    :cond_8
    const/4 v5, 0x1

    .line 160
    if-ne v3, v9, :cond_c

    .line 161
    .line 162
    and-int/lit16 v9, v12, 0x80

    .line 163
    .line 164
    if-eqz v9, :cond_9

    .line 165
    .line 166
    move v9, v5

    .line 167
    goto :goto_4

    .line 168
    :cond_9
    move v9, v8

    .line 169
    :goto_4
    and-int/lit8 v16, v12, 0x40

    .line 170
    .line 171
    if-eqz v16, :cond_a

    .line 172
    .line 173
    move/from16 v16, v5

    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_a
    move/from16 v16, v8

    .line 177
    .line 178
    :goto_5
    and-int/lit8 v12, v12, 0x20

    .line 179
    .line 180
    if-eqz v12, :cond_b

    .line 181
    .line 182
    move v12, v5

    .line 183
    goto :goto_6

    .line 184
    :cond_b
    move v12, v8

    .line 185
    :goto_6
    move/from16 v18, v8

    .line 186
    .line 187
    move v8, v9

    .line 188
    goto :goto_b

    .line 189
    :cond_c
    if-ne v3, v10, :cond_12

    .line 190
    .line 191
    and-int/lit8 v9, v12, 0x40

    .line 192
    .line 193
    if-eqz v9, :cond_d

    .line 194
    .line 195
    move v9, v5

    .line 196
    goto :goto_7

    .line 197
    :cond_d
    move v9, v8

    .line 198
    :goto_7
    and-int/lit8 v16, v12, 0x8

    .line 199
    .line 200
    if-eqz v16, :cond_e

    .line 201
    .line 202
    move/from16 v16, v5

    .line 203
    .line 204
    goto :goto_8

    .line 205
    :cond_e
    move/from16 v16, v8

    .line 206
    .line 207
    :goto_8
    and-int/lit8 v17, v12, 0x4

    .line 208
    .line 209
    if-eqz v17, :cond_f

    .line 210
    .line 211
    move/from16 v17, v5

    .line 212
    .line 213
    goto :goto_9

    .line 214
    :cond_f
    move/from16 v17, v8

    .line 215
    .line 216
    :goto_9
    and-int/lit8 v18, v12, 0x2

    .line 217
    .line 218
    if-eqz v18, :cond_10

    .line 219
    .line 220
    move/from16 v18, v5

    .line 221
    .line 222
    goto :goto_a

    .line 223
    :cond_10
    move/from16 v18, v8

    .line 224
    .line 225
    :goto_a
    and-int/2addr v12, v5

    .line 226
    if-eqz v12, :cond_11

    .line 227
    .line 228
    move v8, v5

    .line 229
    :cond_11
    move v12, v9

    .line 230
    move v9, v8

    .line 231
    move/from16 v8, v16

    .line 232
    .line 233
    move/from16 v16, v17

    .line 234
    .line 235
    goto :goto_b

    .line 236
    :cond_12
    move v9, v8

    .line 237
    move v12, v9

    .line 238
    move/from16 v16, v12

    .line 239
    .line 240
    move/from16 v18, v16

    .line 241
    .line 242
    :goto_b
    if-nez v8, :cond_13

    .line 243
    .line 244
    if-eqz v16, :cond_14

    .line 245
    .line 246
    :cond_13
    move-object v1, v6

    .line 247
    goto/16 :goto_10

    .line 248
    .line 249
    :cond_14
    if-eqz v12, :cond_15

    .line 250
    .line 251
    add-int/lit8 v11, v11, -0x1

    .line 252
    .line 253
    invoke-virtual {v6, v5}, Ll/ig60;->V(I)V

    .line 254
    .line 255
    .line 256
    :cond_15
    if-eqz v9, :cond_16

    .line 257
    .line 258
    add-int/lit8 v11, v11, -0x4

    .line 259
    .line 260
    invoke-virtual {v6, v10}, Ll/ig60;->V(I)V

    .line 261
    .line 262
    .line 263
    :cond_16
    if-eqz v18, :cond_17

    .line 264
    .line 265
    invoke-static {v6, v11}, Ll/kdm;->A(Ll/ig60;I)I

    .line 266
    .line 267
    .line 268
    move-result v11

    .line 269
    :cond_17
    const/16 v8, 0x54

    .line 270
    .line 271
    const/16 v5, 0x58

    .line 272
    .line 273
    const/4 v9, 0x2

    .line 274
    if-ne v0, v8, :cond_19

    .line 275
    .line 276
    if-ne v1, v5, :cond_19

    .line 277
    .line 278
    if-ne v2, v5, :cond_19

    .line 279
    .line 280
    if-eq v3, v9, :cond_18

    .line 281
    .line 282
    if-ne v4, v5, :cond_19

    .line 283
    .line 284
    :cond_18
    :try_start_0
    invoke-static {v6, v11}, Ll/kdm;->s(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    :goto_c
    move v9, v1

    .line 289
    move v10, v2

    .line 290
    move-object v1, v6

    .line 291
    move v2, v11

    .line 292
    move v11, v4

    .line 293
    goto/16 :goto_e

    .line 294
    .line 295
    :catchall_0
    move-exception v0

    .line 296
    move-object v1, v6

    .line 297
    goto/16 :goto_f

    .line 298
    .line 299
    :cond_19
    if-ne v0, v8, :cond_1a

    .line 300
    .line 301
    invoke-static {v3, v0, v1, v2, v4}, Ll/kdm;->x(IIIII)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v5

    .line 305
    invoke-static {v6, v11, v5}, Ll/kdm;->q(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    goto :goto_c

    .line 310
    :cond_1a
    const/16 v10, 0x57

    .line 311
    .line 312
    if-ne v0, v10, :cond_1c

    .line 313
    .line 314
    if-ne v1, v5, :cond_1c

    .line 315
    .line 316
    if-ne v2, v5, :cond_1c

    .line 317
    .line 318
    if-eq v3, v9, :cond_1b

    .line 319
    .line 320
    if-ne v4, v5, :cond_1c

    .line 321
    .line 322
    :cond_1b
    invoke-static {v6, v11}, Ll/kdm;->u(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    goto :goto_c

    .line 327
    :cond_1c
    if-ne v0, v10, :cond_1d

    .line 328
    .line 329
    invoke-static {v3, v0, v1, v2, v4}, Ll/kdm;->x(IIIII)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    invoke-static {v6, v11, v5}, Ll/kdm;->t(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    .line 334
    .line 335
    .line 336
    move-result-object v5

    .line 337
    goto :goto_c

    .line 338
    :cond_1d
    const/16 v5, 0x49

    .line 339
    .line 340
    const/16 v10, 0x50

    .line 341
    .line 342
    if-ne v0, v10, :cond_1e

    .line 343
    .line 344
    const/16 v12, 0x52

    .line 345
    .line 346
    if-ne v1, v12, :cond_1e

    .line 347
    .line 348
    if-ne v2, v5, :cond_1e

    .line 349
    .line 350
    const/16 v12, 0x56

    .line 351
    .line 352
    if-ne v4, v12, :cond_1e

    .line 353
    .line 354
    invoke-static {v6, v11}, Ll/kdm;->o(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    .line 355
    .line 356
    .line 357
    move-result-object v5

    .line 358
    goto :goto_c

    .line 359
    :cond_1e
    const/16 v12, 0x47

    .line 360
    .line 361
    const/16 v13, 0x4f

    .line 362
    .line 363
    if-ne v0, v12, :cond_20

    .line 364
    .line 365
    const/16 v12, 0x45

    .line 366
    .line 367
    if-ne v1, v12, :cond_20

    .line 368
    .line 369
    if-ne v2, v13, :cond_20

    .line 370
    .line 371
    const/16 v12, 0x42

    .line 372
    .line 373
    if-eq v4, v12, :cond_1f

    .line 374
    .line 375
    if-ne v3, v9, :cond_20

    .line 376
    .line 377
    :cond_1f
    invoke-static {v6, v11}, Ll/kdm;->l(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;

    .line 378
    .line 379
    .line 380
    move-result-object v5

    .line 381
    goto :goto_c

    .line 382
    :cond_20
    const/16 v12, 0x41

    .line 383
    .line 384
    const/16 v8, 0x43

    .line 385
    .line 386
    if-ne v3, v9, :cond_21

    .line 387
    .line 388
    if-ne v0, v10, :cond_22

    .line 389
    .line 390
    if-ne v1, v5, :cond_22

    .line 391
    .line 392
    if-ne v2, v8, :cond_22

    .line 393
    .line 394
    goto :goto_d

    .line 395
    :cond_21
    if-ne v0, v12, :cond_22

    .line 396
    .line 397
    if-ne v1, v10, :cond_22

    .line 398
    .line 399
    if-ne v2, v5, :cond_22

    .line 400
    .line 401
    if-ne v4, v8, :cond_22

    .line 402
    .line 403
    :goto_d
    invoke-static {v6, v11, v3}, Ll/kdm;->f(Ll/ig60;II)Lcom/google/android/exoplayer2/metadata/id3/ApicFrame;

    .line 404
    .line 405
    .line 406
    move-result-object v5

    .line 407
    goto :goto_c

    .line 408
    :cond_22
    const/16 v5, 0x4d

    .line 409
    .line 410
    if-ne v0, v8, :cond_24

    .line 411
    .line 412
    if-ne v1, v13, :cond_24

    .line 413
    .line 414
    if-ne v2, v5, :cond_24

    .line 415
    .line 416
    if-eq v4, v5, :cond_23

    .line 417
    .line 418
    if-ne v3, v9, :cond_24

    .line 419
    .line 420
    :cond_23
    invoke-static {v6, v11}, Ll/kdm;->j(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/CommentFrame;

    .line 421
    .line 422
    .line 423
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 424
    goto/16 :goto_c

    .line 425
    .line 426
    :cond_24
    if-ne v0, v8, :cond_25

    .line 427
    .line 428
    const/16 v9, 0x48

    .line 429
    .line 430
    if-ne v1, v9, :cond_25

    .line 431
    .line 432
    if-ne v2, v12, :cond_25

    .line 433
    .line 434
    if-ne v4, v10, :cond_25

    .line 435
    .line 436
    move/from16 v5, p3

    .line 437
    .line 438
    move v9, v1

    .line 439
    move v10, v2

    .line 440
    move-object v1, v6

    .line 441
    move v2, v11

    .line 442
    move-object/from16 v6, p4

    .line 443
    .line 444
    move v11, v4

    .line 445
    move/from16 v4, p2

    .line 446
    .line 447
    :try_start_1
    invoke-static/range {v1 .. v6}, Ll/kdm;->h(Ll/ig60;IIZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/ChapterFrame;

    .line 448
    .line 449
    .line 450
    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 451
    move/from16 v3, p0

    .line 452
    .line 453
    move-object/from16 v1, p1

    .line 454
    .line 455
    goto :goto_e

    .line 456
    :catchall_1
    move-exception v0

    .line 457
    move-object/from16 v1, p1

    .line 458
    .line 459
    goto/16 :goto_f

    .line 460
    .line 461
    :cond_25
    move v9, v1

    .line 462
    move v10, v2

    .line 463
    move v12, v5

    .line 464
    move v2, v11

    .line 465
    move v11, v4

    .line 466
    if-ne v0, v8, :cond_26

    .line 467
    .line 468
    const/16 v1, 0x54

    .line 469
    .line 470
    if-ne v9, v1, :cond_26

    .line 471
    .line 472
    if-ne v10, v13, :cond_26

    .line 473
    .line 474
    if-ne v11, v8, :cond_26

    .line 475
    .line 476
    move/from16 v3, p0

    .line 477
    .line 478
    move-object/from16 v1, p1

    .line 479
    .line 480
    move/from16 v4, p2

    .line 481
    .line 482
    move/from16 v5, p3

    .line 483
    .line 484
    move-object/from16 v6, p4

    .line 485
    .line 486
    :try_start_2
    invoke-static/range {v1 .. v6}, Ll/kdm;->i(Ll/ig60;IIZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/ChapterTocFrame;

    .line 487
    .line 488
    .line 489
    move-result-object v5

    .line 490
    goto :goto_e

    .line 491
    :catchall_2
    move-exception v0

    .line 492
    goto :goto_f

    .line 493
    :cond_26
    move/from16 v3, p0

    .line 494
    .line 495
    move-object/from16 v1, p1

    .line 496
    .line 497
    if-ne v0, v12, :cond_27

    .line 498
    .line 499
    const/16 v4, 0x4c

    .line 500
    .line 501
    if-ne v9, v4, :cond_27

    .line 502
    .line 503
    if-ne v10, v4, :cond_27

    .line 504
    .line 505
    const/16 v4, 0x54

    .line 506
    .line 507
    if-ne v11, v4, :cond_27

    .line 508
    .line 509
    invoke-static {v1, v2}, Ll/kdm;->n(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/MlltFrame;

    .line 510
    .line 511
    .line 512
    move-result-object v5

    .line 513
    goto :goto_e

    .line 514
    :cond_27
    invoke-static {v3, v0, v9, v10, v11}, Ll/kdm;->x(IIIII)Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v4

    .line 518
    invoke-static {v1, v2, v4}, Ll/kdm;->g(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/BinaryFrame;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    :goto_e
    if-nez v5, :cond_28

    .line 523
    .line 524
    new-instance v4, Ljava/lang/StringBuilder;

    .line 525
    .line 526
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 527
    .line 528
    .line 529
    invoke-static {v3, v0, v9, v10, v11}, Ll/kdm;->x(IIIII)Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    const-string v0, ", frameSize="

    .line 537
    .line 538
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    invoke-static {v15, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 549
    .line 550
    .line 551
    :cond_28
    invoke-virtual {v1, v14}, Ll/ig60;->U(I)V

    .line 552
    .line 553
    .line 554
    return-object v5

    .line 555
    :goto_f
    invoke-virtual {v1, v14}, Ll/ig60;->U(I)V

    .line 556
    .line 557
    .line 558
    throw v0

    .line 559
    :goto_10
    const-string v0, "Skipping unsupported compressed or encrypted frame"

    .line 560
    .line 561
    invoke-static {v15, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {v1, v14}, Ll/ig60;->U(I)V

    .line 565
    .line 566
    .line 567
    return-object v13
.end method

.method public static l(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/kdm;->w(I)Ljava/nio/charset/Charset;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    new-array v2, p1, [B

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p0, v2, v3, p1}, Ll/ig60;->l([BII)V

    .line 15
    .line 16
    .line 17
    invoke-static {v2, v3}, Ll/kdm;->z([BI)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    new-instance v4, Ljava/lang/String;

    .line 22
    .line 23
    sget-object v5, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 24
    .line 25
    invoke-direct {v4, v2, v3, p0, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 p0, p0, 0x1

    .line 29
    .line 30
    invoke-static {v2, p0, v0}, Ll/kdm;->y([BII)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-static {v2, p0, v3, v1}, Ll/kdm;->p([BIILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v0}, Ll/kdm;->v(I)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    add-int/2addr v3, v5

    .line 43
    invoke-static {v2, v3, v0}, Ll/kdm;->y([BII)I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-static {v2, v3, v5, v1}, Ll/kdm;->p([BIILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v0}, Ll/kdm;->v(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr v5, v0

    .line 56
    invoke-static {v2, v5, p1}, Ll/kdm;->d([BII)[B

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;

    .line 61
    .line 62
    invoke-direct {v0, v4, p0, v1, p1}, Lcom/google/android/exoplayer2/metadata/id3/GeobFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public static m(Ll/ig60;)Ll/kdm$b;
    .locals 8
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const-string v3, "Id3Decoder"

    .line 9
    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    const-string p0, "Data too short to be an ID3 tag"

    .line 13
    .line 14
    invoke-static {v3, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object v2

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->K()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const v1, 0x494433

    .line 23
    .line 24
    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "%06X"

    .line 36
    .line 37
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "Unexpected first three bytes of ID3 tag header: 0x"

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v3, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v2

    .line 51
    :cond_1
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-virtual {p0, v1}, Ll/ig60;->V(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    invoke-virtual {p0}, Ll/ig60;->G()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    const/4 v6, 0x2

    .line 68
    const/4 v7, 0x4

    .line 69
    if-ne v0, v6, :cond_2

    .line 70
    .line 71
    and-int/lit8 p0, v4, 0x40

    .line 72
    .line 73
    if-eqz p0, :cond_5

    .line 74
    .line 75
    const-string p0, "Skipped ID3 tag with majorVersion=2 and undefined compression scheme"

    .line 76
    .line 77
    invoke-static {v3, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object v2

    .line 81
    :cond_2
    const/4 v6, 0x3

    .line 82
    if-ne v0, v6, :cond_3

    .line 83
    .line 84
    and-int/lit8 v2, v4, 0x40

    .line 85
    .line 86
    if-eqz v2, :cond_5

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-virtual {p0, v2}, Ll/ig60;->V(I)V

    .line 93
    .line 94
    .line 95
    add-int/2addr v2, v7

    .line 96
    sub-int/2addr v5, v2

    .line 97
    goto :goto_0

    .line 98
    :cond_3
    if-ne v0, v7, :cond_7

    .line 99
    .line 100
    and-int/lit8 v2, v4, 0x40

    .line 101
    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/ig60;->G()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    add-int/lit8 v3, v2, -0x4

    .line 109
    .line 110
    invoke-virtual {p0, v3}, Ll/ig60;->V(I)V

    .line 111
    .line 112
    .line 113
    sub-int/2addr v5, v2

    .line 114
    :cond_4
    and-int/lit8 p0, v4, 0x10

    .line 115
    .line 116
    if-eqz p0, :cond_5

    .line 117
    .line 118
    add-int/lit8 v5, v5, -0xa

    .line 119
    .line 120
    :cond_5
    :goto_0
    if-ge v0, v7, :cond_6

    .line 121
    .line 122
    and-int/lit16 p0, v4, 0x80

    .line 123
    .line 124
    if-eqz p0, :cond_6

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_6
    const/4 v1, 0x0

    .line 128
    :goto_1
    new-instance p0, Ll/kdm$b;

    .line 129
    .line 130
    invoke-direct {p0, v0, v1, v5}, Ll/kdm$b;-><init>(IZI)V

    .line 131
    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v1, "Skipped ID3 tag with unsupported majorVersion="

    .line 137
    .line 138
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {v3, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-object v2
.end method

.method public static n(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/MlltFrame;
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/ig60;->N()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    invoke-virtual {p0}, Ll/ig60;->K()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p0}, Ll/ig60;->K()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    new-instance v5, Ll/hg60;

    .line 22
    .line 23
    invoke-direct {v5}, Ll/hg60;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v5, p0}, Ll/hg60;->m(Ll/ig60;)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 p1, p1, -0xa

    .line 30
    .line 31
    mul-int/lit8 p1, p1, 0x8

    .line 32
    .line 33
    add-int p0, v0, v4

    .line 34
    .line 35
    div-int/2addr p1, p0

    .line 36
    move p0, v4

    .line 37
    new-array v4, p1, [I

    .line 38
    .line 39
    move-object v6, v5

    .line 40
    new-array v5, p1, [I

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    :goto_0
    if-ge v7, p1, :cond_0

    .line 44
    .line 45
    invoke-virtual {v6, v0}, Ll/hg60;->h(I)I

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    invoke-virtual {v6, p0}, Ll/hg60;->h(I)I

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    aput v8, v4, v7

    .line 54
    .line 55
    aput v9, v5, v7

    .line 56
    .line 57
    add-int/lit8 v7, v7, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/metadata/id3/MlltFrame;

    .line 61
    .line 62
    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/metadata/id3/MlltFrame;-><init>(III[I[I)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public static o(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;
    .locals 4

    .line 1
    new-array v0, p1, [B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1, p1}, Ll/ig60;->l([BII)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/kdm;->z([BI)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    new-instance v2, Ljava/lang/String;

    .line 12
    .line 13
    sget-object v3, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 14
    .line 15
    invoke-direct {v2, v0, v1, p0, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 p0, p0, 0x1

    .line 19
    .line 20
    invoke-static {v0, p0, p1}, Ll/kdm;->d([BII)[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    .line 25
    .line 26
    invoke-direct {p1, v2, p0}, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;-><init>(Ljava/lang/String;[B)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public static p([BIILjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1

    .line 1
    if-le p2, p1, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-le p2, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 8
    .line 9
    sub-int/2addr p2, p1

    .line 10
    invoke-direct {v0, p0, p1, p2, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 11
    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    :goto_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public static q(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ge p1, v1, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    sub-int/2addr p1, v1

    .line 11
    new-array v1, p1, [B

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p0, v1, v3, p1}, Ll/ig60;->l([BII)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2, v3}, Ll/kdm;->r([BII)Lcom/google/common/collect/ImmutableList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance p1, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    .line 22
    .line 23
    invoke-direct {p1, p2, v0, p0}, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public static r([BII)Lcom/google/common/collect/ImmutableList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII)",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    const-string v1, ""

    .line 3
    .line 4
    if-lt p2, v0, :cond_0

    .line 5
    .line 6
    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p0, p2, p1}, Ll/kdm;->y([BII)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    :goto_0
    if-ge p2, v2, :cond_1

    .line 20
    .line 21
    new-instance v3, Ljava/lang/String;

    .line 22
    .line 23
    sub-int v4, v2, p2

    .line 24
    .line 25
    invoke-static {p1}, Ll/kdm;->w(I)Ljava/nio/charset/Charset;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-direct {v3, p0, p2, v4, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$a;->i(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$a;

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/kdm;->v(I)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    add-int/2addr p2, v2

    .line 40
    invoke-static {p0, p2, p1}, Ll/kdm;->y([BII)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$a;->m()Lcom/google/common/collect/ImmutableList;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :cond_2
    return-object p0
.end method

.method public static s(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sub-int/2addr p1, v0

    .line 11
    new-array v0, p1, [B

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v0, v2, p1}, Ll/ig60;->l([BII)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v2, v1}, Ll/kdm;->y([BII)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    new-instance p1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Ll/kdm;->w(I)Ljava/nio/charset/Charset;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-direct {p1, v0, v2, p0, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/kdm;->v(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    add-int/2addr p0, v2

    .line 35
    invoke-static {v0, v1, p0}, Ll/kdm;->r([BII)Lcom/google/common/collect/ImmutableList;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v0, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;

    .line 40
    .line 41
    const-string v1, "TXXX"

    .line 42
    .line 43
    invoke-direct {v0, v1, p1, p0}, Lcom/google/android/exoplayer2/metadata/id3/TextInformationFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public static t(Ll/ig60;ILjava/lang/String;)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;
    .locals 3

    .line 1
    new-array v0, p1, [B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1, p1}, Ll/ig60;->l([BII)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/kdm;->z([BI)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    new-instance p1, Ljava/lang/String;

    .line 12
    .line 13
    sget-object v2, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 14
    .line 15
    invoke-direct {p1, v0, v1, p0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p2, v0, p1}, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public static u(Ll/ig60;I)Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ge p1, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sub-int/2addr p1, v0

    .line 11
    new-array v0, p1, [B

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v0, v2, p1}, Ll/ig60;->l([BII)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v2, v1}, Ll/kdm;->y([BII)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    new-instance p1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Ll/kdm;->w(I)Ljava/nio/charset/Charset;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-direct {p1, v0, v2, p0, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/kdm;->v(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    add-int/2addr p0, v1

    .line 35
    invoke-static {v0, p0}, Ll/kdm;->z([BI)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    sget-object v2, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 40
    .line 41
    invoke-static {v0, p0, v1, v2}, Ll/kdm;->p([BIILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v0, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;

    .line 46
    .line 47
    const-string v1, "WXXX"

    .line 48
    .line 49
    invoke-direct {v0, v1, p1, p0}, Lcom/google/android/exoplayer2/metadata/id3/UrlLinkFrame;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method public static v(I)I
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    return p0

    .line 9
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public static w(I)Ljava/nio/charset/Charset;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ll/et4;->b:Ljava/nio/charset/Charset;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    sget-object p0, Ll/et4;->c:Ljava/nio/charset/Charset;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    sget-object p0, Ll/et4;->d:Ljava/nio/charset/Charset;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    sget-object p0, Ll/et4;->f:Ljava/nio/charset/Charset;

    .line 20
    .line 21
    return-object p0
.end method

.method public static x(IIIII)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "%c%c%c"

    .line 23
    .line 24
    invoke-static {p0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p4

    .line 47
    filled-new-array {p1, p2, p3, p4}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "%c%c%c%c"

    .line 52
    .line 53
    invoke-static {p0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public static y([BII)I
    .locals 2

    .line 1
    invoke-static {p0, p1}, Ll/kdm;->z([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-ne p2, v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    array-length p2, p0

    .line 12
    add-int/lit8 p2, p2, -0x1

    .line 13
    .line 14
    if-ge v0, p2, :cond_2

    .line 15
    .line 16
    sub-int p2, v0, p1

    .line 17
    .line 18
    rem-int/lit8 p2, p2, 0x2

    .line 19
    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    add-int/lit8 p2, v0, 0x1

    .line 23
    .line 24
    aget-byte p2, p0, p2

    .line 25
    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    return v0

    .line 29
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/kdm;->z([BI)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    array-length p0, p0

    .line 37
    return p0

    .line 38
    :cond_3
    :goto_1
    return v0
.end method

.method public static z([BI)I
    .locals 1

    .line 1
    :goto_0
    array-length v0, p0

    .line 2
    if-ge p1, v0, :cond_1

    .line 3
    .line 4
    aget-byte v0, p0, p1

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    array-length p0, p0

    .line 13
    return p0
.end method


# virtual methods
.method public b(Ll/ba00;Ljava/nio/ByteBuffer;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/kdm;->e([BI)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public e([BI)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ig60;

    .line 7
    .line 8
    invoke-direct {v1, p1, p2}, Ll/ig60;-><init>([BI)V

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/kdm;->m(Ll/ig60;)Ll/kdm$b;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 p2, 0x0

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    return-object p2

    .line 19
    :cond_0
    invoke-virtual {v1}, Ll/ig60;->f()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {p1}, Ll/kdm$b;->a(Ll/kdm$b;)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x2

    .line 28
    if-ne v3, v4, :cond_1

    .line 29
    .line 30
    const/4 v3, 0x6

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/16 v3, 0xa

    .line 33
    .line 34
    :goto_0
    invoke-static {p1}, Ll/kdm$b;->b(Ll/kdm$b;)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-static {p1}, Ll/kdm$b;->c(Ll/kdm$b;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-eqz v5, :cond_2

    .line 43
    .line 44
    invoke-static {p1}, Ll/kdm$b;->b(Ll/kdm$b;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-static {v1, v4}, Ll/kdm;->A(Ll/ig60;I)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    :cond_2
    add-int/2addr v2, v4

    .line 53
    invoke-virtual {v1, v2}, Ll/ig60;->T(I)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1}, Ll/kdm$b;->a(Ll/kdm$b;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    const/4 v4, 0x0

    .line 61
    invoke-static {v1, v2, v3, v4}, Ll/kdm;->B(Ll/ig60;IIZ)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_4

    .line 66
    .line 67
    invoke-static {p1}, Ll/kdm$b;->a(Ll/kdm$b;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v4, 0x4

    .line 72
    if-ne v2, v4, :cond_3

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-static {v1, v4, v3, v2}, Ll/kdm;->B(Ll/ig60;IIZ)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_3

    .line 80
    .line 81
    move v4, v2

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v0, "Failed to validate ID3 tag with majorVersion="

    .line 86
    .line 87
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1}, Ll/kdm$b;->a(Ll/kdm$b;)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    const-string p1, "Id3Decoder"

    .line 102
    .line 103
    invoke-static {p1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-object p2

    .line 107
    :cond_4
    :goto_1
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-lt p2, v3, :cond_5

    .line 112
    .line 113
    invoke-static {p1}, Ll/kdm$b;->a(Ll/kdm$b;)I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    iget-object v2, p0, Ll/kdm;->a:Ll/kdm$a;

    .line 118
    .line 119
    invoke-static {p2, v1, v4, v3, v2}, Ll/kdm;->k(ILl/ig60;ZILl/kdm$a;)Lcom/google/android/exoplayer2/metadata/id3/Id3Frame;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    if-eqz p2, :cond_4

    .line 124
    .line 125
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_5
    new-instance p0, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 130
    .line 131
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>(Ljava/util/List;)V

    .line 132
    .line 133
    .line 134
    return-object p0
.end method
