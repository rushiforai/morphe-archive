.class public abstract Lorg/spongycastle/math/raw/Nat224;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static add([II[II[II)I
    .locals 9

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    add-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p4, p5

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    ushr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p1, 0x1

    .line 22
    .line 23
    aget v5, p0, v5

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    and-long/2addr v5, v2

    .line 27
    add-int/lit8 v7, p3, 0x1

    .line 28
    .line 29
    aget v7, p2, v7

    .line 30
    .line 31
    int-to-long v7, v7

    .line 32
    and-long/2addr v7, v2

    .line 33
    add-long/2addr v5, v7

    .line 34
    add-long/2addr v0, v5

    .line 35
    add-int/lit8 v5, p5, 0x1

    .line 36
    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p4, v5

    .line 39
    .line 40
    ushr-long/2addr v0, v4

    .line 41
    add-int/lit8 v5, p1, 0x2

    .line 42
    .line 43
    aget v5, p0, v5

    .line 44
    .line 45
    int-to-long v5, v5

    .line 46
    and-long/2addr v5, v2

    .line 47
    add-int/lit8 v7, p3, 0x2

    .line 48
    .line 49
    aget v7, p2, v7

    .line 50
    .line 51
    int-to-long v7, v7

    .line 52
    and-long/2addr v7, v2

    .line 53
    add-long/2addr v5, v7

    .line 54
    add-long/2addr v0, v5

    .line 55
    add-int/lit8 v5, p5, 0x2

    .line 56
    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p4, v5

    .line 59
    .line 60
    ushr-long/2addr v0, v4

    .line 61
    add-int/lit8 v5, p1, 0x3

    .line 62
    .line 63
    aget v5, p0, v5

    .line 64
    .line 65
    int-to-long v5, v5

    .line 66
    and-long/2addr v5, v2

    .line 67
    add-int/lit8 v7, p3, 0x3

    .line 68
    .line 69
    aget v7, p2, v7

    .line 70
    .line 71
    int-to-long v7, v7

    .line 72
    and-long/2addr v7, v2

    .line 73
    add-long/2addr v5, v7

    .line 74
    add-long/2addr v0, v5

    .line 75
    add-int/lit8 v5, p5, 0x3

    .line 76
    .line 77
    long-to-int v6, v0

    .line 78
    aput v6, p4, v5

    .line 79
    .line 80
    ushr-long/2addr v0, v4

    .line 81
    add-int/lit8 v5, p1, 0x4

    .line 82
    .line 83
    aget v5, p0, v5

    .line 84
    .line 85
    int-to-long v5, v5

    .line 86
    and-long/2addr v5, v2

    .line 87
    add-int/lit8 v7, p3, 0x4

    .line 88
    .line 89
    aget v7, p2, v7

    .line 90
    .line 91
    int-to-long v7, v7

    .line 92
    and-long/2addr v7, v2

    .line 93
    add-long/2addr v5, v7

    .line 94
    add-long/2addr v0, v5

    .line 95
    add-int/lit8 v5, p5, 0x4

    .line 96
    .line 97
    long-to-int v6, v0

    .line 98
    aput v6, p4, v5

    .line 99
    .line 100
    ushr-long/2addr v0, v4

    .line 101
    add-int/lit8 v5, p1, 0x5

    .line 102
    .line 103
    aget v5, p0, v5

    .line 104
    .line 105
    int-to-long v5, v5

    .line 106
    and-long/2addr v5, v2

    .line 107
    add-int/lit8 v7, p3, 0x5

    .line 108
    .line 109
    aget v7, p2, v7

    .line 110
    .line 111
    int-to-long v7, v7

    .line 112
    and-long/2addr v7, v2

    .line 113
    add-long/2addr v5, v7

    .line 114
    add-long/2addr v0, v5

    .line 115
    add-int/lit8 v5, p5, 0x5

    .line 116
    .line 117
    long-to-int v6, v0

    .line 118
    aput v6, p4, v5

    .line 119
    .line 120
    ushr-long/2addr v0, v4

    .line 121
    add-int/lit8 p1, p1, 0x6

    .line 122
    .line 123
    aget p0, p0, p1

    .line 124
    .line 125
    int-to-long p0, p0

    .line 126
    and-long/2addr p0, v2

    .line 127
    add-int/lit8 p3, p3, 0x6

    .line 128
    .line 129
    aget p2, p2, p3

    .line 130
    .line 131
    int-to-long p2, p2

    .line 132
    and-long/2addr p2, v2

    .line 133
    add-long/2addr p0, p2

    .line 134
    add-long/2addr v0, p0

    .line 135
    add-int/lit8 p5, p5, 0x6

    .line 136
    .line 137
    long-to-int p0, v0

    .line 138
    aput p0, p4, p5

    .line 139
    .line 140
    ushr-long p0, v0, v4

    .line 141
    .line 142
    long-to-int p0, p0

    .line 143
    return p0
.end method

.method public static add([I[I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 144
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    long-to-int v5, v1

    .line 145
    aput v5, p2, v0

    const/16 v0, 0x20

    ushr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 146
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 147
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 148
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 149
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 150
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 151
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 152
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 153
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x5

    .line 154
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 155
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x6

    .line 156
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long p0, p0

    and-long/2addr p0, v3

    add-long/2addr v6, p0

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 157
    aput p0, p2, v5

    ushr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static addBothTo([II[II[II)I
    .locals 10

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    add-long/2addr v0, v4

    .line 15
    aget v4, p4, p5

    .line 16
    .line 17
    int-to-long v4, v4

    .line 18
    and-long/2addr v4, v2

    .line 19
    add-long/2addr v0, v4

    .line 20
    long-to-int v4, v0

    .line 21
    aput v4, p4, p5

    .line 22
    .line 23
    const/16 v4, 0x20

    .line 24
    .line 25
    ushr-long/2addr v0, v4

    .line 26
    add-int/lit8 v5, p1, 0x1

    .line 27
    .line 28
    aget v5, p0, v5

    .line 29
    .line 30
    int-to-long v5, v5

    .line 31
    and-long/2addr v5, v2

    .line 32
    add-int/lit8 v7, p3, 0x1

    .line 33
    .line 34
    aget v7, p2, v7

    .line 35
    .line 36
    int-to-long v7, v7

    .line 37
    and-long/2addr v7, v2

    .line 38
    add-long/2addr v5, v7

    .line 39
    add-int/lit8 v7, p5, 0x1

    .line 40
    .line 41
    aget v8, p4, v7

    .line 42
    .line 43
    int-to-long v8, v8

    .line 44
    and-long/2addr v8, v2

    .line 45
    add-long/2addr v5, v8

    .line 46
    add-long/2addr v0, v5

    .line 47
    long-to-int v5, v0

    .line 48
    aput v5, p4, v7

    .line 49
    .line 50
    ushr-long/2addr v0, v4

    .line 51
    add-int/lit8 v5, p1, 0x2

    .line 52
    .line 53
    aget v5, p0, v5

    .line 54
    .line 55
    int-to-long v5, v5

    .line 56
    and-long/2addr v5, v2

    .line 57
    add-int/lit8 v7, p3, 0x2

    .line 58
    .line 59
    aget v7, p2, v7

    .line 60
    .line 61
    int-to-long v7, v7

    .line 62
    and-long/2addr v7, v2

    .line 63
    add-long/2addr v5, v7

    .line 64
    add-int/lit8 v7, p5, 0x2

    .line 65
    .line 66
    aget v8, p4, v7

    .line 67
    .line 68
    int-to-long v8, v8

    .line 69
    and-long/2addr v8, v2

    .line 70
    add-long/2addr v5, v8

    .line 71
    add-long/2addr v0, v5

    .line 72
    long-to-int v5, v0

    .line 73
    aput v5, p4, v7

    .line 74
    .line 75
    ushr-long/2addr v0, v4

    .line 76
    add-int/lit8 v5, p1, 0x3

    .line 77
    .line 78
    aget v5, p0, v5

    .line 79
    .line 80
    int-to-long v5, v5

    .line 81
    and-long/2addr v5, v2

    .line 82
    add-int/lit8 v7, p3, 0x3

    .line 83
    .line 84
    aget v7, p2, v7

    .line 85
    .line 86
    int-to-long v7, v7

    .line 87
    and-long/2addr v7, v2

    .line 88
    add-long/2addr v5, v7

    .line 89
    add-int/lit8 v7, p5, 0x3

    .line 90
    .line 91
    aget v8, p4, v7

    .line 92
    .line 93
    int-to-long v8, v8

    .line 94
    and-long/2addr v8, v2

    .line 95
    add-long/2addr v5, v8

    .line 96
    add-long/2addr v0, v5

    .line 97
    long-to-int v5, v0

    .line 98
    aput v5, p4, v7

    .line 99
    .line 100
    ushr-long/2addr v0, v4

    .line 101
    add-int/lit8 v5, p1, 0x4

    .line 102
    .line 103
    aget v5, p0, v5

    .line 104
    .line 105
    int-to-long v5, v5

    .line 106
    and-long/2addr v5, v2

    .line 107
    add-int/lit8 v7, p3, 0x4

    .line 108
    .line 109
    aget v7, p2, v7

    .line 110
    .line 111
    int-to-long v7, v7

    .line 112
    and-long/2addr v7, v2

    .line 113
    add-long/2addr v5, v7

    .line 114
    add-int/lit8 v7, p5, 0x4

    .line 115
    .line 116
    aget v8, p4, v7

    .line 117
    .line 118
    int-to-long v8, v8

    .line 119
    and-long/2addr v8, v2

    .line 120
    add-long/2addr v5, v8

    .line 121
    add-long/2addr v0, v5

    .line 122
    long-to-int v5, v0

    .line 123
    aput v5, p4, v7

    .line 124
    .line 125
    ushr-long/2addr v0, v4

    .line 126
    add-int/lit8 v5, p1, 0x5

    .line 127
    .line 128
    aget v5, p0, v5

    .line 129
    .line 130
    int-to-long v5, v5

    .line 131
    and-long/2addr v5, v2

    .line 132
    add-int/lit8 v7, p3, 0x5

    .line 133
    .line 134
    aget v7, p2, v7

    .line 135
    .line 136
    int-to-long v7, v7

    .line 137
    and-long/2addr v7, v2

    .line 138
    add-long/2addr v5, v7

    .line 139
    add-int/lit8 v7, p5, 0x5

    .line 140
    .line 141
    aget v8, p4, v7

    .line 142
    .line 143
    int-to-long v8, v8

    .line 144
    and-long/2addr v8, v2

    .line 145
    add-long/2addr v5, v8

    .line 146
    add-long/2addr v0, v5

    .line 147
    long-to-int v5, v0

    .line 148
    aput v5, p4, v7

    .line 149
    .line 150
    ushr-long/2addr v0, v4

    .line 151
    add-int/lit8 p1, p1, 0x6

    .line 152
    .line 153
    aget p0, p0, p1

    .line 154
    .line 155
    int-to-long p0, p0

    .line 156
    and-long/2addr p0, v2

    .line 157
    add-int/lit8 p3, p3, 0x6

    .line 158
    .line 159
    aget p2, p2, p3

    .line 160
    .line 161
    int-to-long p2, p2

    .line 162
    and-long/2addr p2, v2

    .line 163
    add-long/2addr p0, p2

    .line 164
    add-int/lit8 p5, p5, 0x6

    .line 165
    .line 166
    aget p2, p4, p5

    .line 167
    .line 168
    int-to-long p2, p2

    .line 169
    and-long/2addr p2, v2

    .line 170
    add-long/2addr p0, p2

    .line 171
    add-long/2addr v0, p0

    .line 172
    long-to-int p0, v0

    .line 173
    aput p0, p4, p5

    .line 174
    .line 175
    ushr-long p0, v0, v4

    .line 176
    .line 177
    long-to-int p0, p0

    .line 178
    return p0
.end method

.method public static addBothTo([I[I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 179
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    aget v5, p2, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    long-to-int v5, v1

    .line 180
    aput v5, p2, v0

    const/16 v0, 0x20

    ushr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 181
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    aget v8, p2, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 182
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 183
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    aget v8, p2, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 184
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 185
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    aget v8, p2, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 186
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 187
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    aget v8, p2, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 188
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x5

    .line 189
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    aget v8, p2, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 190
    aput v6, p2, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x6

    .line 191
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long p0, p0

    and-long/2addr p0, v3

    add-long/2addr v6, p0

    aget p0, p2, v5

    int-to-long p0, p0

    and-long/2addr p0, v3

    add-long/2addr v6, p0

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 192
    aput p0, p2, v5

    ushr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static addTo([II[III)I
    .locals 9

    .line 1
    int-to-long v0, p4

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p4, p0, p1

    .line 9
    .line 10
    int-to-long v4, p4

    .line 11
    and-long/2addr v4, v2

    .line 12
    aget p4, p2, p3

    .line 13
    .line 14
    int-to-long v6, p4

    .line 15
    and-long/2addr v6, v2

    .line 16
    add-long/2addr v4, v6

    .line 17
    add-long/2addr v0, v4

    .line 18
    long-to-int p4, v0

    .line 19
    aput p4, p2, p3

    .line 20
    .line 21
    const/16 p4, 0x20

    .line 22
    .line 23
    ushr-long/2addr v0, p4

    .line 24
    add-int/lit8 v4, p1, 0x1

    .line 25
    .line 26
    aget v4, p0, v4

    .line 27
    .line 28
    int-to-long v4, v4

    .line 29
    and-long/2addr v4, v2

    .line 30
    add-int/lit8 v6, p3, 0x1

    .line 31
    .line 32
    aget v7, p2, v6

    .line 33
    .line 34
    int-to-long v7, v7

    .line 35
    and-long/2addr v7, v2

    .line 36
    add-long/2addr v4, v7

    .line 37
    add-long/2addr v0, v4

    .line 38
    long-to-int v4, v0

    .line 39
    aput v4, p2, v6

    .line 40
    .line 41
    ushr-long/2addr v0, p4

    .line 42
    add-int/lit8 v4, p1, 0x2

    .line 43
    .line 44
    aget v4, p0, v4

    .line 45
    .line 46
    int-to-long v4, v4

    .line 47
    and-long/2addr v4, v2

    .line 48
    add-int/lit8 v6, p3, 0x2

    .line 49
    .line 50
    aget v7, p2, v6

    .line 51
    .line 52
    int-to-long v7, v7

    .line 53
    and-long/2addr v7, v2

    .line 54
    add-long/2addr v4, v7

    .line 55
    add-long/2addr v0, v4

    .line 56
    long-to-int v4, v0

    .line 57
    aput v4, p2, v6

    .line 58
    .line 59
    ushr-long/2addr v0, p4

    .line 60
    add-int/lit8 v4, p1, 0x3

    .line 61
    .line 62
    aget v4, p0, v4

    .line 63
    .line 64
    int-to-long v4, v4

    .line 65
    and-long/2addr v4, v2

    .line 66
    add-int/lit8 v6, p3, 0x3

    .line 67
    .line 68
    aget v7, p2, v6

    .line 69
    .line 70
    int-to-long v7, v7

    .line 71
    and-long/2addr v7, v2

    .line 72
    add-long/2addr v4, v7

    .line 73
    add-long/2addr v0, v4

    .line 74
    long-to-int v4, v0

    .line 75
    aput v4, p2, v6

    .line 76
    .line 77
    ushr-long/2addr v0, p4

    .line 78
    add-int/lit8 v4, p1, 0x4

    .line 79
    .line 80
    aget v4, p0, v4

    .line 81
    .line 82
    int-to-long v4, v4

    .line 83
    and-long/2addr v4, v2

    .line 84
    add-int/lit8 v6, p3, 0x4

    .line 85
    .line 86
    aget v7, p2, v6

    .line 87
    .line 88
    int-to-long v7, v7

    .line 89
    and-long/2addr v7, v2

    .line 90
    add-long/2addr v4, v7

    .line 91
    add-long/2addr v0, v4

    .line 92
    long-to-int v4, v0

    .line 93
    aput v4, p2, v6

    .line 94
    .line 95
    ushr-long/2addr v0, p4

    .line 96
    add-int/lit8 v4, p1, 0x5

    .line 97
    .line 98
    aget v4, p0, v4

    .line 99
    .line 100
    int-to-long v4, v4

    .line 101
    and-long/2addr v4, v2

    .line 102
    add-int/lit8 v6, p3, 0x5

    .line 103
    .line 104
    aget v7, p2, v6

    .line 105
    .line 106
    int-to-long v7, v7

    .line 107
    and-long/2addr v7, v2

    .line 108
    add-long/2addr v4, v7

    .line 109
    add-long/2addr v0, v4

    .line 110
    long-to-int v4, v0

    .line 111
    aput v4, p2, v6

    .line 112
    .line 113
    ushr-long/2addr v0, p4

    .line 114
    add-int/lit8 p1, p1, 0x6

    .line 115
    .line 116
    aget p0, p0, p1

    .line 117
    .line 118
    int-to-long p0, p0

    .line 119
    and-long/2addr p0, v2

    .line 120
    add-int/lit8 p3, p3, 0x6

    .line 121
    .line 122
    aget v4, p2, p3

    .line 123
    .line 124
    int-to-long v4, v4

    .line 125
    and-long/2addr v2, v4

    .line 126
    add-long/2addr p0, v2

    .line 127
    add-long/2addr v0, p0

    .line 128
    long-to-int p0, v0

    .line 129
    aput p0, p2, p3

    .line 130
    .line 131
    ushr-long p0, v0, p4

    .line 132
    .line 133
    long-to-int p0, p0

    .line 134
    return p0
.end method

.method public static addTo([I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 135
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    long-to-int v5, v1

    .line 136
    aput v5, p1, v0

    const/16 v0, 0x20

    ushr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 137
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 138
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 139
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 140
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 141
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 142
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 143
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 144
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x5

    .line 145
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 146
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x6

    .line 147
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long v8, p0

    and-long/2addr v3, v8

    add-long/2addr v6, v3

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 148
    aput p0, p1, v5

    ushr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static addToEachOther([II[II)I
    .locals 11

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    add-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p0, p1

    .line 17
    .line 18
    aput v4, p2, p3

    .line 19
    .line 20
    const/16 v4, 0x20

    .line 21
    .line 22
    ushr-long/2addr v0, v4

    .line 23
    add-int/lit8 v5, p1, 0x1

    .line 24
    .line 25
    aget v6, p0, v5

    .line 26
    .line 27
    int-to-long v6, v6

    .line 28
    and-long/2addr v6, v2

    .line 29
    add-int/lit8 v8, p3, 0x1

    .line 30
    .line 31
    aget v9, p2, v8

    .line 32
    .line 33
    int-to-long v9, v9

    .line 34
    and-long/2addr v9, v2

    .line 35
    add-long/2addr v6, v9

    .line 36
    add-long/2addr v0, v6

    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p0, v5

    .line 39
    .line 40
    aput v6, p2, v8

    .line 41
    .line 42
    ushr-long/2addr v0, v4

    .line 43
    add-int/lit8 v5, p1, 0x2

    .line 44
    .line 45
    aget v6, p0, v5

    .line 46
    .line 47
    int-to-long v6, v6

    .line 48
    and-long/2addr v6, v2

    .line 49
    add-int/lit8 v8, p3, 0x2

    .line 50
    .line 51
    aget v9, p2, v8

    .line 52
    .line 53
    int-to-long v9, v9

    .line 54
    and-long/2addr v9, v2

    .line 55
    add-long/2addr v6, v9

    .line 56
    add-long/2addr v0, v6

    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p0, v5

    .line 59
    .line 60
    aput v6, p2, v8

    .line 61
    .line 62
    ushr-long/2addr v0, v4

    .line 63
    add-int/lit8 v5, p1, 0x3

    .line 64
    .line 65
    aget v6, p0, v5

    .line 66
    .line 67
    int-to-long v6, v6

    .line 68
    and-long/2addr v6, v2

    .line 69
    add-int/lit8 v8, p3, 0x3

    .line 70
    .line 71
    aget v9, p2, v8

    .line 72
    .line 73
    int-to-long v9, v9

    .line 74
    and-long/2addr v9, v2

    .line 75
    add-long/2addr v6, v9

    .line 76
    add-long/2addr v0, v6

    .line 77
    long-to-int v6, v0

    .line 78
    aput v6, p0, v5

    .line 79
    .line 80
    aput v6, p2, v8

    .line 81
    .line 82
    ushr-long/2addr v0, v4

    .line 83
    add-int/lit8 v5, p1, 0x4

    .line 84
    .line 85
    aget v6, p0, v5

    .line 86
    .line 87
    int-to-long v6, v6

    .line 88
    and-long/2addr v6, v2

    .line 89
    add-int/lit8 v8, p3, 0x4

    .line 90
    .line 91
    aget v9, p2, v8

    .line 92
    .line 93
    int-to-long v9, v9

    .line 94
    and-long/2addr v9, v2

    .line 95
    add-long/2addr v6, v9

    .line 96
    add-long/2addr v0, v6

    .line 97
    long-to-int v6, v0

    .line 98
    aput v6, p0, v5

    .line 99
    .line 100
    aput v6, p2, v8

    .line 101
    .line 102
    ushr-long/2addr v0, v4

    .line 103
    add-int/lit8 v5, p1, 0x5

    .line 104
    .line 105
    aget v6, p0, v5

    .line 106
    .line 107
    int-to-long v6, v6

    .line 108
    and-long/2addr v6, v2

    .line 109
    add-int/lit8 v8, p3, 0x5

    .line 110
    .line 111
    aget v9, p2, v8

    .line 112
    .line 113
    int-to-long v9, v9

    .line 114
    and-long/2addr v9, v2

    .line 115
    add-long/2addr v6, v9

    .line 116
    add-long/2addr v0, v6

    .line 117
    long-to-int v6, v0

    .line 118
    aput v6, p0, v5

    .line 119
    .line 120
    aput v6, p2, v8

    .line 121
    .line 122
    ushr-long/2addr v0, v4

    .line 123
    add-int/lit8 p1, p1, 0x6

    .line 124
    .line 125
    aget v5, p0, p1

    .line 126
    .line 127
    int-to-long v5, v5

    .line 128
    and-long/2addr v5, v2

    .line 129
    add-int/lit8 p3, p3, 0x6

    .line 130
    .line 131
    aget v7, p2, p3

    .line 132
    .line 133
    int-to-long v7, v7

    .line 134
    and-long/2addr v2, v7

    .line 135
    add-long/2addr v5, v2

    .line 136
    add-long/2addr v0, v5

    .line 137
    long-to-int v2, v0

    .line 138
    aput v2, p0, p1

    .line 139
    .line 140
    aput v2, p2, p3

    .line 141
    .line 142
    ushr-long p0, v0, v4

    .line 143
    .line 144
    long-to-int p0, p0

    .line 145
    return p0
.end method

.method public static copy([I[I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    aput v1, p1, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget v1, p0, v0

    .line 8
    .line 9
    aput v1, p1, v0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    aget v1, p0, v0

    .line 13
    .line 14
    aput v1, p1, v0

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    aget v1, p0, v0

    .line 18
    .line 19
    aput v1, p1, v0

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    aget v1, p0, v0

    .line 23
    .line 24
    aput v1, p1, v0

    .line 25
    .line 26
    const/4 v0, 0x5

    .line 27
    aget v1, p0, v0

    .line 28
    .line 29
    aput v1, p1, v0

    .line 30
    .line 31
    const/4 v0, 0x6

    .line 32
    aget p0, p0, v0

    .line 33
    .line 34
    aput p0, p1, v0

    .line 35
    .line 36
    return-void
.end method

.method public static create()[I
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    return-object v0
.end method

.method public static createExt()[I
    .locals 1

    .line 1
    const/16 v0, 0xe

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    return-object v0
.end method

.method public static diff([II[II[II)Z
    .locals 2

    .line 1
    invoke-static {p0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat224;->gte([II[II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat224;->sub([II[II[II)I

    .line 8
    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    move-object v1, p2

    .line 12
    move-object p2, p0

    .line 13
    move-object p0, v1

    .line 14
    move v1, p3

    .line 15
    move p3, p1

    .line 16
    move p1, v1

    .line 17
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat224;->sub([II[II[II)I

    .line 18
    .line 19
    .line 20
    return v0
.end method

.method public static eq([I[I)Z
    .locals 3

    .line 1
    const/4 v0, 0x6

    .line 2
    :goto_0
    if-ltz v0, :cond_1

    .line 3
    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    aget v2, p1, v0

    .line 7
    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0xe0

    .line 12
    .line 13
    if-gt v0, v1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v1, 0x1

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    aput v3, v0, v1

    .line 33
    .line 34
    const/16 v1, 0x20

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    move v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0

    .line 43
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static getBit([II)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    :goto_0
    and-int/lit8 p0, p0, 0x1

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    shr-int/lit8 v1, p1, 0x5

    .line 10
    .line 11
    if-ltz v1, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x7

    .line 14
    if-lt v1, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    and-int/lit8 p1, p1, 0x1f

    .line 18
    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    ushr-int/2addr p0, p1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    :goto_1
    return v0
.end method

.method public static gte([II[II)Z
    .locals 5

    .line 1
    const/4 v0, 0x6

    .line 2
    :goto_0
    const/4 v1, 0x1

    .line 3
    if-ltz v0, :cond_2

    .line 4
    .line 5
    add-int v2, p1, v0

    .line 6
    .line 7
    aget v2, p0, v2

    .line 8
    .line 9
    const/high16 v3, -0x80000000

    .line 10
    .line 11
    xor-int/2addr v2, v3

    .line 12
    add-int v4, p3, v0

    .line 13
    .line 14
    aget v4, p2, v4

    .line 15
    .line 16
    xor-int/2addr v3, v4

    .line 17
    if-ge v2, v3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    if-le v2, v3, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    return v1
.end method

.method public static gte([I[I)Z
    .locals 5

    const/4 v0, 0x6

    :goto_0
    const/4 v1, 0x1

    if-ltz v0, :cond_2

    .line 28
    aget v2, p0, v0

    const/high16 v3, -0x80000000

    xor-int/2addr v2, v3

    .line 29
    aget v4, p1, v0

    xor-int/2addr v3, v4

    if-ge v2, v3, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-le v2, v3, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static isOne([I)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq v1, v2, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    move v1, v2

    .line 9
    :goto_0
    const/4 v3, 0x7

    .line 10
    if-ge v1, v3, :cond_2

    .line 11
    .line 12
    aget v3, p0, v1

    .line 13
    .line 14
    if-eqz v3, :cond_1

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    return v2
.end method

.method public static isZero([I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x7

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget v2, p0, v1

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static mul([II[II[II)V
    .locals 28

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    add-int/lit8 v4, p3, 0x1

    .line 11
    .line 12
    aget v4, p2, v4

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    and-long/2addr v4, v2

    .line 16
    add-int/lit8 v6, p3, 0x2

    .line 17
    .line 18
    aget v6, p2, v6

    .line 19
    .line 20
    int-to-long v6, v6

    .line 21
    and-long/2addr v6, v2

    .line 22
    add-int/lit8 v8, p3, 0x3

    .line 23
    .line 24
    aget v8, p2, v8

    .line 25
    .line 26
    int-to-long v8, v8

    .line 27
    and-long/2addr v8, v2

    .line 28
    add-int/lit8 v10, p3, 0x4

    .line 29
    .line 30
    aget v10, p2, v10

    .line 31
    .line 32
    int-to-long v10, v10

    .line 33
    and-long/2addr v10, v2

    .line 34
    add-int/lit8 v12, p3, 0x5

    .line 35
    .line 36
    aget v12, p2, v12

    .line 37
    .line 38
    int-to-long v12, v12

    .line 39
    and-long/2addr v12, v2

    .line 40
    add-int/lit8 v14, p3, 0x6

    .line 41
    .line 42
    aget v14, p2, v14

    .line 43
    .line 44
    int-to-long v14, v14

    .line 45
    and-long/2addr v14, v2

    .line 46
    move-wide/from16 v16, v2

    .line 47
    .line 48
    aget v2, p0, p1

    .line 49
    .line 50
    int-to-long v2, v2

    .line 51
    and-long v2, v2, v16

    .line 52
    .line 53
    move-wide/from16 v18, v0

    .line 54
    .line 55
    mul-long v0, v2, v18

    .line 56
    .line 57
    move-wide/from16 p2, v2

    .line 58
    .line 59
    long-to-int v2, v0

    .line 60
    aput v2, p4, p5

    .line 61
    .line 62
    const/16 v2, 0x20

    .line 63
    .line 64
    ushr-long/2addr v0, v2

    .line 65
    mul-long v20, p2, v4

    .line 66
    .line 67
    add-long v0, v0, v20

    .line 68
    .line 69
    add-int/lit8 v3, p5, 0x1

    .line 70
    .line 71
    move/from16 v20, v2

    .line 72
    .line 73
    long-to-int v2, v0

    .line 74
    aput v2, p4, v3

    .line 75
    .line 76
    ushr-long v0, v0, v20

    .line 77
    .line 78
    mul-long v2, p2, v6

    .line 79
    .line 80
    add-long/2addr v0, v2

    .line 81
    add-int/lit8 v2, p5, 0x2

    .line 82
    .line 83
    long-to-int v3, v0

    .line 84
    aput v3, p4, v2

    .line 85
    .line 86
    ushr-long v0, v0, v20

    .line 87
    .line 88
    mul-long v2, p2, v8

    .line 89
    .line 90
    add-long/2addr v0, v2

    .line 91
    add-int/lit8 v2, p5, 0x3

    .line 92
    .line 93
    long-to-int v3, v0

    .line 94
    aput v3, p4, v2

    .line 95
    .line 96
    ushr-long v0, v0, v20

    .line 97
    .line 98
    mul-long v2, p2, v10

    .line 99
    .line 100
    add-long/2addr v0, v2

    .line 101
    add-int/lit8 v2, p5, 0x4

    .line 102
    .line 103
    long-to-int v3, v0

    .line 104
    aput v3, p4, v2

    .line 105
    .line 106
    ushr-long v0, v0, v20

    .line 107
    .line 108
    mul-long v2, p2, v12

    .line 109
    .line 110
    add-long/2addr v0, v2

    .line 111
    add-int/lit8 v2, p5, 0x5

    .line 112
    .line 113
    long-to-int v3, v0

    .line 114
    aput v3, p4, v2

    .line 115
    .line 116
    ushr-long v0, v0, v20

    .line 117
    .line 118
    mul-long v2, p2, v14

    .line 119
    .line 120
    add-long/2addr v0, v2

    .line 121
    add-int/lit8 v2, p5, 0x6

    .line 122
    .line 123
    long-to-int v3, v0

    .line 124
    aput v3, p4, v2

    .line 125
    .line 126
    ushr-long v0, v0, v20

    .line 127
    .line 128
    add-int/lit8 v2, p5, 0x7

    .line 129
    .line 130
    long-to-int v0, v0

    .line 131
    aput v0, p4, v2

    .line 132
    .line 133
    const/4 v0, 0x1

    .line 134
    move v1, v0

    .line 135
    move/from16 v0, p5

    .line 136
    .line 137
    :goto_0
    const/4 v2, 0x7

    .line 138
    if-ge v1, v2, :cond_0

    .line 139
    .line 140
    add-int/lit8 v2, v0, 0x1

    .line 141
    .line 142
    add-int v3, p1, v1

    .line 143
    .line 144
    aget v3, p0, v3

    .line 145
    .line 146
    move/from16 p2, v0

    .line 147
    .line 148
    move/from16 v21, v1

    .line 149
    .line 150
    int-to-long v0, v3

    .line 151
    and-long v0, v0, v16

    .line 152
    .line 153
    mul-long v22, v0, v18

    .line 154
    .line 155
    aget v3, p4, v2

    .line 156
    .line 157
    move-wide/from16 v24, v0

    .line 158
    .line 159
    int-to-long v0, v3

    .line 160
    and-long v0, v0, v16

    .line 161
    .line 162
    add-long v0, v22, v0

    .line 163
    .line 164
    long-to-int v3, v0

    .line 165
    aput v3, p4, v2

    .line 166
    .line 167
    ushr-long v0, v0, v20

    .line 168
    .line 169
    mul-long v22, v24, v4

    .line 170
    .line 171
    add-int/lit8 v3, p2, 0x2

    .line 172
    .line 173
    move-wide/from16 v26, v0

    .line 174
    .line 175
    aget v0, p4, v3

    .line 176
    .line 177
    int-to-long v0, v0

    .line 178
    and-long v0, v0, v16

    .line 179
    .line 180
    add-long v22, v22, v0

    .line 181
    .line 182
    add-long v0, v26, v22

    .line 183
    .line 184
    move/from16 p3, v2

    .line 185
    .line 186
    long-to-int v2, v0

    .line 187
    aput v2, p4, v3

    .line 188
    .line 189
    ushr-long v0, v0, v20

    .line 190
    .line 191
    mul-long v2, v24, v6

    .line 192
    .line 193
    add-int/lit8 v22, p2, 0x3

    .line 194
    .line 195
    move-wide/from16 v26, v0

    .line 196
    .line 197
    aget v0, p4, v22

    .line 198
    .line 199
    int-to-long v0, v0

    .line 200
    and-long v0, v0, v16

    .line 201
    .line 202
    add-long/2addr v2, v0

    .line 203
    add-long v0, v26, v2

    .line 204
    .line 205
    long-to-int v2, v0

    .line 206
    aput v2, p4, v22

    .line 207
    .line 208
    ushr-long v0, v0, v20

    .line 209
    .line 210
    mul-long v2, v24, v8

    .line 211
    .line 212
    add-int/lit8 v22, p2, 0x4

    .line 213
    .line 214
    move-wide/from16 v26, v0

    .line 215
    .line 216
    aget v0, p4, v22

    .line 217
    .line 218
    int-to-long v0, v0

    .line 219
    and-long v0, v0, v16

    .line 220
    .line 221
    add-long/2addr v2, v0

    .line 222
    add-long v0, v26, v2

    .line 223
    .line 224
    long-to-int v2, v0

    .line 225
    aput v2, p4, v22

    .line 226
    .line 227
    ushr-long v0, v0, v20

    .line 228
    .line 229
    mul-long v2, v24, v10

    .line 230
    .line 231
    add-int/lit8 v22, p2, 0x5

    .line 232
    .line 233
    move-wide/from16 v26, v0

    .line 234
    .line 235
    aget v0, p4, v22

    .line 236
    .line 237
    int-to-long v0, v0

    .line 238
    and-long v0, v0, v16

    .line 239
    .line 240
    add-long/2addr v2, v0

    .line 241
    add-long v0, v26, v2

    .line 242
    .line 243
    long-to-int v2, v0

    .line 244
    aput v2, p4, v22

    .line 245
    .line 246
    ushr-long v0, v0, v20

    .line 247
    .line 248
    mul-long v2, v24, v12

    .line 249
    .line 250
    add-int/lit8 v22, p2, 0x6

    .line 251
    .line 252
    move-wide/from16 v26, v0

    .line 253
    .line 254
    aget v0, p4, v22

    .line 255
    .line 256
    int-to-long v0, v0

    .line 257
    and-long v0, v0, v16

    .line 258
    .line 259
    add-long/2addr v2, v0

    .line 260
    add-long v0, v26, v2

    .line 261
    .line 262
    long-to-int v2, v0

    .line 263
    aput v2, p4, v22

    .line 264
    .line 265
    ushr-long v0, v0, v20

    .line 266
    .line 267
    mul-long v2, v24, v14

    .line 268
    .line 269
    add-int/lit8 v22, p2, 0x7

    .line 270
    .line 271
    move-wide/from16 v23, v0

    .line 272
    .line 273
    aget v0, p4, v22

    .line 274
    .line 275
    int-to-long v0, v0

    .line 276
    and-long v0, v0, v16

    .line 277
    .line 278
    add-long/2addr v2, v0

    .line 279
    add-long v0, v23, v2

    .line 280
    .line 281
    long-to-int v2, v0

    .line 282
    aput v2, p4, v22

    .line 283
    .line 284
    ushr-long v0, v0, v20

    .line 285
    .line 286
    add-int/lit8 v2, p2, 0x8

    .line 287
    .line 288
    long-to-int v0, v0

    .line 289
    aput v0, p4, v2

    .line 290
    .line 291
    add-int/lit8 v1, v21, 0x1

    .line 292
    .line 293
    move/from16 v0, p3

    .line 294
    .line 295
    goto/16 :goto_0

    .line 296
    .line 297
    :cond_0
    return-void
.end method

.method public static mul([I[I[I)V
    .locals 30

    const/4 v0, 0x0

    .line 298
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x1

    .line 299
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    const/4 v8, 0x2

    .line 300
    aget v9, p1, v8

    int-to-long v9, v9

    and-long/2addr v9, v3

    const/4 v11, 0x3

    .line 301
    aget v12, p1, v11

    int-to-long v12, v12

    and-long/2addr v12, v3

    const/4 v14, 0x4

    .line 302
    aget v15, p1, v14

    move/from16 v16, v0

    move-wide/from16 v17, v1

    int-to-long v0, v15

    and-long/2addr v0, v3

    const/4 v2, 0x5

    .line 303
    aget v15, p1, v2

    move-wide/from16 v19, v3

    move v4, v2

    int-to-long v2, v15

    and-long v2, v2, v19

    const/4 v15, 0x6

    move/from16 v21, v4

    .line 304
    aget v4, p1, v15

    move/from16 v22, v5

    move-wide/from16 v23, v6

    int-to-long v5, v4

    and-long v4, v5, v19

    .line 305
    aget v6, p0, v16

    int-to-long v6, v6

    and-long v6, v6, v19

    move/from16 v25, v8

    move-wide/from16 v26, v9

    mul-long v8, v6, v17

    long-to-int v10, v8

    .line 306
    aput v10, p2, v16

    const/16 v10, 0x20

    ushr-long/2addr v8, v10

    mul-long v28, v6, v23

    add-long v8, v8, v28

    move/from16 p1, v10

    long-to-int v10, v8

    .line 307
    aput v10, p2, v22

    ushr-long v8, v8, p1

    mul-long v28, v6, v26

    add-long v8, v8, v28

    long-to-int v10, v8

    .line 308
    aput v10, p2, v25

    ushr-long v8, v8, p1

    mul-long v28, v6, v12

    add-long v8, v8, v28

    long-to-int v10, v8

    .line 309
    aput v10, p2, v11

    ushr-long v8, v8, p1

    mul-long v10, v6, v0

    add-long/2addr v8, v10

    long-to-int v10, v8

    .line 310
    aput v10, p2, v14

    ushr-long v8, v8, p1

    mul-long v10, v6, v2

    add-long/2addr v8, v10

    long-to-int v10, v8

    .line 311
    aput v10, p2, v21

    ushr-long v8, v8, p1

    mul-long/2addr v6, v4

    add-long/2addr v8, v6

    long-to-int v6, v8

    .line 312
    aput v6, p2, v15

    ushr-long v6, v8, p1

    long-to-int v6, v6

    const/4 v7, 0x7

    .line 313
    aput v6, p2, v7

    move/from16 v6, v22

    :goto_0
    if-ge v6, v7, :cond_0

    .line 314
    aget v8, p0, v6

    int-to-long v8, v8

    and-long v8, v8, v19

    mul-long v10, v8, v17

    .line 315
    aget v14, p2, v6

    int-to-long v14, v14

    and-long v14, v14, v19

    add-long/2addr v10, v14

    long-to-int v14, v10

    .line 316
    aput v14, p2, v6

    ushr-long v10, v10, p1

    mul-long v14, v8, v23

    add-int/lit8 v16, v6, 0x1

    .line 317
    aget v7, p2, v16

    move-wide/from16 v28, v0

    int-to-long v0, v7

    and-long v0, v0, v19

    add-long/2addr v14, v0

    add-long/2addr v10, v14

    long-to-int v0, v10

    .line 318
    aput v0, p2, v16

    ushr-long v0, v10, p1

    mul-long v10, v8, v26

    add-int/lit8 v7, v6, 0x2

    .line 319
    aget v14, p2, v7

    int-to-long v14, v14

    and-long v14, v14, v19

    add-long/2addr v10, v14

    add-long/2addr v0, v10

    long-to-int v10, v0

    .line 320
    aput v10, p2, v7

    ushr-long v0, v0, p1

    mul-long v10, v8, v12

    add-int/lit8 v7, v6, 0x3

    .line 321
    aget v14, p2, v7

    int-to-long v14, v14

    and-long v14, v14, v19

    add-long/2addr v10, v14

    add-long/2addr v0, v10

    long-to-int v10, v0

    .line 322
    aput v10, p2, v7

    ushr-long v0, v0, p1

    mul-long v10, v8, v28

    add-int/lit8 v7, v6, 0x4

    .line 323
    aget v14, p2, v7

    int-to-long v14, v14

    and-long v14, v14, v19

    add-long/2addr v10, v14

    add-long/2addr v0, v10

    long-to-int v10, v0

    .line 324
    aput v10, p2, v7

    ushr-long v0, v0, p1

    mul-long v10, v8, v2

    add-int/lit8 v7, v6, 0x5

    .line 325
    aget v14, p2, v7

    int-to-long v14, v14

    and-long v14, v14, v19

    add-long/2addr v10, v14

    add-long/2addr v0, v10

    long-to-int v10, v0

    .line 326
    aput v10, p2, v7

    ushr-long v0, v0, p1

    mul-long/2addr v8, v4

    add-int/lit8 v7, v6, 0x6

    .line 327
    aget v10, p2, v7

    int-to-long v10, v10

    and-long v10, v10, v19

    add-long/2addr v8, v10

    add-long/2addr v0, v8

    long-to-int v8, v0

    .line 328
    aput v8, p2, v7

    ushr-long v0, v0, p1

    add-int/lit8 v6, v6, 0x7

    long-to-int v0, v0

    .line 329
    aput v0, p2, v6

    move/from16 v6, v16

    move-wide/from16 v0, v28

    const/4 v7, 0x7

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static mul33Add(I[II[II[II)J
    .locals 12

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p0, p1, p2

    .line 9
    .line 10
    int-to-long v4, p0

    .line 11
    and-long/2addr v4, v2

    .line 12
    mul-long v6, v0, v4

    .line 13
    .line 14
    aget p0, p3, p4

    .line 15
    .line 16
    int-to-long v8, p0

    .line 17
    and-long/2addr v8, v2

    .line 18
    add-long/2addr v6, v8

    .line 19
    long-to-int p0, v6

    .line 20
    aput p0, p5, p6

    .line 21
    .line 22
    const/16 p0, 0x20

    .line 23
    .line 24
    ushr-long/2addr v6, p0

    .line 25
    add-int/lit8 v8, p2, 0x1

    .line 26
    .line 27
    aget v8, p1, v8

    .line 28
    .line 29
    int-to-long v8, v8

    .line 30
    and-long/2addr v8, v2

    .line 31
    mul-long v10, v0, v8

    .line 32
    .line 33
    add-long/2addr v10, v4

    .line 34
    add-int/lit8 v4, p4, 0x1

    .line 35
    .line 36
    aget v4, p3, v4

    .line 37
    .line 38
    int-to-long v4, v4

    .line 39
    and-long/2addr v4, v2

    .line 40
    add-long/2addr v10, v4

    .line 41
    add-long/2addr v6, v10

    .line 42
    add-int/lit8 v4, p6, 0x1

    .line 43
    .line 44
    long-to-int v5, v6

    .line 45
    aput v5, p5, v4

    .line 46
    .line 47
    ushr-long v4, v6, p0

    .line 48
    .line 49
    add-int/lit8 v6, p2, 0x2

    .line 50
    .line 51
    aget v6, p1, v6

    .line 52
    .line 53
    int-to-long v6, v6

    .line 54
    and-long/2addr v6, v2

    .line 55
    mul-long v10, v0, v6

    .line 56
    .line 57
    add-long/2addr v10, v8

    .line 58
    add-int/lit8 v8, p4, 0x2

    .line 59
    .line 60
    aget v8, p3, v8

    .line 61
    .line 62
    int-to-long v8, v8

    .line 63
    and-long/2addr v8, v2

    .line 64
    add-long/2addr v10, v8

    .line 65
    add-long/2addr v4, v10

    .line 66
    add-int/lit8 v8, p6, 0x2

    .line 67
    .line 68
    long-to-int v9, v4

    .line 69
    aput v9, p5, v8

    .line 70
    .line 71
    ushr-long/2addr v4, p0

    .line 72
    add-int/lit8 v8, p2, 0x3

    .line 73
    .line 74
    aget v8, p1, v8

    .line 75
    .line 76
    int-to-long v8, v8

    .line 77
    and-long/2addr v8, v2

    .line 78
    mul-long v10, v0, v8

    .line 79
    .line 80
    add-long/2addr v10, v6

    .line 81
    add-int/lit8 v6, p4, 0x3

    .line 82
    .line 83
    aget v6, p3, v6

    .line 84
    .line 85
    int-to-long v6, v6

    .line 86
    and-long/2addr v6, v2

    .line 87
    add-long/2addr v10, v6

    .line 88
    add-long/2addr v4, v10

    .line 89
    add-int/lit8 v6, p6, 0x3

    .line 90
    .line 91
    long-to-int v7, v4

    .line 92
    aput v7, p5, v6

    .line 93
    .line 94
    ushr-long/2addr v4, p0

    .line 95
    add-int/lit8 v6, p2, 0x4

    .line 96
    .line 97
    aget v6, p1, v6

    .line 98
    .line 99
    int-to-long v6, v6

    .line 100
    and-long/2addr v6, v2

    .line 101
    mul-long v10, v0, v6

    .line 102
    .line 103
    add-long/2addr v10, v8

    .line 104
    add-int/lit8 v8, p4, 0x4

    .line 105
    .line 106
    aget v8, p3, v8

    .line 107
    .line 108
    int-to-long v8, v8

    .line 109
    and-long/2addr v8, v2

    .line 110
    add-long/2addr v10, v8

    .line 111
    add-long/2addr v4, v10

    .line 112
    add-int/lit8 v8, p6, 0x4

    .line 113
    .line 114
    long-to-int v9, v4

    .line 115
    aput v9, p5, v8

    .line 116
    .line 117
    ushr-long/2addr v4, p0

    .line 118
    add-int/lit8 v8, p2, 0x5

    .line 119
    .line 120
    aget v8, p1, v8

    .line 121
    .line 122
    int-to-long v8, v8

    .line 123
    and-long/2addr v8, v2

    .line 124
    mul-long v10, v0, v8

    .line 125
    .line 126
    add-long/2addr v10, v6

    .line 127
    add-int/lit8 v6, p4, 0x5

    .line 128
    .line 129
    aget v6, p3, v6

    .line 130
    .line 131
    int-to-long v6, v6

    .line 132
    and-long/2addr v6, v2

    .line 133
    add-long/2addr v10, v6

    .line 134
    add-long/2addr v4, v10

    .line 135
    add-int/lit8 v6, p6, 0x5

    .line 136
    .line 137
    long-to-int v7, v4

    .line 138
    aput v7, p5, v6

    .line 139
    .line 140
    ushr-long/2addr v4, p0

    .line 141
    add-int/lit8 p2, p2, 0x6

    .line 142
    .line 143
    aget p1, p1, p2

    .line 144
    .line 145
    int-to-long p1, p1

    .line 146
    and-long/2addr p1, v2

    .line 147
    mul-long/2addr v0, p1

    .line 148
    add-long/2addr v0, v8

    .line 149
    add-int/lit8 v6, p4, 0x6

    .line 150
    .line 151
    aget v6, p3, v6

    .line 152
    .line 153
    int-to-long v6, v6

    .line 154
    and-long/2addr v2, v6

    .line 155
    add-long/2addr v0, v2

    .line 156
    add-long/2addr v4, v0

    .line 157
    add-int/lit8 v0, p6, 0x6

    .line 158
    .line 159
    long-to-int v1, v4

    .line 160
    aput v1, p5, v0

    .line 161
    .line 162
    ushr-long v0, v4, p0

    .line 163
    .line 164
    add-long/2addr v0, p1

    .line 165
    return-wide v0
.end method

.method public static mul33DWordAdd(IJ[II)I
    .locals 10

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p1, v2

    .line 9
    .line 10
    mul-long v6, v0, v4

    .line 11
    .line 12
    aget p0, p3, p4

    .line 13
    .line 14
    int-to-long v8, p0

    .line 15
    and-long/2addr v8, v2

    .line 16
    add-long/2addr v6, v8

    .line 17
    long-to-int p0, v6

    .line 18
    aput p0, p3, p4

    .line 19
    .line 20
    const/16 p0, 0x20

    .line 21
    .line 22
    ushr-long/2addr v6, p0

    .line 23
    ushr-long/2addr p1, p0

    .line 24
    mul-long/2addr v0, p1

    .line 25
    add-long/2addr v0, v4

    .line 26
    add-int/lit8 v4, p4, 0x1

    .line 27
    .line 28
    aget v5, p3, v4

    .line 29
    .line 30
    int-to-long v8, v5

    .line 31
    and-long/2addr v8, v2

    .line 32
    add-long/2addr v0, v8

    .line 33
    add-long/2addr v6, v0

    .line 34
    long-to-int v0, v6

    .line 35
    aput v0, p3, v4

    .line 36
    .line 37
    ushr-long v0, v6, p0

    .line 38
    .line 39
    add-int/lit8 v4, p4, 0x2

    .line 40
    .line 41
    aget v5, p3, v4

    .line 42
    .line 43
    int-to-long v5, v5

    .line 44
    and-long/2addr v5, v2

    .line 45
    add-long/2addr p1, v5

    .line 46
    add-long/2addr v0, p1

    .line 47
    long-to-int p1, v0

    .line 48
    aput p1, p3, v4

    .line 49
    .line 50
    ushr-long p1, v0, p0

    .line 51
    .line 52
    add-int/lit8 v0, p4, 0x3

    .line 53
    .line 54
    aget v1, p3, v0

    .line 55
    .line 56
    int-to-long v4, v1

    .line 57
    and-long v1, v4, v2

    .line 58
    .line 59
    add-long/2addr p1, v1

    .line 60
    long-to-int v1, p1

    .line 61
    aput v1, p3, v0

    .line 62
    .line 63
    ushr-long p0, p1, p0

    .line 64
    .line 65
    const-wide/16 v0, 0x0

    .line 66
    .line 67
    cmp-long p0, p0, v0

    .line 68
    .line 69
    if-nez p0, :cond_0

    .line 70
    .line 71
    const/4 p0, 0x0

    .line 72
    return p0

    .line 73
    :cond_0
    const/4 p0, 0x7

    .line 74
    const/4 p1, 0x4

    .line 75
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0
.end method

.method public static mul33WordAdd(II[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    int-to-long p0, p1

    .line 9
    and-long/2addr p0, v2

    .line 10
    mul-long/2addr v0, p0

    .line 11
    aget v4, p2, p3

    .line 12
    .line 13
    int-to-long v4, v4

    .line 14
    and-long/2addr v4, v2

    .line 15
    add-long/2addr v0, v4

    .line 16
    long-to-int v4, v0

    .line 17
    aput v4, p2, p3

    .line 18
    .line 19
    const/16 v4, 0x20

    .line 20
    .line 21
    ushr-long/2addr v0, v4

    .line 22
    add-int/lit8 v5, p3, 0x1

    .line 23
    .line 24
    aget v6, p2, v5

    .line 25
    .line 26
    int-to-long v6, v6

    .line 27
    and-long/2addr v6, v2

    .line 28
    add-long/2addr p0, v6

    .line 29
    add-long/2addr v0, p0

    .line 30
    long-to-int p0, v0

    .line 31
    aput p0, p2, v5

    .line 32
    .line 33
    ushr-long p0, v0, v4

    .line 34
    .line 35
    add-int/lit8 v0, p3, 0x2

    .line 36
    .line 37
    aget v1, p2, v0

    .line 38
    .line 39
    int-to-long v5, v1

    .line 40
    and-long v1, v5, v2

    .line 41
    .line 42
    add-long/2addr p0, v1

    .line 43
    long-to-int v1, p0

    .line 44
    aput v1, p2, v0

    .line 45
    .line 46
    ushr-long/2addr p0, v4

    .line 47
    const-wide/16 v0, 0x0

    .line 48
    .line 49
    cmp-long p0, p0, v0

    .line 50
    .line 51
    if-nez p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0

    .line 55
    :cond_0
    const/4 p0, 0x7

    .line 56
    const/4 p1, 0x3

    .line 57
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public static mulAddTo([II[II[II)I
    .locals 32

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    add-int/lit8 v4, p3, 0x1

    .line 11
    .line 12
    aget v4, p2, v4

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    and-long/2addr v4, v2

    .line 16
    add-int/lit8 v6, p3, 0x2

    .line 17
    .line 18
    aget v6, p2, v6

    .line 19
    .line 20
    int-to-long v6, v6

    .line 21
    and-long/2addr v6, v2

    .line 22
    add-int/lit8 v8, p3, 0x3

    .line 23
    .line 24
    aget v8, p2, v8

    .line 25
    .line 26
    int-to-long v8, v8

    .line 27
    and-long/2addr v8, v2

    .line 28
    add-int/lit8 v10, p3, 0x4

    .line 29
    .line 30
    aget v10, p2, v10

    .line 31
    .line 32
    int-to-long v10, v10

    .line 33
    and-long/2addr v10, v2

    .line 34
    add-int/lit8 v12, p3, 0x5

    .line 35
    .line 36
    aget v12, p2, v12

    .line 37
    .line 38
    int-to-long v12, v12

    .line 39
    and-long/2addr v12, v2

    .line 40
    add-int/lit8 v14, p3, 0x6

    .line 41
    .line 42
    aget v14, p2, v14

    .line 43
    .line 44
    int-to-long v14, v14

    .line 45
    and-long/2addr v14, v2

    .line 46
    const-wide/16 v16, 0x0

    .line 47
    .line 48
    const/16 v18, 0x0

    .line 49
    .line 50
    move-wide/from16 v19, v0

    .line 51
    .line 52
    move/from16 v0, v18

    .line 53
    .line 54
    move-wide/from16 v30, v16

    .line 55
    .line 56
    move/from16 v16, p5

    .line 57
    .line 58
    move-wide/from16 v17, v2

    .line 59
    .line 60
    move-wide/from16 v2, v30

    .line 61
    .line 62
    :goto_0
    const/4 v1, 0x7

    .line 63
    if-ge v0, v1, :cond_0

    .line 64
    .line 65
    add-int v21, p1, v0

    .line 66
    .line 67
    move/from16 p2, v1

    .line 68
    .line 69
    aget v1, p0, v21

    .line 70
    .line 71
    move/from16 v21, v0

    .line 72
    .line 73
    int-to-long v0, v1

    .line 74
    and-long v0, v0, v17

    .line 75
    .line 76
    mul-long v22, v0, v19

    .line 77
    .line 78
    move-wide/from16 v24, v0

    .line 79
    .line 80
    aget v0, p4, v16

    .line 81
    .line 82
    int-to-long v0, v0

    .line 83
    and-long v0, v0, v17

    .line 84
    .line 85
    add-long v0, v22, v0

    .line 86
    .line 87
    move-wide/from16 v22, v4

    .line 88
    .line 89
    long-to-int v4, v0

    .line 90
    aput v4, p4, v16

    .line 91
    .line 92
    const/16 v4, 0x20

    .line 93
    .line 94
    ushr-long/2addr v0, v4

    .line 95
    mul-long v26, v24, v22

    .line 96
    .line 97
    add-int/lit8 v5, v16, 0x1

    .line 98
    .line 99
    move/from16 p3, v4

    .line 100
    .line 101
    aget v4, p4, v5

    .line 102
    .line 103
    move-wide/from16 v28, v0

    .line 104
    .line 105
    int-to-long v0, v4

    .line 106
    and-long v0, v0, v17

    .line 107
    .line 108
    add-long v26, v26, v0

    .line 109
    .line 110
    add-long v0, v28, v26

    .line 111
    .line 112
    long-to-int v4, v0

    .line 113
    aput v4, p4, v5

    .line 114
    .line 115
    ushr-long v0, v0, p3

    .line 116
    .line 117
    mul-long v26, v24, v6

    .line 118
    .line 119
    add-int/lit8 v4, v16, 0x2

    .line 120
    .line 121
    move-wide/from16 v28, v0

    .line 122
    .line 123
    aget v0, p4, v4

    .line 124
    .line 125
    int-to-long v0, v0

    .line 126
    and-long v0, v0, v17

    .line 127
    .line 128
    add-long v26, v26, v0

    .line 129
    .line 130
    add-long v0, v28, v26

    .line 131
    .line 132
    move/from16 p5, v4

    .line 133
    .line 134
    long-to-int v4, v0

    .line 135
    aput v4, p4, p5

    .line 136
    .line 137
    ushr-long v0, v0, p3

    .line 138
    .line 139
    mul-long v26, v24, v8

    .line 140
    .line 141
    add-int/lit8 v4, v16, 0x3

    .line 142
    .line 143
    move-wide/from16 v28, v0

    .line 144
    .line 145
    aget v0, p4, v4

    .line 146
    .line 147
    int-to-long v0, v0

    .line 148
    and-long v0, v0, v17

    .line 149
    .line 150
    add-long v26, v26, v0

    .line 151
    .line 152
    add-long v0, v28, v26

    .line 153
    .line 154
    move/from16 p5, v4

    .line 155
    .line 156
    long-to-int v4, v0

    .line 157
    aput v4, p4, p5

    .line 158
    .line 159
    ushr-long v0, v0, p3

    .line 160
    .line 161
    mul-long v26, v24, v10

    .line 162
    .line 163
    add-int/lit8 v4, v16, 0x4

    .line 164
    .line 165
    move-wide/from16 v28, v0

    .line 166
    .line 167
    aget v0, p4, v4

    .line 168
    .line 169
    int-to-long v0, v0

    .line 170
    and-long v0, v0, v17

    .line 171
    .line 172
    add-long v26, v26, v0

    .line 173
    .line 174
    add-long v0, v28, v26

    .line 175
    .line 176
    move/from16 p5, v4

    .line 177
    .line 178
    long-to-int v4, v0

    .line 179
    aput v4, p4, p5

    .line 180
    .line 181
    ushr-long v0, v0, p3

    .line 182
    .line 183
    mul-long v26, v24, v12

    .line 184
    .line 185
    add-int/lit8 v4, v16, 0x5

    .line 186
    .line 187
    move-wide/from16 v28, v0

    .line 188
    .line 189
    aget v0, p4, v4

    .line 190
    .line 191
    int-to-long v0, v0

    .line 192
    and-long v0, v0, v17

    .line 193
    .line 194
    add-long v26, v26, v0

    .line 195
    .line 196
    add-long v0, v28, v26

    .line 197
    .line 198
    move/from16 p5, v4

    .line 199
    .line 200
    long-to-int v4, v0

    .line 201
    aput v4, p4, p5

    .line 202
    .line 203
    ushr-long v0, v0, p3

    .line 204
    .line 205
    mul-long v24, v24, v14

    .line 206
    .line 207
    add-int/lit8 v4, v16, 0x6

    .line 208
    .line 209
    move-wide/from16 v26, v0

    .line 210
    .line 211
    aget v0, p4, v4

    .line 212
    .line 213
    int-to-long v0, v0

    .line 214
    and-long v0, v0, v17

    .line 215
    .line 216
    add-long v24, v24, v0

    .line 217
    .line 218
    add-long v0, v26, v24

    .line 219
    .line 220
    move/from16 p5, v4

    .line 221
    .line 222
    long-to-int v4, v0

    .line 223
    aput v4, p4, p5

    .line 224
    .line 225
    ushr-long v0, v0, p3

    .line 226
    .line 227
    add-int/lit8 v16, v16, 0x7

    .line 228
    .line 229
    aget v4, p4, v16

    .line 230
    .line 231
    move-wide/from16 v24, v0

    .line 232
    .line 233
    int-to-long v0, v4

    .line 234
    and-long v0, v0, v17

    .line 235
    .line 236
    add-long/2addr v2, v0

    .line 237
    add-long v0, v24, v2

    .line 238
    .line 239
    long-to-int v2, v0

    .line 240
    aput v2, p4, v16

    .line 241
    .line 242
    ushr-long v2, v0, p3

    .line 243
    .line 244
    add-int/lit8 v0, v21, 0x1

    .line 245
    .line 246
    move/from16 v16, v5

    .line 247
    .line 248
    move-wide/from16 v4, v22

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :cond_0
    long-to-int v0, v2

    .line 253
    return v0
.end method

.method public static mulAddTo([I[I[I)I
    .locals 32

    const/4 v0, 0x0

    .line 254
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x1

    .line 255
    aget v5, p1, v5

    int-to-long v5, v5

    and-long/2addr v5, v3

    const/4 v7, 0x2

    .line 256
    aget v7, p1, v7

    int-to-long v7, v7

    and-long/2addr v7, v3

    const/4 v9, 0x3

    .line 257
    aget v9, p1, v9

    int-to-long v9, v9

    and-long/2addr v9, v3

    const/4 v11, 0x4

    .line 258
    aget v11, p1, v11

    int-to-long v11, v11

    and-long/2addr v11, v3

    const/4 v13, 0x5

    .line 259
    aget v13, p1, v13

    int-to-long v13, v13

    and-long/2addr v13, v3

    const/4 v15, 0x6

    .line 260
    aget v15, p1, v15

    move-wide/from16 v17, v1

    int-to-long v0, v15

    and-long/2addr v0, v3

    const-wide/16 v19, 0x0

    move-wide/from16 v30, v19

    move-wide/from16 v19, v3

    move-wide/from16 v3, v30

    const/4 v2, 0x0

    :goto_0
    const/4 v15, 0x7

    if-ge v2, v15, :cond_0

    .line 261
    aget v15, p0, v2

    move-wide/from16 v21, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    mul-long v15, v0, v17

    move-wide/from16 v23, v0

    .line 262
    aget v0, p2, v2

    int-to-long v0, v0

    and-long v0, v0, v19

    add-long/2addr v0, v15

    long-to-int v15, v0

    .line 263
    aput v15, p2, v2

    const/16 v15, 0x20

    ushr-long/2addr v0, v15

    mul-long v25, v23, v5

    add-int/lit8 v16, v2, 0x1

    move/from16 p1, v15

    .line 264
    aget v15, p2, v16

    move-wide/from16 v27, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    add-long v25, v25, v0

    add-long v0, v27, v25

    long-to-int v15, v0

    .line 265
    aput v15, p2, v16

    ushr-long v0, v0, p1

    mul-long v25, v23, v7

    add-int/lit8 v15, v2, 0x2

    move-wide/from16 v27, v0

    .line 266
    aget v0, p2, v15

    int-to-long v0, v0

    and-long v0, v0, v19

    add-long v25, v25, v0

    add-long v0, v27, v25

    move/from16 v25, v2

    long-to-int v2, v0

    .line 267
    aput v2, p2, v15

    ushr-long v0, v0, p1

    mul-long v26, v23, v9

    add-int/lit8 v2, v25, 0x3

    .line 268
    aget v15, p2, v2

    move-wide/from16 v28, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    add-long v26, v26, v0

    add-long v0, v28, v26

    long-to-int v15, v0

    .line 269
    aput v15, p2, v2

    ushr-long v0, v0, p1

    mul-long v26, v23, v11

    add-int/lit8 v2, v25, 0x4

    .line 270
    aget v15, p2, v2

    move-wide/from16 v28, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    add-long v26, v26, v0

    add-long v0, v28, v26

    long-to-int v15, v0

    .line 271
    aput v15, p2, v2

    ushr-long v0, v0, p1

    mul-long v26, v23, v13

    add-int/lit8 v2, v25, 0x5

    .line 272
    aget v15, p2, v2

    move-wide/from16 v28, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    add-long v26, v26, v0

    add-long v0, v28, v26

    long-to-int v15, v0

    .line 273
    aput v15, p2, v2

    ushr-long v0, v0, p1

    mul-long v23, v23, v21

    add-int/lit8 v2, v25, 0x6

    .line 274
    aget v15, p2, v2

    move-wide/from16 v26, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    add-long v23, v23, v0

    add-long v0, v26, v23

    long-to-int v15, v0

    .line 275
    aput v15, p2, v2

    ushr-long v0, v0, p1

    add-int/lit8 v2, v25, 0x7

    .line 276
    aget v15, p2, v2

    move-wide/from16 v23, v0

    int-to-long v0, v15

    and-long v0, v0, v19

    add-long/2addr v3, v0

    add-long v0, v23, v3

    long-to-int v3, v0

    .line 277
    aput v3, p2, v2

    ushr-long v3, v0, p1

    move/from16 v2, v16

    move-wide/from16 v0, v21

    goto/16 :goto_0

    :cond_0
    long-to-int v0, v3

    return v0
.end method

.method public static mulByWord(I[I)I
    .locals 9

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const/4 p0, 0x0

    .line 9
    aget v4, p1, p0

    .line 10
    .line 11
    int-to-long v4, v4

    .line 12
    and-long/2addr v4, v2

    .line 13
    mul-long/2addr v4, v0

    .line 14
    long-to-int v6, v4

    .line 15
    aput v6, p1, p0

    .line 16
    .line 17
    const/16 p0, 0x20

    .line 18
    .line 19
    ushr-long/2addr v4, p0

    .line 20
    const/4 v6, 0x1

    .line 21
    aget v7, p1, v6

    .line 22
    .line 23
    int-to-long v7, v7

    .line 24
    and-long/2addr v7, v2

    .line 25
    mul-long/2addr v7, v0

    .line 26
    add-long/2addr v4, v7

    .line 27
    long-to-int v7, v4

    .line 28
    aput v7, p1, v6

    .line 29
    .line 30
    ushr-long/2addr v4, p0

    .line 31
    const/4 v6, 0x2

    .line 32
    aget v7, p1, v6

    .line 33
    .line 34
    int-to-long v7, v7

    .line 35
    and-long/2addr v7, v2

    .line 36
    mul-long/2addr v7, v0

    .line 37
    add-long/2addr v4, v7

    .line 38
    long-to-int v7, v4

    .line 39
    aput v7, p1, v6

    .line 40
    .line 41
    ushr-long/2addr v4, p0

    .line 42
    const/4 v6, 0x3

    .line 43
    aget v7, p1, v6

    .line 44
    .line 45
    int-to-long v7, v7

    .line 46
    and-long/2addr v7, v2

    .line 47
    mul-long/2addr v7, v0

    .line 48
    add-long/2addr v4, v7

    .line 49
    long-to-int v7, v4

    .line 50
    aput v7, p1, v6

    .line 51
    .line 52
    ushr-long/2addr v4, p0

    .line 53
    const/4 v6, 0x4

    .line 54
    aget v7, p1, v6

    .line 55
    .line 56
    int-to-long v7, v7

    .line 57
    and-long/2addr v7, v2

    .line 58
    mul-long/2addr v7, v0

    .line 59
    add-long/2addr v4, v7

    .line 60
    long-to-int v7, v4

    .line 61
    aput v7, p1, v6

    .line 62
    .line 63
    ushr-long/2addr v4, p0

    .line 64
    const/4 v6, 0x5

    .line 65
    aget v7, p1, v6

    .line 66
    .line 67
    int-to-long v7, v7

    .line 68
    and-long/2addr v7, v2

    .line 69
    mul-long/2addr v7, v0

    .line 70
    add-long/2addr v4, v7

    .line 71
    long-to-int v7, v4

    .line 72
    aput v7, p1, v6

    .line 73
    .line 74
    ushr-long/2addr v4, p0

    .line 75
    const/4 v6, 0x6

    .line 76
    aget v7, p1, v6

    .line 77
    .line 78
    int-to-long v7, v7

    .line 79
    and-long/2addr v2, v7

    .line 80
    mul-long/2addr v0, v2

    .line 81
    add-long/2addr v4, v0

    .line 82
    long-to-int v0, v4

    .line 83
    aput v0, p1, v6

    .line 84
    .line 85
    ushr-long p0, v4, p0

    .line 86
    .line 87
    long-to-int p0, p0

    .line 88
    return p0
.end method

.method public static mulByWordAddTo(I[I[I)I
    .locals 11

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const/4 p0, 0x0

    .line 9
    aget v4, p2, p0

    .line 10
    .line 11
    int-to-long v4, v4

    .line 12
    and-long/2addr v4, v2

    .line 13
    mul-long/2addr v4, v0

    .line 14
    aget v6, p1, p0

    .line 15
    .line 16
    int-to-long v6, v6

    .line 17
    and-long/2addr v6, v2

    .line 18
    add-long/2addr v4, v6

    .line 19
    long-to-int v6, v4

    .line 20
    aput v6, p2, p0

    .line 21
    .line 22
    const/16 p0, 0x20

    .line 23
    .line 24
    ushr-long/2addr v4, p0

    .line 25
    const/4 v6, 0x1

    .line 26
    aget v7, p2, v6

    .line 27
    .line 28
    int-to-long v7, v7

    .line 29
    and-long/2addr v7, v2

    .line 30
    mul-long/2addr v7, v0

    .line 31
    aget v9, p1, v6

    .line 32
    .line 33
    int-to-long v9, v9

    .line 34
    and-long/2addr v9, v2

    .line 35
    add-long/2addr v7, v9

    .line 36
    add-long/2addr v4, v7

    .line 37
    long-to-int v7, v4

    .line 38
    aput v7, p2, v6

    .line 39
    .line 40
    ushr-long/2addr v4, p0

    .line 41
    const/4 v6, 0x2

    .line 42
    aget v7, p2, v6

    .line 43
    .line 44
    int-to-long v7, v7

    .line 45
    and-long/2addr v7, v2

    .line 46
    mul-long/2addr v7, v0

    .line 47
    aget v9, p1, v6

    .line 48
    .line 49
    int-to-long v9, v9

    .line 50
    and-long/2addr v9, v2

    .line 51
    add-long/2addr v7, v9

    .line 52
    add-long/2addr v4, v7

    .line 53
    long-to-int v7, v4

    .line 54
    aput v7, p2, v6

    .line 55
    .line 56
    ushr-long/2addr v4, p0

    .line 57
    const/4 v6, 0x3

    .line 58
    aget v7, p2, v6

    .line 59
    .line 60
    int-to-long v7, v7

    .line 61
    and-long/2addr v7, v2

    .line 62
    mul-long/2addr v7, v0

    .line 63
    aget v9, p1, v6

    .line 64
    .line 65
    int-to-long v9, v9

    .line 66
    and-long/2addr v9, v2

    .line 67
    add-long/2addr v7, v9

    .line 68
    add-long/2addr v4, v7

    .line 69
    long-to-int v7, v4

    .line 70
    aput v7, p2, v6

    .line 71
    .line 72
    ushr-long/2addr v4, p0

    .line 73
    const/4 v6, 0x4

    .line 74
    aget v7, p2, v6

    .line 75
    .line 76
    int-to-long v7, v7

    .line 77
    and-long/2addr v7, v2

    .line 78
    mul-long/2addr v7, v0

    .line 79
    aget v9, p1, v6

    .line 80
    .line 81
    int-to-long v9, v9

    .line 82
    and-long/2addr v9, v2

    .line 83
    add-long/2addr v7, v9

    .line 84
    add-long/2addr v4, v7

    .line 85
    long-to-int v7, v4

    .line 86
    aput v7, p2, v6

    .line 87
    .line 88
    ushr-long/2addr v4, p0

    .line 89
    const/4 v6, 0x5

    .line 90
    aget v7, p2, v6

    .line 91
    .line 92
    int-to-long v7, v7

    .line 93
    and-long/2addr v7, v2

    .line 94
    mul-long/2addr v7, v0

    .line 95
    aget v9, p1, v6

    .line 96
    .line 97
    int-to-long v9, v9

    .line 98
    and-long/2addr v9, v2

    .line 99
    add-long/2addr v7, v9

    .line 100
    add-long/2addr v4, v7

    .line 101
    long-to-int v7, v4

    .line 102
    aput v7, p2, v6

    .line 103
    .line 104
    ushr-long/2addr v4, p0

    .line 105
    const/4 v6, 0x6

    .line 106
    aget v7, p2, v6

    .line 107
    .line 108
    int-to-long v7, v7

    .line 109
    and-long/2addr v7, v2

    .line 110
    mul-long/2addr v0, v7

    .line 111
    aget p1, p1, v6

    .line 112
    .line 113
    int-to-long v7, p1

    .line 114
    and-long/2addr v2, v7

    .line 115
    add-long/2addr v0, v2

    .line 116
    add-long/2addr v4, v0

    .line 117
    long-to-int p1, v4

    .line 118
    aput p1, p2, v6

    .line 119
    .line 120
    ushr-long p0, v4, p0

    .line 121
    .line 122
    long-to-int p0, p0

    .line 123
    return p0
.end method

.method public static mulWord(I[I[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    aget v6, p1, p0

    .line 12
    .line 13
    int-to-long v6, v6

    .line 14
    and-long/2addr v6, v2

    .line 15
    mul-long/2addr v6, v0

    .line 16
    add-long/2addr v4, v6

    .line 17
    add-int v6, p3, p0

    .line 18
    .line 19
    long-to-int v7, v4

    .line 20
    aput v7, p2, v6

    .line 21
    .line 22
    const/16 v6, 0x20

    .line 23
    .line 24
    ushr-long/2addr v4, v6

    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    const/4 v6, 0x7

    .line 28
    if-lt p0, v6, :cond_0

    .line 29
    .line 30
    long-to-int p0, v4

    .line 31
    return p0
.end method

.method public static mulWordAddTo(I[II[II)I
    .locals 11

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p0, p1, p2

    .line 9
    .line 10
    int-to-long v4, p0

    .line 11
    and-long/2addr v4, v2

    .line 12
    mul-long/2addr v4, v0

    .line 13
    aget p0, p3, p4

    .line 14
    .line 15
    int-to-long v6, p0

    .line 16
    and-long/2addr v6, v2

    .line 17
    add-long/2addr v4, v6

    .line 18
    long-to-int p0, v4

    .line 19
    aput p0, p3, p4

    .line 20
    .line 21
    const/16 p0, 0x20

    .line 22
    .line 23
    ushr-long/2addr v4, p0

    .line 24
    add-int/lit8 v6, p2, 0x1

    .line 25
    .line 26
    aget v6, p1, v6

    .line 27
    .line 28
    int-to-long v6, v6

    .line 29
    and-long/2addr v6, v2

    .line 30
    mul-long/2addr v6, v0

    .line 31
    add-int/lit8 v8, p4, 0x1

    .line 32
    .line 33
    aget v9, p3, v8

    .line 34
    .line 35
    int-to-long v9, v9

    .line 36
    and-long/2addr v9, v2

    .line 37
    add-long/2addr v6, v9

    .line 38
    add-long/2addr v4, v6

    .line 39
    long-to-int v6, v4

    .line 40
    aput v6, p3, v8

    .line 41
    .line 42
    ushr-long/2addr v4, p0

    .line 43
    add-int/lit8 v6, p2, 0x2

    .line 44
    .line 45
    aget v6, p1, v6

    .line 46
    .line 47
    int-to-long v6, v6

    .line 48
    and-long/2addr v6, v2

    .line 49
    mul-long/2addr v6, v0

    .line 50
    add-int/lit8 v8, p4, 0x2

    .line 51
    .line 52
    aget v9, p3, v8

    .line 53
    .line 54
    int-to-long v9, v9

    .line 55
    and-long/2addr v9, v2

    .line 56
    add-long/2addr v6, v9

    .line 57
    add-long/2addr v4, v6

    .line 58
    long-to-int v6, v4

    .line 59
    aput v6, p3, v8

    .line 60
    .line 61
    ushr-long/2addr v4, p0

    .line 62
    add-int/lit8 v6, p2, 0x3

    .line 63
    .line 64
    aget v6, p1, v6

    .line 65
    .line 66
    int-to-long v6, v6

    .line 67
    and-long/2addr v6, v2

    .line 68
    mul-long/2addr v6, v0

    .line 69
    add-int/lit8 v8, p4, 0x3

    .line 70
    .line 71
    aget v9, p3, v8

    .line 72
    .line 73
    int-to-long v9, v9

    .line 74
    and-long/2addr v9, v2

    .line 75
    add-long/2addr v6, v9

    .line 76
    add-long/2addr v4, v6

    .line 77
    long-to-int v6, v4

    .line 78
    aput v6, p3, v8

    .line 79
    .line 80
    ushr-long/2addr v4, p0

    .line 81
    add-int/lit8 v6, p2, 0x4

    .line 82
    .line 83
    aget v6, p1, v6

    .line 84
    .line 85
    int-to-long v6, v6

    .line 86
    and-long/2addr v6, v2

    .line 87
    mul-long/2addr v6, v0

    .line 88
    add-int/lit8 v8, p4, 0x4

    .line 89
    .line 90
    aget v9, p3, v8

    .line 91
    .line 92
    int-to-long v9, v9

    .line 93
    and-long/2addr v9, v2

    .line 94
    add-long/2addr v6, v9

    .line 95
    add-long/2addr v4, v6

    .line 96
    long-to-int v6, v4

    .line 97
    aput v6, p3, v8

    .line 98
    .line 99
    ushr-long/2addr v4, p0

    .line 100
    add-int/lit8 v6, p2, 0x5

    .line 101
    .line 102
    aget v6, p1, v6

    .line 103
    .line 104
    int-to-long v6, v6

    .line 105
    and-long/2addr v6, v2

    .line 106
    mul-long/2addr v6, v0

    .line 107
    add-int/lit8 v8, p4, 0x5

    .line 108
    .line 109
    aget v9, p3, v8

    .line 110
    .line 111
    int-to-long v9, v9

    .line 112
    and-long/2addr v9, v2

    .line 113
    add-long/2addr v6, v9

    .line 114
    add-long/2addr v4, v6

    .line 115
    long-to-int v6, v4

    .line 116
    aput v6, p3, v8

    .line 117
    .line 118
    ushr-long/2addr v4, p0

    .line 119
    add-int/lit8 p2, p2, 0x6

    .line 120
    .line 121
    aget p1, p1, p2

    .line 122
    .line 123
    int-to-long p1, p1

    .line 124
    and-long/2addr p1, v2

    .line 125
    mul-long/2addr v0, p1

    .line 126
    add-int/lit8 p4, p4, 0x6

    .line 127
    .line 128
    aget p1, p3, p4

    .line 129
    .line 130
    int-to-long p1, p1

    .line 131
    and-long/2addr p1, v2

    .line 132
    add-long/2addr v0, p1

    .line 133
    add-long/2addr v4, v0

    .line 134
    long-to-int p1, v4

    .line 135
    aput p1, p3, p4

    .line 136
    .line 137
    ushr-long p0, v4, p0

    .line 138
    .line 139
    long-to-int p0, p0

    .line 140
    return p0
.end method

.method public static mulWordDwordAdd(IJ[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p1, v2

    .line 9
    .line 10
    mul-long/2addr v4, v0

    .line 11
    aget p0, p3, p4

    .line 12
    .line 13
    int-to-long v6, p0

    .line 14
    and-long/2addr v6, v2

    .line 15
    add-long/2addr v4, v6

    .line 16
    long-to-int p0, v4

    .line 17
    aput p0, p3, p4

    .line 18
    .line 19
    const/16 p0, 0x20

    .line 20
    .line 21
    ushr-long/2addr v4, p0

    .line 22
    ushr-long/2addr p1, p0

    .line 23
    mul-long/2addr v0, p1

    .line 24
    add-int/lit8 p1, p4, 0x1

    .line 25
    .line 26
    aget p2, p3, p1

    .line 27
    .line 28
    int-to-long v6, p2

    .line 29
    and-long/2addr v6, v2

    .line 30
    add-long/2addr v0, v6

    .line 31
    add-long/2addr v4, v0

    .line 32
    long-to-int p2, v4

    .line 33
    aput p2, p3, p1

    .line 34
    .line 35
    ushr-long p1, v4, p0

    .line 36
    .line 37
    add-int/lit8 v0, p4, 0x2

    .line 38
    .line 39
    aget v1, p3, v0

    .line 40
    .line 41
    int-to-long v4, v1

    .line 42
    and-long v1, v4, v2

    .line 43
    .line 44
    add-long/2addr p1, v1

    .line 45
    long-to-int v1, p1

    .line 46
    aput v1, p3, v0

    .line 47
    .line 48
    ushr-long p0, p1, p0

    .line 49
    .line 50
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    cmp-long p0, p0, v0

    .line 53
    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_0
    const/4 p0, 0x7

    .line 59
    const/4 p1, 0x3

    .line 60
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public static square([II[II)V
    .locals 40

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    const/4 v4, 0x0

    .line 11
    const/16 v6, 0xe

    .line 12
    .line 13
    const/4 v7, 0x6

    .line 14
    :goto_0
    add-int/lit8 v8, v7, -0x1

    .line 15
    .line 16
    add-int v7, p1, v7

    .line 17
    .line 18
    aget v7, p0, v7

    .line 19
    .line 20
    int-to-long v9, v7

    .line 21
    and-long/2addr v9, v2

    .line 22
    mul-long/2addr v9, v9

    .line 23
    add-int/lit8 v7, v6, -0x1

    .line 24
    .line 25
    add-int v7, p3, v7

    .line 26
    .line 27
    shl-int/lit8 v4, v4, 0x1f

    .line 28
    .line 29
    const/16 v11, 0x21

    .line 30
    .line 31
    ushr-long v12, v9, v11

    .line 32
    .line 33
    long-to-int v12, v12

    .line 34
    or-int/2addr v4, v12

    .line 35
    aput v4, p2, v7

    .line 36
    .line 37
    add-int/lit8 v6, v6, -0x2

    .line 38
    .line 39
    add-int v4, p3, v6

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    ushr-long v12, v9, v7

    .line 43
    .line 44
    long-to-int v12, v12

    .line 45
    aput v12, p2, v4

    .line 46
    .line 47
    long-to-int v4, v9

    .line 48
    if-gtz v8, :cond_0

    .line 49
    .line 50
    mul-long v8, v0, v0

    .line 51
    .line 52
    shl-int/lit8 v4, v4, 0x1f

    .line 53
    .line 54
    int-to-long v12, v4

    .line 55
    and-long/2addr v12, v2

    .line 56
    ushr-long v10, v8, v11

    .line 57
    .line 58
    or-long/2addr v10, v12

    .line 59
    long-to-int v4, v8

    .line 60
    aput v4, p2, p3

    .line 61
    .line 62
    const/16 v4, 0x20

    .line 63
    .line 64
    ushr-long/2addr v8, v4

    .line 65
    long-to-int v6, v8

    .line 66
    and-int/2addr v6, v7

    .line 67
    add-int/lit8 v8, p1, 0x1

    .line 68
    .line 69
    aget v8, p0, v8

    .line 70
    .line 71
    int-to-long v8, v8

    .line 72
    and-long/2addr v8, v2

    .line 73
    add-int/lit8 v12, p3, 0x2

    .line 74
    .line 75
    aget v13, p2, v12

    .line 76
    .line 77
    int-to-long v13, v13

    .line 78
    and-long/2addr v13, v2

    .line 79
    mul-long v15, v8, v0

    .line 80
    .line 81
    add-long/2addr v10, v15

    .line 82
    long-to-int v15, v10

    .line 83
    add-int/lit8 v16, p3, 0x1

    .line 84
    .line 85
    shl-int/lit8 v17, v15, 0x1

    .line 86
    .line 87
    or-int v6, v17, v6

    .line 88
    .line 89
    aput v6, p2, v16

    .line 90
    .line 91
    ushr-int/lit8 v6, v15, 0x1f

    .line 92
    .line 93
    ushr-long/2addr v10, v4

    .line 94
    add-long/2addr v13, v10

    .line 95
    add-int/lit8 v10, p1, 0x2

    .line 96
    .line 97
    aget v10, p0, v10

    .line 98
    .line 99
    int-to-long v10, v10

    .line 100
    and-long/2addr v10, v2

    .line 101
    add-int/lit8 v15, p3, 0x3

    .line 102
    .line 103
    move-wide/from16 v16, v2

    .line 104
    .line 105
    aget v2, p2, v15

    .line 106
    .line 107
    int-to-long v2, v2

    .line 108
    and-long v2, v2, v16

    .line 109
    .line 110
    add-int/lit8 v18, p3, 0x4

    .line 111
    .line 112
    move/from16 v19, v4

    .line 113
    .line 114
    aget v4, p2, v18

    .line 115
    .line 116
    move/from16 v21, v6

    .line 117
    .line 118
    const/16 v20, 0x6

    .line 119
    .line 120
    int-to-long v5, v4

    .line 121
    and-long v4, v5, v16

    .line 122
    .line 123
    mul-long v22, v10, v0

    .line 124
    .line 125
    add-long v13, v13, v22

    .line 126
    .line 127
    long-to-int v6, v13

    .line 128
    shl-int/lit8 v22, v6, 0x1

    .line 129
    .line 130
    or-int v21, v22, v21

    .line 131
    .line 132
    aput v21, p2, v12

    .line 133
    .line 134
    ushr-int/lit8 v6, v6, 0x1f

    .line 135
    .line 136
    ushr-long v12, v13, v19

    .line 137
    .line 138
    mul-long v21, v10, v8

    .line 139
    .line 140
    add-long v12, v12, v21

    .line 141
    .line 142
    add-long/2addr v2, v12

    .line 143
    ushr-long v12, v2, v19

    .line 144
    .line 145
    add-long/2addr v4, v12

    .line 146
    and-long v2, v2, v16

    .line 147
    .line 148
    add-int/lit8 v12, p1, 0x3

    .line 149
    .line 150
    aget v12, p0, v12

    .line 151
    .line 152
    int-to-long v12, v12

    .line 153
    and-long v12, v12, v16

    .line 154
    .line 155
    add-int/lit8 v14, p3, 0x5

    .line 156
    .line 157
    move/from16 v21, v7

    .line 158
    .line 159
    aget v7, p2, v14

    .line 160
    .line 161
    move-wide/from16 v22, v0

    .line 162
    .line 163
    int-to-long v0, v7

    .line 164
    and-long v0, v0, v16

    .line 165
    .line 166
    add-int/lit8 v7, p3, 0x6

    .line 167
    .line 168
    move-wide/from16 v24, v0

    .line 169
    .line 170
    aget v0, p2, v7

    .line 171
    .line 172
    int-to-long v0, v0

    .line 173
    and-long v0, v0, v16

    .line 174
    .line 175
    mul-long v26, v12, v22

    .line 176
    .line 177
    add-long v2, v2, v26

    .line 178
    .line 179
    move-wide/from16 v26, v0

    .line 180
    .line 181
    long-to-int v0, v2

    .line 182
    shl-int/lit8 v1, v0, 0x1

    .line 183
    .line 184
    or-int/2addr v1, v6

    .line 185
    aput v1, p2, v15

    .line 186
    .line 187
    ushr-int/lit8 v0, v0, 0x1f

    .line 188
    .line 189
    ushr-long v1, v2, v19

    .line 190
    .line 191
    mul-long v28, v12, v8

    .line 192
    .line 193
    add-long v1, v1, v28

    .line 194
    .line 195
    add-long/2addr v4, v1

    .line 196
    ushr-long v1, v4, v19

    .line 197
    .line 198
    mul-long v28, v12, v10

    .line 199
    .line 200
    add-long v1, v1, v28

    .line 201
    .line 202
    add-long v1, v24, v1

    .line 203
    .line 204
    and-long v3, v4, v16

    .line 205
    .line 206
    ushr-long v5, v1, v19

    .line 207
    .line 208
    add-long v5, v26, v5

    .line 209
    .line 210
    and-long v1, v1, v16

    .line 211
    .line 212
    add-int/lit8 v15, p1, 0x4

    .line 213
    .line 214
    aget v15, p0, v15

    .line 215
    .line 216
    move/from16 v24, v0

    .line 217
    .line 218
    move-wide/from16 v25, v1

    .line 219
    .line 220
    int-to-long v0, v15

    .line 221
    and-long v0, v0, v16

    .line 222
    .line 223
    add-int/lit8 v2, p3, 0x7

    .line 224
    .line 225
    aget v15, p2, v2

    .line 226
    .line 227
    move-wide/from16 v27, v0

    .line 228
    .line 229
    int-to-long v0, v15

    .line 230
    and-long v0, v0, v16

    .line 231
    .line 232
    add-int/lit8 v15, p3, 0x8

    .line 233
    .line 234
    move-wide/from16 v29, v0

    .line 235
    .line 236
    aget v0, p2, v15

    .line 237
    .line 238
    int-to-long v0, v0

    .line 239
    and-long v0, v0, v16

    .line 240
    .line 241
    mul-long v31, v27, v22

    .line 242
    .line 243
    add-long v3, v3, v31

    .line 244
    .line 245
    move-wide/from16 v31, v0

    .line 246
    .line 247
    long-to-int v0, v3

    .line 248
    shl-int/lit8 v1, v0, 0x1

    .line 249
    .line 250
    or-int v1, v1, v24

    .line 251
    .line 252
    aput v1, p2, v18

    .line 253
    .line 254
    ushr-int/lit8 v0, v0, 0x1f

    .line 255
    .line 256
    ushr-long v3, v3, v19

    .line 257
    .line 258
    mul-long v33, v27, v8

    .line 259
    .line 260
    add-long v3, v3, v33

    .line 261
    .line 262
    add-long v3, v25, v3

    .line 263
    .line 264
    ushr-long v24, v3, v19

    .line 265
    .line 266
    mul-long v33, v27, v10

    .line 267
    .line 268
    add-long v24, v24, v33

    .line 269
    .line 270
    add-long v5, v5, v24

    .line 271
    .line 272
    and-long v3, v3, v16

    .line 273
    .line 274
    ushr-long v24, v5, v19

    .line 275
    .line 276
    mul-long v33, v27, v12

    .line 277
    .line 278
    add-long v24, v24, v33

    .line 279
    .line 280
    add-long v24, v29, v24

    .line 281
    .line 282
    and-long v5, v5, v16

    .line 283
    .line 284
    ushr-long v29, v24, v19

    .line 285
    .line 286
    add-long v29, v31, v29

    .line 287
    .line 288
    and-long v24, v24, v16

    .line 289
    .line 290
    add-int/lit8 v1, p1, 0x5

    .line 291
    .line 292
    aget v1, p0, v1

    .line 293
    .line 294
    move/from16 v18, v0

    .line 295
    .line 296
    int-to-long v0, v1

    .line 297
    and-long v0, v0, v16

    .line 298
    .line 299
    add-int/lit8 v26, p3, 0x9

    .line 300
    .line 301
    move-wide/from16 v31, v0

    .line 302
    .line 303
    aget v0, p2, v26

    .line 304
    .line 305
    int-to-long v0, v0

    .line 306
    and-long v0, v0, v16

    .line 307
    .line 308
    add-int/lit8 v33, p3, 0xa

    .line 309
    .line 310
    move-wide/from16 v34, v0

    .line 311
    .line 312
    aget v0, p2, v33

    .line 313
    .line 314
    int-to-long v0, v0

    .line 315
    and-long v0, v0, v16

    .line 316
    .line 317
    mul-long v36, v31, v22

    .line 318
    .line 319
    add-long v3, v3, v36

    .line 320
    .line 321
    move-wide/from16 v36, v0

    .line 322
    .line 323
    long-to-int v0, v3

    .line 324
    shl-int/lit8 v1, v0, 0x1

    .line 325
    .line 326
    or-int v1, v1, v18

    .line 327
    .line 328
    aput v1, p2, v14

    .line 329
    .line 330
    ushr-int/lit8 v0, v0, 0x1f

    .line 331
    .line 332
    ushr-long v3, v3, v19

    .line 333
    .line 334
    mul-long v38, v31, v8

    .line 335
    .line 336
    add-long v3, v3, v38

    .line 337
    .line 338
    add-long/2addr v5, v3

    .line 339
    ushr-long v3, v5, v19

    .line 340
    .line 341
    mul-long v38, v31, v10

    .line 342
    .line 343
    add-long v3, v3, v38

    .line 344
    .line 345
    add-long v24, v24, v3

    .line 346
    .line 347
    and-long v3, v5, v16

    .line 348
    .line 349
    ushr-long v5, v24, v19

    .line 350
    .line 351
    mul-long v38, v31, v12

    .line 352
    .line 353
    add-long v5, v5, v38

    .line 354
    .line 355
    add-long v29, v29, v5

    .line 356
    .line 357
    and-long v5, v24, v16

    .line 358
    .line 359
    ushr-long v24, v29, v19

    .line 360
    .line 361
    mul-long v38, v31, v27

    .line 362
    .line 363
    add-long v24, v24, v38

    .line 364
    .line 365
    add-long v24, v34, v24

    .line 366
    .line 367
    and-long v29, v29, v16

    .line 368
    .line 369
    ushr-long v34, v24, v19

    .line 370
    .line 371
    add-long v34, v36, v34

    .line 372
    .line 373
    and-long v24, v24, v16

    .line 374
    .line 375
    add-int/lit8 v1, p1, 0x6

    .line 376
    .line 377
    aget v1, p0, v1

    .line 378
    .line 379
    move v14, v0

    .line 380
    int-to-long v0, v1

    .line 381
    and-long v0, v0, v16

    .line 382
    .line 383
    add-int/lit8 v18, p3, 0xb

    .line 384
    .line 385
    move-wide/from16 p0, v0

    .line 386
    .line 387
    aget v0, p2, v18

    .line 388
    .line 389
    int-to-long v0, v0

    .line 390
    and-long v0, v0, v16

    .line 391
    .line 392
    add-int/lit8 v20, p3, 0xc

    .line 393
    .line 394
    move-wide/from16 v36, v0

    .line 395
    .line 396
    aget v0, p2, v20

    .line 397
    .line 398
    int-to-long v0, v0

    .line 399
    and-long v0, v0, v16

    .line 400
    .line 401
    mul-long v16, p0, v22

    .line 402
    .line 403
    add-long v3, v3, v16

    .line 404
    .line 405
    move-wide/from16 v16, v0

    .line 406
    .line 407
    long-to-int v0, v3

    .line 408
    shl-int/lit8 v1, v0, 0x1

    .line 409
    .line 410
    or-int/2addr v1, v14

    .line 411
    aput v1, p2, v7

    .line 412
    .line 413
    ushr-int/lit8 v0, v0, 0x1f

    .line 414
    .line 415
    ushr-long v3, v3, v19

    .line 416
    .line 417
    mul-long v7, p0, v8

    .line 418
    .line 419
    add-long/2addr v3, v7

    .line 420
    add-long/2addr v5, v3

    .line 421
    ushr-long v3, v5, v19

    .line 422
    .line 423
    mul-long v7, p0, v10

    .line 424
    .line 425
    add-long/2addr v3, v7

    .line 426
    add-long v3, v29, v3

    .line 427
    .line 428
    ushr-long v7, v3, v19

    .line 429
    .line 430
    mul-long v9, p0, v12

    .line 431
    .line 432
    add-long/2addr v7, v9

    .line 433
    add-long v7, v24, v7

    .line 434
    .line 435
    ushr-long v9, v7, v19

    .line 436
    .line 437
    mul-long v11, p0, v27

    .line 438
    .line 439
    add-long/2addr v9, v11

    .line 440
    add-long v9, v34, v9

    .line 441
    .line 442
    ushr-long v11, v9, v19

    .line 443
    .line 444
    mul-long v13, p0, v31

    .line 445
    .line 446
    add-long/2addr v11, v13

    .line 447
    add-long v11, v36, v11

    .line 448
    .line 449
    ushr-long v13, v11, v19

    .line 450
    .line 451
    add-long v13, v16, v13

    .line 452
    .line 453
    long-to-int v1, v5

    .line 454
    shl-int/lit8 v5, v1, 0x1

    .line 455
    .line 456
    or-int/2addr v0, v5

    .line 457
    aput v0, p2, v2

    .line 458
    .line 459
    ushr-int/lit8 v0, v1, 0x1f

    .line 460
    .line 461
    long-to-int v1, v3

    .line 462
    shl-int/lit8 v2, v1, 0x1

    .line 463
    .line 464
    or-int/2addr v0, v2

    .line 465
    aput v0, p2, v15

    .line 466
    .line 467
    ushr-int/lit8 v0, v1, 0x1f

    .line 468
    .line 469
    long-to-int v1, v7

    .line 470
    shl-int/lit8 v2, v1, 0x1

    .line 471
    .line 472
    or-int/2addr v0, v2

    .line 473
    aput v0, p2, v26

    .line 474
    .line 475
    ushr-int/lit8 v0, v1, 0x1f

    .line 476
    .line 477
    long-to-int v1, v9

    .line 478
    shl-int/lit8 v2, v1, 0x1

    .line 479
    .line 480
    or-int/2addr v0, v2

    .line 481
    aput v0, p2, v33

    .line 482
    .line 483
    ushr-int/lit8 v0, v1, 0x1f

    .line 484
    .line 485
    long-to-int v1, v11

    .line 486
    shl-int/lit8 v2, v1, 0x1

    .line 487
    .line 488
    or-int/2addr v0, v2

    .line 489
    aput v0, p2, v18

    .line 490
    .line 491
    ushr-int/lit8 v0, v1, 0x1f

    .line 492
    .line 493
    long-to-int v1, v13

    .line 494
    shl-int/lit8 v2, v1, 0x1

    .line 495
    .line 496
    or-int/2addr v0, v2

    .line 497
    aput v0, p2, v20

    .line 498
    .line 499
    ushr-int/lit8 v0, v1, 0x1f

    .line 500
    .line 501
    add-int/lit8 v1, p3, 0xd

    .line 502
    .line 503
    aget v2, p2, v1

    .line 504
    .line 505
    shr-long v3, v13, v19

    .line 506
    .line 507
    long-to-int v3, v3

    .line 508
    add-int/2addr v2, v3

    .line 509
    shl-int/lit8 v2, v2, 0x1

    .line 510
    .line 511
    or-int/2addr v0, v2

    .line 512
    aput v0, p2, v1

    .line 513
    .line 514
    return-void

    .line 515
    :cond_0
    move v7, v8

    .line 516
    goto/16 :goto_0
.end method

.method public static square([I[I)V
    .locals 40

    const/4 v0, 0x0

    .line 517
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/16 v6, 0xe

    move v8, v0

    const/4 v7, 0x6

    :goto_0
    add-int/lit8 v9, v7, -0x1

    .line 518
    aget v7, p0, v7

    int-to-long v10, v7

    and-long/2addr v10, v3

    mul-long/2addr v10, v10

    add-int/lit8 v7, v6, -0x1

    shl-int/lit8 v8, v8, 0x1f

    const/16 v12, 0x21

    ushr-long v13, v10, v12

    long-to-int v13, v13

    or-int/2addr v8, v13

    .line 519
    aput v8, p1, v7

    add-int/lit8 v6, v6, -0x2

    const/4 v7, 0x1

    ushr-long v13, v10, v7

    long-to-int v8, v13

    .line 520
    aput v8, p1, v6

    long-to-int v8, v10

    if-gtz v9, :cond_0

    mul-long v9, v1, v1

    shl-int/lit8 v6, v8, 0x1f

    int-to-long v13, v6

    and-long/2addr v13, v3

    ushr-long v11, v9, v12

    or-long/2addr v11, v13

    long-to-int v6, v9

    .line 521
    aput v6, p1, v0

    const/16 v0, 0x20

    ushr-long v8, v9, v0

    long-to-int v6, v8

    and-int/2addr v6, v7

    .line 522
    aget v8, p0, v7

    int-to-long v8, v8

    and-long/2addr v8, v3

    const/4 v10, 0x2

    .line 523
    aget v13, p1, v10

    int-to-long v13, v13

    and-long/2addr v13, v3

    mul-long v15, v8, v1

    add-long/2addr v11, v15

    long-to-int v15, v11

    shl-int/lit8 v16, v15, 0x1

    or-int v6, v16, v6

    .line 524
    aput v6, p1, v7

    ushr-int/lit8 v6, v15, 0x1f

    ushr-long/2addr v11, v0

    add-long/2addr v13, v11

    .line 525
    aget v11, p0, v10

    int-to-long v11, v11

    and-long/2addr v11, v3

    const/4 v15, 0x3

    move/from16 v16, v0

    .line 526
    aget v0, p1, v15

    move-wide/from16 v17, v3

    int-to-long v3, v0

    and-long v3, v3, v17

    const/16 v19, 0x4

    .line 527
    aget v0, p1, v19

    move/from16 v21, v6

    const/16 v20, 0x6

    int-to-long v5, v0

    and-long v5, v5, v17

    mul-long v22, v11, v1

    add-long v13, v13, v22

    long-to-int v0, v13

    shl-int/lit8 v22, v0, 0x1

    or-int v21, v22, v21

    .line 528
    aput v21, p1, v10

    ushr-int/lit8 v0, v0, 0x1f

    ushr-long v13, v13, v16

    mul-long v21, v11, v8

    add-long v13, v13, v21

    add-long/2addr v3, v13

    ushr-long v13, v3, v16

    add-long/2addr v5, v13

    and-long v3, v3, v17

    .line 529
    aget v10, p0, v15

    int-to-long v13, v10

    and-long v13, v13, v17

    const/4 v10, 0x5

    move/from16 v21, v7

    .line 530
    aget v7, p1, v10

    move-wide/from16 v22, v11

    move v12, v10

    int-to-long v10, v7

    and-long v10, v10, v17

    .line 531
    aget v7, p1, v20

    move-wide/from16 v24, v13

    move v14, v12

    int-to-long v12, v7

    and-long v12, v12, v17

    mul-long v26, v24, v1

    add-long v3, v3, v26

    long-to-int v7, v3

    shl-int/lit8 v26, v7, 0x1

    or-int v0, v26, v0

    .line 532
    aput v0, p1, v15

    ushr-int/lit8 v0, v7, 0x1f

    ushr-long v3, v3, v16

    mul-long v26, v24, v8

    add-long v3, v3, v26

    add-long/2addr v5, v3

    ushr-long v3, v5, v16

    mul-long v26, v24, v22

    add-long v3, v3, v26

    add-long/2addr v10, v3

    and-long v3, v5, v17

    ushr-long v5, v10, v16

    add-long/2addr v12, v5

    and-long v5, v10, v17

    .line 533
    aget v7, p0, v19

    int-to-long v10, v7

    and-long v10, v10, v17

    const/4 v7, 0x7

    .line 534
    aget v15, p1, v7

    move-wide/from16 v26, v8

    move v9, v7

    int-to-long v7, v15

    and-long v7, v7, v17

    const/16 v15, 0x8

    move/from16 v28, v9

    .line 535
    aget v9, p1, v15

    move/from16 v29, v14

    move/from16 v30, v15

    int-to-long v14, v9

    and-long v14, v14, v17

    mul-long v31, v10, v1

    add-long v3, v3, v31

    long-to-int v9, v3

    shl-int/lit8 v31, v9, 0x1

    or-int v0, v31, v0

    .line 536
    aput v0, p1, v19

    ushr-int/lit8 v0, v9, 0x1f

    ushr-long v3, v3, v16

    mul-long v31, v10, v26

    add-long v3, v3, v31

    add-long/2addr v5, v3

    ushr-long v3, v5, v16

    mul-long v31, v10, v22

    add-long v3, v3, v31

    add-long/2addr v12, v3

    and-long v3, v5, v17

    ushr-long v5, v12, v16

    mul-long v31, v10, v24

    add-long v5, v5, v31

    add-long/2addr v7, v5

    and-long v5, v12, v17

    ushr-long v12, v7, v16

    add-long/2addr v14, v12

    and-long v7, v7, v17

    .line 537
    aget v9, p0, v29

    int-to-long v12, v9

    and-long v12, v12, v17

    const/16 v19, 0x9

    .line 538
    aget v9, p1, v19

    move-wide/from16 v31, v1

    move v2, v0

    int-to-long v0, v9

    and-long v0, v0, v17

    const/16 v33, 0xa

    .line 539
    aget v9, p1, v33

    move-wide/from16 v34, v0

    int-to-long v0, v9

    and-long v0, v0, v17

    mul-long v36, v12, v31

    add-long v3, v3, v36

    long-to-int v9, v3

    shl-int/lit8 v36, v9, 0x1

    or-int v2, v36, v2

    .line 540
    aput v2, p1, v29

    ushr-int/lit8 v2, v9, 0x1f

    ushr-long v3, v3, v16

    mul-long v36, v12, v26

    add-long v3, v3, v36

    add-long/2addr v5, v3

    ushr-long v3, v5, v16

    mul-long v36, v12, v22

    add-long v3, v3, v36

    add-long/2addr v7, v3

    and-long v3, v5, v17

    ushr-long v5, v7, v16

    mul-long v36, v12, v24

    add-long v5, v5, v36

    add-long/2addr v14, v5

    and-long v5, v7, v17

    ushr-long v7, v14, v16

    mul-long v36, v12, v10

    add-long v7, v7, v36

    add-long v7, v34, v7

    and-long v14, v14, v17

    ushr-long v34, v7, v16

    add-long v0, v0, v34

    and-long v7, v7, v17

    .line 541
    aget v9, p0, v20

    move-wide/from16 v34, v0

    int-to-long v0, v9

    and-long v0, v0, v17

    const/16 p0, 0xb

    .line 542
    aget v9, p1, p0

    move-wide/from16 v36, v0

    int-to-long v0, v9

    and-long v0, v0, v17

    const/16 v29, 0xc

    .line 543
    aget v9, p1, v29

    move-wide/from16 v38, v0

    int-to-long v0, v9

    and-long v0, v0, v17

    mul-long v17, v36, v31

    add-long v3, v3, v17

    long-to-int v9, v3

    shl-int/lit8 v17, v9, 0x1

    or-int v2, v17, v2

    .line 544
    aput v2, p1, v20

    ushr-int/lit8 v2, v9, 0x1f

    ushr-long v3, v3, v16

    mul-long v17, v36, v26

    add-long v3, v3, v17

    add-long/2addr v5, v3

    ushr-long v3, v5, v16

    mul-long v17, v36, v22

    add-long v3, v3, v17

    add-long/2addr v14, v3

    ushr-long v3, v14, v16

    mul-long v17, v36, v24

    add-long v3, v3, v17

    add-long/2addr v7, v3

    ushr-long v3, v7, v16

    mul-long v9, v36, v10

    add-long/2addr v3, v9

    add-long v3, v34, v3

    ushr-long v9, v3, v16

    mul-long v11, v36, v12

    add-long/2addr v9, v11

    add-long v9, v38, v9

    ushr-long v11, v9, v16

    add-long/2addr v0, v11

    long-to-int v5, v5

    shl-int/lit8 v6, v5, 0x1

    or-int/2addr v2, v6

    .line 545
    aput v2, p1, v28

    ushr-int/lit8 v2, v5, 0x1f

    long-to-int v5, v14

    shl-int/lit8 v6, v5, 0x1

    or-int/2addr v2, v6

    .line 546
    aput v2, p1, v30

    ushr-int/lit8 v2, v5, 0x1f

    long-to-int v5, v7

    shl-int/lit8 v6, v5, 0x1

    or-int/2addr v2, v6

    .line 547
    aput v2, p1, v19

    ushr-int/lit8 v2, v5, 0x1f

    long-to-int v3, v3

    shl-int/lit8 v4, v3, 0x1

    or-int/2addr v2, v4

    .line 548
    aput v2, p1, v33

    ushr-int/lit8 v2, v3, 0x1f

    long-to-int v3, v9

    shl-int/lit8 v4, v3, 0x1

    or-int/2addr v2, v4

    .line 549
    aput v2, p1, p0

    ushr-int/lit8 v2, v3, 0x1f

    long-to-int v3, v0

    shl-int/lit8 v4, v3, 0x1

    or-int/2addr v2, v4

    .line 550
    aput v2, p1, v29

    ushr-int/lit8 v2, v3, 0x1f

    const/16 v3, 0xd

    .line 551
    aget v4, p1, v3

    shr-long v0, v0, v16

    long-to-int v0, v0

    add-int/2addr v4, v0

    shl-int/lit8 v0, v4, 0x1

    or-int/2addr v0, v2

    .line 552
    aput v0, p1, v3

    return-void

    :cond_0
    move v7, v9

    goto/16 :goto_0
.end method

.method public static sub([II[II[II)I
    .locals 9

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    sub-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p4, p5

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    shr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p1, 0x1

    .line 22
    .line 23
    aget v5, p0, v5

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    and-long/2addr v5, v2

    .line 27
    add-int/lit8 v7, p3, 0x1

    .line 28
    .line 29
    aget v7, p2, v7

    .line 30
    .line 31
    int-to-long v7, v7

    .line 32
    and-long/2addr v7, v2

    .line 33
    sub-long/2addr v5, v7

    .line 34
    add-long/2addr v0, v5

    .line 35
    add-int/lit8 v5, p5, 0x1

    .line 36
    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p4, v5

    .line 39
    .line 40
    shr-long/2addr v0, v4

    .line 41
    add-int/lit8 v5, p1, 0x2

    .line 42
    .line 43
    aget v5, p0, v5

    .line 44
    .line 45
    int-to-long v5, v5

    .line 46
    and-long/2addr v5, v2

    .line 47
    add-int/lit8 v7, p3, 0x2

    .line 48
    .line 49
    aget v7, p2, v7

    .line 50
    .line 51
    int-to-long v7, v7

    .line 52
    and-long/2addr v7, v2

    .line 53
    sub-long/2addr v5, v7

    .line 54
    add-long/2addr v0, v5

    .line 55
    add-int/lit8 v5, p5, 0x2

    .line 56
    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p4, v5

    .line 59
    .line 60
    shr-long/2addr v0, v4

    .line 61
    add-int/lit8 v5, p1, 0x3

    .line 62
    .line 63
    aget v5, p0, v5

    .line 64
    .line 65
    int-to-long v5, v5

    .line 66
    and-long/2addr v5, v2

    .line 67
    add-int/lit8 v7, p3, 0x3

    .line 68
    .line 69
    aget v7, p2, v7

    .line 70
    .line 71
    int-to-long v7, v7

    .line 72
    and-long/2addr v7, v2

    .line 73
    sub-long/2addr v5, v7

    .line 74
    add-long/2addr v0, v5

    .line 75
    add-int/lit8 v5, p5, 0x3

    .line 76
    .line 77
    long-to-int v6, v0

    .line 78
    aput v6, p4, v5

    .line 79
    .line 80
    shr-long/2addr v0, v4

    .line 81
    add-int/lit8 v5, p1, 0x4

    .line 82
    .line 83
    aget v5, p0, v5

    .line 84
    .line 85
    int-to-long v5, v5

    .line 86
    and-long/2addr v5, v2

    .line 87
    add-int/lit8 v7, p3, 0x4

    .line 88
    .line 89
    aget v7, p2, v7

    .line 90
    .line 91
    int-to-long v7, v7

    .line 92
    and-long/2addr v7, v2

    .line 93
    sub-long/2addr v5, v7

    .line 94
    add-long/2addr v0, v5

    .line 95
    add-int/lit8 v5, p5, 0x4

    .line 96
    .line 97
    long-to-int v6, v0

    .line 98
    aput v6, p4, v5

    .line 99
    .line 100
    shr-long/2addr v0, v4

    .line 101
    add-int/lit8 v5, p1, 0x5

    .line 102
    .line 103
    aget v5, p0, v5

    .line 104
    .line 105
    int-to-long v5, v5

    .line 106
    and-long/2addr v5, v2

    .line 107
    add-int/lit8 v7, p3, 0x5

    .line 108
    .line 109
    aget v7, p2, v7

    .line 110
    .line 111
    int-to-long v7, v7

    .line 112
    and-long/2addr v7, v2

    .line 113
    sub-long/2addr v5, v7

    .line 114
    add-long/2addr v0, v5

    .line 115
    add-int/lit8 v5, p5, 0x5

    .line 116
    .line 117
    long-to-int v6, v0

    .line 118
    aput v6, p4, v5

    .line 119
    .line 120
    shr-long/2addr v0, v4

    .line 121
    add-int/lit8 p1, p1, 0x6

    .line 122
    .line 123
    aget p0, p0, p1

    .line 124
    .line 125
    int-to-long p0, p0

    .line 126
    and-long/2addr p0, v2

    .line 127
    add-int/lit8 p3, p3, 0x6

    .line 128
    .line 129
    aget p2, p2, p3

    .line 130
    .line 131
    int-to-long p2, p2

    .line 132
    and-long/2addr p2, v2

    .line 133
    sub-long/2addr p0, p2

    .line 134
    add-long/2addr v0, p0

    .line 135
    add-int/lit8 p5, p5, 0x6

    .line 136
    .line 137
    long-to-int p0, v0

    .line 138
    aput p0, p4, p5

    .line 139
    .line 140
    shr-long p0, v0, v4

    .line 141
    .line 142
    long-to-int p0, p0

    .line 143
    return p0
.end method

.method public static sub([I[I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 144
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 145
    aput v5, p2, v0

    const/16 v0, 0x20

    shr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 146
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 147
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 148
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 149
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 150
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 151
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 152
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 153
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x5

    .line 154
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 155
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x6

    .line 156
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long p0, p0

    and-long/2addr p0, v3

    sub-long/2addr v6, p0

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 157
    aput p0, p2, v5

    shr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static subBothFrom([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p2, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p0, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    sub-long/2addr v1, v5

    .line 16
    aget v5, p1, v0

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    sub-long/2addr v1, v5

    .line 21
    long-to-int v5, v1

    .line 22
    aput v5, p2, v0

    .line 23
    .line 24
    const/16 v0, 0x20

    .line 25
    .line 26
    shr-long/2addr v1, v0

    .line 27
    const/4 v5, 0x1

    .line 28
    aget v6, p2, v5

    .line 29
    .line 30
    int-to-long v6, v6

    .line 31
    and-long/2addr v6, v3

    .line 32
    aget v8, p0, v5

    .line 33
    .line 34
    int-to-long v8, v8

    .line 35
    and-long/2addr v8, v3

    .line 36
    sub-long/2addr v6, v8

    .line 37
    aget v8, p1, v5

    .line 38
    .line 39
    int-to-long v8, v8

    .line 40
    and-long/2addr v8, v3

    .line 41
    sub-long/2addr v6, v8

    .line 42
    add-long/2addr v1, v6

    .line 43
    long-to-int v6, v1

    .line 44
    aput v6, p2, v5

    .line 45
    .line 46
    shr-long/2addr v1, v0

    .line 47
    const/4 v5, 0x2

    .line 48
    aget v6, p2, v5

    .line 49
    .line 50
    int-to-long v6, v6

    .line 51
    and-long/2addr v6, v3

    .line 52
    aget v8, p0, v5

    .line 53
    .line 54
    int-to-long v8, v8

    .line 55
    and-long/2addr v8, v3

    .line 56
    sub-long/2addr v6, v8

    .line 57
    aget v8, p1, v5

    .line 58
    .line 59
    int-to-long v8, v8

    .line 60
    and-long/2addr v8, v3

    .line 61
    sub-long/2addr v6, v8

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int v6, v1

    .line 64
    aput v6, p2, v5

    .line 65
    .line 66
    shr-long/2addr v1, v0

    .line 67
    const/4 v5, 0x3

    .line 68
    aget v6, p2, v5

    .line 69
    .line 70
    int-to-long v6, v6

    .line 71
    and-long/2addr v6, v3

    .line 72
    aget v8, p0, v5

    .line 73
    .line 74
    int-to-long v8, v8

    .line 75
    and-long/2addr v8, v3

    .line 76
    sub-long/2addr v6, v8

    .line 77
    aget v8, p1, v5

    .line 78
    .line 79
    int-to-long v8, v8

    .line 80
    and-long/2addr v8, v3

    .line 81
    sub-long/2addr v6, v8

    .line 82
    add-long/2addr v1, v6

    .line 83
    long-to-int v6, v1

    .line 84
    aput v6, p2, v5

    .line 85
    .line 86
    shr-long/2addr v1, v0

    .line 87
    const/4 v5, 0x4

    .line 88
    aget v6, p2, v5

    .line 89
    .line 90
    int-to-long v6, v6

    .line 91
    and-long/2addr v6, v3

    .line 92
    aget v8, p0, v5

    .line 93
    .line 94
    int-to-long v8, v8

    .line 95
    and-long/2addr v8, v3

    .line 96
    sub-long/2addr v6, v8

    .line 97
    aget v8, p1, v5

    .line 98
    .line 99
    int-to-long v8, v8

    .line 100
    and-long/2addr v8, v3

    .line 101
    sub-long/2addr v6, v8

    .line 102
    add-long/2addr v1, v6

    .line 103
    long-to-int v6, v1

    .line 104
    aput v6, p2, v5

    .line 105
    .line 106
    shr-long/2addr v1, v0

    .line 107
    const/4 v5, 0x5

    .line 108
    aget v6, p2, v5

    .line 109
    .line 110
    int-to-long v6, v6

    .line 111
    and-long/2addr v6, v3

    .line 112
    aget v8, p0, v5

    .line 113
    .line 114
    int-to-long v8, v8

    .line 115
    and-long/2addr v8, v3

    .line 116
    sub-long/2addr v6, v8

    .line 117
    aget v8, p1, v5

    .line 118
    .line 119
    int-to-long v8, v8

    .line 120
    and-long/2addr v8, v3

    .line 121
    sub-long/2addr v6, v8

    .line 122
    add-long/2addr v1, v6

    .line 123
    long-to-int v6, v1

    .line 124
    aput v6, p2, v5

    .line 125
    .line 126
    shr-long/2addr v1, v0

    .line 127
    const/4 v5, 0x6

    .line 128
    aget v6, p2, v5

    .line 129
    .line 130
    int-to-long v6, v6

    .line 131
    and-long/2addr v6, v3

    .line 132
    aget p0, p0, v5

    .line 133
    .line 134
    int-to-long v8, p0

    .line 135
    and-long/2addr v8, v3

    .line 136
    sub-long/2addr v6, v8

    .line 137
    aget p0, p1, v5

    .line 138
    .line 139
    int-to-long p0, p0

    .line 140
    and-long/2addr p0, v3

    .line 141
    sub-long/2addr v6, p0

    .line 142
    add-long/2addr v1, v6

    .line 143
    long-to-int p0, v1

    .line 144
    aput p0, p2, v5

    .line 145
    .line 146
    shr-long p0, v1, v0

    .line 147
    .line 148
    long-to-int p0, p0

    .line 149
    return p0
.end method

.method public static subFrom([II[II)I
    .locals 10

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p0, p1

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    sub-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p2, p3

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    shr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p3, 0x1

    .line 22
    .line 23
    aget v6, p2, v5

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v6, v2

    .line 27
    add-int/lit8 v8, p1, 0x1

    .line 28
    .line 29
    aget v8, p0, v8

    .line 30
    .line 31
    int-to-long v8, v8

    .line 32
    and-long/2addr v8, v2

    .line 33
    sub-long/2addr v6, v8

    .line 34
    add-long/2addr v0, v6

    .line 35
    long-to-int v6, v0

    .line 36
    aput v6, p2, v5

    .line 37
    .line 38
    shr-long/2addr v0, v4

    .line 39
    add-int/lit8 v5, p3, 0x2

    .line 40
    .line 41
    aget v6, p2, v5

    .line 42
    .line 43
    int-to-long v6, v6

    .line 44
    and-long/2addr v6, v2

    .line 45
    add-int/lit8 v8, p1, 0x2

    .line 46
    .line 47
    aget v8, p0, v8

    .line 48
    .line 49
    int-to-long v8, v8

    .line 50
    and-long/2addr v8, v2

    .line 51
    sub-long/2addr v6, v8

    .line 52
    add-long/2addr v0, v6

    .line 53
    long-to-int v6, v0

    .line 54
    aput v6, p2, v5

    .line 55
    .line 56
    shr-long/2addr v0, v4

    .line 57
    add-int/lit8 v5, p3, 0x3

    .line 58
    .line 59
    aget v6, p2, v5

    .line 60
    .line 61
    int-to-long v6, v6

    .line 62
    and-long/2addr v6, v2

    .line 63
    add-int/lit8 v8, p1, 0x3

    .line 64
    .line 65
    aget v8, p0, v8

    .line 66
    .line 67
    int-to-long v8, v8

    .line 68
    and-long/2addr v8, v2

    .line 69
    sub-long/2addr v6, v8

    .line 70
    add-long/2addr v0, v6

    .line 71
    long-to-int v6, v0

    .line 72
    aput v6, p2, v5

    .line 73
    .line 74
    shr-long/2addr v0, v4

    .line 75
    add-int/lit8 v5, p3, 0x4

    .line 76
    .line 77
    aget v6, p2, v5

    .line 78
    .line 79
    int-to-long v6, v6

    .line 80
    and-long/2addr v6, v2

    .line 81
    add-int/lit8 v8, p1, 0x4

    .line 82
    .line 83
    aget v8, p0, v8

    .line 84
    .line 85
    int-to-long v8, v8

    .line 86
    and-long/2addr v8, v2

    .line 87
    sub-long/2addr v6, v8

    .line 88
    add-long/2addr v0, v6

    .line 89
    long-to-int v6, v0

    .line 90
    aput v6, p2, v5

    .line 91
    .line 92
    shr-long/2addr v0, v4

    .line 93
    add-int/lit8 v5, p3, 0x5

    .line 94
    .line 95
    aget v6, p2, v5

    .line 96
    .line 97
    int-to-long v6, v6

    .line 98
    and-long/2addr v6, v2

    .line 99
    add-int/lit8 v8, p1, 0x5

    .line 100
    .line 101
    aget v8, p0, v8

    .line 102
    .line 103
    int-to-long v8, v8

    .line 104
    and-long/2addr v8, v2

    .line 105
    sub-long/2addr v6, v8

    .line 106
    add-long/2addr v0, v6

    .line 107
    long-to-int v6, v0

    .line 108
    aput v6, p2, v5

    .line 109
    .line 110
    shr-long/2addr v0, v4

    .line 111
    add-int/lit8 p3, p3, 0x6

    .line 112
    .line 113
    aget v5, p2, p3

    .line 114
    .line 115
    int-to-long v5, v5

    .line 116
    and-long/2addr v5, v2

    .line 117
    add-int/lit8 p1, p1, 0x6

    .line 118
    .line 119
    aget p0, p0, p1

    .line 120
    .line 121
    int-to-long p0, p0

    .line 122
    and-long/2addr p0, v2

    .line 123
    sub-long/2addr v5, p0

    .line 124
    add-long/2addr v0, v5

    .line 125
    long-to-int p0, v0

    .line 126
    aput p0, p2, p3

    .line 127
    .line 128
    shr-long p0, v0, v4

    .line 129
    .line 130
    long-to-int p0, p0

    .line 131
    return p0
.end method

.method public static subFrom([I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 132
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p0, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 133
    aput v5, p1, v0

    const/16 v0, 0x20

    shr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 134
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 135
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 136
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 137
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 138
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 139
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x4

    .line 140
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 141
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x5

    .line 142
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 143
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x6

    .line 144
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget p0, p0, v5

    int-to-long v8, p0

    and-long/2addr v3, v8

    sub-long/2addr v6, v3

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 145
    aput p0, p1, v5

    shr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static toBigInteger([I)Ljava/math/BigInteger;
    .locals 4

    .line 1
    const/16 v0, 0x1c

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    const/4 v2, 0x7

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    aget v2, p0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    rsub-int/lit8 v3, v1, 0x6

    .line 14
    .line 15
    shl-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/math/BigInteger;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-direct {p0, v1, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public static zero([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aput v0, p0, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aput v0, p0, v1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    aput v0, p0, v1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    aput v0, p0, v1

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    aput v0, p0, v1

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    aput v0, p0, v1

    .line 18
    .line 19
    const/4 v1, 0x6

    .line 20
    aput v0, p0, v1

    .line 21
    .line 22
    return-void
.end method
