.class public final Ll/vfr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I


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


# virtual methods
.method public final a(I)Z
    .locals 9

    .line 1
    invoke-static {p1}, Ll/wfr0;->d(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    ushr-int/lit8 v0, p1, 0x13

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    and-int/2addr v0, v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eq v0, v2, :cond_9

    .line 15
    .line 16
    ushr-int/lit8 v3, p1, 0x11

    .line 17
    .line 18
    and-int/2addr v3, v1

    .line 19
    if-eqz v3, :cond_9

    .line 20
    .line 21
    ushr-int/lit8 v4, p1, 0xc

    .line 22
    .line 23
    const/16 v5, 0xf

    .line 24
    .line 25
    and-int/2addr v4, v5

    .line 26
    if-eqz v4, :cond_9

    .line 27
    .line 28
    if-eq v4, v5, :cond_9

    .line 29
    .line 30
    ushr-int/lit8 v5, p1, 0xa

    .line 31
    .line 32
    and-int/2addr v5, v1

    .line 33
    if-eq v5, v1, :cond_9

    .line 34
    .line 35
    add-int/lit8 v4, v4, -0x1

    .line 36
    .line 37
    iput v0, p0, Ll/vfr0;->a:I

    .line 38
    .line 39
    rsub-int/lit8 v6, v3, 0x3

    .line 40
    .line 41
    invoke-static {}, Ll/wfr0;->k()[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    aget-object v6, v7, v6

    .line 46
    .line 47
    iput-object v6, p0, Ll/vfr0;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {}, Ll/wfr0;->j()[I

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    aget v5, v6, v5

    .line 54
    .line 55
    iput v5, p0, Ll/vfr0;->d:I

    .line 56
    .line 57
    const/4 v6, 0x2

    .line 58
    if-ne v0, v6, :cond_1

    .line 59
    .line 60
    div-int/lit8 v5, v5, 0x2

    .line 61
    .line 62
    iput v5, p0, Ll/vfr0;->d:I

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    if-nez v0, :cond_2

    .line 66
    .line 67
    div-int/lit8 v5, v5, 0x4

    .line 68
    .line 69
    iput v5, p0, Ll/vfr0;->d:I

    .line 70
    .line 71
    :cond_2
    :goto_0
    ushr-int/lit8 v7, p1, 0x9

    .line 72
    .line 73
    and-int/2addr v7, v2

    .line 74
    invoke-static {v0, v3}, Ll/wfr0;->a(II)I

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    iput v8, p0, Ll/vfr0;->g:I

    .line 79
    .line 80
    if-ne v3, v1, :cond_4

    .line 81
    .line 82
    if-ne v0, v1, :cond_3

    .line 83
    .line 84
    invoke-static {}, Ll/wfr0;->e()[I

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    aget v0, v0, v4

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    invoke-static {}, Ll/wfr0;->i()[I

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    aget v0, v0, v4

    .line 96
    .line 97
    :goto_1
    iput v0, p0, Ll/vfr0;->f:I

    .line 98
    .line 99
    mul-int/lit8 v0, v0, 0xc

    .line 100
    .line 101
    div-int/2addr v0, v5

    .line 102
    add-int/2addr v0, v7

    .line 103
    mul-int/lit8 v0, v0, 0x4

    .line 104
    .line 105
    iput v0, p0, Ll/vfr0;->c:I

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_4
    const/16 v8, 0x90

    .line 109
    .line 110
    if-ne v0, v1, :cond_6

    .line 111
    .line 112
    if-ne v3, v6, :cond_5

    .line 113
    .line 114
    invoke-static {}, Ll/wfr0;->f()[I

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    aget v0, v0, v4

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_5
    invoke-static {}, Ll/wfr0;->g()[I

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    aget v0, v0, v4

    .line 126
    .line 127
    :goto_2
    iput v0, p0, Ll/vfr0;->f:I

    .line 128
    .line 129
    mul-int/2addr v0, v8

    .line 130
    div-int/2addr v0, v5

    .line 131
    add-int/2addr v0, v7

    .line 132
    iput v0, p0, Ll/vfr0;->c:I

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_6
    invoke-static {}, Ll/wfr0;->h()[I

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    aget v0, v0, v4

    .line 140
    .line 141
    iput v0, p0, Ll/vfr0;->f:I

    .line 142
    .line 143
    if-ne v3, v2, :cond_7

    .line 144
    .line 145
    const/16 v8, 0x48

    .line 146
    .line 147
    :cond_7
    mul-int/2addr v8, v0

    .line 148
    div-int/2addr v8, v5

    .line 149
    add-int/2addr v8, v7

    .line 150
    iput v8, p0, Ll/vfr0;->c:I

    .line 151
    .line 152
    :goto_3
    shr-int/lit8 p1, p1, 0x6

    .line 153
    .line 154
    and-int/2addr p1, v1

    .line 155
    if-ne p1, v1, :cond_8

    .line 156
    .line 157
    move v6, v2

    .line 158
    :cond_8
    iput v6, p0, Ll/vfr0;->e:I

    .line 159
    .line 160
    return v2

    .line 161
    :cond_9
    :goto_4
    const/4 p0, 0x0

    .line 162
    return p0
.end method
