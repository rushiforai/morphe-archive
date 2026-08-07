.class public final Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\u001f\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001f\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u0011\u0010\u0010J\u001f\u0010\u0012\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u0012\u0010\u0010J\u0017\u0010\u0015\u001a\u00020\u00082\u0006\u0010\u0014\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016R\"\u0010\u001d\u001a\u00020\u00178\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0015\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001a\"\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;",
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
        "type",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "b",
        "(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V",
        "d",
        "c",
        "Landroid/view/View;",
        "view",
        "a",
        "(Landroid/view/View;)V",
        "Landroid/widget/ImageView;",
        "Landroid/widget/ImageView;",
        "get_image",
        "()Landroid/widget/ImageView;",
        "set_image",
        "(Landroid/widget/ImageView;)V",
        "_image",
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
.field public a:Landroid/widget/ImageView;


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

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/egb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const/4 p2, -0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView$a;->a:[I

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    aget p2, v0, p2

    .line 15
    .line 16
    :goto_0
    packed-switch p2, :pswitch_data_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget p1, Ll/jbc0;->gc:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget p1, Ll/jbc0;->Cb:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget p1, Ll/jbc0;->Bb:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p1, Ll/jbc0;->tc:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :pswitch_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget p1, Ll/jbc0;->V:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_5
    sget p2, Ll/jbc0;->W:I

    .line 71
    .line 72
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    invoke-static {}, Ll/c17;->u0()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    sget p1, Ll/jbc0;->W:I

    .line 85
    .line 86
    :goto_1
    move p2, p1

    .line 87
    goto :goto_2

    .line 88
    :cond_1
    sget p1, Ll/jbc0;->O8:I

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    sget p1, Ll/jbc0;->X:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :pswitch_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    sget p1, Ll/jbc0;->U:I

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {}, Ll/c17;->u0()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_3

    .line 128
    .line 129
    sget p1, Ll/jbc0;->w6:I

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_3
    sget p1, Ll/jbc0;->v6:I

    .line 133
    .line 134
    :goto_3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :pswitch_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {}, Ll/c17;->u0()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_4

    .line 147
    .line 148
    sget p1, Ll/jbc0;->ta:I

    .line 149
    .line 150
    goto :goto_4

    .line 151
    :cond_4
    sget p1, Ll/jbc0;->sa:I

    .line 152
    .line 153
    :goto_4
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :pswitch_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    sget p1, Ll/jbc0;->ga:I

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :pswitch_b
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_6

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {}, Ll/c17;->u0()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_5

    .line 182
    .line 183
    sget p1, Ll/jbc0;->M4:I

    .line 184
    .line 185
    goto :goto_5

    .line 186
    :cond_5
    sget p1, Ll/jbc0;->L4:I

    .line 187
    .line 188
    :goto_5
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {}, Ll/c17;->u0()Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_7

    .line 201
    .line 202
    sget p1, Ll/jbc0;->l0:I

    .line 203
    .line 204
    goto :goto_6

    .line 205
    :cond_7
    sget p1, Ll/jbc0;->k0:I

    .line 206
    .line 207
    :goto_6
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :pswitch_c
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-static {}, Ll/c17;->u0()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_8

    .line 220
    .line 221
    sget p1, Ll/jbc0;->d0:I

    .line 222
    .line 223
    goto :goto_7

    .line 224
    :cond_8
    sget p1, Ll/jbc0;->c0:I

    .line 225
    .line 226
    :goto_7
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :pswitch_d
    invoke-static {}, Ll/s7a;->h()Z

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    if-eqz p2, :cond_9

    .line 235
    .line 236
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_9

    .line 241
    .line 242
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    sget p1, Ll/jbc0;->j5:I

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-static {}, Ll/c17;->u0()Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-eqz p1, :cond_a

    .line 261
    .line 262
    sget p1, Ll/jbc0;->R4:I

    .line 263
    .line 264
    goto :goto_8

    .line 265
    :cond_a
    sget p1, Ll/jbc0;->Q4:I

    .line 266
    .line 267
    :goto_8
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :pswitch_e
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-static {}, Ll/c17;->u0()Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-eqz p1, :cond_b

    .line 280
    .line 281
    sget p1, Ll/jbc0;->r4:I

    .line 282
    .line 283
    goto :goto_9

    .line 284
    :cond_b
    sget p1, Ll/jbc0;->s4:I

    .line 285
    .line 286
    :goto_9
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :pswitch_f
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    sget p1, Ll/jbc0;->e5:I

    .line 295
    .line 296
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :pswitch_10
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 301
    .line 302
    .line 303
    move-result p1

    .line 304
    if-eqz p1, :cond_d

    .line 305
    .line 306
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    invoke-static {}, Ll/c17;->u0()Z

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    if-eqz p1, :cond_c

    .line 315
    .line 316
    sget p1, Ll/jbc0;->O4:I

    .line 317
    .line 318
    goto :goto_a

    .line 319
    :cond_c
    sget p1, Ll/jbc0;->N4:I

    .line 320
    .line 321
    :goto_a
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 322
    .line 323
    .line 324
    return-void

    .line 325
    :cond_d
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-static {}, Ll/c17;->u0()Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-eqz p1, :cond_e

    .line 334
    .line 335
    sget p1, Ll/jbc0;->L5:I

    .line 336
    .line 337
    goto :goto_b

    .line 338
    :cond_e
    sget p1, Ll/jbc0;->K5:I

    .line 339
    .line 340
    :goto_b
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 341
    .line 342
    .line 343
    return-void

    .line 344
    :pswitch_11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    sget p1, Ll/jbc0;->M5:I

    .line 349
    .line 350
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    :pswitch_12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 355
    .line 356
    .line 357
    move-result-object p0

    .line 358
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    if-eqz p1, :cond_f

    .line 371
    .line 372
    sget p1, Ll/jbc0;->q9:I

    .line 373
    .line 374
    goto :goto_c

    .line 375
    :cond_f
    sget p1, Ll/jbc0;->p9:I

    .line 376
    .line 377
    :goto_c
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 378
    .line 379
    .line 380
    return-void

    .line 381
    :pswitch_13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    if-eqz p1, :cond_10

    .line 398
    .line 399
    sget p1, Ll/jbc0;->o9:I

    .line 400
    .line 401
    goto :goto_d

    .line 402
    :cond_10
    sget p1, Ll/jbc0;->n9:I

    .line 403
    .line 404
    :goto_d
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 405
    .line 406
    .line 407
    return-void

    .line 408
    :pswitch_14
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    if-eqz p1, :cond_12

    .line 413
    .line 414
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 415
    .line 416
    .line 417
    move-result-object p0

    .line 418
    invoke-static {}, Ll/c17;->u0()Z

    .line 419
    .line 420
    .line 421
    move-result p1

    .line 422
    if-eqz p1, :cond_11

    .line 423
    .line 424
    sget p1, Ll/jbc0;->A4:I

    .line 425
    .line 426
    goto :goto_e

    .line 427
    :cond_11
    sget p1, Ll/jbc0;->z4:I

    .line 428
    .line 429
    :goto_e
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 430
    .line 431
    .line 432
    return-void

    .line 433
    :cond_12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    invoke-static {}, Ll/c17;->u0()Z

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    if-eqz p1, :cond_13

    .line 442
    .line 443
    sget p1, Ll/jbc0;->Pc:I

    .line 444
    .line 445
    goto :goto_f

    .line 446
    :cond_13
    sget p1, Ll/jbc0;->Oc:I

    .line 447
    .line 448
    :goto_f
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 449
    .line 450
    .line 451
    return-void

    .line 452
    :pswitch_15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 453
    .line 454
    .line 455
    move-result-object p0

    .line 456
    invoke-static {}, Ll/c17;->u0()Z

    .line 457
    .line 458
    .line 459
    move-result p1

    .line 460
    if-eqz p1, :cond_14

    .line 461
    .line 462
    sget p1, Ll/jbc0;->S8:I

    .line 463
    .line 464
    goto :goto_10

    .line 465
    :cond_14
    sget p1, Ll/jbc0;->R8:I

    .line 466
    .line 467
    :goto_10
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 468
    .line 469
    .line 470
    return-void

    .line 471
    :pswitch_16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 472
    .line 473
    .line 474
    move-result-object p0

    .line 475
    invoke-static {}, Ll/c17;->u0()Z

    .line 476
    .line 477
    .line 478
    move-result p1

    .line 479
    if-eqz p1, :cond_15

    .line 480
    .line 481
    sget p1, Ll/jbc0;->ic:I

    .line 482
    .line 483
    goto :goto_11

    .line 484
    :cond_15
    sget p1, Ll/jbc0;->hc:I

    .line 485
    .line 486
    :goto_11
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 487
    .line 488
    .line 489
    return-void

    .line 490
    :pswitch_17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 491
    .line 492
    .line 493
    move-result-object p0

    .line 494
    invoke-static {p1}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    if-eqz p1, :cond_16

    .line 499
    .line 500
    sget p1, Ll/jbc0;->Y:I

    .line 501
    .line 502
    goto :goto_12

    .line 503
    :cond_16
    invoke-static {}, Ll/c17;->u0()Z

    .line 504
    .line 505
    .line 506
    move-result p1

    .line 507
    if-eqz p1, :cond_17

    .line 508
    .line 509
    sget p1, Ll/jbc0;->B8:I

    .line 510
    .line 511
    goto :goto_12

    .line 512
    :cond_17
    sget p1, Ll/jbc0;->A8:I

    .line 513
    .line 514
    :goto_12
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 515
    .line 516
    .line 517
    return-void

    .line 518
    :pswitch_18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    sget p1, Ll/jbc0;->gc:I

    .line 523
    .line 524
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 525
    .line 526
    .line 527
    return-void

    .line 528
    :pswitch_19
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 529
    .line 530
    .line 531
    move-result-object p1

    .line 532
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object p1

    .line 536
    const-string p2, "en"

    .line 537
    .line 538
    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    move-result p1

    .line 542
    if-eqz p1, :cond_18

    .line 543
    .line 544
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 545
    .line 546
    .line 547
    move-result-object p0

    .line 548
    sget p1, Ll/jbc0;->C8:I

    .line 549
    .line 550
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 551
    .line 552
    .line 553
    return-void

    .line 554
    :cond_18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 559
    .line 560
    .line 561
    move-result-object p1

    .line 562
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->z1()Z

    .line 563
    .line 564
    .line 565
    move-result p1

    .line 566
    if-eqz p1, :cond_19

    .line 567
    .line 568
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 569
    .line 570
    .line 571
    move-result-object p0

    .line 572
    sget p1, Ll/jbc0;->a0:I

    .line 573
    .line 574
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 575
    .line 576
    .line 577
    return-void

    .line 578
    :cond_19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 579
    .line 580
    .line 581
    move-result-object p0

    .line 582
    sget p1, Ll/jbc0;->dc:I

    .line 583
    .line 584
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 585
    .line 586
    .line 587
    return-void

    .line 588
    :pswitch_1a
    invoke-static {}, Ll/s7a;->h()Z

    .line 589
    .line 590
    .line 591
    move-result p2

    .line 592
    if-eqz p2, :cond_1a

    .line 593
    .line 594
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 595
    .line 596
    .line 597
    move-result p1

    .line 598
    if-eqz p1, :cond_1a

    .line 599
    .line 600
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 601
    .line 602
    .line 603
    move-result-object p0

    .line 604
    sget p1, Ll/jbc0;->Ma:I

    .line 605
    .line 606
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 607
    .line 608
    .line 609
    return-void

    .line 610
    :cond_1a
    invoke-static {}, Ll/c17;->u0()Z

    .line 611
    .line 612
    .line 613
    move-result p1

    .line 614
    if-eqz p1, :cond_1b

    .line 615
    .line 616
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 617
    .line 618
    .line 619
    move-result-object p0

    .line 620
    sget p1, Ll/jbc0;->Gc:I

    .line 621
    .line 622
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 623
    .line 624
    .line 625
    return-void

    .line 626
    :cond_1b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 627
    .line 628
    .line 629
    move-result-object p0

    .line 630
    sget p1, Ll/jbc0;->Dc:I

    .line 631
    .line 632
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 633
    .line 634
    .line 635
    return-void

    .line 636
    :pswitch_1b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 637
    .line 638
    .line 639
    move-result-object p0

    .line 640
    sget p1, Ll/jbc0;->tc:I

    .line 641
    .line 642
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 643
    .line 644
    .line 645
    return-void

    .line 646
    nop

    .line 647
    :pswitch_data_0
    .packed-switch 0x1
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
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget p1, Ll/jbc0;->z8:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->get_image()Landroid/widget/ImageView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget p1, Ll/jbc0;->La:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final get_image()Landroid/widget/ImageView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_image"

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final set_image(Landroid/widget/ImageView;)V
    .locals 0
    .param p1    # Landroid/widget/ImageView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 5
    .line 6
    return-void
.end method
