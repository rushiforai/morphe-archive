.class public Ll/a190;
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

.method public static a(Lcom/p1/mobile/putong/core/data/MonetizationPromotionsId;Lcom/p1/mobile/putong/core/data/Merchandise;)Ll/br2;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, -0x1

    .line 13
    sparse-switch v1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string v1, "lowPriceCustomerSVIP"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    const/16 v2, 0x9

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_1
    const-string v1, "giftDurationSVIP"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_1
    const/16 v2, 0x8

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :sswitch_2
    const-string v1, "trial7DSVIP"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 v2, 0x7

    .line 56
    goto :goto_0

    .line 57
    :sswitch_3
    const-string v1, "lowPriceODiamond"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    const/4 v2, 0x6

    .line 67
    goto :goto_0

    .line 68
    :sswitch_4
    const-string v1, "lowPriceCustomerVIP"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    const/4 v2, 0x5

    .line 78
    goto :goto_0

    .line 79
    :sswitch_5
    const-string v1, "lowPrice3Month"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    const/4 v2, 0x4

    .line 89
    goto :goto_0

    .line 90
    :sswitch_6
    const-string v1, "lowPriceCallback3VIP"

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_6

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    const/4 v2, 0x3

    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    const-string v1, "lowPriceFirstTime12MSVIP"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_7

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_7
    const/4 v2, 0x2

    .line 111
    goto :goto_0

    .line 112
    :sswitch_8
    const-string v1, "lowPriceCustomerUpliftSVIP"

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_8

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    const/4 v2, 0x1

    .line 122
    goto :goto_0

    .line 123
    :sswitch_9
    const-string v1, "lowPriceCallback3SVIP"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_9

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_9
    const/4 v2, 0x0

    .line 133
    :goto_0
    const/4 v0, 0x0

    .line 134
    packed-switch v2, :pswitch_data_0

    .line 135
    .line 136
    .line 137
    new-instance p1, Ljava/lang/Exception;

    .line 138
    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v2, "unknow Promotion== "

    .line 142
    .line 143
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 157
    .line 158
    .line 159
    return-object v0

    .line 160
    :pswitch_0
    new-instance p0, Ll/y0c;

    .line 161
    .line 162
    invoke-direct {p0, p1}, Ll/y0c;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 163
    .line 164
    .line 165
    return-object p0

    .line 166
    :pswitch_1
    return-object v0

    .line 167
    :pswitch_2
    new-instance p0, Ll/ewd0;

    .line 168
    .line 169
    invoke-direct {p0, p1}, Ll/ewd0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 170
    .line 171
    .line 172
    return-object p0

    .line 173
    :pswitch_3
    new-instance p0, Ll/i550;

    .line 174
    .line 175
    invoke-direct {p0, p1}, Ll/i550;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 176
    .line 177
    .line 178
    return-object p0

    .line 179
    :pswitch_4
    new-instance p0, Ll/z0c;

    .line 180
    .line 181
    invoke-direct {p0, p1}, Ll/z0c;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 182
    .line 183
    .line 184
    return-object p0

    .line 185
    :pswitch_5
    new-instance p0, Ll/vsl0;

    .line 186
    .line 187
    invoke-direct {p0, p1}, Ll/vsl0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 188
    .line 189
    .line 190
    return-object p0

    .line 191
    :pswitch_6
    new-instance p0, Ll/usl0;

    .line 192
    .line 193
    invoke-direct {p0, p1}, Ll/usl0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 194
    .line 195
    .line 196
    return-object p0

    .line 197
    :pswitch_7
    new-instance p0, Ll/yeh0;

    .line 198
    .line 199
    invoke-direct {p0, p1}, Ll/yeh0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 200
    .line 201
    .line 202
    return-object p0

    .line 203
    :pswitch_8
    new-instance p0, Ll/mu20;

    .line 204
    .line 205
    invoke-direct {p0, p1}, Ll/mu20;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 206
    .line 207
    .line 208
    return-object p0

    .line 209
    :pswitch_9
    new-instance p0, Ll/zvd0;

    .line 210
    .line 211
    invoke-direct {p0, p1}, Ll/zvd0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 212
    .line 213
    .line 214
    return-object p0

    .line 215
    :sswitch_data_0
    .sparse-switch
        -0x6883b7fd -> :sswitch_9
        -0x6510225d -> :sswitch_8
        -0x509190b2 -> :sswitch_7
        -0x3d2d805c -> :sswitch_6
        -0x316b675e -> :sswitch_5
        -0x1d196a36 -> :sswitch_4
        -0xe9d80a6 -> :sswitch_3
        0x1f99b5cd -> :sswitch_2
        0x44d9dfae -> :sswitch_1
        0x79eaf69d -> :sswitch_0
    .end sparse-switch

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
