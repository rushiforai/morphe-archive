.class final Le/e/a/TabDrag228;
.super Ljava/lang/Object;
.source "TabDrag228.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field armed:Z

.field before:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/SavedTabs227$Tab;",
            ">;"
        }
    .end annotation
.end field

.field final cell:Landroid/view/View;

.field final cells:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final host:Le/e/a/MultiTabs227$Host;

.field moved:Z

.field final scroll:Landroid/widget/HorizontalScrollView;

.field start:F

.field final tab:Le/e/a/SavedTabs227$Tab;


# direct methods
.method constructor <init>(Le/e/a/MultiTabs227$Host;Landroid/view/View;Le/e/a/SavedTabs227$Tab;Landroid/widget/HorizontalScrollView;)V
    .registers 6

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/TabDrag228;->cells:Ljava/util/Map;

    .line 6
    iput-object p1, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    iput-object p2, p0, Le/e/a/TabDrag228;->cell:Landroid/view/View;

    iput-object p3, p0, Le/e/a/TabDrag228;->tab:Le/e/a/SavedTabs227$Tab;

    iput-object p4, p0, Le/e/a/TabDrag228;->scroll:Landroid/widget/HorizontalScrollView;

    return-void
.end method

.method static install(Le/e/a/MultiTabs227$Host;Landroid/view/View;Le/e/a/SavedTabs227$Tab;Landroid/widget/HorizontalScrollView;)V
    .registers 5

    .line 7
    new-instance v0, Le/e/a/TabDrag228;

    invoke-direct {v0, p0, p1, p2, p3}, Le/e/a/TabDrag228;-><init>(Le/e/a/MultiTabs227$Host;Landroid/view/View;Le/e/a/SavedTabs227$Tab;Landroid/widget/HorizontalScrollView;)V

    iget-object p0, p2, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method finish(Z)V
    .registers 5

    .line 11
    iget-object v0, p0, Le/e/a/TabDrag228;->cells:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/TabDrag228;->armed:Z

    iget-object v1, p0, Le/e/a/TabDrag228;->cell:Landroid/view/View;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    iget-object v1, p0, Le/e/a/TabDrag228;->cell:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_20

    iget-object v1, p0, Le/e/a/TabDrag228;->cell:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_20
    if-eqz p1, :cond_25

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    :cond_25
    iget-boolean p1, p0, Le/e/a/TabDrag228;->moved:Z

    if-eqz p1, :cond_38

    iget-object p1, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/MultiTabs227$Host;->preserveStrip:Z

    iget-object p1, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    invoke-virtual {p1}, Le/e/a/MultiTabs227$Host;->removeBar()V

    iget-object p1, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    invoke-virtual {p1}, Le/e/a/MultiTabs227$Host;->bar()V

    :cond_38
    return-void
.end method

.method move(I)V
    .registers 5

    .line 10
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/TabDrag228;->tab:Le/e/a/SavedTabs227$Tab;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_50

    if-ltz p1, :cond_50

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_50

    if-ne v1, p1, :cond_19

    goto :goto_50

    :cond_19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/TabDrag228;->tab:Le/e/a/SavedTabs227$Tab;

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_26
    :goto_26
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2d

    return-void

    :cond_2d
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SavedTabs227$Tab;

    iget-object v2, p0, Le/e/a/TabDrag228;->cells:Ljava/util/Map;

    iget-object v1, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_26

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float v2, v0, v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    goto :goto_26

    :cond_50
    :goto_50
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 7

    .line 8
    iget-object v0, p0, Le/e/a/TabDrag228;->cells:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    const/4 v0, 0x0

    move v1, v0

    :goto_7
    iget-object v2, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    iget-object v2, v2, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_34

    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/TabDrag228;->armed:Z

    iput-boolean v0, p0, Le/e/a/TabDrag228;->moved:Z

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v3

    iget-object v3, v3, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, p0, Le/e/a/TabDrag228;->before:Ljava/util/ArrayList;

    const v2, 0x3f266666    # 0.65f

    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v1

    :cond_34
    iget-object v2, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    iget-object v2, v2, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Le/e/a/TabDrag228;->cells:Ljava/util/Map;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 14

    .line 9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_12

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, p0, Le/e/a/TabDrag228;->start:F

    iput-boolean v1, p0, Le/e/a/TabDrag228;->armed:Z

    iput-boolean v1, p0, Le/e/a/TabDrag228;->moved:Z

    return v1

    :cond_12
    iget-boolean v2, p0, Le/e/a/TabDrag228;->armed:Z

    if-nez v2, :cond_17

    return v1

    :cond_17
    const/4 v2, 0x3

    const/4 v3, 0x1

    if-eq v0, v2, :cond_e6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-le v2, v3, :cond_23

    goto/16 :goto_e6

    :cond_23
    const/4 v2, 0x2

    if-ne v0, v2, :cond_d4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v4, p0, Le/e/a/TabDrag228;->start:F

    sub-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v0, v0, v4

    if-lez v0, :cond_44

    iput-boolean v3, p0, Le/e/a/TabDrag228;->moved:Z

    :cond_44
    iget-boolean v0, p0, Le/e/a/TabDrag228;->moved:Z

    if-eqz v0, :cond_d3

    new-array v0, v2, [I

    iget-object v4, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    iget-object v4, v4, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->getLocationOnScreen([I)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    aget v0, v0, v1

    int-to-float v0, v0

    sub-float/2addr v4, v0

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    const/4 v5, 0x0

    move v6, v1

    move v7, v6

    :goto_62
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    if-lt v6, v8, :cond_69

    :cond_68
    goto :goto_93

    :cond_69
    iget-object v8, p0, Le/e/a/TabDrag228;->cells:Ljava/util/Map;

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/SavedTabs227$Tab;

    iget-object v9, v9, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    if-nez v8, :cond_7c

    goto :goto_90

    :cond_7c
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    add-float/2addr v9, v5

    cmpl-float v9, v4, v9

    if-lez v9, :cond_68

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v5, v7

    move v7, v6

    :goto_90
    add-int/lit8 v6, v6, 0x1

    goto :goto_62

    :goto_93
    invoke-virtual {p0, v7}, Le/e/a/TabDrag228;->move(I)V

    new-array v0, v2, [I

    iget-object v2, p0, Le/e/a/TabDrag228;->scroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v2, v0}, Landroid/widget/HorizontalScrollView;->getLocationOnScreen([I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 v2, 0x14

    invoke-static {p1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    aget v4, v0, v1

    mul-int/lit8 v5, p1, 0x2

    add-int/2addr v4, v5

    int-to-float v4, v4

    cmpg-float v2, v2, v4

    if-gez v2, :cond_bb

    iget-object v2, p0, Le/e/a/TabDrag228;->scroll:Landroid/widget/HorizontalScrollView;

    neg-int v4, p1

    invoke-virtual {v2, v4, v1}, Landroid/widget/HorizontalScrollView;->scrollBy(II)V

    :cond_bb
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p2

    aget v0, v0, v1

    iget-object v2, p0, Le/e/a/TabDrag228;->scroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v2}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result v2

    add-int/2addr v0, v2

    sub-int/2addr v0, v5

    int-to-float v0, v0

    cmpl-float p2, p2, v0

    if-lez p2, :cond_d3

    iget-object p2, p0, Le/e/a/TabDrag228;->scroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {p2, p1, v1}, Landroid/widget/HorizontalScrollView;->scrollBy(II)V

    :cond_d3
    return v3

    :cond_d4
    if-ne v0, v3, :cond_e5

    iget-boolean p1, p0, Le/e/a/TabDrag228;->moved:Z

    xor-int/2addr p1, v3

    invoke-virtual {p0, v3}, Le/e/a/TabDrag228;->finish(Z)V

    if-eqz p1, :cond_e5

    iget-object p1, p0, Le/e/a/TabDrag228;->host:Le/e/a/MultiTabs227$Host;

    iget-object p2, p0, Le/e/a/TabDrag228;->tab:Le/e/a/SavedTabs227$Tab;

    invoke-virtual {p1, p2}, Le/e/a/MultiTabs227$Host;->actions(Le/e/a/SavedTabs227$Tab;)V

    :cond_e5
    return v3

    :cond_e6
    :goto_e6
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p1

    iget-object p1, p1, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p1

    iget-object p1, p1, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    iget-object p2, p0, Le/e/a/TabDrag228;->before:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0, v1}, Le/e/a/TabDrag228;->finish(Z)V

    return v3
.end method
