.class public Ll/h2g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/jl80;


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

.method public static bridge synthetic a()Ll/jl80;
    .locals 1

    .line 1
    sget-object v0, Ll/h2g;->a:Ll/jl80;

    return-object v0
.end method

.method public static b(Landroid/content/Context;)V
    .locals 10

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/jec0;->w:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/h2g;->a:Ll/jl80;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 19
    .line 20
    .line 21
    sget-object v0, Ll/h2g;->a:Ll/jl80;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/jl80;->L()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Ll/ycc0;->w:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lv/VText;

    .line 34
    .line 35
    const-string v2, "    \u5f53\u524d\u5b9a\u4f4d\u7c7b\u578b\uff1a\u56fd\u9645\u5316"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    const-string v8, "WIFI"

    .line 41
    .line 42
    const-string v9, "GPS"

    .line 43
    .line 44
    const-string v3, "INVALID"

    .line 45
    .line 46
    const-string v4, "UNKNOWN"

    .line 47
    .line 48
    const-string v5, "OFFLINE"

    .line 49
    .line 50
    const-string v6, "CACHE"

    .line 51
    .line 52
    const-string v7, "CELL"

    .line 53
    .line 54
    filled-new-array/range {v3 .. v9}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget v2, Ll/ycc0;->i:I

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lv/VCheckBox;

    .line 65
    .line 66
    sget v2, Ll/ycc0;->b:I

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Lv/VCheckBox;

    .line 73
    .line 74
    sget v2, Ll/ycc0;->I:I

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    check-cast v2, Lv/VCheckBox;

    .line 81
    .line 82
    sget v3, Ll/ycc0;->l:I

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Landroid/widget/Spinner;

    .line 89
    .line 90
    new-instance v4, Landroid/widget/ArrayAdapter;

    .line 91
    .line 92
    const v5, 0x1090008

    .line 93
    .line 94
    .line 95
    invoke-direct {v4, p0, v5, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    const v6, 0x1090009

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 105
    .line 106
    .line 107
    sget v3, Ll/ycc0;->e:I

    .line 108
    .line 109
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Landroid/widget/Spinner;

    .line 114
    .line 115
    new-instance v4, Landroid/widget/ArrayAdapter;

    .line 116
    .line 117
    invoke-direct {v4, p0, v5, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 124
    .line 125
    .line 126
    sget v3, Ll/ycc0;->L:I

    .line 127
    .line 128
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    check-cast v3, Landroid/widget/Spinner;

    .line 133
    .line 134
    new-instance v4, Landroid/widget/ArrayAdapter;

    .line 135
    .line 136
    invoke-direct {v4, p0, v5, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v4, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 143
    .line 144
    .line 145
    sget p0, Ll/ycc0;->h:I

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    check-cast p0, Lv/VEditText;

    .line 152
    .line 153
    sget p0, Ll/ycc0;->a:I

    .line 154
    .line 155
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Lv/VEditText;

    .line 160
    .line 161
    sget p0, Ll/ycc0;->H:I

    .line 162
    .line 163
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    check-cast p0, Lv/VEditText;

    .line 168
    .line 169
    sget p0, Ll/ycc0;->j:I

    .line 170
    .line 171
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Lv/VEditText;

    .line 176
    .line 177
    sget p0, Ll/ycc0;->c:I

    .line 178
    .line 179
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    check-cast p0, Lv/VEditText;

    .line 184
    .line 185
    sget p0, Ll/ycc0;->J:I

    .line 186
    .line 187
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    check-cast p0, Lv/VEditText;

    .line 192
    .line 193
    sget v1, Ll/ycc0;->k:I

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    check-cast v1, Lv/VEditText;

    .line 200
    .line 201
    sget v1, Ll/ycc0;->d:I

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    check-cast v1, Lv/VEditText;

    .line 208
    .line 209
    sget v1, Ll/ycc0;->K:I

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    check-cast v1, Lv/VEditText;

    .line 216
    .line 217
    sget v3, Ll/ycc0;->q0:I

    .line 218
    .line 219
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    new-instance v3, Ll/h2g$a;

    .line 224
    .line 225
    invoke-direct {v3, v2, p0, v1}, Ll/h2g$a;-><init>(Lv/VCheckBox;Lv/VEditText;Lv/VEditText;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    .line 230
    .line 231
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 232
    .line 233
    iget-object v3, v0, Lcom/p1/mobile/putong/location/a;->a:Ll/jxd0;

    .line 234
    .line 235
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Ljava/lang/Boolean;

    .line 240
    .line 241
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    if-eqz v3, :cond_0

    .line 246
    .line 247
    const/4 v3, 0x1

    .line 248
    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 249
    .line 250
    .line 251
    goto :goto_0

    .line 252
    :cond_0
    const/4 v3, 0x0

    .line 253
    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 254
    .line 255
    .line 256
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    if-eqz v0, :cond_1

    .line 261
    .line 262
    new-instance v2, Ljava/lang/StringBuilder;

    .line 263
    .line 264
    const-string v3, ""

    .line 265
    .line 266
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 270
    .line 271
    .line 272
    move-result-wide v4

    .line 273
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    new-instance p0, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 289
    .line 290
    .line 291
    move-result-wide v2

    .line 292
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    .line 301
    .line 302
    :cond_1
    return-void
.end method
