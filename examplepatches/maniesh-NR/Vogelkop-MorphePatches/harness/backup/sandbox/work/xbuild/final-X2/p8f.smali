.class public final Lp8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn;
.implements Lzkf;
.implements Ld94;
.implements Lf94;
.implements Licj;
.implements Lrr9;
.implements Lr6l;
.implements Lo7h;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lp8f;->a:B

    packed-switch p1, :pswitch_data_26

    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 309
    sget-object p1, Limi;->a:[J

    .line 310
    new-instance p1, Lsee;

    invoke-direct {p1}, Lsee;-><init>()V

    .line 311
    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    return-void

    .line 312
    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 313
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 314
    sget-object v0, Lmkh;->f:Liml;

    .line 315
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    .line 316
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 317
    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    return-void

    :pswitch_data_26
    .packed-switch 0x14
        :pswitch_12
    .end packed-switch
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 261
    iput-byte p1, p0, Lp8f;->a:B

    iput-object p2, p0, Lp8f;->b:Ljava/lang/Object;

    iput-object p4, p0, Lp8f;->d:Ljava/lang/Object;

    iput-object p3, p0, Lp8f;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 255
    iput-byte p1, p0, Lp8f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    const/16 v0, 0x13

    iput-byte v0, p0, Lp8f;->a:B

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lp8f;->b:Ljava/lang/Object;

    .line 319
    new-instance p2, Lvg4;

    const/16 v0, 0x10

    invoke-direct {p2, p1, v0}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    .line 320
    new-instance p1, Lunj;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lunj;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;Lx5f;)V
    .registers 7

    const/4 v0, 0x5

    iput-byte v0, p0, Lp8f;->a:B

    .line 279
    const-string v0, "premium_onboarding_reporter"

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    invoke-static {p1, p2, v0, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 281
    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    .line 282
    iput-object p3, p0, Lp8f;->c:Ljava/lang/Object;

    .line 283
    iput-object p4, p0, Lp8f;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Ljava/util/ArrayList;Ldcj;)V
    .registers 5

    const/16 v0, 0x11

    iput-byte v0, p0, Lp8f;->a:B

    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 292
    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    .line 293
    iput-object p2, p0, Lp8f;->c:Ljava/lang/Object;

    .line 294
    new-instance p1, Ljcj;

    invoke-direct {p1, p3}, Ljcj;-><init>(Ldcj;)V

    iput-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld4d;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lp8f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    new-array v0, v0, [I

    iput-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    .line 256
    iget-object p1, p1, Ld4d;->g:Liuh;

    .line 257
    iput-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld8e;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lp8f;->a:B

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;Ljava/lang/String;B)V
    .registers 5

    .line 258
    iput-byte p4, p0, Lp8f;->a:B

    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    iput-object p2, p0, Lp8f;->b:Ljava/lang/Object;

    iput-object p3, p0, Lp8f;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 259
    iput-byte p4, p0, Lp8f;->a:B

    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    iput-object p2, p0, Lp8f;->c:Ljava/lang/Object;

    iput-object p3, p0, Lp8f;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V
    .registers 6

    .line 260
    iput-byte p5, p0, Lp8f;->a:B

    iput-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    iput-object p2, p0, Lp8f;->b:Ljava/lang/Object;

    iput-object p3, p0, Lp8f;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lk6l;Lq82;)V
    .registers 4

    const/16 v0, 0x9

    iput-byte v0, p0, Lp8f;->a:B

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    .line 297
    sget-object v0, Lukh;->f:Lukh;

    iput-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    .line 298
    sget-object v0, Lukh;->e:Lukh;

    iput-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    .line 299
    new-instance v0, Ltkh;

    invoke-direct {v0, p0}, Ltkh;-><init>(Lp8f;)V

    .line 300
    iget-object p2, p2, Lq82;->a:Lh7f;

    .line 301
    invoke-virtual {p2, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    .line 302
    new-instance p2, Lqz;

    const/16 v0, 0x15

    invoke-direct {p2, p0, v0}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lk6l;->a(La2l;)Lf6l;

    return-void
.end method

.method public constructor <init>(Lmcj;Landroid/view/Window;)V
    .registers 5

    const/16 v0, 0x15

    iput-byte v0, p0, Lp8f;->a:B

    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 286
    new-instance v0, Ljje;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ljje;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    .line 287
    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    .line 288
    iput-object p2, p0, Lp8f;->c:Ljava/lang/Object;

    .line 289
    iget-object p1, p1, Lmcj;->a:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-virtual {p1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    .line 290
    invoke-virtual {p0}, Lp8f;->L()V

    return-void
.end method

.method public constructor <init>(Lmrk;Ldbf;)V
    .registers 4

    const/16 v0, 0x17

    iput-byte v0, p0, Lp8f;->a:B

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 304
    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    iput-object p2, p0, Lp8f;->d:Ljava/lang/Object;

    .line 305
    new-instance p1, Lpde;

    new-instance p2, Lf55;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lf55;-><init>(Z)V

    .line 306
    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 307
    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnr8;Ljava/util/LinkedHashSet;)V
    .registers 10

    const/16 v0, 0x1a

    iput-byte v0, p0, Lp8f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sget-object p2, Lx6l;->a:Lx6l;

    invoke-static {v0, p2}, Lexg;->A(Ljava/util/ArrayList;Lnxg;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v1, 0x0

    move v2, v1

    :cond_1d
    :goto_1d
    if-ge v2, p2, :cond_59

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lb2l;

    check-cast v3, Ld7l;

    invoke-virtual {v3}, Ld7l;->n0()Z

    move-result v4

    if-nez v4, :cond_1d

    iget-object v4, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v4, Lnr8;

    invoke-virtual {v3}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Lnr8;->b(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v3

    iget-object v5, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v5, Lnr8;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lhp2;

    invoke-direct {v6, v5, v3, v4}, Lhp2;-><init>(Lnr8;J)V

    check-cast v5, Lcom/opera/android/favorites/e;

    iget-object v3, v5, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    invoke-static {v6, v3}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object v3

    if-eqz v3, :cond_1d

    invoke-virtual {p1, v3}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_59
    invoke-static {p1}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p1

    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const/4 v0, 0x3

    invoke-static {v0, p2}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p2

    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lp8f;->d:Ljava/lang/Object;

    invoke-virtual {p1}, Lehc;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_fe

    iget-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p1, Lnr8;

    check-cast p1, Lcom/opera/android/favorites/e;

    iget-object p1, p1, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    :cond_8b
    const/4 v2, 0x0

    if-ge v1, p2, :cond_ac

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    move-object v4, v3

    check-cast v4, Lhq8;

    invoke-virtual {v4}, Lhq8;->h()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8b

    invoke-virtual {v4}, Lhq8;->j()Z

    move-result v4

    if-eqz v4, :cond_8b

    goto :goto_ad

    :cond_ac
    move-object v3, v2

    :goto_ad
    instance-of p1, v3, Ltq8;

    if-eqz p1, :cond_b4

    move-object v2, v3

    check-cast v2, Ltq8;

    :cond_b4
    if-eqz v2, :cond_d8

    iget-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p1, Lehc;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_be
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_fe

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lhq8;

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lnr8;

    iget-object v1, v2, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, p2, v2, v1}, Lnr8;->d(Lhq8;Ltq8;I)V

    goto :goto_be

    :cond_d8
    iget-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p1, Lnr8;

    iget-object p2, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p2, Lehc;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lcom/opera/android/favorites/e;

    iget-object p1, p1, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sget-object v1, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {p1, p0}, LJ/N;->M98NjnEk(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    new-instance p1, Lpv1;

    invoke-direct {p1, p0, v0}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p2, p1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    :cond_fe
    return-void
.end method

.method public constructor <init>(Lpde;Lpt1;Lkze;Ltsd;)V
    .registers 7

    const/16 v0, 0x1c

    iput-byte v0, p0, Lp8f;->a:B

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 263
    iput-object p2, p0, Lp8f;->b:Ljava/lang/Object;

    .line 264
    iput-object p3, p0, Lp8f;->c:Ljava/lang/Object;

    .line 265
    iput-object p4, p0, Lp8f;->d:Ljava/lang/Object;

    .line 266
    sget v0, Ld03;->e:I

    iget-object p2, p2, Lpt1;->f:Ljava/lang/Object;

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 267
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f08024b

    invoke-static {v1, v0}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 268
    invoke-static {p2, v0}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 269
    new-instance v0, Lrvl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lrvl;-><init>(Lp8f;B)V

    invoke-static {p3, p1, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 270
    new-instance p3, Lrvl;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Lrvl;-><init>(Lp8f;B)V

    invoke-static {p4, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 271
    new-instance p1, Lsvk;

    const/16 p3, 0x8

    invoke-direct {p1, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    .line 272
    invoke-static {p2, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    .line 273
    invoke-virtual {p1, p2}, Lsvk;->a(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Ludc;)V
    .registers 4

    const/16 v0, 0x10

    iput-byte v0, p0, Lp8f;->a:B

    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 275
    new-instance v0, Lqdc;

    const/4 v1, 0x1

    .line 276
    invoke-direct {v0, p1, v1}, Lqdc;-><init>(Lndc;Z)V

    .line 277
    iput-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    .line 278
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lp8f;->c:Ljava/lang/Object;

    return-void
.end method

.method public static A(Lp8f;II[BII)I
    .registers 13

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, [I

    const/4 v0, 0x0

    move v1, v0

    :cond_6
    :goto_6
    if-ge v0, p2, :cond_56

    if-ge v1, p4, :cond_56

    aget-byte v2, p3, v1

    and-int/lit8 v3, v2, 0xf

    add-int/lit8 v1, v1, 0x1

    and-int/lit16 v2, v2, 0xff

    const/4 v4, 0x4

    shr-int/2addr v2, v4

    const/4 v5, 0x2

    if-ne p5, v5, :cond_3d

    const/16 v4, 0xf

    if-ge v3, v4, :cond_2a

    mul-int/lit16 v6, v3, 0xcd

    shr-int/lit8 v6, v6, 0xa

    mul-int/lit8 v6, v6, 0x5

    sub-int/2addr v3, v6

    add-int v6, p1, v0

    rsub-int/lit8 v3, v3, 0x2

    aput v3, p0, v6

    add-int/lit8 v0, v0, 0x1

    :cond_2a
    if-ge v2, v4, :cond_6

    if-ge v0, p2, :cond_6

    mul-int/lit16 v3, v2, 0xcd

    shr-int/lit8 v3, v3, 0xa

    mul-int/lit8 v3, v3, 0x5

    sub-int/2addr v2, v3

    add-int v3, p1, v0

    sub-int/2addr v5, v2

    aput v5, p0, v3

    :goto_3a
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_3d
    if-ne p5, v4, :cond_6

    const/16 v4, 0x9

    if-ge v3, v4, :cond_4b

    add-int v5, p1, v0

    rsub-int/lit8 v3, v3, 0x4

    aput v3, p0, v5

    add-int/lit8 v0, v0, 0x1

    :cond_4b
    if-ge v2, v4, :cond_6

    if-ge v0, p2, :cond_6

    add-int v3, p1, v0

    rsub-int/lit8 v2, v2, 0x4

    aput v2, p0, v3

    goto :goto_3a

    :cond_56
    return v0
.end method

.method public static B(Lp8f;II[BI)I
    .registers 10

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, [I

    const/4 v0, 0x0

    move v1, v0

    :goto_6
    if-ge v0, p2, :cond_33

    add-int/lit8 v2, v1, 0x3

    if-gt v2, p4, :cond_33

    add-int/lit8 v3, v1, 0x1

    aget-byte v4, p3, v1

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v1, v1, 0x2

    aget-byte v3, p3, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v4, v3

    aget-byte v1, p3, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v4, v1

    const v1, 0x7fffff

    and-int/2addr v4, v1

    const v1, 0x7fe001

    if-ge v4, v1, :cond_31

    add-int v1, p1, v0

    aput v4, p0, v1

    add-int/lit8 v0, v0, 0x1

    :cond_31
    move v1, v2

    goto :goto_6

    :cond_33
    return v0
.end method

.method public static H(Lq6e;Landroid/content/Context;)Z
    .registers 3

    invoke-virtual {p0}, Lq6e;->b()Leri;

    move-result-object p0

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p1

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p1, v0}, Lwnh;->a(I)Z

    move-result p1

    if-nez p1, :cond_1e

    invoke-static {p0}, Lgco;->a(Leri;)Z

    move-result p0

    if-eqz p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public static I(I)Lum0;
    .registers 2

    if-eqz p0, :cond_19

    const/4 v0, 0x1

    if-eq p0, v0, :cond_16

    const/4 v0, 0x2

    if-ne p0, v0, :cond_b

    sget-object p0, Lum0;->d:Lum0;

    return-object p0

    :cond_b
    const-string v0, "Unexpected value: "

    invoke-static {p0, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_16
    sget-object p0, Lum0;->c:Lum0;

    return-object p0

    :cond_19
    sget-object p0, Lum0;->b:Lum0;

    return-object p0
.end method

.method public static J(I)Lan0;
    .registers 1

    packed-switch p0, :pswitch_data_24

    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_8
    sget-object p0, Lan0;->j:Lan0;

    return-object p0

    :pswitch_b
    sget-object p0, Lan0;->i:Lan0;

    return-object p0

    :pswitch_e
    sget-object p0, Lan0;->h:Lan0;

    return-object p0

    :pswitch_11
    sget-object p0, Lan0;->g:Lan0;

    return-object p0

    :pswitch_14
    sget-object p0, Lan0;->f:Lan0;

    return-object p0

    :pswitch_17
    sget-object p0, Lan0;->e:Lan0;

    return-object p0

    :pswitch_1a
    sget-object p0, Lan0;->d:Lan0;

    return-object p0

    :pswitch_1d
    sget-object p0, Lan0;->c:Lan0;

    return-object p0

    :pswitch_20
    sget-object p0, Lan0;->b:Lan0;

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public static k(Lzxh;)Lp8f;
    .registers 4

    new-instance v0, Lp8f;

    const/16 v1, 0xa

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lp8f;-><init>(BZ)V

    iget-object v1, p0, Lzxh;->a:Lsa2;

    iput-object v1, v0, Lp8f;->b:Ljava/lang/Object;

    iget-object v1, p0, Lzxh;->b:Layh;

    iput-object v1, v0, Lp8f;->c:Ljava/lang/Object;

    iget-object p0, p0, Lzxh;->c:Lbm8;

    iput-object p0, v0, Lp8f;->d:Ljava/lang/Object;

    return-object v0
.end method

.method public static n(Lffi;Ljava/lang/String;)Lhfi;
    .registers 5

    move-object v0, p0

    check-cast v0, Lhfi;

    iget-object v1, v0, Lhfi;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    return-object v0

    :cond_c
    invoke-interface {p0}, Lffi;->h()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljfi;

    instance-of v1, v0, Lhfi;

    if-eqz v1, :cond_14

    move-object v1, v0

    check-cast v1, Lhfi;

    iget-object v2, v1, Lhfi;->c:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30

    return-object v1

    :cond_30
    instance-of v1, v0, Lffi;

    if-eqz v1, :cond_14

    check-cast v0, Lffi;

    invoke-static {v0, p1}, Lp8f;->n(Lffi;Ljava/lang/String;)Lhfi;

    move-result-object v0

    if-eqz v0, :cond_14

    return-object v0

    :cond_3d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static w(Landroid/view/Window;)V
    .registers 4

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Ltu4;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Ltu4;-><init>(Landroid/view/Window;B)V

    invoke-static {v0, v1}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final C(I)V
    .registers 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual {v0}, Lp8f;->t()Lmvg;

    move-result-object v2

    if-nez v2, :cond_b

    return-void

    :cond_b
    iget-object v3, v2, Lmvg;->e:Ljava/lang/String;

    iget-object v4, v2, Lmvg;->d:Ljava/lang/String;

    iget-object v5, v2, Lmvg;->c:Ljava/lang/String;

    iput v1, v2, Lmvg;->h:I

    iget-object v6, v0, Lp8f;->c:Ljava/lang/Object;

    check-cast v6, Lx5f;

    iget v7, v2, Lmvg;->a:I

    invoke-static {v7}, Lbwg;->E(I)Lwm0;

    move-result-object v7

    iget v8, v2, Lmvg;->b:I

    invoke-static {v8}, Lp8f;->J(I)Lan0;

    move-result-object v8

    iget-object v9, v2, Lmvg;->f:Ljava/util/ArrayList;

    invoke-static {v9}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v9

    new-instance v10, Lb10;

    const/16 v11, 0x19

    invoke-direct {v10, v11}, Lb10;-><init>(B)V

    invoke-static {v10, v9}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v9

    invoke-static {v9}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v9

    iget-object v10, v2, Lmvg;->g:Ljava/util/ArrayList;

    invoke-static {v10}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v10

    new-instance v11, Ljava/util/ArrayList;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v12

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v10}, Ljava/util/AbstractCollection;->size()I

    move-result v12

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/4 v13, 0x0

    :goto_4f
    if-ge v13, v12, :cond_8c

    invoke-interface {v10, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v1, v17

    check-cast v1, Lkvg;

    move-object/from16 v17, v10

    if-eqz v14, :cond_83

    iget v10, v14, Lkvg;->a:I

    move/from16 v18, v12

    iget v12, v1, Lkvg;->a:I

    move/from16 v19, v13

    if-ne v10, v12, :cond_73

    iget-wide v12, v1, Lkvg;->b:J

    add-long/2addr v15, v12

    :goto_6c
    move-object/from16 v10, v17

    move/from16 v12, v18

    move/from16 v13, v19

    goto :goto_4f

    :cond_73
    invoke-static {v10}, Lp8f;->I(I)Lum0;

    move-result-object v10

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v10

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_87

    :cond_83
    move/from16 v18, v12

    move/from16 v19, v13

    :goto_87
    iget-wide v12, v1, Lkvg;->b:J

    move-object v14, v1

    move-wide v15, v12

    goto :goto_6c

    :cond_8c
    if-eqz v14, :cond_9f

    iget v1, v14, Lkvg;->a:I

    invoke-static {v1}, Lp8f;->I(I)Lum0;

    move-result-object v1

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v1, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9f
    iget v1, v2, Lmvg;->h:I

    invoke-static {v1}, Lbwg;->F(I)Lxm0;

    move-result-object v1

    iget-boolean v2, v6, Lx5f;->h:Z

    if-eqz v2, :cond_160

    iget-object v2, v6, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    invoke-virtual {v10, v2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    new-instance v12, Lzm0;

    const/16 v13, 0x8

    const/16 v14, 0x98b

    const/4 v15, -0x1

    invoke-direct {v12, v14, v15, v13}, Ljf0;-><init>(III)V

    const/4 v13, 0x1

    const/4 v14, 0x0

    invoke-virtual {v12, v14, v13, v7}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v7, 0x3

    invoke-virtual {v12, v7, v13, v8}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v8, 0x4

    invoke-virtual {v12, v8, v5}, Lzm0;->x(ILjava/lang/String;)V

    const/4 v8, 0x5

    invoke-virtual {v12, v8, v4}, Lzm0;->x(ILjava/lang/String;)V

    const/4 v8, 0x6

    invoke-virtual {v12, v8, v3}, Lzm0;->x(ILjava/lang/String;)V

    new-instance v8, Lzbe;

    const/16 v14, 0x17

    invoke-direct {v8, v6, v14}, Lzbe;-><init>(Ljava/lang/Object;B)V

    new-instance v14, Lqw8;

    invoke-direct {v14, v8, v7}, Lqw8;-><init>(Ljava/lang/Object;B)V

    invoke-static {v14, v9}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v7

    const/4 v8, 0x2

    invoke-virtual {v12, v8, v13, v7}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-direct {v7, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v14, 0x0

    :goto_f4
    if-ge v14, v9, :cond_132

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v13, v17

    check-cast v13, Landroid/util/Pair;

    move/from16 v17, v9

    new-instance v9, Lvm0;

    move-object/from16 v19, v11

    const/16 v11, 0x98b

    invoke-direct {v9, v11, v15, v8}, Ljf0;-><init>(III)V

    iget-object v8, v13, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Lum0;

    if-nez v8, :cond_114

    const/4 v11, 0x0

    :goto_112
    const/4 v15, 0x0

    goto :goto_116

    :cond_114
    const/4 v11, 0x1

    goto :goto_112

    :goto_116
    invoke-virtual {v9, v15, v11, v8}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v8, v13, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Number;

    move v11, v14

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v13

    const/4 v8, 0x1

    invoke-virtual {v9, v8, v8, v13, v14}, Ljf0;->p(IIJ)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v13, v8

    move v14, v11

    move/from16 v9, v17

    move-object/from16 v11, v19

    const/4 v8, 0x2

    const/4 v15, -0x1

    goto :goto_f4

    :cond_132
    move v8, v13

    const/4 v9, 0x7

    invoke-virtual {v12, v9, v8, v7}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v12, v8, v8, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 v1, 0x26

    invoke-virtual {v2, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-eqz v7, :cond_150

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_150

    new-instance v8, Lhf0;

    invoke-direct {v8, v2, v1, v7}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_15a

    :cond_150
    const/4 v8, 0x1

    invoke-static {v2, v1, v8}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v7

    new-instance v8, Lhf0;

    invoke-direct {v8, v2, v1, v7}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_15a
    invoke-virtual {v8, v12}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6, v10}, Lx5f;->U0(Lx56;)V

    :cond_160
    if-nez p1, :cond_18a

    iget-object v1, v0, Lp8f;->d:Ljava/lang/Object;

    check-cast v1, Lx5f;

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v2}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v7

    const/16 v8, 0x32

    invoke-virtual {v7, v8, v5}, Lin0;->x(ILjava/lang/String;)V

    invoke-virtual {v6, v2}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v5

    const/16 v7, 0x33

    invoke-virtual {v5, v7, v4}, Lin0;->x(ILjava/lang/String;)V

    invoke-virtual {v6, v2}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v2

    const/16 v4, 0x34

    invoke-virtual {v2, v4, v3}, Lin0;->x(ILjava/lang/String;)V

    invoke-virtual {v1, v6}, Lx5f;->U0(Lx56;)V

    :cond_18a
    iget-object v0, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "session"

    invoke-static {v0, v1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method

.method public final D(Ljava/lang/String;)Lhfi;
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_96

    const-string v1, "\""

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_22

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v2, "\\\""

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_3f

    :cond_22
    const-string v1, "\'"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3f

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3f

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v2, "\\\'"

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_3f
    :goto_3f
    const-string v1, "\\\n"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\\A"

    const-string v2, "\n"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_96

    const-string v1, "#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_96

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_6c

    return-object v0

    :cond_6c
    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lcfi;

    iget-object v0, v0, Lhfi;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lcfi;

    return-object p0

    :cond_7d
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8a

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhfi;

    return-object p0

    :cond_8a
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lcfi;

    invoke-static {p0, p1}, Lp8f;->n(Lffi;Ljava/lang/String;)Lhfi;

    move-result-object p0

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    :cond_96
    return-object v0
.end method

.method public final E()V
    .registers 8

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v2, Lq6e;

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-static {v2, p0}, Lp8f;->H(Lq6e;Landroid/content/Context;)Z

    move-result p0

    const-string v2, "y"

    const-string v3, "js"

    const-string v4, "translate"

    const-string v5, "https"

    if-eqz p0, :cond_56

    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p0, v5}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v5, "translate.yandex.com"

    invoke-virtual {p0, v5}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v3, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    move-object v2, v0

    check-cast v2, Ld7l;

    invoke-virtual {v2}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v2

    const-string v3, "url"

    invoke-virtual {p0, v3, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "lang"

    invoke-virtual {p0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    goto :goto_a4

    :cond_56
    const-string p0, "zh"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6e

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "_"

    const-string v6, "-"

    invoke-virtual {p0, v1, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    :cond_6e
    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p0, v5}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v5, "translate.google.com"

    invoke-virtual {p0, v5}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v4, "sl"

    const-string v5, "auto"

    invoke-virtual {p0, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v4, "tl"

    invoke-virtual {p0, v4, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v3, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    move-object v1, v0

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v1

    const-string v2, "u"

    invoke-virtual {p0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    :goto_a4
    check-cast v0, Ld7l;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Llqm;->n:Llqm;

    const/4 v2, 0x0

    invoke-static {p0, v2, v1}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ld7l;->Z(Llsc;)V

    return-void
.end method

.method public final F(Ljava/lang/Object;)V
    .registers 7

    invoke-static {}, Ljoh;->k()J

    move-result-wide v0

    sget-wide v2, Lwml;->a:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_d

    iput-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    return-void

    :cond_d
    iget-object v2, p0, Lp8f;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_10
    iget-object v3, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Liml;

    invoke-virtual {v3, v0, v1}, Liml;->a(J)I

    move-result v4

    if-gez v4, :cond_2c

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v0, v1, p1}, Liml;->b(JLjava/lang/Object;)Liml;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_30

    :cond_2c
    iget-object p0, v3, Liml;->c:[Ljava/lang/Object;

    aput-object p1, p0, v4
    :try_end_30
    .catchall {:try_start_10 .. :try_end_30} :catchall_32

    :goto_30
    monitor-exit v2

    return-void

    :catchall_32
    move-exception p0

    monitor-exit v2

    throw p0
.end method

.method public final G(Lmvg;)V
    .registers 12

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "entry_point"

    iget v2, p1, Lmvg;->a:I

    invoke-virtual {v0, v2, v1}, Lorb;->n(ILjava/lang/String;)V

    const-string v1, "first_view"

    iget v2, p1, Lmvg;->b:I

    invoke-virtual {v0, v2, v1}, Lorb;->n(ILjava/lang/String;)V

    const-string v1, "campaign"

    iget-object v2, p1, Lmvg;->c:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "source"

    iget-object v2, p1, Lmvg;->d:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "target"

    iget-object v2, p1, Lmvg;->e:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    iget-object v2, p1, Lmvg;->f:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_43
    if-ge v5, v3, :cond_67

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Llvg;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    const-string v8, "from"

    iget v9, v6, Llvg;->a:I

    invoke-virtual {v7, v9, v8}, Lorb;->n(ILjava/lang/String;)V

    const-string v8, "to"

    iget v6, v6, Llvg;->b:I

    invoke-virtual {v7, v6, v8}, Lorb;->n(ILjava/lang/String;)V

    invoke-virtual {v1, v7}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_43

    :cond_67
    const-string v2, "navigations"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    iget-object v2, p1, Lmvg;->g:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_77
    if-ge v4, v3, :cond_9b

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lkvg;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lorb;

    invoke-direct {v6}, Lorb;-><init>()V

    const-string v7, "item"

    iget v8, v5, Lkvg;->a:I

    invoke-virtual {v6, v8, v7}, Lorb;->n(ILjava/lang/String;)V

    const-string v7, "duration"

    iget-wide v8, v5, Lkvg;->b:J

    invoke-virtual {v6, v8, v9, v7}, Lorb;->o(JLjava/lang/String;)V

    invoke-virtual {v1, v6}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_77

    :cond_9b
    const-string v2, "carousel_items"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "exit_reason"

    iget p1, p1, Lmvg;->h:I

    invoke-virtual {v0, p1, v1}, Lorb;->n(ILjava/lang/String;)V

    iget-object p1, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "session"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final K()V
    .registers 4

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lsee;

    iget-object v1, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lsee;->k(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_17

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_17
    move-object p0, v2

    check-cast p0, Ljava/util/Collection;

    if-eqz p0, :cond_25

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_25

    invoke-virtual {v0, v1, v2}, Lsee;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_25
    return-void
.end method

.method public final L()V
    .registers 4

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lmcj;

    iget-object v0, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    const/16 v2, 0x2000

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_23

    or-int/2addr v1, v2

    goto :goto_25

    :cond_23
    and-int/lit16 v1, v1, -0x2001

    :goto_25
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public final a()V
    .registers 3

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lpt1;

    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v1, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v1, 0x7f0402a2

    invoke-static {v1, p0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_3a

    :cond_24
    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv8k;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lv8k;->d(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_3a
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    iget-object v0, v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final d(Lcom/google/android/gms/ads/AdError;)V
    .registers 4

    iget-byte v0, p0, Lp8f;->a:B

    const-string v1, "loadAd: initialize onError, error="

    packed-switch v0, :pswitch_data_3a

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lqpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqpf;->b(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lopf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lopf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lopf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x2
        :pswitch_20
    .end packed-switch
.end method

.method public final e()V
    .registers 8

    iget-byte v0, p0, Lp8f;->a:B

    const-string v1, "loadAd: initialize onSuccess"

    packed-switch v0, :pswitch_data_a6

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lqpf;

    invoke-virtual {v0, v1}, Lqpf;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;

    invoke-static {v0}, Lrm5;->a0(Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;)V

    new-instance v1, Li4d;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Li4d;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lwjo;->b:Lwjo;

    invoke-static {v1}, Lfcp;->a(Lcn;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_55

    invoke-static {v1, v0}, Lfcp;->b(Lcn;Landroid/content/Context;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_55

    invoke-static {v1, p0}, Lfcp;->c(Lcn;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_55

    sget-object v3, Lfko;->a:Lejo;

    invoke-static {v0}, Lfko;->a(Landroid/content/Context;)V

    new-instance v3, Ll2i;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v4, Lpro;

    sget-object v5, Lsm;->g:Lsm;

    sget-object v6, Leq;->e:Leq;

    invoke-direct {v4, p0, v5, v6, v2}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    invoke-direct {v3, v0, v4}, Lm4b;-><init>(Landroid/content/Context;Lpro;)V

    invoke-virtual {v3, v1}, Lk8;->J(Lcn;)V

    invoke-virtual {v3}, Lk8;->I()V

    :cond_55
    return-void

    :pswitch_56
    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lopf;

    invoke-virtual {v0, v1}, Lopf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;

    invoke-static {v0}, Lrm5;->a0(Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;)V

    new-instance v1, Li4d;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Li4d;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lwjo;->b:Lwjo;

    invoke-static {v1}, Lfcp;->a(Lcn;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_a4

    invoke-static {v1, v0}, Lfcp;->b(Lcn;Landroid/content/Context;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_a4

    invoke-static {v1, p0}, Lfcp;->c(Lcn;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_a4

    sget-object v3, Lfko;->a:Lejo;

    invoke-static {v0}, Lfko;->a(Landroid/content/Context;)V

    new-instance v3, Ldhb;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v4, Lpro;

    sget-object v5, Lsm;->e:Lsm;

    sget-object v6, Leq;->e:Leq;

    invoke-direct {v4, p0, v5, v6, v2}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    invoke-direct {v3, v0, v4}, Lk8;-><init>(Landroid/content/Context;Lpro;)V

    invoke-virtual {v3, v1}, Lk8;->J(Lcn;)V

    invoke-virtual {v3}, Lk8;->I()V

    :cond_a4
    return-void

    nop

    :pswitch_data_a6
    .packed-switch 0x2
        :pswitch_56
    .end packed-switch
.end method

.method public final f(Landroid/content/Context;)Ljjm;
    .registers 5

    new-instance v0, Lg0l;

    iget-object v1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Intent;

    iget-object v2, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v2, Ljcj;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, p0}, Lg0l;-><init>(Landroid/content/Intent;Ljcj;Ljava/util/ArrayList;)V

    const/4 p0, 0x0

    invoke-static {v0, p0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    return-object v2
.end method

.method public final g(Lcm;)V
    .registers 3

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lrhf;

    sget-object v0, Lv50;->k:Lv50;

    invoke-virtual {p0, p1, v0}, Lrn;->h(Lcm;Lv50;)V

    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lp8f;->a:B

    packed-switch v0, :pswitch_data_5e

    new-instance v2, Ltmj;

    const/16 v0, 0x9

    invoke-direct {v2, v0}, Ltmj;-><init>(B)V

    new-instance v3, Lcpj;

    const/4 v0, 0x7

    invoke-direct {v3, v0}, Lcpj;-><init>(B)V

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lwjh;

    invoke-virtual {v0}, Lwjh;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ldv6;

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lne5;

    invoke-virtual {v0}, Lne5;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lks3;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Lplk;

    invoke-virtual {p0}, Lplk;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lt9l;

    new-instance v1, Ls5m;

    invoke-direct/range {v1 .. v6}, Ls5m;-><init>(Lt55;Lt55;Ldv6;Lks3;Lt9l;)V

    return-object v1

    :pswitch_39
    invoke-static {}, Ljoh;->k()J

    move-result-wide v0

    sget-wide v2, Lwml;->a:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_46

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    goto :goto_5c

    :cond_46
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Liml;

    invoke-virtual {p0, v0, v1}, Liml;->a(J)I

    move-result v0

    if-ltz v0, :cond_5b

    iget-object p0, p0, Liml;->c:[Ljava/lang/Object;

    aget-object p0, p0, v0

    goto :goto_5c

    :cond_5b
    const/4 p0, 0x0

    :goto_5c
    return-object p0

    nop

    :pswitch_data_5e
    .packed-switch 0x14
        :pswitch_39
    .end packed-switch
.end method

.method public final h()Lpxh;
    .registers 4

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lehc;

    invoke-virtual {p0}, Lehc;->d()I

    move-result v0

    invoke-virtual {p0}, Lehc;->d()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Ltxh;

    const v2, 0x7f120043

    invoke-direct {v1, p0, v2, v0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    return-object v1
.end method

.method public final i()Lkai;
    .registers 5

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lbai;

    const/4 v1, 0x0

    if-eqz v0, :cond_a5

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljava/math/BigInteger;

    if-eqz v0, :cond_9f

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    iget-object v2, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, Lbai;

    iget v3, v2, Lbai;->a:I

    if-ne v0, v3, :cond_91

    invoke-virtual {v2}, Lbai;->a()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_2b

    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_2b
    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lbai;

    invoke-virtual {v0}, Lbai;->a()Z

    move-result v0

    if-nez v0, :cond_41

    iget-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_41

    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_41
    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lbai;

    iget-object v0, v0, Lbai;->c:Laai;

    sget-object v2, Laai;->e:Laai;

    if-ne v0, v2, :cond_4e

    sget-object v0, Ljuf;->a:Lm54;

    goto :goto_7f

    :cond_4e
    sget-object v2, Laai;->d:Laai;

    if-eq v0, v2, :cond_73

    sget-object v2, Laai;->c:Laai;

    if-eq v0, v2, :cond_73

    sget-object v2, Laai;->b:Laai;

    if-ne v0, v2, :cond_67

    iget-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->b(I)Lm54;

    move-result-object v0

    goto :goto_7f

    :cond_67
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lbai;

    iget-object p0, p0, Lbai;->c:Laai;

    const-string v0, "Unknown RsaSsaPkcs1Parameters.Variant: "

    invoke-static {p0, v0}, Lj9h;->u(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    :cond_73
    iget-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->a(I)Lm54;

    move-result-object v0

    :goto_7f
    new-instance v1, Lkai;

    iget-object v2, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, Lbai;

    iget-object v3, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v3, Ljava/math/BigInteger;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-direct {v1, v2, v3, v0, p0}, Lkai;-><init>(Lbai;Ljava/math/BigInteger;Lm54;Ljava/lang/Integer;)V

    return-object v1

    :cond_91
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v1, "Got modulus size "

    const-string v2, ", but parameters requires modulus size "

    invoke-static {v0, v3, v1, v2}, Lsko;->h(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9f
    const-string p0, "Cannot build without modulus"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_a5
    const-string p0, "Cannot build without parameters"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final j()V
    .registers 4

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lzll;

    invoke-virtual {v0}, Lzll;->a()V

    iget-object v1, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v1, Lwll;

    iget-object v1, v1, Lwll;->b:Ljava/util/LinkedHashMap;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzll;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    return-void
.end method

.method public final l()V
    .registers 5

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Lehc;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    :goto_9
    move-object v1, v0

    check-cast v1, Lmea;

    invoke-virtual {v1}, Lmea;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-virtual {v1}, Lmea;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhq8;

    iget-object v2, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v2, Lnr8;

    check-cast v2, Lcom/opera/android/favorites/e;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lhq8;->e()J

    move-result-wide v1

    sget-object v3, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v1, v2}, LJ/N;->Mw8yLl_M(J)V

    goto :goto_9

    :cond_2b
    return-void
.end method

.method public final m()Lree;
    .registers 8

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lcfi;

    iget-object v1, v0, Lcfi;->r:Lnei;

    iget-object v0, v0, Lcfi;->s:Lnei;

    const/high16 v2, -0x40800000    # -1.0f

    if-eqz v1, :cond_55

    invoke-virtual {v1}, Lnei;->j()Z

    move-result v3

    if-nez v3, :cond_55

    iget v3, v1, Lnei;->b:I

    const/16 v4, 0x9

    if-eq v3, v4, :cond_55

    const/4 v5, 0x2

    if-eq v3, v5, :cond_55

    const/4 v6, 0x3

    if-eq v3, v6, :cond_55

    invoke-virtual {v1}, Lnei;->b()F

    move-result v1

    if-eqz v0, :cond_3d

    invoke-virtual {v0}, Lnei;->j()Z

    move-result p0

    if-nez p0, :cond_37

    iget p0, v0, Lnei;->b:I

    if-eq p0, v4, :cond_37

    if-eq p0, v5, :cond_37

    if-eq p0, v6, :cond_37

    invoke-virtual {v0}, Lnei;->b()F

    move-result p0

    goto :goto_4e

    :cond_37
    new-instance p0, Lree;

    invoke-direct {p0, v2, v2, v2, v2}, Lree;-><init>(FFFF)V

    return-object p0

    :cond_3d
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lcfi;

    iget-object p0, p0, Lnfi;->o:Lree;

    if-eqz p0, :cond_4d

    iget v0, p0, Lree;->e:F

    mul-float/2addr v0, v1

    iget p0, p0, Lree;->d:F

    div-float p0, v0, p0

    goto :goto_4e

    :cond_4d
    move p0, v1

    :goto_4e
    new-instance v0, Lree;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v1, p0}, Lree;-><init>(FFFF)V

    return-object v0

    :cond_55
    new-instance p0, Lree;

    invoke-direct {p0, v2, v2, v2, v2}, Lree;-><init>(FFFF)V

    return-object p0
.end method

.method public final o()I
    .registers 5

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p0, -0x1

    return p0

    :cond_12
    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    if-nez v0, :cond_19

    move-object v0, v1

    :cond_19
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwfd;

    iget v0, v0, Lwfd;->a:I

    int-to-long v2, v0

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ljxf;

    if-eqz p0, :cond_2b

    move-object v1, p0

    :cond_2b
    iget p0, v1, Ljxf;->h:I

    int-to-long v0, p0

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x0

    cmp-long p0, v2, v0

    if-gez p0, :cond_36

    move-wide v2, v0

    :cond_36
    long-to-int p0, v2

    return p0
.end method

.method public final onAdLoaded(Ljava/lang/Object;)V
    .registers 10

    move-object v1, p1

    check-cast v1, Ldhb;

    iget-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p1, Lrhf;

    new-instance v0, Lalf;

    iget-object v2, p1, Lk43;->c:Ljava/lang/String;

    iget-object v3, p1, Lk43;->d:Ldl;

    sget v4, Loo8;->s:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Loo8;->s:I

    iget-object v5, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v5, Lbp;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Loo8;

    iget-object v6, p0, Lbqi;->h:Li3j;

    iget-object v7, p0, Lbqi;->i:Lap;

    invoke-direct/range {v0 .. v7}, Lalf;-><init>(Ldhb;Ljava/lang/String;Ldl;ILbp;Li3j;Lap;)V

    invoke-virtual {p1, v0}, Lk43;->d(Laqi;)V

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 6

    .line 52
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    .line 53
    iget-object v1, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v1, Ll94;

    const/4 v2, 0x0

    if-eqz v0, :cond_20

    .line 54
    new-instance v0, Lztk;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const-string v3, " cancelled."

    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 55
    invoke-direct {v0, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    invoke-virtual {v1, v0}, Ll94;->d(Ljava/lang/Throwable;)Z

    move-result p0

    .line 57
    invoke-static {v2, p0}, Ljpo;->n(Ljava/lang/String;Z)V

    return-void

    .line 58
    :cond_20
    invoke-virtual {v1, v2}, Ll94;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 11

    iget-byte v0, p0, Lp8f;->a:B

    packed-switch v0, :pswitch_data_34

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lb94;

    new-instance p1, Lzx9;

    invoke-direct {p1, p2}, Lzx9;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_12
    iget-object p2, p0, Lp8f;->b:Ljava/lang/Object;

    move-object v3, p2

    check-cast v3, Lshf;

    iget-object p2, p0, Lp8f;->c:Ljava/lang/Object;

    move-object v5, p2

    check-cast v5, Lxbf;

    iget-object p0, p0, Lp8f;->d:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ly03;

    iget-object p0, v3, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lnx5;

    new-instance v0, Llqi;

    const/4 v7, 0x0

    const/4 v1, 0x1

    const/4 v6, 0x0

    move-object v4, p1

    invoke-direct/range {v0 .. v7}, Llqi;-><init>(ZLy03;Lshf;Lv84;Lxbf;ZLmt5;)V

    const/4 p1, 0x3

    const/4 p2, 0x0

    invoke-static {p0, p2, p2, v0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :pswitch_data_34
    .packed-switch 0xe
        :pswitch_12
    .end packed-switch
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 15

    iget-byte v0, p0, Lp8f;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_132

    iget-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p1, Lb94;

    :try_start_a
    iget-boolean v0, p2, Lpzh;->q:Z

    if-eqz v0, :cond_98

    const-string v0, "Content-Type"

    invoke-static {p2, v0}, Lpzh;->k(Lpzh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_92

    sget-object v2, Lesd;->e:Lkotlin/text/Regex;
    :try_end_18
    .catchall {:try_start_a .. :try_end_18} :catchall_a8

    :try_start_18
    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v1
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_18 .. :try_end_1c} :catch_1c
    .catchall {:try_start_18 .. :try_end_1c} :catchall_a8

    :catch_1c
    if-eqz v1, :cond_92

    :try_start_1e
    iget-object v0, v1, Lesd;->b:Ljava/lang/String;

    const-string v2, "application"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_92

    iget-object v0, v1, Lesd;->c:Ljava/lang/String;

    const-string v1, "json"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_a8

    if-eqz v0, :cond_92

    :try_start_32
    iget-object v0, p2, Lpzh;->g:Lvzh;

    invoke-virtual {v0}, Lvzh;->string()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "free_trial"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "available"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "trial_days"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_6c

    new-instance v2, Lcy9;

    iget-object v3, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v2, v0, v3, p0, v1}, Lcy9;-><init>(ZLjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p1, v2}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_a4

    :cond_6c
    const-string p0, "Failed requirement."

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_74
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "free_trial is null"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_7c
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_7c} :catch_87
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_7c} :catch_7c
    .catchall {:try_start_32 .. :try_end_7c} :catchall_a8

    :catch_7c
    move-exception v0

    move-object p0, v0

    :try_start_7e
    new-instance v0, Lzx9;

    invoke-direct {v0, p0}, Lzx9;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {p1, v0}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_a4

    :catch_87
    move-exception v0

    move-object p0, v0

    new-instance v0, Lzx9;

    invoke-direct {v0, p0}, Lzx9;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {p1, v0}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_a4

    :cond_92
    sget-object p0, Lby9;->a:Lby9;

    invoke-virtual {p1, p0}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_a4

    :cond_98
    new-instance p0, Lay9;

    iget v0, p2, Lpzh;->d:I

    iget-object v1, p2, Lpzh;->c:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lay9;-><init>(ILjava/lang/String;)V

    invoke-virtual {p1, p0}, Lb94;->run(Ljava/lang/Object;)V
    :try_end_a4
    .catchall {:try_start_7e .. :try_end_a4} :catchall_a8

    :goto_a4
    invoke-virtual {p2}, Lpzh;->close()V

    return-void

    :catchall_a8
    move-exception v0

    move-object p0, v0

    invoke-virtual {p2}, Lpzh;->close()V

    throw p0

    :pswitch_ae
    iget-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ly03;

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lxbf;

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lshf;

    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Lnx5;

    iget-boolean v2, p2, Lpzh;->q:Z

    const/4 v11, 0x3

    if-eqz v2, :cond_ff

    :try_start_c5
    iget-object v2, p2, Lpzh;->g:Lvzh;
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_c5 .. :try_end_c7} :catch_eb

    move-object v6, v7

    :try_start_c8
    invoke-virtual {v2}, Lvzh;->string()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2}, Lpzh;->h()Le74;

    move-result-object v8

    const-string v3, "ETag"

    invoke-static {p2, v3}, Lpzh;->k(Lpzh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v5, La11;

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, La11;-><init>(Lxbf;Ljava/lang/String;Le74;Ljava/lang/String;Lmt5;)V

    invoke-static {v0, v1, v1, v5, v11}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;
    :try_end_df
    .catchall {:try_start_c8 .. :try_end_df} :catchall_e3

    :try_start_df
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_ec

    goto :goto_130

    :catchall_e3
    move-exception v0

    move-object p2, v0

    :try_start_e5
    throw p2
    :try_end_e6
    .catchall {:try_start_e5 .. :try_end_e6} :catchall_e6

    :catchall_e6
    move-exception v0

    :try_start_e7
    invoke-static {v2, p2}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_eb
    .catch Ljava/io/IOException; {:try_start_e7 .. :try_end_eb} :catch_ec

    :catch_eb
    move-object v6, v7

    :catch_ec
    iget-object p2, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p2, Lnx5;

    new-instance v2, Llqi;

    const/4 v9, 0x0

    const/4 v3, 0x1

    const/4 v8, 0x0

    move-object v5, p0

    move-object v7, v6

    move-object v6, p1

    invoke-direct/range {v2 .. v9}, Llqi;-><init>(ZLy03;Lshf;Lv84;Lxbf;ZLmt5;)V

    invoke-static {p2, v1, v1, v2, v11}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_130

    :cond_ff
    move-object v5, p0

    move-object v6, p1

    invoke-virtual {p2}, Lpzh;->close()V

    iget p0, p2, Lpzh;->d:I

    const/16 p1, 0x19c

    if-ne p0, p1, :cond_119

    invoke-virtual {p2}, Lpzh;->h()Le74;

    move-result-object p0

    new-instance p1, Lfb9;

    const/16 p2, 0x1d

    invoke-direct {p1, v7, p0, v1, p2}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v1, v1, p1, v11}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_130

    :cond_119
    const/16 p1, 0x190

    if-ne p0, p1, :cond_120

    const/4 p0, 0x1

    :goto_11e
    move v8, p0

    goto :goto_122

    :cond_120
    const/4 p0, 0x0

    goto :goto_11e

    :goto_122
    iget-object p0, v5, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lnx5;

    new-instance v2, Llqi;

    const/4 v9, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v2 .. v9}, Llqi;-><init>(ZLy03;Lshf;Lv84;Lxbf;ZLmt5;)V

    invoke-static {p0, v1, v1, v2, v11}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :goto_130
    return-void

    nop

    :pswitch_data_132
    .packed-switch 0xe
        :pswitch_ae
    .end packed-switch
.end method

.method public final onSuccess()V
    .registers 2

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/CircleImageView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    .line 15
    check-cast p1, Landroid/view/Surface;

    .line 16
    iget-object p1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/common/util/concurrent/ListenableFuture;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ll94;

    invoke-static {p1, p0}, Lk1g;->Y(Lcom/google/common/util/concurrent/ListenableFuture;Ll94;)V

    return-void
.end method

.method public final p()Z
    .registers 1

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ljxf;

    if-nez p0, :cond_7

    const/4 p0, 0x0

    :cond_7
    iget-object p0, p0, Ljxf;->a:Ljava/util/List;

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final q()I
    .registers 7

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p0, -0x1

    return p0

    :cond_12
    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    if-nez v0, :cond_19

    move-object v0, v1

    :cond_19
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwfd;

    iget v0, v0, Lwfd;->a:I

    int-to-long v2, v0

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    if-eqz v0, :cond_2b

    move-object v1, v0

    :cond_2b
    iget v0, v1, Ljxf;->h:I

    int-to-long v0, v0

    add-long/2addr v2, v0

    invoke-virtual {p0}, Lp8f;->u()I

    move-result p0

    int-to-long v0, p0

    const-wide/16 v4, 0x1

    sub-long/2addr v0, v4

    cmp-long p0, v2, v0

    if-lez p0, :cond_3c

    move-wide v2, v0

    :cond_3c
    long-to-int p0, v2

    return p0
.end method

.method public final r()I
    .registers 4

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    if-nez v0, :cond_19

    move-object v0, v1

    :cond_19
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwfd;

    iget v0, v0, Lwfd;->j:I

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ljxf;

    if-eqz p0, :cond_2b

    move-object v2, p0

    goto :goto_2c

    :cond_2b
    move-object v2, v1

    :goto_2c
    iget v2, v2, Ljxf;->b:I

    add-int/2addr v0, v2

    if-eqz p0, :cond_33

    move-object v2, p0

    goto :goto_34

    :cond_33
    move-object v2, v1

    :goto_34
    iget v2, v2, Ljxf;->c:I

    add-int/2addr v0, v2

    if-eqz p0, :cond_3a

    move-object v1, p0

    :cond_3a
    iget p0, v1, Ljxf;->g:I

    sub-int/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    return p0
.end method

.method public final s()I
    .registers 4

    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_12

    return v2

    :cond_12
    iget-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ljxf;

    if-nez v0, :cond_19

    move-object v0, v1

    :cond_19
    iget-object v0, v0, Ljxf;->a:Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwfd;

    iget v0, v0, Lwfd;->j:I

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ljxf;

    if-eqz p0, :cond_2a

    move-object v1, p0

    :cond_2a
    iget p0, v1, Ljxf;->f:I

    neg-int p0, p0

    add-int/2addr v0, p0

    if-gtz v0, :cond_31

    move v2, v0

    :cond_31
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result p0

    return p0
.end method

.method public final t()Lmvg;
    .registers 4

    :try_start_0
    new-instance v0, Lorb;

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "session"

    const-string v2, ""

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lmvg;->a(Lorb;)Lmvg;

    move-result-object p0
    :try_end_1b
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_1b} :catch_1c

    return-object p0

    :catch_1c
    const/4 p0, 0x0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    iget-byte v0, p0, Lp8f;->a:B

    packed-switch v0, :pswitch_data_36

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, [I

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_16
    array-length v2, p0

    if-ge v1, v2, :cond_2b

    aget v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_28

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    :cond_2b
    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_36
    .packed-switch 0x6
        :pswitch_a
    .end packed-switch
.end method

.method public final u()I
    .registers 1

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Ld8e;

    invoke-virtual {p0}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final v()Z
    .registers 2

    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "session"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final x(I[B)V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, [I

    iget-object v0, v0, Lp8f;->c:Ljava/lang/Object;

    check-cast v0, Ld4d;

    iget-byte v0, v0, Ld4d;->e:B

    const/16 v2, 0x8

    new-array v2, v2, [B

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x1

    const/4 v6, 0x2

    if-ne v0, v6, :cond_97

    move v7, v3

    :goto_17
    const/16 v8, 0x20

    if-ge v7, v8, :cond_b9

    shl-int/lit8 v8, v7, 0x3

    aget v9, v1, v8

    sub-int v9, v0, v9

    int-to-byte v9, v9

    aput-byte v9, v2, v3

    add-int/lit8 v10, v8, 0x1

    aget v10, v1, v10

    sub-int v10, v0, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v5

    add-int/lit8 v11, v8, 0x2

    aget v11, v1, v11

    sub-int v11, v0, v11

    int-to-byte v11, v11

    aput-byte v11, v2, v6

    add-int/lit8 v12, v8, 0x3

    aget v12, v1, v12

    sub-int v12, v0, v12

    int-to-byte v12, v12

    const/4 v13, 0x3

    aput-byte v12, v2, v13

    add-int/lit8 v12, v8, 0x4

    aget v12, v1, v12

    sub-int v12, v0, v12

    int-to-byte v12, v12

    aput-byte v12, v2, v4

    add-int/lit8 v12, v8, 0x5

    aget v12, v1, v12

    sub-int v12, v0, v12

    int-to-byte v12, v12

    const/4 v14, 0x5

    aput-byte v12, v2, v14

    add-int/lit8 v12, v8, 0x6

    aget v12, v1, v12

    sub-int v12, v0, v12

    int-to-byte v12, v12

    const/4 v15, 0x6

    aput-byte v12, v2, v15

    const/4 v12, 0x7

    add-int/2addr v8, v12

    aget v8, v1, v8

    sub-int v8, v0, v8

    int-to-byte v8, v8

    aput-byte v8, v2, v12

    mul-int/lit8 v8, v7, 0x3

    add-int v8, v8, p1

    shl-int/2addr v10, v13

    or-int/2addr v9, v10

    shl-int/2addr v11, v15

    or-int/2addr v9, v11

    int-to-byte v9, v9

    aput-byte v9, p2, v8

    add-int/lit8 v9, v8, 0x1

    aget-byte v10, v2, v6

    shr-int/2addr v10, v6

    aget-byte v11, v2, v13

    shl-int/2addr v11, v5

    or-int/2addr v10, v11

    aget-byte v11, v2, v4

    shl-int/2addr v11, v4

    or-int/2addr v10, v11

    aget-byte v11, v2, v14

    shl-int/2addr v11, v12

    or-int/2addr v10, v11

    int-to-byte v10, v10

    aput-byte v10, p2, v9

    add-int/2addr v8, v6

    aget-byte v9, v2, v14

    shr-int/2addr v9, v5

    aget-byte v10, v2, v15

    shl-int/2addr v10, v6

    or-int/2addr v9, v10

    aget-byte v10, v2, v12

    shl-int/2addr v10, v14

    or-int/2addr v9, v10

    int-to-byte v9, v9

    aput-byte v9, p2, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_17

    :cond_97
    if-ne v0, v4, :cond_ba

    move v6, v3

    :goto_9a
    const/16 v7, 0x80

    if-ge v6, v7, :cond_b9

    shl-int/lit8 v7, v6, 0x1

    aget v8, v1, v7

    sub-int v8, v0, v8

    int-to-byte v8, v8

    aput-byte v8, v2, v3

    add-int/2addr v7, v5

    aget v7, v1, v7

    sub-int v7, v0, v7

    int-to-byte v7, v7

    aput-byte v7, v2, v5

    add-int v9, p1, v6

    shl-int/2addr v7, v4

    or-int/2addr v8, v7

    int-to-byte v7, v8

    aput-byte v7, p2, v9

    add-int/lit8 v6, v6, 0x1

    goto :goto_9a

    :cond_b9
    return-void

    :cond_ba
    const-string v0, "Eta needs to be 2 or 4!"

    invoke-static {v0}, Lh9o;->r(Ljava/lang/String;)V

    return-void
.end method

.method public final y(I[B)V
    .registers 15

    iget-object v0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, [I

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Ld4d;

    iget-byte p0, p0, Ld4d;->e:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne p0, v2, :cond_9c

    :goto_e
    const/16 v3, 0x20

    if-ge v1, v3, :cond_c3

    mul-int/lit8 v3, v1, 0x3

    add-int/2addr v3, p1

    shl-int/lit8 v4, v1, 0x3

    aget-byte v5, p2, v3

    and-int/lit8 v6, v5, 0x7

    aput v6, v0, v4

    add-int/lit8 v6, v4, 0x1

    and-int/lit16 v5, v5, 0xff

    shr-int/lit8 v7, v5, 0x3

    and-int/lit8 v7, v7, 0x7

    aput v7, v0, v6

    add-int/lit8 v7, v4, 0x2

    shr-int/lit8 v5, v5, 0x6

    add-int/lit8 v8, v3, 0x1

    aget-byte v8, p2, v8

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v9, v8, 0x2

    and-int/lit8 v9, v9, 0x7

    or-int/2addr v5, v9

    aput v5, v0, v7

    add-int/lit8 v5, v4, 0x3

    shr-int/lit8 v9, v8, 0x1

    and-int/lit8 v9, v9, 0x7

    aput v9, v0, v5

    add-int/lit8 v9, v4, 0x4

    shr-int/lit8 v10, v8, 0x4

    and-int/lit8 v10, v10, 0x7

    aput v10, v0, v9

    add-int/lit8 v10, v4, 0x5

    shr-int/lit8 v8, v8, 0x7

    add-int/2addr v3, v2

    aget-byte v3, p2, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v11, v3, 0x1

    and-int/lit8 v11, v11, 0x7

    or-int/2addr v8, v11

    aput v8, v0, v10

    add-int/lit8 v8, v4, 0x6

    shr-int/lit8 v11, v3, 0x2

    and-int/lit8 v11, v11, 0x7

    aput v11, v0, v8

    add-int/lit8 v11, v4, 0x7

    shr-int/lit8 v3, v3, 0x5

    and-int/lit8 v3, v3, 0x7

    aput v3, v0, v11

    aget v3, v0, v4

    sub-int v3, p0, v3

    aput v3, v0, v4

    aget v3, v0, v6

    sub-int v3, p0, v3

    aput v3, v0, v6

    aget v3, v0, v7

    sub-int v3, p0, v3

    aput v3, v0, v7

    aget v3, v0, v5

    sub-int v3, p0, v3

    aput v3, v0, v5

    aget v3, v0, v9

    sub-int v3, p0, v3

    aput v3, v0, v9

    aget v3, v0, v10

    sub-int v3, p0, v3

    aput v3, v0, v10

    aget v3, v0, v8

    sub-int v3, p0, v3

    aput v3, v0, v8

    aget v3, v0, v11

    sub-int v3, p0, v3

    aput v3, v0, v11

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_e

    :cond_9c
    const/4 v2, 0x4

    if-ne p0, v2, :cond_c3

    :goto_9f
    const/16 v3, 0x80

    if-ge v1, v3, :cond_c3

    shl-int/lit8 v3, v1, 0x1

    add-int v4, p1, v1

    aget-byte v4, p2, v4

    and-int/lit8 v5, v4, 0xf

    aput v5, v0, v3

    add-int/lit8 v5, v3, 0x1

    and-int/lit16 v4, v4, 0xff

    shr-int/2addr v4, v2

    aput v4, v0, v5

    aget v4, v0, v3

    sub-int v4, p0, v4

    aput v4, v0, v3

    aget v3, v0, v5

    sub-int v3, p0, v3

    aput v3, v0, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_9f

    :cond_c3
    return-void
.end method

.method public final z(Locc;)V
    .registers 4

    iget-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Lcda;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lcda;->run()V

    :cond_9
    new-instance v0, Lcda;

    iget-object v1, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lqdc;

    invoke-direct {v0, v1, p1}, Lcda;-><init>(Lqdc;Locc;)V

    iput-object v0, p0, Lp8f;->d:Ljava/lang/Object;

    iget-object p0, p0, Lp8f;->c:Ljava/lang/Object;

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    return-void
.end method
