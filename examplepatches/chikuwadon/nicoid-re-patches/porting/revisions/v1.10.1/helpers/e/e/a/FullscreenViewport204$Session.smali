.class final Le/e/a/FullscreenViewport204$Session;
.super Ljava/lang/Object;
.source "FullscreenViewport204.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport204;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Session"
.end annotation


# instance fields
.field activity:Landroid/app/Activity;

.field cutout:I

.field decor:Landroid/view/View;

.field flags:I

.field final saved:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport204$Saved;",
            ">;"
        }
    .end annotation
.end field

.field final sizes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field windowFlags:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport204$Session;->saved:Ljava/util/Map;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport204$Session;->sizes:Ljava/util/Map;

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/FullscreenViewport204$Session;->cutout:I

    .line 42
    return-void
.end method

.method synthetic constructor <init>(Le/e/a/FullscreenViewport204$Session;)V
    .registers 2

    .line 42
    invoke-direct {p0}, Le/e/a/FullscreenViewport204$Session;-><init>()V

    return-void
.end method


# virtual methods
.method commentBounds(Landroid/view/View;)V
    .registers 13

    .line 54
    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e.e.a.t"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1c

    const-string v1, "e.e.a.u"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_98

    :cond_1c
    invoke-virtual {p0, p1}, Le/e/a/FullscreenViewport204$Session;->save(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    if-eqz v0, :cond_29

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    :cond_29
    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, p0

    move-object v4, p1

    invoke-virtual/range {v3 .. v9}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-long v3, v0

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    int-to-long v5, v1

    const-wide v7, 0xffffffffL

    and-long/2addr v5, v7

    or-long/2addr v3, v5

    iget-object v5, p0, Le/e/a/FullscreenViewport204$Session;->sizes:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    if-lez v0, :cond_98

    if-lez v1, :cond_98

    if-eqz v5, :cond_5d

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v5, v5, v3

    if-eqz v5, :cond_98

    :cond_5d
    :try_start_5d
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "a"

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v9, v8, v2

    sget-object v9, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x1

    aput-object v9, v8, v10

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    int-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v6, v2

    int-to-float v0, v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v6, v10

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->sizes:Ljava/util/Map;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_8f} :catch_90

    goto :goto_98

    :catch_90
    move-exception v0

    const-string v1, "nicoid-layout"

    const-string v3, "Cannot update comment viewport"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_98
    :goto_98
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_af

    check-cast p1, Landroid/view/ViewGroup;

    :goto_9e
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v2, v0, :cond_a5

    goto :goto_af

    :cond_a5
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/FullscreenViewport204$Session;->commentBounds(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_9e

    :cond_af
    :goto_af
    return-void
.end method

.method fit(Landroid/view/View;IIIIZ)V
    .registers 22

    .line 46
    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    if-eqz v0, :cond_e8

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    if-nez v5, :cond_14

    goto/16 :goto_e8

    :cond_14
    invoke-virtual/range {p0 .. p1}, Le/e/a/FullscreenViewport204$Session;->save(Landroid/view/View;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    # invokes: Le/e/a/FullscreenViewport204;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v5}, Le/e/a/FullscreenViewport204;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iput v1, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v2, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 47
    iget v7, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-ne v7, v1, :cond_2f

    iget v1, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v1, v2, :cond_2f

    move v1, v9

    goto :goto_30

    :cond_2f
    move v1, v8

    .line 48
    :goto_30
    instance-of v2, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_64

    move-object v2, v6

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-nez v5, :cond_49

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-nez v5, :cond_49

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v5, v3, :cond_49

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-ne v5, v4, :cond_49

    move v5, v9

    goto :goto_4a

    :cond_49
    move v5, v8

    :goto_4a
    or-int/2addr v1, v5

    invoke-virtual {v2, v9, v3, v9, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v3

    if-nez v3, :cond_5c

    invoke-virtual {v2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v3

    if-nez v3, :cond_5c

    move v3, v9

    goto :goto_5d

    :cond_5c
    move v3, v8

    :goto_5d
    or-int/2addr v1, v3

    invoke-virtual {v2, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v2, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 49
    :cond_64
    instance-of v2, v6, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v2, :cond_c7

    move-object v2, v6

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v3

    invoke-virtual {v3}, [I->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    const/16 v4, 0xd

    new-array v5, v4, [I

    const/4 v7, 0x3

    aput v7, v5, v9

    const/4 v7, 0x2

    aput v7, v5, v8

    aput v8, v5, v7

    const/4 v7, 0x4

    const/4 v10, 0x6

    aput v10, v5, v7

    const/4 v7, 0x5

    const/16 v11, 0x8

    aput v11, v5, v7

    aput v7, v5, v10

    const/4 v7, 0x7

    aput v7, v5, v7

    aput v4, v5, v11

    const/16 v7, 0xf

    const/16 v10, 0x9

    aput v7, v5, v10

    const/16 v7, 0xe

    const/16 v11, 0xa

    aput v7, v5, v11

    const/16 v7, 0xb

    aput v11, v5, v7

    const/16 v12, 0xc

    aput v12, v5, v12

    move v13, v9

    :goto_a6
    if-lt v13, v4, :cond_bf

    if-eqz p6, :cond_ab

    move v11, v12

    :cond_ab
    invoke-virtual {v2, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v2, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v2, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v2

    invoke-static {v3, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    xor-int/2addr v2, v8

    or-int/2addr v1, v2

    goto :goto_c7

    :cond_bf
    aget v14, v5, v13

    invoke-virtual {v2, v14}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    add-int/lit8 v13, v13, 0x1

    goto :goto_a6

    .line 50
    :cond_c7
    :goto_c7
    if-eqz v1, :cond_cc

    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    :cond_cc
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    if-nez v1, :cond_e4

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    if-nez v1, :cond_e4

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    if-nez v1, :cond_e4

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    if-eqz v1, :cond_e7

    :cond_e4
    invoke-virtual {v0, v9, v9, v9, v9}, Landroid/view/View;->setPadding(IIII)V

    .line 52
    :cond_e7
    return-void

    .line 46
    :cond_e8
    :goto_e8
    return-void
.end method

.method save(Landroid/view/View;)V
    .registers 4

    .line 44
    if-eqz p1, :cond_14

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->saved:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Le/e/a/FullscreenViewport204$Session;->saved:Ljava/util/Map;

    new-instance v1, Le/e/a/FullscreenViewport204$Saved;

    invoke-direct {v1, p1}, Le/e/a/FullscreenViewport204$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    return-void
.end method

.method timeline(Landroid/view/View;)V
    .registers 14

    .line 53
    instance-of v0, p1, Landroid/widget/SeekBar;

    const/4 v1, 0x0

    if-eqz v0, :cond_76

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object v2, p1

    :goto_a
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-nez v3, :cond_f

    :cond_e
    :goto_e
    goto :goto_5e

    :cond_f
    check-cast v0, Landroid/view/View;

    instance-of v3, v0, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_43

    move-object v3, v0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    if-nez v3, :cond_43

    invoke-virtual {p0, v2}, Le/e/a/FullscreenViewport204$Session;->save(Landroid/view/View;)V

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    # invokes: Le/e/a/FullscreenViewport204;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {p1}, Le/e/a/FullscreenViewport204;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_e

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v3, 0x3f800000    # 1.0f

    if-nez v0, :cond_3b

    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v0, v0, v3

    if-eqz v0, :cond_e

    :cond_3b
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v3, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_5e

    :cond_43
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "controller"

    const-string v6, "id"

    invoke-virtual {v3, v5, v6, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-ne v2, v3, :cond_5f

    goto :goto_e

    :goto_5e
    return-void

    :cond_5f
    const/4 v6, -0x1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v7, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, p0

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Le/e/a/FullscreenViewport204$Session;->fit(Landroid/view/View;IIIIZ)V

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    move-object v11, v2

    move-object v2, v0

    move-object v0, v11

    goto :goto_a

    :cond_76
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8d

    check-cast p1, Landroid/view/ViewGroup;

    :goto_7c
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v1, v0, :cond_83

    goto :goto_8d

    :cond_83
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/FullscreenViewport204$Session;->timeline(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7c

    :cond_8d
    :goto_8d
    return-void
.end method
