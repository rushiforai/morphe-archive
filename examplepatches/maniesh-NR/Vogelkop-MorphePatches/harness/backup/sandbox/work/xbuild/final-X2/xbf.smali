.class public final Lxbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lijf;
.implements Lfi;
.implements Lbag;
.implements Lzln;


# static fields
.field public static h:Lxbf;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 7

    iput-byte p1, p0, Lxbf;->a:B

    sparse-switch p1, :sswitch_data_6e

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    .line 193
    :sswitch_9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x4

    .line 194
    new-array v0, p1, [I

    iput-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    .line 195
    new-array p1, p1, [F

    iput-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    .line 196
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lxbf;->d:Ljava/lang/Object;

    .line 197
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lxbf;->e:Ljava/lang/Object;

    .line 198
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    .line 199
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    return-void

    .line 200
    :sswitch_33
    new-instance p1, Lrxh;

    const v0, 0x7f14011e

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    .line 201
    new-instance v0, Lrxh;

    const v1, 0x7f140763

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    .line 202
    new-instance v1, Lrxh;

    const v2, 0x7f140d89

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    .line 203
    new-instance v2, Lrxh;

    const v3, 0x7f140769

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    .line 204
    new-instance v3, Lrxh;

    const v4, 0x7f140b4b

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    .line 205
    sget-object v4, Lmjh;->a:Lh58;

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 208
    iput-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    .line 209
    iput-object v1, p0, Lxbf;->d:Ljava/lang/Object;

    .line 210
    iput-object v2, p0, Lxbf;->e:Ljava/lang/Object;

    .line 211
    iput-object v3, p0, Lxbf;->f:Ljava/lang/Object;

    .line 212
    iput-object v4, p0, Lxbf;->g:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_6e
    .sparse-switch
        0x7 -> :sswitch_33
        0xc -> :sswitch_9
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;Lglh;Lpjg;)V
    .registers 8

    const/16 v0, 0x10

    iput-byte v0, p0, Lxbf;->a:B

    .line 347
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 348
    new-instance v0, Lqie;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lqie;-><init>(B)V

    iput-object v0, p0, Lxbf;->f:Ljava/lang/Object;

    .line 349
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 350
    iput-object p2, p0, Lxbf;->e:Ljava/lang/Object;

    .line 351
    iput-object p3, p0, Lxbf;->c:Ljava/lang/Object;

    .line 352
    iput-object p4, p0, Lxbf;->d:Ljava/lang/Object;

    .line 353
    iput-object p5, p0, Lxbf;->g:Ljava/lang/Object;

    .line 354
    invoke-virtual {p4}, Lglh;->e()Z

    move-result p1

    if-nez p1, :cond_4b

    .line 355
    sget-object p1, Lxbf;->h:Lxbf;

    if-nez p1, :cond_4b

    .line 356
    sput-object p0, Lxbf;->h:Lxbf;

    .line 357
    new-instance p1, Ljjg;

    const/16 p3, 0x9

    invoke-direct {p1, p0, p3}, Ljjg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p2, p1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance p3, Lexk;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lexk;-><init>(Lxbf;B)V

    .line 358
    invoke-virtual {p2, p3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    .line 359
    new-instance p0, Loml;

    invoke-direct {p0, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    .line 360
    invoke-virtual {v0, p0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_4b
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Le00;Lk32;Lkw0;Ljjg;)V
    .registers 11

    const/4 v0, 0x2

    iput-byte v0, p0, Lxbf;->a:B

    .line 382
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 383
    new-instance v0, Lode;

    .line 384
    invoke-direct {v0}, Lekc;-><init>()V

    .line 385
    iput-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    .line 386
    new-instance v1, Lode;

    .line 387
    invoke-direct {v1}, Lekc;-><init>()V

    .line 388
    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    .line 389
    new-instance v2, Lw5f;

    invoke-direct {v2, p0}, Lw5f;-><init>(Lxbf;)V

    .line 390
    invoke-static {v0, v2}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object v2

    iput-object v2, p0, Lxbf;->g:Ljava/lang/Object;

    .line 391
    new-instance v2, Li32;

    const/16 v3, 0x8

    invoke-direct {v2, p2, p4, v3}, Li32;-><init>(Lumi;Lk32;B)V

    iput-object v2, p0, Lxbf;->b:Ljava/lang/Object;

    .line 392
    invoke-virtual {v2}, Lldk;->h()V

    .line 393
    new-instance p2, Lx79;

    .line 394
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 395
    new-instance p4, Lqie;

    const/4 v3, 0x6

    invoke-direct {p4, p1, v3}, Lqie;-><init>(Landroid/content/Context;B)V

    iput-object p4, p2, Lx79;->a:Ljava/lang/Object;

    .line 396
    iput-object p3, p2, Lx79;->b:Ljava/lang/Object;

    .line 397
    iput-object p5, p2, Lx79;->c:Ljava/lang/Object;

    .line 398
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p2, Lx79;->d:Ljava/lang/Object;

    .line 399
    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    .line 400
    iput-object p6, p0, Lxbf;->d:Ljava/lang/Object;

    .line 401
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    .line 402
    new-instance p1, Lm2g;

    const/4 p2, 0x3

    invoke-direct {p1, v0, p2}, Lm2g;-><init>(Lode;B)V

    .line 403
    new-instance p2, Lj12;

    const/16 p3, 0xb

    invoke-direct {p2, p1, p3}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    .line 404
    new-instance p1, Lq2g;

    const/4 p3, 0x0

    invoke-direct {p1, v2, p2, p3}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, p1}, Lldk;->f(Ljava/lang/Runnable;)V

    .line 405
    new-instance p1, Lm2g;

    invoke-direct {p1, v1, p3}, Lm2g;-><init>(Lode;B)V

    invoke-virtual {p0, p1}, Lxbf;->i(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lzg;Lbl;Laoo;Lltm;)V
    .registers 7

    const/16 v0, 0x17

    iput-byte v0, p0, Lxbf;->a:B

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lplk;

    invoke-direct {v0, p1, p4, p5}, Lplk;-><init>(Landroid/content/Context;Laoo;Lltm;)V

    iput-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lxbf;->d:Ljava/lang/Object;

    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    invoke-static {}, Lf1p;->a()Lf1p;

    move-result-object p1

    .line 154
    iget-object p3, p2, Lzg;->b:Ljava/lang/Object;

    check-cast p3, Ljava/lang/String;

    .line 155
    invoke-virtual {p1, p3}, Lf1p;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lxbf;->e:Ljava/lang/Object;

    .line 156
    iget-object p1, p2, Lzg;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .line 157
    iput-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    iput-object p4, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lqln;Lcom/opera/android/settings/SettingsManager;Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;)V
    .registers 6

    const/16 v0, 0x14

    iput-byte v0, p0, Lxbf;->a:B

    .line 407
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 408
    iput-object p1, p0, Lxbf;->d:Ljava/lang/Object;

    iput-object p2, p0, Lxbf;->e:Ljava/lang/Object;

    iput-object p3, p0, Lxbf;->f:Ljava/lang/Object;

    iput-object p4, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/startup/WelcomeActivity;Ltzn;Lvzn;Ltzn;Lmsl;Lumi;Lvzn;Lvzn;Lvzn;Lwzn;Lxbf;)V
    .registers 13

    const/16 v0, 0x15

    iput-byte v0, p0, Lxbf;->a:B

    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 246
    iput-object p11, p0, Lxbf;->b:Ljava/lang/Object;

    .line 247
    iput-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    .line 248
    iput-object p2, p0, Lxbf;->d:Ljava/lang/Object;

    move-object p1, p0

    .line 249
    new-instance p0, Lzzn;

    move-object p2, p3

    move-object p3, p4

    move-object p4, p5

    move-object p5, p6

    move-object p6, p7

    move-object p7, p8

    move-object p8, p9

    move-object p9, p10

    invoke-direct/range {p0 .. p9}, Lzzn;-><init>(Lxbf;Lvzn;Ltzn;Lmsl;Lumi;Lvzn;Lvzn;Lvzn;Lwzn;)V

    .line 250
    new-instance p2, Lj4c;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lj4c;-><init>(Lesk;B)V

    .line 251
    iput-object p2, p1, Lxbf;->e:Ljava/lang/Object;

    .line 252
    new-instance p0, La0o;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, La0o;-><init>(Lxbf;B)V

    .line 253
    new-instance p2, Lj4c;

    invoke-direct {p2, p0, p3}, Lj4c;-><init>(Lesk;B)V

    .line 254
    iput-object p2, p1, Lxbf;->f:Ljava/lang/Object;

    .line 255
    new-instance p0, La0o;

    invoke-direct {p0, p1, p3}, La0o;-><init>(Lxbf;B)V

    .line 256
    new-instance p2, Lj4c;

    invoke-direct {p2, p0, p3}, Lj4c;-><init>(Lesk;B)V

    .line 257
    iput-object p2, p1, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;)V
    .registers 9

    const/16 v0, 0x13

    iput-byte v0, p0, Lxbf;->a:B

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 221
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 222
    new-instance v1, Lrii;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lrii;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lxbf;->e:Ljava/lang/Object;

    .line 223
    sget-object v1, Lubn;->a:Ldvj;

    .line 224
    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    .line 225
    new-instance v1, Lwbn;

    new-instance v2, Lm2n;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lm2n;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Lwbn;-><init>(Lm2n;)V

    iput-object v1, p0, Lxbf;->g:Ljava/lang/Object;

    .line 226
    new-instance v1, Li3d;

    const-string v2, "Fill / Primary"

    const v3, 0x7f0402d7

    invoke-direct {v1, v2, v3}, Li3d;-><init>(Ljava/lang/String;I)V

    .line 227
    new-instance v2, Li3d;

    const-string v3, "Fill / On primary"

    const v4, 0x7f0402b9

    invoke-direct {v2, v3, v4}, Li3d;-><init>(Ljava/lang/String;I)V

    .line 228
    new-instance v3, Li3d;

    const-string v4, "Fill / On surface variant"

    const v5, 0x7f0402c8

    invoke-direct {v3, v4, v5}, Li3d;-><init>(Ljava/lang/String;I)V

    .line 229
    new-instance v4, Li3d;

    const-string v5, "Fill / Omnibox buttons"

    const v6, 0x7f04029f

    invoke-direct {v4, v5, v6}, Li3d;-><init>(Ljava/lang/String;I)V

    filled-new-array {v1, v2, v3, v4}, [Li3d;

    move-result-object v1

    .line 230
    invoke-virtual {p1, v1}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->z([Li3d;)V

    .line 231
    const-string v1, "Button outline"

    invoke-static {v1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object v2

    .line 232
    sget-object v3, Lk3d;->k:Ljava/lang/Float;

    .line 233
    new-instance v4, Ltbn;

    invoke-direct {v4, p0}, Ltbn;-><init>(Lxbf;)V

    .line 234
    invoke-virtual {p1, v2, v3, v4}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    .line 235
    invoke-static {v1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object v1

    .line 236
    sget-object v2, Lk3d;->G:[Ljava/lang/Integer;

    .line 237
    new-instance v3, Ltbn;

    invoke-direct {v3, p0}, Ltbn;-><init>(Lxbf;)V

    .line 238
    new-instance v4, Lqll;

    invoke-direct {v4, v3}, Lqll;-><init>(Lrll;)V

    .line 239
    iget-object v3, p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    new-instance v3, Lcrk;

    const/16 v5, 0xc

    invoke-direct {v3, v4, v5}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1, v2, v3}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    .line 241
    new-instance v1, Lnl2;

    invoke-direct {v1, p0, v0}, Lnl2;-><init>(Ljava/lang/Object;B)V

    .line 242
    iget-object p0, p1, Ln2d;->d:Lf3d;

    .line 243
    iget-object p0, p0, Lf3d;->b:Lp3d;

    .line 244
    invoke-virtual {p0, v1}, Lp3d;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method

.method public constructor <init>(Ld7l;Landroid/widget/FrameLayout;Landroid/view/View;Lcom/opera/android/browser/chromium/ChromiumContainerView;Lk6l;Lw3a;Z)V
    .registers 14

    const/16 v0, 0x11

    iput-byte v0, p0, Lxbf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxbf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lxbf;->c:Ljava/lang/Object;

    iput-object p4, p0, Lxbf;->d:Ljava/lang/Object;

    iput-object p5, p0, Lxbf;->e:Ljava/lang/Object;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutDirection()I

    move-result p4

    const/4 p5, 0x0

    const/4 v0, 0x1

    if-eq p4, v0, :cond_18

    move v0, p5

    :cond_18
    if-eqz p7, :cond_25

    const/high16 p4, 0x41c00000    # 24.0f

    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p4, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p4

    goto :goto_26

    :cond_25
    move p4, p5

    :goto_26
    if-eqz v0, :cond_30

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p3

    add-int/2addr p3, p4

    neg-int p3, p3

    neg-int v0, p4

    goto :goto_3c

    :cond_30
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result v0

    add-int/2addr v0, p4

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p3

    move v5, v0

    move v0, p3

    move p3, v5

    :goto_3c
    invoke-virtual {p2, p5}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f040960

    const v4, 0x7f06063b

    invoke-static {v3, v2, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v1, p6}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    const/4 p6, -0x1

    invoke-virtual {p2, v1, p6, p6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    new-instance v2, Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lxbf;->g:Ljava/lang/Object;

    if-nez p7, :cond_70

    const/4 p5, 0x4

    :cond_70
    invoke-virtual {v2, p5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p5

    const p7, 0x7f0809d3

    invoke-static {p7, p5}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p5

    invoke-virtual {v2, p5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance p5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p7, 0x3

    invoke-direct {p5, p4, p6, p7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p2, v2, p5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    int-to-float p2, v0

    invoke-virtual {v2, p2}, Landroid/view/View;->setTranslationX(F)V

    new-instance p2, Lxz2;

    new-instance p4, Lh3l;

    invoke-direct {p4, p0, p1, v0, p3}, Lh3l;-><init>(Lxbf;Ld7l;II)V

    invoke-direct {p2, v1, p4}, Lxz2;-><init>(Landroid/view/View;Lh3l;)V

    return-void
.end method

.method public constructor <init>(Ldb;Lwv1;)V
    .registers 4

    const/16 v0, 0xd

    iput-byte v0, p0, Lxbf;->a:B

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 160
    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    .line 161
    new-instance p2, Lode;

    .line 162
    invoke-direct {p2}, Lekc;-><init>()V

    .line 163
    iput-object p2, p0, Lxbf;->d:Ljava/lang/Object;

    .line 164
    new-instance p2, Lnj2;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lnj2;-><init>(Ljava/lang/Object;B)V

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    .line 166
    invoke-virtual {p1, p2}, Ldb;->a(Lcb;)V

    return-void
.end method

.method public constructor <init>(Ldya;Landroid/content/Context;Lqie;Lbm8;)V
    .registers 7

    const/4 v0, 0x6

    iput-byte v0, p0, Lxbf;->a:B

    .line 312
    new-instance v0, Lz8b;

    invoke-direct {v0, p2, p3}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 314
    iput-object p2, p0, Lxbf;->b:Ljava/lang/Object;

    .line 315
    iput-object p3, p0, Lxbf;->c:Ljava/lang/Object;

    .line 316
    iput-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    .line 317
    iput-object p4, p0, Lxbf;->e:Ljava/lang/Object;

    .line 318
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object p2

    const/4 p3, 0x0

    .line 319
    invoke-virtual {p1, p2, p3}, Ldya;->writeToParcel(Landroid/os/Parcel;I)V

    .line 320
    invoke-virtual {p2, p3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 321
    new-instance p1, Ldya;

    invoke-direct {p1, p2}, Ldya;-><init>(Landroid/os/Parcel;)V

    .line 322
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    .line 323
    iput-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    .line 324
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 325
    iget-object p1, p1, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p4

    :cond_33
    :goto_33
    if-ge p3, p4, :cond_43

    .line 326
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p3, p3, 0x1

    instance-of v1, v0, Lf76;

    if-eqz v1, :cond_33

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_33

    .line 327
    :cond_43
    iput-object p2, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lesk;Lesk;Lesk;Lkotlin/jvm/functions/Function1;Lesk;Ldbf;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lxbf;->a:B

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 215
    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    .line 216
    iput-object p3, p0, Lxbf;->d:Ljava/lang/Object;

    .line 217
    iput-object p4, p0, Lxbf;->f:Ljava/lang/Object;

    .line 218
    iput-object p5, p0, Lxbf;->e:Ljava/lang/Object;

    .line 219
    iput-object p6, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lhjf;Lumi;Lmi;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lxbf;->a:B

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object p3, p0, Lxbf;->b:Ljava/lang/Object;

    .line 169
    iput-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    .line 170
    iput-object p2, p0, Lxbf;->d:Ljava/lang/Object;

    .line 171
    new-instance p1, Ljjf;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ljjf;-><init>(Lxbf;B)V

    .line 172
    new-instance p2, Lj4c;

    invoke-direct {p2, p1, v0}, Lj4c;-><init>(Lesk;B)V

    .line 173
    iput-object p2, p0, Lxbf;->e:Ljava/lang/Object;

    .line 174
    new-instance p1, Ljjf;

    invoke-direct {p1, p0, v0}, Ljjf;-><init>(Lxbf;B)V

    .line 175
    new-instance p2, Lj4c;

    invoke-direct {p2, p1, v0}, Lj4c;-><init>(Lesk;B)V

    .line 176
    iput-object p2, p0, Lxbf;->f:Ljava/lang/Object;

    .line 177
    new-instance p1, Ljjf;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Ljjf;-><init>(Lxbf;B)V

    .line 178
    new-instance p2, Lj4c;

    invoke-direct {p2, p1, v0}, Lj4c;-><init>(Lesk;B)V

    .line 179
    iput-object p2, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 8

    .line 346
    iput-byte p7, p0, Lxbf;->a:B

    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    iput-object p3, p0, Lxbf;->d:Ljava/lang/Object;

    iput-object p4, p0, Lxbf;->e:Ljava/lang/Object;

    iput-object p5, p0, Lxbf;->f:Ljava/lang/Object;

    iput-object p6, p0, Lxbf;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljpk;)V
    .registers 3

    const/16 v0, 0xe

    iput-byte v0, p0, Lxbf;->a:B

    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lng6;Lc6i;Ls2;)V
    .registers 12

    const/16 v0, 0x9

    iput-byte v0, p0, Lxbf;->a:B

    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 295
    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    .line 296
    iget-object v0, p1, Lng6;->e:Ljava/util/ArrayList;

    iget-object v3, p1, Lng6;->b:Ljava/lang/String;

    iget-object v7, p1, Lng6;->c:Lpsk;

    iput-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    if-eqz v7, :cond_4a

    .line 297
    iget-object v2, p1, Lng6;->a:Landroid/content/Context;

    .line 298
    new-instance v4, Ls5i;

    .line 299
    iget p2, p2, Lc6i;->a:I

    .line 300
    invoke-direct {v4, p0, p2}, Ls5i;-><init>(Lxbf;I)V

    .line 301
    new-instance v1, Lev4;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lev4;-><init>(Landroid/content/Context;Ljava/lang/String;Le04;ZZ)V

    .line 302
    invoke-interface {v7, v1}, Lpsk;->b(Lev4;)Lqsk;

    move-result-object p2

    iput-object p2, p0, Lxbf;->f:Ljava/lang/Object;

    .line 303
    new-instance v0, Ll3g;

    .line 304
    new-instance v1, Lqie;

    const/16 v2, 0x1d

    invoke-direct {v1, p2, v2}, Lqie;-><init>(Ljava/lang/Object;B)V

    if-nez v3, :cond_38

    .line 305
    const-string v3, ":memory:"

    .line 306
    :cond_38
    invoke-direct {v0, v1, v3, p3}, Ll3g;-><init>(Lqie;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V

    .line 307
    iput-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    .line 308
    iget-object p0, p1, Lng6;->g:Lw5i;

    sget-object p1, Lw5i;->b:Lw5i;

    if-ne p0, p1, :cond_45

    const/4 p0, 0x1

    goto :goto_46

    :cond_45
    const/4 p0, 0x0

    .line 309
    :goto_46
    invoke-interface {p2, p0}, Lqsk;->setWriteAheadLoggingEnabled(Z)V

    return-void

    .line 310
    :cond_4a
    const-string p0, "SQLiteManager was constructed with both null driver and open helper factory!"

    .line 311
    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Lng6;Lrmg;Ls2;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v2, 0x9

    iput-byte v2, v0, Lxbf;->a:B

    .line 258
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput-object v1, v0, Lxbf;->b:Ljava/lang/Object;

    .line 260
    new-instance v2, Lr5i;

    const/4 v3, -0x1

    .line 261
    const-string v4, ""

    invoke-direct {v2, v3, v4, v4}, Lc6i;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 262
    iput-object v2, v0, Lxbf;->c:Ljava/lang/Object;

    .line 263
    iget-object v2, v1, Lng6;->e:Ljava/util/ArrayList;

    iput-object v2, v0, Lxbf;->d:Ljava/lang/Object;

    .line 264
    new-instance v3, Lrmg;

    const/16 v4, 0x1b

    invoke-direct {v3, v0, v4}, Lrmg;-><init>(Ljava/lang/Object;B)V

    .line 265
    check-cast v2, Ljava/util/Collection;

    .line 266
    new-instance v4, Lt5i;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Lt5i;-><init>(Ljava/lang/Object;B)V

    .line 267
    invoke-static {v4, v2}, Lkotlin/collections/CollectionsKt;->W(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v11

    .line 268
    iget-object v7, v1, Lng6;->a:Landroid/content/Context;

    .line 269
    iget-object v8, v1, Lng6;->b:Ljava/lang/String;

    .line 270
    iget-object v9, v1, Lng6;->c:Lpsk;

    .line 271
    iget-object v10, v1, Lng6;->d:Lx5i;

    .line 272
    iget-boolean v12, v1, Lng6;->f:Z

    .line 273
    iget-object v13, v1, Lng6;->g:Lw5i;

    .line 274
    iget-object v14, v1, Lng6;->h:Ljava/util/concurrent/Executor;

    .line 275
    iget-object v15, v1, Lng6;->i:Ljava/util/concurrent/Executor;

    .line 276
    iget-boolean v2, v1, Lng6;->j:Z

    .line 277
    iget-boolean v3, v1, Lng6;->k:Z

    .line 278
    iget-object v4, v1, Lng6;->l:Ljava/util/LinkedHashSet;

    .line 279
    iget-object v6, v1, Lng6;->m:Ljava/util/ArrayList;

    .line 280
    iget-object v5, v1, Lng6;->n:Ljava/util/ArrayList;

    move/from16 v16, v2

    .line 281
    iget-object v2, v1, Lng6;->o:Ljg8;

    move-object/from16 v19, v6

    .line 282
    new-instance v6, Lng6;

    move-object/from16 v21, v2

    move/from16 v17, v3

    move-object/from16 v18, v4

    move-object/from16 v20, v5

    invoke-direct/range {v6 .. v21}, Lng6;-><init>(Landroid/content/Context;Ljava/lang/String;Lpsk;Lx5i;Ljava/util/ArrayList;ZLw5i;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZLjava/util/LinkedHashSet;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljg8;)V

    move-object/from16 v2, p2

    .line 283
    iget-object v2, v2, Lrmg;->b:Ljava/lang/Object;

    check-cast v2, Ly5i;

    .line 284
    invoke-virtual {v2, v6}, Ly5i;->g(Lng6;)Lqsk;

    move-result-object v2

    .line 285
    iput-object v2, v0, Lxbf;->f:Ljava/lang/Object;

    .line 286
    new-instance v3, Ll3g;

    .line 287
    new-instance v4, Lqie;

    const/16 v5, 0x1d

    invoke-direct {v4, v2, v5}, Lqie;-><init>(Ljava/lang/Object;B)V

    .line 288
    iget-object v1, v1, Lng6;->b:Ljava/lang/String;

    if-nez v1, :cond_76

    const-string v1, ":memory:"

    :cond_76
    move-object/from16 v5, p3

    .line 289
    invoke-direct {v3, v4, v1, v5}, Ll3g;-><init>(Lqie;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V

    .line 290
    iput-object v3, v0, Lxbf;->e:Ljava/lang/Object;

    .line 291
    sget-object v0, Lw5i;->b:Lw5i;

    if-ne v13, v0, :cond_83

    const/4 v5, 0x1

    goto :goto_84

    :cond_83
    const/4 v5, 0x0

    :goto_84
    if-eqz v2, :cond_89

    .line 292
    invoke-interface {v2, v5}, Lqsk;->setWriteAheadLoggingEnabled(Z)V

    :cond_89
    return-void
.end method

.method public constructor <init>(Lolh;Lcom/opera/android/BrowserActivity;Ld7l;Ljava/lang/String;Ljava/lang/String;Lxx1;)V
    .registers 8

    const/16 v0, 0x8

    iput-byte v0, p0, Lxbf;->a:B

    .line 406
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxbf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lxbf;->c:Ljava/lang/Object;

    iput-object p4, p0, Lxbf;->d:Ljava/lang/Object;

    iput-object p5, p0, Lxbf;->e:Ljava/lang/Object;

    iput-object p6, p0, Lxbf;->f:Ljava/lang/Object;

    iput-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpde;Lk6l;Lu4l;Ls9i;Lp9l;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lj1k;)V
    .registers 11

    const/16 v0, 0xb

    iput-byte v0, p0, Lxbf;->a:B

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    iput-object p2, p0, Lxbf;->b:Ljava/lang/Object;

    .line 182
    iput-object p3, p0, Lxbf;->c:Ljava/lang/Object;

    .line 183
    iput-object p4, p0, Lxbf;->d:Ljava/lang/Object;

    .line 184
    iput-object p5, p0, Lxbf;->e:Ljava/lang/Object;

    .line 185
    iput-object p7, p0, Lxbf;->f:Ljava/lang/Object;

    .line 186
    iput-object p9, p0, Lxbf;->g:Ljava/lang/Object;

    .line 187
    new-instance p2, Lozi;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lozi;-><init>(Lxbf;B)V

    invoke-virtual {p6, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    iget-object p2, p4, Ls9i;->c:Ljava/lang/Object;

    check-cast p2, Lpde;

    .line 189
    new-instance p5, Lpzi;

    invoke-direct {p5, p0, p3}, Lpzi;-><init>(Lxbf;B)V

    invoke-static {p2, p1, p5}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 190
    iget-object p2, p4, Ls9i;->d:Ljava/lang/Object;

    check-cast p2, Lpde;

    .line 191
    new-instance p3, Lpzi;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lpzi;-><init>(Lxbf;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 192
    new-instance p1, Lozi;

    invoke-direct {p1, p0, p4}, Lozi;-><init>(Lxbf;B)V

    invoke-virtual {p8, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public constructor <init>(Ltjg;Lode;Lpod;Lmhd;Ljjg;)V
    .registers 6

    const/4 p4, 0x4

    iput-byte p4, p0, Lxbf;->a:B

    .line 361
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 362
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 363
    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    .line 364
    iput-object p3, p0, Lxbf;->d:Ljava/lang/Object;

    .line 365
    iput-object p5, p0, Lxbf;->e:Ljava/lang/Object;

    .line 366
    new-instance p1, Lp12;

    .line 367
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 368
    new-instance p3, Luld;

    invoke-direct {p3, p1}, Luld;-><init>(Lp12;)V

    iput-object p3, p1, Lp12;->f:Ljava/lang/Object;

    .line 369
    new-instance p3, Lvld;

    invoke-direct {p3, p1}, Lvld;-><init>(Lp12;)V

    .line 370
    new-instance p4, Lwe7;

    const/4 p5, 0x3

    invoke-direct {p4, p1, p3, p5}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object p4, p1, Lp12;->g:Ljava/lang/Object;

    .line 371
    new-instance p3, Lse3;

    invoke-direct {p3, p1}, Lse3;-><init>(Lp12;)V

    iput-object p3, p1, Lp12;->h:Ljava/lang/Object;

    .line 372
    iput-object p0, p1, Lp12;->a:Ljava/lang/Object;

    .line 373
    iput-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    .line 374
    new-instance p1, Luuj;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lgig;

    .line 375
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 376
    new-instance p3, Lh7f;

    .line 377
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    .line 378
    iput-object p3, p1, Luuj;->b:Ljava/lang/Object;

    const/16 p3, 0x64

    .line 379
    iput p3, p1, Luuj;->a:I

    .line 380
    iput-object p2, p1, Luuj;->c:Ljava/lang/Object;

    .line 381
    iput-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lvzk;Liga;Lrc6;Ltw2;)V
    .registers 6

    const/16 v0, 0x12

    iput-byte v0, p0, Lxbf;->a:B

    .line 328
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 329
    iput-object p1, p0, Lxbf;->b:Ljava/lang/Object;

    .line 330
    iput-object p2, p0, Lxbf;->c:Ljava/lang/Object;

    .line 331
    iput-object p3, p0, Lxbf;->d:Ljava/lang/Object;

    .line 332
    iput-object p4, p0, Lxbf;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lw6j;Leyi;Lepk;Lepk;Lepk;Lgpk;Lepk;)V
    .registers 15

    const/16 v0, 0xf

    iput-byte v0, p0, Lxbf;->a:B

    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    new-instance v0, Lode;

    .line 337
    invoke-direct {v0}, Lekc;-><init>()V

    .line 338
    iput-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    .line 339
    new-instance v1, Lr4k;

    const/16 v2, 0x13

    invoke-direct {v1, v2}, Lr4k;-><init>(B)V

    .line 340
    invoke-static {v0, v1}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object v1

    iput-object v1, p0, Lxbf;->c:Ljava/lang/Object;

    .line 341
    new-instance v1, Lr4k;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lr4k;-><init>(B)V

    .line 342
    invoke-static {v0, v1}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object v0

    iput-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    .line 343
    iput-object p1, p0, Lxbf;->e:Ljava/lang/Object;

    .line 344
    new-instance v1, Lw6j;

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move-object v6, p7

    invoke-direct/range {v1 .. v6}, Lw6j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    .line 345
    iput-object p2, p0, Lxbf;->g:Ljava/lang/Object;

    return-void
.end method

.method public static F(Lxbf;Lj7h;II)V
    .registers 6

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    :cond_5
    if-eqz p2, :cond_c

    invoke-static {p2}, Leti;->e(I)Llqm;

    move-result-object p3

    goto :goto_e

    :cond_c
    sget-object p3, Llqm;->a:Llqm;

    :goto_e
    new-instance v0, Lwbf;

    iget-object v1, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast v1, Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lsko;->s(Ljava/lang/Object;)V

    invoke-direct {v0, p0, p1, p2, p3}, Lwbf;-><init>(Lxbf;Lj7h;ILlqm;)V

    invoke-virtual {v0}, Lwbf;->b()V

    return-void
.end method

.method public static w(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_b
    const-string v3, "=?"

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_22

    if-eqz v2, :cond_92

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_92

    :cond_22
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x2

    const/16 v2, 0x3f

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    if-eq v5, v4, :cond_92

    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p0, v2, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-eq v2, v4, :cond_92

    add-int/lit8 v7, v2, 0x1

    const-string v8, "?="

    invoke-virtual {p0, v8, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    if-eq v8, v4, :cond_92

    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :try_start_4d
    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Q"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_62

    invoke-static {v4, v3}, Ljpo;->y(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    goto :goto_89

    :cond_62
    const-string v5, "B"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_68
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_4d .. :try_end_68} :catch_92
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_4d .. :try_end_68} :catch_92

    if-eqz v2, :cond_92

    const/4 v2, 0x0

    :try_start_6b
    invoke-static {v4, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4
    :try_end_73
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6b .. :try_end_73} :catch_89

    :try_start_73
    invoke-virtual {v3}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    sget-object v5, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v3, v5}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_89
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_73 .. :try_end_89} :catch_89
    .catch Ljava/lang/IllegalArgumentException; {:try_start_73 .. :try_end_89} :catch_89

    :catch_89
    :goto_89
    if-eqz v2, :cond_92

    :try_start_8b
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_8e
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_8b .. :try_end_8e} :catch_92
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_8b .. :try_end_8e} :catch_92

    add-int/lit8 v2, v8, 0x2

    goto/16 :goto_b

    :catch_92
    :cond_92
    :goto_92
    return-object p0
.end method


# virtual methods
.method public final A(Lcom/opera/api/Callback;)V
    .registers 6

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ldb;

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/oauth2/OperaAccessToken;

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Lcom/opera/android/oauth2/OperaAccessToken;->a()Z

    move-result v3

    if-nez v3, :cond_17

    iget-object p0, v1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_17
    iput-object v2, p0, Lxbf;->f:Ljava/lang/Object;

    :cond_19
    iget-object v1, v0, Ldb;->a:Lbb;

    iget-boolean v1, v1, Lbb;->f:Z

    if-nez v1, :cond_27

    iget-object p0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_27
    invoke-virtual {v0}, Ldb;->d()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {p1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_31
    new-instance v1, Leof;

    const/16 v2, 0x19

    invoke-direct {v1, p0, p1, v2}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Leme;

    invoke-direct {p0, v0, v1}, Leme;-><init>(Ldb;Lcom/opera/api/Callback;)V

    iget-object p1, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p1, :cond_45

    invoke-virtual {p0}, Leme;->b()V

    return-void

    :cond_45
    const/4 v0, 0x1

    invoke-virtual {p1, v0, p0}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    return-void
.end method

.method public final B()V
    .registers 8

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_2f

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_2f

    iget-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_2f

    iget-object v0, p0, Lxbf;->f:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_2f

    iget-object v0, p0, Lxbf;->g:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/util/List;

    if-eqz v6, :cond_2f

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ljpk;

    new-instance v1, Lpok;

    invoke-direct/range {v1 .. v6}, Lpok;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v1}, Ljpk;->run(Ljava/lang/Object;)V

    :cond_2f
    return-void
.end method

.method public final C(Landroid/net/Uri;)Landroid/os/ParcelFileDescriptor;
    .registers 4

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/high16 p1, 0x10000000

    invoke-static {p0, p1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    return-object p0

    :cond_1c
    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "r"

    invoke-virtual {p0, p1, v0}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    return-object p0
.end method

.method public final D(Landroid/graphics/Point;Lqnn;Lnt5;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Ldya;

    iget-object v0, v0, Ldya;->b:Landroid/graphics/PointF;

    instance-of v1, p3, Lijh;

    if-eqz v1, :cond_19

    move-object v1, p3

    check-cast v1, Lijh;

    iget v2, v1, Lijh;->B:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_19

    sub-int/2addr v2, v3

    iput v2, v1, Lijh;->B:I

    goto :goto_1e

    :cond_19
    new-instance v1, Lijh;

    invoke-direct {v1, p0, p3}, Lijh;-><init>(Lxbf;Lnt5;)V

    :goto_1e
    iget-object p3, v1, Lijh;->z:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lijh;->B:I

    const/4 v4, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    if-eqz v3, :cond_49

    if-eq v3, v4, :cond_43

    if-ne v3, v5, :cond_3d

    iget p1, v1, Lijh;->y:I

    iget p2, v1, Lijh;->x:F

    iget v0, v1, Lijh;->w:F

    iget v3, v1, Lijh;->v:F

    iget-object v7, v1, Lijh;->u:Landroid/graphics/Point;

    iget-object v8, v1, Lijh;->t:Lqnn;

    :try_start_39
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3c
    .catch Ljava/lang/OutOfMemoryError; {:try_start_39 .. :try_end_3c} :catch_98

    return-object p3

    :cond_3d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_43
    iget-object p2, v1, Lijh;->t:Lqnn;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_63

    :cond_49
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget p3, v0, Landroid/graphics/PointF;->x:F

    const/4 v3, 0x0

    cmpg-float p3, p3, v3

    if-lez p3, :cond_a4

    iget p3, v0, Landroid/graphics/PointF;->y:F

    cmpg-float p3, p3, v3

    if-lez p3, :cond_a4

    iput-object p2, v1, Lijh;->t:Lqnn;

    iput v4, v1, Lijh;->B:I

    invoke-virtual {p0, p1, v1}, Lxbf;->q(Landroid/graphics/Point;Lnt5;)Ljava/lang/Object;

    move-result-object p3

    if-eq p3, v2, :cond_96

    :goto_63
    check-cast p3, Landroid/graphics/Point;

    if-eqz p3, :cond_a4

    iget p1, p3, Landroid/graphics/Point;->x:I

    int-to-float p1, p1

    iget v3, v0, Landroid/graphics/PointF;->x:F

    div-float/2addr p1, v3

    iget v3, p3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    iget v0, v0, Landroid/graphics/PointF;->y:F

    div-float/2addr v3, v0

    add-float v0, p1, v3

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v0, v7

    const/4 v7, 0x0

    move-object v8, p2

    move p2, v0

    move v0, v3

    move v3, p1

    move p1, v7

    move-object v7, p3

    :goto_7f
    const/4 p3, 0x4

    if-ge p1, p3, :cond_a4

    :try_start_82
    iput-object v8, v1, Lijh;->t:Lqnn;

    iput-object v7, v1, Lijh;->u:Landroid/graphics/Point;

    iput v3, v1, Lijh;->v:F

    iput v0, v1, Lijh;->w:F

    iput p2, v1, Lijh;->x:F

    iput p1, v1, Lijh;->y:I

    iput v5, v1, Lijh;->B:I

    invoke-virtual {p0, v7, p2, v8, v1}, Lxbf;->x(Landroid/graphics/Point;FLqnn;Lnt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_94
    .catch Ljava/lang/OutOfMemoryError; {:try_start_82 .. :try_end_94} :catch_98

    if-ne p0, v2, :cond_97

    :cond_96
    return-object v2

    :cond_97
    return-object p0

    :catch_98
    iget p3, v7, Landroid/graphics/Point;->x:I

    div-int/2addr p3, v5

    iput p3, v7, Landroid/graphics/Point;->x:I

    iget p3, v7, Landroid/graphics/Point;->y:I

    div-int/2addr p3, v5

    iput p3, v7, Landroid/graphics/Point;->y:I

    add-int/2addr p1, v4

    goto :goto_7f

    :cond_a4
    return-object v6
.end method

.method public final E(Ls75;Ljava/lang/Runnable;)V
    .registers 6

    iget-object v0, p1, Ls75;->c:Ljava/lang/Object;

    check-cast v0, Lk2d;

    iget-object v1, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v2, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v2, Ls75;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    return-void

    :cond_13
    iput-object p1, p0, Lxbf;->d:Ljava/lang/Object;

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Lwbn;

    iget-object v2, p0, Lwbn;->c:Ls75;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_27

    iput-object p1, p0, Lwbn;->c:Ls75;

    iget-short v2, v0, Lk2d;->a:S

    iput v2, p0, Lwbn;->d:I

    :cond_27
    invoke-virtual {v1, v0, p2}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    iget p0, p1, Ls75;->b:I

    const/4 p1, 0x0

    invoke-static {v1, p0, p1}, Ln1h;->n(Landroid/view/View;II)V

    return-void
.end method

.method public final G(Lh0d;)V
    .registers 3

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-static {v0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    sget-object v0, Lh0d;->c:Lh0d;

    if-eq p1, v0, :cond_e

    const/4 p1, 0x0

    iput-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    :cond_e
    return-void
.end method

.method public final a(Landroid/view/View;)V
    .registers 8

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v2, Lbl;

    iget-object v3, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v3, Lplk;

    iget-object v4, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_6d

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2a

    if-eqz v2, :cond_24

    invoke-interface {v2, v1}, Lbl;->h(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6d

    :cond_24
    invoke-virtual {v3, v1}, Lplk;->g(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6d

    :cond_2a
    iput-object p1, v3, Lplk;->b:Ljava/lang/Object;

    sget-object p1, La2p;->a:[I

    iget v1, v0, Lzg;->a:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    aget p1, p1, v1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_65

    const/4 v1, 0x2

    if-eq p1, v1, :cond_59

    const/4 v1, 0x3

    if-ne p1, v1, :cond_6d

    iget-object p1, v0, Lzg;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz v2, :cond_55

    invoke-interface {v2, v4, p1}, Lbl;->e(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_55

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Laoo;

    if-eqz p0, :cond_6d

    invoke-virtual {p0}, Laoo;->m()V

    return-void

    :cond_55
    invoke-virtual {v3, v4, p1}, Lplk;->e(Ljava/lang/String;Ljava/lang/String;)Z

    return-void

    :cond_59
    if-eqz v2, :cond_61

    invoke-interface {v2, v4}, Lbl;->a(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6d

    :cond_61
    invoke-virtual {v3, v4}, Lplk;->a(Ljava/lang/String;)Z

    return-void

    :cond_65
    if-eqz v2, :cond_6e

    invoke-interface {v2, v4}, Lbl;->k(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6e

    :cond_6d
    return-void

    :cond_6e
    invoke-virtual {v3, v4}, Lplk;->k(Ljava/lang/String;)Z

    return-void
.end method

.method public final b()Lcom/opera/android/Lazy;
    .registers 2

    iget-byte v0, p0, Lxbf;->a:B

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lxbf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0

    :pswitch_e
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_e
    .end packed-switch
.end method

.method public final c(Lxq3;Lhjm;)V
    .registers 7

    iget-object v0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast v1, Lqln;

    iget-object v2, v1, Lqln;->k:Lvs8;

    iget-object v2, v2, Lvs8;->b:Lekc;

    check-cast v2, Lpde;

    sget-object v3, Lv08;->a:Lv08;

    invoke-static {v2, v3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object v2, Lymn;->n:Lxq3;

    if-ne v2, p1, :cond_1a

    const/4 p1, 0x0

    sput-object p1, Lymn;->n:Lxq3;

    :cond_1a
    iget-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p1, Lg7j;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v2

    const/4 v3, 0x1

    if-eq p1, v2, :cond_2a

    const-string p1, "app_theme_accent_changed_by_user"

    invoke-virtual {v0, v3, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_2a
    iget-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p1, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;

    invoke-virtual {v1}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v3

    invoke-interface {p1, p2, p0}, Lwmn;->onFinished(Lhjm;Z)V

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Ls9i;

    iget-object v1, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I

    move-result v1

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Ls9i;->W()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f140f2a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3b

    :cond_28
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f12005d

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_3b
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final e(Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .registers 8

    iget-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Lumi;

    iget-object v1, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v1, Lglh;

    invoke-virtual {v1}, Lglh;->e()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_12

    sput-object v3, Lxbf;->h:Lxbf;

    return-void

    :cond_12
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_28

    new-instance v2, Lb10;

    const/16 v4, 0x1c

    invoke-direct {v2, v4}, Lb10;-><init>(B)V

    new-instance v4, Lh95;

    invoke-direct {v4, p1, v2}, Lh95;-><init>(Ljava/util/Collection;Lxq9;)V

    const/4 p1, 0x0

    invoke-virtual {v1, v4, p1}, Lglh;->a(Ljava/util/Collection;Z)V

    :cond_28
    invoke-virtual {p2}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_31

    sput-object v3, Lxbf;->h:Lxbf;

    return-void

    :cond_31
    iget-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p1, Lqie;

    new-instance v1, Low3;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p2, v2}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p2

    new-instance v1, Lexk;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lexk;-><init>(Lxbf;B)V

    invoke-virtual {v0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p2, p0}, Lnml;->b(Lnml;)V

    new-instance p0, Loml;

    invoke-direct {p0, p2}, Loml;-><init>(Lnml;)V

    invoke-virtual {p1, p0, v3}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final g(Landroid/app/Activity;Ljava/util/List;)Lv9g;
    .registers 4

    new-instance p0, Lt9g;

    const p2, 0x7f1405d1

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    const v0, 0x7f1405d2

    invoke-direct {p0, p1, v0, p2}, Lt9g;-><init>(Landroid/app/Activity;ILjava/lang/String;)V

    return-object p0
.end method

.method public final h()Lxm5;
    .registers 2

    iget-byte v0, p0, Lxbf;->a:B

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lmi;

    invoke-virtual {p0}, Lmi;->h()Lxm5;

    move-result-object p0

    return-object p0

    :pswitch_12
    check-cast p0, Lmi;

    iget-object p0, p0, Lmi;->D:Lxm5;

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method

.method public final i(Lcom/opera/api/Callback;)V
    .registers 4

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Li32;

    new-instance v0, Lj12;

    const/16 v1, 0xa

    invoke-direct {v0, p1, v1}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lq2g;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, v1}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lldk;->f(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final j()V
    .registers 2

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->y1()V

    iget-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Lqln;

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    iget-object v0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v0

    iput-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    return-void
.end method

.method public final l(Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/Button;Landroid/widget/Button;Lcom/google/android/material/textfield/TextInputLayout;Lkotlin/jvm/functions/Function1;)V
    .registers 9

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lrxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1, v0}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p1, Lrxh;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p2, p1}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p1, Lrxh;

    invoke-virtual {p5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p5, p1}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    new-instance p1, Lro9;

    new-instance p2, Lmgf;

    const/16 v0, 0xb

    invoke-direct {p2, p6, p0, v0}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, p5, p2}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    iget-object p2, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p2, Lh58;

    new-instance p6, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p2, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p6, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {p2, p2}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p2

    :goto_4c
    invoke-virtual {p2}, Lw4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_66

    invoke-virtual {p2}, Lw4;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsx8;

    invoke-virtual {p5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v0, v0, Lsx8;->a:I

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4c

    :cond_66
    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/String;

    invoke-virtual {p6, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    iget-object p5, p1, Lro9;->c:Ljava/lang/Object;

    check-cast p5, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance p6, Landroid/widget/ArrayAdapter;

    invoke-virtual {p5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p5

    const v0, 0x7f0d03b6

    invoke-direct {p6, p5, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    iget-object p1, p1, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1, p6}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast p1, Lrxh;

    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lrxh;

    invoke-virtual {p4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final m()Lorg/chromium/media/PhotoCapabilities;
    .registers 15

    new-instance v0, Lorg/chromium/media/PhotoCapabilities;

    iget-object v1, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, [Z

    iget-object v2, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v2, [D

    iget-object v3, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v3, [I

    iget-object v4, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast v4, [I

    iget-object v5, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v5, [I

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, [[I

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    array-length v6, v1

    const/4 v7, 0x0

    const/4 v8, 0x3

    if-ne v6, v8, :cond_bc

    array-length v6, v2

    const/16 v9, 0x10

    if-ne v6, v9, :cond_bc

    array-length v6, v3

    if-ne v6, v9, :cond_bc

    array-length v6, v5

    if-ne v6, v8, :cond_bc

    array-length v6, p0

    if-ne v6, v8, :cond_bc

    const/4 v6, 0x0

    if-eqz v4, :cond_45

    move v9, v6

    :goto_34
    array-length v10, v4

    if-ge v9, v10, :cond_45

    aget v10, v4, v9

    if-ltz v10, :cond_41

    const/4 v11, 0x4

    if-ge v10, v11, :cond_41

    add-int/lit8 v9, v9, 0x1

    goto :goto_34

    :cond_41
    invoke-static {}, Lhai;->d()V

    return-object v7

    :cond_45
    move v9, v6

    :goto_46
    array-length v10, v5

    const/4 v11, 0x5

    if-ge v9, v10, :cond_57

    aget v10, v5, v9

    if-ltz v10, :cond_53

    if-ge v10, v11, :cond_53

    add-int/lit8 v9, v9, 0x1

    goto :goto_46

    :cond_53
    invoke-static {}, Lhai;->d()V

    return-object v7

    :cond_57
    move v9, v6

    :goto_58
    array-length v10, p0

    if-ge v9, v10, :cond_75

    aget-object v10, p0, v9

    if-eqz v10, :cond_72

    move v10, v6

    :goto_60
    aget-object v12, p0, v9

    array-length v13, v12

    if-ge v10, v13, :cond_72

    aget v12, v12, v10

    if-ltz v12, :cond_6e

    if-ge v12, v11, :cond_6e

    add-int/lit8 v10, v10, 0x1

    goto :goto_60

    :cond_6e
    invoke-static {}, Lhai;->d()V

    return-object v7

    :cond_72
    add-int/lit8 v9, v9, 0x1

    goto :goto_58

    :cond_75
    invoke-virtual {v1}, [Z->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Z

    iput-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->a:[Z

    invoke-virtual {v2}, [D->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    iput-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->b:[D

    invoke-virtual {v3}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->c:[I

    if-nez v4, :cond_91

    move-object v1, v7

    goto :goto_97

    :cond_91
    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    :goto_97
    iput-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->d:[I

    invoke-virtual {v5}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->e:[I

    new-array v1, v8, [[I

    iput-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->f:[[I

    :goto_a5
    array-length v1, p0

    if-ge v6, v1, :cond_bb

    iget-object v1, v0, Lorg/chromium/media/PhotoCapabilities;->f:[[I

    aget-object v2, p0, v6

    if-nez v2, :cond_b0

    move-object v2, v7

    goto :goto_b6

    :cond_b0
    invoke-virtual {v2}, [I->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    :goto_b6
    aput-object v2, v1, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_a5

    :cond_bb
    return-object v0

    :cond_bc
    invoke-static {}, Lhai;->d()V

    return-object v7
.end method

.method public final n(Ldx3;Ljava/util/ArrayList;)Lv9g;
    .registers 4

    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lt9g;

    const v0, 0x7f1405d0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p1, p0}, Lt9g;-><init>(Ldx3;Ljava/lang/String;)V

    return-object p2
.end method

.method public final q(Landroid/graphics/Point;Lnt5;)Ljava/lang/Object;
    .registers 10

    iget-object v0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Ldya;

    instance-of v1, p2, Lgjh;

    if-eqz v1, :cond_17

    move-object v1, p2

    check-cast v1, Lgjh;

    iget v2, v1, Lgjh;->w:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lgjh;->w:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lgjh;

    invoke-direct {v1, p0, p2}, Lgjh;-><init>(Lxbf;Lnt5;)V

    :goto_1c
    iget-object p2, v1, Lgjh;->u:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lgjh;->w:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_34

    if-ne v3, v5, :cond_2e

    iget-object p1, v1, Lgjh;->t:Landroid/graphics/Point;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_76

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lz8b;

    iget-object p2, v0, Ldya;->a:Landroid/net/Uri;

    iput-object p1, v1, Lgjh;->t:Landroid/graphics/Point;

    iput v5, v1, Lgjh;->w:I

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    const-string v5, "content"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    iget-object v5, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast v5, Lqie;

    if-eqz v3, :cond_61

    iget-object v3, v5, Lqie;->b:Ljava/lang/Object;

    sget-object v3, Lbb7;->a:Lcv6;

    new-instance v5, Lfb9;

    const/4 v6, 0x3

    invoke-direct {v5, p0, p2, v4, v6}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v3, v5, v1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    :goto_5f
    move-object p2, p0

    goto :goto_73

    :cond_61
    iget-object v3, v5, Lqie;->b:Ljava/lang/Object;

    sget-object v3, Lbb7;->a:Lcv6;

    sget-object v3, Ls6d;->a:Ld7a;

    new-instance v5, Lfg6;

    const/16 v6, 0x1b

    invoke-direct {v5, p0, p2, v4, v6}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v3, v5, v1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_5f

    :goto_73
    if-ne p2, v2, :cond_76

    return-object v2

    :cond_76
    :goto_76
    check-cast p2, Landroid/graphics/Point;

    if-nez p2, :cond_7b

    return-object v4

    :cond_7b
    iget-object p0, v0, Ldya;->b:Landroid/graphics/PointF;

    iget p0, p0, Landroid/graphics/PointF;->x:F

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v0

    invoke-virtual {p0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x4

    div-long/2addr v2, v0

    const-wide/16 v0, 0x2

    div-long/2addr v2, v0

    new-instance p0, Landroid/graphics/Point;

    invoke-direct {p0, p2}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    :goto_9c
    iget p2, p0, Landroid/graphics/Point;->x:I

    iget v0, p0, Landroid/graphics/Point;->y:I

    mul-int v1, p2, v0

    int-to-long v4, v1

    cmp-long v1, v4, v2

    if-lez v1, :cond_b0

    div-int/lit8 p2, p2, 0x2

    iput p2, p0, Landroid/graphics/Point;->x:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/graphics/Point;->y:I

    goto :goto_9c

    :cond_b0
    if-eqz p1, :cond_d0

    iget p2, p1, Landroid/graphics/Point;->x:I

    if-lez p2, :cond_d0

    iget p2, p1, Landroid/graphics/Point;->y:I

    if-lez p2, :cond_d0

    :goto_ba
    iget p2, p0, Landroid/graphics/Point;->x:I

    iget v0, p0, Landroid/graphics/Point;->y:I

    mul-int v1, p2, v0

    iget v2, p1, Landroid/graphics/Point;->x:I

    iget v3, p1, Landroid/graphics/Point;->y:I

    mul-int/2addr v2, v3

    if-le v1, v2, :cond_d0

    div-int/lit8 p2, p2, 0x2

    iput p2, p0, Landroid/graphics/Point;->x:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/graphics/Point;->y:I

    goto :goto_ba

    :cond_d0
    return-object p0
.end method

.method public final r(La9l;)Ld7l;
    .registers 10

    new-instance v0, Ld7l;

    new-instance v2, Lilj;

    iget-object v1, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lvzk;

    invoke-interface {p1}, La9l;->i()Ljke;

    move-result-object v3

    invoke-interface {p1}, La9l;->m()I

    move-result v4

    invoke-interface {p1}, La9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    invoke-direct {v2, v1, v3, v4, p1}, Lilj;-><init>(Lvzk;Ljke;ILcom/opera/android/browser/TabInfo;)V

    iget-object p1, p0, Lxbf;->e:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ltw2;

    iget-object p1, p0, Lxbf;->f:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Laal;

    iget-object p1, p0, Lxbf;->c:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Liga;

    iget-object p1, p0, Lxbf;->d:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Lrc6;

    sget-object v7, Llqm;->j:Llqm;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Ld7l;-><init>(Lxbf;Lilj;Ltw2;Laal;Liga;Lrc6;Llqm;)V

    return-object v0
.end method

.method public final s()V
    .registers 3

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lxx1;

    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Lxx1;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final t()V
    .registers 8

    iget-object v0, p0, Lxbf;->g:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lolh;

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ld7l;

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    iget-object v0, p0, Lxbf;->e:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lxx1;

    invoke-virtual/range {v1 .. v6}, Lolh;->c(Lcom/opera/android/BrowserActivity;Ld7l;Ljava/lang/String;Ljava/lang/String;Lxx1;)V

    return-void
.end method

.method public final u(Lcom/opera/android/browser/TabInfo;ZLlqm;)Ld7l;
    .registers 13

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Liga;

    invoke-interface {v0}, Liga;->e()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, p3}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v6

    if-eqz v6, :cond_1a

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v2 .. v8}, Lxbf;->v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;

    move-result-object p0

    return-object p0

    :cond_1a
    const-string p0, "Initial URL not valid: "

    invoke-static {p0, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public final v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;
    .registers 23

    move-object/from16 v1, p0

    move/from16 v5, p2

    iget-object v0, v1, Lxbf;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lvzk;

    const/4 v0, 0x0

    if-nez p6, :cond_25

    invoke-virtual {v3, v5}, Lvzk;->L(Z)I

    move-result v2

    iget-object v4, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/browser/SessionStore;

    if-eqz v4, :cond_21

    if-nez v5, :cond_21

    new-instance v6, Lbp;

    invoke-direct {v6, v4, v2}, Lbp;-><init>(Lcom/opera/android/browser/SessionStore;I)V

    move-object/from16 v8, p1

    :goto_1f
    move v4, v2

    goto :goto_89

    :cond_21
    move-object/from16 v8, p1

    move-object v6, v0

    goto :goto_1f

    :cond_25
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface/range {p6 .. p6}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface/range {p6 .. p6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_32
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_67

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ltu3;

    new-instance v7, Lzy3;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-interface/range {p6 .. p6}, Ljava/util/List;->size()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v6}, Ltu3;->a()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6}, Ltu3;->a()Ljava/lang/String;

    move-result-object v10

    iget-byte v11, v6, Ltu3;->a:B

    packed-switch v11, :pswitch_data_c6

    iget-object v6, v6, Ltu3;->c:Ljava/lang/String;

    :goto_58
    move-object v11, v6

    goto :goto_5d

    :pswitch_5a
    iget-object v6, v6, Ltu3;->c:Ljava/lang/String;

    goto :goto_58

    :goto_5d
    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v14}, Lzy3;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)V

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    :cond_67
    new-instance v4, Lcom/opera/android/browser/BrowserTabState;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Lvzk;->L(Z)I

    move-result v7

    move-object/from16 v8, p1

    invoke-direct {v4, v2, v6, v7, v8}, Lcom/opera/android/browser/BrowserTabState;-><init>(Ljava/util/ArrayList;IILcom/opera/android/browser/TabInfo;)V

    iget-object v2, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/browser/SessionStore;

    if-eqz v2, :cond_84

    if-nez v5, :cond_84

    invoke-virtual {v2, v4}, Lcom/opera/android/browser/SessionStore;->c(Lcom/opera/android/browser/BrowserTabState;)V

    :cond_84
    invoke-virtual {v4}, Lcom/opera/android/browser/BrowserTabState;->i()Ljke;

    move-result-object v6

    move v4, v7

    :goto_89
    if-eqz p5, :cond_8d

    move-object v7, v0

    goto :goto_8f

    :cond_8d
    move-object/from16 v7, p4

    :goto_8f
    if-eqz v6, :cond_9d

    new-instance v2, Lilj;

    move-object v15, v6

    move v6, v4

    move-object v4, v15

    move-object v15, v8

    move-object v8, v7

    move-object v7, v15

    invoke-direct/range {v2 .. v8}, Lilj;-><init>(Lvzk;Ljke;ZILcom/opera/android/browser/TabInfo;Llsc;)V

    goto :goto_a6

    :cond_9d
    new-instance v2, Lilj;

    move-object/from16 v5, p1

    move/from16 v6, p2

    invoke-direct/range {v2 .. v7}, Lilj;-><init>(Lvzk;ILcom/opera/android/browser/TabInfo;ZLlsc;)V

    :goto_a6
    new-instance v0, Ld7l;

    iget-object v3, v1, Lxbf;->e:Ljava/lang/Object;

    check-cast v3, Ltw2;

    iget-object v4, v1, Lxbf;->f:Ljava/lang/Object;

    check-cast v4, Laal;

    iget-object v5, v1, Lxbf;->c:Ljava/lang/Object;

    check-cast v5, Liga;

    iget-object v6, v1, Lxbf;->d:Ljava/lang/Object;

    check-cast v6, Lrc6;

    move-object/from16 v7, p3

    invoke-direct/range {v0 .. v7}, Ld7l;-><init>(Lxbf;Lilj;Ltw2;Laal;Liga;Lrc6;Llqm;)V

    if-eqz p5, :cond_c4

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ld7l;->Z(Llsc;)V

    :cond_c4
    return-object v0

    nop

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_5a
    .end packed-switch
.end method

.method public final x(Landroid/graphics/Point;FLqnn;Lnt5;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v2, p0

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    iget-object v3, v2, Lxbf;->b:Ljava/lang/Object;

    move-object v6, v3

    check-cast v6, Landroid/content/Context;

    iget-object v3, v2, Lxbf;->f:Ljava/lang/Object;

    check-cast v3, Ldya;

    iget-object v7, v3, Ldya;->d:Ljava/util/ArrayList;

    instance-of v4, v1, Lhjh;

    if-eqz v4, :cond_25

    move-object v4, v1

    check-cast v4, Lhjh;

    iget v5, v4, Lhjh;->x:I

    const/high16 v8, -0x80000000

    and-int v9, v5, v8

    if-eqz v9, :cond_25

    sub-int/2addr v5, v8

    iput v5, v4, Lhjh;->x:I

    :goto_23
    move-object v8, v4

    goto :goto_2b

    :cond_25
    new-instance v4, Lhjh;

    invoke-direct {v4, v2, v1}, Lhjh;-><init>(Lxbf;Lnt5;)V

    goto :goto_23

    :goto_2b
    iget-object v1, v8, Lhjh;->v:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v4, v8, Lhjh;->x:I

    const/4 v5, 0x0

    const/high16 v10, 0x40000000    # 2.0f

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-eqz v4, :cond_4b

    if-ne v4, v12, :cond_45

    iget-object v0, v8, Lhjh;->u:Lcom/opera/hype/image/editor/EditImage;

    iget-object v2, v8, Lhjh;->t:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v4, v13

    goto/16 :goto_111

    :cond_45
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_4b
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_4e
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v0, v4}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v14
    :try_end_58
    .catch Ljava/lang/NullPointerException; {:try_start_4e .. :try_end_58} :catch_22d

    if-eqz v14, :cond_225

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-nez v0, :cond_63

    invoke-static {}, Landroid/os/Looper;->prepare()V

    :cond_63
    new-instance v0, Lcom/opera/hype/image/editor/EditImage;

    const/4 v1, 0x6

    move/from16 v4, p2

    invoke-direct {v0, v6, v13, v4, v1}, Lcom/opera/hype/image/editor/EditImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;FI)V

    iget-object v1, v2, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c6

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_84

    if-eq v1, v12, :cond_c6

    const/4 v4, 0x2

    if-eq v1, v4, :cond_8a

    invoke-static {}, Lh9o;->p()V

    return-object v5

    :cond_84
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c6

    :cond_8a
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f07027b

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    if-lez v1, :cond_c6

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07027a

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    new-instance v5, Landroidx/appcompat/widget/AppCompatImageView;

    invoke-direct {v5, v6}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    sget-object v15, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v15}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const v15, 0x7f0803f6

    invoke-virtual {v5, v15}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v15, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x55

    iput v1, v15, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iput v4, v15, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v4, v15, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v4, v15, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v4, v15, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v5, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_c6
    iget-object v1, v2, Lxbf;->e:Ljava/lang/Object;

    check-cast v1, Lbm8;

    iput-object v1, v0, Lcom/opera/hype/image/editor/EditImage;->r:Ltam;

    invoke-virtual {v0, v3}, Lcom/opera/hype/image/editor/EditImage;->k(Ldya;)V

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v1, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-static {v3, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/view/View;->measure(II)V

    invoke-virtual {v0, v11, v11, v1, v3}, Landroid/view/View;->layout(IIII)V

    sget-object v1, Lnb6;->j:Lqie;

    if-nez v1, :cond_ea

    move-object v1, v13

    :cond_ea
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lyne;->b:Ldeg;

    iget-object v3, v2, Lxbf;->c:Ljava/lang/Object;

    check-cast v3, Lqie;

    iget-object v3, v3, Lqie;->b:Ljava/lang/Object;

    sget-object v3, Lbb7;->a:Lcv6;

    sget-object v15, Ls6d;->a:Ld7a;

    move-object v3, v0

    new-instance v0, Lmz9;

    const/16 v5, 0x11

    move-object v4, v13

    invoke-direct/range {v0 .. v5}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v14, v8, Lhjh;->t:Landroid/graphics/Bitmap;

    iput-object v3, v8, Lhjh;->u:Lcom/opera/hype/image/editor/EditImage;

    iput v12, v8, Lhjh;->x:I

    invoke-static {v15, v0, v8}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v9, :cond_10f

    return-object v9

    :cond_10f
    move-object v0, v3

    move-object v2, v14

    :goto_111
    invoke-virtual {v0}, Lcom/opera/hype/image/editor/EditImage;->d()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_12a

    sget v3, Lok3;->m:I

    const/16 v3, 0x18

    invoke-static {v1, v3}, Lrk3;->a(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v1

    iget-object v3, v0, Lcom/opera/hype/image/editor/EditImage;->o:Lqk3;

    iget-object v3, v3, Lqk3;->c:Lfz2;

    sget-object v5, Lqk3;->d:[Lxtb;

    aget-object v5, v5, v11

    invoke-virtual {v3, v5, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    :cond_12a
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v1, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-static {v3, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v0, v5, v8}, Landroid/view/View;->measure(II)V

    invoke-virtual {v0, v11, v11, v1, v3}, Landroid/view/View;->layout(IIII)V

    iget-object v1, v0, Lcom/opera/hype/image/editor/EditImage;->f:Lkk7;

    iput-boolean v11, v1, Lkk7;->d:Z

    invoke-virtual {v0, v12}, Lcom/opera/hype/image/editor/EditImage;->i(I)V

    invoke-virtual {v0}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object v3

    new-instance v5, Lm57;

    const/16 v8, 0xf

    invoke-direct {v5, v8}, Lm57;-><init>(B)V

    invoke-static {v3, v5}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v3

    new-instance v5, Lu39;

    invoke-direct {v5, v3}, Lu39;-><init>(Lv39;)V

    :goto_15b
    invoke-virtual {v5}, Lu39;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_173

    invoke-virtual {v5}, Lu39;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lbfl;

    iget-object v8, v8, Lbfl;->d:Lrf2;

    iget-object v8, v8, Lrf2;->b:Ljava/lang/Object;

    check-cast v8, Lcom/opera/hype/image/editor/TextBoxFrame;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    goto :goto_15b

    :cond_173
    const-class v5, Landroid/view/ViewGroup;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v5

    new-instance v8, Lm57;

    const/16 v9, 0x10

    invoke-direct {v8, v9}, Lm57;-><init>(B)V

    invoke-static {v0, v5, v8}, Lybh;->z(Landroid/view/ViewGroup;Ls15;Lm57;)V

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v8, v0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object v9, v8, Lbpd;->c:Ljava/lang/Object;

    check-cast v9, Li97;

    iget-object v8, v8, Lbpd;->b:Ljava/lang/Object;

    check-cast v8, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v9, v8}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result v8

    if-eqz v8, :cond_1a3

    iget-object v8, v9, Li97;->a:Landroid/graphics/PointF;

    iget v9, v8, Landroid/graphics/PointF;->x:F

    neg-float v9, v9

    iget v8, v8, Landroid/graphics/PointF;->y:F

    neg-float v8, v8

    invoke-virtual {v5, v9, v8}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_1a3
    invoke-virtual {v0, v5}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    new-instance v5, Lu39;

    invoke-direct {v5, v3}, Lu39;-><init>(Lv39;)V

    :goto_1ab
    invoke-virtual {v5}, Lu39;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c1

    invoke-virtual {v5}, Lu39;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbfl;

    iget-object v3, v3, Lbfl;->d:Lrf2;

    iget-object v3, v3, Lrf2;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v3, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1ab

    :cond_1c1
    invoke-virtual {v0, v11}, Lcom/opera/hype/image/editor/EditImage;->i(I)V

    iput-boolean v12, v1, Lkk7;->d:Z

    new-instance v1, Li97;

    const/4 v3, 0x7

    invoke-direct {v1, v4, v3}, Li97;-><init>(Landroid/graphics/PointF;I)V

    invoke-virtual {v1, v0}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    :cond_1d8
    :goto_1d8
    if-ge v11, v3, :cond_1e8

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v11, v11, 0x1

    instance-of v8, v5, Lf76;

    if-eqz v8, :cond_1d8

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d8

    :cond_1e8
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    new-instance v5, Lfjh;

    invoke-direct {v5, v0, v1, v6, v4}, Lfjh;-><init>(Ljava/util/ArrayList;Li97;Landroid/content/Context;Lmt5;)V

    new-instance v0, Ld82;

    const/4 v4, 0x3

    invoke-direct {v0, v5, v4}, Ld82;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v3}, Lrm5;->Y(Ld82;Landroid/graphics/RectF;)V

    iget-object v0, v1, Li97;->b:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    iget v0, v0, Landroid/graphics/PointF;->y:F

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4, v1, v0}, Landroid/graphics/RectF;->intersect(FFFF)Z

    invoke-virtual {v3}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_224

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v3, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-static {v2, v1, v3, v4, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_224
    return-object v2

    :cond_225
    :try_start_225
    new-instance v0, Ljava/lang/OutOfMemoryError;

    const-string v1, "Bitmap is null"

    invoke-direct {v0, v1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_22d
    .catch Ljava/lang/NullPointerException; {:try_start_225 .. :try_end_22d} :catch_22d

    :catch_22d
    move-exception v0

    new-instance v1, Ljava/lang/OutOfMemoryError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final y(Landroid/graphics/Canvas;IIIIIIIIIZ)V
    .registers 42

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v5, p6

    move/from16 v6, p9

    iget-object v7, v0, Lxbf;->d:Ljava/lang/Object;

    check-cast v7, Landroid/graphics/RectF;

    sub-int v8, p4, v1

    sub-int v9, p5, p3

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    const/4 v9, 0x2

    div-int/2addr v8, v9

    move/from16 v10, p8

    invoke-static {v10, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    add-int v10, p3, p10

    add-int v11, p5, p10

    iget-object v12, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v12, Landroid/graphics/Paint;

    iget-object v13, v0, Lxbf;->c:Ljava/lang/Object;

    move-object/from16 v20, v13

    check-cast v20, [F

    iget-object v13, v0, Lxbf;->b:Ljava/lang/Object;

    move-object/from16 v19, v13

    check-cast v19, [I

    iget-object v13, v0, Lxbf;->e:Ljava/lang/Object;

    move-object/from16 v26, v13

    check-cast v26, Landroid/graphics/Paint;

    iget-object v0, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Matrix;

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v13

    if-nez v13, :cond_49

    move-object/from16 v28, v7

    move/from16 v27, v8

    move-object v13, v12

    :goto_45
    move/from16 v0, p7

    goto/16 :goto_210

    :cond_49
    add-int v13, v8, v6

    shl-int/lit8 v14, v6, 0x1

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    sub-int v14, v1, v6

    sub-int/2addr v10, v6

    add-int v15, p4, v6

    add-int/2addr v11, v6

    move/from16 v16, v9

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v9

    move/from16 p0, v14

    mul-int/lit16 v14, v9, 0xff

    div-int/lit16 v14, v14, 0xff

    invoke-static {v5, v14}, Lp37;->m0(II)I

    move-result v14

    move/from16 p8, v14

    const/4 v14, 0x0

    aput p8, v19, v14

    mul-int/lit16 v14, v9, 0xaa

    div-int/lit16 v14, v14, 0xff

    invoke-static {v5, v14}, Lp37;->m0(II)I

    move-result v14

    move/from16 p10, v9

    const/4 v9, 0x1

    aput v14, v19, v9

    mul-int/lit8 v14, p10, 0x55

    div-int/lit16 v14, v14, 0xff

    invoke-static {v5, v14}, Lp37;->m0(II)I

    move-result v14

    aput v14, v19, v16

    const/4 v14, 0x0

    invoke-static {v5, v14}, Lp37;->m0(II)I

    move-result v17

    const/16 v18, 0x3

    aput v17, v19, v18

    int-to-float v6, v6

    move/from16 p8, v9

    int-to-float v9, v13

    div-float/2addr v6, v9

    const/high16 v17, 0x40000000    # 2.0f

    mul-float v6, v6, v17

    move/from16 p9, v6

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v17, v6, p9

    aput v17, v20, v14

    sub-float v14, v6, v17

    const v21, 0x3e4ccccd    # 0.2f

    mul-float v21, v21, v14

    add-float v21, v21, v17

    aput v21, v20, p8

    const/high16 v21, 0x3f000000    # 0.5f

    mul-float v14, v14, v21

    add-float v14, v14, v17

    aput v14, v20, v16

    aput v6, v20, v18

    invoke-virtual {v12, v5}, Landroid/graphics/Paint;->setColor(I)V

    add-int v14, p0, v13

    int-to-float v14, v14

    add-int v5, v10, v13

    int-to-float v5, v5

    sub-int v6, v15, v13

    int-to-float v6, v6

    move/from16 v25, v5

    sub-int v5, v11, v13

    int-to-float v5, v5

    move/from16 v17, v5

    move/from16 v16, v6

    move/from16 v27, v8

    move-object/from16 v18, v12

    move v6, v13

    move v8, v15

    move/from16 v15, v25

    move-object/from16 v5, v26

    move/from16 v12, p0

    move-object/from16 v13, p1

    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v24, v14

    move/from16 v22, v16

    move/from16 v23, v17

    move-object/from16 v13, v18

    move/from16 v14, p8

    invoke-static {v14, v6}, Ljava/lang/Math;->max(II)I

    move-result v14

    int-to-float v14, v14

    move/from16 v17, v14

    new-instance v14, Landroid/graphics/RadialGradient;

    sget-object v21, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v28, v7

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v21

    move/from16 v3, v22

    move/from16 v2, v23

    move/from16 v7, v24

    move/from16 v4, v25

    invoke-direct/range {v14 .. v20}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    move-object/from16 v15, v20

    move-object/from16 v20, v19

    invoke-virtual {v5, v14}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    if-nez p11, :cond_126

    invoke-virtual {v0, v7, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move/from16 v25, v4

    int-to-float v4, v12

    move/from16 v22, v4

    int-to-float v4, v10

    move-object/from16 v21, p1

    move/from16 v23, v4

    move-object/from16 v26, v5

    move/from16 v24, v7

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v4, v25

    goto :goto_128

    :cond_126
    move-object/from16 v26, v5

    :goto_128
    invoke-virtual {v0, v7, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    int-to-float v5, v12

    move/from16 v17, v2

    int-to-float v2, v11

    move-object/from16 v21, p1

    move/from16 v25, v2

    move/from16 v22, v5

    move/from16 v24, v7

    move/from16 v23, v17

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v2, v23

    if-nez p11, :cond_15c

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    int-to-float v5, v10

    move/from16 v16, v3

    int-to-float v3, v8

    move-object/from16 v21, p1

    move/from16 v24, v3

    move/from16 v25, v4

    move/from16 v23, v5

    move/from16 v22, v16

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v3, v22

    :cond_15c
    invoke-virtual {v0, v3, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    int-to-float v5, v8

    int-to-float v14, v11

    move-object/from16 v21, p1

    move/from16 v23, v2

    move/from16 v22, v3

    move/from16 v24, v5

    move/from16 v25, v14

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v5, v26

    new-instance v14, Landroid/graphics/LinearGradient;

    const/16 v17, 0x0

    move-object/from16 v19, v18

    const/16 v18, 0x0

    move-object/from16 v21, v15

    const/4 v15, 0x0

    const/high16 v16, 0x3f800000    # 1.0f

    invoke-direct/range {v14 .. v21}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v5, v14}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    const/4 v3, 0x0

    if-nez p11, :cond_1ad

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v0, v15, v9}, Landroid/graphics/Matrix;->setScale(FF)V

    int-to-float v10, v10

    invoke-virtual {v0, v3, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move-object/from16 v21, p1

    move/from16 v25, v4

    move-object/from16 v26, v5

    move/from16 v23, v10

    move/from16 v24, v22

    move/from16 v22, v7

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v4, v24

    move/from16 v24, v22

    move/from16 v22, v4

    move/from16 v4, v25

    goto :goto_1b3

    :cond_1ad
    move-object/from16 v26, v5

    move/from16 v24, v7

    const/high16 v15, 0x3f800000    # 1.0f

    :goto_1b3
    neg-int v5, v6

    int-to-float v5, v5

    invoke-virtual {v0, v15, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    int-to-float v5, v11

    invoke-virtual {v0, v3, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move/from16 v21, v24

    move/from16 v24, v22

    move/from16 v22, v21

    move-object/from16 v21, p1

    move/from16 v23, v2

    move/from16 v25, v5

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v16, v24

    move/from16 v24, v22

    invoke-virtual {v0, v15, v9}, Landroid/graphics/Matrix;->setScale(FF)V

    const/high16 v2, -0x3d4c0000    # -90.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    int-to-float v2, v12

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move/from16 v22, v2

    move/from16 v25, v23

    move/from16 v23, v4

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move/from16 v29, v25

    move/from16 v25, v23

    move/from16 v23, v29

    invoke-virtual {v0, v15, v9}, Landroid/graphics/Matrix;->setScale(FF)V

    const/high16 v2, 0x42b40000    # 90.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    int-to-float v2, v8

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v14, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    move/from16 v21, v25

    move/from16 v25, v23

    move/from16 v23, v21

    move-object/from16 v21, p1

    move/from16 v24, v2

    move/from16 v22, v16

    invoke-virtual/range {v21 .. v26}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_45

    :goto_210
    invoke-virtual {v13, v0}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v0, v1

    move/from16 v2, p3

    int-to-float v1, v2

    move/from16 v3, p4

    int-to-float v2, v3

    move/from16 v4, p5

    int-to-float v3, v4

    move-object/from16 v7, v28

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    move/from16 v0, v27

    int-to-float v0, v0

    move-object/from16 v1, p1

    invoke-virtual {v1, v7, v0, v0, v13}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final z(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/oauth2/OperaAccessToken;

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Lcom/opera/android/oauth2/OperaAccessToken;->a()Z

    move-result v1

    if-nez v1, :cond_12

    iget-object p0, v0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_12
    const/4 v0, 0x0

    iput-object v0, p0, Lxbf;->g:Ljava/lang/Object;

    :cond_15
    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La55;

    new-instance v1, Lmb;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, Lmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, La55;->c:Lnrl;

    new-instance p1, Lkw4;

    const/4 v2, 0x1

    invoke-direct {p1, v0, v2, v1, v2}, Lkw4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method
