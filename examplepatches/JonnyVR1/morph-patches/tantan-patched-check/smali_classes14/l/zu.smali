.class public Ll/zu;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zu$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/zu$b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProtocolItemBean;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zu;->a:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic A(Ll/zu;ILl/zu$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zu;->E(ILl/zu$b;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/zu;Ll/zu$b;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zu;->D(Ll/zu$b;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_settle_account_popup_cancel"

    .line 2
    .line 3
    const-string v0, "p_settle_account_popup"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProtocolItemBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zu;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic D(Ll/zu$b;ILandroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_settle_account_popup_confirm"

    .line 2
    .line 3
    const-string v0, "p_settle_account_popup"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    invoke-virtual {p1, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/zu;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 21
    .line 22
    iput-boolean p3, p1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 23
    .line 24
    iget-object p0, p0, Ll/zu;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 31
    .line 32
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 33
    .line 34
    return-void
.end method

.method public final synthetic E(ILl/zu$b;Landroid/view/View;)V
    .locals 6

    .line 1
    const-string p3, "settle_account"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-string v1, "select_click_type"

    .line 5
    .line 6
    const-string v2, "e_delete_account_interact_block_button"

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object v3, p0, Ll/zu;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 17
    .line 18
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 19
    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    iget-object v3, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    new-instance v4, Ll/pf60;

    .line 29
    .line 30
    invoke-direct {v4, v1, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    filled-new-array {v4}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-static {v2, v3, p3}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object p3, p2, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 41
    .line 42
    invoke-virtual {p3, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 43
    .line 44
    .line 45
    const-class p3, Lcom/p1/mobile/android/app/Dialog;

    .line 46
    .line 47
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const-string v1, "p_settle_account_popup"

    .line 52
    .line 53
    invoke-static {v1, p3}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    new-instance v1, Ll/th0$a;

    .line 58
    .line 59
    iget-object v2, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    const-string v2, "\u8d26\u53f7\u5185\u94b1\u5305\u7ed3\u6e05"

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v2, "\u901a\u8fc7\u4f7f\u7528\u63a2\u63a2\u670d\u52a1\u83b7\u5f97\u7684\u8d44\u4ea7\u6216\u865a\u62df\u6743\u76ca\u7b49\u8d22\u4ea7\u6027\u5229\u76ca\uff0c\u60a8\u53ef\u4ee5\u9009\u62e9\u63d0\u73b0\u6216\u6d88\u8d39\uff0c\u82e5\u76f4\u63a5\u6ce8\u9500\u5219\u89c6\u4e3a\u60a8\u4e3b\u52a8\u653e\u5f03\uff0c\u662f\u5426\u786e\u8ba4\u820d\u5f03\uff1f"

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v2, "\u6211\u518d\u60f3\u60f3"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const-string v2, "\u786e\u8ba4\u820d\u5f03"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v2, Ll/zu$a;

    .line 93
    .line 94
    invoke-direct {v2, p0, p3}, Ll/zu$a;-><init>(Ll/zu;Ll/l4g0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/xu;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/xu;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/yu;

    .line 115
    .line 116
    invoke-direct {v1, p0, p2, p1}, Ll/yu;-><init>(Ll/zu;Ll/zu$b;I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p3}, Ll/w1e;->f(Ll/l4g0;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_0
    const/4 v3, 0x1

    .line 135
    if-nez p1, :cond_1

    .line 136
    .line 137
    iget-object v4, p0, Ll/zu;->a:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    check-cast v4, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 144
    .line 145
    iget-boolean v4, v4, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 146
    .line 147
    if-eqz v4, :cond_1

    .line 148
    .line 149
    iget-object v4, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 150
    .line 151
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    new-instance v5, Ll/pf60;

    .line 156
    .line 157
    invoke-direct {v5, v1, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    filled-new-array {v5}, [Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    invoke-static {v2, v4, p3}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 165
    .line 166
    .line 167
    iget-object p3, p0, Ll/zu;->a:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    check-cast p3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 174
    .line 175
    iput-boolean v0, p3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isShow:Z

    .line 176
    .line 177
    iget-object p2, p2, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 178
    .line 179
    iget-object p3, p0, Ll/zu;->a:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p3

    .line 185
    check-cast p3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 186
    .line 187
    iget-boolean p3, p3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 188
    .line 189
    xor-int/2addr p3, v3

    .line 190
    invoke-virtual {p2, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 191
    .line 192
    .line 193
    iget-object p2, p0, Ll/zu;->a:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    check-cast p2, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 200
    .line 201
    iget-object p0, p0, Ll/zu;->a:Ljava/util/List;

    .line 202
    .line 203
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 208
    .line 209
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 210
    .line 211
    xor-int/2addr p0, v3

    .line 212
    iput-boolean p0, p2, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 213
    .line 214
    return-void

    .line 215
    :cond_1
    if-ne p1, v3, :cond_2

    .line 216
    .line 217
    iget-object p3, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 218
    .line 219
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p3

    .line 223
    new-instance v0, Ll/pf60;

    .line 224
    .line 225
    const-string v4, "settle_vip"

    .line 226
    .line 227
    invoke-direct {v0, v1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    filled-new-array {v0}, [Ll/pf60;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-static {v2, p3, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 235
    .line 236
    .line 237
    goto :goto_0

    .line 238
    :cond_2
    const/4 p3, 0x2

    .line 239
    if-ne p1, p3, :cond_3

    .line 240
    .line 241
    iget-object p3, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 242
    .line 243
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p3

    .line 247
    new-instance v0, Ll/pf60;

    .line 248
    .line 249
    const-string v4, "block_infor"

    .line 250
    .line 251
    invoke-direct {v0, v1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    filled-new-array {v0}, [Ll/pf60;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-static {v2, p3, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 259
    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_3
    const/4 p3, 0x3

    .line 263
    if-ne p1, p3, :cond_4

    .line 264
    .line 265
    iget-object p3, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 266
    .line 267
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p3

    .line 271
    new-instance v0, Ll/pf60;

    .line 272
    .line 273
    const-string v4, "auto_pay"

    .line 274
    .line 275
    invoke-direct {v0, v1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    filled-new-array {v0}, [Ll/pf60;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-static {v2, p3, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 283
    .line 284
    .line 285
    goto :goto_0

    .line 286
    :cond_4
    const/4 p3, 0x4

    .line 287
    if-ne p1, p3, :cond_5

    .line 288
    .line 289
    iget-object p3, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 290
    .line 291
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p3

    .line 295
    new-instance v0, Ll/pf60;

    .line 296
    .line 297
    const-string v4, "security_check"

    .line 298
    .line 299
    invoke-direct {v0, v1, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 300
    .line 301
    .line 302
    filled-new-array {v0}, [Ll/pf60;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-static {v2, p3, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 307
    .line 308
    .line 309
    :cond_5
    :goto_0
    iget-object p2, p2, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 310
    .line 311
    iget-object p3, p0, Ll/zu;->a:Ljava/util/List;

    .line 312
    .line 313
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object p3

    .line 317
    check-cast p3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 318
    .line 319
    iget-boolean p3, p3, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 320
    .line 321
    xor-int/2addr p3, v3

    .line 322
    invoke-virtual {p2, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 323
    .line 324
    .line 325
    iget-object p2, p0, Ll/zu;->a:Ljava/util/List;

    .line 326
    .line 327
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object p2

    .line 331
    check-cast p2, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 332
    .line 333
    iget-object p0, p0, Ll/zu;->a:Ljava/util/List;

    .line 334
    .line 335
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 340
    .line 341
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 342
    .line 343
    xor-int/2addr p0, v3

    .line 344
    iput-boolean p0, p2, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 345
    .line 346
    return-void
.end method

.method public F(Ll/zu$b;I)V
    .locals 2
    .param p1    # Ll/zu$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RecyclerView"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/zu$b;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zu;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->tip:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Ll/zu$b;->c:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/zu;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->title:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 32
    .line 33
    iget-object v1, p0, Ll/zu;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;

    .line 40
    .line 41
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ProtocolItemBean;->isCheck:Z

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p1, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 47
    .line 48
    new-instance v1, Ll/wu;

    .line 49
    .line 50
    invoke-direct {v1, p0, p2, p1}, Ll/wu;-><init>(Ll/zu;ILl/zu$b;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public G(Landroid/view/ViewGroup;I)Ll/zu$b;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p2, p0, Ll/zu;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/sec0;->l:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance p2, Ll/zu$b;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-direct {p2, p0, p1, v0}, Ll/zu$b;-><init>(Ll/zu;Landroid/view/View;Ll/av;)V

    .line 18
    .line 19
    .line 20
    return-object p2
.end method

.method public H(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProtocolItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/zu;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/zu;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x5

    .line 2
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RecyclerView"
        }
    .end annotation

    .line 1
    check-cast p1, Ll/zu$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zu;->F(Ll/zu$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zu;->G(Landroid/view/ViewGroup;I)Ll/zu$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
