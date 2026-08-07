.class public Ll/dqe0;
.super Ll/p33;
.source "SourceFile"


# instance fields
.field public A:Z

.field public B:I

.field public C:I

.field public D:I

.field public E:Z

.field public F:Z

.field public G:Z

.field public H:I

.field public I:I

.field public J:I

.field public K:I

.field public L:[I

.field public M:Ll/e0l0;

.field public N:Ll/f1e0;

.field public O:I

.field public a:I

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:I

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Ll/n45;

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:I

.field public r:J

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p33;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a(Ll/as3;)Ll/e0l0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e0l0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e0l0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "VUI: aspect_ratio_info_present_flag"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput-boolean v1, v0, Ll/e0l0;->a:Z

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string v1, "VUI: aspect_ratio"

    .line 19
    .line 20
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    long-to-int v1, v3

    .line 25
    invoke-static {v1}, Ll/r11;->a(I)Ll/r11;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Ll/e0l0;->y:Ll/r11;

    .line 30
    .line 31
    sget-object v3, Ll/r11;->b:Ll/r11;

    .line 32
    .line 33
    if-ne v1, v3, :cond_0

    .line 34
    .line 35
    const-string v1, "VUI: sar_width"

    .line 36
    .line 37
    const/16 v3, 0x10

    .line 38
    .line 39
    invoke-virtual {p0, v3, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v4

    .line 43
    long-to-int v1, v4

    .line 44
    iput v1, v0, Ll/e0l0;->b:I

    .line 45
    .line 46
    const-string v1, "VUI: sar_height"

    .line 47
    .line 48
    invoke-virtual {p0, v3, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    long-to-int v1, v3

    .line 53
    iput v1, v0, Ll/e0l0;->c:I

    .line 54
    .line 55
    :cond_0
    const-string v1, "VUI: overscan_info_present_flag"

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput-boolean v1, v0, Ll/e0l0;->d:Z

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    const-string v1, "VUI: overscan_appropriate_flag"

    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput-boolean v1, v0, Ll/e0l0;->e:Z

    .line 72
    .line 73
    :cond_1
    const-string v1, "VUI: video_signal_type_present_flag"

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iput-boolean v1, v0, Ll/e0l0;->f:Z

    .line 80
    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    const/4 v1, 0x3

    .line 84
    const-string v3, "VUI: video_format"

    .line 85
    .line 86
    invoke-virtual {p0, v1, v3}, Ll/as3;->g(ILjava/lang/String;)J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    long-to-int v1, v3

    .line 91
    iput v1, v0, Ll/e0l0;->g:I

    .line 92
    .line 93
    const-string v1, "VUI: video_full_range_flag"

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    iput-boolean v1, v0, Ll/e0l0;->h:Z

    .line 100
    .line 101
    const-string v1, "VUI: colour_description_present_flag"

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    iput-boolean v1, v0, Ll/e0l0;->i:Z

    .line 108
    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    const-string v1, "VUI: colour_primaries"

    .line 112
    .line 113
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 114
    .line 115
    .line 116
    move-result-wide v3

    .line 117
    long-to-int v1, v3

    .line 118
    iput v1, v0, Ll/e0l0;->j:I

    .line 119
    .line 120
    const-string v1, "VUI: transfer_characteristics"

    .line 121
    .line 122
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 123
    .line 124
    .line 125
    move-result-wide v3

    .line 126
    long-to-int v1, v3

    .line 127
    iput v1, v0, Ll/e0l0;->k:I

    .line 128
    .line 129
    const-string v1, "VUI: matrix_coefficients"

    .line 130
    .line 131
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 132
    .line 133
    .line 134
    move-result-wide v1

    .line 135
    long-to-int v1, v1

    .line 136
    iput v1, v0, Ll/e0l0;->l:I

    .line 137
    .line 138
    :cond_2
    const-string v1, "VUI: chroma_loc_info_present_flag"

    .line 139
    .line 140
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    iput-boolean v1, v0, Ll/e0l0;->m:Z

    .line 145
    .line 146
    if-eqz v1, :cond_3

    .line 147
    .line 148
    const-string v1, "VUI chroma_sample_loc_type_top_field"

    .line 149
    .line 150
    invoke-virtual {p0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    iput v1, v0, Ll/e0l0;->n:I

    .line 155
    .line 156
    const-string v1, "VUI chroma_sample_loc_type_bottom_field"

    .line 157
    .line 158
    invoke-virtual {p0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    iput v1, v0, Ll/e0l0;->o:I

    .line 163
    .line 164
    :cond_3
    const-string v1, "VUI: timing_info_present_flag"

    .line 165
    .line 166
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    iput-boolean v1, v0, Ll/e0l0;->p:Z

    .line 171
    .line 172
    if-eqz v1, :cond_4

    .line 173
    .line 174
    const-string v1, "VUI: num_units_in_tick"

    .line 175
    .line 176
    const/16 v2, 0x20

    .line 177
    .line 178
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 179
    .line 180
    .line 181
    move-result-wide v3

    .line 182
    long-to-int v1, v3

    .line 183
    iput v1, v0, Ll/e0l0;->q:I

    .line 184
    .line 185
    const-string v1, "VUI: time_scale"

    .line 186
    .line 187
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    long-to-int v1, v1

    .line 192
    iput v1, v0, Ll/e0l0;->r:I

    .line 193
    .line 194
    const-string v1, "VUI: fixed_frame_rate_flag"

    .line 195
    .line 196
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    iput-boolean v1, v0, Ll/e0l0;->s:Z

    .line 201
    .line 202
    :cond_4
    const-string v1, "VUI: nal_hrd_parameters_present_flag"

    .line 203
    .line 204
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-eqz v1, :cond_5

    .line 209
    .line 210
    invoke-static {p0}, Ll/dqe0;->c(Ll/as3;)Ll/fxk;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    iput-object v2, v0, Ll/e0l0;->v:Ll/fxk;

    .line 215
    .line 216
    :cond_5
    const-string v2, "VUI: vcl_hrd_parameters_present_flag"

    .line 217
    .line 218
    invoke-virtual {p0, v2}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    if-eqz v2, :cond_6

    .line 223
    .line 224
    invoke-static {p0}, Ll/dqe0;->c(Ll/as3;)Ll/fxk;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    iput-object v3, v0, Ll/e0l0;->w:Ll/fxk;

    .line 229
    .line 230
    :cond_6
    if-nez v1, :cond_7

    .line 231
    .line 232
    if-eqz v2, :cond_8

    .line 233
    .line 234
    :cond_7
    const-string v1, "VUI: low_delay_hrd_flag"

    .line 235
    .line 236
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    iput-boolean v1, v0, Ll/e0l0;->t:Z

    .line 241
    .line 242
    :cond_8
    const-string v1, "VUI: pic_struct_present_flag"

    .line 243
    .line 244
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    iput-boolean v1, v0, Ll/e0l0;->u:Z

    .line 249
    .line 250
    const-string v1, "VUI: bitstream_restriction_flag"

    .line 251
    .line 252
    invoke-virtual {p0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-eqz v1, :cond_9

    .line 257
    .line 258
    new-instance v1, Ll/e0l0$a;

    .line 259
    .line 260
    invoke-direct {v1}, Ll/e0l0$a;-><init>()V

    .line 261
    .line 262
    .line 263
    iput-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 264
    .line 265
    const-string v2, "VUI: motion_vectors_over_pic_boundaries_flag"

    .line 266
    .line 267
    invoke-virtual {p0, v2}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 268
    .line 269
    .line 270
    move-result v2

    .line 271
    iput-boolean v2, v1, Ll/e0l0$a;->a:Z

    .line 272
    .line 273
    iget-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 274
    .line 275
    const-string v2, "VUI max_bytes_per_pic_denom"

    .line 276
    .line 277
    invoke-virtual {p0, v2}, Ll/as3;->l(Ljava/lang/String;)I

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    iput v2, v1, Ll/e0l0$a;->b:I

    .line 282
    .line 283
    iget-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 284
    .line 285
    const-string v2, "VUI max_bits_per_mb_denom"

    .line 286
    .line 287
    invoke-virtual {p0, v2}, Ll/as3;->l(Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    iput v2, v1, Ll/e0l0$a;->c:I

    .line 292
    .line 293
    iget-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 294
    .line 295
    const-string v2, "VUI log2_max_mv_length_horizontal"

    .line 296
    .line 297
    invoke-virtual {p0, v2}, Ll/as3;->l(Ljava/lang/String;)I

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    iput v2, v1, Ll/e0l0$a;->d:I

    .line 302
    .line 303
    iget-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 304
    .line 305
    const-string v2, "VUI log2_max_mv_length_vertical"

    .line 306
    .line 307
    invoke-virtual {p0, v2}, Ll/as3;->l(Ljava/lang/String;)I

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    iput v2, v1, Ll/e0l0$a;->e:I

    .line 312
    .line 313
    iget-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 314
    .line 315
    const-string v2, "VUI num_reorder_frames"

    .line 316
    .line 317
    invoke-virtual {p0, v2}, Ll/as3;->l(Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    iput v2, v1, Ll/e0l0$a;->f:I

    .line 322
    .line 323
    iget-object v1, v0, Ll/e0l0;->x:Ll/e0l0$a;

    .line 324
    .line 325
    const-string v2, "VUI max_dec_frame_buffering"

    .line 326
    .line 327
    invoke-virtual {p0, v2}, Ll/as3;->l(Ljava/lang/String;)I

    .line 328
    .line 329
    .line 330
    move-result p0

    .line 331
    iput p0, v1, Ll/e0l0$a;->g:I

    .line 332
    .line 333
    :cond_9
    return-object v0
.end method

.method public static b(Ljava/io/InputStream;)Ll/dqe0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/as3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/as3;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/dqe0;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/dqe0;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "SPS: profile_idc"

    .line 12
    .line 13
    const/16 v2, 0x8

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    long-to-int v1, v3

    .line 20
    iput v1, p0, Ll/dqe0;->q:I

    .line 21
    .line 22
    const-string v1, "SPS: constraint_set_0_flag"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput-boolean v1, p0, Ll/dqe0;->s:Z

    .line 29
    .line 30
    const-string v1, "SPS: constraint_set_1_flag"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput-boolean v1, p0, Ll/dqe0;->t:Z

    .line 37
    .line 38
    const-string v1, "SPS: constraint_set_2_flag"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput-boolean v1, p0, Ll/dqe0;->u:Z

    .line 45
    .line 46
    const-string v1, "SPS: constraint_set_3_flag"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iput-boolean v1, p0, Ll/dqe0;->v:Z

    .line 53
    .line 54
    const-string v1, "SPS: constraint_set_4_flag"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput-boolean v1, p0, Ll/dqe0;->w:Z

    .line 61
    .line 62
    const-string v1, "SPS: constraint_set_5_flag"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput-boolean v1, p0, Ll/dqe0;->x:Z

    .line 69
    .line 70
    const/4 v1, 0x2

    .line 71
    const-string v3, "SPS: reserved_zero_2bits"

    .line 72
    .line 73
    invoke-virtual {v0, v1, v3}, Ll/as3;->g(ILjava/lang/String;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v3

    .line 77
    iput-wide v3, p0, Ll/dqe0;->r:J

    .line 78
    .line 79
    const-string v1, "SPS: level_idc"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    long-to-int v1, v1

    .line 86
    iput v1, p0, Ll/dqe0;->y:I

    .line 87
    .line 88
    const-string v1, "SPS: seq_parameter_set_id"

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iput v1, p0, Ll/dqe0;->z:I

    .line 95
    .line 96
    iget v1, p0, Ll/dqe0;->q:I

    .line 97
    .line 98
    const/16 v2, 0x64

    .line 99
    .line 100
    if-eq v1, v2, :cond_1

    .line 101
    .line 102
    const/16 v2, 0x6e

    .line 103
    .line 104
    if-eq v1, v2, :cond_1

    .line 105
    .line 106
    const/16 v2, 0x7a

    .line 107
    .line 108
    if-eq v1, v2, :cond_1

    .line 109
    .line 110
    const/16 v2, 0x90

    .line 111
    .line 112
    if-ne v1, v2, :cond_0

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_0
    sget-object v1, Ll/n45;->e:Ll/n45;

    .line 116
    .line 117
    iput-object v1, p0, Ll/dqe0;->i:Ll/n45;

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    :goto_0
    const-string v1, "SPS: chroma_format_idc"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-static {v1}, Ll/n45;->a(I)Ll/n45;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, p0, Ll/dqe0;->i:Ll/n45;

    .line 131
    .line 132
    sget-object v2, Ll/n45;->g:Ll/n45;

    .line 133
    .line 134
    if-ne v1, v2, :cond_2

    .line 135
    .line 136
    const-string v1, "SPS: residual_color_transform_flag"

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    iput-boolean v1, p0, Ll/dqe0;->A:Z

    .line 143
    .line 144
    :cond_2
    const-string v1, "SPS: bit_depth_luma_minus8"

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    iput v1, p0, Ll/dqe0;->n:I

    .line 151
    .line 152
    const-string v1, "SPS: bit_depth_chroma_minus8"

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    iput v1, p0, Ll/dqe0;->o:I

    .line 159
    .line 160
    const-string v1, "SPS: qpprime_y_zero_transform_bypass_flag"

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    iput-boolean v1, p0, Ll/dqe0;->p:Z

    .line 167
    .line 168
    const-string v1, "SPS: seq_scaling_matrix_present_lag"

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_3

    .line 175
    .line 176
    invoke-static {v0, p0}, Ll/dqe0;->d(Ll/as3;Ll/dqe0;)V

    .line 177
    .line 178
    .line 179
    :cond_3
    :goto_1
    const-string v1, "SPS: log2_max_frame_num_minus4"

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    iput v1, p0, Ll/dqe0;->j:I

    .line 186
    .line 187
    const-string v1, "SPS: pic_order_cnt_type"

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    iput v1, p0, Ll/dqe0;->a:I

    .line 194
    .line 195
    if-nez v1, :cond_4

    .line 196
    .line 197
    const-string v1, "SPS: log2_max_pic_order_cnt_lsb_minus4"

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    iput v1, p0, Ll/dqe0;->k:I

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_4
    const/4 v2, 0x1

    .line 207
    if-ne v1, v2, :cond_6

    .line 208
    .line 209
    const-string v1, "SPS: delta_pic_order_always_zero_flag"

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    iput-boolean v1, p0, Ll/dqe0;->c:Z

    .line 216
    .line 217
    const-string v1, "SPS: offset_for_non_ref_pic"

    .line 218
    .line 219
    invoke-virtual {v0, v1}, Ll/as3;->h(Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    iput v1, p0, Ll/dqe0;->B:I

    .line 224
    .line 225
    const-string v1, "SPS: offset_for_top_to_bottom_field"

    .line 226
    .line 227
    invoke-virtual {v0, v1}, Ll/as3;->h(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    iput v1, p0, Ll/dqe0;->C:I

    .line 232
    .line 233
    const-string v1, "SPS: num_ref_frames_in_pic_order_cnt_cycle"

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    iput v1, p0, Ll/dqe0;->O:I

    .line 240
    .line 241
    new-array v1, v1, [I

    .line 242
    .line 243
    iput-object v1, p0, Ll/dqe0;->L:[I

    .line 244
    .line 245
    const/4 v1, 0x0

    .line 246
    :goto_2
    iget v2, p0, Ll/dqe0;->O:I

    .line 247
    .line 248
    if-lt v1, v2, :cond_5

    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_5
    iget-object v2, p0, Ll/dqe0;->L:[I

    .line 252
    .line 253
    new-instance v3, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v4, "SPS: offsetForRefFrame ["

    .line 256
    .line 257
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v4, "]"

    .line 264
    .line 265
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v0, v3}, Ll/as3;->h(Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    aput v3, v2, v1

    .line 277
    .line 278
    add-int/lit8 v1, v1, 0x1

    .line 279
    .line 280
    goto :goto_2

    .line 281
    :cond_6
    :goto_3
    const-string v1, "SPS: num_ref_frames"

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    iput v1, p0, Ll/dqe0;->D:I

    .line 288
    .line 289
    const-string v1, "SPS: gaps_in_frame_num_value_allowed_flag"

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    iput-boolean v1, p0, Ll/dqe0;->E:Z

    .line 296
    .line 297
    const-string v1, "SPS: pic_width_in_mbs_minus1"

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    iput v1, p0, Ll/dqe0;->m:I

    .line 304
    .line 305
    const-string v1, "SPS: pic_height_in_map_units_minus1"

    .line 306
    .line 307
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    iput v1, p0, Ll/dqe0;->l:I

    .line 312
    .line 313
    const-string v1, "SPS: frame_mbs_only_flag"

    .line 314
    .line 315
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    iput-boolean v1, p0, Ll/dqe0;->F:Z

    .line 320
    .line 321
    if-nez v1, :cond_7

    .line 322
    .line 323
    const-string v1, "SPS: mb_adaptive_frame_field_flag"

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    iput-boolean v1, p0, Ll/dqe0;->g:Z

    .line 330
    .line 331
    :cond_7
    const-string v1, "SPS: direct_8x8_inference_flag"

    .line 332
    .line 333
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    iput-boolean v1, p0, Ll/dqe0;->h:Z

    .line 338
    .line 339
    const-string v1, "SPS: frame_cropping_flag"

    .line 340
    .line 341
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    iput-boolean v1, p0, Ll/dqe0;->G:Z

    .line 346
    .line 347
    if-eqz v1, :cond_8

    .line 348
    .line 349
    const-string v1, "SPS: frame_crop_left_offset"

    .line 350
    .line 351
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    iput v1, p0, Ll/dqe0;->H:I

    .line 356
    .line 357
    const-string v1, "SPS: frame_crop_right_offset"

    .line 358
    .line 359
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    iput v1, p0, Ll/dqe0;->I:I

    .line 364
    .line 365
    const-string v1, "SPS: frame_crop_top_offset"

    .line 366
    .line 367
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    iput v1, p0, Ll/dqe0;->J:I

    .line 372
    .line 373
    const-string v1, "SPS: frame_crop_bottom_offset"

    .line 374
    .line 375
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    iput v1, p0, Ll/dqe0;->K:I

    .line 380
    .line 381
    :cond_8
    const-string v1, "SPS: vui_parameters_present_flag"

    .line 382
    .line 383
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    if-eqz v1, :cond_9

    .line 388
    .line 389
    invoke-static {v0}, Ll/dqe0;->a(Ll/as3;)Ll/e0l0;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    iput-object v1, p0, Ll/dqe0;->M:Ll/e0l0;

    .line 394
    .line 395
    :cond_9
    invoke-virtual {v0}, Ll/as3;->i()V

    .line 396
    .line 397
    .line 398
    return-object p0
.end method

.method private static c(Ll/as3;)Ll/fxk;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fxk;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fxk;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "SPS: cpb_cnt_minus1"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput v1, v0, Ll/fxk;->a:I

    .line 13
    .line 14
    const-string v1, "HRD: bit_rate_scale"

    .line 15
    .line 16
    const/4 v2, 0x4

    .line 17
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    long-to-int v1, v3

    .line 22
    iput v1, v0, Ll/fxk;->b:I

    .line 23
    .line 24
    const-string v1, "HRD: cpb_size_scale"

    .line 25
    .line 26
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    long-to-int v1, v1

    .line 31
    iput v1, v0, Ll/fxk;->c:I

    .line 32
    .line 33
    iget v1, v0, Ll/fxk;->a:I

    .line 34
    .line 35
    add-int/lit8 v2, v1, 0x1

    .line 36
    .line 37
    new-array v2, v2, [I

    .line 38
    .line 39
    iput-object v2, v0, Ll/fxk;->d:[I

    .line 40
    .line 41
    add-int/lit8 v2, v1, 0x1

    .line 42
    .line 43
    new-array v2, v2, [I

    .line 44
    .line 45
    iput-object v2, v0, Ll/fxk;->e:[I

    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    new-array v1, v1, [Z

    .line 50
    .line 51
    iput-object v1, v0, Ll/fxk;->f:[Z

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    :goto_0
    iget v2, v0, Ll/fxk;->a:I

    .line 55
    .line 56
    if-le v1, v2, :cond_0

    .line 57
    .line 58
    const-string v1, "HRD: initial_cpb_removal_delay_length_minus1"

    .line 59
    .line 60
    const/4 v2, 0x5

    .line 61
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v3

    .line 65
    long-to-int v1, v3

    .line 66
    iput v1, v0, Ll/fxk;->g:I

    .line 67
    .line 68
    const-string v1, "HRD: cpb_removal_delay_length_minus1"

    .line 69
    .line 70
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v3

    .line 74
    long-to-int v1, v3

    .line 75
    iput v1, v0, Ll/fxk;->h:I

    .line 76
    .line 77
    const-string v1, "HRD: dpb_output_delay_length_minus1"

    .line 78
    .line 79
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    long-to-int v1, v3

    .line 84
    iput v1, v0, Ll/fxk;->i:I

    .line 85
    .line 86
    const-string v1, "HRD: time_offset_length"

    .line 87
    .line 88
    invoke-virtual {p0, v2, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 89
    .line 90
    .line 91
    move-result-wide v1

    .line 92
    long-to-int p0, v1

    .line 93
    iput p0, v0, Ll/fxk;->j:I

    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_0
    iget-object v2, v0, Ll/fxk;->d:[I

    .line 97
    .line 98
    const-string v3, "HRD: bit_rate_value_minus1"

    .line 99
    .line 100
    invoke-virtual {p0, v3}, Ll/as3;->l(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    aput v3, v2, v1

    .line 105
    .line 106
    iget-object v2, v0, Ll/fxk;->e:[I

    .line 107
    .line 108
    const-string v3, "HRD: cpb_size_value_minus1"

    .line 109
    .line 110
    invoke-virtual {p0, v3}, Ll/as3;->l(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    aput v3, v2, v1

    .line 115
    .line 116
    iget-object v2, v0, Ll/fxk;->f:[Z

    .line 117
    .line 118
    const-string v3, "HRD: cbr_flag"

    .line 119
    .line 120
    invoke-virtual {p0, v3}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    aput-boolean v3, v2, v1

    .line 125
    .line 126
    add-int/lit8 v1, v1, 0x1

    .line 127
    .line 128
    goto :goto_0
.end method

.method private static d(Ll/as3;Ll/dqe0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/f1e0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/f1e0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p1, Ll/dqe0;->N:Ll/f1e0;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    const/16 v1, 0x8

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string v2, "SPS: seqScalingListPresentFlag"

    .line 15
    .line 16
    invoke-virtual {p0, v2}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    iget-object v2, p1, Ll/dqe0;->N:Ll/f1e0;

    .line 23
    .line 24
    new-array v3, v1, [Ll/e1e0;

    .line 25
    .line 26
    iput-object v3, v2, Ll/f1e0;->a:[Ll/e1e0;

    .line 27
    .line 28
    new-array v1, v1, [Ll/e1e0;

    .line 29
    .line 30
    iput-object v1, v2, Ll/f1e0;->b:[Ll/e1e0;

    .line 31
    .line 32
    const/4 v2, 0x6

    .line 33
    if-ge v0, v2, :cond_1

    .line 34
    .line 35
    const/16 v1, 0x10

    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/e1e0;->a(Ll/as3;I)Ll/e1e0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    aput-object v1, v3, v0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    add-int/lit8 v2, v0, -0x6

    .line 45
    .line 46
    const/16 v3, 0x40

    .line 47
    .line 48
    invoke-static {p0, v3}, Ll/e1e0;->a(Ll/as3;I)Ll/e1e0;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    aput-object v3, v1, v2

    .line 53
    .line 54
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SeqParameterSet{ \n        pic_order_cnt_type="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/dqe0;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", \n        field_pic_flag="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Ll/dqe0;->b:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", \n        delta_pic_order_always_zero_flag="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Ll/dqe0;->c:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", \n        weighted_pred_flag="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Ll/dqe0;->d:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", \n        weighted_bipred_idc="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/dqe0;->e:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", \n        entropy_coding_mode_flag="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Ll/dqe0;->f:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", \n        mb_adaptive_frame_field_flag="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Ll/dqe0;->g:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", \n        direct_8x8_inference_flag="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean v1, p0, Ll/dqe0;->h:Z

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", \n        chroma_format_idc="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/dqe0;->i:Ll/n45;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", \n        log2_max_frame_num_minus4="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Ll/dqe0;->j:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", \n        log2_max_pic_order_cnt_lsb_minus4="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Ll/dqe0;->k:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", \n        pic_height_in_map_units_minus1="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Ll/dqe0;->l:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", \n        pic_width_in_mbs_minus1="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Ll/dqe0;->m:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ", \n        bit_depth_luma_minus8="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget v1, p0, Ll/dqe0;->n:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ", \n        bit_depth_chroma_minus8="

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Ll/dqe0;->o:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ", \n        qpprime_y_zero_transform_bypass_flag="

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-boolean v1, p0, Ll/dqe0;->p:Z

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, ", \n        profile_idc="

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v1, p0, Ll/dqe0;->q:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, ", \n        constraint_set_0_flag="

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-boolean v1, p0, Ll/dqe0;->s:Z

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, ", \n        constraint_set_1_flag="

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-boolean v1, p0, Ll/dqe0;->t:Z

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v1, ", \n        constraint_set_2_flag="

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-boolean v1, p0, Ll/dqe0;->u:Z

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v1, ", \n        constraint_set_3_flag="

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-boolean v1, p0, Ll/dqe0;->v:Z

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v1, ", \n        constraint_set_4_flag="

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-boolean v1, p0, Ll/dqe0;->w:Z

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v1, ", \n        constraint_set_5_flag="

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-boolean v1, p0, Ll/dqe0;->x:Z

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v1, ", \n        level_idc="

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget v1, p0, Ll/dqe0;->y:I

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v1, ", \n        seq_parameter_set_id="

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget v1, p0, Ll/dqe0;->z:I

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v1, ", \n        residual_color_transform_flag="

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    iget-boolean v1, p0, Ll/dqe0;->A:Z

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v1, ", \n        offset_for_non_ref_pic="

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget v1, p0, Ll/dqe0;->B:I

    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const-string v1, ", \n        offset_for_top_to_bottom_field="

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget v1, p0, Ll/dqe0;->C:I

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v1, ", \n        num_ref_frames="

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    iget v1, p0, Ll/dqe0;->D:I

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v1, ", \n        gaps_in_frame_num_value_allowed_flag="

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    iget-boolean v1, p0, Ll/dqe0;->E:Z

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v1, ", \n        frame_mbs_only_flag="

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    iget-boolean v1, p0, Ll/dqe0;->F:Z

    .line 309
    .line 310
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    const-string v1, ", \n        frame_cropping_flag="

    .line 314
    .line 315
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    iget-boolean v1, p0, Ll/dqe0;->G:Z

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    const-string v1, ", \n        frame_crop_left_offset="

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    iget v1, p0, Ll/dqe0;->H:I

    .line 329
    .line 330
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    const-string v1, ", \n        frame_crop_right_offset="

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    iget v1, p0, Ll/dqe0;->I:I

    .line 339
    .line 340
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    const-string v1, ", \n        frame_crop_top_offset="

    .line 344
    .line 345
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    iget v1, p0, Ll/dqe0;->J:I

    .line 349
    .line 350
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    const-string v1, ", \n        frame_crop_bottom_offset="

    .line 354
    .line 355
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    iget v1, p0, Ll/dqe0;->K:I

    .line 359
    .line 360
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    const-string v1, ", \n        offsetForRefFrame="

    .line 364
    .line 365
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    iget-object v1, p0, Ll/dqe0;->L:[I

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    const-string v1, ", \n        vuiParams="

    .line 374
    .line 375
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    iget-object v1, p0, Ll/dqe0;->M:Ll/e0l0;

    .line 379
    .line 380
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    const-string v1, ", \n        scalingMatrix="

    .line 384
    .line 385
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    iget-object v1, p0, Ll/dqe0;->N:Ll/f1e0;

    .line 389
    .line 390
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    const-string v1, ", \n        num_ref_frames_in_pic_order_cnt_cycle="

    .line 394
    .line 395
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    iget p0, p0, Ll/dqe0;->O:I

    .line 399
    .line 400
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    const/16 p0, 0x7d

    .line 404
    .line 405
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object p0

    .line 412
    return-object p0
.end method
