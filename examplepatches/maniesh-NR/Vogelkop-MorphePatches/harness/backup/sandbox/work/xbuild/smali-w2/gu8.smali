.class public abstract Lgu8;
.super Llx8;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Ly9n;
.implements Lo0c;


# instance fields
.field public final d:Lr9i;

.field public final e:Landroid/widget/TextView;

.field public final f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final g:Landroid/widget/ImageView;

.field public final h:Landroid/widget/TextView;

.field public final i:Lov0;

.field public final j:Lga6;

.field public final k:Lp0c;

.field public l:Ljava/util/Locale;


# direct methods
.method public constructor <init>(Landroid/view/View;Lr9i;Lp0c;)V
    .registers 6

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lgu8;->l:Ljava/util/Locale;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object p2, p0, Lgu8;->d:Lr9i;

    const p2, 0x7f0a0458

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lgu8;->e:Landroid/widget/TextView;

    const p2, 0x7f0a0466

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p2, p0, Lgu8;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p0}, Lgu8;->f0()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lgu8;->g:Landroid/widget/ImageView;

    const v0, 0x7f0a0465

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lgu8;->h:Landroid/widget/TextView;

    const v0, 0x7f0a0463

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4a

    invoke-static {v0}, Lov0;->d(Landroid/view/View;)Lov0;

    move-result-object v0

    goto :goto_4b

    :cond_4a
    move-object v0, v1

    :goto_4b
    iput-object v0, p0, Lgu8;->i:Lov0;

    if-eqz p2, :cond_53

    invoke-static {p2, p1}, Lgu8;->i0(Landroid/view/View;Landroid/view/View;)Lga6;

    move-result-object v1

    :cond_53
    iput-object v1, p0, Lgu8;->j:Lga6;

    iput-object p3, p0, Lgu8;->k:Lp0c;

    iget-object p1, p3, Lp0c;->c:Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p3, Lp0c;->d:Ll0c;

    invoke-virtual {p0, p1}, Lgu8;->p(Ll0c;)V

    return-void
.end method

.method public static g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lgu8;->h0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;ZLd94;)V

    return-void
.end method

.method public static h0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;ZLd94;)V
    .registers 9

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p0, 0x0

    :cond_7
    sget-object v0, Lyne;->b:Ldeg;

    invoke-virtual {v0, p0}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object p0

    if-eqz p3, :cond_13

    const/4 p3, 0x3

    invoke-virtual {p0, p3}, Ldwh;->l(I)V

    :cond_13
    instance-of p3, p1, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v0, 0x0

    if-eqz p3, :cond_21

    move-object p3, p1

    check-cast p3, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p3}, Lcom/opera/android/custom_views/StylingImageView;->d()Z

    move-result p3

    if-nez p3, :cond_4d

    :cond_21
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-eqz p3, :cond_4d

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p3

    if-lez v1, :cond_4d

    if-lez p3, :cond_4d

    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v3, Landroid/graphics/drawable/shapes/RectShape;

    invoke-direct {v3}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    invoke-virtual {v2, p3}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p3

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0, v2}, Ldwh;->k(Landroid/graphics/drawable/ShapeDrawable;)V

    :cond_4d
    iget-object p2, p2, Lga6;->b:Ljava/lang/Object;

    check-cast p2, Landroid/graphics/Point;

    iget p3, p2, Landroid/graphics/Point;->x:I

    const/4 v1, 0x1

    if-lez p3, :cond_5b

    iget v2, p2, Landroid/graphics/Point;->y:I

    if-lez v2, :cond_5b

    move v0, v1

    :cond_5b
    if-nez v0, :cond_60

    iput-boolean v1, p0, Ldwh;->d:Z

    goto :goto_67

    :cond_60
    iget p2, p2, Landroid/graphics/Point;->y:I

    iget-object v0, p0, Ldwh;->b:Lgvh;

    invoke-virtual {v0, p3, p2}, Lgvh;->b(II)V

    :goto_67
    invoke-virtual {p0}, Ldwh;->a()V

    invoke-virtual {p0, p1, p4}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    return-void
.end method

.method public static i0(Landroid/view/View;Landroid/view/View;)Lga6;
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    instance-of v1, p0, Landroid/widget/ImageView;

    if-eqz v1, :cond_f

    check-cast p0, Landroid/widget/ImageView;

    invoke-static {p0, p1}, Lga6;->m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;

    move-result-object p0

    goto :goto_14

    :cond_f
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Lga6;->j(Landroid/view/View;Landroid/view/View;Z)Lga6;

    move-result-object p0

    :goto_14
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget v0, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget-object v0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Point;

    iget v1, v0, Landroid/graphics/Point;->x:I

    if-lez v1, :cond_2d

    iget v2, v0, Landroid/graphics/Point;->y:I

    if-lez v2, :cond_2d

    return-object p0

    :cond_2d
    if-lez v1, :cond_31

    move p1, v1

    goto :goto_39

    :cond_31
    iget p0, v0, Landroid/graphics/Point;->y:I

    if-lez p0, :cond_39

    shl-int/lit8 p0, p0, 0x4

    div-int/lit8 p1, p0, 0x9

    :cond_39
    :goto_39
    mul-int/lit8 p0, p1, 0x9

    div-int/lit8 p0, p0, 0x10

    new-instance v0, Lga6;

    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, p1, p0}, Landroid/graphics/Point;-><init>(II)V

    const/16 p0, 0xb

    invoke-direct {v0, v1, p0}, Lga6;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public static k0(Landroid/widget/TextView;Lj82;Lr9i;)V
    .registers 11

    if-nez p0, :cond_3

    return-void

    :cond_3
    move-object v0, p1

    check-cast v0, Lpue;

    iget-object v0, v0, Lj82;->c:Loqe;

    iget-object p1, p1, Lj82;->d:Ljava/lang/String;

    const-string v1, "topnews"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_28

    instance-of v1, v0, Lmsh;

    if-nez v1, :cond_1a

    move-object v1, v3

    goto :goto_1f

    :cond_1a
    move-object v1, v0

    check-cast v1, Lmsh;

    iget-object v1, v1, Lmsh;->y:Ljava/lang/String;

    :goto_1f
    if-eqz v1, :cond_28

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_28
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v1, v0

    check-cast v1, Lmsh;

    iget-object v4, v1, Lmsh;->r:Ljava/lang/String;

    sget-object v5, Laik;->a:[Ljava/lang/String;

    const-string v5, ""

    if-nez v4, :cond_37

    move-object v4, v5

    :cond_37
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    const/16 v7, 0x8

    if-nez v6, :cond_9b

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9b

    iget-object p1, p2, Lr9i;->b:Ljava/lang/Object;

    check-cast p1, Luqe;

    iget-object p2, v1, Lmsh;->r:Ljava/lang/String;

    if-nez p2, :cond_4e

    move-object p2, v5

    :cond_4e
    iget-object v1, v0, Loqe;->a:Ljava/lang/String;

    if-nez v1, :cond_8a

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_87

    invoke-virtual {p1}, Luqe;->h()Lc6j;

    move-result-object p1

    iget-object p1, p1, Lc6j;->b:Ljava/lang/Object;

    check-cast p1, Lnre;

    if-eqz p1, :cond_87

    iget-object p1, p1, Lnre;->d:Ljava/util/List;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_6b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_81

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lyqe;

    iget-object v4, v4, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6b

    move-object v3, v1

    :cond_81
    check-cast v3, Lyqe;

    if-eqz v3, :cond_87

    iget-object v5, v3, Lyqe;->b:Ljava/lang/String;

    :cond_87
    iput-object v5, v0, Loqe;->a:Ljava/lang/String;

    move-object v1, v5

    :cond_8a
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_94

    invoke-virtual {p0, v7}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_94
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_9b
    invoke-virtual {p0, v7}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public static l0(Lov0;Loqe;Lr9i;Landroid/view/View$OnClickListener;)V
    .registers 11

    if-nez p0, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Lmsh;

    iget-object p1, p1, Lmsh;->z:Lxlg;

    if-nez p1, :cond_12

    const/4 p1, 0x0

    goto :goto_18

    :cond_12
    iget-wide p1, p1, Lxlg;->h:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    :goto_18
    if-nez p1, :cond_20

    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_20
    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3c

    div-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    rem-long/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v1, "%d:%02d"

    invoke-static {p2, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public T(Landroid/view/View;II)V
    .registers 10

    iget-object p1, p0, Lab2;->b:Lja2;

    move-object v1, p1

    check-cast v1, Lj82;

    if-eqz v1, :cond_33

    iget-object v2, p0, Lgu8;->i:Lov0;

    if-eqz v2, :cond_17

    iget-object v0, p0, Lgu8;->d:Lr9i;

    invoke-virtual {p0}, Llx8;->c0()Lcmg;

    move-result-object v3

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lr9i;->c(Lj82;Lov0;Lcmg;II)V

    goto :goto_19

    :cond_17
    move v4, p2

    move v5, p3

    :goto_19
    iget-object p0, p0, Lgu8;->d:Lr9i;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v5}, Lr9i;->K(II)Z

    move-result p1

    if-eqz p1, :cond_29

    const/4 p1, 0x1

    invoke-virtual {p0, v1, p1}, Lr9i;->O(Lj82;Z)V

    return-void

    :cond_29
    const/16 p1, 0x21

    if-le v5, p1, :cond_33

    if-gt v4, p1, :cond_33

    const/4 p1, 0x0

    invoke-virtual {p0, v1, p1}, Lr9i;->O(Lj82;Z)V

    :cond_33
    return-void
.end method

.method public V(Lja2;Z)V
    .registers 28

    move-object/from16 v0, p0

    if-eqz p2, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0}, Lgu8;->e0()Loqe;

    move-result-object v1

    iget-object v2, v0, Lgu8;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/4 v3, 0x1

    if-eqz v2, :cond_48

    iget-object v4, v0, Lgu8;->d:Lr9i;

    invoke-virtual {v4, v1}, Lr9i;->J(Loqe;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;->h:Ljava/lang/CharSequence;

    new-instance v5, Lyog;

    invoke-virtual {v2}, Landroid/widget/TextView;->getTextMetricsParams()Landroid/text/PrecomputedText$Params;

    move-result-object v6

    invoke-direct {v5, v6}, Lyog;-><init>(Landroid/text/PrecomputedText$Params;)V

    new-instance v6, Lzog;

    new-instance v7, Lsxd;

    invoke-direct {v7}, Lsxd;-><init>()V

    iput-object v5, v7, Lsxd;->b:Ljava/lang/Object;

    iput-object v4, v7, Lsxd;->c:Ljava/lang/Object;

    invoke-direct {v6, v7}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    sget-object v4, Lapg;->c:Ljava/lang/Object;

    monitor-enter v4

    :try_start_30
    sget-object v5, Lapg;->d:Ljava/util/concurrent/ExecutorService;

    if-nez v5, :cond_3a

    invoke-static {v3}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    sput-object v5, Lapg;->d:Ljava/util/concurrent/ExecutorService;

    :cond_3a
    monitor-exit v4
    :try_end_3b
    .catchall {:try_start_30 .. :try_end_3b} :catchall_46

    invoke-interface {v5, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iput-object v6, v2, Lyq1;->f:Lzog;

    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    goto :goto_48

    :goto_44
    :try_start_44
    monitor-exit v4
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_46

    throw v0

    :catchall_46
    move-exception v0

    goto :goto_44

    :cond_48
    :goto_48
    iget-object v2, v0, Lgu8;->h:Landroid/widget/TextView;

    if-eqz v2, :cond_201

    invoke-virtual {v0}, Lgu8;->e0()Loqe;

    move-result-object v4

    iget-object v5, v0, Lgu8;->d:Lr9i;

    invoke-virtual {v5, v4}, Lr9i;->H(Loqe;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lgu8;->d:Lr9i;

    invoke-virtual {v0}, Lgu8;->e0()Loqe;

    move-result-object v6

    invoke-virtual {v5, v6}, Lr9i;->I(Loqe;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-nez v7, :cond_6a

    const-string v3, ""

    goto/16 :goto_1da

    :cond_6a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-object v9, v0, Lgu8;->l:Ljava/util/Locale;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v10

    sget-object v11, Lvsh;->a:Lua1;

    sget-object v11, Landroid/icu/text/DisplayContext;->CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE:Landroid/icu/text/DisplayContext;

    invoke-static {v9}, Landroid/icu/util/ULocale;->forLocale(Ljava/util/Locale;)Landroid/icu/util/ULocale;

    move-result-object v12

    invoke-virtual {v10}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/icu/util/TimeZone;->getTimeZone(Ljava/lang/String;)Landroid/icu/util/TimeZone;

    move-result-object v10

    if-nez v10, :cond_8a

    invoke-static {}, Landroid/icu/util/TimeZone;->getDefault()Landroid/icu/util/TimeZone;

    move-result-object v10

    :cond_8a
    invoke-virtual {v10}, Landroid/icu/util/TimeZone;->freeze()Landroid/icu/util/TimeZone;

    sub-long v13, v7, v5

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    move-result-wide v13

    cmp-long v15, v7, v5

    const/16 v16, 0x0

    if-ltz v15, :cond_9b

    move v15, v3

    goto :goto_9d

    :cond_9b
    move/from16 v15, v16

    :goto_9d
    sget-object v3, Landroid/icu/text/RelativeDateTimeFormatter$Style;->LONG:Landroid/icu/text/RelativeDateTimeFormatter$Style;

    if-eqz v15, :cond_a4

    sget-object v17, Landroid/icu/text/RelativeDateTimeFormatter$Direction;->LAST:Landroid/icu/text/RelativeDateTimeFormatter$Direction;

    goto :goto_a6

    :cond_a4
    sget-object v17, Landroid/icu/text/RelativeDateTimeFormatter$Direction;->NEXT:Landroid/icu/text/RelativeDateTimeFormatter$Direction;

    :goto_a6
    const-wide/32 v18, 0x36ee80

    cmp-long v20, v13, v18

    move-wide/from16 v21, v13

    const/4 v13, 0x2

    if-gez v20, :cond_bf

    const-wide/32 v7, 0xea60

    div-long v7, v21, v7

    long-to-int v7, v7

    sget-object v8, Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;->MINUTES:Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;

    :cond_b8
    :goto_b8
    move-object/from16 v10, v17

    const/4 v14, 0x0

    const/16 v16, 0x1

    goto/16 :goto_138

    :cond_bf
    const-wide/32 v23, 0x5265c00

    cmp-long v20, v21, v23

    if-gez v20, :cond_cc

    div-long v7, v21, v18

    long-to-int v7, v7

    sget-object v8, Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;->HOURS:Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;

    goto :goto_b8

    :cond_cc
    const-wide/32 v18, 0x240c8400

    cmp-long v18, v21, v18

    if-gez v18, :cond_153

    invoke-virtual {v10, v7, v8}, Landroid/icu/util/TimeZone;->getOffset(J)I

    move-result v11

    move/from16 v18, v15

    int-to-long v14, v11

    add-long/2addr v7, v14

    div-long v7, v7, v23

    long-to-int v7, v7

    const v8, 0x253d8c    # 3.419992E-39f

    add-int/2addr v7, v8

    invoke-virtual {v10, v5, v6}, Landroid/icu/util/TimeZone;->getOffset(J)I

    move-result v10

    int-to-long v10, v10

    add-long/2addr v10, v5

    div-long v10, v10, v23

    long-to-int v10, v10

    add-int/2addr v10, v8

    sub-int/2addr v7, v10

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    sget-object v8, Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;->DAYS:Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;

    if-ne v7, v13, :cond_129

    sget-object v10, Lvsh;->a:Lua1;

    if-eqz v18, :cond_10c

    monitor-enter v10

    :try_start_fa
    invoke-static {v12, v3}, Lvsh;->a(Landroid/icu/util/ULocale;Landroid/icu/text/RelativeDateTimeFormatter$Style;)Landroid/icu/text/RelativeDateTimeFormatter;

    move-result-object v11

    sget-object v14, Landroid/icu/text/RelativeDateTimeFormatter$Direction;->LAST_2:Landroid/icu/text/RelativeDateTimeFormatter$Direction;

    sget-object v15, Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;->DAY:Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;

    invoke-virtual {v11, v14, v15}, Landroid/icu/text/RelativeDateTimeFormatter;->format(Landroid/icu/text/RelativeDateTimeFormatter$Direction;Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;)Ljava/lang/String;

    move-result-object v11

    monitor-exit v10

    goto :goto_11a

    :goto_108
    monitor-exit v10
    :try_end_109
    .catchall {:try_start_fa .. :try_end_109} :catchall_10a

    throw v0

    :catchall_10a
    move-exception v0

    goto :goto_108

    :cond_10c
    monitor-enter v10

    :try_start_10d
    invoke-static {v12, v3}, Lvsh;->a(Landroid/icu/util/ULocale;Landroid/icu/text/RelativeDateTimeFormatter$Style;)Landroid/icu/text/RelativeDateTimeFormatter;

    move-result-object v11

    sget-object v14, Landroid/icu/text/RelativeDateTimeFormatter$Direction;->NEXT_2:Landroid/icu/text/RelativeDateTimeFormatter$Direction;

    sget-object v15, Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;->DAY:Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;

    invoke-virtual {v11, v14, v15}, Landroid/icu/text/RelativeDateTimeFormatter;->format(Landroid/icu/text/RelativeDateTimeFormatter$Direction;Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;)Ljava/lang/String;

    move-result-object v11

    monitor-exit v10
    :try_end_11a
    .catchall {:try_start_10d .. :try_end_11a} :catchall_127

    :goto_11a
    if-eqz v11, :cond_b8

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_b8

    move-object v3, v11

    goto/16 :goto_1bf

    :goto_125
    :try_start_125
    monitor-exit v10
    :try_end_126
    .catchall {:try_start_125 .. :try_end_126} :catchall_127

    throw v0

    :catchall_127
    move-exception v0

    goto :goto_125

    :cond_129
    const/4 v11, 0x1

    if-ne v7, v11, :cond_131

    sget-object v14, Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;->DAY:Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;

    :goto_12e
    move-object/from16 v10, v17

    goto :goto_138

    :cond_131
    if-nez v7, :cond_b8

    sget-object v14, Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;->DAY:Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;

    sget-object v17, Landroid/icu/text/RelativeDateTimeFormatter$Direction;->THIS:Landroid/icu/text/RelativeDateTimeFormatter$Direction;

    goto :goto_12e

    :goto_138
    sget-object v15, Lvsh;->a:Lua1;

    monitor-enter v15

    :try_start_13b
    invoke-static {v12, v3}, Lvsh;->a(Landroid/icu/util/ULocale;Landroid/icu/text/RelativeDateTimeFormatter$Style;)Landroid/icu/text/RelativeDateTimeFormatter;

    move-result-object v3

    if-eqz v16, :cond_149

    int-to-double v11, v7

    invoke-virtual {v3, v11, v12, v10, v8}, Landroid/icu/text/RelativeDateTimeFormatter;->format(DLandroid/icu/text/RelativeDateTimeFormatter$Direction;Landroid/icu/text/RelativeDateTimeFormatter$RelativeUnit;)Ljava/lang/String;

    move-result-object v3

    monitor-exit v15

    goto/16 :goto_1bf

    :cond_149
    invoke-virtual {v3, v10, v14}, Landroid/icu/text/RelativeDateTimeFormatter;->format(Landroid/icu/text/RelativeDateTimeFormatter$Direction;Landroid/icu/text/RelativeDateTimeFormatter$AbsoluteUnit;)Ljava/lang/String;

    move-result-object v3

    monitor-exit v15

    goto :goto_1bf

    :goto_14f
    monitor-exit v15
    :try_end_150
    .catchall {:try_start_13b .. :try_end_150} :catchall_151

    throw v0

    :catchall_151
    move-exception v0

    goto :goto_14f

    :cond_153
    new-instance v3, Landroid/icu/util/GregorianCalendar;

    invoke-direct {v3, v10, v12}, Landroid/icu/util/GregorianCalendar;-><init>(Landroid/icu/util/TimeZone;Landroid/icu/util/ULocale;)V

    invoke-virtual {v3, v5, v6}, Landroid/icu/util/Calendar;->setTimeInMillis(J)V

    sget-object v7, Lkh6;->a:Lua1;

    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result v8

    invoke-virtual {v3, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result v7

    if-ne v8, v7, :cond_179

    invoke-virtual {v3, v13}, Landroid/icu/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v3, v13}, Landroid/icu/util/Calendar;->get(I)I

    move-result v8

    if-ne v7, v8, :cond_179

    const/4 v7, 0x5

    invoke-virtual {v3, v7}, Landroid/icu/util/Calendar;->get(I)I

    invoke-virtual {v3, v7}, Landroid/icu/util/Calendar;->get(I)I

    :cond_179
    invoke-virtual {v3, v13}, Landroid/icu/util/Calendar;->get(I)I

    invoke-virtual {v3, v13}, Landroid/icu/util/Calendar;->get(I)I

    const-string v7, "yMMMd"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v10, "yMMMd\t"

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v10, "\t"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/icu/util/Calendar;->getTimeZone()Landroid/icu/util/TimeZone;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v10, Lkh6;->a:Lua1;

    monitor-enter v10

    :try_start_19e
    invoke-virtual {v10, v8}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/icu/text/DateFormat;

    if-nez v14, :cond_1b7

    invoke-static {v12}, Landroid/icu/text/DateTimePatternGenerator;->getInstance(Landroid/icu/util/ULocale;)Landroid/icu/text/DateTimePatternGenerator;

    move-result-object v14

    new-instance v15, Landroid/icu/text/SimpleDateFormat;

    invoke-virtual {v14, v7}, Landroid/icu/text/DateTimePatternGenerator;->getBestPattern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v15, v7, v12}, Landroid/icu/text/SimpleDateFormat;-><init>(Ljava/lang/String;Landroid/icu/util/ULocale;)V

    invoke-virtual {v10, v8, v15}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v14, v15

    :cond_1b7
    invoke-virtual {v14, v11}, Landroid/icu/text/DateFormat;->setContext(Landroid/icu/text/DisplayContext;)V

    invoke-virtual {v14, v3}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    monitor-exit v10
    :try_end_1bf
    .catchall {:try_start_19e .. :try_end_1bf} :catchall_1ff

    :goto_1bf
    if-nez v3, :cond_1da

    invoke-static {v5, v6}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result v3

    if-eqz v3, :cond_1cd

    const/4 v3, 0x3

    invoke-static {v3, v9}, Ljava/text/DateFormat;->getTimeInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v3

    goto :goto_1d1

    :cond_1cd
    invoke-static {v13, v9}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v3

    :goto_1d1
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    :cond_1da
    :goto_1da
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1e2

    move-object v4, v3

    goto :goto_1f9

    :cond_1e2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1f9

    iget-object v5, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f140757

    filled-new-array {v4, v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v6, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :cond_1f9
    :goto_1f9
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_201

    :goto_1fd
    :try_start_1fd
    monitor-exit v10
    :try_end_1fe
    .catchall {:try_start_1fd .. :try_end_1fe} :catchall_1ff

    throw v0

    :catchall_1ff
    move-exception v0

    goto :goto_1fd

    :cond_201
    :goto_201
    iget-object v2, v0, Lgu8;->e:Landroid/widget/TextView;

    invoke-virtual {v0}, Lab2;->a0()Lja2;

    move-result-object v3

    check-cast v3, Lj82;

    iget-object v4, v0, Lgu8;->d:Lr9i;

    invoke-static {v2, v3, v4}, Lgu8;->k0(Landroid/widget/TextView;Lj82;Lr9i;)V

    iget-object v2, v0, Lgu8;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v3, v0, Lgu8;->e:Landroid/widget/TextView;

    if-eqz v2, :cond_22e

    if-eqz v3, :cond_22e

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_221

    const/high16 v3, 0x41200000    # 10.0f

    goto :goto_223

    :cond_221
    const/high16 v3, 0x40000000    # 2.0f

    :goto_223
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-static {v3, v2}, Lq9n;->C(ILandroid/view/View;)V

    :cond_22e
    iget-object v2, v0, Lgu8;->i:Lov0;

    iget-object v3, v0, Lgu8;->d:Lr9i;

    invoke-static {v2, v1, v3, v0}, Lgu8;->l0(Lov0;Loqe;Lr9i;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lgu8;->j0()V

    return-void
.end method

.method public Y()V
    .registers 2

    iget-object p0, p0, Lgu8;->g:Landroid/widget/ImageView;

    if-eqz p0, :cond_9

    sget-object v0, Lyne;->b:Ldeg;

    invoke-virtual {v0, p0}, Ldeg;->c(Landroid/widget/ImageView;)V

    :cond_9
    return-void
.end method

.method public e0()Loqe;
    .registers 1

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lj82;

    check-cast p0, Lpue;

    iget-object p0, p0, Lj82;->c:Loqe;

    return-object p0
.end method

.method public f0()I
    .registers 1

    const p0, 0x7f0a045b

    return p0
.end method

.method public j0()V
    .registers 4

    iget-object v0, p0, Lgu8;->g:Landroid/widget/ImageView;

    if-eqz v0, :cond_15

    iget-object v1, p0, Lgu8;->j:Lga6;

    if-eqz v1, :cond_15

    iget-object v2, p0, Lgu8;->d:Lr9i;

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object p0

    invoke-virtual {v2, p0, v1}, Lr9i;->F(Loqe;Lga6;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0, v1}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_15
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lj82;

    if-eqz v0, :cond_1d

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v2, p0, Lgu8;->d:Lr9i;

    if-ne p1, v1, :cond_10

    invoke-virtual {v2, p0, v0}, Lr9i;->r(Llx8;Lj82;)V

    return-void

    :cond_10
    iget-object v1, p0, Lgu8;->i:Lov0;

    if-eqz v1, :cond_1d

    iget-object v1, v1, Lov0;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    if-ne p1, v1, :cond_1d

    invoke-virtual {v2, p0, v0}, Lr9i;->N(Llx8;Lj82;)V

    :cond_1d
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lgu8;->k:Lp0c;

    iget-object v0, v0, Lp0c;->c:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final p(Ll0c;)V
    .registers 2

    if-nez p1, :cond_7

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    goto :goto_b

    :cond_7
    invoke-virtual {p1}, Ll0c;->b()Ljava/util/Locale;

    move-result-object p1

    :goto_b
    iput-object p1, p0, Lgu8;->l:Ljava/util/Locale;

    return-void
.end method
