.class public Ll/q6b0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ll/p6b0;Landroid/view/View;)V
    .locals 5

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lv/VImage;

    .line 9
    .line 10
    iput-object v1, p0, Ll/p6b0;->j:Lv/VImage;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VImage;

    .line 18
    .line 19
    iput-object v2, p0, Ll/p6b0;->k:Lv/VImage;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lv/VText;

    .line 27
    .line 28
    iput-object v3, p0, Ll/p6b0;->l:Lv/VText;

    .line 29
    .line 30
    const/4 v3, 0x3

    .line 31
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lv/VText;

    .line 36
    .line 37
    iput-object v3, p0, Ll/p6b0;->m:Lv/VText;

    .line 38
    .line 39
    const/4 v3, 0x4

    .line 40
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Lv/VText;

    .line 45
    .line 46
    iput-object v3, p0, Ll/p6b0;->n:Lv/VText;

    .line 47
    .line 48
    const/4 v3, 0x5

    .line 49
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lv/VText;

    .line 54
    .line 55
    iput-object v3, p0, Ll/p6b0;->o:Lv/VText;

    .line 56
    .line 57
    const/4 v3, 0x6

    .line 58
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lv/VText;

    .line 63
    .line 64
    iput-object v3, p0, Ll/p6b0;->p:Lv/VText;

    .line 65
    .line 66
    const/4 v3, 0x7

    .line 67
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, Landroid/widget/LinearLayout;

    .line 72
    .line 73
    iput-object v4, p0, Ll/p6b0;->q:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Landroid/view/ViewGroup;

    .line 80
    .line 81
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Lv/VCheckBox;

    .line 86
    .line 87
    iput-object v4, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 88
    .line 89
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Landroid/view/ViewGroup;

    .line 94
    .line 95
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Lv/VText;

    .line 100
    .line 101
    iput-object v3, p0, Ll/p6b0;->s:Lv/VText;

    .line 102
    .line 103
    const/16 v3, 0x8

    .line 104
    .line 105
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 110
    .line 111
    iput-object v4, p0, Ll/p6b0;->t:Landroid/widget/RelativeLayout;

    .line 112
    .line 113
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Landroid/view/ViewGroup;

    .line 118
    .line 119
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    check-cast v4, Landroid/widget/TextView;

    .line 124
    .line 125
    iput-object v4, p0, Ll/p6b0;->u:Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Landroid/view/ViewGroup;

    .line 132
    .line 133
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    check-cast v2, Lv/VText;

    .line 138
    .line 139
    iput-object v2, p0, Ll/p6b0;->v:Lv/VText;

    .line 140
    .line 141
    const/16 v2, 0x9

    .line 142
    .line 143
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    iput-object v2, p0, Ll/p6b0;->w:Landroid/view/View;

    .line 148
    .line 149
    const/16 v2, 0xa

    .line 150
    .line 151
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Lv/VText;

    .line 156
    .line 157
    iput-object v2, p0, Ll/p6b0;->x:Lv/VText;

    .line 158
    .line 159
    const/16 v2, 0xb

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Landroid/widget/LinearLayout;

    .line 166
    .line 167
    iput-object v3, p0, Ll/p6b0;->y:Landroid/widget/LinearLayout;

    .line 168
    .line 169
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    check-cast v3, Landroid/view/ViewGroup;

    .line 174
    .line 175
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lv/VText;

    .line 180
    .line 181
    iput-object v0, p0, Ll/p6b0;->z:Lv/VText;

    .line 182
    .line 183
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Landroid/view/ViewGroup;

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Lv/VText;

    .line 194
    .line 195
    iput-object v0, p0, Ll/p6b0;->A:Lv/VText;

    .line 196
    .line 197
    const/16 v0, 0xc

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Lv/VText;

    .line 204
    .line 205
    iput-object v0, p0, Ll/p6b0;->B:Lv/VText;

    .line 206
    .line 207
    const/16 v0, 0xd

    .line 208
    .line 209
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    check-cast p1, Lv/VText;

    .line 214
    .line 215
    iput-object p1, p0, Ll/p6b0;->C:Lv/VText;

    .line 216
    .line 217
    return-void
.end method

.method public static b(Ll/p6b0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/rec0;->Y0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/q6b0;->a(Ll/p6b0;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
