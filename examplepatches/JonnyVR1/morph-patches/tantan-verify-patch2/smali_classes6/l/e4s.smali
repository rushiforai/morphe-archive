.class public Ll/e4s;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/ctl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/uxr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxr;->J(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Ll/hk4;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hk4;",
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;)",
            "Ljava/util/List<",
            "Ll/uxr<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/r6s;

    .line 21
    .line 22
    invoke-static {p0, v1}, Ll/e4s;->c(Ll/hk4;Ll/r6s;)Ll/uxr;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    new-instance v2, Ll/d4s;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ll/d4s;-><init>(Ll/uxr;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object v0
.end method

.method public static c(Ll/hk4;Ll/r6s;)Ll/uxr;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hk4;",
            "Ll/r6s;",
            ")",
            "Ll/uxr<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/r6s;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_8

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_7

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_6

    .line 13
    .line 14
    const/4 v1, 0x4

    .line 15
    if-eq v0, v1, :cond_5

    .line 16
    .line 17
    const/4 v1, 0x5

    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/16 v1, 0xbb9

    .line 21
    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/16 v1, 0xbba

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const/16 v1, 0xbbc

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    packed-switch v0, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    packed-switch v0, :pswitch_data_1

    .line 36
    .line 37
    .line 38
    packed-switch v0, :pswitch_data_2

    .line 39
    .line 40
    .line 41
    sget-object v0, Ll/e4s;->a:Ll/ctl;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-interface {v0, p0, p1}, Ll/ctl;->a(Ll/hk4;Ll/r6s;)Ll/uxr;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return-object p0

    .line 52
    :pswitch_0
    invoke-virtual {p1}, Ll/r6s;->p()Ll/byu;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p0, p1}, Ll/fyu;->P(Ll/hk4;Ll/byu;)Ll/fyu;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :pswitch_1
    invoke-virtual {p1}, Ll/r6s;->p()Ll/byu;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p0, p1}, Ll/ayu;->P(Ll/hk4;Ll/byu;)Ll/ayu;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :pswitch_2
    invoke-virtual {p1}, Ll/r6s;->p()Ll/byu;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p0, p1}, Ll/zxu;->P(Ll/hk4;Ll/byu;)Ll/zxu;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :pswitch_3
    invoke-virtual {p1}, Ll/r6s;->m()Ll/efu;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p0, p1}, Ll/dfu;->O(Ll/hk4;Ll/efu;)Ll/dfu;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :pswitch_4
    invoke-virtual {p1}, Ll/r6s;->c()Ll/o3s;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p0, p1}, Ll/i3s;->O(Ll/hk4;Ll/o3s;)Ll/i3s;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :pswitch_5
    invoke-virtual {p1}, Ll/r6s;->g()Ll/ggs;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {p0, p1}, Ll/wit;->O(Ll/hk4;Ll/a4s;)Ll/wit;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :pswitch_6
    invoke-virtual {p1}, Ll/r6s;->f()Ll/zfs;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p0, p1}, Ll/yfs;->O(Ll/hk4;Ll/zfs;)Ll/yfs;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :pswitch_7
    invoke-virtual {p1}, Ll/r6s;->h()Ll/xys;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p0, p1}, Ll/r6v;->O(Ll/hk4;Ll/xys;)Ll/uxr;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :pswitch_8
    invoke-virtual {p1}, Ll/r6s;->e()Ll/mes;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {p0, p1}, Ll/h6v;->O(Ll/hk4;Ll/a4s;)Ll/h6v;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :pswitch_9
    invoke-virtual {p1}, Ll/r6s;->n()Ll/ubt;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-static {p0, p1}, Ll/tbt;->O(Ll/hk4;Ll/ubt;)Ll/uxr;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :pswitch_a
    invoke-virtual {p1}, Ll/r6s;->h()Ll/xys;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {p0, p1}, Ll/wys;->O(Ll/hk4;Ll/xys;)Ll/uxr;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0

    .line 151
    :pswitch_b
    invoke-virtual {p1}, Ll/r6s;->a()Ll/pwr;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-static {p0, p1}, Ll/owr;->O(Ll/hk4;Ll/a4s;)Ll/owr;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    return-object p0

    .line 160
    :cond_1
    invoke-virtual {p1}, Ll/r6s;->j()Ll/vxp;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-static {p0, p1}, Ll/gto0;->O(Ll/hk4;Ll/vxp;)Ll/gto0;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0

    .line 169
    :cond_2
    invoke-virtual {p1}, Ll/r6s;->i()Ll/bwp;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-static {p0, p1}, Ll/dvo0;->O(Ll/hk4;Ll/bwp;)Ll/dvo0;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0

    .line 178
    :cond_3
    invoke-virtual {p1}, Ll/r6s;->i()Ll/bwp;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-static {p0, p1}, Ll/bvo0;->O(Ll/hk4;Ll/bwp;)Ll/bvo0;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0

    .line 187
    :cond_4
    invoke-virtual {p1}, Ll/r6s;->k()Ll/rbt;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-static {p0, p1}, Ll/a9s;->O(Ll/hk4;Ll/a4s;)Ll/a9s;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    return-object p0

    .line 196
    :cond_5
    invoke-virtual {p1}, Ll/r6s;->k()Ll/rbt;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-static {p0, p1}, Ll/cfu;->O(Ll/hk4;Ll/a4s;)Ll/cfu;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    return-object p0

    .line 205
    :cond_6
    invoke-virtual {p1}, Ll/r6s;->l()Ll/ceu;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-static {p0, p1}, Ll/beu;->O(Ll/hk4;Ll/a4s;)Ll/beu;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0

    .line 214
    :cond_7
    invoke-virtual {p1}, Ll/r6s;->e()Ll/mes;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-static {p0, p1}, Ll/les;->O(Ll/hk4;Ll/a4s;)Ll/les;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    return-object p0

    .line 223
    :cond_8
    invoke-virtual {p1}, Ll/r6s;->b()Ll/xwr;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-static {p0, p1}, Ll/wwr;->O(Ll/hk4;Ll/xwr;)Ll/wwr;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    return-object p0

    .line 232
    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x3e9
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Ll/ctl;)V
    .locals 0

    .line 1
    sput-object p0, Ll/e4s;->a:Ll/ctl;

    .line 2
    .line 3
    return-void
.end method
