.class public final Ll/qwg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ffg0;


# direct methods
.method public constructor <init>(Ll/ffg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qwg0;->a:Ll/ffg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object p0, p0, Ll/qwg0;->a:Ll/ffg0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/ffg0;->e:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_9

    .line 9
    .line 10
    :cond_0
    iget-wide v0, p0, Ll/ffg0;->b:J

    .line 11
    .line 12
    iget-wide v2, p0, Ll/ffg0;->f:J

    .line 13
    .line 14
    sub-long/2addr v0, v2

    .line 15
    iput-wide v0, p0, Ll/ffg0;->b:J

    .line 16
    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-gtz v0, :cond_f

    .line 22
    .line 23
    iget-object v0, p0, Ll/ffg0;->c:Ll/kzg0;

    .line 24
    .line 25
    if-eqz v0, :cond_e

    .line 26
    .line 27
    check-cast v0, Ll/dhg0;

    .line 28
    .line 29
    const-string v1, "ProxySudFSTAPPImpl"

    .line 30
    .line 31
    const-string v2, "onLoadGameTimeout:"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, v0, Ll/dhg0;->p:Ll/bgg0;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    if-eqz v1, :cond_c

    .line 40
    .line 41
    iget v1, v1, Ll/bgg0;->d:I

    .line 42
    .line 43
    iget-boolean v3, v0, Ll/dhg0;->l:Z

    .line 44
    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    iput-boolean v2, v0, Ll/dhg0;->l:Z

    .line 48
    .line 49
    iget-object v3, v0, Ll/dhg0;->w:Ll/iug0;

    .line 50
    .line 51
    invoke-virtual {v3, v1}, Ll/iug0;->b(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    .line 56
    goto/16 :goto_a

    .line 57
    .line 58
    :cond_1
    :goto_0
    const/16 v3, 0x50

    .line 59
    .line 60
    if-lt v1, v3, :cond_c

    .line 61
    .line 62
    iget-object v0, v0, Ll/dhg0;->p:Ll/bgg0;

    .line 63
    .line 64
    iget-boolean v1, v0, Ll/bgg0;->s:Z

    .line 65
    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    goto/16 :goto_9

    .line 69
    .line 70
    :cond_2
    iget-object v1, v0, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 71
    .line 72
    const-string v3, ""

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, v0, Ll/bgg0;->o:Landroid/view/View;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    iget-object v1, v0, Ll/bgg0;->p:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    if-eqz v2, :cond_4

    .line 89
    .line 90
    iget-object v2, v2, Ll/smg0;->e:LD/Sudif;

    .line 91
    .line 92
    if-nez v2, :cond_3

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    sget-object v3, Ll/utg0;->d:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v2, v3}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_5

    .line 106
    .line 107
    iget-object v2, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 108
    .line 109
    sget v3, Ltech/sud/gip/R$string;->fsm_mgp_continue_wait_tip:I

    .line 110
    .line 111
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    goto :goto_2

    .line 120
    :cond_4
    :goto_1
    iget-object v2, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 121
    .line 122
    sget v3, Ltech/sud/gip/R$string;->fsm_mgp_continue_wait_tip:I

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    :cond_5
    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object v1, v0, Ll/bgg0;->q:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    if-eqz v2, :cond_7

    .line 142
    .line 143
    iget-object v2, v2, Ll/smg0;->f:LD/Sudif;

    .line 144
    .line 145
    if-nez v2, :cond_6

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_6
    sget-object v3, Ll/utg0;->d:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v2, v3}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    if-eqz v3, :cond_8

    .line 159
    .line 160
    iget-object v2, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 161
    .line 162
    sget v3, Ltech/sud/gip/R$string;->fsm_mgp_continue_wait:I

    .line 163
    .line 164
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    goto :goto_4

    .line 173
    :cond_7
    :goto_3
    iget-object v2, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 174
    .line 175
    sget v3, Ltech/sud/gip/R$string;->fsm_mgp_continue_wait:I

    .line 176
    .line 177
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    :cond_8
    :goto_4
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    .line 187
    .line 188
    iget-object v1, v0, Ll/bgg0;->r:Landroid/widget/TextView;

    .line 189
    .line 190
    invoke-static {}, Ll/utg0;->e()Ll/smg0;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    if-eqz v2, :cond_a

    .line 195
    .line 196
    iget-object v2, v2, Ll/smg0;->d:LD/Sudif;

    .line 197
    .line 198
    if-nez v2, :cond_9

    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_9
    sget-object v3, Ll/utg0;->d:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v2, v3}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    if-eqz v3, :cond_b

    .line 212
    .line 213
    iget-object v0, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 214
    .line 215
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_loading_reload_game:I

    .line 216
    .line 217
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    :goto_5
    move-object v2, v0

    .line 226
    goto :goto_7

    .line 227
    :cond_a
    :goto_6
    iget-object v0, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 228
    .line 229
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_loading_reload_game:I

    .line 230
    .line 231
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    goto :goto_5

    .line 240
    :cond_b
    :goto_7
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    monitor-exit p0

    .line 244
    return-void

    .line 245
    :cond_c
    invoke-virtual {v0}, Ll/dhg0;->a()V

    .line 246
    .line 247
    .line 248
    iget-boolean v1, v0, Ll/dhg0;->j:Z

    .line 249
    .line 250
    if-eqz v1, :cond_d

    .line 251
    .line 252
    goto :goto_8

    .line 253
    :cond_d
    const/4 v1, 0x1

    .line 254
    iput-boolean v1, v0, Ll/dhg0;->j:Z

    .line 255
    .line 256
    const/4 v3, 0x3

    .line 257
    const/16 v4, 0x64

    .line 258
    .line 259
    invoke-virtual {v0, v3, v2, v4, v1}, Ll/dhg0;->b(IIIZ)V

    .line 260
    .line 261
    .line 262
    :goto_8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    return-void

    .line 264
    :cond_e
    :goto_9
    monitor-exit p0

    .line 265
    return-void

    .line 266
    :cond_f
    :try_start_1
    invoke-virtual {p0}, Ll/ffg0;->a()V

    .line 267
    .line 268
    .line 269
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 270
    return-void

    .line 271
    :goto_a
    monitor-exit p0

    .line 272
    throw v0
.end method
