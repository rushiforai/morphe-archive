.class public final Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\r\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u001f\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\"\u0010\u001e\u001a\u00020\u00188\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0013\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\"\u0010%\u001a\u00020\u001f8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0016\u0010 \u001a\u0004\u0008!\u0010\"\"\u0004\u0008#\u0010$\u00a8\u0006&"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;",
        "Landroid/widget/LinearLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "c",
        "(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V",
        "Landroid/view/View;",
        "view",
        "a",
        "(Landroid/view/View;)V",
        "",
        "b",
        "(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/CharSequence;",
        "Lv/VIcon;",
        "Lv/VIcon;",
        "get_icon",
        "()Lv/VIcon;",
        "set_icon",
        "(Lv/VIcon;)V",
        "_icon",
        "Lv/VText;",
        "Lv/VText;",
        "get_privilege",
        "()Lv/VText;",
        "set_privilege",
        "(Lv/VText;)V",
        "_privilege",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lv/VIcon;

.field public b:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hbb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    aget p0, p0, p2

    .line 8
    .line 9
    const-string p2, "\u67e5\u770b\u6d88\u606f\u662f\u5426\u5df2\u8bfb"

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    const-string p0, ""

    .line 15
    .line 16
    return-object p0

    .line 17
    :pswitch_0
    const-string p0, "\u4e0d\u8ba9\u8ddd\u79bb\u592a\u8fd1\u7684\u4eba\u770b\u5230\u6211"

    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_1
    return-object p2

    .line 21
    :pswitch_2
    const-string p0, "\u6bcf\u59291\u4e2a\u8d85\u7ea7\u559c\u6b22"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/t$a;->H()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "\u6bcf\u5929%s\u6b21\u989d\u5916\u514d\u8d39\u76f2\u76d2"

    .line 43
    .line 44
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/t$a;->I()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "\u6bcf\u5929%s\u6b21\u514d\u8d39\u627e\u642d\u5b50\u7279\u6743"

    .line 68
    .line 69
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :pswitch_5
    const-string p0, "\u4efb\u610f\u4fee\u6539\u5b9a\u4f4d"

    .line 75
    .line 76
    return-object p0

    .line 77
    :pswitch_6
    const-string p0, "\u7cbe\u9009\u5c55\u793a\u7537\u6027\u7528\u6237\u63a2\u63a2\u4fe1\u7528\u5206"

    .line 78
    .line 79
    return-object p0

    .line 80
    :pswitch_7
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    const-string p1, "\u4ed6"

    .line 85
    .line 86
    if-eqz p0, :cond_1

    .line 87
    .line 88
    invoke-static {}, Ll/c17;->u0()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_0

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    const-string p1, "\u5979"

    .line 96
    .line 97
    :cond_1
    :goto_0
    const-string p0, "\u89e3\u9501\u66f4\u4e86\u89e3%s\u6a21\u5757"

    .line 98
    .line 99
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0

    .line 108
    :pswitch_8
    const-string p0, "\u5e7f\u544a\u514d\u6253\u6270"

    .line 109
    .line 110
    return-object p0

    .line 111
    :pswitch_9
    const-string p0, "\u76f4\u63a5\u5c4f\u853d\u9a9a\u6270\u8bcd"

    .line 112
    .line 113
    return-object p0

    .line 114
    :pswitch_a
    const-string p0, "\u9644\u8fd1\u7684\u4eba"

    .line 115
    .line 116
    return-object p0

    .line 117
    :pswitch_b
    const-string p0, "\u9690\u85cf\u6211\u7684\u8bbf\u95ee\u8db3\u8ff9"

    .line 118
    .line 119
    return-object p0

    .line 120
    :pswitch_c
    const-string p0, "\u63a2\u63a2SVIP\u4f1a\u5458\u6240\u6709\u6743\u76ca"

    .line 121
    .line 122
    return-object p0

    .line 123
    :pswitch_d
    const-string p0, "\u76f4\u64ad\u95f4\u5fbd\u7ae0 \u5165\u573a\u7279\u6548"

    .line 124
    .line 125
    return-object p0

    .line 126
    :pswitch_e
    const-string p0, "\u65e0\u9650\u6253\u62db\u547c"

    .line 127
    .line 128
    return-object p0

    .line 129
    :pswitch_f
    const-string p0, "\u6bcf\u65e5\u5fc3\u52a8"

    .line 130
    .line 131
    return-object p0

    .line 132
    :pswitch_10
    const-string p0, "\u4e13\u5c5e\u5ba2\u670d"

    .line 133
    .line 134
    return-object p0

    .line 135
    :pswitch_11
    const-string p0, "\u9ed1\u91d1\u4e13\u5c5e\u76ae\u80a4"

    .line 136
    .line 137
    return-object p0

    .line 138
    :pswitch_12
    const-string p0, "\u6211\u7684\u8bbf\u5ba2"

    .line 139
    .line 140
    return-object p0

    .line 141
    :pswitch_13
    const-string p0, "\u4e00\u952e\u914d\u5bf9"

    .line 142
    .line 143
    return-object p0

    .line 144
    :pswitch_14
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-eqz p0, :cond_2

    .line 149
    .line 150
    const-string p0, "\u5168\u7a0b\u52a8\u6001\u8d85\u7ea7\u66dd\u5149"

    .line 151
    .line 152
    return-object p0

    .line 153
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->h8()I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    const-string p1, "\u6bcf\u6708%s\u6b21\u52a8\u6001\u8d85\u7ea7\u66dd\u5149"

    .line 170
    .line 171
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :pswitch_15
    const-string p0, "\u6bcf\u59295\u6761\"\u8d44\u6599\u7559\u8a00\""

    .line 177
    .line 178
    return-object p0

    .line 179
    :pswitch_16
    const-string p0, "\u53ef\u63a7\u8eab\u4efd\u6807\u8bc6"

    .line 180
    .line 181
    return-object p0

    .line 182
    :pswitch_17
    const-string p0, "\u4e13\u5c5e\u793c\u7269"

    .line 183
    .line 184
    return-object p0

    .line 185
    :pswitch_18
    return-object p2

    .line 186
    :pswitch_19
    const-string p0, "\u627e\u56de\u6211\u89e3\u9664\u7684\u914d\u5bf9"

    .line 187
    .line 188
    return-object p0

    .line 189
    :pswitch_1a
    const-string p0, "\u9690\u79c1\u4fdd\u62a4"

    .line 190
    .line 191
    return-object p0

    .line 192
    :pswitch_1b
    const-string p0, "\u9ad8\u7ea7\u7b5b\u9009"

    .line 193
    .line 194
    return-object p0

    .line 195
    :pswitch_1c
    const-string p0, "\u6bcf\u59293\u6b21\u6253\u62db\u547c"

    .line 196
    .line 197
    return-object p0

    .line 198
    :pswitch_1d
    const-string p0, "\u8bed\u97f3\u95ea\u804a"

    .line 199
    .line 200
    return-object p0

    .line 201
    :pswitch_1e
    const-string p0, "\u89e3\u9501\u6211\u559c\u6b22\u8fc7\u7684\u4eba"

    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_1f
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    if-eqz p0, :cond_3

    .line 209
    .line 210
    const-string p0, "\u5168\u7a0b\u4f18\u5148\u63a8\u8350"

    .line 211
    .line 212
    return-object p0

    .line 213
    :cond_3
    const-string p0, "\u6bcf\u67083\u6b21\u4f18\u5148\u63a8\u8350"

    .line 214
    .line 215
    return-object p0

    .line 216
    :pswitch_20
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_4

    .line 221
    .line 222
    const-string p0, "\u65e0\u9650\u6b21\u5728\u7ebf\u95ea\u804a"

    .line 223
    .line 224
    return-object p0

    .line 225
    :cond_4
    const-string p0, "\u95ea\u804a\u914d\u5bf9"

    .line 226
    .line 227
    return-object p0

    .line 228
    :pswitch_21
    const-string p0, "\u89e3\u5bc6\u8c01\u559c\u6b22\u6211"

    .line 229
    .line 230
    return-object p0

    .line 231
    :pswitch_22
    const-string p0, "\u4f1a\u5458\u6807\u8bc6"

    .line 232
    .line 233
    return-object p0

    .line 234
    :pswitch_23
    const-string p0, "\u4fee\u6539\u5b9a\u4f4d"

    .line 235
    .line 236
    return-object p0

    .line 237
    :pswitch_24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    if-eqz p0, :cond_5

    .line 250
    .line 251
    const-string p0, "\u53cd\u6094\u7279\u6743"

    .line 252
    .line 253
    return-object p0

    .line 254
    :cond_5
    const-string p0, "\u6ed1\u9519\u53cd\u6094"

    .line 255
    .line 256
    return-object p0

    .line 257
    :pswitch_25
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    if-eqz p0, :cond_6

    .line 262
    .line 263
    const-string p0, "\u65e0\u9650\u6b21\u8d85\u7ea7\u559c\u6b22"

    .line 264
    .line 265
    return-object p0

    .line 266
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 267
    .line 268
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->g1:I

    .line 269
    .line 270
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    .line 276
    .line 277
    return-object p0

    .line 278
    :pswitch_26
    const-string p0, "\u65e0\u9650\u53f3\u6ed1"

    .line 279
    .line 280
    return-object p0

    .line 281
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
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

.method public final c(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->get_icon()Lv/VIcon;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/jbc0;->a7:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->get_privilege()Lv/VText;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "#CCFFDEA2"

    .line 27
    .line 28
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->get_icon()Lv/VIcon;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/jbc0;->Z6:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->get_privilege()Lv/VText;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget v2, Ll/h9c0;->g:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->get_privilege()Lv/VText;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/CharSequence;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final get_icon()Lv/VIcon;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->a:Lv/VIcon;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_icon"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_privilege()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_privilege"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final set_icon(Lv/VIcon;)V
    .locals 0
    .param p1    # Lv/VIcon;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->a:Lv/VIcon;

    .line 5
    .line 6
    return-void
.end method

.method public final set_privilege(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchaseExclusivePrivilegeItemView;->b:Lv/VText;

    .line 5
    .line 6
    return-void
.end method
