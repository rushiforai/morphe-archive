.class public final Lcom/appsflyer/internal/AFd1oSDK;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/AFd1oSDK$AFa1zSDK;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field private static areAllFieldsValid:I = 0x0

.field private static component2:C = '\u0000'

.field private static component3:I = 0x1

.field private static component4:C

.field private static getCurrencyIso4217Code:C

.field private static getMediationNetwork:C

.field private static getRevenue:J


# instance fields
.field private final AFAdRevenueData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final getMonetizationNetwork:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/appsflyer/internal/AFd1oSDK;->getCurrencyIso4217Code()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {v0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    .line 15
    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    invoke-static {v1, v1, v0, v0}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    .line 20
    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/widget/ExpandableListView;->getPackedPositionType(J)I

    .line 25
    .line 26
    .line 27
    invoke-static {}, Landroid/view/ViewConfiguration;->getEdgeSlop()I

    .line 28
    .line 29
    .line 30
    sget v0, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    .line 31
    .line 32
    add-int/lit8 v0, v0, 0xb

    .line 33
    .line 34
    rem-int/lit16 v1, v0, 0x80

    .line 35
    .line 36
    sput v1, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    .line 37
    .line 38
    rem-int/lit8 v0, v0, 0x2

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const/4 v0, 0x0

    .line 44
    throw v0
.end method

.method public constructor <init>(Ljava/util/Map;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/appsflyer/internal/AFd1oSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0}, Lcom/appsflyer/internal/AFd1oSDK;->getMonetizationNetwork()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0, p1, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private AFAdRevenueData()Ljava/lang/String;
    .locals 8
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v3, p0, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 10
    .line 11
    const-string v4, "\u4077\ue88d\u11b3\uba95\ue38b\u0c8a\ub59d\ude8e\u078a\ub092\ud999\u02b9"

    .line 12
    .line 13
    invoke-static {v1, v1}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    const v6, 0xa8fd

    .line 18
    .line 19
    .line 20
    add-int/2addr v5, v6

    .line 21
    new-array v6, v0, [Ljava/lang/Object;

    .line 22
    .line 23
    invoke-static {v4, v5, v6}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    aget-object v4, v6, v1

    .line 27
    .line 28
    check-cast v4, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 43
    .line 44
    const-string v4, "\u4074\u2a11\u949d\u7f27\ue9a6"

    .line 45
    .line 46
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    shr-int/lit8 v5, v5, 0x10

    .line 51
    .line 52
    rsub-int v5, v5, 0x6a75

    .line 53
    .line 54
    new-array v6, v0, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v4, v5, v6}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    aget-object v4, v6, v1

    .line 60
    .line 61
    check-cast v4, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    if-nez p0, :cond_0

    .line 76
    .line 77
    sget p0, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    .line 78
    .line 79
    add-int/lit8 p0, p0, 0x4d

    .line 80
    .line 81
    rem-int/lit16 p0, p0, 0x80

    .line 82
    .line 83
    sput p0, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    .line 84
    .line 85
    :try_start_1
    const-string p0, "\u4058\u30bc\ua183\u12fb\u83d0\u742e\ue506\u5611"

    .line 86
    .line 87
    invoke-static {v1}, Landroid/telephony/cdma/CdmaCellLocation;->convertQuartSecToDecDegrees(I)D

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    const-wide/16 v6, 0x0

    .line 92
    .line 93
    cmpl-double v4, v4, v6

    .line 94
    .line 95
    rsub-int v4, v4, 0x70e5

    .line 96
    .line 97
    new-array v5, v0, [Ljava/lang/Object;

    .line 98
    .line 99
    invoke-static {p0, v4, v5}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    aget-object p0, v5, v1

    .line 103
    .line 104
    check-cast p0, Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    goto :goto_0

    .line 111
    :catch_0
    move-exception p0

    .line 112
    goto :goto_3

    .line 113
    :cond_0
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    filled-new-array {v2, p0, v3}, [Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData([Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 134
    .line 135
    .line 136
    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 137
    const/4 v3, 0x4

    .line 138
    if-le v2, v3, :cond_2

    .line 139
    .line 140
    sget v4, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    .line 141
    .line 142
    add-int/lit8 v4, v4, 0xb

    .line 143
    .line 144
    rem-int/lit16 v5, v4, 0x80

    .line 145
    .line 146
    sput v5, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    .line 147
    .line 148
    rem-int/lit8 v4, v4, 0x2

    .line 149
    .line 150
    if-nez v4, :cond_1

    .line 151
    .line 152
    const/4 v3, 0x3

    .line 153
    :try_start_2
    invoke-virtual {p0, v3, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_1
    invoke-virtual {p0, v3, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_2
    :goto_1
    if-ge v2, v3, :cond_3

    .line 162
    .line 163
    add-int/lit8 v2, v2, 0x1

    .line 164
    .line 165
    const/16 v4, 0x31

    .line 166
    .line 167
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_3
    :goto_2
    const-string v2, "\u407d\uf79c\u2fae"

    .line 172
    .line 173
    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatTimeout()I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    shr-int/lit8 v3, v3, 0x10

    .line 178
    .line 179
    const v4, 0xb7ef

    .line 180
    .line 181
    .line 182
    sub-int/2addr v4, v3

    .line 183
    new-array v3, v0, [Ljava/lang/Object;

    .line 184
    .line 185
    invoke-static {v2, v4, v3}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    aget-object v2, v3, v1

    .line 189
    .line 190
    check-cast v2, Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 203
    return-object p0

    .line 204
    :goto_3
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    const/4 v3, 0x0

    .line 209
    cmpl-float v2, v2, v3

    .line 210
    .line 211
    add-int/lit8 v2, v2, 0x27

    .line 212
    .line 213
    new-array v3, v0, [Ljava/lang/Object;

    .line 214
    .line 215
    const-string v4, "\ud5e9\u20e8\uf147\uef2e\u643c\u80a4\u4235\ua97c\udb0e\u9649\u8ad1\ubc1c\u6b48\uf770\ube02\u50d3\ud5e9\u20e8\u3f5e\u551f\u5b24\u60c5\uccc9\u8965\u8855\u16eb\udc8c\u0598\uf350\u649e\u57d9\uba60\uf350\u649e\udb0e\u9649\ufc59\uce3a\u7890\u84bf"

    .line 216
    .line 217
    invoke-static {v4, v2, v3}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    aget-object v2, v3, v1

    .line 221
    .line 222
    check-cast v2, Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-static {v2, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    new-instance v2, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .line 235
    .line 236
    const v3, 0xb0b1

    .line 237
    .line 238
    .line 239
    invoke-static {v1, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    sub-int/2addr v3, v4

    .line 244
    new-array v4, v0, [Ljava/lang/Object;

    .line 245
    .line 246
    const-string v5, "\u4070\uf0c6\u211d\u5269\u82b7\u3307\u6410\u94a6\uc5fb\u7641\ua699\ud7ff\u083b\ub89f\ue9d1\u1a27\u4b61\ufbf7\u2c0f\u5d50\u8da4\u3eb3\u6f4b\u9f94\ud0f7\u017f\ub19b\ue2d4\u133e\u4473\uf488\u251c\u564e\u86a4\u37f1\u6855\u9886\uc9ea\u7a3f\uaa8f\udb84\u0c6f"

    .line 247
    .line 248
    invoke-static {v5, v3, v4}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    aget-object v3, v4, v1

    .line 252
    .line 253
    check-cast v3, Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    rsub-int/lit8 p0, p0, 0x7

    .line 277
    .line 278
    new-array v0, v0, [Ljava/lang/Object;

    .line 279
    .line 280
    const-string v2, "\uf350\u649e\u0652\ud436\ubc3c\u1faf\ud235\uc50c"

    .line 281
    .line 282
    invoke-static {v2, p0, v0}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 283
    .line 284
    .line 285
    aget-object p0, v0, v1

    .line 286
    .line 287
    check-cast p0, Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    return-object p0
.end method

.method private static varargs AFAdRevenueData([Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 8
    .param p0    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 294
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 295
    array-length v1, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x3

    if-ge v2, v3, :cond_1

    .line 296
    sget v3, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    add-int/lit8 v3, v3, 0x5d

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    rem-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_0

    aget-object v3, p0, v2

    .line 297
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x6e

    goto :goto_0

    .line 298
    :cond_0
    aget-object v3, p0, v2

    .line 299
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 300
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 301
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 302
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move v4, v1

    :goto_1
    if-ge v4, v0, :cond_4

    .line 303
    sget v5, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    add-int/lit8 v5, v5, 0x13

    rem-int/lit16 v5, v5, 0x80

    sput v5, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    add-int/lit8 v5, v5, 0x35

    .line 304
    rem-int/lit16 v5, v5, 0x80

    sput v5, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    const/4 v5, 0x0

    move v6, v1

    :goto_2
    if-ge v6, v3, :cond_3

    .line 305
    aget-object v7, p0, v6

    .line 306
    invoke-virtual {v7, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-nez v5, :cond_2

    .line 307
    sget v5, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    add-int/lit8 v5, v5, 0xb

    rem-int/lit16 v5, v5, 0x80

    sput v5, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    goto :goto_3

    .line 308
    :cond_2
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    xor-int/2addr v7, v5

    :goto_3
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 309
    :cond_3
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    .line 310
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_4
    return-object v2
.end method

.method private static a(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 10

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x3f

    .line 10
    .line 11
    rem-int/lit16 v0, v0, 0x80

    .line 12
    .line 13
    sput v0, Lcom/appsflyer/internal/AFd1oSDK;->$11:I

    .line 14
    .line 15
    :cond_0
    check-cast p0, [C

    .line 16
    .line 17
    new-instance v0, Lcom/appsflyer/internal/AFj1cSDK;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/appsflyer/internal/AFj1cSDK;-><init>()V

    .line 20
    .line 21
    .line 22
    iput p1, v0, Lcom/appsflyer/internal/AFj1cSDK;->getMediationNetwork:I

    .line 23
    .line 24
    array-length p1, p0

    .line 25
    new-array v1, p1, [J

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    iput v2, v0, Lcom/appsflyer/internal/AFj1cSDK;->AFAdRevenueData:I

    .line 29
    .line 30
    :goto_0
    iget v3, v0, Lcom/appsflyer/internal/AFj1cSDK;->AFAdRevenueData:I

    .line 31
    .line 32
    array-length v4, p0

    .line 33
    if-ge v3, v4, :cond_1

    .line 34
    .line 35
    sget v4, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 36
    .line 37
    add-int/lit8 v4, v4, 0x3d

    .line 38
    .line 39
    rem-int/lit16 v4, v4, 0x80

    .line 40
    .line 41
    sput v4, Lcom/appsflyer/internal/AFd1oSDK;->$11:I

    .line 42
    .line 43
    aget-char v4, p0, v3

    .line 44
    .line 45
    int-to-long v4, v4

    .line 46
    int-to-long v6, v3

    .line 47
    iget v8, v0, Lcom/appsflyer/internal/AFj1cSDK;->getMediationNetwork:I

    .line 48
    .line 49
    int-to-long v8, v8

    .line 50
    mul-long/2addr v6, v8

    .line 51
    xor-long/2addr v4, v6

    .line 52
    sget-wide v6, Lcom/appsflyer/internal/AFd1oSDK;->getRevenue:J

    .line 53
    .line 54
    const-wide v8, 0x1f052e719890798eL

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    xor-long/2addr v6, v8

    .line 60
    xor-long/2addr v4, v6

    .line 61
    aput-wide v4, v1, v3

    .line 62
    .line 63
    add-int/lit8 v3, v3, 0x1

    .line 64
    .line 65
    iput v3, v0, Lcom/appsflyer/internal/AFj1cSDK;->AFAdRevenueData:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    new-array p1, p1, [C

    .line 69
    .line 70
    iput v2, v0, Lcom/appsflyer/internal/AFj1cSDK;->AFAdRevenueData:I

    .line 71
    .line 72
    :goto_1
    iget v3, v0, Lcom/appsflyer/internal/AFj1cSDK;->AFAdRevenueData:I

    .line 73
    .line 74
    array-length v4, p0

    .line 75
    if-ge v3, v4, :cond_3

    .line 76
    .line 77
    sget v4, Lcom/appsflyer/internal/AFd1oSDK;->$11:I

    .line 78
    .line 79
    add-int/lit8 v4, v4, 0x5f

    .line 80
    .line 81
    rem-int/lit16 v5, v4, 0x80

    .line 82
    .line 83
    sput v5, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 84
    .line 85
    rem-int/lit8 v4, v4, 0x2

    .line 86
    .line 87
    if-eqz v4, :cond_2

    .line 88
    .line 89
    aget-wide v4, v1, v3

    .line 90
    .line 91
    long-to-int v4, v4

    .line 92
    int-to-char v4, v4

    .line 93
    aput-char v4, p1, v3

    .line 94
    .line 95
    add-int/lit8 v3, v3, -0x1

    .line 96
    .line 97
    :goto_2
    iput v3, v0, Lcom/appsflyer/internal/AFj1cSDK;->AFAdRevenueData:I

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    aget-wide v4, v1, v3

    .line 101
    .line 102
    long-to-int v4, v4

    .line 103
    int-to-char v4, v4

    .line 104
    aput-char v4, p1, v3

    .line 105
    .line 106
    add-int/lit8 v3, v3, 0x1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_3
    new-instance p0, Ljava/lang/String;

    .line 110
    .line 111
    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([C)V

    .line 112
    .line 113
    .line 114
    aput-object p0, p2, v2

    .line 115
    .line 116
    return-void
.end method

.method private static b(Ljava/lang/String;I[Ljava/lang/Object;)V
    .locals 18

    .line 1
    sget v0, Lcom/appsflyer/internal/AFd1oSDK;->$11:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x47

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    rem-int/2addr v0, v1

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toCharArray()[C

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v2, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x9

    .line 22
    .line 23
    rem-int/lit16 v2, v2, 0x80

    .line 24
    .line 25
    sput v2, Lcom/appsflyer/internal/AFd1oSDK;->$11:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object/from16 v0, p0

    .line 29
    .line 30
    :goto_0
    check-cast v0, [C

    .line 31
    .line 32
    new-instance v2, Lcom/appsflyer/internal/AFj1aSDK;

    .line 33
    .line 34
    invoke-direct {v2}, Lcom/appsflyer/internal/AFj1aSDK;-><init>()V

    .line 35
    .line 36
    .line 37
    array-length v3, v0

    .line 38
    new-array v3, v3, [C

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    iput v4, v2, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 42
    .line 43
    new-array v5, v1, [C

    .line 44
    .line 45
    :goto_1
    iget v6, v2, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 46
    .line 47
    array-length v7, v0

    .line 48
    if-ge v6, v7, :cond_2

    .line 49
    .line 50
    aget-char v7, v0, v6

    .line 51
    .line 52
    aput-char v7, v5, v4

    .line 53
    .line 54
    add-int/lit8 v6, v6, 0x1

    .line 55
    .line 56
    aget-char v6, v0, v6

    .line 57
    .line 58
    const/4 v7, 0x1

    .line 59
    aput-char v6, v5, v7

    .line 60
    .line 61
    const v6, 0xe370

    .line 62
    .line 63
    .line 64
    move v8, v4

    .line 65
    :goto_2
    const/16 v9, 0x10

    .line 66
    .line 67
    if-ge v8, v9, :cond_1

    .line 68
    .line 69
    sget v9, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 70
    .line 71
    add-int/lit8 v9, v9, 0x29

    .line 72
    .line 73
    rem-int/lit16 v9, v9, 0x80

    .line 74
    .line 75
    sput v9, Lcom/appsflyer/internal/AFd1oSDK;->$11:I

    .line 76
    .line 77
    aget-char v10, v5, v7

    .line 78
    .line 79
    aget-char v11, v5, v4

    .line 80
    .line 81
    add-int v12, v11, v6

    .line 82
    .line 83
    shl-int/lit8 v13, v11, 0x4

    .line 84
    .line 85
    sget-char v14, Lcom/appsflyer/internal/AFd1oSDK;->component4:C

    .line 86
    .line 87
    int-to-long v14, v14

    .line 88
    const-wide v16, -0x41032948b4d0744bL    # -2.7502760257546328E-5

    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    xor-long v14, v14, v16

    .line 94
    .line 95
    long-to-int v14, v14

    .line 96
    int-to-char v14, v14

    .line 97
    add-int/2addr v13, v14

    .line 98
    xor-int/2addr v12, v13

    .line 99
    ushr-int/lit8 v13, v11, 0x5

    .line 100
    .line 101
    sget-char v14, Lcom/appsflyer/internal/AFd1oSDK;->component2:C

    .line 102
    .line 103
    int-to-long v14, v14

    .line 104
    xor-long v14, v14, v16

    .line 105
    .line 106
    long-to-int v14, v14

    .line 107
    int-to-char v14, v14

    .line 108
    add-int/2addr v13, v14

    .line 109
    xor-int/2addr v12, v13

    .line 110
    sub-int/2addr v10, v12

    .line 111
    int-to-char v10, v10

    .line 112
    aput-char v10, v5, v7

    .line 113
    .line 114
    add-int v12, v10, v6

    .line 115
    .line 116
    shl-int/lit8 v13, v10, 0x4

    .line 117
    .line 118
    sget-char v14, Lcom/appsflyer/internal/AFd1oSDK;->getMediationNetwork:C

    .line 119
    .line 120
    int-to-long v14, v14

    .line 121
    xor-long v14, v14, v16

    .line 122
    .line 123
    long-to-int v14, v14

    .line 124
    int-to-char v14, v14

    .line 125
    add-int/2addr v13, v14

    .line 126
    xor-int/2addr v12, v13

    .line 127
    ushr-int/lit8 v10, v10, 0x5

    .line 128
    .line 129
    sget-char v13, Lcom/appsflyer/internal/AFd1oSDK;->getCurrencyIso4217Code:C

    .line 130
    .line 131
    int-to-long v13, v13

    .line 132
    xor-long v13, v13, v16

    .line 133
    .line 134
    long-to-int v13, v13

    .line 135
    int-to-char v13, v13

    .line 136
    add-int/2addr v10, v13

    .line 137
    xor-int/2addr v10, v12

    .line 138
    sub-int/2addr v11, v10

    .line 139
    int-to-char v10, v11

    .line 140
    aput-char v10, v5, v4

    .line 141
    .line 142
    const v10, 0x9e37

    .line 143
    .line 144
    .line 145
    sub-int/2addr v6, v10

    .line 146
    add-int/lit8 v8, v8, 0x1

    .line 147
    .line 148
    add-int/lit8 v9, v9, 0x49

    .line 149
    .line 150
    rem-int/lit16 v9, v9, 0x80

    .line 151
    .line 152
    sput v9, Lcom/appsflyer/internal/AFd1oSDK;->$10:I

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_1
    iget v6, v2, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 156
    .line 157
    aget-char v8, v5, v4

    .line 158
    .line 159
    aput-char v8, v3, v6

    .line 160
    .line 161
    add-int/lit8 v8, v6, 0x1

    .line 162
    .line 163
    aget-char v7, v5, v7

    .line 164
    .line 165
    aput-char v7, v3, v8

    .line 166
    .line 167
    add-int/2addr v6, v1

    .line 168
    iput v6, v2, Lcom/appsflyer/internal/AFj1aSDK;->getCurrencyIso4217Code:I

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_2
    new-instance v0, Ljava/lang/String;

    .line 172
    .line 173
    move/from16 v1, p1

    .line 174
    .line 175
    invoke-direct {v0, v3, v4, v1}, Ljava/lang/String;-><init>([CII)V

    .line 176
    .line 177
    .line 178
    aput-object v0, p2, v4

    .line 179
    .line 180
    return-void

    .line 181
    :cond_3
    const/4 v0, 0x0

    .line 182
    throw v0
.end method

.method public static getCurrencyIso4217Code()V
    .locals 2

    .line 1
    const-wide v0, -0x5d9ca6e09cd1c668L    # -4.958281520047446E-143

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    sput-wide v0, Lcom/appsflyer/internal/AFd1oSDK;->getRevenue:J

    .line 7
    .line 8
    const v0, 0x9852

    .line 9
    .line 10
    .line 11
    sput-char v0, Lcom/appsflyer/internal/AFd1oSDK;->getMediationNetwork:C

    .line 12
    .line 13
    const v0, 0xf86e

    .line 14
    .line 15
    .line 16
    sput-char v0, Lcom/appsflyer/internal/AFd1oSDK;->getCurrencyIso4217Code:C

    .line 17
    .line 18
    const/16 v0, 0x9ee

    .line 19
    .line 20
    sput-char v0, Lcom/appsflyer/internal/AFd1oSDK;->component4:C

    .line 21
    .line 22
    const/16 v0, 0x4ada

    .line 23
    .line 24
    sput-char v0, Lcom/appsflyer/internal/AFd1oSDK;->component2:C

    .line 25
    .line 26
    return-void
.end method

.method private getMonetizationNetwork()Ljava/lang/String;
    .locals 12

    .line 1
    const-string v0, "\u8ad1\ubc1c\u6b48\uf770\ube02\u50d3\ud5e9\u20e8\u3f5e\u551f\u5b24\u60c5\uccc9\u8965\u8855\u16eb\udc8c\u0598\uf350\u649e\u57d9\uba60\u4f71\u4caf\uffdf\uc128\u8671\uaa06\ufc59\uce3a\u7890\u84bf\u25af\u1bec\u4361\u109d\ub05d\u796a\u790e\u747f\ua670\u0617\u2849\u1c5c"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/16 v2, 0x10

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    :try_start_0
    iget-object v5, p0, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 10
    .line 11
    const-string v6, "\u4077\ue88d\u11b3\uba95\ue38b\u0c8a\ub59d\ude8e\u078a\ub092\ud999\u02b9"

    .line 12
    .line 13
    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    const v8, 0xa8fd

    .line 18
    .line 19
    .line 20
    add-int/2addr v7, v8

    .line 21
    new-array v8, v3, [Ljava/lang/Object;

    .line 22
    .line 23
    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    aget-object v6, v8, v4

    .line 27
    .line 28
    check-cast v6, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    iget-object v6, p0, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 43
    .line 44
    const-string v7, "\u4070\uc1a0\u43da\uc5f8\u471e\uc901\u4b4d\ucd7a\u4e80\ud0a2\u52c8\ud4c7\u5603\ud831\u5a41"

    .line 45
    .line 46
    invoke-static {v1, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    const v9, 0x81df

    .line 51
    .line 52
    .line 53
    add-int/2addr v8, v9

    .line 54
    new-array v9, v3, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    aget-object v7, v9, v4

    .line 60
    .line 61
    check-cast v7, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    const-string v7, "\u6d03\uf1ef\ud7f2\ue38e\uce77\u85aa"

    .line 76
    .line 77
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    rsub-int/lit8 v8, v8, 0x6

    .line 82
    .line 83
    new-array v9, v3, [Ljava/lang/Object;

    .line 84
    .line 85
    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    aget-object v7, v9, v4

    .line 89
    .line 90
    check-cast v7, Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    const-string v8, "\u403b\ue4b5\u09d7\uae4b\ud378"

    .line 97
    .line 98
    invoke-static {v4}, Landroid/graphics/Color;->blue(I)I

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    const v10, 0xa4d1

    .line 103
    .line 104
    .line 105
    add-int/2addr v9, v10

    .line 106
    new-array v10, v3, [Ljava/lang/Object;

    .line 107
    .line 108
    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    aget-object v8, v10, v4

    .line 112
    .line 113
    check-cast v8, Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v8}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    invoke-virtual {v7, v8, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v7

    .line 123
    new-instance v8, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    invoke-static {v5}, Lcom/appsflyer/internal/AFb1iSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-virtual {v5, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    sget v5, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    .line 150
    .line 151
    add-int/lit8 v5, v5, 0x47

    .line 152
    .line 153
    rem-int/lit16 v5, v5, 0x80

    .line 154
    .line 155
    sput v5, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :catch_0
    move-exception v5

    .line 159
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumDrawingCacheSize()I

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    shr-int/lit8 v6, v6, 0x18

    .line 164
    .line 165
    rsub-int/lit8 v6, v6, 0x26

    .line 166
    .line 167
    new-array v7, v3, [Ljava/lang/Object;

    .line 168
    .line 169
    const-string v8, "\uf28e\ufc3e\u0316\u1a39\ufa09\u0963\u5d21\u1118\uc516\ue3ce\ufcc7\uf446\u7d60\u2e9e\u80a8\u790f\u0c43\u15e7\uf28e\ufc3e\ue640\u42fd\u9b5f\u90df\u790e\u747f\ufc7e\u42ec\u92e2\u3a86\u552f\u467a\uc6fe\ue62f\u5d21\u1118\uc516\ue3ce"

    .line 170
    .line 171
    invoke-static {v8, v6, v7}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    aget-object v6, v7, v4

    .line 175
    .line 176
    check-cast v6, Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    invoke-static {v6, v5}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 183
    .line 184
    .line 185
    new-instance v6, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-static {}, Landroid/os/Process;->myTid()I

    .line 191
    .line 192
    .line 193
    move-result v7

    .line 194
    shr-int/lit8 v7, v7, 0x16

    .line 195
    .line 196
    add-int/lit8 v7, v7, 0x2c

    .line 197
    .line 198
    new-array v8, v3, [Ljava/lang/Object;

    .line 199
    .line 200
    invoke-static {v0, v7, v8}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    aget-object v7, v8, v4

    .line 204
    .line 205
    check-cast v7, Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    invoke-static {v5}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    new-instance v5, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v1}, Landroid/view/KeyEvent;->keyCodeFromString(Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    add-int/lit8 v1, v1, 0x12

    .line 234
    .line 235
    new-array v6, v3, [Ljava/lang/Object;

    .line 236
    .line 237
    const-string v7, "\u5321\uf577\u366c\u3b7f\ub8a9\u3c81\uf28c\uf5be\u5f71\ue348\uaf24\u54cf\u4a88\u1d88\u8112\uf439\u66ae\uf370"

    .line 238
    .line 239
    invoke-static {v7, v1, v6}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    aget-object v1, v6, v4

    .line 243
    .line 244
    check-cast v1, Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    :goto_0
    :try_start_1
    iget-object v5, p0, Lcom/appsflyer/internal/AFd1oSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 258
    .line 259
    new-instance v6, Landroid/content/IntentFilter;

    .line 260
    .line 261
    const-string v7, "\u4077\u18f5\uf168\u49c3\u224d\ufabe\u533c\u2be3\u8417\u5c8d\u35e0\u8e7c\u66e4\u3f4b\u978e\u7034\uc8a5\ua13f\u7995\ud20e\uab7c\u03a9\udc4a\ub4fc\u0d7a\ue587\ube01\u169b\uef23\u47b0\u20d3\uf94d\u51f7\u2a75\u82eb\u5b14\u3386"

    .line 262
    .line 263
    invoke-static {v4}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    add-int/lit16 v8, v8, 0x588d

    .line 268
    .line 269
    new-array v9, v3, [Ljava/lang/Object;

    .line 270
    .line 271
    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    aget-object v7, v9, v4

    .line 275
    .line 276
    check-cast v7, Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v7

    .line 282
    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    const/4 v7, 0x0

    .line 286
    invoke-static {v5, v7, v6}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    const/16 v6, -0xa8c

    .line 291
    .line 292
    if-eqz v5, :cond_0

    .line 293
    .line 294
    const-string v7, "\u4062\u9708\uee8d\uc617\u1d9f\u7503\u4c95\ua43f\ufbbb\ud337\u2abd"

    .line 295
    .line 296
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 297
    .line 298
    .line 299
    move-result v8

    .line 300
    const v9, 0xd77b

    .line 301
    .line 302
    .line 303
    sub-int/2addr v9, v8

    .line 304
    new-array v8, v3, [Ljava/lang/Object;

    .line 305
    .line 306
    invoke-static {v7, v9, v8}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 307
    .line 308
    .line 309
    aget-object v7, v8, v4

    .line 310
    .line 311
    check-cast v7, Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v7

    .line 317
    invoke-virtual {v5, v7, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 318
    .line 319
    .line 320
    move-result v6

    .line 321
    goto :goto_1

    .line 322
    :catch_1
    move-exception p0

    .line 323
    goto/16 :goto_5

    .line 324
    .line 325
    :cond_0
    :goto_1
    iget-object v5, p0, Lcom/appsflyer/internal/AFd1oSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 326
    .line 327
    invoke-virtual {v5}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 332
    .line 333
    if-eqz v5, :cond_2

    .line 334
    .line 335
    const-string v7, "\u4f69\u323f\u8598\u425f"

    .line 336
    .line 337
    const/4 v8, 0x0

    .line 338
    invoke-static {v4, v8, v8}, Landroid/util/TypedValue;->complexToFraction(IFF)F

    .line 339
    .line 340
    .line 341
    move-result v9

    .line 342
    cmpl-float v8, v9, v8

    .line 343
    .line 344
    add-int/lit8 v8, v8, 0x3

    .line 345
    .line 346
    new-array v9, v3, [Ljava/lang/Object;

    .line 347
    .line 348
    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 349
    .line 350
    .line 351
    aget-object v7, v9, v4

    .line 352
    .line 353
    check-cast v7, Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v7

    .line 359
    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 360
    .line 361
    .line 362
    move-result v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 363
    if-eqz v5, :cond_2

    .line 364
    .line 365
    sget v5, Lcom/appsflyer/internal/AFd1oSDK;->component3:I

    .line 366
    .line 367
    add-int/lit8 v5, v5, 0x4f

    .line 368
    .line 369
    rem-int/lit16 v7, v5, 0x80

    .line 370
    .line 371
    sput v7, Lcom/appsflyer/internal/AFd1oSDK;->areAllFieldsValid:I

    .line 372
    .line 373
    rem-int/lit8 v5, v5, 0x2

    .line 374
    .line 375
    if-eqz v5, :cond_1

    .line 376
    .line 377
    goto :goto_2

    .line 378
    :cond_1
    move v5, v3

    .line 379
    goto :goto_3

    .line 380
    :cond_2
    :goto_2
    move v5, v4

    .line 381
    :goto_3
    :try_start_2
    iget-object v7, p0, Lcom/appsflyer/internal/AFd1oSDK;->getMonetizationNetwork:Landroid/content/Context;

    .line 382
    .line 383
    const-string v8, "\uc314\u3e36\u4cb6\u50d7\u7cf8\uac35"

    .line 384
    .line 385
    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    .line 386
    .line 387
    .line 388
    move-result v9

    .line 389
    add-int/lit8 v9, v9, 0x6

    .line 390
    .line 391
    new-array v10, v3, [Ljava/lang/Object;

    .line 392
    .line 393
    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 394
    .line 395
    .line 396
    aget-object v8, v10, v4

    .line 397
    .line 398
    check-cast v8, Ljava/lang/String;

    .line 399
    .line 400
    invoke-virtual {v8}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v8

    .line 404
    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v7

    .line 408
    check-cast v7, Landroid/hardware/SensorManager;

    .line 409
    .line 410
    const/4 v8, -0x1

    .line 411
    invoke-virtual {v7, v8}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 412
    .line 413
    .line 414
    move-result-object v7

    .line 415
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 416
    .line 417
    .line 418
    move-result v7

    .line 419
    new-instance v8, Ljava/lang/StringBuilder;

    .line 420
    .line 421
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 422
    .line 423
    .line 424
    const-string v9, "\u69d7\ud4cb"

    .line 425
    .line 426
    invoke-static {v4, v4, v4}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 427
    .line 428
    .line 429
    move-result v10

    .line 430
    rsub-int/lit8 v10, v10, 0x1

    .line 431
    .line 432
    new-array v11, v3, [Ljava/lang/Object;

    .line 433
    .line 434
    invoke-static {v9, v10, v11}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 435
    .line 436
    .line 437
    aget-object v9, v11, v4

    .line 438
    .line 439
    check-cast v9, Ljava/lang/String;

    .line 440
    .line 441
    invoke-virtual {v9}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v9

    .line 445
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    const-string v6, "\u136e\u5960"

    .line 452
    .line 453
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 454
    .line 455
    .line 456
    move-result v9

    .line 457
    shr-int/lit8 v9, v9, 0x8

    .line 458
    .line 459
    add-int/lit8 v9, v9, 0x2

    .line 460
    .line 461
    new-array v10, v3, [Ljava/lang/Object;

    .line 462
    .line 463
    invoke-static {v6, v9, v10}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 464
    .line 465
    .line 466
    aget-object v6, v10, v4

    .line 467
    .line 468
    check-cast v6, Ljava/lang/String;

    .line 469
    .line 470
    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v6

    .line 474
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    const-string v5, "\ubb8e\u345a"

    .line 481
    .line 482
    invoke-static {}, Landroid/view/ViewConfiguration;->getFadingEdgeLength()I

    .line 483
    .line 484
    .line 485
    move-result v6

    .line 486
    shr-int/lit8 v2, v6, 0x10

    .line 487
    .line 488
    rsub-int/lit8 v2, v2, 0x2

    .line 489
    .line 490
    new-array v6, v3, [Ljava/lang/Object;

    .line 491
    .line 492
    invoke-static {v5, v2, v6}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 493
    .line 494
    .line 495
    aget-object v2, v6, v4

    .line 496
    .line 497
    check-cast v2, Ljava/lang/String;

    .line 498
    .line 499
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v2

    .line 503
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    const-string v2, "\u44a8\ua753"

    .line 510
    .line 511
    invoke-static {v4, v4, v4}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 512
    .line 513
    .line 514
    move-result v5

    .line 515
    rsub-int/lit8 v5, v5, 0x2

    .line 516
    .line 517
    new-array v6, v3, [Ljava/lang/Object;

    .line 518
    .line 519
    invoke-static {v2, v5, v6}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 520
    .line 521
    .line 522
    aget-object v2, v6, v4

    .line 523
    .line 524
    check-cast v2, Ljava/lang/String;

    .line 525
    .line 526
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 527
    .line 528
    .line 529
    move-result-object v2

    .line 530
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    .line 532
    .line 533
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1oSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 534
    .line 535
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 536
    .line 537
    .line 538
    move-result p0

    .line 539
    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 540
    .line 541
    .line 542
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object p0

    .line 546
    new-instance v2, Ljava/lang/StringBuilder;

    .line 547
    .line 548
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 549
    .line 550
    .line 551
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    .line 553
    .line 554
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1oSDK$AFa1zSDK;->getMediationNetwork(Ljava/lang/String;)[B

    .line 555
    .line 556
    .line 557
    move-result-object p0

    .line 558
    invoke-static {p0}, Lcom/appsflyer/internal/AFd1oSDK$AFa1zSDK;->AFAdRevenueData([B)[B

    .line 559
    .line 560
    .line 561
    move-result-object p0

    .line 562
    new-instance v5, Ljava/lang/StringBuilder;

    .line 563
    .line 564
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 565
    .line 566
    .line 567
    array-length v6, p0

    .line 568
    move v7, v4

    .line 569
    :goto_4
    if-ge v7, v6, :cond_4

    .line 570
    .line 571
    aget-byte v8, p0, v7

    .line 572
    .line 573
    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v8

    .line 577
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 578
    .line 579
    .line 580
    move-result v9

    .line 581
    if-ne v9, v3, :cond_3

    .line 582
    .line 583
    const-string v9, "0"

    .line 584
    .line 585
    invoke-virtual {v9, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v8

    .line 589
    :cond_3
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    add-int/lit8 v7, v7, 0x1

    .line 593
    .line 594
    goto :goto_4

    .line 595
    :cond_4
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 596
    .line 597
    .line 598
    move-result-object p0

    .line 599
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 603
    .line 604
    .line 605
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 606
    goto :goto_6

    .line 607
    :goto_5
    const v2, 0xaa95

    .line 608
    .line 609
    .line 610
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 611
    .line 612
    .line 613
    move-result v5

    .line 614
    sub-int/2addr v2, v5

    .line 615
    new-array v5, v3, [Ljava/lang/Object;

    .line 616
    .line 617
    const-string v6, "\u4071\ueae6\u1548\ubfff\uea70\u14a9\ubf09\uea69\u14cb\ubf4e\ue9e4\u1414\ube98\ue9f5\u145f\ubedf"

    .line 618
    .line 619
    invoke-static {v6, v2, v5}, Lcom/appsflyer/internal/AFd1oSDK;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 620
    .line 621
    .line 622
    aget-object v2, v5, v4

    .line 623
    .line 624
    check-cast v2, Ljava/lang/String;

    .line 625
    .line 626
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v2

    .line 630
    invoke-static {v2, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 631
    .line 632
    .line 633
    new-instance v2, Ljava/lang/StringBuilder;

    .line 634
    .line 635
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 636
    .line 637
    .line 638
    const-wide/16 v5, 0x0

    .line 639
    .line 640
    invoke-static {v5, v6}, Landroid/widget/ExpandableListView;->getPackedPositionChild(J)I

    .line 641
    .line 642
    .line 643
    move-result v7

    .line 644
    add-int/lit8 v7, v7, 0x2d

    .line 645
    .line 646
    new-array v8, v3, [Ljava/lang/Object;

    .line 647
    .line 648
    invoke-static {v0, v7, v8}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 649
    .line 650
    .line 651
    aget-object v0, v8, v4

    .line 652
    .line 653
    check-cast v0, Ljava/lang/String;

    .line 654
    .line 655
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 656
    .line 657
    .line 658
    move-result-object v0

    .line 659
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 666
    .line 667
    .line 668
    move-result-object p0

    .line 669
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    new-instance p0, Ljava/lang/StringBuilder;

    .line 673
    .line 674
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 675
    .line 676
    .line 677
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 678
    .line 679
    .line 680
    invoke-static {}, Landroid/view/ViewConfiguration;->getGlobalActionKeyTimeout()J

    .line 681
    .line 682
    .line 683
    move-result-wide v0

    .line 684
    cmp-long v0, v0, v5

    .line 685
    .line 686
    rsub-int/lit8 v0, v0, 0x11

    .line 687
    .line 688
    new-array v1, v3, [Ljava/lang/Object;

    .line 689
    .line 690
    const-string v2, "\ufb9d\ucae4\u5456\u8973\uf786\uc55c\u181b\u4fdd\u43b4\u36c4\u96ee\uc342\u2833\u9163\u7819\ue5bd"

    .line 691
    .line 692
    invoke-static {v2, v0, v1}, Lcom/appsflyer/internal/AFd1oSDK;->b(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 693
    .line 694
    .line 695
    aget-object v0, v1, v4

    .line 696
    .line 697
    check-cast v0, Ljava/lang/String;

    .line 698
    .line 699
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v0

    .line 703
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 704
    .line 705
    .line 706
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object p0

    .line 710
    :goto_6
    return-object p0
.end method
