.class public Ll/h2g0;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field a:I

.field b:I

.field c:Ll/qv40;

.field d:Ll/g2g0;

.field e:Ll/g2g0;

.field f:Ll/g2g0;

.field g:Ll/g2g0;

.field i:Ll/nc00;


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/h2g0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/h2g0;->b:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/gfj;->setFloatTexture(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/qv40;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/qv40;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/h2g0;->c:Ll/qv40;

    .line 18
    .line 19
    new-instance v1, Ll/g2g0;

    .line 20
    .line 21
    invoke-direct {v1, p1, p2}, Ll/g2g0;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ll/h2g0;->d:Ll/g2g0;

    .line 25
    .line 26
    new-instance v1, Ll/g2g0;

    .line 27
    .line 28
    invoke-direct {v1, p1, p2}, Ll/g2g0;-><init>(II)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/h2g0;->e:Ll/g2g0;

    .line 32
    .line 33
    new-instance v1, Ll/g2g0;

    .line 34
    .line 35
    invoke-direct {v1, p1, p2}, Ll/g2g0;-><init>(II)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Ll/h2g0;->f:Ll/g2g0;

    .line 39
    .line 40
    new-instance v1, Ll/g2g0;

    .line 41
    .line 42
    invoke-direct {v1, p1, p2}, Ll/g2g0;-><init>(II)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Ll/h2g0;->g:Ll/g2g0;

    .line 46
    .line 47
    new-instance p1, Ll/nc00;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/nc00;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 53
    .line 54
    iget-object p1, p0, Ll/h2g0;->d:Ll/g2g0;

    .line 55
    .line 56
    const/4 p2, -0x1

    .line 57
    invoke-virtual {p1, p2, p2}, Ll/g2g0;->Q1(II)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/h2g0;->e:Ll/g2g0;

    .line 61
    .line 62
    invoke-virtual {p1, v0, p2}, Ll/g2g0;->Q1(II)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/h2g0;->f:Ll/g2g0;

    .line 66
    .line 67
    invoke-virtual {p1, p2, v0}, Ll/g2g0;->Q1(II)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/h2g0;->g:Ll/g2g0;

    .line 71
    .line 72
    invoke-virtual {p1, v0, v0}, Ll/g2g0;->Q1(II)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/h2g0;->c:Ll/qv40;

    .line 76
    .line 77
    iget-object p2, p0, Ll/h2g0;->d:Ll/g2g0;

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/h2g0;->c:Ll/qv40;

    .line 83
    .line 84
    iget-object p2, p0, Ll/h2g0;->e:Ll/g2g0;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/h2g0;->c:Ll/qv40;

    .line 90
    .line 91
    iget-object p2, p0, Ll/h2g0;->f:Ll/g2g0;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/h2g0;->c:Ll/qv40;

    .line 97
    .line 98
    iget-object p2, p0, Ll/h2g0;->g:Ll/g2g0;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/h2g0;->d:Ll/g2g0;

    .line 104
    .line 105
    iget-object p2, p0, Ll/h2g0;->i:Ll/nc00;

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/h2g0;->e:Ll/g2g0;

    .line 111
    .line 112
    iget-object p2, p0, Ll/h2g0;->i:Ll/nc00;

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/h2g0;->f:Ll/g2g0;

    .line 118
    .line 119
    iget-object p2, p0, Ll/h2g0;->i:Ll/nc00;

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/h2g0;->g:Ll/g2g0;

    .line 125
    .line 126
    iget-object p2, p0, Ll/h2g0;->i:Ll/nc00;

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 132
    .line 133
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 137
    .line 138
    iget-object p2, p0, Ll/h2g0;->d:Ll/g2g0;

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 144
    .line 145
    iget-object p2, p0, Ll/h2g0;->e:Ll/g2g0;

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 151
    .line 152
    iget-object p2, p0, Ll/h2g0;->f:Ll/g2g0;

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 158
    .line 159
    iget-object p2, p0, Ll/h2g0;->g:Ll/g2g0;

    .line 160
    .line 161
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/h2g0;->c:Ll/qv40;

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ll/h2g0;->d:Ll/g2g0;

    .line 170
    .line 171
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Ll/h2g0;->e:Ll/g2g0;

    .line 175
    .line 176
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ll/h2g0;->f:Ll/g2g0;

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Ll/h2g0;->g:Ll/g2g0;

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/h2g0;->i:Ll/nc00;

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 192
    .line 193
    .line 194
    return-void
.end method
