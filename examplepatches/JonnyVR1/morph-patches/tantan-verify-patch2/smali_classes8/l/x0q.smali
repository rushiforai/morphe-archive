.class public Ll/x0q;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field a:Ll/ixk;

.field b:Ll/ixk;

.field c:Ll/ixk;

.field d:Ll/ixk;

.field e:Ll/qsy;

.field f:I

.field g:I


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/x0q;->g:I

    .line 5
    .line 6
    iput p1, p0, Ll/x0q;->f:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Ll/gfj;->setFloatTexture(Z)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/ixk;

    .line 13
    .line 14
    iget p2, p0, Ll/x0q;->f:I

    .line 15
    .line 16
    iget v0, p0, Ll/x0q;->g:I

    .line 17
    .line 18
    invoke-direct {p1, p2, v0}, Ll/ixk;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/x0q;->a:Ll/ixk;

    .line 22
    .line 23
    new-instance p1, Ll/ixk;

    .line 24
    .line 25
    iget p2, p0, Ll/x0q;->f:I

    .line 26
    .line 27
    div-int/lit8 p2, p2, 0x2

    .line 28
    .line 29
    iget v0, p0, Ll/x0q;->g:I

    .line 30
    .line 31
    div-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    invoke-direct {p1, p2, v0}, Ll/ixk;-><init>(II)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/x0q;->b:Ll/ixk;

    .line 37
    .line 38
    new-instance p1, Ll/ixk;

    .line 39
    .line 40
    iget p2, p0, Ll/x0q;->f:I

    .line 41
    .line 42
    div-int/lit8 p2, p2, 0x4

    .line 43
    .line 44
    iget v0, p0, Ll/x0q;->g:I

    .line 45
    .line 46
    div-int/lit8 v0, v0, 0x4

    .line 47
    .line 48
    invoke-direct {p1, p2, v0}, Ll/ixk;-><init>(II)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/x0q;->c:Ll/ixk;

    .line 52
    .line 53
    new-instance p1, Ll/ixk;

    .line 54
    .line 55
    iget p2, p0, Ll/x0q;->f:I

    .line 56
    .line 57
    div-int/lit8 p2, p2, 0x8

    .line 58
    .line 59
    iget v0, p0, Ll/x0q;->g:I

    .line 60
    .line 61
    div-int/lit8 v0, v0, 0x8

    .line 62
    .line 63
    invoke-direct {p1, p2, v0}, Ll/ixk;-><init>(II)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ll/x0q;->d:Ll/ixk;

    .line 67
    .line 68
    new-instance p1, Ll/qsy;

    .line 69
    .line 70
    invoke-direct {p1}, Ll/qsy;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 74
    .line 75
    const/high16 p2, 0x3e800000    # 0.25f

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    const v1, 0x3e99999a    # 0.3f

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v1, v1, p2, v0}, Ll/qsy;->Q1(FFFF)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/x0q;->a:Ll/ixk;

    .line 85
    .line 86
    iget-object p2, p0, Ll/x0q;->b:Ll/ixk;

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/x0q;->b:Ll/ixk;

    .line 92
    .line 93
    iget-object p2, p0, Ll/x0q;->c:Ll/ixk;

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/x0q;->a:Ll/ixk;

    .line 99
    .line 100
    iget-object p2, p0, Ll/x0q;->d:Ll/ixk;

    .line 101
    .line 102
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/x0q;->a:Ll/ixk;

    .line 106
    .line 107
    iget-object p2, p0, Ll/x0q;->e:Ll/qsy;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/x0q;->b:Ll/ixk;

    .line 113
    .line 114
    iget-object p2, p0, Ll/x0q;->e:Ll/qsy;

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/x0q;->c:Ll/ixk;

    .line 120
    .line 121
    iget-object p2, p0, Ll/x0q;->e:Ll/qsy;

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/x0q;->d:Ll/ixk;

    .line 127
    .line 128
    iget-object p2, p0, Ll/x0q;->e:Ll/qsy;

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 134
    .line 135
    iget-object p2, p0, Ll/x0q;->a:Ll/ixk;

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 141
    .line 142
    iget-object p2, p0, Ll/x0q;->b:Ll/ixk;

    .line 143
    .line 144
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 148
    .line 149
    iget-object p2, p0, Ll/x0q;->c:Ll/ixk;

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 155
    .line 156
    iget-object p2, p0, Ll/x0q;->d:Ll/ixk;

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 162
    .line 163
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Ll/x0q;->a:Ll/ixk;

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Ll/x0q;->b:Ll/ixk;

    .line 172
    .line 173
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ll/x0q;->c:Ll/ixk;

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Ll/x0q;->d:Ll/ixk;

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/x0q;->e:Ll/qsy;

    .line 187
    .line 188
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method
