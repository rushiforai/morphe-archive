.class public Ll/u4b0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public final h:Ll/wq3;


# direct methods
.method public constructor <init>(Ll/wq3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/wq3;

    .line 9
    .line 10
    iput-object p1, p0, Ll/u4b0;->h:Ll/wq3;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Ll/u4b0;->c:I

    .line 14
    .line 15
    iput p1, p0, Ll/u4b0;->b:I

    .line 16
    .line 17
    iput p1, p0, Ll/u4b0;->d:I

    .line 18
    .line 19
    iput p1, p0, Ll/u4b0;->f:I

    .line 20
    .line 21
    iput p1, p0, Ll/u4b0;->e:I

    .line 22
    .line 23
    iput p1, p0, Ll/u4b0;->a:I

    .line 24
    .line 25
    return-void
.end method

.method public static b(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p0, v1, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    const/16 v2, 0xd0

    .line 7
    .line 8
    if-lt p0, v2, :cond_1

    .line 9
    .line 10
    const/16 v2, 0xd7

    .line 11
    .line 12
    if-gt p0, v2, :cond_1

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    const/16 v2, 0xd9

    .line 16
    .line 17
    if-eq p0, v2, :cond_2

    .line 18
    .line 19
    const/16 v2, 0xd8

    .line 20
    .line 21
    if-eq p0, v2, :cond_2

    .line 22
    .line 23
    return v1

    .line 24
    :cond_2
    return v0
.end method


# virtual methods
.method public final a(Ljava/io/InputStream;)Z
    .locals 11

    .line 1
    iget v0, p0, Ll/u4b0;->e:I

    .line 2
    .line 3
    :goto_0
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x6

    .line 6
    :try_start_0
    iget v4, p0, Ll/u4b0;->a:I

    .line 7
    .line 8
    if-eq v4, v3, :cond_f

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const/4 v5, -0x1

    .line 15
    if-eq v4, v5, :cond_f

    .line 16
    .line 17
    iget v5, p0, Ll/u4b0;->c:I

    .line 18
    .line 19
    add-int/lit8 v6, v5, 0x1

    .line 20
    .line 21
    iput v6, p0, Ll/u4b0;->c:I

    .line 22
    .line 23
    iget-boolean v6, p0, Ll/u4b0;->g:Z

    .line 24
    .line 25
    if-eqz v6, :cond_0

    .line 26
    .line 27
    iput v3, p0, Ll/u4b0;->a:I

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/u4b0;->g:Z

    .line 30
    .line 31
    return v1

    .line 32
    :catch_0
    move-exception p1

    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_0
    iget v6, p0, Ll/u4b0;->a:I

    .line 36
    .line 37
    const/16 v7, 0xff

    .line 38
    .line 39
    if-eqz v6, :cond_c

    .line 40
    .line 41
    const/4 v8, 0x2

    .line 42
    if-eq v6, v2, :cond_a

    .line 43
    .line 44
    const/4 v9, 0x3

    .line 45
    if-eq v6, v8, :cond_9

    .line 46
    .line 47
    const/4 v10, 0x4

    .line 48
    if-eq v6, v9, :cond_3

    .line 49
    .line 50
    const/4 v5, 0x5

    .line 51
    if-eq v6, v10, :cond_2

    .line 52
    .line 53
    if-eq v6, v5, :cond_1

    .line 54
    .line 55
    invoke-static {v1}, Ll/wn80;->i(Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iget v5, p0, Ll/u4b0;->b:I

    .line 60
    .line 61
    shl-int/lit8 v5, v5, 0x8

    .line 62
    .line 63
    add-int/2addr v5, v4

    .line 64
    sub-int/2addr v5, v8

    .line 65
    int-to-long v6, v5

    .line 66
    invoke-static {p1, v6, v7}, Ll/x7g0;->a(Ljava/io/InputStream;J)J

    .line 67
    .line 68
    .line 69
    iget v6, p0, Ll/u4b0;->c:I

    .line 70
    .line 71
    add-int/2addr v6, v5

    .line 72
    iput v6, p0, Ll/u4b0;->c:I

    .line 73
    .line 74
    iput v8, p0, Ll/u4b0;->a:I

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    iput v5, p0, Ll/u4b0;->a:I

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    if-ne v4, v7, :cond_4

    .line 81
    .line 82
    iput v9, p0, Ll/u4b0;->a:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    if-nez v4, :cond_5

    .line 86
    .line 87
    iput v8, p0, Ll/u4b0;->a:I

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    const/16 v6, 0xd9

    .line 91
    .line 92
    if-ne v4, v6, :cond_6

    .line 93
    .line 94
    iput-boolean v2, p0, Ll/u4b0;->g:Z

    .line 95
    .line 96
    add-int/lit8 v5, v5, -0x1

    .line 97
    .line 98
    invoke-virtual {p0, v5}, Ll/u4b0;->f(I)V

    .line 99
    .line 100
    .line 101
    iput v8, p0, Ll/u4b0;->a:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_6
    const/16 v6, 0xda

    .line 105
    .line 106
    if-ne v4, v6, :cond_7

    .line 107
    .line 108
    add-int/lit8 v5, v5, -0x1

    .line 109
    .line 110
    invoke-virtual {p0, v5}, Ll/u4b0;->f(I)V

    .line 111
    .line 112
    .line 113
    :cond_7
    invoke-static {v4}, Ll/u4b0;->b(I)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-eqz v5, :cond_8

    .line 118
    .line 119
    iput v10, p0, Ll/u4b0;->a:I

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_8
    iput v8, p0, Ll/u4b0;->a:I

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_9
    if-ne v4, v7, :cond_e

    .line 126
    .line 127
    iput v9, p0, Ll/u4b0;->a:I

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_a
    const/16 v5, 0xd8

    .line 131
    .line 132
    if-ne v4, v5, :cond_b

    .line 133
    .line 134
    iput v8, p0, Ll/u4b0;->a:I

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_b
    iput v3, p0, Ll/u4b0;->a:I

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_c
    if-ne v4, v7, :cond_d

    .line 141
    .line 142
    iput v2, p0, Ll/u4b0;->a:I

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_d
    iput v3, p0, Ll/u4b0;->a:I

    .line 146
    .line 147
    :cond_e
    :goto_1
    iput v4, p0, Ll/u4b0;->b:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :goto_2
    invoke-static {p1}, Ll/vyi0;->a(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    .line 152
    .line 153
    .line 154
    :cond_f
    iget p1, p0, Ll/u4b0;->a:I

    .line 155
    .line 156
    if-eq p1, v3, :cond_10

    .line 157
    .line 158
    iget p0, p0, Ll/u4b0;->e:I

    .line 159
    .line 160
    if-eq p0, v0, :cond_10

    .line 161
    .line 162
    move v1, v2

    .line 163
    :cond_10
    return v1
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u4b0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u4b0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/u4b0;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final f(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/u4b0;->d:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/u4b0;->f:I

    .line 6
    .line 7
    :cond_0
    add-int/lit8 p1, v0, 0x1

    .line 8
    .line 9
    iput p1, p0, Ll/u4b0;->d:I

    .line 10
    .line 11
    iput v0, p0, Ll/u4b0;->e:I

    .line 12
    .line 13
    return-void
.end method

.method public g(Ll/n0f;)Z
    .locals 5

    .line 1
    iget v0, p0, Ll/u4b0;->a:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/n0f;->M()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget v1, p0, Ll/u4b0;->c:I

    .line 13
    .line 14
    if-gt v0, v1, :cond_1

    .line 15
    .line 16
    return v2

    .line 17
    :cond_1
    new-instance v0, Ll/ej80;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/n0f;->I()Ljava/io/InputStream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v1, p0, Ll/u4b0;->h:Ll/wq3;

    .line 24
    .line 25
    const/16 v3, 0x4000

    .line 26
    .line 27
    invoke-interface {v1, v3}, Ll/vi80;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, [B

    .line 32
    .line 33
    iget-object v3, p0, Ll/u4b0;->h:Ll/wq3;

    .line 34
    .line 35
    invoke-direct {v0, p1, v1, v3}, Ll/ej80;-><init>(Ljava/io/InputStream;[BLl/w4d0;)V

    .line 36
    .line 37
    .line 38
    :try_start_0
    iget p1, p0, Ll/u4b0;->c:I

    .line 39
    .line 40
    int-to-long v3, p1

    .line 41
    invoke-static {v0, v3, v4}, Ll/x7g0;->a(Ljava/io/InputStream;J)J

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/u4b0;->a(Ljava/io/InputStream;)Z

    .line 45
    .line 46
    .line 47
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    invoke-static {v0}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 49
    .line 50
    .line 51
    return p0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception p0

    .line 55
    :try_start_1
    invoke-static {p0}, Ll/vyi0;->a(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 59
    .line 60
    .line 61
    return v2

    .line 62
    :goto_0
    invoke-static {v0}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 63
    .line 64
    .line 65
    throw p0
.end method
