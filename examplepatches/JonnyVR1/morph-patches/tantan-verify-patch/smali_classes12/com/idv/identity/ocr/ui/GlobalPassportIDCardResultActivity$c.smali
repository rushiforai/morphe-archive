.class Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->p1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->S1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/EditText;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->T1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/EditText;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/EditText;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const-string v3, ""

    .line 48
    .line 49
    if-nez v2, :cond_6

    .line 50
    .line 51
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_6

    .line 56
    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_0
    const-string v2, "^[A-Za-z]{1,50}$"

    .line 66
    .line 67
    invoke-static {v2, p1}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 81
    .line 82
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    sget v2, Lcom/idv/identity/base/R$string;->z0:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    sget v1, Lcom/idv/identity/base/R$string;->E0:I

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p1, p0, v3}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_1
    const-string p1, "^[A-Za-z\\s]{1,50}$"

    .line 119
    .line 120
    invoke-static {p1, v0}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_2

    .line 125
    .line 126
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 127
    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 134
    .line 135
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    sget v2, Lcom/idv/identity/base/R$string;->y0:I

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    sget v1, Lcom/idv/identity/base/R$string;->E0:I

    .line 155
    .line 156
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p1, p0, v3}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_2
    const-string p1, "^[A-Za-z0-9]{8,9}$"

    .line 172
    .line 173
    invoke-static {p1, v1}, Ll/fb50;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-nez p1, :cond_3

    .line 178
    .line 179
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 180
    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 187
    .line 188
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    sget v2, Lcom/idv/identity/base/R$string;->x0:I

    .line 193
    .line 194
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 202
    .line 203
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    sget v1, Lcom/idv/identity/base/R$string;->E0:I

    .line 208
    .line 209
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-virtual {p1, p0, v3}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :cond_3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {p1}, Ll/afm;->i0()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 241
    .line 242
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    const-string v2, "android.hardware.nfc"

    .line 247
    .line 248
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    sget-object v2, Ll/cfm;->a:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 255
    .line 256
    iget-object v3, v3, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-eqz v2, :cond_5

    .line 263
    .line 264
    sget-object v2, Ll/ffm;->g:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-nez v2, :cond_4

    .line 271
    .line 272
    sget-object v2, Ll/ffm;->e:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-eqz p1, :cond_5

    .line 279
    .line 280
    if-eqz v1, :cond_5

    .line 281
    .line 282
    if-eqz v0, :cond_5

    .line 283
    .line 284
    :cond_4
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 285
    .line 286
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->V1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :cond_5
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 291
    .line 292
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->d2()V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :cond_6
    :goto_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 297
    .line 298
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    sget v0, Lcom/idv/identity/base/R$string;->H0:I

    .line 303
    .line 304
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    invoke-virtual {p0, p1, v3}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    return-void
.end method
