.class public final Le/e/a/PopupLayout236;
.super Ljava/lang/Object;
.source "PopupLayout236.java"


# static fields
.field static final pending:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Le/e/a/PopupControls193;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PopupLayout236;->pending:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static buttonSize(IIF)I
    .registers 4

    .line 13
    int-to-float p0, p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    div-float/2addr p0, p2

    float-to-int p0, p0

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static cancel(Le/e/a/PopupControls193;)V
    .registers 2

    .line 12
    sget-object v0, Le/e/a/PopupLayout236;->pending:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_f

    iget-object p0, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_f
    return-void
.end method

.method static synthetic lambda$0(Le/e/a/PopupControls193;)V
    .registers 2

    .line 11
    sget-object v0, Le/e/a/PopupLayout236;->pending:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-static {p0}, Le/e/a/PopupLayout236;->layout(Le/e/a/PopupControls193;)V

    :cond_10
    return-void
.end method

.method public static layout(Le/e/a/PopupControls193;)V
    .registers 2

    .line 21
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PopupLayout236;->layout(Le/e/a/PopupControls193;Z)V

    return-void
.end method

.method static layout(Le/e/a/PopupControls193;Z)V
    .registers 18

    .line 22
    move-object/from16 v1, p0

    iget-boolean v0, v1, Le/e/a/PopupControls193;->updating:Z

    if-nez v0, :cond_2b3

    iget-object v0, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    goto/16 :goto_2b3

    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, v1, Le/e/a/PopupControls193;->updating:Z

    .line 23
    const/4 v2, 0x0

    :try_start_14
    iget-object v3, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    const-string v4, "U"

    invoke-static {v3, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager$LayoutParams;

    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    if-lez v4, :cond_25

    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    goto :goto_2b

    :cond_25
    iget-object v4, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_2b} :catch_2a5
    .catchall {:try_start_14 .. :try_end_2b} :catchall_2a3

    :goto_2b
    if-gtz v4, :cond_30

    .line 48
    iput-boolean v2, v1, Le/e/a/PopupControls193;->updating:Z

    .line 23
    return-void

    :cond_30
    :try_start_30
    iget-object v5, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-static {v5, v4}, Le/e/a/PopupAspect214;->height(Ljava/lang/Object;I)I

    move-result v5

    iget-object v6, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v0}, Le/e/a/PlayerVisibility192;->enabled(Landroid/content/Context;Z)Z

    move-result v6

    .line 24
    invoke-static {v1, v6}, Le/e/a/PopupBar248;->place(Le/e/a/PopupControls193;Z)V

    .line 25
    iget-object v7, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Le/e/a/Revision196;->infoLeft(Landroid/content/Context;)Z

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v7, :cond_53

    move v7, v8

    goto :goto_54

    :cond_53
    const/4 v7, 0x0

    .line 26
    :goto_54
    move v9, v2

    :goto_55
    iget-object v10, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v10}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v10
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_5b} :catch_2a5
    .catchall {:try_start_30 .. :try_end_5b} :catchall_2a3

    const-string v11, "quality"

    const v12, 0x3faccccd    # 1.35f

    const-string v13, "speed"

    const/16 v14, 0x8

    if-lt v9, v10, :cond_276

    .line 27
    :try_start_66
    iget-object v8, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const/16 v9, 0x20

    invoke-static {v8, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v4, v8, v7}, Le/e/a/PopupLayout236;->buttonSize(IIF)I

    move-result v7

    iget-object v8, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    const/4 v9, -0x1

    invoke-static {v8, v9, v7}, Le/e/a/PopupLayout236;->size(Landroid/view/View;II)Z

    iget-object v8, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    invoke-static {v8, v7}, Le/e/a/Revision196;->popupInfoSize(Landroid/widget/LinearLayout;I)V

    iget-object v8, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    const/16 v10, 0x15

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v8, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    const/high16 v10, -0x56000000

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 28
    move v8, v2

    :goto_90
    iget-object v15, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v15}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v15

    if-lt v8, v15, :cond_243

    .line 29
    iget-object v8, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    if-nez v8, :cond_9e

    move v8, v2

    goto :goto_a8

    :cond_9e
    iget-object v8, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {v0, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    :goto_a8
    if-gt v8, v0, :cond_b6

    iget-object v8, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const/16 v11, 0x30

    invoke-static {v8, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    .line 30
    :cond_b6
    if-eqz v6, :cond_ba

    move v11, v7

    goto :goto_bb

    :cond_ba
    move v11, v2

    :goto_bb
    if-eqz v6, :cond_c0

    add-int v12, v7, v8

    goto :goto_c1

    :cond_c0
    move v12, v2

    :goto_c1
    add-int/2addr v12, v5

    .line 31
    iget-object v13, v1, Le/e/a/PopupControls193;->stage:Landroid/widget/RelativeLayout;

    invoke-static {v13, v4, v12}, Le/e/a/PopupLayout236;->size(Landroid/view/View;II)Z

    iget-object v13, v1, Le/e/a/PopupControls193;->video:Landroid/view/View;

    invoke-static {v13, v9, v5, v11}, Le/e/a/PopupLayout236;->rect(Landroid/view/View;III)V

    iget-object v13, v1, Le/e/a/PopupControls193;->comments:Landroid/view/View;

    invoke-static {v13, v9, v5, v11}, Le/e/a/PopupLayout236;->rect(Landroid/view/View;III)V

    .line 33
    iget-object v13, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    const-string v14, "e"

    invoke-static {v13, v14}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    invoke-static {v13, v9, v9}, Le/e/a/PopupLayout236;->size(Landroid/view/View;II)Z

    .line 34
    iget-object v13, v1, Le/e/a/PopupControls193;->menu:Landroid/widget/RelativeLayout;

    if-eqz v6, :cond_e4

    move v14, v7

    goto :goto_e5

    :cond_e4
    move v14, v5

    :goto_e5
    invoke-static {v13, v9, v14, v2}, Le/e/a/PopupLayout236;->rect(Landroid/view/View;III)V

    iget-object v13, v1, Le/e/a/PopupControls193;->menu:Landroid/widget/RelativeLayout;

    invoke-virtual {v13, v2, v2, v2, v2}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    iget-object v13, v1, Le/e/a/PopupControls193;->menu:Landroid/widget/RelativeLayout;

    const/high16 v14, -0x1000000

    if-eqz v6, :cond_f5

    move v15, v14

    goto :goto_f6

    :cond_f5
    move v15, v2

    :goto_f6
    invoke-virtual {v13, v15}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 35
    iget-object v13, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    if-eqz v6, :cond_100

    add-int v15, v11, v5

    goto :goto_106

    :cond_100
    sub-int v15, v5, v8

    invoke-static {v2, v15}, Ljava/lang/Math;->max(II)I

    move-result v15

    :goto_106
    invoke-static {v13, v9, v8, v15}, Le/e/a/PopupLayout236;->rect(Landroid/view/View;III)V

    iget-object v8, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    if-eqz v8, :cond_115

    iget-object v8, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    if-eqz v6, :cond_112

    move v10, v14

    :cond_112
    invoke-virtual {v8, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    :cond_115
    iget-object v8, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const/16 v10, 0x38

    invoke-static {v8, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    div-int/lit8 v10, v5, 0x3

    invoke-static {v0, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    invoke-static {v8, v10}, Ljava/lang/Math;->min(II)I

    move-result v8

    iget-object v10, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    const-string v13, "viewbutton"

    invoke-static {v10, v13}, Le/e/a/PopupControls193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v10

    invoke-static {v10, v8, v8}, Le/e/a/PopupLayout236;->size(Landroid/view/View;II)Z

    const/4 v10, 0x2

    new-array v13, v10, [Ljava/lang/String;

    const-string v14, "prevbutton"

    aput-object v14, v13, v2

    const-string v14, "nextbutton"

    aput-object v14, v13, v0

    move v14, v2

    :goto_142
    if-lt v14, v10, :cond_233

    .line 37
    if-nez v6, :cond_14f

    iget-object v13, v1, Le/e/a/PopupControls193;->center:Landroid/view/View;

    sub-int v14, v5, v8

    div-int/2addr v14, v10

    add-int/2addr v14, v11

    invoke-static {v13, v9, v8, v14}, Le/e/a/PopupLayout236;->rect(Landroid/view/View;III)V

    .line 39
    :cond_14f
    invoke-static {v1, v7}, Le/e/a/PopupBar248;->fit(Le/e/a/PopupControls193;I)V

    .line 40
    iget-object v7, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    const-string v8, "videopro"

    invoke-static {v7, v8}, Le/e/a/PopupControls193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_177

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    iget v9, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iget v13, v13, Landroid/view/ViewGroup$LayoutParams;->height:I

    sub-int v8, v5, v8

    div-int/2addr v8, v10

    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    add-int/2addr v11, v8

    invoke-static {v7, v9, v13, v11}, Le/e/a/PopupLayout236;->rect(Landroid/view/View;III)V

    .line 41
    :cond_177
    iget-object v7, v1, Le/e/a/PopupControls193;->comments:Landroid/view/View;

    if-eqz v7, :cond_18c

    iget v7, v1, Le/e/a/PopupControls193;->fittedWidth:I

    if-ne v7, v4, :cond_183

    iget v7, v1, Le/e/a/PopupControls193;->fittedHeight:I

    if-eq v7, v5, :cond_18c

    :cond_183
    iput v4, v1, Le/e/a/PopupControls193;->fittedWidth:I

    iput v5, v1, Le/e/a/PopupControls193;->fittedHeight:I

    iget-object v7, v1, Le/e/a/PopupControls193;->comments:Landroid/view/View;

    invoke-virtual {v1, v7, v4, v5}, Le/e/a/PopupControls193;->fitComments(Landroid/view/View;II)V

    .line 42
    :cond_18c
    iget-object v7, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-static {v7}, Le/e/a/CommentGraph215;->attachPopup(Ljava/lang/Object;)V

    .line 43
    iget v7, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    if-ne v7, v4, :cond_19b

    iget v7, v3, Landroid/view/WindowManager$LayoutParams;->height:I

    if-ne v7, v12, :cond_19b

    move v7, v2

    goto :goto_19c

    :cond_19b
    move v7, v0

    :goto_19c
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    iput v12, v3, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 44
    iget v8, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v9, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    const-string v10, "o"

    invoke-static {v9, v10}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v9

    invoke-static {v8, v9, v4}, Le/e/a/PopupDrag195;->clamp(III)I

    move-result v4

    iget v8, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v9, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    const-string v10, "p"

    invoke-static {v9, v10}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v9

    iget-object v10, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    const-string v11, "l"

    invoke-static {v10, v11}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v10

    invoke-static {v2, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    sub-int/2addr v9, v10

    invoke-static {v8, v9, v12}, Le/e/a/PopupDrag195;->clamp(III)I

    move-result v8

    iget v9, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    if-ne v4, v9, :cond_1d2

    iget v9, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    if-ne v8, v9, :cond_1d2

    move v0, v2

    :cond_1d2
    or-int/2addr v0, v7

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v8, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 45
    iget-object v7, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v9, "w0"

    invoke-virtual {v7, v9}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    int-to-float v5, v5

    const/4 v9, 0x0

    invoke-virtual {v7, v9, v5}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    iget-object v5, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v7, "u0"

    invoke-virtual {v5, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, v9, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    iget-object v4, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "v0"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v9, v8}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 46
    if-eqz v6, :cond_216

    iget-object v4, v1, Le/e/a/PopupControls193;->menu:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v4, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    if-eqz v4, :cond_216

    iget-object v4, v1, Le/e/a/PopupControls193;->controller:Landroid/view/View;

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 47
    :cond_216
    if-eqz v0, :cond_2ad

    if-eqz p1, :cond_2ad

    iget-object v0, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_2ad

    iget-object v0, v1, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    const-string v4, "b"

    invoke-static {v0, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iget-object v4, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-interface {v0, v4, v3}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    goto/16 :goto_2ad

    .line 36
    :cond_233
    aget-object v15, v13, v14

    iget-object v9, v1, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-static {v9, v15}, Le/e/a/PopupControls193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    invoke-static {v9, v8, v8}, Le/e/a/PopupLayout236;->size(Landroid/view/View;II)Z

    add-int/lit8 v14, v14, 0x1

    const/4 v9, -0x1

    goto/16 :goto_142

    .line 28
    :cond_243
    iget-object v9, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v15

    if-eq v15, v14, :cond_271

    iget-object v15, v1, Le/e/a/PopupControls193;->buttons:Ljava/util/Map;

    invoke-interface {v15, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    if-eq v9, v15, :cond_262

    iget-object v15, v1, Le/e/a/PopupControls193;->buttons:Ljava/util/Map;

    invoke-interface {v15, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    if-ne v9, v15, :cond_260

    goto :goto_262

    :cond_260
    move v15, v7

    goto :goto_265

    :cond_262
    :goto_262
    int-to-float v15, v7

    mul-float/2addr v15, v12

    float-to-int v15, v15

    :goto_265
    invoke-static {v9, v15, v7}, Le/e/a/PopupControls193;->size(Landroid/view/View;II)V

    instance-of v15, v9, Landroid/widget/TextView;

    if-eqz v15, :cond_271

    check-cast v9, Landroid/widget/TextView;

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    :cond_271
    add-int/lit8 v8, v8, 0x1

    const/4 v9, -0x1

    goto/16 :goto_90

    .line 26
    :cond_276
    iget-object v10, v1, Le/e/a/PopupControls193;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v15

    if-eq v15, v14, :cond_29f

    iget-object v14, v1, Le/e/a/PopupControls193;->center:Landroid/view/View;

    if-ne v10, v14, :cond_28c

    invoke-static/range {p0 .. p0}, Le/e/a/PopupBar248;->slots(Le/e/a/PopupControls193;)I

    move-result v10

    int-to-float v12, v10

    goto :goto_29e

    :cond_28c
    iget-object v14, v1, Le/e/a/PopupControls193;->buttons:Ljava/util/Map;

    invoke-interface {v14, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-eq v10, v13, :cond_29e

    iget-object v13, v1, Le/e/a/PopupControls193;->buttons:Ljava/util/Map;

    invoke-interface {v13, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11
    :try_end_29a
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_29a} :catch_2a5
    .catchall {:try_start_66 .. :try_end_29a} :catchall_2a3

    if-ne v10, v11, :cond_29d

    goto :goto_29e

    :cond_29d
    move v12, v8

    :cond_29e
    :goto_29e
    add-float/2addr v7, v12

    :cond_29f
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_55

    .line 48
    :catchall_2a3
    move-exception v0

    goto :goto_2b0

    :catch_2a5
    move-exception v0

    :try_start_2a6
    const-string v3, "nicoid-popup"

    const-string v4, "Popup layout failed"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2ad
    .catchall {:try_start_2a6 .. :try_end_2ad} :catchall_2a3

    :cond_2ad
    :goto_2ad
    iput-boolean v2, v1, Le/e/a/PopupControls193;->updating:Z

    .line 49
    return-void

    .line 48
    :goto_2b0
    iput-boolean v2, v1, Le/e/a/PopupControls193;->updating:Z

    throw v0

    .line 22
    :cond_2b3
    :goto_2b3
    return-void
.end method

.method static rect(Landroid/view/View;III)V
    .registers 13

    .line 15
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v1, :cond_f

    invoke-static {p0, p1, p2}, Le/e/a/PopupLayout236;->size(Landroid/view/View;II)Z

    return-void

    :cond_f
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 16
    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, p1, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    if-ne v1, p2, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    if-ne v1, p3, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    if-nez v1, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    if-nez v1, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    if-nez v1, :cond_2d

    move v1, v2

    goto :goto_2e

    :cond_2d
    move v1, v3

    .line 17
    :goto_2e
    const/16 v4, 0xd

    const/16 v5, 0xf

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/16 v8, 0xc

    filled-new-array {v6, v7, v8, v4, v5}, [I

    move-result-object v4

    move v5, v2

    :goto_3b
    const/4 v6, 0x5

    if-lt v5, v6, :cond_69

    .line 18
    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result v5

    if-nez v5, :cond_4a

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_4b

    :cond_4a
    move v3, v1

    .line 19
    :goto_4b
    if-eqz v3, :cond_5c

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iput p2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iput p3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5c
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result p1

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_68

    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    :cond_68
    return-void

    .line 17
    :cond_69
    aget v6, v4, v5

    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result v7

    if-eqz v7, :cond_75

    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    move v1, v3

    :cond_75
    add-int/lit8 v5, v5, 0x1

    goto :goto_3b
.end method

.method public static request(Ljava/lang/Object;III)V
    .registers 9

    .line 50
    invoke-static {p0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    const-string v0, "U"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v4, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iput p3, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    const-string p1, "a"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Le/e/a/PopupControls193;->binding(Landroid/view/View;)Le/e/a/PopupControls193;

    move-result-object p2

    const/4 p3, 0x0

    if-eqz p2, :cond_2f

    invoke-static {p2, p3}, Le/e/a/PopupLayout236;->layout(Le/e/a/PopupControls193;Z)V

    :cond_2f
    iget p2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    if-ne p2, v1, :cond_40

    iget p2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    if-ne p2, v2, :cond_40

    iget p2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    if-ne p2, v3, :cond_40

    iget p2, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    if-ne p2, v4, :cond_40

    goto :goto_41

    :cond_40
    const/4 p3, 0x1

    :goto_41
    if-eqz p3, :cond_5d

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_5d

    const-string p2, "b"

    invoke-static {p0, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    invoke-interface {p0, p1, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_54} :catch_55

    goto :goto_5d

    :catch_55
    move-exception p0

    const-string p1, "nicoid-popup"

    const-string p2, "Popup resize failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5d
    :goto_5d
    return-void
.end method

.method public static schedule(Le/e/a/PopupControls193;)V
    .registers 3

    .line 11
    iget-object v0, p0, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    sget-object v0, Le/e/a/PopupLayout236;->pending:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_20

    :cond_11
    new-instance v0, Le/e/a/PopupLayout236$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Le/e/a/PopupLayout236$$ExternalSyntheticLambda1;-><init>(Le/e/a/PopupControls193;)V

    sget-object v1, Le/e/a/PopupLayout236;->pending:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_20
    :goto_20
    return-void
.end method

.method static size(Landroid/view/View;II)Z
    .registers 6

    .line 14
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_b

    return v0

    :cond_b
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v2, p1, :cond_14

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v2, p2, :cond_14

    return v0

    :cond_14
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p0, 0x1

    return p0
.end method
