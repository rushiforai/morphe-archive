.class public Ll/g2g0;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field a:I

.field b:I

.field c:Ll/kce;

.field d:Ll/kce;

.field e:Ll/kce;


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/g2g0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/g2g0;->b:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Ll/gfj;->setFloatTexture(Z)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/kce;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/kce;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/g2g0;->c:Ll/kce;

    .line 18
    .line 19
    new-instance p1, Ll/kce;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/kce;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/g2g0;->d:Ll/kce;

    .line 25
    .line 26
    new-instance p1, Ll/kce;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/kce;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 32
    .line 33
    iget-object p1, p0, Ll/g2g0;->c:Ll/kce;

    .line 34
    .line 35
    iget-object p2, p0, Ll/g2g0;->d:Ll/kce;

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/g2g0;->d:Ll/kce;

    .line 41
    .line 42
    iget-object p2, p0, Ll/g2g0;->e:Ll/kce;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/g2g0;->c:Ll/kce;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/g2g0;->d:Ll/kce;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public Q1(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/g2g0;->c:Ll/kce;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    iget v1, p0, Ll/g2g0;->a:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float v1, p1, v1

    .line 8
    .line 9
    int-to-float p2, p2

    .line 10
    iget v2, p0, Ll/g2g0;->b:I

    .line 11
    .line 12
    int-to-float v2, v2

    .line 13
    div-float v2, p2, v2

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/kce;->U1(FF)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/g2g0;->c:Ll/kce;

    .line 19
    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/kce;->V1(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/g2g0;->c:Ll/kce;

    .line 26
    .line 27
    const/high16 v1, 0x3ec00000    # 0.375f

    .line 28
    .line 29
    const v2, 0x3eb66666

    .line 30
    .line 31
    .line 32
    const v3, 0x3eaccccc    # 0.33749998f

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3, v1}, Ll/kce;->Q1(FFFF)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/g2g0;->c:Ll/kce;

    .line 39
    .line 40
    const v2, 0x3e25e354    # 0.162f

    .line 41
    .line 42
    .line 43
    const v4, 0x3e666666    # 0.225f

    .line 44
    .line 45
    .line 46
    const v5, 0x3e8a3d71    # 0.27f

    .line 47
    .line 48
    .line 49
    const v6, 0x3e3851ec    # 0.18f

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v5, v6, v2, v4}, Ll/kce;->R1(FFFF)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/g2g0;->c:Ll/kce;

    .line 56
    .line 57
    const v2, 0x3e9b851f    # 0.30375f

    .line 58
    .line 59
    .line 60
    const v4, 0x3e8bedfa    # 0.2733f

    .line 61
    .line 62
    .line 63
    const v5, 0x3e7be76d    # 0.246f

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v4, v5, v4, v2}, Ll/kce;->S1(FFFF)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/g2g0;->c:Ll/kce;

    .line 70
    .line 71
    const v2, 0x3e62b6ae    # 0.2214f

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v5, v5, v2, v4}, Ll/kce;->T1(FFFF)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/g2g0;->d:Ll/kce;

    .line 78
    .line 79
    iget v2, p0, Ll/g2g0;->a:I

    .line 80
    .line 81
    int-to-float v2, v2

    .line 82
    div-float v2, p1, v2

    .line 83
    .line 84
    iget v4, p0, Ll/g2g0;->b:I

    .line 85
    .line 86
    int-to-float v4, v4

    .line 87
    div-float v4, p2, v4

    .line 88
    .line 89
    invoke-virtual {v0, v2, v4}, Ll/kce;->U1(FF)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/g2g0;->d:Ll/kce;

    .line 93
    .line 94
    const/high16 v2, 0x40800000    # 4.0f

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Ll/kce;->V1(F)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/g2g0;->d:Ll/kce;

    .line 100
    .line 101
    const v2, 0x3e99999a    # 0.3f

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1, v3, v2, v1}, Ll/kce;->Q1(FFFF)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/g2g0;->d:Ll/kce;

    .line 108
    .line 109
    const v2, 0x3e16872b    # 0.147f

    .line 110
    .line 111
    .line 112
    const v3, 0x3dfbe76d    # 0.123f

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v5, v2, v3, v5}, Ll/kce;->R1(FFFF)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/g2g0;->d:Ll/kce;

    .line 119
    .line 120
    const v2, 0x3d46540e    # 0.048420005f

    .line 121
    .line 122
    .line 123
    const v3, 0x3e25460b    # 0.1614f

    .line 124
    .line 125
    .line 126
    const v4, 0x3da54de8    # 0.080715f

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v4, v4, v2, v3}, Ll/kce;->S1(FFFF)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/g2g0;->d:Ll/kce;

    .line 133
    .line 134
    const v2, 0x3cd04817    # 0.025425f

    .line 135
    .line 136
    .line 137
    const v3, 0x3dd8e9f7

    .line 138
    .line 139
    .line 140
    const v4, 0x3d822142    # 0.06354f

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v4, v2, v4, v3}, Ll/kce;->T1(FFFF)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/g2g0;->e:Ll/kce;

    .line 147
    .line 148
    iget v2, p0, Ll/g2g0;->a:I

    .line 149
    .line 150
    int-to-float v2, v2

    .line 151
    div-float/2addr p1, v2

    .line 152
    iget v2, p0, Ll/g2g0;->b:I

    .line 153
    .line 154
    int-to-float v2, v2

    .line 155
    div-float/2addr p2, v2

    .line 156
    invoke-virtual {v0, p1, p2}, Ll/kce;->U1(FF)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 160
    .line 161
    const/high16 p2, 0x41800000    # 16.0f

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Ll/kce;->V1(F)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 167
    .line 168
    invoke-virtual {p1, v1, v1, v1, v1}, Ll/kce;->Q1(FFFF)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 172
    .line 173
    const p2, 0x3d8e5365    # 0.069495f

    .line 174
    .line 175
    .line 176
    const v0, 0x3d2abde4    # 0.041685f

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, p2, v0, v0, p2}, Ll/kce;->R1(FFFF)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/g2g0;->e:Ll/kce;

    .line 183
    .line 184
    const p2, 0x3b97e133    # 0.004635f

    .line 185
    .line 186
    .line 187
    const v0, 0x3c52f5dc    # 0.012876f

    .line 188
    .line 189
    .line 190
    const v1, 0x3bfd2e94

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1, v1, v1, p2, v0}, Ll/kce;->S1(FFFF)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p0, Ll/g2g0;->e:Ll/kce;

    .line 197
    .line 198
    const p1, 0x3a615012    # 8.595E-4f

    .line 199
    .line 200
    .line 201
    const p2, 0x3b1c66d4

    .line 202
    .line 203
    .line 204
    const v0, 0x3abb9064    # 0.001431f

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, v0, p1, v0, p2}, Ll/kce;->T1(FFFF)V

    .line 208
    .line 209
    .line 210
    return-void
.end method
