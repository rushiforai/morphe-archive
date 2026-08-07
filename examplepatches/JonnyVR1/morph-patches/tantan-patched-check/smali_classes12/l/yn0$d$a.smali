.class Ll/yn0$d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yn0$d;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/yn0$d;


# direct methods
.method public constructor <init>(Ll/yn0$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 13

    .line 1
    const-string p2, " getPreviewWidth:"

    .line 2
    .line 3
    const-string v0, " height: "

    .line 4
    .line 5
    const-string v1, "AndroidImpl"

    .line 6
    .line 7
    const-string v2, "resize bitmap width: "

    .line 8
    .line 9
    const-string v3, "takePhoto bitmap width: "

    .line 10
    .line 11
    const-string v4, "continuous-picture"

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    :try_start_0
    invoke-static {}, Ll/yn0;->A()Ll/yn0;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    iget-object v7, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 21
    .line 22
    iget-object v7, v7, Ll/yn0$d;->b:Ll/yn0;

    .line 23
    .line 24
    invoke-static {v7}, Ll/yn0;->z(Ll/yn0;)Lcom/idv/identity/platform/config/DeviceSetting;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    invoke-static {v6, v7}, Ll/yn0;->B(Ll/yn0;Lcom/idv/identity/platform/config/DeviceSetting;)I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    array-length v7, p1

    .line 33
    invoke-static {p1, v5, v7}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v7, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 63
    .line 64
    iget-object v3, v3, Ll/yn0$d;->b:Ll/yn0;

    .line 65
    .line 66
    invoke-virtual {v3}, Ll/yn0;->m()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {v1, v3}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    iget-object v7, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 85
    .line 86
    iget-object v7, v7, Ll/yn0$d;->b:Ll/yn0;

    .line 87
    .line 88
    invoke-virtual {v7}, Ll/yn0;->m()I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    if-eq v3, v7, :cond_0

    .line 93
    .line 94
    iget-object v3, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 95
    .line 96
    iget-object v3, v3, Ll/yn0$d;->b:Ll/yn0;

    .line 97
    .line 98
    invoke-virtual {v3}, Ll/yn0;->m()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-static {p1, v3}, Ll/ac00;->m(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    goto :goto_0

    .line 107
    :catch_0
    move-exception v0

    .line 108
    move-object p1, v0

    .line 109
    goto :goto_1

    .line 110
    :cond_0
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object p2, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 136
    .line 137
    iget-object p2, p2, Ll/yn0$d;->b:Ll/yn0;

    .line 138
    .line 139
    invoke-virtual {p2}, Ll/yn0;->m()I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-static {v1, p2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    new-instance v11, Landroid/graphics/Matrix;

    .line 154
    .line 155
    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    .line 156
    .line 157
    .line 158
    int-to-float p2, v6

    .line 159
    invoke-virtual {v11, p2}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 163
    .line 164
    .line 165
    move-result v9

    .line 166
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 167
    .line 168
    .line 169
    move-result v10

    .line 170
    const/4 v12, 0x0

    .line 171
    const/4 v7, 0x0

    .line 172
    const/4 v8, 0x0

    .line 173
    move-object v6, p1

    .line 174
    invoke-static/range {v6 .. v12}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-nez p2, :cond_1

    .line 183
    .line 184
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 185
    .line 186
    .line 187
    :cond_1
    iget-object p2, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 188
    .line 189
    iget-object p2, p2, Ll/yn0$d;->a:Ll/iql;

    .line 190
    .line 191
    if-eqz p2, :cond_2

    .line 192
    .line 193
    invoke-interface {p2, p1, v5}, Ll/iql;->a(Landroid/graphics/Bitmap;Z)V

    .line 194
    .line 195
    .line 196
    :cond_2
    iget-object p1, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 197
    .line 198
    iget-object p1, p1, Ll/yn0$d;->b:Ll/yn0;

    .line 199
    .line 200
    invoke-static {p1}, Ll/yn0;->C(Ll/yn0;)Landroid/hardware/Camera;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 208
    .line 209
    iget-object p1, p1, Ll/yn0$d;->b:Ll/yn0;

    .line 210
    .line 211
    invoke-virtual {p1, v4}, Ll/yn0;->k(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    .line 216
    .line 217
    const-string p2, "taken photo exception, image data null"

    .line 218
    .line 219
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    :goto_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 224
    .line 225
    .line 226
    move-result-object p2

    .line 227
    invoke-virtual {p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 228
    .line 229
    .line 230
    iget-object p1, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 231
    .line 232
    iget-object p1, p1, Ll/yn0$d;->a:Ll/iql;

    .line 233
    .line 234
    if-eqz p1, :cond_4

    .line 235
    .line 236
    const/4 p2, 0x0

    .line 237
    invoke-interface {p1, p2, v5}, Ll/iql;->a(Landroid/graphics/Bitmap;Z)V

    .line 238
    .line 239
    .line 240
    :cond_4
    iget-object p1, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 241
    .line 242
    iget-object p1, p1, Ll/yn0$d;->b:Ll/yn0;

    .line 243
    .line 244
    invoke-static {p1}, Ll/yn0;->C(Ll/yn0;)Landroid/hardware/Camera;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-virtual {p1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 249
    .line 250
    .line 251
    iget-object p0, p0, Ll/yn0$d$a;->a:Ll/yn0$d;

    .line 252
    .line 253
    iget-object p0, p0, Ll/yn0$d;->b:Ll/yn0;

    .line 254
    .line 255
    invoke-virtual {p0, v4}, Ll/yn0;->k(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    return-void
.end method
