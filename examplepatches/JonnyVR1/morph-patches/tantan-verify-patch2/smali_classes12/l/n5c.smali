.class public final Ll/n5c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:[B


# direct methods
.method public constructor <init>(I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/n5c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/n5c;->b:[B

    .line 7
    .line 8
    return-void
.end method

.method public static b([BLl/n9l0;)[Ll/n5c;
    .locals 13

    .line 1
    invoke-virtual {p1}, Ll/n9l0;->d()Ll/n9l0$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n9l0$c;->a()[Ll/n9l0$b;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    array-length v2, v1

    .line 10
    const/4 v3, 0x0

    .line 11
    move v4, v3

    .line 12
    move v5, v4

    .line 13
    :goto_0
    if-ge v4, v2, :cond_0

    .line 14
    .line 15
    aget-object v6, v1, v4

    .line 16
    .line 17
    invoke-virtual {v6}, Ll/n9l0$b;->a()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    add-int/2addr v5, v6

    .line 22
    add-int/lit8 v4, v4, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-array v2, v5, [Ll/n5c;

    .line 26
    .line 27
    array-length v4, v1

    .line 28
    move v5, v3

    .line 29
    move v6, v5

    .line 30
    :goto_1
    if-ge v5, v4, :cond_2

    .line 31
    .line 32
    aget-object v7, v1, v5

    .line 33
    .line 34
    move v8, v3

    .line 35
    :goto_2
    invoke-virtual {v7}, Ll/n9l0$b;->a()I

    .line 36
    .line 37
    .line 38
    move-result v9

    .line 39
    if-ge v8, v9, :cond_1

    .line 40
    .line 41
    invoke-virtual {v7}, Ll/n9l0$b;->b()I

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    invoke-virtual {v0}, Ll/n9l0$c;->b()I

    .line 46
    .line 47
    .line 48
    move-result v10

    .line 49
    add-int/2addr v10, v9

    .line 50
    add-int/lit8 v11, v6, 0x1

    .line 51
    .line 52
    new-instance v12, Ll/n5c;

    .line 53
    .line 54
    new-array v10, v10, [B

    .line 55
    .line 56
    invoke-direct {v12, v9, v10}, Ll/n5c;-><init>(I[B)V

    .line 57
    .line 58
    .line 59
    aput-object v12, v2, v6

    .line 60
    .line 61
    add-int/lit8 v8, v8, 0x1

    .line 62
    .line 63
    move v6, v11

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    aget-object v1, v2, v3

    .line 69
    .line 70
    iget-object v1, v1, Ll/n5c;->b:[B

    .line 71
    .line 72
    array-length v1, v1

    .line 73
    invoke-virtual {v0}, Ll/n9l0$c;->b()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    sub-int/2addr v1, v0

    .line 78
    add-int/lit8 v0, v1, -0x1

    .line 79
    .line 80
    move v4, v3

    .line 81
    move v5, v4

    .line 82
    :goto_3
    if-ge v4, v0, :cond_4

    .line 83
    .line 84
    move v7, v3

    .line 85
    :goto_4
    if-ge v7, v6, :cond_3

    .line 86
    .line 87
    aget-object v8, v2, v7

    .line 88
    .line 89
    iget-object v8, v8, Ll/n5c;->b:[B

    .line 90
    .line 91
    add-int/lit8 v9, v5, 0x1

    .line 92
    .line 93
    aget-byte v5, p0, v5

    .line 94
    .line 95
    aput-byte v5, v8, v4

    .line 96
    .line 97
    add-int/lit8 v7, v7, 0x1

    .line 98
    .line 99
    move v5, v9

    .line 100
    goto :goto_4

    .line 101
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_4
    invoke-virtual {p1}, Ll/n9l0;->i()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    const/16 v4, 0x18

    .line 109
    .line 110
    if-ne p1, v4, :cond_5

    .line 111
    .line 112
    const/4 p1, 0x1

    .line 113
    goto :goto_5

    .line 114
    :cond_5
    move p1, v3

    .line 115
    :goto_5
    if-eqz p1, :cond_6

    .line 116
    .line 117
    const/16 v4, 0x8

    .line 118
    .line 119
    goto :goto_6

    .line 120
    :cond_6
    move v4, v6

    .line 121
    :goto_6
    move v7, v3

    .line 122
    :goto_7
    if-ge v7, v4, :cond_7

    .line 123
    .line 124
    aget-object v8, v2, v7

    .line 125
    .line 126
    iget-object v8, v8, Ll/n5c;->b:[B

    .line 127
    .line 128
    add-int/lit8 v9, v5, 0x1

    .line 129
    .line 130
    aget-byte v5, p0, v5

    .line 131
    .line 132
    aput-byte v5, v8, v0

    .line 133
    .line 134
    add-int/lit8 v7, v7, 0x1

    .line 135
    .line 136
    move v5, v9

    .line 137
    goto :goto_7

    .line 138
    :cond_7
    aget-object v0, v2, v3

    .line 139
    .line 140
    iget-object v0, v0, Ll/n5c;->b:[B

    .line 141
    .line 142
    array-length v0, v0

    .line 143
    :goto_8
    if-ge v1, v0, :cond_b

    .line 144
    .line 145
    move v4, v3

    .line 146
    :goto_9
    if-ge v4, v6, :cond_a

    .line 147
    .line 148
    if-eqz p1, :cond_8

    .line 149
    .line 150
    add-int/lit8 v7, v4, 0x8

    .line 151
    .line 152
    rem-int/2addr v7, v6

    .line 153
    goto :goto_a

    .line 154
    :cond_8
    move v7, v4

    .line 155
    :goto_a
    if-eqz p1, :cond_9

    .line 156
    .line 157
    const/4 v8, 0x7

    .line 158
    if-le v7, v8, :cond_9

    .line 159
    .line 160
    add-int/lit8 v8, v1, -0x1

    .line 161
    .line 162
    goto :goto_b

    .line 163
    :cond_9
    move v8, v1

    .line 164
    :goto_b
    aget-object v7, v2, v7

    .line 165
    .line 166
    iget-object v7, v7, Ll/n5c;->b:[B

    .line 167
    .line 168
    add-int/lit8 v9, v5, 0x1

    .line 169
    .line 170
    aget-byte v5, p0, v5

    .line 171
    .line 172
    aput-byte v5, v7, v8

    .line 173
    .line 174
    add-int/lit8 v4, v4, 0x1

    .line 175
    .line 176
    move v5, v9

    .line 177
    goto :goto_9

    .line 178
    :cond_a
    add-int/lit8 v1, v1, 0x1

    .line 179
    .line 180
    goto :goto_8

    .line 181
    :cond_b
    array-length p0, p0

    .line 182
    if-ne v5, p0, :cond_c

    .line 183
    .line 184
    return-object v2

    .line 185
    :cond_c
    invoke-static {}, Ll/fig0;->a()V

    .line 186
    .line 187
    .line 188
    const/4 p0, 0x0

    .line 189
    return-object p0
.end method


# virtual methods
.method public a()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n5c;->b:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n5c;->a:I

    .line 2
    .line 3
    return p0
.end method
