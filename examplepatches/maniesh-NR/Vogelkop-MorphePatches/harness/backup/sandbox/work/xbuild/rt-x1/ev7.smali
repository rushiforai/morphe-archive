.class public final Lev7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Z

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;

.field public m:Ljava/lang/Object;

.field public n:Ljava/lang/Object;

.field public o:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfe5;Lumi;Lvs;Liv7;Lwzg;Lpde;Lpde;Ltsd;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lev7;->d:Ljava/lang/Object;

    iput-object p2, p0, Lev7;->e:Ljava/lang/Object;

    iput-object p3, p0, Lev7;->f:Ljava/lang/Object;

    iput-object p4, p0, Lev7;->g:Ljava/lang/Object;

    iput-object p5, p0, Lev7;->h:Ljava/lang/Object;

    iput-object p6, p0, Lev7;->a:Ljava/lang/Object;

    new-instance p1, Ldv7;

    invoke-direct {p1, p0}, Ldv7;-><init>(Lev7;)V

    iput-object p1, p0, Lev7;->i:Ljava/lang/Object;

    new-instance p1, Lqe6;

    const/16 p2, 0x8

    invoke-direct {p1, p0, p2}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lev7;->j:Ljava/lang/Object;

    new-instance p1, Lxh5;

    new-instance p2, Landroid/view/View;

    iget-object p3, p3, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p3, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-direct {p1, p2}, Lxh5;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lev7;->k:Ljava/lang/Object;

    new-instance p1, Lyu7;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lyu7;-><init>(Lev7;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lev7;->l:Ljava/lang/Object;

    new-instance p1, Lyu7;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Lyu7;-><init>(Lev7;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lev7;->m:Ljava/lang/Object;

    new-instance p1, Lyu7;

    const/4 p4, 0x2

    invoke-direct {p1, p0, p4}, Lyu7;-><init>(Lev7;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lev7;->n:Ljava/lang/Object;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object p5, Lhri;->e:Lh58;

    invoke-static {p5, p5}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p5

    :goto_62
    invoke-virtual {p5}, Lw4;->hasNext()Z

    move-result p6

    if-eqz p6, :cond_74

    invoke-virtual {p5}, Lw4;->next()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Lhri;

    sget-object v0, Lgri;->j:Lgri;

    invoke-interface {p1, p6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_62

    :cond_74
    iput-object p1, p0, Lev7;->b:Ljava/lang/Object;

    new-instance p1, Lknl;

    iget-object p5, p0, Lev7;->e:Ljava/lang/Object;

    check-cast p5, Lumi;

    sget-object p6, Lpn7;->b:Lon7;

    const/16 p6, 0x64

    sget-object v0, Lun7;->d:Lun7;

    invoke-static {p6, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-direct {p1, p5, v0, v1}, Lknl;-><init>(Lumi;J)V

    new-instance p5, Lzu7;

    invoke-direct {p5, p0, p2}, Lzu7;-><init>(Ljava/lang/Object;B)V

    iget-object p6, p1, Lknl;->e:Li7f;

    invoke-virtual {p6, p5}, Li7f;->b(Ljava/lang/Object;)Z

    iput-object p1, p0, Lev7;->o:Ljava/lang/Object;

    iget-object p5, p0, Lev7;->g:Ljava/lang/Object;

    check-cast p5, Liv7;

    iget-object p5, p5, Liv7;->i:Ltsd;

    iget-object p6, p0, Lev7;->d:Ljava/lang/Object;

    check-cast p6, Lfe5;

    new-instance v0, Lav7;

    invoke-direct {v0, p0, p2}, Lav7;-><init>(Lev7;B)V

    invoke-static {p5, p6, v0}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    iget-object p5, p0, Lev7;->a:Ljava/lang/Object;

    check-cast p5, Lpde;

    iget-object p6, p0, Lev7;->d:Ljava/lang/Object;

    check-cast p6, Lfe5;

    new-instance v0, Lav7;

    invoke-direct {v0, p0, p3}, Lav7;-><init>(Lev7;B)V

    invoke-static {p5, p6, v0}, Lxf8;->g0(Lekc;Lndc;Lf7f;)V

    iget-object p5, p0, Lev7;->f:Ljava/lang/Object;

    check-cast p5, Lvs;

    iget-object p5, p5, Lvs;->d:Ljava/lang/Object;

    check-cast p5, Lcom/google/android/material/chip/ChipGroup;

    iget-object p6, p0, Lev7;->k:Ljava/lang/Object;

    check-cast p6, Lxh5;

    invoke-virtual {p5, p6}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    invoke-virtual {p1}, Lknl;->c()V

    iget-object p1, p0, Lev7;->d:Ljava/lang/Object;

    check-cast p1, Lfe5;

    new-instance p5, Lbv7;

    invoke-direct {p5, p0, p2}, Lbv7;-><init>(Lev7;B)V

    new-instance p2, Lug;

    const/16 p6, 0x12

    invoke-direct {p2, p5, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p7, p1, p2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p0, Lev7;->d:Ljava/lang/Object;

    check-cast p1, Lfe5;

    new-instance p2, Lbv7;

    invoke-direct {p2, p0, p3}, Lbv7;-><init>(Lev7;B)V

    new-instance p3, Lug;

    invoke-direct {p3, p2, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p8, p1, p3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p0, Lev7;->d:Ljava/lang/Object;

    check-cast p1, Lfe5;

    iget-object v0, p1, Lfe5;->b:Lqdc;

    new-instance v4, Lbv7;

    invoke-direct {v4, p0, p4}, Lbv7;-><init>(Lev7;B)V

    const/4 v5, 0x7

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method

.method public constructor <init>(Lid1;)V
    .registers 5

    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 257
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lev7;->d:Ljava/lang/Object;

    .line 258
    iget-object v0, p1, Lid1;->a:Lvk;

    const/4 v1, 0x0

    if-nez v0, :cond_11

    move-object v0, v1

    goto :goto_15

    .line 259
    :cond_11
    invoke-virtual {v0}, Lvk;->D()La73;

    move-result-object v0

    :goto_15
    iput-object v0, p0, Lev7;->a:Ljava/lang/Object;

    .line 260
    iget-object v0, p1, Lid1;->b:Lkd1;

    if-nez v0, :cond_1d

    move-object v0, v1

    goto :goto_21

    .line 261
    :cond_1d
    invoke-interface {v0}, Lkd1;->D()La73;

    move-result-object v0

    :goto_21
    iput-object v0, p0, Lev7;->i:Ljava/lang/Object;

    .line 262
    iget-object v0, p1, Lid1;->c:Ldd1;

    if-nez v0, :cond_29

    move-object v0, v1

    goto :goto_2d

    .line 263
    :cond_29
    invoke-virtual {v0}, Ldd1;->D()La73;

    move-result-object v0

    :goto_2d
    iput-object v0, p0, Lev7;->j:Ljava/lang/Object;

    .line 264
    iget-object v0, p1, Lid1;->d:Led1;

    if-nez v0, :cond_35

    move-object v0, v1

    goto :goto_39

    .line 265
    :cond_35
    invoke-virtual {v0}, Led1;->D()La73;

    move-result-object v0

    :goto_39
    iput-object v0, p0, Lev7;->k:Ljava/lang/Object;

    .line 266
    iget-object v0, p1, Lid1;->f:Led1;

    if-nez v0, :cond_41

    move-object v0, v1

    goto :goto_47

    .line 267
    :cond_41
    invoke-virtual {v0}, Led1;->D()La73;

    move-result-object v0

    check-cast v0, Lt89;

    :goto_47
    iput-object v0, p0, Lev7;->m:Ljava/lang/Object;

    .line 268
    iget-boolean v2, p1, Lid1;->j:Z

    .line 269
    iput-boolean v2, p0, Lev7;->c:Z

    if-eqz v0, :cond_6b

    .line 270
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lev7;->e:Ljava/lang/Object;

    .line 271
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lev7;->f:Ljava/lang/Object;

    .line 272
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lev7;->g:Ljava/lang/Object;

    const/16 v0, 0x9

    .line 273
    new-array v0, v0, [F

    iput-object v0, p0, Lev7;->h:Ljava/lang/Object;

    goto :goto_73

    .line 274
    :cond_6b
    iput-object v1, p0, Lev7;->e:Ljava/lang/Object;

    .line 275
    iput-object v1, p0, Lev7;->f:Ljava/lang/Object;

    .line 276
    iput-object v1, p0, Lev7;->g:Ljava/lang/Object;

    .line 277
    iput-object v1, p0, Lev7;->h:Ljava/lang/Object;

    .line 278
    :goto_73
    iget-object v0, p1, Lid1;->g:Led1;

    if-nez v0, :cond_79

    move-object v0, v1

    goto :goto_7f

    .line 279
    :cond_79
    invoke-virtual {v0}, Led1;->D()La73;

    move-result-object v0

    check-cast v0, Lt89;

    :goto_7f
    iput-object v0, p0, Lev7;->n:Ljava/lang/Object;

    .line 280
    iget-object v0, p1, Lid1;->e:Ldd1;

    if-eqz v0, :cond_8b

    .line 281
    invoke-virtual {v0}, Ldd1;->D()La73;

    move-result-object v0

    iput-object v0, p0, Lev7;->l:Ljava/lang/Object;

    .line 282
    :cond_8b
    iget-object v0, p1, Lid1;->h:Led1;

    if-eqz v0, :cond_96

    .line 283
    invoke-virtual {v0}, Led1;->D()La73;

    move-result-object v0

    iput-object v0, p0, Lev7;->b:Ljava/lang/Object;

    goto :goto_98

    .line 284
    :cond_96
    iput-object v1, p0, Lev7;->b:Ljava/lang/Object;

    .line 285
    :goto_98
    iget-object p1, p1, Lid1;->i:Led1;

    if-eqz p1, :cond_a3

    .line 286
    invoke-virtual {p1}, Led1;->D()La73;

    move-result-object p1

    iput-object p1, p0, Lev7;->o:Ljava/lang/Object;

    return-void

    .line 287
    :cond_a3
    iput-object v1, p0, Lev7;->o:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpde;Lv8a;Lypd;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/FrameLayout;Lpde;Lpde;Lxh7;Loji;)V
    .registers 10

    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 289
    iput-object p1, p0, Lev7;->a:Ljava/lang/Object;

    .line 290
    iput-object p2, p0, Lev7;->d:Ljava/lang/Object;

    .line 291
    iput-object p3, p0, Lev7;->e:Ljava/lang/Object;

    .line 292
    iput-object p4, p0, Lev7;->f:Ljava/lang/Object;

    .line 293
    iput-object p6, p0, Lev7;->g:Ljava/lang/Object;

    .line 294
    iput-object p7, p0, Lev7;->h:Ljava/lang/Object;

    .line 295
    iput-object p8, p0, Lev7;->i:Ljava/lang/Object;

    .line 296
    iput-object p9, p0, Lev7;->j:Ljava/lang/Object;

    .line 297
    new-instance p2, Lpde;

    .line 298
    sget-object p3, Lfvl;->c:Lfvl;

    .line 299
    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 300
    iput-object p2, p0, Lev7;->k:Ljava/lang/Object;

    .line 301
    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Lev7;->b:Ljava/lang/Object;

    .line 302
    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Lev7;->l:Ljava/lang/Object;

    .line 303
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lev7;->m:Ljava/lang/Object;

    .line 304
    new-instance p2, Lmni;

    const/16 p3, 0x1b

    invoke-direct {p2, p0, p3}, Lmni;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lev7;->n:Ljava/lang/Object;

    .line 305
    new-instance p2, Lwck;

    invoke-virtual {p5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    .line 306
    invoke-direct {p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    const/4 p3, -0x1

    .line 307
    invoke-virtual {p5, p2, p3, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 308
    iput-object p2, p0, Lev7;->o:Ljava/lang/Object;

    .line 309
    new-instance p2, Ls93;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Ls93;-><init>(Ljava/lang/Object;B)V

    .line 310
    invoke-virtual {p4, p2}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    .line 311
    new-instance p2, Lrck;

    const/4 p4, 0x0

    invoke-direct {p2, p0, p4}, Lrck;-><init>(Lev7;B)V

    invoke-static {p7, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 312
    new-instance p2, Lrck;

    invoke-direct {p2, p0, p3}, Lrck;-><init>(Lev7;B)V

    invoke-static {p6, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 313
    new-instance p2, Lokb;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lokb;-><init>(Ljava/lang/Object;B)V

    .line 314
    invoke-static {p8, p1, p2}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Lc73;)V
    .registers 3

    iget-object v0, p0, Lev7;->l:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->b:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->a:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->i:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->j:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->k:Ljava/lang/Object;

    check-cast v0, La73;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object v0, p0, Lev7;->m:Ljava/lang/Object;

    check-cast v0, Lt89;

    invoke-virtual {p1, v0}, Lc73;->g(La73;)V

    iget-object p0, p0, Lev7;->n:Ljava/lang/Object;

    check-cast p0, Lt89;

    invoke-virtual {p1, p0}, Lc73;->g(La73;)V

    return-void
.end method

.method public final b(Lx63;)V
    .registers 3

    iget-object v0, p0, Lev7;->l:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_9

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_9
    iget-object v0, p0, Lev7;->b:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_12

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_12
    iget-object v0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_1b

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_1b
    iget-object v0, p0, Lev7;->a:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_24

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_24
    iget-object v0, p0, Lev7;->i:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_2d

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_2d
    iget-object v0, p0, Lev7;->j:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_36

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_36
    iget-object v0, p0, Lev7;->k:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_3f

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_3f
    iget-object v0, p0, Lev7;->m:Ljava/lang/Object;

    check-cast v0, Lt89;

    if-eqz v0, :cond_48

    invoke-virtual {v0, p1}, La73;->a(Lx63;)V

    :cond_48
    iget-object p0, p0, Lev7;->n:Ljava/lang/Object;

    check-cast p0, Lt89;

    if-eqz p0, :cond_51

    invoke-virtual {p0, p1}, La73;->a(Lx63;)V

    :cond_51
    return-void
.end method

.method public final c(Lua7;Ljava/lang/Object;)Z
    .registers 8

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    sget-object v2, Lk3d;->a:Landroid/graphics/PointF;

    if-ne p2, v2, :cond_28

    iget-object p2, p0, Lev7;->a:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_23

    new-instance p2, Lzzm;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    invoke-direct {p2, p1, v0}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->a:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_23
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto/16 :goto_13a

    :cond_28
    sget-object v2, Lk3d;->b:Landroid/graphics/PointF;

    if-ne p2, v2, :cond_45

    iget-object p2, p0, Lev7;->i:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_40

    new-instance p2, Lzzm;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    invoke-direct {p2, p1, v0}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->i:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_40
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto/16 :goto_13a

    :cond_45
    sget-object v2, Lk3d;->c:Ljava/lang/Float;

    const/4 v3, 0x0

    if-ne p2, v2, :cond_62

    iget-object v2, p0, Lev7;->i:Ljava/lang/Object;

    check-cast v2, La73;

    instance-of v4, v2, Lo0k;

    if-eqz v4, :cond_62

    check-cast v2, Lo0k;

    iget-object p0, v2, Lo0k;->m:Lua7;

    if-eqz p0, :cond_5a

    iput-object v3, p0, Lua7;->c:Ljava/lang/Object;

    :cond_5a
    iput-object p1, v2, Lo0k;->m:Lua7;

    if-eqz p1, :cond_13a

    iput-object v2, p1, Lua7;->c:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_62
    sget-object v2, Lk3d;->d:Ljava/lang/Float;

    if-ne p2, v2, :cond_7e

    iget-object v2, p0, Lev7;->i:Ljava/lang/Object;

    check-cast v2, La73;

    instance-of v4, v2, Lo0k;

    if-eqz v4, :cond_7e

    check-cast v2, Lo0k;

    iget-object p0, v2, Lo0k;->n:Lua7;

    if-eqz p0, :cond_76

    iput-object v3, p0, Lua7;->c:Ljava/lang/Object;

    :cond_76
    iput-object p1, v2, Lo0k;->n:Lua7;

    if-eqz p1, :cond_13a

    iput-object v2, p1, Lua7;->c:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_7e
    sget-object v2, Lk3d;->j:Lnli;

    if-ne p2, v2, :cond_9b

    iget-object p2, p0, Lev7;->j:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_96

    new-instance p2, Lzzm;

    new-instance v0, Lnli;

    invoke-direct {v0}, Lnli;-><init>()V

    invoke-direct {p2, p1, v0}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->j:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_96
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto/16 :goto_13a

    :cond_9b
    sget-object v2, Lk3d;->k:Ljava/lang/Float;

    if-ne p2, v2, :cond_b3

    iget-object p2, p0, Lev7;->k:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_ae

    new-instance p2, Lzzm;

    invoke-direct {p2, p1, v1}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->k:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_ae
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto/16 :goto_13a

    :cond_b3
    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    if-ne p2, v2, :cond_d3

    iget-object p2, p0, Lev7;->l:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_cf

    new-instance p2, Lzzm;

    const/16 v0, 0x64

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p2, p1, v0}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->l:Ljava/lang/Object;

    goto/16 :goto_13a

    :cond_cf
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto :goto_13a

    :cond_d3
    sget-object v2, Lk3d;->x:Ljava/lang/Float;

    if-ne p2, v2, :cond_e9

    iget-object p2, p0, Lev7;->b:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_e5

    new-instance p2, Lzzm;

    invoke-direct {p2, p1, v0}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->b:Ljava/lang/Object;

    goto :goto_13a

    :cond_e5
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto :goto_13a

    :cond_e9
    sget-object v2, Lk3d;->y:Ljava/lang/Float;

    if-ne p2, v2, :cond_ff

    iget-object p2, p0, Lev7;->o:Ljava/lang/Object;

    check-cast p2, La73;

    if-nez p2, :cond_fb

    new-instance p2, Lzzm;

    invoke-direct {p2, p1, v0}, Lzzm;-><init>(Lua7;Ljava/lang/Object;)V

    iput-object p2, p0, Lev7;->o:Ljava/lang/Object;

    goto :goto_13a

    :cond_fb
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto :goto_13a

    :cond_ff
    sget-object v0, Lk3d;->l:Ljava/lang/Float;

    if-ne p2, v0, :cond_11d

    iget-object p2, p0, Lev7;->m:Ljava/lang/Object;

    check-cast p2, Lt89;

    if-nez p2, :cond_119

    new-instance p2, Lt89;

    new-instance v0, Lzvb;

    invoke-direct {v0, v1}, Lzvb;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, v0}, La73;-><init>(Ljava/util/List;)V

    iput-object p2, p0, Lev7;->m:Ljava/lang/Object;

    :cond_119
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    goto :goto_13a

    :cond_11d
    sget-object v0, Lk3d;->m:Ljava/lang/Float;

    if-ne p2, v0, :cond_13c

    iget-object p2, p0, Lev7;->n:Ljava/lang/Object;

    check-cast p2, Lt89;

    if-nez p2, :cond_137

    new-instance p2, Lt89;

    new-instance v0, Lzvb;

    invoke-direct {v0, v1}, Lzvb;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, v0}, La73;-><init>(Ljava/util/List;)V

    iput-object p2, p0, Lev7;->n:Ljava/lang/Object;

    :cond_137
    invoke-virtual {p2, p1}, La73;->j(Lua7;)V

    :cond_13a
    :goto_13a
    const/4 p0, 0x1

    return p0

    :cond_13c
    const/4 p0, 0x0

    return p0
.end method

.method public final d()V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_f

    iget-object v1, p0, Lev7;->h:Ljava/lang/Object;

    check-cast v1, [F

    const/4 v2, 0x0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_f
    return-void
.end method

.method public final e()Landroid/graphics/Matrix;
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lev7;->e:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Matrix;

    iget-object v2, v0, Lev7;->g:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Matrix;

    iget-object v3, v0, Lev7;->f:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Matrix;

    iget-object v4, v0, Lev7;->h:Ljava/lang/Object;

    check-cast v4, [F

    iget-object v5, v0, Lev7;->d:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/Matrix;

    invoke-virtual {v5}, Landroid/graphics/Matrix;->reset()V

    iget-object v6, v0, Lev7;->i:Ljava/lang/Object;

    check-cast v6, La73;

    const/4 v7, 0x0

    if-eqz v6, :cond_39

    invoke-virtual {v6}, La73;->e()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/graphics/PointF;

    if-eqz v8, :cond_39

    iget v9, v8, Landroid/graphics/PointF;->x:F

    cmpl-float v10, v9, v7

    if-nez v10, :cond_34

    iget v10, v8, Landroid/graphics/PointF;->y:F

    cmpl-float v10, v10, v7

    if-eqz v10, :cond_39

    :cond_34
    iget v8, v8, Landroid/graphics/PointF;->y:F

    invoke-virtual {v5, v9, v8}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_39
    iget-boolean v8, v0, Lev7;->c:Z

    if-eqz v8, :cond_70

    if-eqz v6, :cond_92

    iget v8, v6, La73;->d:F

    invoke-virtual {v6}, La73;->e()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/graphics/PointF;

    iget v10, v9, Landroid/graphics/PointF;->x:F

    iget v9, v9, Landroid/graphics/PointF;->y:F

    const v11, 0x38d1b717    # 1.0E-4f

    add-float/2addr v11, v8

    invoke-virtual {v6, v11}, La73;->i(F)V

    invoke-virtual {v6}, La73;->e()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/graphics/PointF;

    invoke-virtual {v6, v8}, La73;->i(F)V

    iget v6, v11, Landroid/graphics/PointF;->y:F

    sub-float/2addr v6, v9

    float-to-double v8, v6

    iget v6, v11, Landroid/graphics/PointF;->x:F

    sub-float/2addr v6, v10

    float-to-double v10, v6

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v8

    double-to-float v6, v8

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->preRotate(F)Z

    goto :goto_92

    :cond_70
    iget-object v6, v0, Lev7;->k:Ljava/lang/Object;

    check-cast v6, La73;

    if-eqz v6, :cond_92

    instance-of v8, v6, Lzzm;

    if-eqz v8, :cond_85

    invoke-virtual {v6}, La73;->e()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    goto :goto_8b

    :cond_85
    check-cast v6, Lt89;

    invoke-virtual {v6}, Lt89;->k()F

    move-result v6

    :goto_8b
    cmpl-float v8, v6, v7

    if-eqz v8, :cond_92

    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->preRotate(F)Z

    :cond_92
    :goto_92
    iget-object v6, v0, Lev7;->m:Ljava/lang/Object;

    check-cast v6, Lt89;

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v6, :cond_118

    iget-object v9, v0, Lev7;->n:Ljava/lang/Object;

    check-cast v9, Lt89;

    const/high16 v10, 0x42b40000    # 90.0f

    if-nez v9, :cond_a4

    move v9, v7

    goto :goto_b4

    :cond_a4
    invoke-virtual {v9}, Lt89;->k()F

    move-result v9

    neg-float v9, v9

    add-float/2addr v9, v10

    float-to-double v11, v9

    invoke-static {v11, v12}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    double-to-float v9, v11

    :goto_b4
    iget-object v11, v0, Lev7;->n:Ljava/lang/Object;

    check-cast v11, Lt89;

    if-nez v11, :cond_bc

    move v10, v8

    goto :goto_cc

    :cond_bc
    invoke-virtual {v11}, Lt89;->k()F

    move-result v11

    neg-float v11, v11

    add-float/2addr v11, v10

    float-to-double v10, v11

    invoke-static {v10, v11}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    double-to-float v10, v10

    :goto_cc
    invoke-virtual {v6}, Lt89;->k()F

    move-result v6

    float-to-double v11, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Math;->tan(D)D

    move-result-wide v11

    double-to-float v6, v11

    invoke-virtual {v0}, Lev7;->d()V

    const/4 v11, 0x0

    aput v9, v4, v11

    const/4 v12, 0x1

    aput v10, v4, v12

    neg-float v13, v10

    const/4 v14, 0x3

    aput v13, v4, v14

    const/4 v15, 0x4

    aput v9, v4, v15

    const/16 v16, 0x8

    aput v8, v4, v16

    invoke-virtual {v1, v4}, Landroid/graphics/Matrix;->setValues([F)V

    invoke-virtual {v0}, Lev7;->d()V

    aput v8, v4, v11

    aput v6, v4, v14

    aput v8, v4, v15

    aput v8, v4, v16

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->setValues([F)V

    invoke-virtual {v0}, Lev7;->d()V

    aput v9, v4, v11

    aput v13, v4, v12

    aput v10, v4, v14

    aput v9, v4, v15

    aput v8, v4, v16

    invoke-virtual {v2, v4}, Landroid/graphics/Matrix;->setValues([F)V

    invoke-virtual {v3, v1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    invoke-virtual {v5, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    :cond_118
    iget-object v1, v0, Lev7;->j:Ljava/lang/Object;

    check-cast v1, La73;

    if-eqz v1, :cond_137

    invoke-virtual {v1}, La73;->e()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnli;

    if-eqz v1, :cond_137

    iget v2, v1, Lnli;->a:F

    cmpl-float v3, v2, v8

    if-nez v3, :cond_132

    iget v3, v1, Lnli;->b:F

    cmpl-float v3, v3, v8

    if-eqz v3, :cond_137

    :cond_132
    iget v1, v1, Lnli;->b:F

    invoke-virtual {v5, v2, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    :cond_137
    iget-object v0, v0, Lev7;->a:Ljava/lang/Object;

    check-cast v0, La73;

    if-eqz v0, :cond_158

    invoke-virtual {v0}, La73;->e()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/PointF;

    if-eqz v0, :cond_158

    iget v1, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v2, v1, v7

    if-nez v2, :cond_151

    iget v2, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v2, v2, v7

    if-eqz v2, :cond_158

    :cond_151
    neg-float v1, v1

    iget v0, v0, Landroid/graphics/PointF;->y:F

    neg-float v0, v0

    invoke-virtual {v5, v1, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_158
    return-object v5
.end method

.method public final f(F)Landroid/graphics/Matrix;
    .registers 11

    iget-object v0, p0, Lev7;->d:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Lev7;->i:Ljava/lang/Object;

    check-cast v1, La73;

    const/4 v2, 0x0

    if-nez v1, :cond_d

    move-object v1, v2

    goto :goto_13

    :cond_d
    invoke-virtual {v1}, La73;->e()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/PointF;

    :goto_13
    iget-object v3, p0, Lev7;->j:Ljava/lang/Object;

    check-cast v3, La73;

    if-nez v3, :cond_1b

    move-object v3, v2

    goto :goto_21

    :cond_1b
    invoke-virtual {v3}, La73;->e()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnli;

    :goto_21
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    if-eqz v1, :cond_2f

    iget v4, v1, Landroid/graphics/PointF;->x:F

    mul-float/2addr v4, p1

    iget v1, v1, Landroid/graphics/PointF;->y:F

    mul-float/2addr v1, p1

    invoke-virtual {v0, v4, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_2f
    if-eqz v3, :cond_45

    iget v1, v3, Lnli;->a:F

    float-to-double v4, v1

    float-to-double v6, p1

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v1, v4

    iget v3, v3, Lnli;->b:F

    float-to-double v3, v3

    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-float v3, v3

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    :cond_45
    iget-object v1, p0, Lev7;->k:Ljava/lang/Object;

    check-cast v1, La73;

    if-eqz v1, :cond_72

    invoke-virtual {v1}, La73;->e()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object p0, p0, Lev7;->a:Ljava/lang/Object;

    check-cast p0, La73;

    if-eqz p0, :cond_62

    invoke-virtual {p0}, La73;->e()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Landroid/graphics/PointF;

    :cond_62
    mul-float/2addr v1, p1

    if-nez v2, :cond_68

    const/4 p0, 0x0

    move p1, p0

    goto :goto_6f

    :cond_68
    iget p0, v2, Landroid/graphics/PointF;->x:F

    iget p1, v2, Landroid/graphics/PointF;->y:F

    move v8, p1

    move p1, p0

    move p0, v8

    :goto_6f
    invoke-virtual {v0, v1, p1, p0}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    :cond_72
    return-object v0
.end method

.method public final g(IIIIIF)V
    .registers 9

    iget-object p0, p0, Lev7;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_16

    new-instance v1, Lsck;

    invoke-direct {v1, p1}, Lsck;-><init>(I)V

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    check-cast v1, Lsck;

    iget-object p0, v1, Lsck;->b:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_24

    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_27

    :cond_24
    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Rect;->union(IIII)V

    :goto_27
    iget p0, v1, Lsck;->c:F

    cmpg-float p1, p0, p6

    if-ltz p1, :cond_2e

    move p6, p0

    :cond_2e
    iput p6, v1, Lsck;->c:F

    return-void
.end method

.method public final h(Lx83;Lhri;Lgri;Leri;Leri;Ll42;)V
    .registers 13

    iget-boolean v0, p3, Lgri;->g:Z

    if-eqz v0, :cond_1f

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_16

    const/4 p5, 0x1

    if-eq v0, p5, :cond_14

    const/4 p5, 0x2

    if-eq v0, p5, :cond_1d

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_14
    move-object p4, p6

    goto :goto_1d

    :cond_16
    iget-boolean p4, p3, Lgri;->c:Z

    if-eqz p4, :cond_1c

    move-object p4, p5

    goto :goto_1d

    :cond_1c
    const/4 p4, 0x0

    :cond_1d
    :goto_1d
    if-nez p4, :cond_20

    :cond_1f
    return-void

    :cond_20
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p5

    new-instance v0, Lrg;

    const/4 v5, 0x5

    move-object v1, p0

    move-object v3, p1

    move-object v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lrg;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lx83;->K:Lixh;

    invoke-virtual {p0, p5}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    new-instance p1, Leh7;

    invoke-direct {p1, p0}, Leh7;-><init>(I)V

    new-instance p2, Llt2;

    invoke-direct {p2, v0, p5, p0}, Llt2;-><init>(Lrg;Landroid/content/Context;I)V

    invoke-interface {p4, p1, p2}, Leri;->h(Leh7;Lcom/opera/api/Callback;)Lhh4;

    return-void
.end method

.method public final i(Lsck;)V
    .registers 4

    iget-object v0, p0, Lev7;->l:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    iget p1, p1, Lsck;->a:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Luck;

    if-nez p1, :cond_13

    return-void

    :cond_13
    iget-object v0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast v0, Lwck;

    iget-object v1, p1, Luck;->a:Ln4l;

    iget-object v1, v1, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p0, p0, Lev7;->m:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final j()V
    .registers 2

    iget-boolean v0, p0, Lev7;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lev7;->c:Z

    iget-object v0, p0, Lev7;->f:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Lev7;->n:Ljava/lang/Object;

    check-cast p0, Lmni;

    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final k(Leri;)V
    .registers 4

    iget-object v0, p0, Lev7;->g:Ljava/lang/Object;

    check-cast v0, Liv7;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Liv7;->e(Leri;Z)Z

    move-result p1

    if-eqz p1, :cond_18

    iget-object p0, p0, Lev7;->h:Ljava/lang/Object;

    check-cast p0, Lwzg;

    iget-object p0, p0, Lwzg;->c:Ljava/lang/Object;

    check-cast p0, Ldbf;

    sget-object p1, Lqk0;->b:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    :cond_18
    return-void
.end method
