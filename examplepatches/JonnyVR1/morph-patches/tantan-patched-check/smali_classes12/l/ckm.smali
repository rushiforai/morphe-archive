.class public Ll/ckm;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ckm$a;
    }
.end annotation


# instance fields
.field a:Ll/ckm$a;

.field private b:[I


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x18

    .line 5
    .line 6
    new-array p1, p1, [I

    .line 7
    .line 8
    fill-array-data p1, :array_0

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ckm;->b:[I

    .line 12
    .line 13
    return-void

    .line 14
    nop

    .line 15
    :array_0
    .array-data 4
        0x1
        0x2
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0x10
        0x11
        0x12
        0x13
        0x15
        0x16
        0x17
        0x18
        0x19
        0x1a
        0x1b
        0x1c
        0x1d
        0x1f
        0x20
        0x22
    .end array-data
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ckm;->b:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_0

    .line 6
    .line 7
    aget v3, v0, v2

    .line 8
    .line 9
    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public b(Ll/ckm$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 2
    .line 3
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :pswitch_0
    goto/16 :goto_0

    .line 7
    .line 8
    :pswitch_1
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/ckm$a;->n(Landroid/os/Message;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_2
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/ckm$a;->w(Landroid/os/Message;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_3
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/ckm$a;->j(Landroid/os/Message;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :pswitch_4
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-interface {p0, p1}, Ll/ckm$a;->p(Landroid/os/Message;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_5
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    invoke-interface {p0}, Ll/ckm$a;->onResume()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_6
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 49
    .line 50
    if-eqz p0, :cond_0

    .line 51
    .line 52
    invoke-interface {p0}, Ll/ckm$a;->onPause()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_7
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 57
    .line 58
    if-eqz p0, :cond_0

    .line 59
    .line 60
    invoke-interface {p0}, Ll/ckm$a;->s()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_8
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 65
    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    invoke-interface {p0}, Ll/ckm$a;->k()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :pswitch_9
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 73
    .line 74
    if-eqz p0, :cond_0

    .line 75
    .line 76
    invoke-interface {p0, p1}, Ll/ckm$a;->q(Landroid/os/Message;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :pswitch_a
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 81
    .line 82
    if-eqz p0, :cond_0

    .line 83
    .line 84
    invoke-interface {p0, p1}, Ll/ckm$a;->b(Landroid/os/Message;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :pswitch_b
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 89
    .line 90
    if-eqz p0, :cond_0

    .line 91
    .line 92
    invoke-interface {p0, p1}, Ll/ckm$a;->f(Landroid/os/Message;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_c
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 97
    .line 98
    if-eqz p0, :cond_0

    .line 99
    .line 100
    invoke-interface {p0, p1}, Ll/ckm$a;->r(Landroid/os/Message;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :pswitch_d
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 105
    .line 106
    if-eqz p0, :cond_0

    .line 107
    .line 108
    invoke-interface {p0, p1}, Ll/ckm$a;->e(Landroid/os/Message;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_e
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 113
    .line 114
    if-eqz p0, :cond_0

    .line 115
    .line 116
    invoke-interface {p0, p1}, Ll/ckm$a;->g(Landroid/os/Message;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :pswitch_f
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 121
    .line 122
    if-eqz p0, :cond_0

    .line 123
    .line 124
    invoke-interface {p0, p1}, Ll/ckm$a;->l(Landroid/os/Message;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :pswitch_10
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 129
    .line 130
    if-eqz p0, :cond_0

    .line 131
    .line 132
    invoke-interface {p0, p1}, Ll/ckm$a;->o(Landroid/os/Message;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :pswitch_11
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 137
    .line 138
    if-eqz p0, :cond_0

    .line 139
    .line 140
    invoke-interface {p0}, Ll/ckm$a;->t()V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :pswitch_12
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 145
    .line 146
    if-eqz p0, :cond_0

    .line 147
    .line 148
    invoke-interface {p0, p1}, Ll/ckm$a;->h(Landroid/os/Message;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :pswitch_13
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 153
    .line 154
    if-eqz p0, :cond_0

    .line 155
    .line 156
    invoke-interface {p0, p1}, Ll/ckm$a;->d(Landroid/os/Message;)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :pswitch_14
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 161
    .line 162
    if-eqz p0, :cond_0

    .line 163
    .line 164
    invoke-interface {p0, p1}, Ll/ckm$a;->u(Landroid/os/Message;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :pswitch_15
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 169
    .line 170
    if-eqz p0, :cond_0

    .line 171
    .line 172
    invoke-interface {p0, p1}, Ll/ckm$a;->c(Landroid/os/Message;)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :pswitch_16
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 177
    .line 178
    if-eqz p0, :cond_0

    .line 179
    .line 180
    invoke-interface {p0, p1}, Ll/ckm$a;->v(Landroid/os/Message;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :pswitch_17
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 185
    .line 186
    if-eqz p0, :cond_0

    .line 187
    .line 188
    invoke-interface {p0, p1}, Ll/ckm$a;->i(Landroid/os/Message;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :pswitch_18
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 193
    .line 194
    if-eqz p0, :cond_0

    .line 195
    .line 196
    invoke-interface {p0, p1}, Ll/ckm$a;->m(Landroid/os/Message;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :pswitch_19
    iget-object p0, p0, Ll/ckm;->a:Ll/ckm$a;

    .line 201
    .line 202
    if-eqz p0, :cond_0

    .line 203
    .line 204
    invoke-interface {p0, p1}, Ll/ckm$a;->a(Landroid/os/Message;)V

    .line 205
    .line 206
    .line 207
    :cond_0
    :goto_0
    return-void

    .line 208
    nop

    .line 209
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_19
        :pswitch_18
        :pswitch_0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
