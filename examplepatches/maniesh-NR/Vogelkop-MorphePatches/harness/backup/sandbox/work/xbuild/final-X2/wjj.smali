.class public final Lwjj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lre;
.implements Lr6l;
.implements Ljqo;
.implements Lhtp;


# static fields
.field public static e:Lwjj;


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 291
    new-instance v0, Ljava/util/PriorityQueue;

    new-instance v1, Lomj;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Lomj;-><init>(B)V

    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    .line 292
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    .line 293
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_30

    .line 294
    new-instance v0, Lqsh;

    new-instance v1, Lgrl;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lgrl;-><init>(Lwjj;B)V

    invoke-direct {v0, v1}, Lqsh;-><init>(Lgrl;)V

    iput-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    return-void

    .line 295
    :cond_30
    new-instance v0, Lmhj;

    new-instance v1, Lgrl;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lgrl;-><init>(Lwjj;B)V

    invoke-direct {v0, v1}, Lmhj;-><init>(Lgrl;)V

    iput-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V
    .registers 3

    .line 305
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 306
    iput-object p1, p0, Lwjj;->b:Ljava/lang/Object;

    .line 307
    iput-object p2, p0, Lwjj;->a:Ljava/lang/Object;

    .line 308
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    .line 309
    new-instance p1, Lhkj;

    const/4 p2, 0x0

    .line 310
    invoke-direct {p1, p2}, Lhkj;-><init>(I)V

    .line 311
    iput-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Li53;Ljava/util/LinkedHashSet;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    iput-object p2, p0, Lwjj;->b:Ljava/lang/Object;

    const/4 v0, 0x3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f1401c4

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object p1, p2

    check-cast p1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/c;->i()Ljava/util/List;

    move-result-object p1

    invoke-static {v5, p1}, Lwjj;->d(Ljava/lang/String;Ljava/util/List;)Lml3;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_54

    new-instance v2, Lkkj;

    const/4 v7, 0x0

    const/4 v6, 0x0

    const-wide/16 v3, -0x1

    invoke-direct/range {v2 .. v7}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    move-object p1, p2

    check-cast p1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, p1}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    move-result-object p1

    check-cast p1, Lml3;

    goto :goto_9a

    :cond_54
    const/4 p2, 0x1

    :goto_55
    const/16 v0, 0x3e9

    if-ge p2, v0, :cond_99

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, p1}, Lwjj;->d(Ljava/lang/String;Ljava/util/List;)Lml3;

    move-result-object v0

    if-nez v0, :cond_96

    iget-object p1, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p1, Li53;

    new-instance v6, Lkkj;

    const/4 v11, 0x0

    const/4 v10, 0x0

    const-wide/16 v7, -0x1

    invoke-direct/range {v6 .. v11}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    move-object p2, p1

    check-cast p2, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6, p2}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    move-result-object p1

    check-cast p1, Lml3;

    goto :goto_9a

    :cond_96
    add-int/lit8 p2, p2, 0x1

    goto :goto_55

    :cond_99
    move-object p1, v1

    :goto_9a
    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object p1

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sget-object p3, Lx6l;->a:Lx6l;

    invoke-static {p2, p3}, Lexg;->A(Ljava/util/ArrayList;Lnxg;)V

    iget-object p3, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast p3, Lml3;

    if-eqz p3, :cond_e8

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :cond_b5
    :goto_b5
    if-ge v2, v0, :cond_e8

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lb2l;

    check-cast v3, Ld7l;

    invoke-virtual {v3}, Ld7l;->n0()Z

    move-result v4

    if-nez v4, :cond_b5

    iget-object v4, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v4, Li53;

    invoke-virtual {v3}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v6, -0x1

    invoke-static {v6, v7, v5, v3}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v3

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, p3}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    move-result-object v3

    check-cast v3, Lpl3;

    if-eqz v3, :cond_b5

    invoke-virtual {p1, v3}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_b5

    :cond_e8
    invoke-static {p1}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p1

    iput-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    iget-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast p1, Lml3;

    if-eqz p1, :cond_10a

    invoke-interface {p1}, Lml3;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_10a

    iget-object p2, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p2, Li53;

    check-cast p2, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Lcom/opera/android/bookmarks/b;

    invoke-virtual {p2, p1}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V

    iput-object v1, p0, Lwjj;->c:Ljava/lang/Object;

    :cond_10a
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lqq8;)V
    .registers 4

    .line 269
    new-instance v0, Lu7k;

    .line 270
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 271
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwjj;->a:Ljava/lang/Object;

    iput-object p1, p0, Lwjj;->b:Ljava/lang/Object;

    iput-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/core/widget/NestedScrollView;)V
    .registers 5

    .line 298
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 299
    new-instance v0, Ln9n;

    invoke-direct {v0, p0}, Ln9n;-><init>(Lwjj;)V

    iput-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    .line 300
    new-instance v0, Lho3;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lho3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    .line 301
    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    .line 302
    new-instance v0, Lcan;

    invoke-direct {v0}, Lcan;-><init>()V

    iput-object v0, p0, Lwjj;->d:Ljava/lang/Object;

    .line 303
    new-instance v1, Lz61;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v1}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    const/4 p0, 0x1

    .line 304
    invoke-virtual {v0, p0}, Lcan;->b(Z)V

    return-void
.end method

.method public constructor <init>(Lgrg;Lj1k;)V
    .registers 3

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 273
    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    .line 274
    iput-object p2, p0, Lwjj;->b:Ljava/lang/Object;

    .line 275
    sget-object p1, La43;->z:La43;

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    .line 276
    new-instance p1, Lqm;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p2}, Lqm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 268
    iput-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    iput-object p2, p0, Lwjj;->a:Ljava/lang/Object;

    iput-object p3, p0, Lwjj;->b:Ljava/lang/Object;

    iput-object p4, p0, Lwjj;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 2

    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    .line 313
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lwjj;->b:Ljava/lang/Object;

    .line 314
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    .line 315
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk8n;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p1, :cond_2e

    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    .line 277
    iget v1, p1, Lk8n;->a:I

    .line 278
    new-instance v2, Lbp;

    .line 279
    iget-object p1, p1, Lk8n;->d:Ljava/lang/Object;

    check-cast p1, Lq0;

    .line 280
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_28

    invoke-static {p1}, Ly87;->a(Lq0;)Lt87;

    move-result-object p1

    iput-object p1, v2, Lbp;->b:Ljava/lang/Object;

    iput v1, v2, Lbp;->a:I

    .line 281
    iput-object v2, p0, Lwjj;->b:Ljava/lang/Object;

    new-array p1, v1, [B

    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    new-array p1, v1, [B

    iput-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    return-void

    .line 282
    :cond_28
    const-string p0, "digest == null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0

    .line 283
    :cond_2e
    const-string p0, "params == null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lnx5;Lwg5;Lah5;Lr3;)V
    .registers 7

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 285
    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    .line 286
    iput-object p4, p0, Lwjj;->b:Ljava/lang/Object;

    const/4 p4, 0x0

    const/4 v0, 0x6

    const v1, 0x7fffffff

    .line 287
    invoke-static {v1, p4, p4, v0}, Lxf8;->h(ILh04;Lkotlin/jvm/functions/Function1;I)Lp04;

    move-result-object p4

    iput-object p4, p0, Lwjj;->c:Ljava/lang/Object;

    .line 288
    new-instance p4, Leme;

    const/16 v0, 0xc

    invoke-direct {p4, v0}, Leme;-><init>(B)V

    iput-object p4, p0, Lwjj;->d:Ljava/lang/Object;

    .line 289
    invoke-interface {p1}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object p1

    sget-object p4, Lulp;->h:Lulp;

    invoke-interface {p1, p4}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object p1

    check-cast p1, Lunb;

    if-eqz p1, :cond_32

    new-instance p4, Ltmi;

    const/4 v0, 0x2

    invoke-direct {p4, p2, p0, p3, v0}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, p4}, Lunb;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    :cond_32
    return-void
.end method

.method public constructor <init>(Loji;)V
    .registers 2

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 297
    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lu9o;)V
    .registers 3

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    iput-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    iput-object v0, p0, Lwjj;->d:Ljava/lang/Object;

    iput-object p1, p0, Lwjj;->a:Ljava/lang/Object;

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/util/List;)Lml3;
    .registers 6

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_25

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lal3;

    invoke-interface {v2}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Lol3;->g()Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_26

    :cond_25
    move-object v0, v1

    :goto_26
    instance-of p0, v0, Lml3;

    if-eqz p0, :cond_2d

    check-cast v0, Lml3;

    return-object v0

    :cond_2d
    return-object v1
.end method


# virtual methods
.method public final a()V
    .registers 3

    .line 24
    iget-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Lg94;

    iget-object v1, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Luuj;

    .line 25
    iget-object v1, v1, Luuj;->b:Ljava/lang/Object;

    check-cast v1, Lahb;

    .line 26
    invoke-interface {v0, v1}, Lg94;->l(Ljava/lang/Object;)V

    iget-object p0, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final a(I)V
    .registers 4

    iget-object p0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v1, "Skip %1$ds"

    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final b(Ljava/util/zip/ZipFile;Ljava/util/HashSet;)V
    .registers 5

    iget-object p1, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p1, Lutp;

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Leqp;

    new-instance v1, Ltvk;

    invoke-direct {v1, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0, p2, v1}, Lutp;->c(Leqp;Ljava/util/HashSet;Ljtp;)V

    return-void
.end method

.method public final c([BILe6f;)[B
    .registers 12

    iget-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Lbp;

    iget-object v1, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v1, Lk8n;

    iget v1, v1, Lk8n;->a:I

    array-length v2, p1

    const/4 v3, 0x0

    if-ne v2, v1, :cond_a5

    invoke-virtual {p3}, Le6f;->a()[B

    const/16 v2, 0xf

    if-gt p2, v2, :cond_9f

    if-nez p2, :cond_18

    return-object p1

    :cond_18
    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, p1, v2, p3}, Lwjj;->c([BILe6f;)[B

    move-result-object p1

    new-instance v2, Lgzb;

    const/4 v4, 0x1

    invoke-direct {v2, v4}, Lgzb;-><init>(B)V

    iget v5, p3, Lq9o;->a:I

    iput v5, v2, Lq9o;->a:I

    iget-wide v5, p3, Lq9o;->b:J

    iput-wide v5, v2, Lq9o;->b:J

    iget v5, p3, Le6f;->e:I

    iput v5, v2, Lgzb;->e:I

    iget p3, p3, Le6f;->f:I

    iput p3, v2, Lgzb;->f:I

    sub-int/2addr p2, v4

    iput p2, v2, Lgzb;->g:I

    const/4 p2, 0x0

    iput-byte p2, v2, Lq9o;->d:B

    new-instance p3, Le6f;

    invoke-direct {p3, v2}, Le6f;-><init>(Lgzb;)V

    iget-object v2, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, [B

    invoke-virtual {p3}, Le6f;->a()[B

    move-result-object v5

    invoke-virtual {v0, v2, v5}, Lbp;->a([B[B)[B

    move-result-object v2

    new-instance v5, Lgzb;

    invoke-direct {v5, v4}, Lgzb;-><init>(B)V

    iget v6, p3, Lq9o;->a:I

    iput v6, v5, Lq9o;->a:I

    iget-wide v6, p3, Lq9o;->b:J

    iput-wide v6, v5, Lq9o;->b:J

    iget v6, p3, Le6f;->e:I

    iput v6, v5, Lgzb;->e:I

    iget v6, p3, Le6f;->f:I

    iput v6, v5, Lgzb;->f:I

    iget p3, p3, Le6f;->g:I

    iput p3, v5, Lgzb;->g:I

    iput-byte v4, v5, Lq9o;->d:B

    new-instance p3, Le6f;

    invoke-direct {p3, v5}, Le6f;-><init>(Lgzb;)V

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast p0, [B

    invoke-virtual {p3}, Le6f;->a()[B

    move-result-object p3

    invoke-virtual {v0, p0, p3}, Lbp;->a([B[B)[B

    move-result-object p0

    new-array p3, v1, [B

    move v4, p2

    :goto_7a
    if-ge v4, v1, :cond_87

    aget-byte v5, p1, v4

    aget-byte v6, p0, v4

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, p3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_7a

    :cond_87
    array-length p0, v2

    iget p1, v0, Lbp;->a:I

    if-ne p0, p1, :cond_99

    if-ne v1, p1, :cond_93

    invoke-virtual {v0, p2, v2, p3}, Lbp;->f(I[B[B)[B

    move-result-object p0

    return-object p0

    :cond_93
    const-string p0, "wrong in length"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3

    :cond_99
    const-string p0, "wrong key length"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3

    :cond_9f
    const-string p0, "max chain length must not be greater than w"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3

    :cond_a5
    const-string p0, "startHash needs to be "

    const-string p1, "bytes"

    invoke-static {v1, p0, p1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3
.end method

.method public final e(Lse;)Lisk;
    .registers 7

    iget-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_1b

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lisk;

    if-eqz v3, :cond_18

    iget-object v4, v3, Lisk;->b:Lse;

    if-ne v4, p1, :cond_18

    return-object v3

    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_1b
    new-instance v1, Lisk;

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v1, p0, p1}, Lisk;-><init>(Landroid/content/Context;Lse;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v1
.end method

.method public final f(Le6f;)Lbxk;
    .registers 10

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Lk8n;

    iget v1, v0, Lk8n;->c:I

    new-array v1, v1, [[B

    const/4 v2, 0x0

    :goto_9
    iget v3, v0, Lk8n;->c:I

    if-ge v2, v3, :cond_57

    new-instance v4, Lgzb;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Lgzb;-><init>(B)V

    iget v5, p1, Lq9o;->a:I

    iput v5, v4, Lq9o;->a:I

    iget-wide v5, p1, Lq9o;->b:J

    iput-wide v5, v4, Lq9o;->b:J

    iget v5, p1, Le6f;->e:I

    iput v5, v4, Lgzb;->e:I

    iput v2, v4, Lgzb;->f:I

    iget v5, p1, Le6f;->g:I

    iput v5, v4, Lgzb;->g:I

    iget-byte p1, p1, Lq9o;->d:B

    iput-byte p1, v4, Lq9o;->d:B

    new-instance p1, Le6f;

    invoke-direct {p1, v4}, Le6f;-><init>(Lgzb;)V

    if-ltz v2, :cond_50

    if-ge v2, v3, :cond_50

    iget-object v3, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v3, Lbp;

    iget-object v4, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v4, [B

    int-to-long v5, v2

    const/16 v7, 0x20

    invoke-static {v7, v5, v6}, Ldbh;->I(IJ)[B

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lbp;->a([B[B)[B

    move-result-object v3

    const/16 v4, 0xf

    invoke-virtual {p0, v3, v4, p1}, Lwjj;->c([BILe6f;)[B

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_50
    const-string p0, "index out of bounds"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_57
    new-instance p0, Lbxk;

    invoke-direct {p0, v0, v1}, Lbxk;-><init>(Lk8n;[[B)V

    return-object p0
.end method

.method public final g(JLif1;Lif1;)Lif1;
    .registers 16

    iget-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v0, Lif1;

    if-nez v0, :cond_c

    invoke-virtual {p3}, Lif1;->c()Lif1;

    move-result-object v0

    iput-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    :cond_c
    invoke-virtual {v0}, Lif1;->b()I

    move-result v0

    const/4 v1, 0x0

    :goto_11
    iget-object v2, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v2, Lif1;

    const/4 v3, 0x0

    if-ge v1, v0, :cond_5c

    if-nez v2, :cond_1b

    move-object v2, v3

    :cond_1b
    iget-object v3, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v3, Loji;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4, v1}, Lif1;->a(I)F

    move-result v4

    const-wide/32 v5, 0xf4240

    div-long v5, p1, v5

    iget-object v3, v3, Loji;->a:Ljava/lang/Object;

    check-cast v3, Lf82;

    invoke-virtual {v3, v4}, Lf82;->a(F)Li89;

    move-result-object v3

    iget-wide v7, v3, Li89;->c:J

    const-wide/16 v9, 0x0

    cmp-long v4, v7, v9

    if-lez v4, :cond_3f

    long-to-float v4, v5

    long-to-float v5, v7

    div-float/2addr v4, v5

    goto :goto_41

    :cond_3f
    const/high16 v4, 0x3f800000    # 1.0f

    :goto_41
    invoke-static {v4}, Lg61;->a(F)Lf61;

    move-result-object v4

    iget v4, v4, Lf61;->b:F

    iget v5, v3, Li89;->a:F

    invoke-static {v5}, Ljava/lang/Math;->signum(F)F

    move-result v5

    mul-float/2addr v5, v4

    iget v3, v3, Li89;->b:F

    mul-float/2addr v5, v3

    long-to-float v3, v7

    div-float/2addr v5, v3

    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float/2addr v5, v3

    invoke-virtual {v2, v5, v1}, Lif1;->e(FI)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_5c
    if-nez v2, :cond_5f

    return-object v3

    :cond_5f
    return-object v2
.end method

.method public final h()Lpxh;
    .registers 4

    iget-object p0, p0, Lwjj;->d:Ljava/lang/Object;

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

    const v2, 0x7f120041

    invoke-direct {v1, p0, v2, v0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    return-object v1
.end method

.method public final i([BLe6f;)[B
    .registers 6

    new-instance v0, Lgzb;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lgzb;-><init>(B)V

    iget v1, p2, Lq9o;->a:I

    iput v1, v0, Lq9o;->a:I

    iget-wide v1, p2, Lq9o;->b:J

    iput-wide v1, v0, Lq9o;->b:J

    iget p2, p2, Le6f;->e:I

    iput p2, v0, Lgzb;->e:I

    new-instance p2, Le6f;

    invoke-direct {p2, v0}, Le6f;-><init>(Lgzb;)V

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Lbp;

    invoke-virtual {p2}, Le6f;->a()[B

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lbp;->a([B[B)[B

    move-result-object p0

    return-object p0
.end method

.method public final j([B[B)V
    .registers 5

    array-length v0, p1

    iget-object v1, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v1, Lk8n;

    iget v1, v1, Lk8n;->a:I

    if-ne v0, v1, :cond_1f

    if-eqz p2, :cond_19

    array-length v0, p2

    if-ne v0, v1, :cond_13

    iput-object p1, p0, Lwjj;->c:Ljava/lang/Object;

    iput-object p2, p0, Lwjj;->d:Ljava/lang/Object;

    return-void

    :cond_13
    const-string p0, "size of publicSeed needs to be equal to size of digest"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_19
    const-string p0, "publicSeed == null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1f
    const-string p0, "size of secretKeySeed needs to be equal to size of digest"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final k(Lse;Landroid/view/MenuItem;)Z
    .registers 5

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ActionMode$Callback;

    invoke-virtual {p0, p1}, Lwjj;->e(Lse;)Lisk;

    move-result-object p1

    new-instance v1, Lvtd;

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    check-cast p2, Lmsk;

    invoke-direct {v1, p0, p2}, Lvtd;-><init>(Landroid/content/Context;Lmsk;)V

    invoke-interface {v0, p1, v1}, Landroid/view/ActionMode$Callback;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final l()V
    .registers 4

    iget-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Li53;

    iget-object v1, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Lehc;

    invoke-virtual {v0, v1}, Li53;->e(Ljava/util/AbstractList;)V

    iget-object v1, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v1, Lml3;

    if-eqz v1, :cond_24

    invoke-interface {v1}, Lml3;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_24

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Lcom/opera/android/bookmarks/b;

    invoke-virtual {v0, v1}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    :cond_24
    return-void
.end method

.method public final m([Ljava/io/File;)Z
    .registers 13

    iget-object v0, p0, Lwjj;->c:Ljava/lang/Object;

    check-cast v0, Lu7k;

    iget-object v1, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, Landroid/content/pm/PackageInfo;

    const/4 v3, 0x0

    if-nez v2, :cond_21

    :try_start_f
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v4, 0x40

    invoke-virtual {v2, v1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iput-object v2, p0, Lwjj;->d:Ljava/lang/Object;
    :try_end_1f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_f .. :try_end_1f} :catch_20

    goto :goto_21

    :catch_20
    move-object v2, v3

    :cond_21
    :goto_21
    invoke-virtual {v2}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v1

    const-class p0, Landroid/content/res/AssetManager;

    :try_start_27
    invoke-virtual {p0, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v5

    const/4 v6, 0x1

    if-nez v5, :cond_35

    invoke-virtual {v4, v6}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    :cond_35
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_39} :catch_ef

    check-cast p0, Landroid/content/res/AssetManager;

    array-length v3, p1

    :cond_3c
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_ee

    aget-object v4, p1, v3

    const-class v5, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v7, "addAssetPath"

    const-class v8, Ljava/lang/Integer;

    invoke-static {p0, v7, v8, v5, v4}, Lu0h;->u(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/io/Serializable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, "AndroidManifest.xml"

    invoke-virtual {p0, v4, v5}, Landroid/content/res/AssetManager;->openXmlResourceParser(ILjava/lang/String;)Landroid/content/res/XmlResourceParser;

    move-result-object v4

    iput-object v4, v0, Lu7k;->a:Ljava/lang/Object;

    if-eqz v4, :cond_e6

    :goto_60
    iget-object v4, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/res/XmlResourceParser;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_6e

    if-eq v4, v6, :cond_de

    goto :goto_60

    :cond_6e
    iget-object v4, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/res/XmlResourceParser;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "manifest"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_de

    iget-object v4, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/res/XmlResourceParser;

    const-string v5, "versionCode"

    const-string v7, "http://schemas.android.com/apk/res/android"

    invoke-interface {v4, v7, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v5, Landroid/content/res/XmlResourceParser;

    const-string v8, "versionCodeMajor"

    invoke-interface {v5, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v4, :cond_d6

    :try_start_96
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4
    :try_end_9a
    .catch Ljava/lang/NumberFormatException; {:try_start_96 .. :try_end_9a} :catch_c5

    if-nez v5, :cond_9e

    int-to-long v4, v4

    goto :goto_ae

    :cond_9e
    :try_start_9e
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5
    :try_end_a2
    .catch Ljava/lang/NumberFormatException; {:try_start_9e .. :try_end_a2} :catch_b4

    int-to-long v7, v5

    int-to-long v4, v4

    const/16 v9, 0x20

    shl-long/2addr v7, v9

    const-wide v9, 0xffffffffL

    and-long/2addr v4, v9

    or-long/2addr v4, v7

    :goto_ae
    cmp-long v4, v1, v4

    if-eqz v4, :cond_3c

    const/4 p0, 0x0

    return p0

    :catch_b4
    move-exception p0

    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Couldn\'t parse versionCodeMajor to int: "

    invoke-static {v0, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_c5
    move-exception p0

    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Couldn\'t parse versionCode to int: "

    invoke-static {v0, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_d6
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p1, "Manifest entry doesn\'t contain \'versionCode\' attribute."

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_de
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p1, "Couldn\'t find manifest entry at top-level."

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_e6
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p1, "Manifest file needs to be loaded before parsing."

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_ee
    return v6

    :catch_ef
    move-exception p1

    new-instance v0, Le22;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Failed to invoke default constructor on class "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final n([Ljava/io/File;)Z
    .registers 11

    iget-object v0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/pm/PackageInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_1d

    :try_start_b
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x40

    invoke-virtual {v1, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iput-object v1, p0, Lwjj;->d:Ljava/lang/Object;
    :try_end_1b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_b .. :try_end_1b} :catch_1c

    goto :goto_1d

    :catch_1c
    move-object v1, v2

    :cond_1d
    :goto_1d
    const/4 p0, 0x0

    if-eqz v1, :cond_51

    iget-object v0, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v0, :cond_51

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v3, v1

    move v4, p0

    :goto_2d
    if-ge v4, v3, :cond_50

    aget-object v5, v1, v4

    :try_start_31
    const-string v6, "X509"

    invoke-static {v6}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v6

    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v5}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v5

    invoke-direct {v7, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;
    :try_end_46
    .catch Ljava/security/cert/CertificateException; {:try_start_31 .. :try_end_46} :catch_47

    goto :goto_48

    :catch_47
    move-object v5, v2

    :goto_48
    if-eqz v5, :cond_4d

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4d
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    :cond_50
    move-object v2, v0

    :cond_51
    if-eqz v2, :cond_99

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_99

    array-length v0, p1

    :cond_5a
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_98

    aget-object v1, p1, v0

    :try_start_60
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lfac;->K(Ljava/lang/String;)[[Ljava/security/cert/X509Certificate;

    move-result-object v1

    if-eqz v1, :cond_99

    array-length v3, v1

    if-eqz v3, :cond_99

    aget-object v3, v1, p0

    array-length v3, v3

    if-eqz v3, :cond_99

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_99

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, p0

    :cond_7d
    if-ge v4, v3, :cond_5a

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/security/cert/X509Certificate;

    array-length v6, v1

    move v7, p0

    :goto_89
    if-ge v7, v6, :cond_99

    aget-object v8, v1, v7

    aget-object v8, v8, p0

    invoke-virtual {v8, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_93} :catch_99

    if-nez v8, :cond_7d

    add-int/lit8 v7, v7, 0x1

    goto :goto_89

    :cond_98
    const/4 p0, 0x1

    :catch_99
    :cond_99
    return p0
.end method

.method public final p(Lse;)V
    .registers 3

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ActionMode$Callback;

    invoke-virtual {p0, p1}, Lwjj;->e(Lse;)Lisk;

    move-result-object p0

    invoke-interface {v0, p0}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    return-void
.end method

.method public final q(Lse;Litd;)Z
    .registers 6

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ActionMode$Callback;

    invoke-virtual {p0, p1}, Lwjj;->e(Lse;)Lisk;

    move-result-object p1

    iget-object v1, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Lhkj;

    invoke-virtual {v1, p2}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/Menu;

    if-nez v2, :cond_20

    new-instance v2, Lrud;

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v2, p0, p2}, Lrud;-><init>(Landroid/content/Context;Litd;)V

    invoke-virtual {v1, p2, v2}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    invoke-interface {v0, p1, v2}, Landroid/view/ActionMode$Callback;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method

.method public final v(Lse;Litd;)Z
    .registers 6

    iget-object v0, p0, Lwjj;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ActionMode$Callback;

    invoke-virtual {p0, p1}, Lwjj;->e(Lse;)Lisk;

    move-result-object p1

    iget-object v1, p0, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Lhkj;

    invoke-virtual {v1, p2}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/Menu;

    if-nez v2, :cond_20

    new-instance v2, Lrud;

    iget-object p0, p0, Lwjj;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v2, p0, p2}, Lrud;-><init>(Landroid/content/Context;Litd;)V

    invoke-virtual {v1, p2, v2}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    invoke-interface {v0, p1, v2}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method
