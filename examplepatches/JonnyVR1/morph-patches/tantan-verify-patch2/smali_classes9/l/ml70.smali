.class public Ll/ml70;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:I = 0x1

.field public static d:I = 0x2

.field public static e:I = 0x3

.field public static volatile f:Ll/ml70;


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/android/app/Act;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/ml70;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    iput-object v0, p0, Ll/ml70;->b:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Ll/ml70;Lcom/p1/mobile/android/app/Act;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ml70;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/Integer;)V

    return-void
.end method

.method public static b()Ll/ml70;
    .locals 2

    .line 1
    sget-object v0, Ll/ml70;->f:Ll/ml70;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/ml70;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/ml70;->f:Ll/ml70;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/ml70;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ml70;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/ml70;->f:Ll/ml70;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/ml70;->f:Ll/ml70;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final synthetic c(Lcom/p1/mobile/android/app/Act;Ljava/lang/Integer;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ml70;->b:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_7

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/ml70;->a:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-le v0, v2, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/ml70;->a:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    const/4 v4, -0x2

    .line 40
    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    const/16 v3, 0x10

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 49
    .line 50
    .line 51
    const/high16 v3, 0x41400000    # 12.0f

    .line 52
    .line 53
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    const/high16 v7, 0x41a00000    # 20.0f

    .line 62
    .line 63
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {v0, v5, v6, v7, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Lv/VIcon;

    .line 75
    .line 76
    invoke-direct {v3, p1}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 80
    .line 81
    const/high16 v6, 0x41e00000    # 28.0f

    .line 82
    .line 83
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 92
    .line 93
    .line 94
    const/high16 v6, 0x41000000    # 8.0f

    .line 95
    .line 96
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 101
    .line 102
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    sget v5, Ll/dbc0;->tm:I

    .line 106
    .line 107
    invoke-virtual {v3, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Lv/VText;

    .line 114
    .line 115
    invoke-direct {v3, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 116
    .line 117
    .line 118
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 119
    .line 120
    invoke-direct {v5, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    sget v5, Ll/c9c0;->i:I

    .line 131
    .line 132
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 137
    .line 138
    .line 139
    const/high16 v4, 0x41700000    # 15.0f

    .line 140
    .line 141
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 142
    .line 143
    .line 144
    const/4 v4, 0x3

    .line 145
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v3, v4, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    sget v5, Ll/ml70;->c:I

    .line 157
    .line 158
    if-ne v4, v5, :cond_2

    .line 159
    .line 160
    sget v4, Lcom/p1/mobile/putong/core/R$string;->fr:I

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    sget v5, Ll/ml70;->d:I

    .line 168
    .line 169
    if-ne v4, v5, :cond_3

    .line 170
    .line 171
    sget v4, Lcom/p1/mobile/putong/core/R$string;->gr:I

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_3
    sget v4, Lcom/p1/mobile/putong/core/R$string;->e5:I

    .line 175
    .line 176
    :goto_0
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    sget v5, Ll/ml70;->c:I

    .line 184
    .line 185
    if-eq v4, v5, :cond_4

    .line 186
    .line 187
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 188
    .line 189
    .line 190
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 191
    .line 192
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 196
    .line 197
    .line 198
    :cond_4
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 199
    .line 200
    .line 201
    new-instance v3, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 202
    .line 203
    invoke-direct {v3, p1, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    sget v0, Ll/ml70;->c:I

    .line 211
    .line 212
    if-ne p1, v0, :cond_5

    .line 213
    .line 214
    const/4 v2, 0x2

    .line 215
    :cond_5
    invoke-virtual {v3, v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PIC_POST_SUCCESS:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 226
    .line 227
    .line 228
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v0, p1}, Ll/llb0;->i(Ll/fqe0;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    sget p2, Ll/ml70;->c:I

    .line 240
    .line 241
    if-ne p1, p2, :cond_6

    .line 242
    .line 243
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p2

    .line 255
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 256
    .line 257
    invoke-interface {p1, p2, v1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 258
    .line 259
    .line 260
    :cond_6
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 261
    .line 262
    iput-object p1, p0, Ll/ml70;->b:Ljava/lang/Boolean;

    .line 263
    .line 264
    return-void

    .line 265
    :cond_7
    :goto_1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 266
    .line 267
    .line 268
    move-result p0

    .line 269
    sget p1, Ll/ml70;->c:I

    .line 270
    .line 271
    if-ne p0, p1, :cond_8

    .line 272
    .line 273
    sget p0, Lcom/p1/mobile/putong/core/R$string;->fr:I

    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_8
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    sget p1, Ll/ml70;->d:I

    .line 281
    .line 282
    if-ne p0, p1, :cond_9

    .line 283
    .line 284
    sget p0, Lcom/p1/mobile/putong/core/R$string;->gr:I

    .line 285
    .line 286
    goto :goto_2

    .line 287
    :cond_9
    sget p0, Lcom/p1/mobile/putong/core/R$string;->e5:I

    .line 288
    .line 289
    :goto_2
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 290
    .line 291
    .line 292
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/aw90;->d:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ll70;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/ll70;-><init>(Ll/ml70;Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public e(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ml70;->b:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method
