.class public final Lcom/p1/mobile/putong/data/Picture$ImageUri;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Picture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ImageUri"
.end annotation


# instance fields
.field public base:Ljava/lang/String;

.field public fileType:Ljava/lang/String;

.field public formatType:I

.field public formatWidth:I

.field public isLocal:Z

.field public final orignalDimen:Lcom/p1/mobile/putong/data/Dimension;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 9
    .line 10
    iput p5, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 11
    .line 12
    iput p4, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public checkUrlBeanAvailable()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public copy(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->copy(II)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method public copy(II)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v6, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 10
    .line 11
    move v5, p1

    .line 12
    move v4, p2

    .line 13
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public copy(IILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 7

    .line 17
    new-instance v0, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    iget-boolean v6, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    move v5, p1

    move v4, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    :cond_2
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    :cond_3
    iget v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 41
    .line 42
    iget v2, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 43
    .line 44
    if-ne v0, v2, :cond_4

    .line 45
    .line 46
    iget v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 47
    .line 48
    iget v2, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 49
    .line 50
    if-ne v0, v2, :cond_4

    .line 51
    .line 52
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 53
    .line 54
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 55
    .line 56
    if-ne p0, p1, :cond_4

    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_4
    return v1
.end method

.method public formatted()Ljava/lang/String;
    .locals 1

    const/4 v0, -0x1

    .line 231
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public formatted(I)Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 5
    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ".webp"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 15
    .line 16
    const-string v3, ".gif"

    .line 17
    .line 18
    const-string v4, ".png"

    .line 19
    .line 20
    const-string v5, ".jpg"

    .line 21
    .line 22
    if-eqz v0, :cond_5

    .line 23
    .line 24
    invoke-virtual {v2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    goto :goto_3

    .line 74
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    add-int/lit8 v2, v2, -0x4

    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    goto :goto_3

    .line 95
    :cond_5
    invoke-virtual {v2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_7

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_7

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    goto :goto_3

    .line 144
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 145
    .line 146
    :goto_3
    iget p0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 147
    .line 148
    const/4 v1, 0x2

    .line 149
    if-ne p0, v1, :cond_8

    .line 150
    .line 151
    new-instance p0, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v0, "?format="

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v0, "x"

    .line 168
    .line 169
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0

    .line 180
    :cond_8
    const/4 v1, 0x1

    .line 181
    if-ne p0, v1, :cond_9

    .line 182
    .line 183
    new-instance p0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v0, "?format=max_"

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string p1, "xX"

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    return-object p0

    .line 209
    :cond_9
    const/4 p1, 0x3

    .line 210
    if-ne p0, p1, :cond_a

    .line 211
    .line 212
    new-instance p0, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string p1, "?format=blur"

    .line 221
    .line 222
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    return-object p0

    .line 230
    :cond_a
    return-object v0
.end method
