.class final Le/e/a/FullscreenViewport206$Session;
.super Ljava/lang/Object;
.source "FullscreenViewport206.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenViewport206;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Session"
.end annotation


# instance fields
.field activity:Landroid/app/Activity;

.field attachRoot:Landroid/view/View;

.field bottom:Landroid/view/View;

.field controller:Landroid/view/View;

.field cutout:I

.field decor:Landroid/view/View;

.field detach:Landroid/view/View$OnAttachStateChangeListener;

.field flags:I

.field final listeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Landroid/view/View$OnLayoutChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field final moved:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/FullscreenViewport206$Moved;",
            ">;"
        }
    .end annotation
.end field

.field final saved:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenViewport206$Saved;",
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

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport206$Session;->saved:Ljava/util/Map;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport206$Session;->sizes:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport206$Session;->listeners:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenViewport206$Session;->moved:Ljava/util/List;

    const/4 v0, -0x1

    iput v0, p0, Le/e/a/FullscreenViewport206$Session;->cutout:I

    .line 108
    return-void
.end method

.method synthetic constructor <init>(Le/e/a/FullscreenViewport206$Session;)V
    .registers 2

    .line 108
    invoke-direct {p0}, Le/e/a/FullscreenViewport206$Session;-><init>()V

    return-void
.end method


# virtual methods
.method bottomIcons()V
    .registers 13

    .line 120
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_7

    return-void

    :cond_7
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Le/e/a/FullscreenViewport206$Band;

    if-nez v1, :cond_1c

    new-instance v1, Le/e/a/FullscreenViewport206$Band;

    invoke-direct {v1, v0}, Le/e/a/FullscreenViewport206$Band;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 121
    :cond_1c
    iget-object v1, p0, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42200000    # 40.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Le/e/a/FullscreenViewport206$Session;->bottom:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x42300000    # 44.0f

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 122
    const/4 v3, 0x0

    move v4, v3

    :goto_44
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-lt v4, v5, :cond_4b

    .line 130
    return-void

    .line 123
    :cond_4b
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    # invokes: Le/e/a/FullscreenViewport206;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v6}, Le/e/a/FullscreenViewport206;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iget v7, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v8, 0x1

    if-ne v7, v2, :cond_65

    iget v7, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v7, v1, :cond_65

    move v7, v3

    goto :goto_66

    :cond_65
    move v7, v8

    :goto_66
    iput v2, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 124
    instance-of v9, v6, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v9, :cond_8f

    move-object v9, v6

    check-cast v9, Landroid/widget/LinearLayout$LayoutParams;

    iget v10, v9, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-nez v10, :cond_89

    iget v10, v9, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    if-nez v10, :cond_89

    iget v10, v9, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-nez v10, :cond_89

    iget v10, v9, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    if-nez v10, :cond_89

    iget v10, v9, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    if-nez v10, :cond_89

    move v8, v3

    :cond_89
    or-int/2addr v7, v8

    iput v11, v9, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v9, v3, v3, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 125
    :cond_8f
    if-eqz v7, :cond_94

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    :cond_94
    invoke-virtual {v5}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    if-nez v6, :cond_ac

    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    if-nez v6, :cond_ac

    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    if-nez v6, :cond_ac

    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    if-eqz v6, :cond_af

    :cond_ac
    invoke-virtual {v5, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 127
    :cond_af
    invoke-virtual {v5, v3}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v5, v3}, Landroid/view/View;->setMinimumHeight(I)V

    instance-of v6, v5, Landroid/widget/TextView;

    if-eqz v6, :cond_c2

    move-object v6, v5

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 128
    :cond_c2
    invoke-virtual {v5}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_d8

    instance-of v7, v6, Le/e/a/FullscreenViewport206$Glyph;

    if-nez v7, :cond_d8

    new-instance v7, Le/e/a/FullscreenViewport206$Glyph;

    # invokes: Le/e/a/FullscreenViewport206;->flatIcon(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    invoke-static {v5, v6}, Le/e/a/FullscreenViewport206;->access$1(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-direct {v7, v6}, Le/e/a/FullscreenViewport206$Glyph;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 122
    :cond_d8
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_44
.end method

.method capture(Landroid/view/View;)V
    .registers 4

    .line 131
    if-nez p1, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->moved:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_26

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_18

    return-void

    :cond_18
    invoke-virtual {p0, p1}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->moved:Ljava/util/List;

    new-instance v1, Le/e/a/FullscreenViewport206$Moved;

    invoke-direct {v1, p1}, Le/e/a/FullscreenViewport206$Moved;-><init>(Landroid/view/View;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenViewport206$Moved;

    iget-object v1, v1, Le/e/a/FullscreenViewport206$Moved;->view:Landroid/view/View;

    if-ne v1, p1, :cond_9

    return-void
.end method

.method commentBounds(Landroid/view/View;)V
    .registers 10

    .line 147
    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 148
    const-string v1, "e.e.a.t"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    const-string v1, "e.e.a.u"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 149
    :cond_1b
    invoke-virtual {p0, p1}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    if-eqz v0, :cond_28

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    :cond_28
    const/4 v3, -0x1

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v7}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    .line 150
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->listeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_47

    new-instance v0, Le/e/a/FullscreenViewport206$Session$2;

    invoke-direct {v0, p0}, Le/e/a/FullscreenViewport206$Session$2;-><init>(Le/e/a/FullscreenViewport206$Session;)V

    iget-object v1, p0, Le/e/a/FullscreenViewport206$Session;->listeners:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 151
    :cond_47
    invoke-virtual {p0, p1}, Le/e/a/FullscreenViewport206$Session;->sync(Landroid/view/View;)V

    .line 153
    :cond_4a
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_62

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_51
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_58

    goto :goto_62

    :cond_58
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Le/e/a/FullscreenViewport206$Session;->commentBounds(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_51

    .line 154
    :cond_62
    :goto_62
    return-void
.end method

.method fit(Landroid/view/View;IIIIZ)V
    .registers 22

    .line 112
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
    invoke-virtual/range {p0 .. p1}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    # invokes: Le/e/a/FullscreenViewport206;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v5}, Le/e/a/FullscreenViewport206;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iput v1, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v2, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 113
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

    .line 114
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

    .line 115
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

    .line 116
    :cond_c7
    :goto_c7
    if-eqz v1, :cond_cc

    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
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

    .line 118
    :cond_e7
    return-void

    .line 112
    :cond_e8
    :goto_e8
    return-void
.end method

.method overlay(Landroid/view/View;Landroid/view/ViewGroup;I)V
    .registers 9

    .line 133
    if-eqz p1, :cond_71

    if-nez p2, :cond_5

    goto :goto_71

    .line 134
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/16 v1, 0x53

    const/4 v2, -0x2

    const/4 v3, -0x1

    if-eq v0, p2, :cond_20

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p2, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    :cond_20
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 136
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    const/4 v4, 0x0

    if-ne v0, v3, :cond_43

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    if-ne v0, v2, :cond_43

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-ne v0, v1, :cond_43

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-nez v0, :cond_43

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-nez v0, :cond_43

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    if-nez v0, :cond_43

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    if-eq v0, p3, :cond_55

    :cond_43
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p2, v4, v4, v4, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p2, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    invoke-virtual {p2, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    :cond_55
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    if-nez p2, :cond_6d

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    if-nez p2, :cond_6d

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    if-nez p2, :cond_6d

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    if-eqz p2, :cond_70

    :cond_6d
    invoke-virtual {p1, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 138
    :cond_70
    return-void

    .line 133
    :cond_71
    :goto_71
    return-void
.end method

.method removeListeners()V
    .registers 4

    .line 145
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->listeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_11

    return-void

    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v2, v1}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    goto :goto_a
.end method

.method restoreParents()V
    .registers 7

    .line 140
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->moved:Ljava/util/List;

    new-instance v1, Le/e/a/FullscreenViewport206$Session$1;

    invoke-direct {v1, p0}, Le/e/a/FullscreenViewport206$Session$1;-><init>(Le/e/a/FullscreenViewport206$Session;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 141
    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->moved:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_17

    .line 142
    return-void

    .line 141
    :cond_17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenViewport206$Moved;

    iget-object v2, v1, Le/e/a/FullscreenViewport206$Moved;->view:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_34

    iget-object v2, v1, Le/e/a/FullscreenViewport206$Moved;->view:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iget-object v3, v1, Le/e/a/FullscreenViewport206$Moved;->view:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_34
    iget-object v2, v1, Le/e/a/FullscreenViewport206$Moved;->parent:Landroid/view/ViewGroup;

    iget-object v3, v1, Le/e/a/FullscreenViewport206$Moved;->view:Landroid/view/View;

    iget v4, v1, Le/e/a/FullscreenViewport206$Moved;->index:I

    iget-object v5, v1, Le/e/a/FullscreenViewport206$Moved;->parent:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    iget-object v5, p0, Le/e/a/FullscreenViewport206$Session;->saved:Ljava/util/Map;

    iget-object v1, v1, Le/e/a/FullscreenViewport206$Moved;->view:Landroid/view/View;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenViewport206$Saved;

    iget-object v1, v1, Le/e/a/FullscreenViewport206$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    # invokes: Le/e/a/FullscreenViewport206;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {v1}, Le/e/a/FullscreenViewport206;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v2, v3, v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_10
.end method

.method save(Landroid/view/View;)V
    .registers 4

    .line 110
    if-eqz p1, :cond_14

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->saved:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->saved:Ljava/util/Map;

    new-instance v1, Le/e/a/FullscreenViewport206$Saved;

    invoke-direct {v1, p1}, Le/e/a/FullscreenViewport206$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    return-void
.end method

.method sync(Landroid/view/View;)V
    .registers 13

    .line 144
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-long v2, v0

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    int-to-long v4, v1

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    iget-object v4, p0, Le/e/a/FullscreenViewport206$Session;->sizes:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    if-lez v0, :cond_66

    if-lez v1, :cond_66

    if-eqz v4, :cond_2a

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v4, v4, v2

    if-eqz v4, :cond_66

    :cond_2a
    :try_start_2a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "a"

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    sget-object v8, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x1

    aput-object v8, v7, v10

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    int-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v5, v9

    int-to-float v0, v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v5, v10

    invoke-virtual {v4, p1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/FullscreenViewport206$Session;->sizes:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_5d} :catch_5e

    goto :goto_66

    :catch_5e
    move-exception p1

    const-string v0, "nicoid-layout"

    const-string v1, "Cannot update comment viewport"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_66
    :goto_66
    return-void
.end method

.method timeline(Landroid/view/View;)V
    .registers 14

    .line 143
    instance-of v0, p1, Landroid/widget/SeekBar;

    const/4 v1, 0x0

    if-eqz v0, :cond_a1

    invoke-virtual {p0, p1}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41400000    # 12.0f

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    if-ne v2, v0, :cond_25

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    if-eq v2, v0, :cond_30

    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p1, v0, v2, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    :cond_30
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object v2, p1

    :goto_35
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-nez v3, :cond_3a

    :cond_39
    :goto_39
    goto :goto_89

    :cond_3a
    check-cast v0, Landroid/view/View;

    instance-of v3, v0, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_6e

    move-object v3, v0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    if-nez v3, :cond_6e

    invoke-virtual {p0, v2}, Le/e/a/FullscreenViewport206$Session;->save(Landroid/view/View;)V

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    # invokes: Le/e/a/FullscreenViewport206;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    invoke-static {p1}, Le/e/a/FullscreenViewport206;->access$0(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_39

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v3, 0x3f800000    # 1.0f

    if-nez v0, :cond_66

    iget v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v0, v0, v3

    if-eqz v0, :cond_39

    :cond_66
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v3, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_89

    :cond_6e
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

    if-ne v2, v3, :cond_8a

    goto :goto_39

    :goto_89
    return-void

    :cond_8a
    const/4 v6, -0x1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v7, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, p0

    move-object v5, v0

    invoke-virtual/range {v4 .. v10}, Le/e/a/FullscreenViewport206$Session;->fit(Landroid/view/View;IIIIZ)V

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    move-object v11, v2

    move-object v2, v0

    move-object v0, v11

    goto :goto_35

    :cond_a1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_b8

    check-cast p1, Landroid/view/ViewGroup;

    :goto_a7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v1, v0, :cond_ae

    goto :goto_b8

    :cond_ae
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/FullscreenViewport206$Session;->timeline(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a7

    :cond_b8
    :goto_b8
    return-void
.end method
