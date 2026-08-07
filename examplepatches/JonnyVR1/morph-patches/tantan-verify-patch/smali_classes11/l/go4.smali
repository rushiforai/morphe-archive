.class public final Ll/go4;
.super Ll/ko4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/go4$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final A:[I

.field public static final B:[I

.field public static final C:[I

.field public static final D:[I

.field public static final E:[I

.field public static final F:[Z

.field public static final y:[I

.field public static final z:[I


# instance fields
.field public final g:Ll/ig60;

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:J

.field public final l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/go4$a;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/go4$a;

.field public n:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/myb;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/myb;",
            ">;"
        }
    .end annotation
.end field

.field public p:I

.field public q:I

.field public r:Z

.field public s:Z

.field public t:B

.field public u:B

.field public v:I

.field public w:Z

.field public x:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Ll/go4;->y:[I

    .line 9
    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    fill-array-data v0, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/go4;->z:[I

    .line 16
    .line 17
    const/4 v0, 0x7

    .line 18
    new-array v0, v0, [I

    .line 19
    .line 20
    fill-array-data v0, :array_2

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/go4;->A:[I

    .line 24
    .line 25
    const/16 v0, 0x60

    .line 26
    .line 27
    new-array v0, v0, [I

    .line 28
    .line 29
    fill-array-data v0, :array_3

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/go4;->B:[I

    .line 33
    .line 34
    const/16 v0, 0x10

    .line 35
    .line 36
    new-array v0, v0, [I

    .line 37
    .line 38
    fill-array-data v0, :array_4

    .line 39
    .line 40
    .line 41
    sput-object v0, Ll/go4;->C:[I

    .line 42
    .line 43
    const/16 v0, 0x20

    .line 44
    .line 45
    new-array v1, v0, [I

    .line 46
    .line 47
    fill-array-data v1, :array_5

    .line 48
    .line 49
    .line 50
    sput-object v1, Ll/go4;->D:[I

    .line 51
    .line 52
    new-array v0, v0, [I

    .line 53
    .line 54
    fill-array-data v0, :array_6

    .line 55
    .line 56
    .line 57
    sput-object v0, Ll/go4;->E:[I

    .line 58
    .line 59
    const/16 v0, 0x100

    .line 60
    .line 61
    new-array v0, v0, [Z

    .line 62
    .line 63
    fill-array-data v0, :array_7

    .line 64
    .line 65
    .line 66
    sput-object v0, Ll/go4;->F:[Z

    .line 67
    .line 68
    return-void

    .line 69
    :array_0
    .array-data 4
        0xb
        0x1
        0x3
        0xc
        0xe
        0x5
        0x7
        0x9
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    :array_1
    .array-data 4
        0x0
        0x4
        0x8
        0xc
        0x10
        0x14
        0x18
        0x1c
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    :array_2
    .array-data 4
        -0x1
        -0xff0100
        -0xffff01
        -0xff0001
        -0x10000
        -0x100
        -0xff01
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    :array_3
    .array-data 4
        0x20
        0x21
        0x22
        0x23
        0x24
        0x25
        0x26
        0x27
        0x28
        0x29
        0xe1
        0x2b
        0x2c
        0x2d
        0x2e
        0x2f
        0x30
        0x31
        0x32
        0x33
        0x34
        0x35
        0x36
        0x37
        0x38
        0x39
        0x3a
        0x3b
        0x3c
        0x3d
        0x3e
        0x3f
        0x40
        0x41
        0x42
        0x43
        0x44
        0x45
        0x46
        0x47
        0x48
        0x49
        0x4a
        0x4b
        0x4c
        0x4d
        0x4e
        0x4f
        0x50
        0x51
        0x52
        0x53
        0x54
        0x55
        0x56
        0x57
        0x58
        0x59
        0x5a
        0x5b
        0xe9
        0x5d
        0xed
        0xf3
        0xfa
        0x61
        0x62
        0x63
        0x64
        0x65
        0x66
        0x67
        0x68
        0x69
        0x6a
        0x6b
        0x6c
        0x6d
        0x6e
        0x6f
        0x70
        0x71
        0x72
        0x73
        0x74
        0x75
        0x76
        0x77
        0x78
        0x79
        0x7a
        0xe7
        0xf7
        0xd1
        0xf1
        0x25a0
    .end array-data

    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :array_4
    .array-data 4
        0xae
        0xb0
        0xbd
        0xbf
        0x2122
        0xa2
        0xa3
        0x266a
        0xe0
        0x20
        0xe8
        0xe2
        0xea
        0xee
        0xf4
        0xfb
    .end array-data

    :array_5
    .array-data 4
        0xc1
        0xc9
        0xd3
        0xda
        0xdc
        0xfc
        0x2018
        0xa1
        0x2a
        0x27
        0x2014
        0xa9
        0x2120
        0x2022
        0x201c
        0x201d
        0xc0
        0xc2
        0xc7
        0xc8
        0xca
        0xcb
        0xeb
        0xce
        0xcf
        0xef
        0xd4
        0xd9
        0xf9
        0xdb
        0xab
        0xbb
    .end array-data

    :array_6
    .array-data 4
        0xc3
        0xe3
        0xcd
        0xcc
        0xec
        0xd2
        0xf2
        0xd5
        0xf5
        0x7b
        0x7d
        0x5c
        0x5e
        0x5f
        0x7c
        0x7e
        0xc4
        0xe4
        0xd6
        0xf6
        0xdf
        0xa5
        0xa4
        0x2502
        0xc5
        0xe5
        0xd8
        0xf8
        0x250c
        0x2510
        0x2514
        0x2518
    .end array-data

    :array_7
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;IJ)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ll/ko4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ig60;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ig60;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/go4;->g:Ll/ig60;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ll/go4$a;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x4

    .line 22
    invoke-direct {v0, v1, v2}, Ll/go4$a;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 26
    .line 27
    iput v1, p0, Ll/go4;->v:I

    .line 28
    .line 29
    const-wide/16 v3, 0x0

    .line 30
    .line 31
    cmp-long v0, p3, v3

    .line 32
    .line 33
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    const-wide/16 v5, 0x3e8

    .line 41
    .line 42
    mul-long/2addr p3, v5

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move-wide p3, v3

    .line 45
    :goto_0
    iput-wide p3, p0, Ll/go4;->k:J

    .line 46
    .line 47
    const-string p3, "application/x-mp4-cea-608"

    .line 48
    .line 49
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    const/4 p3, 0x3

    .line 54
    const/4 p4, 0x2

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    move p1, p4

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move p1, p3

    .line 60
    :goto_1
    iput p1, p0, Ll/go4;->h:I

    .line 61
    .line 62
    const/4 p1, 0x1

    .line 63
    if-eq p2, p1, :cond_5

    .line 64
    .line 65
    if-eq p2, p4, :cond_4

    .line 66
    .line 67
    if-eq p2, p3, :cond_3

    .line 68
    .line 69
    if-eq p2, v2, :cond_2

    .line 70
    .line 71
    const-string p2, "Cea608Decoder"

    .line 72
    .line 73
    const-string p3, "Invalid channel. Defaulting to CC1."

    .line 74
    .line 75
    invoke-static {p2, p3}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iput v1, p0, Ll/go4;->j:I

    .line 79
    .line 80
    iput v1, p0, Ll/go4;->i:I

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_2
    iput p1, p0, Ll/go4;->j:I

    .line 84
    .line 85
    iput p1, p0, Ll/go4;->i:I

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    iput v1, p0, Ll/go4;->j:I

    .line 89
    .line 90
    iput p1, p0, Ll/go4;->i:I

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    iput p1, p0, Ll/go4;->j:I

    .line 94
    .line 95
    iput v1, p0, Ll/go4;->i:I

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    iput v1, p0, Ll/go4;->j:I

    .line 99
    .line 100
    iput v1, p0, Ll/go4;->i:I

    .line 101
    .line 102
    :goto_2
    invoke-virtual {p0, v1}, Ll/go4;->M(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 106
    .line 107
    .line 108
    iput-boolean p1, p0, Ll/go4;->w:Z

    .line 109
    .line 110
    iput-wide v3, p0, Ll/go4;->x:J

    .line 111
    .line 112
    return-void
.end method

.method public static A(BB)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf6

    .line 2
    .line 3
    const/16 v0, 0x12

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    and-int/lit16 p0, p1, 0xe0

    .line 8
    .line 9
    const/16 p1, 0x20

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static B(BB)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf7

    .line 2
    .line 3
    const/16 v0, 0x11

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    and-int/lit16 p0, p1, 0xf0

    .line 8
    .line 9
    const/16 p1, 0x20

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static C(BB)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf6

    .line 2
    .line 3
    const/16 v0, 0x14

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    and-int/lit16 p0, p1, 0xf0

    .line 8
    .line 9
    const/16 p1, 0x20

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static D(BB)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf0

    .line 2
    .line 3
    const/16 v0, 0x10

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    and-int/lit16 p0, p1, 0xc0

    .line 8
    .line 9
    const/16 p1, 0x40

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static E(B)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf0

    .line 2
    .line 3
    const/16 v0, 0x10

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public static G(B)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf6

    .line 2
    .line 3
    const/16 v0, 0x14

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public static H(BB)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf7

    .line 2
    .line 3
    const/16 v0, 0x11

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    and-int/lit16 p0, p1, 0xf0

    .line 8
    .line 9
    const/16 p1, 0x30

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static I(BB)Z
    .locals 1

    .line 1
    and-int/lit16 p0, p0, 0xf7

    .line 2
    .line 3
    const/16 v0, 0x17

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/16 p0, 0x21

    .line 8
    .line 9
    if-lt p1, p0, :cond_0

    .line 10
    .line 11
    const/16 p0, 0x23

    .line 12
    .line 13
    if-gt p1, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static J(B)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-gt v0, p0, :cond_0

    .line 3
    .line 4
    const/16 v1, 0xf

    .line 5
    .line 6
    if-gt p0, v1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic o()[I
    .locals 1

    .line 1
    sget-object v0, Ll/go4;->A:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static p(B)C
    .locals 1

    .line 1
    and-int/lit8 p0, p0, 0x7f

    .line 2
    .line 3
    add-int/lit8 p0, p0, -0x20

    .line 4
    .line 5
    sget-object v0, Ll/go4;->B:[I

    .line 6
    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    int-to-char p0, p0

    .line 10
    return p0
.end method

.method public static q(B)I
    .locals 0

    .line 1
    shr-int/lit8 p0, p0, 0x3

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public static s(B)C
    .locals 1

    .line 1
    and-int/lit8 p0, p0, 0x1f

    .line 2
    .line 3
    sget-object v0, Ll/go4;->D:[I

    .line 4
    .line 5
    aget p0, v0, p0

    .line 6
    .line 7
    int-to-char p0, p0

    .line 8
    return p0
.end method

.method public static t(B)C
    .locals 1

    .line 1
    and-int/lit8 p0, p0, 0x1f

    .line 2
    .line 3
    sget-object v0, Ll/go4;->E:[I

    .line 4
    .line 5
    aget p0, v0, p0

    .line 6
    .line 7
    int-to-char p0, p0

    .line 8
    return p0
.end method

.method public static u(BB)C
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x1

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/go4;->s(B)C

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {p1}, Ll/go4;->t(B)C

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static v(B)C
    .locals 1

    .line 1
    and-int/lit8 p0, p0, 0xf

    .line 2
    .line 3
    sget-object v0, Ll/go4;->C:[I

    .line 4
    .line 5
    aget p0, v0, p0

    .line 6
    .line 7
    int-to-char p0, p0

    .line 8
    return p0
.end method

.method public static z(B)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p0, 0xe0

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public final F(ZBB)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-static {p2}, Ll/go4;->E(B)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-boolean p1, p0, Ll/go4;->s:Z

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-byte p1, p0, Ll/go4;->t:B

    .line 16
    .line 17
    if-ne p1, p2, :cond_0

    .line 18
    .line 19
    iget-byte p1, p0, Ll/go4;->u:B

    .line 20
    .line 21
    if-ne p1, p3, :cond_0

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/go4;->s:Z

    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    iput-boolean v1, p0, Ll/go4;->s:Z

    .line 27
    .line 28
    iput-byte p2, p0, Ll/go4;->t:B

    .line 29
    .line 30
    iput-byte p3, p0, Ll/go4;->u:B

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iput-boolean v0, p0, Ll/go4;->s:Z

    .line 34
    .line 35
    :goto_0
    return v0
.end method

.method public final K(BB)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/go4;->J(B)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Ll/go4;->w:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p1}, Ll/go4;->G(B)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    const/16 p1, 0x20

    .line 18
    .line 19
    if-eq p2, p1, :cond_1

    .line 20
    .line 21
    const/16 p1, 0x2f

    .line 22
    .line 23
    if-eq p2, p1, :cond_1

    .line 24
    .line 25
    packed-switch p2, :pswitch_data_0

    .line 26
    .line 27
    .line 28
    packed-switch p2, :pswitch_data_1

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :pswitch_0
    iput-boolean v1, p0, Ll/go4;->w:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    :pswitch_1
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Ll/go4;->w:Z

    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void

    .line 39
    :pswitch_data_0
    .packed-switch 0x25
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 40
    .line 41
    .line 42
    .line 43
    :pswitch_data_1
    .packed-switch 0x29
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 2
    .line 3
    iget v1, p0, Ll/go4;->p:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/go4$a;->j(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 14
    .line 15
    iget-object p0, p0, Ll/go4;->m:Ll/go4$a;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final M(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/go4;->p:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput p1, p0, Ll/go4;->p:I

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    if-ne p1, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    iget-object v1, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/go4$a;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/go4$a;->l(I)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 35
    .line 36
    .line 37
    if-eq v0, v1, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    if-eq p1, v0, :cond_3

    .line 41
    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    :goto_1
    return-void

    .line 46
    :cond_3
    :goto_2
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 47
    .line 48
    iput-object p1, p0, Ll/go4;->n:Ljava/util/List;

    .line 49
    .line 50
    return-void
.end method

.method public final N(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/go4;->q:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/go4;->m:Ll/go4$a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/go4$a;->m(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final O()Z
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/go4;->k:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-wide v4, p0, Ll/go4;->x:J

    .line 14
    .line 15
    cmp-long v0, v4, v2

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/ko4;->j()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    iget-wide v4, p0, Ll/go4;->x:J

    .line 25
    .line 26
    sub-long/2addr v2, v4

    .line 27
    iget-wide v4, p0, Ll/go4;->k:J

    .line 28
    .line 29
    cmp-long p0, v2, v4

    .line 30
    .line 31
    if-ltz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    return v1
.end method

.method public final P(B)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/go4;->z(B)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/go4;->q(B)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/go4;->v:I

    .line 12
    .line 13
    :cond_0
    iget p1, p0, Ll/go4;->v:I

    .line 14
    .line 15
    iget p0, p0, Ll/go4;->j:I

    .line 16
    .line 17
    if-ne p1, p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public bridge synthetic b(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/ko4;->b(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic c()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/decoder/DecoderException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/go4;->h()Ll/sdg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ll/mdg0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/go4;->n:Ljava/util/List;

    .line 2
    .line 3
    iput-object v0, p0, Ll/go4;->o:Ljava/util/List;

    .line 4
    .line 5
    new-instance p0, Ll/lo4;

    .line 6
    .line 7
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ll/lo4;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public f(Ll/rdg0;)V
    .locals 9

    .line 1
    iget-object p1, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    iget-object v0, p0, Ll/go4;->g:Ll/ig60;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {v0, v1, p1}, Ll/ig60;->S([BI)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    move v0, p1

    .line 24
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/go4;->g:Ll/ig60;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget v2, p0, Ll/go4;->h:I

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    if-lt v1, v2, :cond_11

    .line 34
    .line 35
    const/4 v1, 0x2

    .line 36
    if-ne v2, v1, :cond_1

    .line 37
    .line 38
    const/4 v1, -0x4

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iget-object v1, p0, Ll/go4;->g:Ll/ig60;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/ig60;->H()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :goto_1
    iget-object v2, p0, Ll/go4;->g:Ll/ig60;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/ig60;->H()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iget-object v4, p0, Ll/go4;->g:Ll/ig60;

    .line 53
    .line 54
    invoke-virtual {v4}, Ll/ig60;->H()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    and-int/lit8 v5, v1, 0x2

    .line 59
    .line 60
    if-eqz v5, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    and-int/lit8 v5, v1, 0x1

    .line 64
    .line 65
    iget v6, p0, Ll/go4;->i:I

    .line 66
    .line 67
    if-eq v5, v6, :cond_3

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    and-int/lit8 v5, v2, 0x7f

    .line 71
    .line 72
    int-to-byte v5, v5

    .line 73
    and-int/lit8 v6, v4, 0x7f

    .line 74
    .line 75
    int-to-byte v6, v6

    .line 76
    if-nez v5, :cond_4

    .line 77
    .line 78
    if-nez v6, :cond_4

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    iget-boolean v7, p0, Ll/go4;->r:Z

    .line 82
    .line 83
    and-int/lit8 v1, v1, 0x4

    .line 84
    .line 85
    const/4 v8, 0x4

    .line 86
    if-ne v1, v8, :cond_5

    .line 87
    .line 88
    sget-object v1, Ll/go4;->F:[Z

    .line 89
    .line 90
    aget-boolean v2, v1, v2

    .line 91
    .line 92
    if-eqz v2, :cond_5

    .line 93
    .line 94
    aget-boolean v1, v1, v4

    .line 95
    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    move v1, v3

    .line 99
    goto :goto_2

    .line 100
    :cond_5
    move v1, p1

    .line 101
    :goto_2
    iput-boolean v1, p0, Ll/go4;->r:Z

    .line 102
    .line 103
    invoke-virtual {p0, v1, v5, v6}, Ll/go4;->F(ZBB)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_6

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    iget-boolean v1, p0, Ll/go4;->r:Z

    .line 111
    .line 112
    if-nez v1, :cond_8

    .line 113
    .line 114
    if-eqz v7, :cond_0

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 117
    .line 118
    .line 119
    :cond_7
    :goto_3
    move v0, v3

    .line 120
    goto :goto_0

    .line 121
    :cond_8
    invoke-virtual {p0, v5, v6}, Ll/go4;->K(BB)V

    .line 122
    .line 123
    .line 124
    iget-boolean v1, p0, Ll/go4;->w:Z

    .line 125
    .line 126
    if-nez v1, :cond_9

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_9
    invoke-virtual {p0, v5}, Ll/go4;->P(B)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-nez v1, :cond_a

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_a
    invoke-static {v5}, Ll/go4;->z(B)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_10

    .line 141
    .line 142
    invoke-static {v5, v6}, Ll/go4;->H(BB)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_b

    .line 147
    .line 148
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 149
    .line 150
    invoke-static {v6}, Ll/go4;->v(B)C

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    invoke-virtual {v0, v1}, Ll/go4$a;->e(C)V

    .line 155
    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_b
    invoke-static {v5, v6}, Ll/go4;->A(BB)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_c

    .line 163
    .line 164
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/go4$a;->f()V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 170
    .line 171
    invoke-static {v5, v6}, Ll/go4;->u(BB)C

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-virtual {v0, v1}, Ll/go4$a;->e(C)V

    .line 176
    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_c
    invoke-static {v5, v6}, Ll/go4;->B(BB)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_d

    .line 184
    .line 185
    invoke-virtual {p0, v6}, Ll/go4;->w(B)V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_d
    invoke-static {v5, v6}, Ll/go4;->D(BB)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_e

    .line 194
    .line 195
    invoke-virtual {p0, v5, v6}, Ll/go4;->y(BB)V

    .line 196
    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_e
    invoke-static {v5, v6}, Ll/go4;->I(BB)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_f

    .line 204
    .line 205
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 206
    .line 207
    add-int/lit8 v6, v6, -0x20

    .line 208
    .line 209
    invoke-static {v0, v6}, Ll/go4$a;->a(Ll/go4$a;I)I

    .line 210
    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_f
    invoke-static {v5, v6}, Ll/go4;->C(BB)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_7

    .line 218
    .line 219
    invoke-virtual {p0, v6}, Ll/go4;->x(B)V

    .line 220
    .line 221
    .line 222
    goto :goto_3

    .line 223
    :cond_10
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 224
    .line 225
    invoke-static {v5}, Ll/go4;->p(B)C

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    invoke-virtual {v0, v1}, Ll/go4$a;->e(C)V

    .line 230
    .line 231
    .line 232
    and-int/lit16 v0, v6, 0xe0

    .line 233
    .line 234
    if-eqz v0, :cond_7

    .line 235
    .line 236
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 237
    .line 238
    invoke-static {v6}, Ll/go4;->p(B)C

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    invoke-virtual {v0, v1}, Ll/go4$a;->e(C)V

    .line 243
    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_11
    if-eqz v0, :cond_13

    .line 247
    .line 248
    iget p1, p0, Ll/go4;->p:I

    .line 249
    .line 250
    if-eq p1, v3, :cond_12

    .line 251
    .line 252
    const/4 v0, 0x3

    .line 253
    if-ne p1, v0, :cond_13

    .line 254
    .line 255
    :cond_12
    invoke-virtual {p0}, Ll/go4;->r()Ljava/util/List;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iput-object p1, p0, Ll/go4;->n:Ljava/util/List;

    .line 260
    .line 261
    invoke-virtual {p0}, Ll/ko4;->j()J

    .line 262
    .line 263
    .line 264
    move-result-wide v0

    .line 265
    iput-wide v0, p0, Ll/go4;->x:J

    .line 266
    .line 267
    :cond_13
    return-void
.end method

.method public flush()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ko4;->flush()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/go4;->n:Ljava/util/List;

    .line 6
    .line 7
    iput-object v0, p0, Ll/go4;->o:Ljava/util/List;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/go4;->M(I)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    invoke-virtual {p0, v1}, Ll/go4;->N(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 18
    .line 19
    .line 20
    iput-boolean v0, p0, Ll/go4;->r:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/go4;->s:Z

    .line 23
    .line 24
    iput-byte v0, p0, Ll/go4;->t:B

    .line 25
    .line 26
    iput-byte v0, p0, Ll/go4;->u:B

    .line 27
    .line 28
    iput v0, p0, Ll/go4;->v:I

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Ll/go4;->w:Z

    .line 32
    .line 33
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    iput-wide v0, p0, Ll/go4;->x:J

    .line 39
    .line 40
    return-void
.end method

.method public bridge synthetic g()Ll/rdg0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/ko4;->g()Ll/rdg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()Ll/sdg0;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/ko4;->h()Ll/sdg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/go4;->O()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ko4;->i()Ll/sdg0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 21
    .line 22
    iput-object v0, p0, Ll/go4;->n:Ljava/util/List;

    .line 23
    .line 24
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    iput-wide v2, p0, Ll/go4;->x:J

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/go4;->e()Ll/mdg0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {p0}, Ll/ko4;->j()J

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    const-wide v5, 0x7fffffffffffffffL

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    invoke-virtual/range {v1 .. v6}, Ll/sdg0;->v(JLl/mdg0;J)V

    .line 45
    .line 46
    .line 47
    return-object v1

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/go4;->n:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Ll/go4;->o:Ljava/util/List;

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

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

.method public bridge synthetic l(Ll/rdg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/ko4;->l(Ll/rdg0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/myb;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    if-ge v4, v0, :cond_1

    .line 16
    .line 17
    iget-object v5, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    check-cast v5, Ll/go4$a;

    .line 24
    .line 25
    const/high16 v6, -0x80000000

    .line 26
    .line 27
    invoke-virtual {v5, v6}, Ll/go4$a;->g(I)Ll/myb;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    iget v5, v5, Ll/myb;->i:I

    .line 37
    .line 38
    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 48
    .line 49
    .line 50
    :goto_1
    if-ge v3, v0, :cond_4

    .line 51
    .line 52
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Ll/myb;

    .line 57
    .line 58
    if-eqz v5, :cond_3

    .line 59
    .line 60
    iget v6, v5, Ll/myb;->i:I

    .line 61
    .line 62
    if-eq v6, v2, :cond_2

    .line 63
    .line 64
    iget-object v5, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Ll/go4$a;

    .line 71
    .line 72
    invoke-virtual {v5, v2}, Ll/go4$a;->g(I)Ll/myb;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-static {v5}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    check-cast v5, Ll/myb;

    .line 81
    .line 82
    :cond_2
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    return-object v4
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public final w(B)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 2
    .line 3
    const/16 v1, 0x20

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/go4$a;->e(C)V

    .line 6
    .line 7
    .line 8
    and-int/lit8 v0, p1, 0x1

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    move v0, v1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    shr-int/2addr p1, v1

    .line 17
    and-int/lit8 p1, p1, 0x7

    .line 18
    .line 19
    iget-object p0, p0, Ll/go4;->m:Ll/go4$a;

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Ll/go4$a;->p(IZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final x(B)V
    .locals 4

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq p1, v0, :cond_5

    .line 5
    .line 6
    const/16 v0, 0x29

    .line 7
    .line 8
    const/4 v2, 0x3

    .line 9
    if-eq p1, v0, :cond_4

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    iget v1, p0, Ll/go4;->p:I

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v3, 0x21

    .line 21
    .line 22
    if-eq p1, v3, :cond_3

    .line 23
    .line 24
    packed-switch p1, :pswitch_data_1

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :pswitch_0
    invoke-virtual {p0}, Ll/go4;->r()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/go4;->n:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_1
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :pswitch_2
    if-ne v1, v0, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/go4;->m:Ll/go4$a;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/go4$a;->i()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Ll/go4;->m:Ll/go4$a;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/go4$a;->k()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :pswitch_3
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 59
    .line 60
    iput-object p1, p0, Ll/go4;->n:Ljava/util/List;

    .line 61
    .line 62
    if-eq v1, v0, :cond_2

    .line 63
    .line 64
    if-ne v1, v2, :cond_1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    :goto_0
    return-void

    .line 68
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/go4;->L()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    iget-object p0, p0, Ll/go4;->m:Ll/go4$a;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/go4$a;->f()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :pswitch_4
    invoke-virtual {p0, v0}, Ll/go4;->M(I)V

    .line 79
    .line 80
    .line 81
    const/4 p1, 0x4

    .line 82
    invoke-virtual {p0, p1}, Ll/go4;->N(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :pswitch_5
    invoke-virtual {p0, v0}, Ll/go4;->M(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v2}, Ll/go4;->N(I)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :pswitch_6
    invoke-virtual {p0, v0}, Ll/go4;->M(I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v1}, Ll/go4;->N(I)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    invoke-virtual {p0, v2}, Ll/go4;->M(I)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_5
    invoke-virtual {p0, v1}, Ll/go4;->M(I)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    nop

    .line 109
    :pswitch_data_0
    .packed-switch 0x25
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :pswitch_data_1
    .packed-switch 0x2c
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final y(BB)V
    .locals 4

    .line 1
    sget-object v0, Ll/go4;->y:[I

    .line 2
    .line 3
    and-int/lit8 p1, p1, 0x7

    .line 4
    .line 5
    aget p1, v0, p1

    .line 6
    .line 7
    and-int/lit8 v0, p2, 0x20

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    add-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 14
    .line 15
    invoke-static {v0}, Ll/go4$a;->b(Ll/go4$a;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-eq p1, v0, :cond_2

    .line 21
    .line 22
    iget v0, p0, Ll/go4;->p:I

    .line 23
    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/go4$a;->i()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    new-instance v0, Ll/go4$a;

    .line 35
    .line 36
    iget v2, p0, Ll/go4;->p:I

    .line 37
    .line 38
    iget v3, p0, Ll/go4;->q:I

    .line 39
    .line 40
    invoke-direct {v0, v2, v3}, Ll/go4$a;-><init>(II)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 44
    .line 45
    iget-object v2, p0, Ll/go4;->l:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/go4;->m:Ll/go4$a;

    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/go4$a;->c(Ll/go4$a;I)I

    .line 53
    .line 54
    .line 55
    :cond_2
    and-int/lit8 p1, p2, 0x10

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    const/16 v2, 0x10

    .line 59
    .line 60
    if-ne p1, v2, :cond_3

    .line 61
    .line 62
    move p1, v1

    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move p1, v0

    .line 65
    :goto_0
    and-int/lit8 v2, p2, 0x1

    .line 66
    .line 67
    if-ne v2, v1, :cond_4

    .line 68
    .line 69
    move v0, v1

    .line 70
    :cond_4
    shr-int/2addr p2, v1

    .line 71
    and-int/lit8 p2, p2, 0x7

    .line 72
    .line 73
    iget-object v1, p0, Ll/go4;->m:Ll/go4$a;

    .line 74
    .line 75
    if-eqz p1, :cond_5

    .line 76
    .line 77
    const/16 v2, 0x8

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_5
    move v2, p2

    .line 81
    :goto_1
    invoke-virtual {v1, v2, v0}, Ll/go4$a;->p(IZ)V

    .line 82
    .line 83
    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    iget-object p0, p0, Ll/go4;->m:Ll/go4$a;

    .line 87
    .line 88
    sget-object p1, Ll/go4;->z:[I

    .line 89
    .line 90
    aget p1, p1, p2

    .line 91
    .line 92
    invoke-static {p0, p1}, Ll/go4$a;->d(Ll/go4$a;I)I

    .line 93
    .line 94
    .line 95
    :cond_6
    return-void
.end method
