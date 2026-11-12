.class public final Lkol;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final r:Landroid/graphics/drawable/ColorDrawable;

.field public static final s:Lhol;

.field public static final t:Landroid/graphics/Bitmap$Config;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Likc;

.field public final c:Lkotlin/jvm/functions/Function1;

.field public d:Ln9h;

.field public e:Lhol;

.field public f:I

.field public g:Z

.field public h:Lynj;

.field public i:Lne5;

.field public final j:Ldeg;

.field public final k:Ljava/util/LinkedHashSet;

.field public final l:Lyqa;

.field public final m:Lzyk;

.field public final n:Lyqa;

.field public final o:Lzyk;

.field public final p:Lzyk;

.field public final q:Lyqa;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    sput-object v0, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    new-instance v0, Lhol;

    new-instance v2, Lfol;

    const-string v3, "about:blank"

    sget-object v4, Lp6l;->a:Lp6l;

    invoke-direct {v2, v1, v4, v3}, Lfol;-><init>(ILp6l;Ljava/lang/String;)V

    sget-object v1, Lvnl;->a:Lvnl;

    invoke-direct {v0, v2, v1}, Lhol;-><init>(Lfol;Lbwg;)V

    sput-object v0, Lkol;->s:Lhol;

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    sput-object v0, Lkol;->t:Landroid/graphics/Bitmap$Config;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lpde;Likc;Lyqa;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkol;->a:Landroid/content/Context;

    iput-object p3, p0, Lkol;->b:Likc;

    iput-object p5, p0, Lkol;->c:Lkotlin/jvm/functions/Function1;

    sget-object p1, Lkol;->s:Lhol;

    iput-object p1, p0, Lkol;->e:Lhol;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lyne;->b:Ldeg;

    iput-object p1, p0, Lkol;->j:Ldeg;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lkol;->k:Ljava/util/LinkedHashSet;

    iput-object p4, p0, Lkol;->l:Lyqa;

    new-instance p1, Lrnl;

    const/4 p5, 0x0

    invoke-direct {p1, p4, p2, p0, p5}, Lrnl;-><init>(Lyqa;Lpde;Lkol;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lkol;->m:Lzyk;

    iput-object p4, p0, Lkol;->n:Lyqa;

    new-instance p1, Lrnl;

    const/4 v0, 0x1

    invoke-direct {p1, p4, p2, p0, v0}, Lrnl;-><init>(Lyqa;Lpde;Lkol;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lkol;->o:Lzyk;

    new-instance p1, Lp7l;

    const/16 v0, 0xe

    invoke-direct {p1, p4, v0}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lkol;->p:Lzyk;

    iput-object p4, p0, Lkol;->q:Lyqa;

    new-instance p1, Lsnl;

    invoke-direct {p1, p0, p5}, Lsnl;-><init>(Lkol;B)V

    invoke-static {p3, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Lcyj;
    .registers 1

    iget-object p0, p0, Lkol;->b:Likc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcyj;

    return-object p0
.end method

.method public final b([Ldol;I)V
    .registers 8

    array-length v0, p1

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-le p2, v0, :cond_6

    return-void

    :cond_6
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eqz v0, :cond_74

    const/4 v4, 0x3

    if-eq v0, v1, :cond_6b

    if-eq v0, v2, :cond_62

    if-eq v0, v4, :cond_59

    const/4 v2, 0x4

    if-ne v0, v2, :cond_55

    sget-object v0, Ldol;->d:Ldol;

    invoke-static {v0, p1}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_50

    if-ge p1, p2, :cond_50

    iget-object p1, p0, Lkol;->i:Lne5;

    if-nez p1, :cond_4f

    iget-object p1, p0, Lkol;->l:Lyqa;

    iget-object p1, p1, Lyqa;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->x0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj8l;

    iget-object p2, p0, Lkol;->e:Lhol;

    iget-object p2, p2, Lhol;->a:Lfol;

    iget p2, p2, Lfol;->c:I

    iget-object v0, p1, Lj8l;->b:Lk6l;

    invoke-virtual {v0, p2}, Lk6l;->r(I)Lb2l;

    move-result-object p2

    if-nez p2, :cond_47

    move p1, v3

    goto :goto_4d

    :cond_47
    iget-object p1, p1, Lj8l;->c:Ljava/util/LinkedHashMap;

    invoke-interface {p1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    :goto_4d
    if-eqz p1, :cond_50

    :cond_4f
    move v3, v1

    :cond_50
    xor-int/2addr v3, v1

    invoke-virtual {p0, v3}, Lkol;->g(Z)V

    return-void

    :cond_55
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_59
    new-instance v0, Lpnl;

    invoke-direct {v0, p0, p1, p2, v1}, Lpnl;-><init>(Lkol;[Ldol;IB)V

    invoke-virtual {p0, v0}, Lkol;->e(Lkotlin/jvm/functions/Function0;)V

    return-void

    :cond_62
    new-instance v0, Lpnl;

    invoke-direct {v0, p0, p1, p2, v3}, Lpnl;-><init>(Lkol;[Ldol;IB)V

    invoke-virtual {p0, v1, v0}, Lkol;->d(ZLkotlin/jvm/functions/Function0;)V

    return-void

    :cond_6b
    new-instance v0, Lpnl;

    invoke-direct {v0, p0, p1, p2, v4}, Lpnl;-><init>(Lkol;[Ldol;IB)V

    invoke-virtual {p0, v3, v0}, Lkol;->d(ZLkotlin/jvm/functions/Function0;)V

    return-void

    :cond_74
    new-instance v0, Lpnl;

    invoke-direct {v0, p0, p1, p2, v2}, Lpnl;-><init>(Lkol;[Ldol;IB)V

    invoke-virtual {p0, v3, v0}, Lkol;->f(ZLkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public final c()V
    .registers 29

    move-object/from16 v0, p0

    iget-object v1, v0, Lkol;->e:Lhol;

    iget-object v1, v1, Lhol;->b:Lbwg;

    sget-object v2, Lynl;->a:Lynl;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_201

    sget-object v2, Laol;->a:Laol;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_201

    sget-object v2, Lbol;->a:Lbol;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_201

    instance-of v2, v1, Lznl;

    if-nez v2, :cond_201

    instance-of v2, v1, Lcol;

    if-nez v2, :cond_201

    sget-object v2, Lvnl;->a:Lvnl;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    sget-object v3, Lxnl;->a:Lxnl;

    sget-object v4, Lwnl;->a:Lwnl;

    if-nez v2, :cond_42

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_42

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_42
    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->e:Lzxj;

    iget-object v1, v1, Lzxj;->a:Ly7h;

    instance-of v2, v1, Layj;

    const v5, 0x7f080578

    const v6, 0x7f0803ec

    iget-object v7, v0, Lkol;->a:Landroid/content/Context;

    if-eqz v2, :cond_1b5

    check-cast v1, Layj;

    iget-object v11, v1, Layj;->g:Lumj;

    iget-object v2, v0, Lkol;->e:Lhol;

    iget-object v2, v2, Lhol;->a:Lfol;

    iget-object v2, v2, Lfol;->a:Ljava/lang/String;

    invoke-static {v2}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    const/16 v15, 0x9

    const/4 v8, 0x0

    const v9, 0x7f04021b

    const/high16 v10, 0x3f800000    # 1.0f

    if-eqz v2, :cond_bf

    sget-object v14, Lna5;->e:Lna5;

    invoke-static {v6, v7}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v14, v7}, Lna5;->d(Landroid/content/Context;)Loa5;

    move-result-object v5

    iget v5, v5, Loa5;->b:I

    new-instance v6, Lixh;

    invoke-direct {v6, v10}, Lixh;-><init>(F)V

    invoke-virtual {v6, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    new-instance v10, Ldxh;

    invoke-direct {v10, v9}, Ldxh;-><init>(I)V

    invoke-virtual {v10, v7}, Lcxh;->a(Landroid/content/Context;)I

    move-result v16

    new-instance v9, Ln9h;

    move-object v10, v8

    new-instance v8, Lxmj;

    move-object v12, v10

    new-instance v10, Lmxh;

    invoke-direct {v10, v2}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    move-object v13, v12

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v12

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    move-object/from16 v17, v9

    iget-object v9, v0, Lkol;->a:Landroid/content/Context;

    move-object/from16 v27, v13

    move v13, v2

    move-object/from16 v2, v17

    move/from16 v17, v5

    move-object/from16 v5, v27

    invoke-direct/range {v8 .. v14}, Lxmj;-><init>(Landroid/content/Context;Lb8h;Lumj;IILna5;)V

    invoke-direct {v2, v15, v5, v8, v3}, Ln9h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v2, v0, Lkol;->d:Ln9h;

    move-object v9, v2

    move/from16 v21, v6

    move/from16 v20, v16

    move/from16 v19, v17

    goto/16 :goto_184

    :cond_bf
    move v2, v5

    move-object v5, v8

    iget-object v6, v0, Lkol;->e:Lhol;

    iget-object v6, v6, Lhol;->a:Lfol;

    iget-object v6, v6, Lfol;->a:Ljava/lang/String;

    invoke-static {v6}, Lbtb;->b(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_110

    sget-object v14, Lna5;->b:Lna5;

    invoke-static {v2, v7}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v14, v7}, Lna5;->d(Landroid/content/Context;)Loa5;

    move-result-object v6

    iget v6, v6, Loa5;->b:I

    new-instance v8, Lixh;

    invoke-direct {v8, v10}, Lixh;-><init>(F)V

    invoke-virtual {v8, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v16

    new-instance v8, Ldxh;

    invoke-direct {v8, v9}, Ldxh;-><init>(I)V

    invoke-virtual {v8, v7}, Lcxh;->a(Landroid/content/Context;)I

    move-result v17

    new-instance v9, Ln9h;

    new-instance v8, Lxmj;

    new-instance v10, Lmxh;

    invoke-direct {v10, v2}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v12

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v13

    move-object v2, v9

    iget-object v9, v0, Lkol;->a:Landroid/content/Context;

    invoke-direct/range {v8 .. v14}, Lxmj;-><init>(Landroid/content/Context;Lb8h;Lumj;IILna5;)V

    invoke-direct {v2, v15, v5, v8, v3}, Ln9h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v2, v0, Lkol;->d:Ln9h;

    move-object v9, v2

    move/from16 v19, v6

    move/from16 v21, v16

    move/from16 v20, v17

    goto/16 :goto_184

    :cond_110
    sget v2, Lzmj;->i:I

    iget-object v2, v0, Lkol;->e:Lhol;

    iget-object v2, v2, Lhol;->a:Lfol;

    iget-object v2, v2, Lfol;->a:Ljava/lang/String;

    invoke-static {v2}, Lr9h;->t(Ljava/lang/String;)Lanj;

    move-result-object v2

    iget-object v5, v0, Lkol;->d:Ln9h;

    if-eqz v5, :cond_12c

    iget-object v6, v5, Ln9h;->b:Ljava/lang/Object;

    check-cast v6, Lanj;

    invoke-static {v6, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12c

    :goto_12a
    move-object v9, v5

    goto :goto_15e

    :cond_12c
    new-instance v5, Ln9h;

    new-instance v8, Lzmj;

    iget-object v6, v0, Lkol;->e:Lhol;

    iget-object v6, v6, Lhol;->a:Lfol;

    iget-object v10, v6, Lfol;->a:Ljava/lang/String;

    iget-object v6, v1, Layj;->d:Lixh;

    iget-object v9, v0, Lkol;->a:Landroid/content/Context;

    invoke-virtual {v6, v9}, Ly7h;->k(Landroid/content/Context;)I

    move-result v13

    iget-object v6, v1, Layj;->e:Lixh;

    invoke-virtual {v6, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v14

    iget-boolean v6, v1, Layj;->h:Z

    sget-object v12, Lna5;->b:Lna5;

    invoke-virtual {v12, v9, v10}, Lna5;->g(Landroid/content/Context;Ljava/lang/String;)Loa5;

    move-result-object v12

    move-object/from16 v16, v11

    move-object v11, v2

    move v2, v15

    move-object v15, v12

    move-object/from16 v12, v16

    move/from16 v16, v6

    invoke-direct/range {v8 .. v16}, Lzmj;-><init>(Landroid/content/Context;Ljava/lang/String;Lanj;Lumj;IILoa5;Z)V

    invoke-direct {v5, v2, v11, v8, v3}, Ln9h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v5, v0, Lkol;->d:Ln9h;

    goto :goto_12a

    :goto_15e
    iget-object v2, v9, Ln9h;->c:Ljava/lang/Object;

    check-cast v2, Lvmj;

    iget-object v2, v2, Lvmj;->c:Loa5;

    iget v5, v2, Loa5;->b:I

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->e:Lzxj;

    iget-object v2, v2, Lzxj;->b:Lgxh;

    invoke-virtual {v2, v7}, Lcxh;->a(Landroid/content/Context;)I

    move-result v16

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->e:Lzxj;

    iget-object v2, v2, Lzxj;->c:Lixh;

    invoke-virtual {v2, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    move/from16 v19, v5

    move/from16 v21, v6

    move/from16 v20, v16

    :goto_184
    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->b:Ly7h;

    invoke-virtual {v2, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v18

    iget-object v2, v9, Ln9h;->c:Ljava/lang/Object;

    check-cast v2, Lvmj;

    new-instance v3, Lfr;

    iget v5, v2, Lvmj;->a:I

    iget v6, v2, Lvmj;->b:I

    const/4 v8, 0x1

    invoke-direct {v3, v5, v6, v8}, Lfr;-><init>(IIB)V

    iget-object v1, v1, Layj;->f:Lixh;

    invoke-virtual {v1, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v22

    new-instance v17, Lir;

    const/16 v25, 0x0

    const/16 v26, 0x80

    move-object/from16 v23, v2

    move-object/from16 v24, v3

    invoke-direct/range {v17 .. v26}, Lir;-><init>(IIIIILandroid/graphics/drawable/Drawable;Ler;Lgr;I)V

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    return-void

    :cond_1b5
    move v2, v5

    instance-of v4, v1, Lbyj;

    if-eqz v4, :cond_1fe

    iget-object v4, v0, Lkol;->e:Lhol;

    iget-object v4, v4, Lhol;->a:Lfol;

    iget-object v4, v4, Lfol;->a:Ljava/lang/String;

    invoke-static {v4}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1d0

    new-instance v2, Llxh;

    invoke-direct {v2, v6}, Llxh;-><init>(I)V

    invoke-virtual {v2, v7}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_1ef

    :cond_1d0
    iget-object v4, v0, Lkol;->e:Lhol;

    iget-object v4, v4, Lhol;->a:Lfol;

    iget-object v4, v4, Lfol;->a:Ljava/lang/String;

    invoke-static {v4}, Lbtb;->b(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e6

    new-instance v4, Llxh;

    invoke-direct {v4, v2}, Llxh;-><init>(I)V

    invoke-virtual {v4, v7}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_1ef

    :cond_1e6
    move-object v2, v1

    check-cast v2, Lbyj;

    iget-object v2, v2, Lbyj;->d:Llxh;

    invoke-virtual {v2, v7}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :goto_1ef
    check-cast v1, Lbyj;

    iget-object v1, v1, Lbyj;->e:Lcxh;

    invoke-virtual {v1, v7}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {v2, v1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v2, v3}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    return-void

    :cond_1fe
    invoke-static {}, Lh9o;->p()V

    :cond_201
    return-void
.end method

.method public final d(ZLkotlin/jvm/functions/Function0;)V
    .registers 15

    iget-object v0, p0, Lkol;->q:Lyqa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->S0:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Leoj;

    iget-object v2, v0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Lqsh;

    if-nez v2, :cond_54

    new-instance v2, Lqsh;

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v3

    iget-object v5, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v5, :cond_2d

    const/4 v5, 0x0

    :cond_2d
    invoke-direct {v2, v3, v4, v5}, Lqsh;-><init>(Ltcc;Leoj;Lk6l;)V

    iput-object v2, v0, Lyqa;->b:Ljava/lang/Object;

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v6

    iget-object v0, v1, Lcom/opera/android/BrowserActivity;->t0:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv4b;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lvvf;

    const/16 v1, 0x18

    invoke-direct {v7, v4, v0, v1}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v8, Ltji;

    invoke-direct {v8, v4, v0}, Ltji;-><init>(Leoj;Lv4b;)V

    const/4 v10, 0x0

    const/16 v11, 0xc

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    :cond_54
    new-instance v5, Ldoj;

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->a:Lfol;

    iget-object v1, v0, Lfol;->a:Ljava/lang/String;

    iget-object v0, v0, Lfol;->b:Lp6l;

    invoke-direct {v5, v1, v0}, Ldoj;-><init>(Ljava/lang/String;Lp6l;)V

    new-instance v7, Lqfl;

    const/4 v0, 0x6

    invoke-direct {v7, p0, v0}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Lqnl;

    const/4 v0, 0x0

    invoke-direct {v9, p0, p2, v0}, Lqnl;-><init>(Lkol;Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lynj;

    iget-object v6, p0, Lkol;->j:Ldeg;

    move v8, p1

    invoke-direct/range {v3 .. v9}, Lynj;-><init>(Leoj;Ldoj;Ldeg;Lqfl;ZLqnl;)V

    iput-object v3, p0, Lkol;->h:Lynj;

    return-void
.end method

.method public final e(Lkotlin/jvm/functions/Function0;)V
    .registers 10

    iget-object v0, p0, Lkol;->i:Lne5;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lne5;->cancel()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lkol;->i:Lne5;

    iget-object v1, p0, Lkol;->m:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc8l;

    iget-object v3, p0, Lkol;->e:Lhol;

    iget-object v3, v3, Lhol;->a:Lfol;

    iget v3, v3, Lfol;->c:I

    iget-object v2, v2, Lc8l;->h:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_1f
    if-ge v5, v4, :cond_31

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    move-object v7, v6

    check-cast v7, Lx7l;

    iget-object v7, v7, Lx7l;->c:Lm7l;

    iget v7, v7, Lm7l;->a:I

    if-ne v7, v3, :cond_1f

    move-object v0, v6

    :cond_31
    check-cast v0, Lx7l;

    if-eqz v0, :cond_50

    iget-object v0, v0, Lx7l;->b:Lyni;

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v3, p0, Lkol;->a:Landroid/content/Context;

    invoke-static {v3, v0, v2}, Lxvg;->s(Landroid/content/Context;Lyni;Lcyj;)Lir;

    move-result-object v0

    new-instance v2, Lznl;

    sget-object v3, Leol;->a:Leol;

    invoke-direct {v2, v3}, Lznl;-><init>(Leol;)V

    invoke-virtual {p0, v0, v2}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    iget-boolean v0, p0, Lkol;->g:Z

    if-eqz v0, :cond_50

    return-void

    :cond_50
    iget-boolean v0, p0, Lkol;->g:Z

    if-eqz v0, :cond_5e

    new-instance v0, Liol;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v2, Leol;->b:Leol;

    iput-object v2, v0, Liol;->a:Leol;

    goto :goto_73

    :cond_5e
    new-instance v0, Ljol;

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->d:Lrxj;

    iget v2, v2, Lrxj;->a:I

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v3

    iget-object v3, v3, Lcyj;->d:Lrxj;

    iget v3, v3, Lrxj;->b:I

    invoke-direct {v0, v2, v3}, Ljol;-><init>(II)V

    :goto_73
    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc8l;

    iget-object v2, p0, Lkol;->e:Lhol;

    iget-object v2, v2, Lhol;->a:Lfol;

    iget v3, v2, Lfol;->c:I

    iget-object v2, v2, Lfol;->b:Lp6l;

    new-instance v4, Lcrk;

    const/16 v5, 0xf

    invoke-direct {v4, v0, v5}, Lcrk;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lqfl;

    const/4 v6, 0x5

    invoke-direct {v5, v0, v6}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Ltmi;

    const/16 v7, 0x10

    invoke-direct {v6, p0, p1, v0, v7}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lne5;

    invoke-virtual {v1, v2}, Lc8l;->c(Lp6l;)Lmcj;

    move-result-object v0

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p1, Lne5;->g:Ljava/lang/Object;

    iput-object v0, p1, Lne5;->a:Ljava/lang/Object;

    iput-object v5, p1, Lne5;->b:Ljava/lang/Object;

    iput-object v6, p1, Lne5;->c:Ljava/lang/Object;

    new-instance v1, Lnwa;

    const/4 v2, 0x4

    invoke-direct {v1, p1, v2}, Lnwa;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p1, Lne5;->f:Ljava/lang/Object;

    iget-object v0, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Lo7l;

    new-instance v1, Ld7k;

    invoke-direct {v1, v4, p1, v3}, Ld7k;-><init>(Lcrk;Lne5;I)V

    invoke-interface {v0, v3, v1}, Lo7l;->l(ILd7k;)Loml;

    move-result-object v0

    iput-object v0, p1, Lne5;->d:Ljava/lang/Object;

    iput-object p1, p0, Lkol;->i:Lne5;

    return-void
.end method

.method public final f(ZLkotlin/jvm/functions/Function0;)V
    .registers 9

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->b:Lbwg;

    sget-object v1, Laol;->a:Laol;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8c

    iget-object v0, p0, Lkol;->n:Lyqa;

    iget-object v0, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object v0

    iget-object v0, v0, Lpne;->a:Ljava/lang/String;

    iget-object v1, p0, Lkol;->e:Lhol;

    iget-object v1, v1, Lhol;->a:Lfol;

    iget-object v1, v1, Lfol;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Ldbh;->s(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :cond_2e
    new-instance v1, Lqnl;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p2, v2}, Lqnl;-><init>(Lkol;Lkotlin/jvm/functions/Function0;B)V

    new-instance p2, Le3g;

    invoke-direct {p2, p0, v1, v0}, Le3g;-><init>(Lkol;Lqnl;Landroid/net/Uri;)V

    iget-object v2, p0, Lkol;->k:Ljava/util/LinkedHashSet;

    invoke-interface {v2, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v3, p0, Lkol;->j:Ldeg;

    invoke-virtual {v3, v0}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v0

    sget-object v4, Lkol;->t:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v4}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v4

    iget-object v4, v4, Lcyj;->f:Luxj;

    iget-object v4, v4, Luxj;->a:Lixh;

    iget-object v5, p0, Lkol;->a:Landroid/content/Context;

    invoke-virtual {v4, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object p0

    iget-object p0, p0, Lcyj;->f:Luxj;

    iget-object p0, p0, Luxj;->a:Lixh;

    invoke-virtual {p0, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    iget-object v5, v0, Ldwh;->b:Lgvh;

    invoke-virtual {v5, v4, p0}, Lgvh;->b(II)V

    invoke-virtual {v0}, Ldwh;->a()V

    invoke-virtual {v0}, Ldwh;->j()V

    if-eqz p1, :cond_77

    const/4 p0, 0x0

    new-array p0, p0, [I

    const/4 v4, 0x3

    invoke-virtual {v0, v4, p0}, Ldwh;->i(I[I)V

    :cond_77
    invoke-virtual {v0, p2}, Ldwh;->f(Lacl;)V

    if-eqz p1, :cond_8c

    invoke-interface {v2, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8c

    invoke-interface {v2, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v3, p2}, Ldeg;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lqnl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8c
    return-void
.end method

.method public final g(Z)V
    .registers 15

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->a:Lfol;

    iget-object v0, v0, Lfol;->b:Lp6l;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    iget-object v1, p0, Lkol;->a:Landroid/content/Context;

    if-eqz v0, :cond_2c

    const/4 v2, 0x1

    if-ne v0, v2, :cond_28

    iget-object v0, p0, Lkol;->p:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjn;

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->b:Ly7h;

    invoke-virtual {v2, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2, v1}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object v0

    goto :goto_4b

    :cond_28
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2c
    iget-object v0, p0, Lkol;->o:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Likc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjn;

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->b:Ly7h;

    invoke-virtual {v2, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2, v1}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object v0

    invoke-virtual {v0, v1}, Llkn;->c(Landroid/content/Context;)V

    :goto_4b
    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v2

    new-instance v3, Lir;

    iget-object v4, v2, Lcyj;->b:Ly7h;

    iget-object v2, v2, Lcyj;->g:Lqxj;

    invoke-virtual {v4, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v4

    if-eqz p1, :cond_8a

    iget-object v5, v2, Lqxj;->a:Lb8h;

    invoke-virtual {v5, v1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iget-object v6, v0, Llkn;->a:Lxkn;

    iget-boolean v6, v6, Lxkn;->g:Z

    if-eqz v6, :cond_6a

    iget-object v6, v2, Lqxj;->f:Lfxh;

    goto :goto_6c

    :cond_6a
    iget-object v6, v2, Lqxj;->g:Lfxh;

    :goto_6c
    invoke-virtual {v6, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v1

    invoke-static {v5, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    iget v2, v2, Lqxj;->h:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Lzed;->b(F)I

    move-result v1

    new-instance v2, Ltnl;

    invoke-direct {v2, v5, v1}, Ltnl;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-static {v0, v2}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v1

    move-object v9, v1

    goto :goto_8b

    :cond_8a
    move-object v9, v0

    :goto_8b
    new-instance v10, Lfr;

    invoke-virtual {v0}, Llkn;->b()I

    move-result v1

    invoke-virtual {v0}, Llkn;->a()I

    move-result v0

    const/4 v2, 0x0

    invoke-direct {v10, v1, v0, v2}, Lfr;-><init>(IIB)V

    const/4 v11, 0x0

    const/16 v12, 0x90

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v12}, Lir;-><init>(IIIIILandroid/graphics/drawable/Drawable;Ler;Lgr;I)V

    new-instance v0, Lcol;

    invoke-direct {v0, p1}, Lcol;-><init>(Z)V

    invoke-virtual {p0, v3, v0}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    return-void
.end method

.method public final h()V
    .registers 3

    iget-object v0, p0, Lkol;->e:Lhol;

    sget-object v1, Lkol;->s:Lhol;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->a:Lfol;

    invoke-virtual {p0, v0}, Lkol;->k(Lfol;)V

    return-void
.end method

.method public final i(Landroid/graphics/drawable/Drawable;Lbwg;)V
    .registers 5

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->a:Lfol;

    new-instance v1, Lhol;

    invoke-direct {v1, v0, p2}, Lhol;-><init>(Lfol;Lbwg;)V

    iput-object v1, p0, Lkol;->e:Lhol;

    iget-object p0, p0, Lkol;->c:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final j(Lfol;)V
    .registers 3

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->a:Lfol;

    invoke-virtual {p1, v0}, Lfol;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    const/4 v0, 0x0

    iput v0, p0, Lkol;->f:I

    invoke-virtual {p0, p1}, Lkol;->k(Lfol;)V

    return-void
.end method

.method public final k(Lfol;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lkol;->h:Lynj;

    if-eqz v2, :cond_b

    invoke-virtual {v2}, Lynj;->cancel()V

    :cond_b
    iget-object v2, v0, Lkol;->i:Lne5;

    if-eqz v2, :cond_12

    invoke-virtual {v2}, Lne5;->cancel()V

    :cond_12
    const/4 v2, 0x0

    iput-object v2, v0, Lkol;->i:Lne5;

    iget-object v2, v0, Lkol;->k:Ljava/util/LinkedHashSet;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lacl;

    iget-object v5, v0, Lkol;->j:Ldeg;

    invoke-virtual {v5, v4}, Ldeg;->b(Lacl;)V

    goto :goto_1b

    :cond_2d
    invoke-interface {v2}, Ljava/util/Set;->clear()V

    iget-object v2, v0, Lkol;->e:Lhol;

    iget-object v2, v2, Lhol;->a:Lfol;

    iget-object v2, v2, Lfol;->a:Ljava/lang/String;

    iget-object v3, v1, Lfol;->a:Ljava/lang/String;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    new-instance v3, Lhol;

    sget-object v4, Lvnl;->a:Lvnl;

    invoke-direct {v3, v1, v4}, Lhol;-><init>(Lfol;Lbwg;)V

    iput-object v3, v0, Lkol;->e:Lhol;

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->d:Lrxj;

    iget v3, v1, Lrxj;->a:I

    if-lez v3, :cond_131

    iget v1, v1, Lrxj;->b:I

    if-lez v1, :cond_131

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->a:Ljsc;

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v3

    iget-object v3, v3, Lcyj;->d:Lrxj;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, v3, Lrxj;->a:I

    sget-object v4, Ljsc;->c:Lixh;

    iget-object v5, v0, Lkol;->a:Landroid/content/Context;

    invoke-virtual {v4, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result v4

    if-ge v3, v4, :cond_71

    iget-object v1, v1, Ljsc;->a:Lshf;

    goto :goto_73

    :cond_71
    iget-object v1, v1, Ljsc;->b:Lshf;

    :goto_73
    iget-object v3, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v3, [Ldol;

    iget-object v4, v0, Lkol;->e:Lhol;

    iget-object v4, v4, Lhol;->e:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v4, :cond_fe

    sget-object v1, Ldol;->e:Ldol;

    invoke-static {v1, v3}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_95

    invoke-virtual {v0, v7}, Lkol;->g(Z)V

    goto :goto_fa

    :cond_95
    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->g:Lqxj;

    iget-object v1, v1, Lqxj;->a:Lb8h;

    invoke-virtual {v1, v5}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    new-instance v8, Lir;

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->b:Ly7h;

    invoke-virtual {v1, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->g:Lqxj;

    iget-object v1, v1, Lqxj;->b:Lcxh;

    invoke-virtual {v1, v5}, Lcxh;->a(Landroid/content/Context;)I

    move-result v10

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->g:Lqxj;

    iget-object v1, v1, Lqxj;->d:Lgxh;

    invoke-virtual {v1, v5}, Lcxh;->a(Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->g:Lqxj;

    iget-object v1, v1, Lqxj;->e:Lixh;

    invoke-virtual {v1, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result v12

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v1

    iget-object v1, v1, Lcyj;->g:Lqxj;

    iget-object v1, v1, Lqxj;->c:Lcxh;

    invoke-virtual {v1, v5}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {v14, v1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    new-instance v15, Lfr;

    invoke-virtual {v14}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v14}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-direct {v15, v1, v2, v6}, Lfr;-><init>(IIB)V

    const/16 v16, 0x0

    const/16 v17, 0x90

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v17}, Lir;-><init>(IIIIILandroid/graphics/drawable/Drawable;Ler;Lgr;I)V

    sget-object v1, Lynl;->a:Lynl;

    invoke-virtual {v0, v8, v1}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    :goto_fa
    invoke-virtual {v0, v3, v7}, Lkol;->b([Ldol;I)V

    return-void

    :cond_fe
    if-nez v2, :cond_112

    iget-object v2, v0, Lkol;->c:Lkotlin/jvm/functions/Function1;

    sget-object v3, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    invoke-interface {v2, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lp7l;

    const/16 v3, 0xd

    invoke-direct {v2, v0, v3}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v6, v2}, Lkol;->f(ZLkotlin/jvm/functions/Function0;)V

    goto :goto_115

    :cond_112
    invoke-virtual {v0}, Lkol;->c()V

    :goto_115
    iget-object v2, v0, Lkol;->e:Lhol;

    iget-object v2, v2, Lhol;->d:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_12a

    iget-object v1, v1, Lshf;->b:Ljava/lang/Object;

    check-cast v1, [Ldol;

    goto :goto_12e

    :cond_12a
    iget-object v1, v1, Lshf;->c:Ljava/lang/Object;

    check-cast v1, [Ldol;

    :goto_12e
    invoke-virtual {v0, v1, v7}, Lkol;->b([Ldol;I)V

    :cond_131
    return-void
.end method
