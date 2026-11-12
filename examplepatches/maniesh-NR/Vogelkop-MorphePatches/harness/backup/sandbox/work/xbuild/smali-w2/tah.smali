.class public final Ltah;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvga;
.implements Ldmk;
.implements Lhf3;
.implements Lb0i;


# static fields
.field public static final l:Lalb;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lalb;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lalb;-><init>(B)V

    sput-object v0, Ltah;->l:Lalb;

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    const/16 v0, 0x9

    iput-byte v0, p0, Ltah;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lf1p;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lf1p;-><init>(B)V

    iput-object v0, p0, Ltah;->i:Ljava/lang/Object;

    new-instance v0, Lisc;

    invoke-direct {v0}, Lisc;-><init>()V

    iput-object v0, p0, Ltah;->j:Ljava/lang/Object;

    new-instance v2, Lwng;

    const/16 v0, 0x14

    invoke-direct {v2, v0}, Lwng;-><init>(I)V

    new-instance v3, Lhr5;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    new-instance v4, Lir5;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lua7;

    const/16 v6, 0x9

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v6}, Lua7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    iput-object v1, p0, Ltah;->k:Ljava/lang/Object;

    new-instance v0, Lk5o;

    invoke-direct {v0, v1}, Lk5o;-><init>(Lua7;)V

    iput-object v0, p0, Ltah;->c:Ljava/lang/Object;

    new-instance v0, Lo28;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lo28;-><init>(B)V

    iput-object v0, p0, Ltah;->d:Ljava/lang/Object;

    new-instance v2, Lmgh;

    const/4 v0, 0x1

    invoke-direct {v2, v0}, Lmgh;-><init>(B)V

    iput-object v2, p0, Ltah;->b:Ljava/lang/Object;

    new-instance v0, Ls64;

    const/4 v3, 0x4

    invoke-direct {v0, v3}, Ls64;-><init>(B)V

    iput-object v0, p0, Ltah;->e:Ljava/lang/Object;

    new-instance v0, Lrc6;

    invoke-direct {v0, v1}, Lrc6;-><init>(B)V

    iput-object v0, p0, Ltah;->f:Ljava/lang/Object;

    new-instance v0, Lvk;

    const/4 v3, 0x3

    invoke-direct {v0, v3}, Lvk;-><init>(B)V

    iput-object v0, p0, Ltah;->g:Ljava/lang/Object;

    new-instance v0, Ld14;

    const/4 v3, 0x2

    invoke-direct {v0, v3}, Ld14;-><init>(B)V

    iput-object v0, p0, Ltah;->h:Ljava/lang/Object;

    const-string p0, "Gif"

    const-string v0, "Bitmap"

    const-string v3, "BitmapDrawable"

    filled-new-array {p0, v0, v3}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    const-string p0, "legacy_prepend_all"

    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const-string p0, "legacy_append"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-enter v2

    :try_start_8d
    new-instance p0, Ljava/util/ArrayList;

    iget-object v3, v2, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-direct {p0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v3, v2, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :goto_a2
    if-ge v4, v3, :cond_b4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    iget-object v6, v2, Lmgh;->b:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a2

    :cond_b4
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    :cond_b8
    :goto_b8
    if-ge v1, v3, :cond_d0

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b8

    iget-object v5, v2, Lmgh;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_cf
    .catchall {:try_start_8d .. :try_end_cf} :catchall_d4

    goto :goto_b8

    :cond_d0
    monitor-exit v2

    return-void

    :goto_d2
    :try_start_d2
    monitor-exit v2
    :try_end_d3
    .catchall {:try_start_d2 .. :try_end_d3} :catchall_d4

    throw p0

    :catchall_d4
    move-exception v0

    move-object p0, v0

    goto :goto_d2
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    .line 324
    iput-byte p1, p0, Ltah;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lx5f;Lfd;Ljze;Lcom/opera/android/settings/SettingsManager;Lfw3;Landroid/view/ViewGroup;Lk6l;Lv1f;Lbq3;Lxj;)V
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    const/4 v6, 0x2

    iput-byte v6, v0, Ltah;->a:B

    .line 251
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 252
    iput-object v3, v0, Ltah;->c:Ljava/lang/Object;

    .line 253
    iput-object v4, v0, Ltah;->d:Ljava/lang/Object;

    move-object/from16 v6, p8

    .line 254
    iput-object v6, v0, Ltah;->b:Ljava/lang/Object;

    move-object/from16 v6, p9

    .line 255
    iput-object v6, v0, Ltah;->e:Ljava/lang/Object;

    move-object/from16 v6, p10

    .line 256
    iput-object v6, v0, Ltah;->f:Ljava/lang/Object;

    move-object/from16 v6, p11

    .line 257
    iput-object v6, v0, Ltah;->g:Ljava/lang/Object;

    const v6, 0x7f0a0108

    .line 258
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    iput-object v6, v0, Ltah;->h:Ljava/lang/Object;

    const v7, 0x7f0a018b

    .line 259
    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iput-object v7, v0, Ltah;->i:Ljava/lang/Object;

    const v8, 0x7f0a04db

    .line 260
    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    iput-object v8, v0, Ltah;->j:Ljava/lang/Object;

    .line 261
    new-instance v8, Lhd;

    .line 262
    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v9

    .line 263
    new-instance v10, Lva2;

    const/16 v11, 0x17

    invoke-direct {v10, v0, v11}, Lva2;-><init>(Ljava/lang/Object;B)V

    .line 264
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 265
    new-instance v11, Ljf;

    .line 266
    new-instance v12, Lwhf;

    const/16 v13, 0xb

    invoke-direct {v12, v5, v13}, Lwhf;-><init>(Ljava/lang/Object;B)V

    .line 267
    new-instance v13, Lwhf;

    const/16 v5, 0xc

    invoke-direct {v13, v2, v5}, Lwhf;-><init>(Ljava/lang/Object;B)V

    const/4 v15, 0x0

    const/16 v16, 0x3c

    const/4 v14, 0x0

    .line 268
    invoke-direct/range {v11 .. v16}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    .line 269
    invoke-direct {v8, v9, v2, v10, v11}, Lhd;-><init>(Ltcc;Lfd;Lva2;Ljf;)V

    iput-object v8, v0, Ltah;->k:Ljava/lang/Object;

    .line 270
    new-instance v2, Lqb7;

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v5

    .line 271
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 272
    iput-object v3, v2, Lqb7;->a:Ljava/lang/Object;

    .line 273
    iput-object v4, v2, Lqb7;->b:Ljava/lang/Object;

    move-object/from16 v9, p2

    .line 274
    iput-object v9, v2, Lqb7;->c:Ljava/lang/Object;

    .line 275
    new-instance v9, Ls9;

    const/4 v10, 0x5

    invoke-direct {v9, v2, v10}, Ls9;-><init>(Ljava/lang/Object;B)V

    .line 276
    new-instance v10, Loc2;

    const/16 v11, 0xd

    invoke-direct {v10, v2, v11}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v5, v9, v10}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    .line 277
    invoke-virtual {v6}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 278
    invoke-static/range {p5 .. p6}, Lvtp;->I(Lcom/opera/android/settings/SettingsManager;Lfw3;)Ljava/util/List;

    move-result-object v2

    .line 279
    invoke-virtual {v8, v2}, Lhd;->x(Ljava/util/List;)V

    .line 280
    new-instance v2, Ls9;

    const/4 v4, 0x7

    invoke-direct {v2, v0, v4}, Ls9;-><init>(Ljava/lang/Object;B)V

    .line 281
    new-instance v4, Lvme;

    const/16 v5, 0x13

    invoke-direct {v4, v5}, Lvme;-><init>(B)V

    invoke-static {v3, v1, v2, v4}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    .line 282
    new-instance v2, Lbo3;

    const/4 v3, 0x4

    invoke-direct {v2, v0, v3}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lpb;

    const/16 v4, 0x19

    invoke-direct {v3, v2, v4}, Lpb;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v2, p4

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    .line 283
    new-instance v1, Lgf;

    const/16 v2, 0x1b

    invoke-direct {v1, v0, v2}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lipn;Lipn;Lesk;Llrk;Llrk;Lqq6;Lnv6;Lole;)V
    .registers 12

    const/4 p6, 0x5

    iput-byte p6, p0, Ltah;->a:B

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 285
    iput-object p1, p0, Ltah;->c:Ljava/lang/Object;

    .line 286
    iput-object p2, p0, Ltah;->d:Ljava/lang/Object;

    .line 287
    iput-object p3, p0, Ltah;->b:Ljava/lang/Object;

    .line 288
    iput-object p4, p0, Ltah;->e:Ljava/lang/Object;

    .line 289
    iput-object p5, p0, Ltah;->f:Ljava/lang/Object;

    .line 290
    iput-object p7, p0, Ltah;->g:Ljava/lang/Object;

    .line 291
    iput-object p8, p0, Ltah;->h:Ljava/lang/Object;

    .line 292
    iput-object p9, p0, Ltah;->i:Ljava/lang/Object;

    .line 293
    iput-object p10, p0, Ltah;->j:Ljava/lang/Object;

    .line 294
    iput-object p11, p0, Ltah;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcvg;Lnvg;Lcvg;Ldb;Lxb;Lfmk;Laf3;Lslk;Lskm;Lebh;)V
    .registers 13

    const/16 v0, 0x8

    iput-byte v0, p0, Ltah;->a:B

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 326
    new-instance v0, Lode;

    new-instance v1, Levg;

    invoke-direct {v1}, Levg;-><init>()V

    .line 327
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 328
    iput-object v0, p0, Ltah;->j:Ljava/lang/Object;

    .line 329
    iput-object p2, p0, Ltah;->c:Ljava/lang/Object;

    .line 330
    iput-object p3, p0, Ltah;->d:Ljava/lang/Object;

    .line 331
    iput-object p4, p0, Ltah;->b:Ljava/lang/Object;

    .line 332
    iput-object p5, p0, Ltah;->e:Ljava/lang/Object;

    .line 333
    iput-object p6, p0, Ltah;->f:Ljava/lang/Object;

    .line 334
    new-instance p2, Lc0i;

    invoke-direct {p2, p1, p5, p8, p0}, Lc0i;-><init>(Lltl;Lxb;Lslk;Lb0i;)V

    iput-object p2, p0, Ltah;->g:Ljava/lang/Object;

    .line 335
    new-instance p2, Lqb7;

    invoke-direct {p2, p7, p9}, Lqb7;-><init>(Laf3;Lskm;)V

    iput-object p2, p0, Ltah;->h:Ljava/lang/Object;

    .line 336
    iput-object p8, p0, Ltah;->i:Ljava/lang/Object;

    .line 337
    iput-object p10, p0, Ltah;->k:Ljava/lang/Object;

    if-nez p10, :cond_3e

    .line 338
    iget-object p2, p6, Lfmk;->c:Lode;

    .line 339
    new-instance p3, Ld8d;

    const/16 p4, 0x1a

    invoke-direct {p3, p0, p4}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1, p3}, Lekc;->j(Lndc;Lf7f;)V

    goto :goto_4b

    .line 340
    :cond_3e
    invoke-virtual {p10}, Lebh;->c()V

    .line 341
    iget-object p2, p10, Lebh;->a:Lode;

    .line 342
    new-instance p3, Lhze;

    invoke-direct {p3, p0, p1}, Lhze;-><init>(Ltah;Lcvg;)V

    invoke-virtual {p2, p1, p3}, Lekc;->j(Lndc;Lf7f;)V

    :goto_4b
    return-void
.end method

.method public constructor <init>(Lcw3;Lumi;Lq32;Lx12;Lny1;Lqy1;Lf0a;)V
    .registers 9

    const/4 v0, 0x4

    iput-byte v0, p0, Ltah;->a:B

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    iput-object p2, p0, Ltah;->c:Ljava/lang/Object;

    .line 239
    iput-object p3, p0, Ltah;->d:Ljava/lang/Object;

    .line 240
    iput-object p4, p0, Ltah;->b:Ljava/lang/Object;

    .line 241
    iput-object p5, p0, Ltah;->e:Ljava/lang/Object;

    .line 242
    iput-object p6, p0, Ltah;->f:Ljava/lang/Object;

    .line 243
    iput-object p7, p0, Ltah;->g:Ljava/lang/Object;

    .line 244
    new-instance p2, Lpde;

    .line 245
    sget-object p3, Ll08;->a:Ll08;

    .line 246
    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 247
    iput-object p2, p0, Ltah;->h:Ljava/lang/Object;

    .line 248
    new-instance p2, Lal7;

    const/16 p3, 0xf

    invoke-direct {p2, p1, p3}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ltah;->i:Ljava/lang/Object;

    .line 249
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Ltah;->j:Ljava/lang/Object;

    .line 250
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Ltah;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Li16;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ltah;->a:B

    .line 366
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 367
    iput-object p1, p0, Ltah;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm3c;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Ltah;->a:B

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltah;->c:Ljava/lang/Object;

    .line 227
    new-instance v0, Lsye;

    .line 228
    invoke-direct {v0}, Lb8e;-><init>()V

    const/4 v1, -0x1

    .line 229
    iput v1, v0, Lb8e;->d:I

    .line 230
    iput-object v0, p0, Ltah;->d:Ljava/lang/Object;

    .line 231
    new-instance v0, Lj8b;

    invoke-direct {v0, p1}, Lj8b;-><init>(Lm3c;)V

    iput-object v0, p0, Ltah;->b:Ljava/lang/Object;

    .line 232
    iput-object v0, p0, Ltah;->e:Ljava/lang/Object;

    .line 233
    iget-object p1, v0, Lj8b;->b0:Llbl;

    iput-object p1, p0, Ltah;->f:Ljava/lang/Object;

    .line 234
    iput-object p1, p0, Ltah;->g:Ljava/lang/Object;

    .line 235
    new-instance p1, Ldee;

    invoke-direct {p1}, Ldee;-><init>()V

    .line 236
    iput-object p1, p0, Ltah;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnw3;Lcom/opera/android/Lazy;Lnw3;Lmw3;Lnw3;Lnw3;Lnw3;Lkw3;Lhw3;Lnw3;)V
    .registers 12

    const/16 v0, 0xc

    iput-byte v0, p0, Ltah;->a:B

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    iput-object p1, p0, Ltah;->c:Ljava/lang/Object;

    .line 217
    iput-object p2, p0, Ltah;->d:Ljava/lang/Object;

    .line 218
    iput-object p3, p0, Ltah;->b:Ljava/lang/Object;

    .line 219
    iput-object p4, p0, Ltah;->e:Ljava/lang/Object;

    .line 220
    iput-object p5, p0, Ltah;->f:Ljava/lang/Object;

    .line 221
    iput-object p6, p0, Ltah;->g:Ljava/lang/Object;

    .line 222
    iput-object p7, p0, Ltah;->h:Ljava/lang/Object;

    .line 223
    iput-object p8, p0, Ltah;->i:Ljava/lang/Object;

    .line 224
    iput-object p9, p0, Ltah;->j:Ljava/lang/Object;

    .line 225
    iput-object p10, p0, Ltah;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqi8;Lmi8;Lkzk;I)V
    .registers 7

    const/16 v0, 0xa

    iput-byte v0, p0, Ltah;->a:B

    .line 343
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 344
    iput-object p1, p0, Ltah;->c:Ljava/lang/Object;

    .line 345
    iput-object p2, p0, Ltah;->b:Ljava/lang/Object;

    .line 346
    iput-object p3, p0, Ltah;->e:Ljava/lang/Object;

    .line 347
    new-instance p2, Ldql;

    invoke-direct {p2}, Ldql;-><init>()V

    iput-object p2, p0, Ltah;->f:Ljava/lang/Object;

    .line 348
    iget-object p2, p1, Lqi8;->u:Landroid/os/Looper;

    .line 349
    new-instance v0, Lcj5;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lcj5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p2, v0}, Lkzk;->a(Landroid/os/Looper;Landroid/os/Handler$Callback;)Lszk;

    move-result-object p2

    iput-object p2, p0, Ltah;->g:Ljava/lang/Object;

    .line 350
    new-instance p2, Lijk;

    invoke-direct {p2, p0}, Lijk;-><init>(Ltah;)V

    iput-object p2, p0, Ltah;->h:Ljava/lang/Object;

    .line 351
    new-instance p2, Ljjk;

    invoke-direct {p2, p0, p4}, Ljjk;-><init>(Ltah;I)V

    iput-object p2, p0, Ltah;->i:Ljava/lang/Object;

    .line 352
    new-instance p2, Leo7;

    invoke-direct {p2, p0}, Leo7;-><init>(Ltah;)V

    iput-object p2, p0, Ltah;->j:Ljava/lang/Object;

    .line 353
    new-instance p2, Lsea;

    invoke-direct {p2, p0}, Lsea;-><init>(Ltah;)V

    iput-object p2, p0, Ltah;->k:Ljava/lang/Object;

    .line 354
    new-instance p2, Lfkg;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lfkg;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ltah;->d:Ljava/lang/Object;

    .line 355
    iget-object p0, p1, Lqi8;->n:Lijc;

    invoke-virtual {p0, p2}, Lijc;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lydn;Lcom/opera/android/Lazy;Ly1n;Landroid/view/View;Lyug;Lgmk;Ljjg;Ly1n;)V
    .registers 10

    const/16 v0, 0xb

    iput-byte v0, p0, Ltah;->a:B

    .line 356
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 357
    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ltah;->c:Ljava/lang/Object;

    .line 358
    iput-object p1, p0, Ltah;->d:Ljava/lang/Object;

    .line 359
    iput-object p2, p0, Ltah;->b:Ljava/lang/Object;

    .line 360
    iput-object p3, p0, Ltah;->e:Ljava/lang/Object;

    .line 361
    iput-object p4, p0, Ltah;->g:Ljava/lang/Object;

    .line 362
    iput-object p5, p0, Ltah;->h:Ljava/lang/Object;

    .line 363
    iput-object p6, p0, Ltah;->i:Ljava/lang/Object;

    .line 364
    iput-object p7, p0, Ltah;->j:Ljava/lang/Object;

    .line 365
    iput-object p8, p0, Ltah;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzyk;Landroid/content/Context;Lwm2;Li16;Ljf4;Livg;Lyg4;)V
    .registers 14

    const/4 v0, 0x3

    iput-byte v0, p0, Ltah;->a:B

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    iput-object p1, p0, Ltah;->c:Ljava/lang/Object;

    .line 297
    iput-object p5, p0, Ltah;->d:Ljava/lang/Object;

    .line 298
    iput-object p6, p0, Ltah;->b:Ljava/lang/Object;

    .line 299
    iput-object p7, p0, Ltah;->e:Ljava/lang/Object;

    .line 300
    new-instance p5, Ltc4;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Lqe4;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqe4;

    invoke-virtual {p1}, Lqe4;->b()Lxc4;

    move-result-object p1

    invoke-direct {p5, p6, p1}, Ltc4;-><init>(Lqe4;Lxc4;)V

    iput-object p5, p0, Ltah;->f:Ljava/lang/Object;

    .line 301
    new-instance v0, Li51;

    const/4 v5, 0x4

    move-object v3, p0

    move-object v1, p2

    move-object v2, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Li51;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p0

    iput-object p0, v3, Ltah;->h:Ljava/lang/Object;

    .line 302
    sget-object p1, Lv08;->a:Lv08;

    .line 303
    iput-object p1, v3, Ltah;->i:Ljava/lang/Object;

    .line 304
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, v3, Ltah;->j:Ljava/lang/Object;

    .line 305
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, v3, Ltah;->k:Ljava/lang/Object;

    .line 306
    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lda6;

    .line 307
    invoke-virtual {p0}, Lda6;->a()Lxc4;

    move-result-object p0

    invoke-static {p0}, Lxc4;->a(Lxc4;)Ljava/util/ArrayList;

    move-result-object p0

    if-eqz p0, :cond_77

    .line 308
    new-instance p1, Ljava/util/ArrayList;

    const/16 p3, 0xa

    invoke-static {p0, p3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p3

    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(I)V

    .line 309
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    :goto_67
    if-ge p2, p3, :cond_79

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    add-int/lit8 p2, p2, 0x1

    .line 310
    check-cast p4, Lsd4;

    .line 311
    iget-object p4, p4, Lsd4;->a:Ljava/lang/String;

    .line 312
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_67

    .line 313
    :cond_77
    sget-object p1, Ll08;->a:Ll08;

    .line 314
    :cond_79
    new-instance p0, Lxf2;

    .line 315
    iget-object p2, v3, Ltah;->c:Ljava/lang/Object;

    check-cast p2, Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqe4;

    invoke-virtual {p2}, Lqe4;->b()Lxc4;

    move-result-object p2

    .line 316
    invoke-virtual {p2}, Lxc4;->d()Lt94;

    move-result-object p2

    .line 317
    iget-object p2, p2, Lt94;->b:Lza4;

    .line 318
    iget-object p2, p2, Lza4;->l:Lplh;

    .line 319
    iget-object p3, v2, Lwm2;->a:Ljava/util/concurrent/Executor;

    .line 320
    invoke-static {p3}, Lfr3;->I(Ljava/util/concurrent/Executor;)Ldx5;

    move-result-object p3

    invoke-static {p3}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p3

    .line 321
    invoke-direct {p0, p2, p3, p1, v1}, Lxf2;-><init>(Lplh;La64;Ljava/util/List;Landroid/content/Context;)V

    .line 322
    iput-object p0, v3, Ltah;->g:Ljava/lang/Object;

    .line 323
    invoke-virtual {v3, p1}, Ltah;->A(Ljava/util/List;)V

    return-void
.end method

.method public static Q(La8e;La8e;Lb8e;)V
    .registers 5

    instance-of p0, p0, Lh8e;

    const/4 v0, 0x1

    if-eqz p0, :cond_19

    instance-of p0, p1, Lh8e;

    if-eqz p0, :cond_19

    check-cast p1, Lh8e;

    invoke-virtual {p1, p2}, Lh8e;->h(Lb8e;)V

    iget-boolean p0, p2, Lb8e;->n:Z

    if-eqz p0, :cond_16

    invoke-static {p2}, Lxye;->c(Lb8e;)V

    return-void

    :cond_16
    iput-boolean v0, p2, Lb8e;->j:Z

    return-void

    :cond_19
    instance-of p0, p2, Ld13;

    if-eqz p0, :cond_42

    move-object p0, p2

    check-cast p0, Ld13;

    iget-boolean v1, p0, Lb8e;->n:Z

    if-eqz v1, :cond_27

    invoke-virtual {p0}, Ld13;->U0()V

    :cond_27
    iput-object p1, p0, Ld13;->o:La8e;

    invoke-static {p1}, Lxye;->d(La8e;)I

    move-result p1

    iput p1, p0, Lb8e;->c:I

    iget-boolean p1, p0, Lb8e;->n:Z

    if-eqz p1, :cond_37

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ld13;->T0(Z)V

    :cond_37
    iget-boolean p0, p2, Lb8e;->n:Z

    if-eqz p0, :cond_3f

    invoke-static {p2}, Lxye;->c(Lb8e;)V

    return-void

    :cond_3f
    iput-boolean v0, p2, Lb8e;->j:Z

    return-void

    :cond_42
    const-string p0, "Unknown Modifier.Node type"

    invoke-static {p0}, La8b;->b(Ljava/lang/String;)V

    return-void
.end method

.method public static l(La8e;Lb8e;)Lb8e;
    .registers 4

    instance-of v0, p0, Lh8e;

    if-eqz v0, :cond_11

    check-cast p0, Lh8e;

    invoke-virtual {p0}, Lh8e;->f()Lb8e;

    move-result-object p0

    invoke-static {p0}, Lxye;->f(Lb8e;)I

    move-result v0

    iput v0, p0, Lb8e;->c:I

    goto :goto_26

    :cond_11
    new-instance v0, Ld13;

    invoke-direct {v0}, Lb8e;-><init>()V

    invoke-static {p0}, Lxye;->d(La8e;)I

    move-result v1

    iput v1, v0, Lb8e;->c:I

    iput-object p0, v0, Ld13;->o:La8e;

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    iput-object p0, v0, Ld13;->q:Ljava/util/HashSet;

    move-object p0, v0

    :goto_26
    iget-boolean v0, p0, Lb8e;->n:Z

    if-eqz v0, :cond_2f

    const-string v0, "A ModifierNodeElement cannot return an already attached node from create() "

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_2f
    const/4 v0, 0x1

    iput-boolean v0, p0, Lb8e;->i:Z

    iget-object v0, p1, Lb8e;->f:Lb8e;

    if-eqz v0, :cond_3a

    iput-object p0, v0, Lb8e;->e:Lb8e;

    iput-object v0, p0, Lb8e;->f:Lb8e;

    :cond_3a
    iput-object p0, p1, Lb8e;->f:Lb8e;

    iput-object p1, p0, Lb8e;->e:Lb8e;

    return-object p0
.end method

.method public static n(Lb8e;)Lb8e;
    .registers 4

    iget-boolean v0, p0, Lb8e;->n:Z

    if-eqz v0, :cond_18

    sget-object v1, Lxye;->a:Lzde;

    if-nez v0, :cond_d

    const-string v0, "autoInvalidateRemovedNode called on unattached node"

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_d
    const/4 v0, -0x1

    const/4 v1, 0x2

    invoke-static {p0, v0, v1}, Lxye;->a(Lb8e;II)V

    invoke-virtual {p0}, Lb8e;->Q0()V

    invoke-virtual {p0}, Lb8e;->K0()V

    :cond_18
    iget-object v0, p0, Lb8e;->f:Lb8e;

    iget-object v1, p0, Lb8e;->e:Lb8e;

    const/4 v2, 0x0

    if-eqz v0, :cond_23

    iput-object v1, v0, Lb8e;->e:Lb8e;

    iput-object v2, p0, Lb8e;->f:Lb8e;

    :cond_23
    if-eqz v1, :cond_29

    iput-object v0, v1, Lb8e;->f:Lb8e;

    iput-object v2, p0, Lb8e;->e:Lb8e;

    :cond_29
    return-object v1
.end method


# virtual methods
.method public final A(Ljava/util/List;)V
    .registers 5

    iget-object v0, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0, p1}, Ltah;->j(Ljava/util/List;)Ljava/util/LinkedHashSet;

    move-result-object p1

    iget-object v0, p0, Ltah;->j:Ljava/lang/Object;

    monitor-enter v0

    :try_start_12
    iget-object v1, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_3b

    iget-object v1, p0, Ltah;->i:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "CXCP"

    const/4 v2, 0x3

    invoke-static {v2, v1}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_39

    iget-object v1, p0, Ltah;->i:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_39
    iput-object p1, p0, Ltah;->i:Ljava/lang/Object;
    :try_end_3b
    .catchall {:try_start_12 .. :try_end_3b} :catchall_3d

    :cond_3b
    monitor-exit v0

    return-void

    :catchall_3d
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final B(Lo0g;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    iget-object v0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-virtual {p1}, Lo0g;->V()Ljava/io/File;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lry7;

    const/16 v2, 0xe

    invoke-direct {v0, p0, p1, v2}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v1, Lyo7;

    const/4 v2, 0x3

    invoke-direct {v1, p2, p0, p1, v2}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final C(Lb8e;Lwye;)V
    .registers 4

    iget-object p1, p1, Lb8e;->e:Lb8e;

    :goto_2
    if-eqz p1, :cond_2d

    iget-object v0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast v0, Lsye;

    if-ne p1, v0, :cond_21

    iget-object p1, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->u()Lm3c;

    move-result-object p1

    if-eqz p1, :cond_1b

    iget-object p1, p1, Lm3c;->F:Ltah;

    iget-object p1, p1, Ltah;->b:Ljava/lang/Object;

    check-cast p1, Lj8b;

    goto :goto_1c

    :cond_1b
    const/4 p1, 0x0

    :goto_1c
    iput-object p1, p2, Lwye;->w:Lwye;

    iput-object p2, p0, Ltah;->e:Ljava/lang/Object;

    return-void

    :cond_21
    iget v0, p1, Lb8e;->c:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_2d

    invoke-virtual {p1, p2}, Lb8e;->S0(Lwye;)V

    iget-object p1, p1, Lb8e;->e:Lb8e;

    goto :goto_2

    :cond_2d
    return-void
.end method

.method public final D()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ltah;->L(I)V

    return-void
.end method

.method public final E()V
    .registers 2

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lnvg;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnvg;->a(I)V

    return-void
.end method

.method public final F(Lpc6;)V
    .registers 4

    iget-object p0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast p0, Lrc6;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Lrc6;->a:Ljava/util/HashMap;

    invoke-interface {p1}, Lpc6;->a()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_12

    monitor-exit p0

    return-void

    :goto_10
    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_12

    throw p1

    :catchall_12
    move-exception p1

    goto :goto_10
.end method

.method public final G(Ljava/lang/Class;Ljava/lang/Class;Ljzh;)V
    .registers 6

    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lvk;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Lvk;->a:Ljava/util/ArrayList;

    new-instance v1, Lt1m;

    invoke-direct {v1, p1, p2, p3}, Lt1m;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljzh;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_13

    monitor-exit p0

    return-void

    :goto_11
    :try_start_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_13

    throw p1

    :catchall_13
    move-exception p1

    goto :goto_11
.end method

.method public final H(Z)V
    .registers 3

    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Llrk;

    new-instance v0, Lwsl;

    invoke-direct {v0, p1}, Lwsl;-><init>(Z)V

    invoke-virtual {p0, v0}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final I(Lb0a;La0a;)V
    .registers 5

    iget-object p0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_17

    return-void

    :cond_17
    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final J(I)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ltah;->L(I)V

    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lcvg;

    iget-object v1, p0, Lcvg;->r:Lz77;

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    sget-object v2, Lijm;->b:Lijm;

    if-eqz p1, :cond_23

    const/4 p0, 0x1

    if-eq p1, p0, :cond_16

    return-void

    :cond_16
    new-instance p0, Lyz5;

    const/4 p1, 0x6

    invoke-direct {p0, v0, v0, p1}, Lyz5;-><init>(ZZB)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p0, v2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_23
    new-instance p1, La0i;

    new-instance v0, Lpjg;

    const/4 v3, 0x5

    invoke-direct {v0, p0, v3}, Lpjg;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-direct {p1, v0, p0}, La0i;-><init>(Lpjg;Ly1n;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p1, v2}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final K()V
    .registers 3

    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lb8e;

    :goto_4
    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Lb8e;->P0()V

    iget-boolean v0, p0, Lb8e;->i:Z

    if-eqz v0, :cond_1d

    sget-object v0, Lxye;->a:Lzde;

    iget-boolean v0, p0, Lb8e;->n:Z

    if-nez v0, :cond_18

    const-string v0, "autoInvalidateInsertedNode called on unattached node"

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_18
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lxye;->a(Lb8e;II)V

    :cond_1d
    iget-boolean v0, p0, Lb8e;->j:Z

    if-eqz v0, :cond_24

    invoke-static {p0}, Lxye;->c(Lb8e;)V

    :cond_24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lb8e;->i:Z

    iput-boolean v0, p0, Lb8e;->j:Z

    iget-object p0, p0, Lb8e;->f:Lb8e;

    goto :goto_4

    :cond_2c
    return-void
.end method

.method public final L(I)V
    .registers 3

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lnvg;

    iget-byte v0, p0, Lnvg;->h:B

    if-eq p1, v0, :cond_19

    iput-byte p1, p0, Lnvg;->h:B

    if-nez p1, :cond_19

    iget-object p1, p0, Lnvg;->d:Lgmk;

    iget-object p1, p1, Lgmk;->a:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Luvg;

    invoke-virtual {p0, p1}, Lnvg;->b(Luvg;)V

    :cond_19
    return-void
.end method

.method public final M(Lfdn;)V
    .registers 9

    iget-object v0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast v0, Lydn;

    iget-object v1, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v1, Ljjg;

    invoke-virtual {v1}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-boolean v1, p1, Lfdn;->e:Z

    if-nez v1, :cond_1f

    iget-object v1, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v1, Ly1n;

    invoke-virtual {v1}, Ly1n;->run()V

    :cond_1f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v1, p1, Lfdn;->e:Z

    if-eqz v1, :cond_2d

    iget-object v1, p1, Lfdn;->b:Ljava/lang/String;

    invoke-static {v1}, LJ/N;->M5FruDNy(Ljava/lang/Object;)V

    goto/16 :goto_98

    :cond_2d
    iput-object p1, v0, Lydn;->N:Lfdn;

    const/4 v1, 0x4

    iput v1, v0, Lydn;->G:I

    new-instance v1, Lvdn;

    iget-object v2, v0, Lydn;->d:Lvdn;

    iget-boolean v3, v2, Lvdn;->a:Z

    invoke-virtual {v2}, Lvdn;->b()Z

    move-result v2

    const/4 v4, 0x0

    invoke-direct {v1, v3, v2, v4, v4}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    iput-object v1, v0, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lydn;->o()Lfdn;

    move-result-object v1

    invoke-virtual {p1, v1}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_85

    invoke-virtual {p1}, Lfdn;->b()Z

    move-result v1

    if-eqz v1, :cond_54

    move-object v1, p1

    goto :goto_56

    :cond_54
    iget-object v1, p1, Lfdn;->f:Lfdn;

    :goto_56
    iget-object v2, v0, Lydn;->s:Lcnk;

    invoke-virtual {v2, v4}, Lcnk;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_60
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_77

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbnk;

    iget-object v5, v3, Lbnk;->a:Ljava/lang/String;

    iget-object v6, v1, Lfdn;->b:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_60

    goto :goto_78

    :cond_77
    move-object v3, v4

    :goto_78
    if-eqz v3, :cond_82

    invoke-virtual {p1}, Lfdn;->b()Z

    move-result v1

    if-nez v1, :cond_82

    iget-object v4, p1, Lfdn;->c:Ljava/lang/String;

    :cond_82
    move-object v1, v4

    move-object v4, v3

    goto :goto_86

    :cond_85
    move-object v1, v4

    :goto_86
    iget-object v2, v0, Lydn;->c:Lgfn;

    invoke-interface {v2, v4, v1}, Lgfn;->b(Lbnk;Ljava/lang/String;)Lgfn;

    move-result-object v1

    invoke-interface {v1}, Lgfn;->d()V

    iget-object v1, v0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    if-eqz v1, :cond_98

    invoke-virtual {v0}, Lydn;->f()V

    :cond_98
    :goto_98
    iget-object v1, v0, Lydn;->e:Lsgi;

    iget-object v2, v0, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    invoke-virtual {v0}, Lydn;->m()I

    move-result v3

    invoke-virtual {v1, v3, v2}, Lsgi;->I(IZ)V

    iget-object v1, v0, Lydn;->t:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_ab
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_bb

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltdn;

    invoke-interface {v2}, Ltdn;->t()V

    goto :goto_ab

    :cond_bb
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lydn;->C(Z)V

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Li7f;)V

    :goto_c8
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d8

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/api/Callback;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_c8

    :cond_d8
    iget-object p0, p0, Ltah;->e:Ljava/lang/Object;

    check-cast p0, Ly1n;

    invoke-virtual {p0}, Ly1n;->run()V

    return-void
.end method

.method public final N()Z
    .registers 3

    iget-object p0, p0, Ltah;->i:Ljava/lang/Object;

    check-cast p0, Lslk;

    iget-object p0, p0, Lslk;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwvg;

    invoke-static {p0}, Luvg;->d(Lwvg;)Luvg;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_26

    const/4 v1, 0x2

    if-eq v0, v1, :cond_21

    const/4 v1, 0x3

    if-eq v0, v1, :cond_26

    const/4 v1, 0x4

    if-eq v0, v1, :cond_21

    const/4 p0, 0x0

    return p0

    :cond_21
    invoke-virtual {p0}, Lwvg;->b()Z

    move-result p0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final O(ILdee;Ldee;Lb8e;Z)V
    .registers 37

    move-object/from16 v1, p0

    iget-object v0, v1, Ltah;->k:Ljava/lang/Object;

    check-cast v0, Lm59;

    if-nez v0, :cond_1a

    new-instance v0, Lm59;

    move/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v2, p4

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Lm59;-><init>(Ltah;Lb8e;ILdee;Ldee;Z)V

    iput-object v0, v1, Ltah;->k:Ljava/lang/Object;

    goto :goto_2e

    :cond_1a
    move/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v2, p4

    iput-object v2, v0, Lm59;->d:Ljava/lang/Object;

    iput v3, v0, Lm59;->b:I

    iput-object v4, v0, Lm59;->e:Ljava/lang/Object;

    iput-object v5, v0, Lm59;->f:Ljava/lang/Object;

    move/from16 v6, p5

    iput-boolean v6, v0, Lm59;->c:Z

    :goto_2e
    iget-object v2, v0, Lm59;->g:Ljava/lang/Object;

    check-cast v2, Ltah;

    const/4 v6, 0x0

    iput-object v6, v1, Ltah;->k:Ljava/lang/Object;

    iget v4, v4, Ldee;->b:I

    sub-int/2addr v4, v3

    iget v5, v5, Ldee;->b:I

    sub-int/2addr v5, v3

    add-int v3, v4, v5

    const/4 v6, 0x1

    add-int/2addr v3, v6

    const/4 v7, 0x2

    div-int/2addr v3, v7

    new-instance v8, Lbg3;

    mul-int/lit8 v9, v3, 0x3

    invoke-direct {v8, v9}, Lbg3;-><init>(I)V

    new-instance v9, Lbg3;

    shl-int/lit8 v10, v3, 0x2

    invoke-direct {v9, v10}, Lbg3;-><init>(I)V

    const/4 v10, 0x0

    invoke-virtual {v9, v10, v4, v10, v5}, Lbg3;->f(IIII)V

    shl-int/2addr v3, v6

    add-int/2addr v3, v6

    new-array v11, v3, [I

    new-array v12, v3, [I

    const/4 v13, 0x5

    new-array v13, v13, [I

    :goto_5c
    iget v14, v9, Lbg3;->c:I

    move/from16 p1, v7

    if-eqz v14, :cond_27d

    iget-object v7, v9, Lbg3;->b:[I

    move/from16 p2, v10

    add-int/lit8 v10, v14, -0x1

    iput v10, v9, Lbg3;->c:I

    aget v10, v7, v10

    const/16 p3, 0x3

    add-int/lit8 v15, v14, -0x2

    iput v15, v9, Lbg3;->c:I

    aget v15, v7, v15

    add-int/lit8 v6, v14, -0x3

    iput v6, v9, Lbg3;->c:I

    aget v6, v7, v6

    add-int/lit8 v14, v14, -0x4

    iput v14, v9, Lbg3;->c:I

    aget v7, v7, v14

    sub-int v14, v6, v7

    move/from16 p5, v3

    sub-int v3, v10, v15

    move-object/from16 v16, v11

    const/4 v11, 0x1

    if-lt v14, v11, :cond_278

    if-lt v3, v11, :cond_278

    add-int v17, v14, v3

    add-int/lit8 v17, v17, 0x1

    move/from16 p4, v11

    div-int/lit8 v11, v17, 0x2

    div-int/lit8 v17, p5, 0x2

    add-int/lit8 v18, v17, 0x1

    aput v7, v16, v18

    aput v6, v12, v18

    move/from16 v18, v3

    move/from16 v3, p2

    :goto_a1
    if-ge v3, v11, :cond_278

    sub-int v19, v14, v18

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(I)I

    move-result v20

    move/from16 v21, v11

    and-int/lit8 v11, v20, 0x1

    move-object/from16 v20, v12

    move/from16 v12, p4

    if-ne v11, v12, :cond_b5

    const/4 v11, 0x1

    goto :goto_b7

    :cond_b5
    move/from16 v11, p2

    :goto_b7
    neg-int v12, v3

    move/from16 v22, v11

    move v11, v12

    :goto_bb
    const/16 v23, 0x4

    if-gt v11, v3, :cond_14d

    if-eq v11, v12, :cond_e3

    if-eq v11, v3, :cond_d6

    add-int/lit8 v24, v11, 0x1

    add-int v24, v24, v17

    move/from16 v25, v11

    aget v11, v16, v24

    add-int/lit8 v24, v25, -0x1

    add-int v24, v24, v17

    move-object/from16 v26, v13

    aget v13, v16, v24

    if-le v11, v13, :cond_da

    goto :goto_e7

    :cond_d6
    move/from16 v25, v11

    move-object/from16 v26, v13

    :cond_da
    add-int/lit8 v11, v25, -0x1

    add-int v11, v11, v17

    aget v11, v16, v11

    add-int/lit8 v13, v11, 0x1

    goto :goto_ee

    :cond_e3
    move/from16 v25, v11

    move-object/from16 v26, v13

    :goto_e7
    add-int/lit8 v11, v25, 0x1

    add-int v11, v11, v17

    aget v11, v16, v11

    move v13, v11

    :goto_ee
    sub-int v24, v13, v7

    add-int v24, v24, v15

    sub-int v24, v24, v25

    if-eqz v3, :cond_f9

    const/16 v27, 0x1

    goto :goto_fb

    :cond_f9
    move/from16 v27, p2

    :goto_fb
    if-ne v13, v11, :cond_100

    const/16 v28, 0x1

    goto :goto_102

    :cond_100
    move/from16 v28, p2

    :goto_102
    and-int v27, v27, v28

    sub-int v27, v24, v27

    move/from16 v30, v24

    move/from16 v24, v11

    move/from16 v11, v30

    :goto_10c
    if-ge v13, v6, :cond_11b

    if-ge v11, v10, :cond_11b

    invoke-virtual {v0, v13, v11}, Lm59;->a(II)Z

    move-result v28

    if-eqz v28, :cond_11b

    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v11, v11, 0x1

    goto :goto_10c

    :cond_11b
    add-int v28, v17, v25

    aput v13, v16, v28

    if-eqz v22, :cond_143

    move/from16 v28, v11

    sub-int v11, v19, v25

    move/from16 v29, v14

    add-int/lit8 v14, v12, 0x1

    if-lt v11, v14, :cond_145

    add-int/lit8 v14, v3, -0x1

    if-gt v11, v14, :cond_145

    add-int v11, v17, v11

    aget v11, v20, v11

    if-gt v11, v13, :cond_145

    aput v24, v26, p2

    const/4 v11, 0x1

    aput v27, v26, v11

    aput v13, v26, p1

    aput v28, v26, p3

    aput p2, v26, v23

    const/4 v11, 0x1

    goto/16 :goto_1dd

    :cond_143
    move/from16 v29, v14

    :cond_145
    add-int/lit8 v11, v25, 0x2

    move-object/from16 v13, v26

    move/from16 v14, v29

    goto/16 :goto_bb

    :cond_14d
    move-object/from16 v26, v13

    move/from16 v29, v14

    and-int/lit8 v11, v19, 0x1

    if-nez v11, :cond_157

    const/4 v11, 0x1

    goto :goto_159

    :cond_157
    move/from16 v11, p2

    :goto_159
    move v13, v12

    :goto_15a
    if-gt v13, v3, :cond_26a

    if-eq v13, v12, :cond_17c

    if-eq v13, v3, :cond_171

    add-int/lit8 v14, v13, 0x1

    add-int v14, v14, v17

    aget v14, v20, v14

    add-int/lit8 v22, v13, -0x1

    add-int v22, v22, v17

    move/from16 v24, v11

    aget v11, v20, v22

    if-ge v14, v11, :cond_173

    goto :goto_17e

    :cond_171
    move/from16 v24, v11

    :cond_173
    add-int/lit8 v11, v13, -0x1

    add-int v11, v11, v17

    aget v11, v20, v11

    add-int/lit8 v14, v11, -0x1

    goto :goto_185

    :cond_17c
    move/from16 v24, v11

    :goto_17e
    add-int/lit8 v11, v13, 0x1

    add-int v11, v11, v17

    aget v11, v20, v11

    move v14, v11

    :goto_185
    sub-int v22, v6, v14

    sub-int v22, v22, v13

    sub-int v22, v10, v22

    if-eqz v3, :cond_190

    const/16 v25, 0x1

    goto :goto_192

    :cond_190
    move/from16 v25, p2

    :goto_192
    if-ne v14, v11, :cond_197

    const/16 v27, 0x1

    goto :goto_199

    :cond_197
    move/from16 v27, p2

    :goto_199
    and-int v25, v25, v27

    add-int v25, v22, v25

    move/from16 v30, v22

    move/from16 v22, v11

    move/from16 v11, v30

    :goto_1a3
    if-le v14, v7, :cond_1bc

    if-le v11, v15, :cond_1bc

    move/from16 v27, v11

    add-int/lit8 v11, v14, -0x1

    move/from16 v28, v13

    add-int/lit8 v13, v27, -0x1

    invoke-virtual {v0, v11, v13}, Lm59;->a(II)Z

    move-result v11

    if-eqz v11, :cond_1c0

    add-int/lit8 v14, v14, -0x1

    add-int/lit8 v11, v27, -0x1

    move/from16 v13, v28

    goto :goto_1a3

    :cond_1bc
    move/from16 v27, v11

    move/from16 v28, v13

    :cond_1c0
    add-int v13, v17, v28

    aput v14, v20, v13

    if-eqz v24, :cond_264

    sub-int v11, v19, v28

    if-lt v11, v12, :cond_264

    if-gt v11, v3, :cond_264

    add-int v11, v17, v11

    aget v11, v16, v11

    if-lt v11, v14, :cond_264

    aput v14, v26, p2

    const/4 v11, 0x1

    aput v27, v26, v11

    aput v22, v26, p1

    aput v25, v26, p3

    aput v11, v26, v23

    :goto_1dd
    aget v3, v26, p1

    aget v12, v26, p2

    sub-int/2addr v3, v12

    aget v12, v26, p3

    aget v13, v26, v11

    sub-int/2addr v12, v13

    invoke-static {v3, v12}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-lez v3, :cond_246

    aget v3, v26, p2

    aget v12, v26, v11

    aget v11, v26, p3

    sub-int/2addr v11, v12

    aget v13, v26, p1

    sub-int/2addr v13, v3

    if-eq v11, v13, :cond_240

    invoke-static {v13, v11}, Ljava/lang/Math;->min(II)I

    move-result v13

    aget v11, v26, v23

    if-eqz v11, :cond_203

    const/4 v14, 0x1

    goto :goto_205

    :cond_203
    move/from16 v14, p2

    :goto_205
    aget v17, v26, p3

    const/16 v18, 0x1

    aget v19, v26, v18

    move/from16 p4, v3

    sub-int v3, v17, v19

    aget v21, v26, p1

    aget v22, v26, p2

    move/from16 v23, v11

    sub-int v11, v21, v22

    if-le v3, v11, :cond_21c

    move/from16 v3, v18

    goto :goto_21e

    :cond_21c
    move/from16 v3, p2

    :goto_21e
    or-int/2addr v14, v3

    xor-int/lit8 v14, v14, 0x1

    add-int v3, p4, v14

    if-eqz v23, :cond_228

    move/from16 v11, v18

    goto :goto_22a

    :cond_228
    move/from16 v11, p2

    :goto_22a
    sub-int v14, v17, v19

    move/from16 p4, v3

    sub-int v3, v21, v22

    if-le v14, v3, :cond_235

    move/from16 v3, v18

    goto :goto_237

    :cond_235
    move/from16 v3, p2

    :goto_237
    xor-int/lit8 v3, v3, 0x1

    or-int/2addr v11, v3

    xor-int/lit8 v11, v11, 0x1

    add-int/2addr v12, v11

    move/from16 v3, p4

    goto :goto_242

    :cond_240
    const/16 v18, 0x1

    :goto_242
    invoke-virtual {v8, v3, v12, v13}, Lbg3;->e(III)V

    goto :goto_248

    :cond_246
    move/from16 v18, v11

    :goto_248
    aget v3, v26, p2

    aget v11, v26, v18

    invoke-virtual {v9, v7, v3, v15, v11}, Lbg3;->f(IIII)V

    aget v3, v26, p1

    aget v7, v26, p3

    invoke-virtual {v9, v3, v6, v7, v10}, Lbg3;->f(IIII)V

    :goto_256
    move/from16 v7, p1

    move/from16 v10, p2

    move/from16 v3, p5

    move-object/from16 v11, v16

    move-object/from16 v12, v20

    move-object/from16 v13, v26

    goto/16 :goto_5c

    :cond_264
    add-int/lit8 v13, v28, 0x2

    move/from16 v11, v24

    goto/16 :goto_15a

    :cond_26a
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v12, v20

    move/from16 v11, v21

    move-object/from16 v13, v26

    move/from16 v14, v29

    const/16 p4, 0x1

    goto/16 :goto_a1

    :cond_278
    move-object/from16 v20, v12

    move-object/from16 v26, v13

    goto :goto_256

    :cond_27d
    move/from16 p2, v10

    const/16 p3, 0x3

    iget v3, v8, Lbg3;->c:I

    rem-int/lit8 v6, v3, 0x3

    if-nez v6, :cond_28a

    :goto_287
    move/from16 v6, p3

    goto :goto_290

    :cond_28a
    const-string v6, "Array size not a multiple of 3"

    invoke-static {v6}, La8b;->b(Ljava/lang/String;)V

    goto :goto_287

    :goto_290
    if-le v3, v6, :cond_299

    sub-int/2addr v3, v6

    move/from16 v6, p2

    invoke-virtual {v8, v6, v3}, Lbg3;->i(II)V

    goto :goto_29b

    :cond_299
    move/from16 v6, p2

    :goto_29b
    invoke-virtual {v8, v4, v5, v6}, Lbg3;->e(III)V

    move v3, v6

    move v4, v3

    move v5, v4

    :cond_2a1
    iget v7, v8, Lbg3;->c:I

    if-ge v3, v7, :cond_38b

    iget-object v7, v8, Lbg3;->b:[I

    aget v9, v7, v3

    add-int/lit8 v10, v3, 0x2

    aget v10, v7, v10

    sub-int/2addr v9, v10

    add-int/lit8 v11, v3, 0x1

    aget v7, v7, v11

    sub-int/2addr v7, v10

    add-int/lit8 v3, v3, 0x3

    :goto_2b5
    if-ge v4, v9, :cond_2db

    iget-object v11, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v11, Lb8e;

    iget-object v12, v11, Lb8e;->f:Lb8e;

    iget v13, v12, Lb8e;->c:I

    and-int/lit8 v13, v13, 0x2

    if-eqz v13, :cond_2d2

    iget-object v13, v12, Lb8e;->h:Lwye;

    iget-object v14, v13, Lwye;->w:Lwye;

    iget-object v13, v13, Lwye;->v:Lwye;

    if-eqz v14, :cond_2cd

    iput-object v13, v14, Lwye;->v:Lwye;

    :cond_2cd
    iput-object v14, v13, Lwye;->w:Lwye;

    invoke-virtual {v2, v11, v13}, Ltah;->C(Lb8e;Lwye;)V

    :cond_2d2
    invoke-static {v12}, Ltah;->n(Lb8e;)Lb8e;

    move-result-object v11

    iput-object v11, v0, Lm59;->d:Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_2b5

    :cond_2db
    :goto_2db
    if-ge v5, v7, :cond_352

    iget v9, v0, Lm59;->b:I

    add-int/2addr v9, v5

    iget-object v11, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v11, Lb8e;

    iget-object v12, v0, Lm59;->f:Ljava/lang/Object;

    check-cast v12, Ldee;

    invoke-virtual {v12, v9}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, La8e;

    invoke-static {v9, v11}, Ltah;->l(La8e;Lb8e;)Lb8e;

    move-result-object v9

    iput-object v9, v0, Lm59;->d:Ljava/lang/Object;

    iget-boolean v11, v0, Lm59;->c:Z

    if-eqz v11, :cond_34c

    iget-object v11, v9, Lb8e;->f:Lb8e;

    iget-object v11, v11, Lb8e;->h:Lwye;

    invoke-static {v9}, Lui6;->i(Lb8e;)Le3c;

    move-result-object v9

    if-eqz v9, :cond_322

    new-instance v12, Lg3c;

    iget-object v13, v2, Ltah;->c:Ljava/lang/Object;

    check-cast v13, Lm3c;

    invoke-direct {v12, v13, v9}, Lg3c;-><init>(Lm3c;Le3c;)V

    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    invoke-virtual {v9, v12}, Lb8e;->S0(Lwye;)V

    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    invoke-virtual {v2, v9, v12}, Ltah;->C(Lb8e;Lwye;)V

    iget-object v9, v11, Lwye;->w:Lwye;

    iput-object v9, v12, Lwye;->w:Lwye;

    iput-object v11, v12, Lwye;->v:Lwye;

    iput-object v12, v11, Lwye;->w:Lwye;

    goto :goto_329

    :cond_322
    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    invoke-virtual {v9, v11}, Lb8e;->S0(Lwye;)V

    :goto_329
    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    invoke-virtual {v9}, Lb8e;->J0()V

    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    invoke-virtual {v9}, Lb8e;->P0()V

    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    sget-object v11, Lxye;->a:Lzde;

    iget-boolean v11, v9, Lb8e;->n:Z

    if-nez v11, :cond_346

    const-string v11, "autoInvalidateInsertedNode called on unattached node"

    invoke-static {v11}, La8b;->b(Ljava/lang/String;)V

    :cond_346
    const/4 v11, -0x1

    const/4 v12, 0x1

    invoke-static {v9, v11, v12}, Lxye;->a(Lb8e;II)V

    goto :goto_34f

    :cond_34c
    const/4 v12, 0x1

    iput-boolean v12, v9, Lb8e;->i:Z

    :goto_34f
    add-int/lit8 v5, v5, 0x1

    goto :goto_2db

    :cond_352
    :goto_352
    add-int/lit8 v7, v10, -0x1

    if-lez v10, :cond_2a1

    iget-object v9, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v9, Lb8e;

    iget-object v9, v9, Lb8e;->f:Lb8e;

    iput-object v9, v0, Lm59;->d:Ljava/lang/Object;

    iget-object v9, v0, Lm59;->e:Ljava/lang/Object;

    check-cast v9, Ldee;

    iget v10, v0, Lm59;->b:I

    add-int/2addr v10, v4

    invoke-virtual {v9, v10}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, La8e;

    iget-object v10, v0, Lm59;->f:Ljava/lang/Object;

    check-cast v10, Ldee;

    iget v11, v0, Lm59;->b:I

    add-int/2addr v11, v5

    invoke-virtual {v10, v11}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, La8e;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_385

    iget-object v11, v0, Lm59;->d:Ljava/lang/Object;

    check-cast v11, Lb8e;

    invoke-static {v9, v10, v11}, Ltah;->Q(La8e;La8e;Lb8e;)V

    :cond_385
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v5, 0x1

    move v10, v7

    goto :goto_352

    :cond_38b
    iput-object v0, v1, Ltah;->k:Ljava/lang/Object;

    iget-object v0, v1, Ltah;->f:Ljava/lang/Object;

    check-cast v0, Llbl;

    iget-object v0, v0, Lb8e;->e:Lb8e;

    move v10, v6

    :goto_394
    if-eqz v0, :cond_3a4

    iget-object v2, v1, Ltah;->d:Ljava/lang/Object;

    check-cast v2, Lsye;

    if-eq v0, v2, :cond_3a4

    iget v2, v0, Lb8e;->c:I

    or-int/2addr v10, v2

    iput v10, v0, Lb8e;->d:I

    iget-object v0, v0, Lb8e;->e:Lb8e;

    goto :goto_394

    :cond_3a4
    return-void
.end method

.method public final P()V
    .registers 7

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Lm3c;

    iget-object v1, p0, Ltah;->b:Ljava/lang/Object;

    check-cast v1, Lj8b;

    iget-object v2, p0, Ltah;->f:Ljava/lang/Object;

    check-cast v2, Llbl;

    iget-object v2, v2, Lb8e;->e:Lb8e;

    :goto_e
    if-eqz v2, :cond_41

    invoke-static {v2}, Lui6;->i(Lb8e;)Le3c;

    move-result-object v3

    if-eqz v3, :cond_3b

    iget-object v4, v2, Lb8e;->h:Lwye;

    if-eqz v4, :cond_2d

    check-cast v4, Lg3c;

    iget-object v5, v4, Lg3c;->b0:Le3c;

    invoke-virtual {v4, v3}, Lg3c;->C1(Le3c;)V

    if-eq v5, v2, :cond_35

    iget-object v3, v4, Lwye;->T:Levf;

    if-eqz v3, :cond_35

    check-cast v3, Ls3a;

    invoke-virtual {v3}, Ls3a;->c()V

    goto :goto_35

    :cond_2d
    new-instance v4, Lg3c;

    invoke-direct {v4, v0, v3}, Lg3c;-><init>(Lm3c;Le3c;)V

    invoke-virtual {v2, v4}, Lb8e;->S0(Lwye;)V

    :cond_35
    :goto_35
    iput-object v4, v1, Lwye;->w:Lwye;

    iput-object v1, v4, Lwye;->v:Lwye;

    move-object v1, v4

    goto :goto_3e

    :cond_3b
    invoke-virtual {v2, v1}, Lb8e;->S0(Lwye;)V

    :goto_3e
    iget-object v2, v2, Lb8e;->e:Lb8e;

    goto :goto_e

    :cond_41
    invoke-virtual {v0}, Lm3c;->u()Lm3c;

    move-result-object v0

    if-eqz v0, :cond_4e

    iget-object v0, v0, Lm3c;->F:Ltah;

    iget-object v0, v0, Ltah;->b:Ljava/lang/Object;

    check-cast v0, Lj8b;

    goto :goto_4f

    :cond_4e
    const/4 v0, 0x0

    :goto_4f
    iput-object v0, v1, Lwye;->w:Lwye;

    iput-object v1, p0, Ltah;->e:Ljava/lang/Object;

    return-void
.end method

.method public final R()Lggn;
    .registers 12

    new-instance v0, Lggn;

    iget-object v1, p0, Ltah;->f:Ljava/lang/Object;

    check-cast v1, Lnw3;

    iget-object v1, v1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    iget-object v2, p0, Ltah;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lktg;

    iget-object v3, p0, Ltah;->b:Ljava/lang/Object;

    check-cast v3, Lnw3;

    iget-object v3, v3, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v3

    iget-object v4, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v4, Lnw3;

    iget-object v4, v4, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->c()Lxb;

    move-result-object v4

    iget-object v5, p0, Ltah;->g:Ljava/lang/Object;

    check-cast v5, Lnw3;

    iget-object v5, v5, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object v5

    iget-object v6, p0, Ltah;->e:Ljava/lang/Object;

    check-cast v6, Lmw3;

    iget-object v7, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v7, Lnw3;

    iget-object v7, v7, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object v7

    iget-object v8, p0, Ltah;->i:Ljava/lang/Object;

    check-cast v8, Lkw3;

    iget-object v9, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v9, Lhw3;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lpfn;

    iget-object p0, p0, Ltah;->k:Ljava/lang/Object;

    check-cast p0, Lnw3;

    iget-object p0, p0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v10

    invoke-direct/range {v0 .. v10}, Lggn;-><init>(Lydn;Lktg;Lslk;Lxb;Lien;Lmw3;Lyen;Lkw3;Lpfn;Lru9;)V

    return-object v0
.end method

.method public final a(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 10

    new-instance v2, Lzz9;

    const/4 v0, 0x0

    sget-object v1, Lo29;->k:Lo29;

    invoke-direct {v2, v1, v0, p2}, Lzz9;-><init>(Lo29;Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Ltah;->c(Lzz9;)V

    const-string v0, "webp"

    invoke-virtual {p0, p2, v0}, Ltah;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    new-instance v6, Lv12;

    invoke-direct {v6, p1, v4}, Lv12;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    new-instance v0, Ld0a;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Ld0a;-><init>(Ltah;Lzz9;Ljava/lang/String;Ljava/io/File;B)V

    invoke-virtual {v1, v6, v0}, Ltah;->B(Lo0g;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final b(Lyxc;Lnt5;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Lnv6;

    instance-of v1, p2, Lyga;

    if-eqz v1, :cond_17

    move-object v1, p2

    check-cast v1, Lyga;

    iget v2, v1, Lyga;->x:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lyga;->x:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lyga;

    invoke-direct {v1, p0, p2}, Lyga;-><init>(Ltah;Lnt5;)V

    :goto_1c
    iget-object p2, v1, Lyga;->v:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lyga;->x:I

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v3, :cond_4a

    if-eq v3, v8, :cond_44

    if-eq v3, v6, :cond_3c

    if-eq v3, v5, :cond_37

    if-eq v3, v4, :cond_37

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_37
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b6

    :cond_3c
    iget-boolean p0, v1, Lyga;->u:Z

    iget-object p1, v1, Lyga;->t:Lyxc;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a0

    :cond_44
    iget-object p1, v1, Lyga;->t:Lyxc;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7b

    :cond_4a
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_64

    if-ne p2, v8, :cond_60

    iput-object v7, v1, Lyga;->t:Lyxc;

    iput v4, v1, Lyga;->x:I

    invoke-virtual {v0, p1, v1}, Lnv6;->B(Lyxc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_b6

    goto :goto_b4

    :cond_60
    invoke-static {}, Lh9o;->p()V

    return-object v7

    :cond_64
    iput-object p1, v1, Lyga;->t:Lyxc;

    iput v8, v1, Lyga;->x:I

    sget-object p2, Lbb7;->a:Lcv6;

    sget-object p2, Ls6d;->a:Ld7a;

    iget-object p2, p2, Ld7a;->e:Ld7a;

    new-instance v3, Lyf;

    const/16 v4, 0x1c

    invoke-direct {v3, v4, v7, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2, v3, v1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v2, :cond_b4

    :goto_7b
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_b5

    iget-object v3, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v3, Lole;

    iget-object p0, p0, Ltah;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    iput-object p1, v1, Lyga;->t:Lyxc;

    iput-boolean p2, v1, Lyga;->u:Z

    iput v6, v1, Lyga;->x:I

    iget-object v3, v3, Lole;->a:Ljava/lang/Object;

    check-cast v3, Lu74;

    iget-object v3, v3, Lu74;->a:Lwv9;

    invoke-interface {v3, p0, v1}, Lwv9;->g(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v2, :cond_b4

    move v9, p2

    move-object p2, p0

    move p0, v9

    :goto_a0
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_b5

    iput-object v7, v1, Lyga;->t:Lyxc;

    iput-boolean p0, v1, Lyga;->u:Z

    iput v5, v1, Lyga;->x:I

    invoke-virtual {v0, p1, v1}, Lnv6;->B(Lyxc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v2, :cond_b6

    :cond_b4
    :goto_b4
    return-object v2

    :cond_b5
    const/4 v8, 0x0

    :cond_b6
    :goto_b6
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lzz9;)V
    .registers 4

    iget-object p0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final d(Ljava/lang/Class;Lu18;)V
    .registers 5

    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lo28;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Lo28;->a:Ljava/util/ArrayList;

    new-instance v1, Ln28;

    invoke-direct {v1, p1, p2}, Ln28;-><init>(Ljava/lang/Class;Lu18;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_13

    monitor-exit p0

    return-void

    :goto_11
    :try_start_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_13

    throw p1

    :catchall_13
    move-exception p1

    goto :goto_11
.end method

.method public final e(Z)V
    .registers 2

    iget-object p0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p0, Llrk;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final f(Ljava/lang/Class;Lqyh;)V
    .registers 5

    iget-object p0, p0, Ltah;->e:Ljava/lang/Object;

    check-cast p0, Ls64;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Ls64;->b:Ljava/util/ArrayList;

    new-instance v1, Lryh;

    invoke-direct {v1, p1, p2}, Lryh;-><init>(Ljava/lang/Class;Lqyh;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_13

    monitor-exit p0

    return-void

    :goto_11
    :try_start_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_13

    throw p1

    :catchall_13
    move-exception p1

    goto :goto_11
.end method

.method public final g(Ljava/lang/Class;Ljava/lang/Class;Lw7e;)V
    .registers 6

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lk5o;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Ld5o;

    monitor-enter v0
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_2c

    :try_start_a
    new-instance v1, Lwbe;

    invoke-direct {v1, p1, p2, p3}, Lwbe;-><init>(Ljava/lang/Class;Ljava/lang/Class;Lw7e;)V

    iget-object p1, v0, Ld5o;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    invoke-virtual {p1, p2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1a
    .catchall {:try_start_a .. :try_end_1a} :catchall_28

    :try_start_1a
    monitor-exit v0

    iget-object p1, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p1, Ljc9;

    iget-object p1, p1, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V
    :try_end_24
    .catchall {:try_start_1a .. :try_end_24} :catchall_2c

    monitor-exit p0

    return-void

    :goto_26
    :try_start_26
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_28

    :try_start_27
    throw p1

    :catchall_28
    move-exception p1

    goto :goto_26

    :goto_2a
    monitor-exit p0
    :try_end_2b
    .catchall {:try_start_27 .. :try_end_2b} :catchall_2c

    throw p1

    :catchall_2c
    move-exception p1

    goto :goto_2a
.end method

.method public final h(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Loyh;)V
    .registers 6

    iget-object p0, p0, Ltah;->b:Ljava/lang/Object;

    check-cast p0, Lmgh;

    monitor-enter p0

    :try_start_5
    invoke-virtual {p0, p1}, Lmgh;->i(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Lpyh;

    invoke-direct {v0, p2, p3, p4}, Lpyh;-><init>(Ljava/lang/Class;Ljava/lang/Class;Loyh;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_11
    .catchall {:try_start_5 .. :try_end_11} :catchall_15

    monitor-exit p0

    return-void

    :goto_13
    :try_start_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_15

    throw p1

    :catchall_15
    move-exception p1

    goto :goto_13
.end method

.method public final handleSubscriptionPlans(Lbmk;)V
    .registers 3

    .line 52
    iget-object p0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast p0, Lode;

    new-instance v0, Ldvg;

    invoke-direct {v0, p1}, Ldvg;-><init>(Lbmk;)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final handleSubscriptionPlans(Lcmk;)V
    .registers 2

    .line 53
    iget-object p0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast p0, Lode;

    new-instance p1, Levg;

    invoke-direct {p1}, Levg;-><init>()V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final handleSubscriptionPlans(Lzlk;)V
    .registers 6

    iget-object p1, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p1, Lcvg;

    iget-object p0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast p0, Lfmk;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lpjg;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lcvg;->w:Los1;

    if-nez p0, :cond_33

    new-instance p0, Los1;

    new-instance v1, Lo8f;

    const/16 v2, 0x18

    invoke-direct {v1, p1, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lpjg;

    const/4 v3, 0x5

    invoke-direct {v2, p1, v3}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, v1, v0, v2}, Los1;-><init>(Lo8f;Lpjg;Lpjg;)V

    iput-object p0, p1, Lcvg;->w:Los1;

    iget-object p1, p1, Lcvg;->r:Lz77;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_33
    return-void
.end method

.method public final i()Lep2;
    .registers 14

    iget-object v0, p0, Ltah;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_9

    const-string v0, " mimeType"

    goto :goto_b

    :cond_9
    const-string v0, ""

    :goto_b
    iget-object v1, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_17

    const-string v1, " profile"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_17
    iget-object v1, p0, Ltah;->d:Ljava/lang/Object;

    check-cast v1, Lzpl;

    if-nez v1, :cond_23

    const-string v1, " inputTimebase"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_23
    iget-object v1, p0, Ltah;->e:Ljava/lang/Object;

    check-cast v1, Landroid/util/Size;

    if-nez v1, :cond_2f

    const-string v1, " resolution"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2f
    iget-object v1, p0, Ltah;->f:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_3b

    const-string v1, " colorFormat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3b
    iget-object v1, p0, Ltah;->g:Ljava/lang/Object;

    check-cast v1, Lfp2;

    if-nez v1, :cond_47

    const-string v1, " dataSpace"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_47
    iget-object v1, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_53

    const-string v1, " captureFrameRate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_53
    iget-object v1, p0, Ltah;->i:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_5f

    const-string v1, " encodeFrameRate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_5f
    iget-object v1, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_6b

    const-string v1, " IFrameInterval"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_6b
    iget-object v1, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_77

    const-string v1, " bitrate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_77
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c7

    new-instance v2, Lep2;

    iget-object v0, p0, Ltah;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v0, p0, Ltah;->d:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lzpl;

    iget-object v0, p0, Ltah;->e:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Landroid/util/Size;

    iget-object v0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v0, p0, Ltah;->g:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lfp2;

    iget-object v0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v0, p0, Ltah;->i:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v10

    iget-object v0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v11

    iget-object p0, p0, Ltah;->k:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-direct/range {v2 .. v12}, Lep2;-><init>(Ljava/lang/String;ILzpl;Landroid/util/Size;ILfp2;IIII)V

    return-object v2

    :cond_c7
    const-string p0, "Missing required properties:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j(Ljava/util/List;)Ljava/util/LinkedHashSet;
    .registers 12

    iget-object v0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lda6;

    iget-object v2, p0, Ltah;->d:Ljava/lang/Object;

    check-cast v2, Ljf4;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iget-object p0, p0, Ltah;->b:Ljava/lang/Object;

    check-cast p0, Livg;

    :try_start_18
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Lda6;->a()Lxc4;

    move-result-object v4
    :try_end_21
    .catch Ljava/lang/IllegalStateException; {:try_start_18 .. :try_end_21} :catch_c9

    if-eqz v2, :cond_86

    :try_start_23
    invoke-virtual {v2}, Ljf4;->b()Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Ljpo;->x(Lxc4;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v4
    :try_end_2b
    .catch Ljava/lang/IllegalStateException; {:try_start_23 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    const/4 v4, 0x0

    :goto_2d
    :try_start_2d
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_36
    :goto_36
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_68

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_36

    iget-object v7, v1, Lda6;->b:Lda6;

    new-instance v8, Lm20;

    invoke-static {v6}, Lsd4;->a(Ljava/lang/String;)V

    const/4 v9, 0x4

    invoke-direct {v8, v6, v9}, Lm20;-><init>(Ljava/lang/String;B)V

    new-instance v6, Lfa6;

    invoke-direct {v6, v7, v8, p0}, Lfa6;-><init>(Lda6;Lm20;Livg;)V

    iget-object v6, v6, Lfa6;->y:Lnv6;

    invoke-virtual {v6}, Lnv6;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lzd4;

    invoke-interface {v6}, Lzd4;->g()Lxd4;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_36

    :cond_68
    invoke-virtual {v2, v5}, Ljf4;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    :goto_71
    if-ge v1, p1, :cond_85

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lud4;

    check-cast v2, Lxd4;

    invoke-interface {v2}, Lxd4;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_84
    .catch Ljava/lang/IllegalStateException; {:try_start_2d .. :try_end_84} :catch_c9

    goto :goto_71

    :cond_85
    move-object p1, v3

    :cond_86
    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lda6;

    invoke-virtual {v0}, Lda6;->a()Lxc4;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9b
    :goto_9b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "0"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c1

    const-string v3, "1"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c1

    invoke-static {v0, v2}, Lwyh;->F(Lxc4;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9b

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9b

    :cond_c1
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9b

    :cond_c5
    invoke-direct {p0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    return-object p0

    :catch_c9
    move-exception p0

    new-instance p1, Ls7b;

    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public final k()V
    .registers 4

    iget-object v0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v0, Lpde;

    sget-object v1, Ll08;->a:Ll08;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lc0a;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lc0a;-><init>(Ltah;B)V

    invoke-virtual {v1, v0}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v1, Lc0a;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lc0a;-><init>(Ltah;B)V

    invoke-virtual {v0, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final m()V
    .registers 2

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lnvg;

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lnvg;->a(I)V

    return-void
.end method

.method public final o()Ljava/util/Set;
    .registers 3

    iget-object v0, p0, Ltah;->j:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object p0, Lv08;->a:Lv08;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_1e

    monitor-exit v0

    return-object p0

    :cond_11
    :try_start_11
    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object p0, p0, Ltah;->i:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    check-cast p0, Ljava/util/Collection;

    invoke-direct {v1, p0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V
    :try_end_1c
    .catchall {:try_start_11 .. :try_end_1c} :catchall_1e

    monitor-exit v0

    return-object v1

    :catchall_1e
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final p(Ljava/lang/String;)Lzd4;
    .registers 5

    iget-object v0, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_31

    iget-object v0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lda6;

    iget-object v0, v0, Lda6;->b:Lda6;

    new-instance v1, Lm20;

    invoke-static {p1}, Lsd4;->a(Ljava/lang/String;)V

    const/4 v2, 0x4

    invoke-direct {v1, p1, v2}, Lm20;-><init>(Ljava/lang/String;B)V

    iget-object p0, p0, Ltah;->b:Ljava/lang/Object;

    check-cast p0, Livg;

    new-instance p1, Lfa6;

    invoke-direct {p1, v0, v1, p0}, Lfa6;-><init>(Lda6;Lm20;Livg;)V

    iget-object p0, p1, Lfa6;->y:Lnv6;

    invoke-virtual {p0}, Lnv6;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzd4;

    return-object p0

    :cond_31
    new-instance p0, Lig4;

    const-string p1, "CameraFactory has been shut down."

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final q()V
    .registers 5

    iget-object v0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v0, Lnvg;

    iget-object v0, v0, Lnvg;->c:Lp8f;

    new-instance v1, Llvg;

    const/16 v2, 0x8

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Llvg;-><init>(II)V

    invoke-virtual {v0}, Lp8f;->t()Lmvg;

    move-result-object v2

    if-eqz v2, :cond_1c

    iget-object v3, v2, Lmvg;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Lp8f;->G(Lmvg;)V

    :cond_1c
    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lcvg;

    iget-object p0, p0, Lcvg;->s:Lrn9;

    invoke-virtual {p0}, Lrn9;->I()V

    return-void
.end method

.method public final r(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .registers 5

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Ltah;->i:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    const-string v1, "."

    invoke-static {p1, v1, p2}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public final s(Lyka;)Ljava/lang/Object;
    .registers 6

    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Ls6d;->a:Ld7a;

    iget-object v0, v0, Ld7a;->e:Ld7a;

    new-instance v1, Lrf4;

    const/4 v2, 0x0

    const/4 v3, 0x7

    invoke-direct {v1, v3, v2, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v0, v1, p1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_16

    return-object p0

    :cond_16
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final t()Ljava/util/ArrayList;
    .registers 2

    iget-object p0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p0, Ld14;

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Ld14;->a:Ljava/util/ArrayList;
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_19

    monitor-exit p0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_f

    return-object v0

    :cond_f
    new-instance p0, Lyrh;

    const-string v0, "Failed to find image header parser."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_17
    :try_start_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_19

    throw v0

    :catchall_19
    move-exception v0

    goto :goto_17
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Ltah;->a:B

    packed-switch v0, :pswitch_data_42

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ltah;->g:Ljava/lang/Object;

    check-cast v1, Lb8e;

    iget-object p0, p0, Ltah;->f:Ljava/lang/Object;

    check-cast p0, Llbl;

    const-string v2, "]"

    if-ne v1, p0, :cond_21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3c

    :cond_21
    :goto_21
    if-eqz v1, :cond_3c

    if-eq v1, p0, :cond_3c

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lb8e;->f:Lb8e;

    if-ne v3, p0, :cond_34

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3c

    :cond_34
    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lb8e;->f:Lb8e;

    goto :goto_21

    :cond_3c
    :goto_3c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_42
    .packed-switch 0x7
        :pswitch_a
    .end packed-switch
.end method

.method public final u(Ljava/lang/Object;)Ljava/util/List;
    .registers 9

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lk5o;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    monitor-enter p0

    :try_start_c
    iget-object v1, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v1, Ljc9;

    iget-object v1, v1, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx7e;

    if-nez v1, :cond_1c

    const/4 v1, 0x0

    goto :goto_1e

    :cond_1c
    iget-object v1, v1, Lx7e;->a:Ljava/util/List;

    :goto_1e
    if-nez v1, :cond_53

    iget-object v1, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Ld5o;

    invoke-virtual {v1, v0}, Ld5o;->s(Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast v2, Ljc9;

    iget-object v2, v2, Ljc9;->a:Ljava/util/HashMap;

    new-instance v3, Lx7e;

    invoke-direct {v3, v1}, Lx7e;-><init>(Ljava/util/List;)V

    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx7e;

    if-eqz v2, :cond_53

    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Already cached loaders for model: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_53
    .catchall {:try_start_c .. :try_end_53} :catchall_be

    :cond_53
    monitor-exit p0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_a4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x0

    const/4 v3, 0x1

    move v4, v2

    :goto_63
    if-ge v4, p0, :cond_81

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lv7e;

    invoke-interface {v5, p1}, Lv7e;->b(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7e

    if-eqz v3, :cond_7b

    new-instance v0, Ljava/util/ArrayList;

    sub-int v3, p0, v4

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    move v3, v2

    :cond_7b
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7e
    add-int/lit8 v4, v4, 0x1

    goto :goto_63

    :cond_81
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_88

    return-object v0

    :cond_88
    new-instance p0, Lyrh;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Found ModelLoaders for model class: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", but none that handle this specific model instance: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_a4
    new-instance p0, Lyrh;

    const-string v0, "Failed to find any ModelLoaders registered for model class: "

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_bc
    :try_start_bc
    monitor-exit p0
    :try_end_bd
    .catchall {:try_start_bc .. :try_end_bd} :catchall_be

    throw p1

    :catchall_be
    move-exception p1

    goto :goto_bc
.end method

.method public final v()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ltah;->L(I)V

    return-void
.end method

.method public final w(I)Z
    .registers 2

    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lb8e;

    iget p0, p0, Lb8e;->d:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_b

    const/4 p0, 0x1

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public final x()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Ltah;->j:Ljava/lang/Object;

    iget-object v1, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/LoadingView;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final y(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    new-instance v0, Lxgf;

    invoke-direct {v0, p1}, Lxgf;-><init>(Ljava/lang/String;)V

    sget-object p1, Llqm;->H:Llqm;

    iput-object p1, v0, Lxgf;->m:Llqm;

    const/4 p1, 0x1

    iput-boolean p1, v0, Lxgf;->n:Z

    invoke-static {p0, v0}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final z(Ljava/lang/String;Lamk;)V
    .registers 8

    iget-object v0, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v0, Lebh;

    if-eqz v0, :cond_50

    iget-object v0, v0, Lebh;->a:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh1b;

    if-eqz v0, :cond_50

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lh1b;->u(I)La1b;

    move-result-object v0

    :cond_15
    invoke-virtual {v0}, Lq4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_50

    invoke-virtual {v0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luah;

    iget-object v2, v2, Luah;->e:Lh1b;

    invoke-virtual {v2, v1}, Lh1b;->u(I)La1b;

    move-result-object v2

    :cond_27
    invoke-virtual {v2}, Lq4;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-virtual {v2}, Lq4;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Lzsk;->f:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_27

    iget-object p0, p0, Ltah;->d:Ljava/lang/Object;

    check-cast p0, Lcvg;

    iget-object p0, p0, Lcvg;->r:Lz77;

    new-instance p1, Lyz5;

    const/4 p2, 0x2

    invoke-direct {p1, v1, v1, p2}, Lyz5;-><init>(ZZB)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, p2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_50
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ltah;->L(I)V

    iget-object v1, p0, Ltah;->c:Ljava/lang/Object;

    check-cast v1, Lnvg;

    iget-object v1, v1, Lnvg;->c:Lp8f;

    new-instance v2, Llvg;

    const/16 v3, 0x8

    const/4 v4, 0x7

    invoke-direct {v2, v3, v4}, Llvg;-><init>(II)V

    invoke-virtual {v1}, Lp8f;->t()Lmvg;

    move-result-object v3

    if-eqz v3, :cond_70

    iget-object v4, v3, Lmvg;->f:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v3}, Lp8f;->G(Lmvg;)V

    :cond_70
    iget-object v1, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v1, Lqb7;

    new-instance v2, Lbvg;

    invoke-direct {v2, p0, v0}, Lbvg;-><init>(Ltah;B)V

    invoke-virtual {v1, p2, p1, v2}, Lqb7;->t(Lamk;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method
