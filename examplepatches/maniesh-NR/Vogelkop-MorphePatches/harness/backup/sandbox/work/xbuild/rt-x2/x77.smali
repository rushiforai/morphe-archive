.class public final Lx77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrya;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lx77;->a:B

    packed-switch p1, :pswitch_data_2c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0xa

    .line 190
    new-array v0, p1, [I

    .line 191
    iput-object v0, p0, Lx77;->b:Ljava/lang/Object;

    .line 192
    new-array v0, p1, [I

    .line 193
    iput-object v0, p0, Lx77;->c:Ljava/lang/Object;

    .line 194
    new-array p1, p1, [I

    .line 195
    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void

    .line 196
    :pswitch_17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    new-instance p1, Lpde;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 198
    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 199
    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    .line 200
    new-instance p1, La83;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, La83;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void

    :pswitch_data_2c
    .packed-switch 0x7
        :pswitch_17
    .end packed-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 172
    iput-byte p1, p0, Lx77;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;La32;)V
    .registers 12

    const/4 v0, 0x1

    iput-byte v0, p0, Lx77;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ldkf;

    const v2, 0x7f150054

    invoke-direct {v1, p1, v2}, Ldkf;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lx77;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {p1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lx77;->c:Ljava/lang/Object;

    new-instance p1, Laz0;

    invoke-direct {p1, v1}, Laz0;-><init>(Landroid/content/Context;)V

    const v3, 0x7f140c5f

    invoke-virtual {p1, v3}, Laz0;->b(I)V

    const v3, 0x7f140c5d

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    const/4 v5, 0x6

    invoke-static {v3, p2, v2, v2, v5}, Lkotlin/text/StringsKt;->L(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v3

    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    const v6, 0x7f04021f

    const v7, 0x7f060ade

    invoke-static {v6, v1, v7}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v6

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v3

    const/16 v7, 0x21

    invoke-virtual {v4, v5, v3, v6, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance v5, Landroid/text/style/StyleSpan;

    invoke-direct {v5, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p2, v3

    invoke-virtual {v4, v5, v3, p2, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    iget-object p2, p1, Laz0;->a:Lwy0;

    iput-object v4, p2, Lwy0;->f:Ljava/lang/CharSequence;

    const v3, 0x7f141063

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lxd7;

    invoke-direct {v4, p3, p0, v2}, Lxd7;-><init>(La32;Lx77;B)V

    iput-object v3, p2, Lwy0;->g:Ljava/lang/CharSequence;

    iput-object v4, p2, Lwy0;->h:Landroid/content/DialogInterface$OnClickListener;

    new-instance p2, Lxd7;

    invoke-direct {p2, p3, p0, v0}, Lxd7;-><init>(La32;Lx77;B)V

    const v0, 0x7f1403bf

    invoke-virtual {p1, v0, p2}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p1

    new-instance p2, Luk6;

    const/16 v0, 0xa

    invoke-direct {p2, p0, v0}, Luk6;-><init>(Ljava/lang/Object;B)V

    const v0, 0x7f140c5e

    invoke-static {v1, v0, v2, p2}, Lphj;->I(Landroid/content/Context;IZLav4;)Landroid/widget/FrameLayout;

    move-result-object p2

    invoke-virtual {p1, p2}, Laz0;->setView(Landroid/view/View;)Laz0;

    move-result-object p1

    new-instance p2, Lyd7;

    invoke-direct {p2, p3, p0}, Lyd7;-><init>(La32;Lx77;)V

    iget-object p3, p1, Laz0;->a:Lwy0;

    iput-object p2, p3, Lwy0;->l:Lyd7;

    invoke-virtual {p1}, Laz0;->create()Lbz0;

    move-result-object p1

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    new-instance p2, Lzd7;

    invoke-direct {p2, p0, v2}, Lzd7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljg8;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Lx77;->a:B

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    .line 178
    iput-object p2, p0, Lx77;->c:Ljava/lang/Object;

    .line 179
    new-instance p1, Lal7;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll1c;)V
    .registers 4

    const/16 v0, 0x13

    iput-byte v0, p0, Lx77;->a:B

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    iput-object p1, p0, Lx77;->c:Ljava/lang/Object;

    .line 203
    iget-object p1, p2, Ll1c;->a:Ljava/util/Map;

    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/OperaApplication;Lcom/opera/android/settings/SettingsManager;Lx5f;)V
    .registers 5

    const/4 v0, 0x6

    iput-byte v0, p0, Lx77;->a:B

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    iput-object p2, p0, Lx77;->b:Ljava/lang/Object;

    .line 206
    iput-object p3, p0, Lx77;->c:Ljava/lang/Object;

    .line 207
    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->G()Z

    move-result p2

    if-eqz p2, :cond_14

    const/4 p1, 0x0

    .line 208
    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    goto :goto_1a

    .line 209
    :cond_14
    invoke-static {p1}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object p1

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    :goto_1a
    return-void
.end method

.method public constructor <init>(Lhp2;)V
    .registers 3

    const/16 v0, 0x16

    iput-byte v0, p0, Lx77;->a:B

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lx77;->b:Ljava/lang/Object;

    .line 242
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lx77;->c:Ljava/lang/Object;

    .line 243
    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 173
    iput-byte p3, p0, Lx77;->a:B

    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    iput-object p2, p0, Lx77;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 174
    iput-byte p4, p0, Lx77;->a:B

    iput-object p2, p0, Lx77;->b:Ljava/lang/Object;

    iput-object p3, p0, Lx77;->c:Ljava/lang/Object;

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V
    .registers 6

    .line 175
    iput-byte p5, p0, Lx77;->a:B

    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    iput-object p2, p0, Lx77;->c:Ljava/lang/Object;

    iput-object p3, p0, Lx77;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3

    const/16 v0, 0x18

    iput-byte v0, p0, Lx77;->a:B

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    .line 238
    new-instance p1, Lwzd;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lwzd;-><init>(Lx77;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lx77;->c:Ljava/lang/Object;

    .line 239
    new-instance p1, Lwzd;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lwzd;-><init>(Lx77;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljl6;Ljava/io/InputStream;Ljava/util/ArrayList;)V
    .registers 5

    const/16 v0, 0x10

    iput-byte v0, p0, Lx77;->a:B

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-object p1, p0, Lx77;->c:Ljava/lang/Object;

    .line 212
    iput-object p3, p0, Lx77;->d:Ljava/lang/Object;

    .line 213
    new-instance p3, Ld06;

    invoke-direct {p3, p2, p1}, Ld06;-><init>(Ljava/io/InputStream;Ljl6;)V

    iput-object p3, p0, Lx77;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .registers 3

    const/16 v0, 0xe

    iput-byte v0, p0, Lx77;->a:B

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    .line 188
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lx77;->c:Ljava/lang/Object;

    .line 189
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmcj;Landroid/view/Window;)V
    .registers 5

    const/16 v0, 0x1a

    iput-byte v0, p0, Lx77;->a:B

    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 226
    new-instance v0, Ljje;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ljje;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lx77;->d:Ljava/lang/Object;

    .line 227
    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    .line 228
    iput-object p2, p0, Lx77;->c:Ljava/lang/Object;

    .line 229
    iget-object p1, p1, Lmcj;->a:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-virtual {p1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    .line 230
    invoke-virtual {p0}, Lx77;->q()V

    return-void
.end method

.method public constructor <init>(Lndc;Lpde;Liv7;)V
    .registers 12

    const/16 v0, 0xd

    iput-byte v0, p0, Lx77;->a:B

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 232
    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    .line 233
    iput-object p2, p0, Lx77;->c:Ljava/lang/Object;

    .line 234
    iput-object p3, p0, Lx77;->d:Ljava/lang/Object;

    .line 235
    new-instance p3, Lk0a;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lk0a;-><init>(Lx77;B)V

    new-instance v0, Lug;

    const/16 v1, 0x18

    invoke-direct {v0, p3, v1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, v0}, Lekc;->j(Lndc;Lf7f;)V

    .line 236
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    new-instance v4, Lk0a;

    const/4 p1, 0x1

    invoke-direct {v4, p0, p1}, Lk0a;-><init>(Lx77;B)V

    const/4 v6, 0x0

    const/16 v7, 0xd

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method

.method public constructor <init>(Lnre;)V
    .registers 7

    const/16 v0, 0x14

    iput-byte v0, p0, Lx77;->a:B

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    iget-object v0, p1, Lnre;->c:Ll0c;

    if-nez v0, :cond_d

    const/4 v0, 0x0

    goto :goto_23

    .line 216
    :cond_d
    new-instance v1, Lg77;

    iget-object v2, p1, Lnre;->b:Ljava/net/URL;

    iget-object v3, v0, Ll0c;->a:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 217
    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    iget-object v0, v0, Ll0c;->b:Ljava/lang/String;

    .line 218
    invoke-virtual {v0, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v0, v1

    .line 219
    :goto_23
    iput-object v0, p0, Lx77;->b:Ljava/lang/Object;

    .line 220
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lnre;->f:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lx77;->c:Ljava/lang/Object;

    .line 221
    new-instance v1, Lau9;

    const/4 v2, 0x7

    .line 222
    invoke-direct {v1, v2}, Lau9;-><init>(B)V

    .line 223
    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 224
    iget-object p1, p1, Lnre;->g:Lbre;

    iput-object p1, p0, Lx77;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;Lcom/opera/android/BrowserActivity;Lcom/opera/android/settings/SettingsManager;Lxnh;)V
    .registers 6

    const/16 v0, 0x1b

    iput-byte v0, p0, Lx77;->a:B

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    iput-object p2, p0, Lx77;->b:Ljava/lang/Object;

    .line 182
    iput-object p3, p0, Lx77;->c:Ljava/lang/Object;

    .line 183
    iput-object p4, p0, Lx77;->d:Ljava/lang/Object;

    .line 184
    new-instance p2, Lvy;

    const/16 p3, 0x8

    invoke-direct {p2, p0, p3}, Lvy;-><init>(Ljava/lang/Object;B)V

    .line 185
    invoke-static {p4, p1, p2}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    return-void
.end method

.method public static h(Lbre;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lbre;->c:Ljava/lang/String;

    iget-object v1, p0, Lbre;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    return-object v1

    :cond_b
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object p0, p0, Lbre;->c:Ljava/lang/String;

    const-string v0, ", "

    invoke-static {v1, v0, p0}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 3

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    iget-object p0, p0, Ld06;->a:Ljava/lang/Object;

    check-cast p0, Lcph;

    invoke-virtual {p0}, Lcph;->reset()V

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public final b()Lxfa;
    .registers 5

    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Ldga;

    const/4 v1, 0x0

    if-eqz v0, :cond_96

    iget-object v2, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v2, Li4d;

    if-eqz v2, :cond_96

    iget v3, v0, Ldga;->a:I

    iget-object v2, v2, Li4d;->b:Ljava/lang/Object;

    check-cast v2, Lm54;

    iget-object v2, v2, Lm54;->a:[B

    array-length v2, v2

    if-ne v3, v2, :cond_90

    invoke-virtual {v0}, Ldga;->a()Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_2a

    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_2a
    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Ldga;

    invoke-virtual {v0}, Ldga;->a()Z

    move-result v0

    if-nez v0, :cond_40

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_40

    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_40
    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Ldga;

    iget-object v0, v0, Ldga;->c:Lcga;

    sget-object v2, Lcga;->e:Lcga;

    if-ne v0, v2, :cond_4d

    sget-object v0, Ljuf;->a:Lm54;

    goto :goto_7e

    :cond_4d
    sget-object v2, Lcga;->d:Lcga;

    if-eq v0, v2, :cond_72

    sget-object v2, Lcga;->c:Lcga;

    if-eq v0, v2, :cond_72

    sget-object v2, Lcga;->b:Lcga;

    if-ne v0, v2, :cond_66

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->b(I)Lm54;

    move-result-object v0

    goto :goto_7e

    :cond_66
    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ldga;

    iget-object p0, p0, Ldga;->c:Lcga;

    const-string v0, "Unknown HmacParameters.Variant: "

    invoke-static {p0, v0}, Lj9h;->u(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    :cond_72
    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->a(I)Lm54;

    move-result-object v0

    :goto_7e
    new-instance v1, Lxfa;

    iget-object v2, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v2, Ldga;

    iget-object v3, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v3, Li4d;

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-direct {v1, v2, v3, v0, p0}, Lxfa;-><init>(Ldga;Li4d;Lm54;Ljava/lang/Integer;)V

    return-object v1

    :cond_90
    const-string p0, "Key size mismatch"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_96
    const-string p0, "Cannot build without parameters and/or key material"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    iget-object p0, p0, Ld06;->a:Ljava/lang/Object;

    check-cast p0, Lcph;

    monitor-enter p0

    :try_start_9
    iget-object v0, p0, Lcph;->a:[B

    array-length v0, v0

    iput v0, p0, Lcph;->c:I
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_12

    monitor-exit p0

    return-void

    :goto_10
    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_12

    throw v0

    :catchall_12
    move-exception v0

    goto :goto_10
.end method

.method public final d()I
    .registers 3

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Ld06;

    iget-object v1, v1, Ld06;->a:Ljava/lang/Object;

    check-cast v1, Lcph;

    invoke-virtual {v1}, Lcph;->reset()V

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Ljl6;

    invoke-static {p0, v1, v0}, Lp37;->I(Ljl6;Ljava/io/InputStream;Ljava/util/ArrayList;)I

    move-result p0

    return p0
.end method

.method public final e()Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .registers 3

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Ld06;

    iget-object v1, v1, Ld06;->a:Ljava/lang/Object;

    check-cast v1, Lcph;

    invoke-virtual {v1}, Lcph;->reset()V

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Ljl6;

    invoke-static {p0, v1, v0}, Lp37;->K(Ljl6;Ljava/io/InputStream;Ljava/util/ArrayList;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p0

    return-object p0
.end method

.method public final f(Lorg/chromium/gfx/mojom/Rect;)Z
    .registers 5

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/WindowManager$LayoutParams;

    iget v0, p0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v1, p1, Lorg/chromium/gfx/mojom/Rect;->b:I

    if-ne v0, v1, :cond_1e

    iget v0, p0, Landroid/view/WindowManager$LayoutParams;->y:I

    iget v2, p1, Lorg/chromium/gfx/mojom/Rect;->c:I

    if-ne v0, v2, :cond_1e

    iget v0, p0, Landroid/view/WindowManager$LayoutParams;->width:I

    iget v2, p1, Lorg/chromium/gfx/mojom/Rect;->d:I

    if-ne v0, v2, :cond_1e

    iget v0, p0, Landroid/view/WindowManager$LayoutParams;->height:I

    iget v2, p1, Lorg/chromium/gfx/mojom/Rect;->e:I

    if-ne v0, v2, :cond_1e

    const/4 p0, 0x0

    return p0

    :cond_1e
    iput v1, p0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v0, p1, Lorg/chromium/gfx/mojom/Rect;->c:I

    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->y:I

    iget v0, p1, Lorg/chromium/gfx/mojom/Rect;->d:I

    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->width:I

    iget p1, p1, Lorg/chromium/gfx/mojom/Rect;->e:I

    iput p1, p0, Landroid/view/WindowManager$LayoutParams;->height:I

    const/4 p0, 0x1

    return p0
.end method

.method public final g(Lzid;)Lajd;
    .registers 2

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    iget-object p1, p1, Lzid;->a:[B

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lajd;

    return-object p0
.end method

.method public final i(Landroid/os/IBinder;)V
    .registers 6

    iget-object v0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/Dialog;

    if-eqz v0, :cond_59

    iget-object v1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;

    if-eqz v1, :cond_59

    if-eqz p1, :cond_37

    iget-object v2, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    iget-object v3, v2, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-eqz v3, :cond_18

    if-ne p1, v3, :cond_37

    :cond_18
    if-eq v3, p1, :cond_59

    iput-object p1, v2, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    new-instance v0, Lw77;

    invoke-direct {v0, p0}, Lw77;-><init>(Lx77;)V

    invoke-virtual {p1, v0}, Landroid/view/Window;->takeSurface(Landroid/view/SurfaceHolder$Callback2;)V

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Landroid/app/Dialog;

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    return-void

    :cond_37
    iget-object p1, v1, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;->c:Lx77;

    if-eqz p1, :cond_41

    invoke-virtual {v1}, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;->l()V

    invoke-virtual {v1}, Lorg/chromium/content/browser/androidoverlay/DialogOverlayImpl;->k()V

    :cond_41
    const/4 p1, 0x0

    iput-object p1, p0, Lx77;->b:Ljava/lang/Object;

    iget-object v0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/Dialog;

    if-eqz v0, :cond_57

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_57

    :try_start_50
    iget-object v0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_57} :catch_57

    :catch_57
    :cond_57
    iput-object p1, p0, Lx77;->c:Ljava/lang/Object;

    :cond_59
    return-void
.end method

.method public final j(Ljava/lang/String;)Lzc7;
    .registers 10

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_8

    :cond_18
    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Lr9i;

    if-eqz p1, :cond_c6

    new-instance v0, Lfd7;

    iget-object v1, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Lj06;

    iget-object v3, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, v3}, Lfd7;-><init>(Ljava/util/ArrayList;Lj06;Ljava/util/ArrayList;)V

    const/4 v1, 0x0

    :cond_30
    :goto_30
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    move v3, v1

    :goto_35
    const/4 v4, -0x1

    const/16 v5, 0xd

    const/16 v6, 0xa

    if-ge v3, v2, :cond_47

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v7, v6, :cond_48

    if-eq v7, v5, :cond_48

    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    :cond_47
    move v3, v4

    :cond_48
    if-eq v3, v4, :cond_69

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfd7;->i(Ljava/lang/String;)V

    add-int/lit8 v1, v3, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_30

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v5, :cond_30

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v6, :cond_30

    add-int/lit8 v3, v3, 0x2

    move v1, v3

    goto :goto_30

    :cond_69
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_7e

    if-eqz v1, :cond_77

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_7e

    :cond_77
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lfd7;->i(Ljava/lang/String;)V

    :cond_7e
    iget-object p1, v0, Lfd7;->n:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Lfd7;->f(Ljava/util/ArrayList;)V

    new-instance p1, Lc5o;

    iget-object v1, v0, Lfd7;->k:Ljava/util/ArrayList;

    iget-object v2, v0, Lfd7;->m:Ljava/util/LinkedHashMap;

    invoke-direct {p1, v1, v2}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v0, Lfd7;->j:Lj06;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lg8b;

    invoke-direct {v1, p1}, Lg8b;-><init>(Lc5o;)V

    iget-object p1, v0, Lfd7;->o:Ljava/util/LinkedHashSet;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_ac

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj3;

    invoke-virtual {v2, v1}, Lj3;->g(Lg8b;)V

    goto :goto_9c

    :cond_ac
    iget-object p1, v0, Lfd7;->l:Lad7;

    iget-object p1, p1, Lad7;->b:Lhi3;

    check-cast p1, Lzc7;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c1

    return-object p1

    :cond_c1
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_c6
    const-string p0, "input must not be null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final k(Ljava/util/List;)Ljava/util/ArrayList;
    .registers 21

    move-object/from16 v2, p0

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Iterable;

    new-instance v7, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_15
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_187

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/service/autofill/FillContext;

    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Landroid/service/autofill/FillContext;->getStructure()Landroid/app/assist/AssistStructure;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/assist/AssistStructure;->getActivityComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    sget-object v3, Lsq2;->d:Lrbe;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lsq2;->f:Lh58;

    invoke-virtual {v3}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_42
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v9, 0x0

    if-eqz v6, :cond_59

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v10, v6

    check-cast v10, Lsq2;

    iget-object v10, v10, Lsq2;->a:Ljava/lang/String;

    invoke-static {v10, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_42

    goto :goto_5a

    :cond_59
    move-object v6, v9

    :goto_5a
    check-cast v6, Lsq2;

    if-eqz v6, :cond_76

    sget-object v3, Lrab;->a:Lqab;

    iget-object v3, v2, Lx77;->d:Ljava/lang/Object;

    check-cast v3, Lzif;

    invoke-virtual {v3}, Lzif;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageManager;

    iget-object v10, v6, Lsq2;->b:Ljava/util/Set;

    sget-object v11, Lqab;->c:Lqab;

    invoke-static {v3, v4, v10, v11}, Lrab;->d(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/util/Set;Lqab;)Z

    move-result v3

    if-eqz v3, :cond_76

    move-object v3, v6

    goto :goto_77

    :cond_76
    move-object v3, v9

    :goto_77
    invoke-virtual {v0}, Landroid/service/autofill/FillContext;->getStructure()Landroid/app/assist/AssistStructure;

    move-result-object v10

    new-instance v0, Lc39;

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lc39;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v10}, Landroid/app/assist/AssistStructure;->getWindowNodeCount()I

    move-result v1

    const/4 v4, 0x0

    :goto_86
    if-ge v4, v1, :cond_96

    invoke-virtual {v10, v4}, Landroid/app/assist/AssistStructure;->getWindowNodeAt(I)Landroid/app/assist/AssistStructure$WindowNode;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/assist/AssistStructure$WindowNode;->getRootViewNode()Landroid/app/assist/AssistStructure$ViewNode;

    move-result-object v6

    invoke-static {v6, v0, v9}, Ln6h;->r(Landroid/app/assist/AssistStructure$ViewNode;Lc39;Ljava/lang/String;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_86

    :cond_96
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9e
    :goto_9e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v6, v1

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v9, 0x0

    :goto_bd
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_118

    add-int/lit8 v10, v9, 0x1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lf39;

    iget-object v11, v11, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getWidth()I

    move-result v12

    if-lez v12, :cond_116

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getHeight()I

    move-result v12

    if-lez v12, :cond_116

    new-instance v14, Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getLeft()I

    move-result v12

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getTop()I

    move-result v13

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getLeft()I

    move-result v15

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getWidth()I

    move-result v16

    add-int v15, v16, v15

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getTop()I

    move-result v16

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getHeight()I

    move-result v17

    add-int v3, v17, v16

    invoke-direct {v14, v12, v13, v15, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillHints()[Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillOptions()[Ljava/lang/CharSequence;

    move-result-object v16

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getHint()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v11}, Landroid/app/assist/AssistStructure$ViewNode;->getText()Ljava/lang/CharSequence;

    move-result-object v18

    new-instance v13, Lh39;

    invoke-direct/range {v13 .. v18}, Lh39;-><init>(Landroid/graphics/Rect;[Ljava/lang/String;[Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/CharSequence;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v13, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_116
    move v9, v10

    goto :goto_bd

    :cond_118
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9e

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_12b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_143

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12b

    :cond_143
    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-interface {v1, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_9e

    :cond_14b
    new-instance v0, Lg39;

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_156

    sget-object v1, Ll08;->a:Ll08;

    goto :goto_17f

    :cond_156
    sget-object v1, Le39;->o:Le39;

    invoke-virtual {v1, v5}, Lalo;->Z(Ljava/util/LinkedHashMap;)Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_17f

    sget-object v1, Le39;->m:Le39;

    invoke-virtual {v1, v5}, Lalo;->Z(Ljava/util/LinkedHashMap;)Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_17f

    sget-object v1, Le39;->n:Le39;

    invoke-virtual {v1, v5}, Lalo;->Z(Ljava/util/LinkedHashMap;)Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_17f

    new-instance v1, Ld39;

    iget-object v3, v2, Lx77;->c:Ljava/lang/Object;

    check-cast v3, Lvu2;

    invoke-direct {v1, v3}, Ld39;-><init>(Lvu2;)V

    invoke-virtual {v1, v5}, Lalo;->Z(Ljava/util/LinkedHashMap;)Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_17f

    sget-object v1, Ll08;->a:Ll08;

    :cond_17f
    :goto_17f
    invoke-direct {v0, v1}, Lg39;-><init>(Ljava/util/List;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_15

    :cond_187
    return-object v7
.end method

.method public final l(Lzid;)V
    .registers 4

    invoke-virtual {p0, p1}, Lx77;->g(Lzid;)Lajd;

    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    iget-object v1, p1, Lzid;->a:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lzid;->b:[B

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1f
    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Llv7;

    invoke-virtual {v0}, Llv7;->invoke()Ljava/lang/Object;

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Liy1;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Liy1;->g(Ljava/lang/String;Z)V

    return-void
.end method

.method public final n(Ldp2;IZ)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v6, p2

    iget-object v2, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v2, Lydi;

    new-instance v3, Landroid/content/ComponentName;

    iget-object v4, v0, Lx77;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    const-class v5, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v5, "jobscheduler"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Landroid/app/job/JobScheduler;

    new-instance v5, Ljava/util/zip/Adler32;

    invoke-direct {v5}, Ljava/util/zip/Adler32;-><init>()V

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v7, "UTF-8"

    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/zip/Adler32;->update([B)V

    iget-object v9, v1, Ldp2;->a:Ljava/lang/String;

    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/zip/Adler32;->update([B)V

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v10, v1, Ldp2;->c:Lmyg;

    invoke-static {v10}, Lryg;->a(Lmyg;)I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/zip/Adler32;->update([B)V

    iget-object v11, v1, Ldp2;->b:[B

    if-eqz v11, :cond_5e

    invoke-virtual {v5, v11}, Ljava/util/zip/Adler32;->update([B)V

    :cond_5e
    invoke-virtual {v5}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide v4

    long-to-int v12, v4

    const-string v13, "attemptNumber"

    if-nez p3, :cond_93

    invoke-virtual {v8}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_93

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/job/JobInfo;

    invoke-virtual {v5}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v7

    invoke-virtual {v7, v13}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v5}, Landroid/app/job/JobInfo;->getId()I

    move-result v5

    if-ne v5, v12, :cond_6f

    if-lt v7, v6, :cond_93

    const-string v0, "Upload for context %s is already scheduled. Returning..."

    const-string v2, "JobInfoScheduler"

    invoke-static {v1, v2, v0}, Lmkh;->q(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_93
    invoke-virtual {v2}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-static {v10}, Lryg;->a(Lmyg;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v9, v5}, [Ljava/lang/String;

    move-result-object v5

    const-string v7, "SELECT next_request_ms FROM transport_contexts WHERE backend_name = ? and priority = ?"

    invoke-virtual {v4, v7, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    :try_start_a9
    move-object v5, v4

    check-cast v5, Landroid/database/Cursor;

    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    const/4 v14, 0x0

    if-eqz v7, :cond_bc

    invoke-interface {v5, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto :goto_c2

    :cond_bc
    const-wide/16 v15, 0x0

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5
    :try_end_c2
    .catchall {:try_start_a9 .. :try_end_c2} :catchall_180

    :goto_c2
    move-object v15, v5

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    if-eqz p3, :cond_df

    new-instance v7, Ludi;

    invoke-direct {v7, v2, v1, v14}, Ludi;-><init>(Lydi;Ldp2;B)V

    invoke-virtual {v2, v7}, Lydi;->l(Lwdi;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_df

    const/4 v7, 0x1

    goto :goto_e0

    :cond_df
    move v7, v14

    :goto_e0
    iget-object v2, v0, Lx77;->d:Ljava/lang/Object;

    check-cast v2, Lno2;

    new-instance v14, Landroid/app/job/JobInfo$Builder;

    invoke-direct {v14, v12, v3}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    iget-object v3, v1, Ldp2;->c:Lmyg;

    move-object/from16 v17, v10

    move-object/from16 v16, v11

    invoke-virtual/range {v2 .. v7}, Lno2;->a(Lmyg;JIZ)J

    move-result-wide v10

    invoke-virtual {v14, v10, v11}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    iget-object v2, v2, Lno2;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Loo2;

    iget-object v2, v2, Loo2;->c:Ljava/util/Set;

    sget-object v3, Lwmi;->a:Lwmi;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10e

    const/4 v3, 0x2

    invoke-virtual {v14, v3}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    const/4 v3, 0x1

    goto :goto_112

    :cond_10e
    const/4 v3, 0x1

    invoke-virtual {v14, v3}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    :goto_112
    sget-object v10, Lwmi;->c:Lwmi;

    invoke-interface {v2, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_11d

    invoke-virtual {v14, v3}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    :cond_11d
    sget-object v10, Lwmi;->b:Lwmi;

    invoke-interface {v2, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_128

    invoke-virtual {v14, v3}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    :cond_128
    new-instance v2, Landroid/os/PersistableBundle;

    invoke-direct {v2}, Landroid/os/PersistableBundle;-><init>()V

    invoke-virtual {v2, v13, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v3, "backendName"

    invoke-virtual {v2, v3, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "priority"

    invoke-static/range {v17 .. v17}, Lryg;->a(Lmyg;)I

    move-result v9

    invoke-virtual {v2, v3, v9}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    if-eqz v16, :cond_14c

    const-string v3, "extras"

    move-object/from16 v9, v16

    const/4 v10, 0x0

    invoke-static {v9, v10}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v3, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14c
    invoke-virtual {v14, v2}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget-object v0, v0, Lx77;->d:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lno2;

    iget-object v3, v1, Ldp2;->c:Lmyg;

    invoke-virtual/range {v2 .. v7}, Lno2;->a(Lmyg;JIZ)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v9, v0, v15, v2}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "TRuntime.JobInfoScheduler"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_178

    const-string v1, "Scheduling upload for context %s with jobId=%d in %dms(Backend next call timestamp %d). Attempt %d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_178
    invoke-virtual {v14}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    return-void

    :catchall_180
    move-exception v0

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public final o(Lzid;[BLuid;)V
    .registers 8

    invoke-virtual {p0, p1}, Lx77;->g(Lzid;)Lajd;

    move-result-object v0

    iput-object p2, p1, Lzid;->c:[B

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Lhp2;

    new-instance p1, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;

    iget-object p2, v0, Lajd;->a:Lzid;

    iget-object v1, p2, Lzid;->a:[B

    iget-object p2, p2, Lzid;->c:[B

    iget-object v2, v0, Lajd;->b:Ljava/lang/String;

    iget v0, v0, Lajd;->c:I

    invoke-direct {p1, v1, p2, v2, v0}, Lorg/chromium/media/MediaDrmStorageBridge$PersistentInfo;-><init>([B[BLjava/lang/String;I)V

    iget-wide v0, p0, Lhp2;->b:J

    const-wide/16 v2, -0x1

    cmp-long p0, v0, v2

    if-eqz p0, :cond_25

    invoke-static {v0, v1, p1, p3}, LJ/N;->MeALR1v2(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_25
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p3, p0}, Luid;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public final p()V
    .registers 5

    iget-byte v0, p0, Lx77;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_5a

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Liv7;

    iget-object v2, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v2, Lndc;

    invoke-interface {v2}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    check-cast v2, Lqdc;

    iget-object v2, v2, Lqdc;->i:Lqcc;

    sget-object v3, Lqcc;->b:Lqcc;

    invoke-virtual {v2, v3}, Lqcc;->d(Lqcc;)Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll0a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_2b
    iget-boolean p0, v0, Liv7;->j:Z

    if-eqz p0, :cond_3e

    iput-boolean v1, v0, Liv7;->j:Z

    iget-object p0, v0, Liv7;->k:Lpde;

    invoke-virtual {v0}, Liv7;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_3e
    return-void

    :pswitch_3f
    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Lns8;

    const/4 v2, 0x1

    if-eqz p0, :cond_52

    invoke-virtual {p0}, Lns8;->getItemCount()I

    move-result p0

    if-nez p0, :cond_51

    move v1, v2

    :cond_51
    move v2, v1

    :cond_52
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_data_5a
    .packed-switch 0x7
        :pswitch_3f
    .end packed-switch
.end method

.method public final q()V
    .registers 4

    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lmcj;

    iget-object v0, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    const/16 v2, 0x10

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_23

    or-int/2addr v1, v2

    goto :goto_25

    :cond_23
    and-int/lit8 v1, v1, -0x11

    :goto_25
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method
