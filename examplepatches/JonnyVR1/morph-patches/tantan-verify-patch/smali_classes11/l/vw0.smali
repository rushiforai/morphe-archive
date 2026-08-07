.class public final Ll/vw0;
.super Ll/gpf0;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gpf0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Ll/hg60;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 14
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/hg60;->r(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/hg60;->h(I)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p0}, Ll/hg60;->d()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    add-int/2addr v2, v1

    .line 15
    const/4 v1, 0x4

    .line 16
    sub-int/2addr v2, v1

    .line 17
    const/16 v3, 0x2c

    .line 18
    .line 19
    invoke-virtual {p0, v3}, Ll/hg60;->r(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/hg60;->h(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {p0, v3}, Ll/hg60;->s(I)V

    .line 27
    .line 28
    .line 29
    const/16 v3, 0x10

    .line 30
    .line 31
    invoke-virtual {p0, v3}, Ll/hg60;->r(I)V

    .line 32
    .line 33
    .line 34
    new-instance v4, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/hg60;->d()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    const/4 v6, 0x0

    .line 44
    if-ge v5, v2, :cond_5

    .line 45
    .line 46
    const/16 v5, 0x30

    .line 47
    .line 48
    invoke-virtual {p0, v5}, Ll/hg60;->r(I)V

    .line 49
    .line 50
    .line 51
    const/16 v5, 0x8

    .line 52
    .line 53
    invoke-virtual {p0, v5}, Ll/hg60;->h(I)I

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    invoke-virtual {p0, v1}, Ll/hg60;->r(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/hg60;->h(I)I

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    invoke-virtual {p0}, Ll/hg60;->d()I

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    add-int/2addr v9, v8

    .line 69
    move-object v8, v6

    .line 70
    :goto_1
    invoke-virtual {p0}, Ll/hg60;->d()I

    .line 71
    .line 72
    .line 73
    move-result v10

    .line 74
    if-ge v10, v9, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0, v5}, Ll/hg60;->h(I)I

    .line 77
    .line 78
    .line 79
    move-result v10

    .line 80
    invoke-virtual {p0, v5}, Ll/hg60;->h(I)I

    .line 81
    .line 82
    .line 83
    move-result v11

    .line 84
    invoke-virtual {p0}, Ll/hg60;->d()I

    .line 85
    .line 86
    .line 87
    move-result v12

    .line 88
    add-int/2addr v12, v11

    .line 89
    const/4 v13, 0x2

    .line 90
    if-ne v10, v13, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0, v3}, Ll/hg60;->h(I)I

    .line 93
    .line 94
    .line 95
    move-result v10

    .line 96
    invoke-virtual {p0, v5}, Ll/hg60;->r(I)V

    .line 97
    .line 98
    .line 99
    const/4 v11, 0x3

    .line 100
    if-ne v10, v11, :cond_3

    .line 101
    .line 102
    :cond_1
    invoke-virtual {p0}, Ll/hg60;->d()I

    .line 103
    .line 104
    .line 105
    move-result v10

    .line 106
    if-ge v10, v12, :cond_3

    .line 107
    .line 108
    invoke-virtual {p0, v5}, Ll/hg60;->h(I)I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    sget-object v10, Ll/et4;->a:Ljava/nio/charset/Charset;

    .line 113
    .line 114
    invoke-virtual {p0, v6, v10}, Ll/hg60;->l(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-virtual {p0, v5}, Ll/hg60;->h(I)I

    .line 119
    .line 120
    .line 121
    move-result v10

    .line 122
    const/4 v11, 0x0

    .line 123
    :goto_2
    if-ge v11, v10, :cond_1

    .line 124
    .line 125
    invoke-virtual {p0, v5}, Ll/hg60;->h(I)I

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    invoke-virtual {p0, v13}, Ll/hg60;->s(I)V

    .line 130
    .line 131
    .line 132
    add-int/lit8 v11, v11, 0x1

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_2
    const/16 v13, 0x15

    .line 136
    .line 137
    if-ne v10, v13, :cond_3

    .line 138
    .line 139
    sget-object v8, Ll/et4;->a:Ljava/nio/charset/Charset;

    .line 140
    .line 141
    invoke-virtual {p0, v11, v8}, Ll/hg60;->l(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    :cond_3
    mul-int/lit8 v12, v12, 0x8

    .line 146
    .line 147
    invoke-virtual {p0, v12}, Ll/hg60;->p(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_4
    mul-int/lit8 v9, v9, 0x8

    .line 152
    .line 153
    invoke-virtual {p0, v9}, Ll/hg60;->p(I)V

    .line 154
    .line 155
    .line 156
    if-eqz v6, :cond_0

    .line 157
    .line 158
    if-eqz v8, :cond_0

    .line 159
    .line 160
    new-instance v5, Lcom/google/android/exoplayer2/metadata/dvbsi/AppInfoTable;

    .line 161
    .line 162
    invoke-virtual {v6, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    invoke-direct {v5, v7, v6}, Lcom/google/android/exoplayer2/metadata/dvbsi/AppInfoTable;-><init>(ILjava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-eqz p0, :cond_6

    .line 179
    .line 180
    return-object v6

    .line 181
    :cond_6
    new-instance p0, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 182
    .line 183
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>(Ljava/util/List;)V

    .line 184
    .line 185
    .line 186
    return-object p0
.end method


# virtual methods
.method public b(Ll/ba00;Ljava/nio/ByteBuffer;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0x74

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/hg60;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    invoke-direct {p0, p1, p2}, Ll/hg60;-><init>([BI)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Ll/vw0;->c(Ll/hg60;)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method
