.class public Lcom/momo/mcamera/mask/CompatibleSegmentFilter;
.super Lcom/momo/mcamera/mask/SegmentFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/SegmentFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public processSegment(II)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz p1, :cond_6

    .line 4
    .line 5
    iget-object p2, p1, Ll/omw;->g:[B

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    iget p2, p1, Ll/omw;->c:I

    .line 12
    .line 13
    div-int/lit8 p2, p2, 0x5a

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz p2, :cond_3

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    if-ne p2, v2, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    if-eq p2, v1, :cond_2

    .line 24
    .line 25
    if-ne p2, v0, :cond_6

    .line 26
    .line 27
    :cond_2
    iget p2, p1, Ll/omw;->f:I

    .line 28
    .line 29
    iget v2, p1, Ll/omw;->e:I

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_3
    :goto_0
    iget p2, p1, Ll/omw;->e:I

    .line 33
    .line 34
    iget v2, p1, Ll/omw;->f:I

    .line 35
    .line 36
    :goto_1
    invoke-virtual {p1}, Ll/omw;->v()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    const/16 p1, 0x11

    .line 45
    .line 46
    invoke-virtual {v3, p1}, Ll/umw;->h(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_4
    const/4 p1, 0x4

    .line 51
    invoke-virtual {v3, p1}, Ll/umw;->h(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {p1, v3}, Ll/lnw;->E(Z)V

    .line 58
    .line 59
    .line 60
    :goto_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 63
    .line 64
    iget-object v3, v3, Ll/omw;->g:[B

    .line 65
    .line 66
    invoke-virtual {p1, v3}, Ll/umw;->g([B)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 70
    .line 71
    iget-object v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 72
    .line 73
    iget-object v3, v3, Ll/omw;->g:[B

    .line 74
    .line 75
    array-length v3, v3

    .line 76
    invoke-virtual {p1, v3}, Ll/umw;->f(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 80
    .line 81
    iget-object v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 82
    .line 83
    invoke-virtual {v3}, Ll/omw;->t()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    invoke-virtual {p1, v3}, Ll/umw;->m(I)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 91
    .line 92
    iget-object v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 93
    .line 94
    invoke-virtual {v3}, Ll/omw;->m()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {p1, v3}, Ll/umw;->j(I)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 104
    .line 105
    invoke-virtual {v3}, Ll/omw;->t()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {p1, v3}, Ll/umw;->l(I)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 113
    .line 114
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->isFrontCamera()Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-virtual {p1, v3}, Ll/lnw;->p(Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 122
    .line 123
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRotateDegree()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    invoke-virtual {p1, v3}, Ll/lnw;->A(I)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 131
    .line 132
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRestoreDegree()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-virtual {p1, v3}, Ll/lnw;->z(I)V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    iget-object p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvFrame:Ll/umw;

    .line 144
    .line 145
    iget-object v5, p0, Lcom/momo/mcamera/mask/SegmentFilter;->params:Ll/lnw;

    .line 146
    .line 147
    iget-object v6, p0, Lcom/momo/mcamera/mask/SegmentFilter;->mmcvInfo:Ll/omw;

    .line 148
    .line 149
    invoke-virtual {v6}, Ll/omw;->v()Z

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    xor-int/2addr v6, v1

    .line 154
    invoke-static {p1, v5, v6}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;Z)[B

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 159
    .line 160
    .line 161
    move-result-wide v5

    .line 162
    sub-long/2addr v5, v3

    .line 163
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v3, v5, v6}, Ll/u6y;->m0(J)V

    .line 168
    .line 169
    .line 170
    const v3, 0x84c3

    .line 171
    .line 172
    .line 173
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 174
    .line 175
    .line 176
    iget v3, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

    .line 177
    .line 178
    if-nez v3, :cond_5

    .line 179
    .line 180
    invoke-static {p1, p2, v2, v1}, Lcom/core/glcore/util/TextureHelper;->byteToLuminanceTexture([BIII)I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    iput p1, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaTexture:I

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_5
    invoke-static {v3, p1, p2, v2}, Lcom/core/glcore/util/TextureHelper;->byteToLuminanceTextureBytextureId(I[BII)I

    .line 188
    .line 189
    .line 190
    :goto_3
    iget p0, p0, Lcom/momo/mcamera/mask/SegmentFilter;->alphaHandler:I

    .line 191
    .line 192
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 193
    .line 194
    .line 195
    :cond_6
    :goto_4
    return-void
.end method
