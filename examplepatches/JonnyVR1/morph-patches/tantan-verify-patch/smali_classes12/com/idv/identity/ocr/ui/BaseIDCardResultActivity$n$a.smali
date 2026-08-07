.class Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    const-string v0, "identity_ocr_result_id_"

    .line 2
    .line 3
    const-string v1, "identity_ocr_result_id_passport_"

    .line 4
    .line 5
    const-string v2, "identity_ocr_result_id_mainland_"

    .line 6
    .line 7
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v4, "200"

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->a1()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->O1()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    :try_start_0
    sget-object v3, Ll/cfm;->h:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 35
    .line 36
    iget-object v4, v4, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 37
    .line 38
    iget-object v4, v4, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->b:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget-object v2, Ll/cfm;->a:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 66
    .line 67
    iget-object v3, v3, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->p:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_3

    .line 74
    .line 75
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->b:Ljava/lang/String;

    .line 76
    .line 77
    const-string v3, "surname"

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_2

    .line 84
    .line 85
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->b:Ljava/lang/String;

    .line 86
    .line 87
    const-string v3, "givenname"

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_3

    .line 94
    .line 95
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->b:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    goto :goto_0

    .line 110
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->b:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :goto_0
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 125
    .line 126
    iget-object v1, v1, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 127
    .line 128
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    const-string v2, "string"

    .line 133
    .line 134
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 135
    .line 136
    iget-object v3, v3, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 137
    .line 138
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->a:Ljava/lang/String;

    .line 147
    .line 148
    const-string v2, "401"

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_4

    .line 155
    .line 156
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 157
    .line 158
    iget-object v1, v1, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 159
    .line 160
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    sget v3, Lcom/idv/identity/base/R$string;->I0:I

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-static {v2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    const-string v0, ""

    .line 191
    .line 192
    invoke-virtual {v1, p0, v0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->z1(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_4
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->a:Ljava/lang/String;

    .line 197
    .line 198
    const-string v2, "402"

    .line 199
    .line 200
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-eqz v1, :cond_5

    .line 205
    .line 206
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 207
    .line 208
    iget-object v1, v1, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 209
    .line 210
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    sget v3, Lcom/idv/identity/base/R$string;->D0:I

    .line 215
    .line 216
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    new-instance v3, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 226
    .line 227
    iget-object v4, v4, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 228
    .line 229
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    sget v5, Lcom/idv/identity/base/R$string;->F0:I

    .line 234
    .line 235
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 243
    .line 244
    iget-object v4, v4, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 245
    .line 246
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;->c:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;

    .line 258
    .line 259
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 260
    .line 261
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    sget v0, Lcom/idv/identity/base/R$string;->G0:I

    .line 266
    .line 267
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-virtual {v1, v2, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->z1(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    .line 280
    .line 281
    :cond_5
    return-void

    .line 282
    :catch_0
    move-exception p0

    .line 283
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 288
    .line 289
    .line 290
    return-void
.end method
