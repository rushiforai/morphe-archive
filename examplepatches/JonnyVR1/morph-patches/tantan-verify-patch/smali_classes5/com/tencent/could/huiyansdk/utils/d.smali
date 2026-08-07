.class public Lcom/tencent/could/huiyansdk/utils/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tencent/could/huiyansdk/entity/HostEntity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/could/huiyansdk/utils/d$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/utils/d$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/could/huiyansdk/utils/d;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Landroid/content/res/Resources;)Landroid/graphics/drawable/AnimationDrawable;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 8
    .line 9
    .line 10
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_00:I

    .line 11
    .line 12
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/16 v3, 0x78

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 19
    .line 20
    .line 21
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_01:I

    .line 22
    .line 23
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 28
    .line 29
    .line 30
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_02:I

    .line 31
    .line 32
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 37
    .line 38
    .line 39
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_03:I

    .line 40
    .line 41
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 46
    .line 47
    .line 48
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_04:I

    .line 49
    .line 50
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 55
    .line 56
    .line 57
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_05:I

    .line 58
    .line 59
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 64
    .line 65
    .line 66
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_06:I

    .line 67
    .line 68
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 73
    .line 74
    .line 75
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_07:I

    .line 76
    .line 77
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 82
    .line 83
    .line 84
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_08:I

    .line 85
    .line 86
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 91
    .line 92
    .line 93
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_09:I

    .line 94
    .line 95
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 100
    .line 101
    .line 102
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_10:I

    .line 103
    .line 104
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 109
    .line 110
    .line 111
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_11:I

    .line 112
    .line 113
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 118
    .line 119
    .line 120
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_12:I

    .line 121
    .line 122
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 127
    .line 128
    .line 129
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_13:I

    .line 130
    .line 131
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 136
    .line 137
    .line 138
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_14:I

    .line 139
    .line 140
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 145
    .line 146
    .line 147
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_15:I

    .line 148
    .line 149
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 154
    .line 155
    .line 156
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_16:I

    .line 157
    .line 158
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 163
    .line 164
    .line 165
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_17:I

    .line 166
    .line 167
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 172
    .line 173
    .line 174
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_18:I

    .line 175
    .line 176
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 181
    .line 182
    .line 183
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_19:I

    .line 184
    .line 185
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 190
    .line 191
    .line 192
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_20:I

    .line 193
    .line 194
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 199
    .line 200
    .line 201
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_21:I

    .line 202
    .line 203
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 208
    .line 209
    .line 210
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_22:I

    .line 211
    .line 212
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 217
    .line 218
    .line 219
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_23:I

    .line 220
    .line 221
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 226
    .line 227
    .line 228
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_24:I

    .line 229
    .line 230
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 235
    .line 236
    .line 237
    sget v2, Lcom/tencent/cloud/overseas/R$drawable;->txy_huiyan_loading_result_25:I

    .line 238
    .line 239
    invoke-static {p0, v2, v0}, Ll/u1l0;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Ll/u1l0;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-virtual {v1, p0, v3}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 244
    .line 245
    .line 246
    return-object v1
.end method

.method public static a(I)Ljava/lang/String;
    .locals 1

    .line 258
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 259
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->a()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    .line 260
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 261
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    move-result-object v0

    .line 262
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const-string v1, "connectivity"

    .line 250
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    if-nez v1, :cond_1

    return-object v0

    .line 251
    :cond_1
    const-string v2, "android.permission.READ_PHONE_STATE"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/tencent/could/huiyansdk/utils/f;->a(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    return-object v0

    .line 252
    :cond_2
    const-string v2, "android.permission.ACCESS_NETWORK_STATE"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/tencent/could/huiyansdk/utils/f;->a(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    return-object v0

    :cond_3
    const/4 v2, 0x1

    .line 253
    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 254
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 255
    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-eq v1, v2, :cond_4

    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v1, v2, :cond_5

    :cond_4
    const-string p0, "WI-FI"

    return-object p0

    :cond_5
    const-string v1, "phone"

    .line 256
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 257
    :try_start_0
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v0, 0x14

    if-eq p0, v0, :cond_6

    packed-switch p0, :pswitch_data_0

    const-string p0, "Mobile"

    return-object p0

    :pswitch_0
    const-string p0, "4G"

    return-object p0

    :pswitch_1
    const-string p0, "3G"

    return-object p0

    :pswitch_2
    const-string p0, "2G"

    return-object p0

    :cond_6
    const-string p0, "5G"

    return-object p0

    :catch_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 247
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getCurrentToken()Ljava/lang/String;

    move-result-object v0

    .line 248
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 249
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "?token="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    const-string v2, "HYOConstUtils"

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 13
    .line 14
    const-string v0, "file path is empty!"

    .line 15
    .line 16
    invoke-virtual {p0, v3, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 32
    .line 33
    const-string v0, "file is not exists!"

    .line 34
    .line 35
    invoke-virtual {p0, v3, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v1

    .line 39
    :cond_1
    :try_start_0
    new-instance p0, Ljava/io/BufferedInputStream;

    .line 40
    .line 41
    new-instance v4, Ljava/io/FileInputStream;

    .line 42
    .line 43
    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    :try_start_1
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 52
    .line 53
    .line 54
    move-result-wide v5

    .line 55
    long-to-int v0, v5

    .line 56
    invoke-direct {v4, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    .line 58
    .line 59
    const/16 v0, 0x400

    .line 60
    .line 61
    :try_start_2
    new-array v5, v0, [B

    .line 62
    .line 63
    :goto_0
    const/4 v6, 0x0

    .line 64
    invoke-virtual {p0, v5, v6, v0}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    const/4 v8, -0x1

    .line 69
    if-eq v8, v7, :cond_2

    .line 70
    .line 71
    invoke-virtual {v4, v5, v6, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception v0

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    :try_start_3
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    .line 87
    .line 88
    :try_start_4
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 89
    .line 90
    .line 91
    return-object v0

    .line 92
    :catch_0
    move-exception p0

    .line 93
    goto :goto_5

    .line 94
    :catchall_1
    move-exception v0

    .line 95
    goto :goto_3

    .line 96
    :goto_1
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 97
    :catchall_2
    move-exception v5

    .line 98
    :try_start_6
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :catchall_3
    move-exception v4

    .line 103
    :try_start_7
    invoke-virtual {v0, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    :goto_2
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 107
    :goto_3
    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 108
    :catchall_4
    move-exception v4

    .line 109
    :try_start_9
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 110
    .line 111
    .line 112
    goto :goto_4

    .line 113
    :catchall_5
    move-exception p0

    .line 114
    :try_start_a
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 115
    .line 116
    .line 117
    :goto_4
    throw v4
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    .line 118
    :goto_5
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 119
    .line 120
    new-instance v4, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v5, "create video base64 error: "

    .line 123
    .line 124
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {v0, v3, v2, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-object v1
.end method
