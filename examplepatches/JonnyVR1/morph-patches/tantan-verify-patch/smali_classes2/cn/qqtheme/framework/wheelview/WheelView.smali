.class public Lcn/qqtheme/framework/wheelview/WheelView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field private static final DEF_VISIBLE_ITEMS:I = 0x5

.field private static final ITEM_OFFSET_PERCENT:I = 0x1e

.field private static final PADDING:I = 0x5

.field private static final leastScreenHeight:I = 0x400


# instance fields
.field private SHADOWS_COLORS:[I

.field private bottomShadow:Landroid/graphics/drawable/GradientDrawable;

.field private centerDrawable:Landroid/graphics/drawable/Drawable;

.field private changingListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private clickingListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcn/qqtheme/framework/wheelview/OnWheelClickedListener;",
            ">;"
        }
    .end annotation
.end field

.field private currentItem:I

.field private dataObserver:Landroid/database/DataSetObserver;

.field private drawShadows:Z

.field private enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

.field private firstItem:I

.field isCyclic:Z

.field private isScrollingPerformed:Z

.field private itemHeight:I

.field private itemsLayout:Landroid/widget/LinearLayout;

.field private recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

.field private scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

.field scrollingListener:Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;

.field private scrollingListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;",
            ">;"
        }
    .end annotation
.end field

.field private scrollingOffset:I

.field private topShadow:Landroid/graphics/drawable/GradientDrawable;

.field private viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

.field private visibleItems:I

.field private wheelBackground:I

.field private wheelForeground:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 97
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    const v1, 0xffffff

    .line 98
    filled-new-array {v0, v1, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->SHADOWS_COLORS:[I

    const/4 v0, 0x0

    .line 99
    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    const/4 v1, 0x5

    .line 100
    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 101
    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 102
    sget v1, Lcn/qqtheme/framework/wheelpicker/R$drawable;->wheel_bg:I

    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelBackground:I

    .line 103
    sget v1, Lcn/qqtheme/framework/wheelpicker/R$drawable;->wheel_val:I

    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelForeground:I

    const/4 v1, 0x1

    .line 104
    iput-boolean v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows:Z

    .line 105
    iput-boolean v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 106
    new-instance v0, Lcn/qqtheme/framework/wheelview/WheelRecycle;

    invoke-direct {v0, p0}, Lcn/qqtheme/framework/wheelview/WheelRecycle;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 107
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->changingListeners:Ljava/util/List;

    .line 108
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 109
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->clickingListeners:Ljava/util/List;

    .line 110
    new-instance v0, Lcn/qqtheme/framework/wheelview/WheelView$1;

    invoke-direct {v0, p0}, Lcn/qqtheme/framework/wheelview/WheelView$1;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListener:Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;

    .line 111
    new-instance v0, Lcn/qqtheme/framework/wheelview/WheelView$2;

    invoke-direct {v0, p0}, Lcn/qqtheme/framework/wheelview/WheelView$2;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 112
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->initData(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 81
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, -0x1

    const v0, 0xffffff

    .line 82
    filled-new-array {p2, v0, v0}, [I

    move-result-object p2

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->SHADOWS_COLORS:[I

    const/4 p2, 0x0

    .line 83
    iput p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    const/4 v0, 0x5

    .line 84
    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 85
    iput p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 86
    sget v0, Lcn/qqtheme/framework/wheelpicker/R$drawable;->wheel_bg:I

    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelBackground:I

    .line 87
    sget v0, Lcn/qqtheme/framework/wheelpicker/R$drawable;->wheel_val:I

    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelForeground:I

    const/4 v0, 0x1

    .line 88
    iput-boolean v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows:Z

    .line 89
    iput-boolean p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 90
    new-instance p2, Lcn/qqtheme/framework/wheelview/WheelRecycle;

    invoke-direct {p2, p0}, Lcn/qqtheme/framework/wheelview/WheelRecycle;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 91
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->changingListeners:Ljava/util/List;

    .line 92
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 93
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->clickingListeners:Ljava/util/List;

    .line 94
    new-instance p2, Lcn/qqtheme/framework/wheelview/WheelView$1;

    invoke-direct {p2, p0}, Lcn/qqtheme/framework/wheelview/WheelView$1;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListener:Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;

    .line 95
    new-instance p2, Lcn/qqtheme/framework/wheelview/WheelView$2;

    invoke-direct {p2, p0}, Lcn/qqtheme/framework/wheelview/WheelView$2;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 96
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->initData(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, -0x1

    .line 5
    const p3, 0xffffff

    .line 6
    .line 7
    .line 8
    filled-new-array {p2, p3, p3}, [I

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->SHADOWS_COLORS:[I

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    iput p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 16
    .line 17
    const/4 p3, 0x5

    .line 18
    iput p3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 19
    .line 20
    iput p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 21
    .line 22
    sget p3, Lcn/qqtheme/framework/wheelpicker/R$drawable;->wheel_bg:I

    .line 23
    .line 24
    iput p3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelBackground:I

    .line 25
    .line 26
    sget p3, Lcn/qqtheme/framework/wheelpicker/R$drawable;->wheel_val:I

    .line 27
    .line 28
    iput p3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelForeground:I

    .line 29
    .line 30
    const/4 p3, 0x1

    .line 31
    iput-boolean p3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows:Z

    .line 32
    .line 33
    iput-boolean p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 34
    .line 35
    new-instance p2, Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 36
    .line 37
    invoke-direct {p2, p0}, Lcn/qqtheme/framework/wheelview/WheelRecycle;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    .line 38
    .line 39
    .line 40
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 41
    .line 42
    new-instance p2, Ljava/util/LinkedList;

    .line 43
    .line 44
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->changingListeners:Ljava/util/List;

    .line 48
    .line 49
    new-instance p2, Ljava/util/LinkedList;

    .line 50
    .line 51
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 55
    .line 56
    new-instance p2, Ljava/util/LinkedList;

    .line 57
    .line 58
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->clickingListeners:Ljava/util/List;

    .line 62
    .line 63
    new-instance p2, Lcn/qqtheme/framework/wheelview/WheelView$1;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Lcn/qqtheme/framework/wheelview/WheelView$1;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    .line 66
    .line 67
    .line 68
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListener:Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;

    .line 69
    .line 70
    new-instance p2, Lcn/qqtheme/framework/wheelview/WheelView$2;

    .line 71
    .line 72
    invoke-direct {p2, p0}, Lcn/qqtheme/framework/wheelview/WheelView$2;-><init>(Lcn/qqtheme/framework/wheelview/WheelView;)V

    .line 73
    .line 74
    .line 75
    iput-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 76
    .line 77
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->initData(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic access$000(Lcn/qqtheme/framework/wheelview/WheelView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isScrollingPerformed:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$002(Lcn/qqtheme/framework/wheelview/WheelView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isScrollingPerformed:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcn/qqtheme/framework/wheelview/WheelView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->doScroll(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcn/qqtheme/framework/wheelview/WheelView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(Lcn/qqtheme/framework/wheelview/WheelView;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/WheelScroller;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcn/qqtheme/framework/wheelview/WheelView;)Lcn/qqtheme/framework/wheelview/ItemsRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcn/qqtheme/framework/wheelview/WheelView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$502(Lcn/qqtheme/framework/wheelview/WheelView;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$600(Lcn/qqtheme/framework/wheelview/WheelView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 2
    .line 3
    return p0
.end method

.method private addViewItem(IZ)Z
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemView(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getScreenHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/16 v2, 0x400

    .line 13
    .line 14
    const/4 v3, -0x2

    .line 15
    if-le v1, v2, :cond_0

    .line 16
    .line 17
    const/16 v1, 0x96

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v3

    .line 21
    :goto_0
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 26
    .line 27
    invoke-direct {p2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1, v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 35
    .line 36
    invoke-direct {p2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    :goto_1
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_2
    return v0
.end method

.method private buildViewForMeasuring()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 6
    .line 7
    iget v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 8
    .line 9
    new-instance v3, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 10
    .line 11
    invoke-direct {v3}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0, v2, v3}, Lcn/qqtheme/framework/wheelview/WheelRecycle;->recycleItems(Landroid/widget/LinearLayout;ILcn/qqtheme/framework/wheelview/ItemsRange;)I

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->createItemsLayout()V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 22
    .line 23
    div-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 26
    .line 27
    add-int/2addr v1, v0

    .line 28
    :goto_1
    iget v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 29
    .line 30
    sub-int/2addr v2, v0

    .line 31
    if-lt v1, v2, :cond_2

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-direct {p0, v1, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->addViewItem(IZ)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 41
    .line 42
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    return-void
.end method

.method private calculateLayoutWidth(II)I
    .locals 4

    .line 1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->initResourcesIfNecessary()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    const/4 v2, -0x2

    .line 9
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setHorizontalGravity(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/high16 v2, 0x40000000    # 2.0f

    .line 42
    .line 43
    if-ne p2, v2, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    add-int/lit8 v0, v0, 0xa

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/high16 v3, -0x80000000

    .line 57
    .line 58
    if-ne p2, v3, :cond_1

    .line 59
    .line 60
    if-ge p1, v0, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    move p1, v0

    .line 64
    :goto_0
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 65
    .line 66
    add-int/lit8 p2, p1, -0xa

    .line 67
    .line 68
    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0, p2, v0}, Landroid/view/View;->measure(II)V

    .line 77
    .line 78
    .line 79
    return p1
.end method

.method private createItemsLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private doScroll(I)V
    .locals 7

    .line 1
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 5
    .line 6
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 11
    .line 12
    div-int/2addr v0, p1

    .line 13
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    iget-object v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 17
    .line 18
    invoke-interface {v2}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget v3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 23
    .line 24
    rem-int/2addr v3, p1

    .line 25
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    div-int/lit8 v5, p1, 0x2

    .line 30
    .line 31
    const/4 v6, 0x0

    .line 32
    if-gt v4, v5, :cond_0

    .line 33
    .line 34
    move v3, v6

    .line 35
    :cond_0
    iget-boolean v4, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 36
    .line 37
    if-eqz v4, :cond_4

    .line 38
    .line 39
    if-lez v2, :cond_4

    .line 40
    .line 41
    if-lez v3, :cond_1

    .line 42
    .line 43
    add-int/lit8 v1, v1, -0x1

    .line 44
    .line 45
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    if-gez v3, :cond_2

    .line 49
    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    add-int/lit8 v0, v0, -0x1

    .line 53
    .line 54
    :cond_2
    :goto_0
    if-gez v1, :cond_3

    .line 55
    .line 56
    add-int/2addr v1, v2

    .line 57
    goto :goto_0

    .line 58
    :cond_3
    rem-int/2addr v1, v2

    .line 59
    goto :goto_1

    .line 60
    :cond_4
    if-gez v1, :cond_5

    .line 61
    .line 62
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 63
    .line 64
    move v1, v6

    .line 65
    goto :goto_1

    .line 66
    :cond_5
    if-lt v1, v2, :cond_6

    .line 67
    .line 68
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 69
    .line 70
    sub-int/2addr v0, v2

    .line 71
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    add-int/lit8 v1, v2, -0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_6
    if-lez v1, :cond_7

    .line 77
    .line 78
    if-lez v3, :cond_7

    .line 79
    .line 80
    add-int/lit8 v1, v1, -0x1

    .line 81
    .line 82
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_7
    add-int/lit8 v2, v2, -0x1

    .line 86
    .line 87
    if-ge v1, v2, :cond_8

    .line 88
    .line 89
    if-gez v3, :cond_8

    .line 90
    .line 91
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    add-int/lit8 v0, v0, -0x1

    .line 94
    .line 95
    :cond_8
    :goto_1
    iget v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 96
    .line 97
    iget v3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 98
    .line 99
    if-eq v1, v3, :cond_9

    .line 100
    .line 101
    invoke-virtual {p0, v1, v6}, Lcn/qqtheme/framework/wheelview/WheelView;->setCurrentItem(IZ)V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 106
    .line 107
    .line 108
    :goto_2
    mul-int/2addr v0, p1

    .line 109
    sub-int/2addr v2, v0

    .line 110
    iput v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-le v2, p1, :cond_a

    .line 117
    .line 118
    iget p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    rem-int/2addr p1, v0

    .line 125
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p1, v0

    .line 130
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 131
    .line 132
    :cond_a
    return-void
.end method

.method private drawCenterRect(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    div-int/lit8 v1, v1, 0x2

    .line 12
    .line 13
    new-instance v7, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget v3, Lcn/qqtheme/framework/wheelpicker/R$color;->orange:I

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    const/high16 v2, 0x40a00000    # 5.0f

    .line 32
    .line 33
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    add-int/lit16 v2, v2, -0x12c

    .line 41
    .line 42
    div-int/lit8 v2, v2, 0x2

    .line 43
    .line 44
    int-to-float v3, v2

    .line 45
    sub-int v2, v0, v1

    .line 46
    .line 47
    int-to-float v4, v2

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    add-int/lit16 v2, v2, 0x12c

    .line 53
    .line 54
    div-int/lit8 v2, v2, 0x2

    .line 55
    .line 56
    int-to-float v5, v2

    .line 57
    move v6, v4

    .line 58
    move-object v2, p1

    .line 59
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    add-int/lit16 p1, p1, -0x12c

    .line 67
    .line 68
    div-int/lit8 p1, p1, 0x2

    .line 69
    .line 70
    int-to-float v3, p1

    .line 71
    add-int/2addr v0, v1

    .line 72
    int-to-float v4, v0

    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/lit16 p0, p0, 0x12c

    .line 78
    .line 79
    div-int/lit8 p0, p0, 0x2

    .line 80
    .line 81
    int-to-float v5, p0

    .line 82
    move v6, v4

    .line 83
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private drawItems(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 5
    .line 6
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 7
    .line 8
    sub-int/2addr v0, v1

    .line 9
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    mul-int/2addr v0, v1

    .line 14
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    sub-int/2addr v1, v2

    .line 23
    div-int/lit8 v1, v1, 0x2

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    neg-int v0, v0

    .line 27
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 28
    .line 29
    add-int/2addr v0, v1

    .line 30
    int-to-float v0, v0

    .line 31
    const/high16 v1, 0x40a00000    # 5.0f

    .line 32
    .line 33
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private drawShadows(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->topShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->topShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->bottomShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    sub-int/2addr v2, v0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-virtual {v1, v3, v2, v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->bottomShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private getDesiredHeight(Landroid/widget/LinearLayout;)I
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 19
    .line 20
    :cond_0
    iget p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 21
    .line 22
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 23
    .line 24
    mul-int/2addr v0, p1

    .line 25
    mul-int/lit8 p1, p1, 0x1e

    .line 26
    .line 27
    div-int/lit8 p1, p1, 0x32

    .line 28
    .line 29
    sub-int/2addr v0, p1

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method private getItemHeight()I
    .locals 2

    .line 1
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemHeight:I

    .line 28
    .line 29
    return v0

    .line 30
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 35
    .line 36
    div-int/2addr v0, p0

    .line 37
    return v0
.end method

.method private getItemView(I)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-interface {v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 13
    .line 14
    invoke-interface {v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->isValidItemIndex(I)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 25
    .line 26
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/WheelRecycle;->getEmptyItem()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-interface {p1, v0, p0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getEmptyItem(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    :goto_0
    if-gez p1, :cond_2

    .line 40
    .line 41
    add-int/2addr p1, v0

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    rem-int/2addr p1, v0

    .line 44
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 45
    .line 46
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcn/qqtheme/framework/wheelview/WheelRecycle;->getItem()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-interface {v0, p1, v1, v2}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItem(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    instance-of v1, v0, Landroid/widget/TextView;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    invoke-virtual {v1}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-lt p1, v1, :cond_3

    .line 71
    .line 72
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-le p1, v1, :cond_4

    .line 79
    .line 80
    if-lez p1, :cond_4

    .line 81
    .line 82
    :cond_3
    move-object p1, v0

    .line 83
    check-cast p1, Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget v1, Lcn/qqtheme/framework/wheelpicker/R$color;->text_gray:I

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 100
    .line 101
    .line 102
    return-object v0

    .line 103
    :cond_4
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 104
    .line 105
    instance-of p1, p0, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;

    .line 106
    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    move-object p1, v0

    .line 110
    check-cast p1, Landroid/widget/TextView;

    .line 111
    .line 112
    check-cast p0, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->getTextColor()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 119
    .line 120
    .line 121
    :cond_5
    return-object v0

    .line 122
    :cond_6
    :goto_1
    const/4 p0, 0x0

    .line 123
    return-object p0
.end method

.method private getItemsRange()Lcn/qqtheme/framework/wheelview/ItemsRange;
    .locals 5

    .line 1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    :goto_0
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    mul-int/2addr v2, v1

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ge v2, v3, :cond_1

    .line 22
    .line 23
    add-int/lit8 v0, v0, -0x1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 29
    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    if-lez v2, :cond_2

    .line 33
    .line 34
    add-int/lit8 v0, v0, -0x1

    .line 35
    .line 36
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    div-int/2addr v2, p0

    .line 43
    sub-int/2addr v0, v2

    .line 44
    int-to-double v3, v1

    .line 45
    int-to-double v1, v2

    .line 46
    invoke-static {v1, v2}, Ljava/lang/Math;->asin(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    add-double/2addr v3, v1

    .line 51
    double-to-int v1, v3

    .line 52
    :cond_3
    new-instance p0, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 53
    .line 54
    invoke-direct {p0, v0, v1}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method private initData(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance p1, Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListener:Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;

    .line 8
    .line 9
    invoke-direct {p1, v0, v1}, Lcn/qqtheme/framework/wheelview/WheelScroller;-><init>(Landroid/content/Context;Lcn/qqtheme/framework/wheelview/WheelScroller$ScrollingListener;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 13
    .line 14
    return-void
.end method

.method private initResourcesIfNecessary()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->centerDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelForeground:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->centerDrawable:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->topShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 26
    .line 27
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 28
    .line 29
    iget-object v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->SHADOWS_COLORS:[I

    .line 30
    .line 31
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->topShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->bottomShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 41
    .line 42
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 43
    .line 44
    iget-object v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->SHADOWS_COLORS:[I

    .line 45
    .line 46
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->bottomShadow:Landroid/graphics/drawable/GradientDrawable;

    .line 50
    .line 51
    :cond_2
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelBackground:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private isValidItemIndex(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    if-ltz p1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 18
    .line 19
    invoke-interface {p0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-ge p1, p0, :cond_1

    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private layout(II)V
    .locals 1

    .line 1
    add-int/lit8 p1, p1, -0xa

    .line 2
    .line 3
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0, v0, p1, p2}, Landroid/view/View;->layout(IIII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private rebuildItems()Z
    .locals 6

    .line 1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemsRange()Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v4, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 12
    .line 13
    iget v5, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 14
    .line 15
    invoke-virtual {v4, v1, v5, v0}, Lcn/qqtheme/framework/wheelview/WheelRecycle;->recycleItems(Landroid/widget/LinearLayout;ILcn/qqtheme/framework/wheelview/ItemsRange;)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v4, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 20
    .line 21
    if-eq v4, v1, :cond_0

    .line 22
    .line 23
    move v4, v3

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v4, v2

    .line 26
    :goto_0
    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->createItemsLayout()V

    .line 30
    .line 31
    .line 32
    move v4, v3

    .line 33
    :goto_1
    if-nez v4, :cond_4

    .line 34
    .line 35
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 36
    .line 37
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-ne v1, v4, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getCount()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eq v1, v4, :cond_2

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_2
    move v4, v2

    .line 57
    goto :goto_3

    .line 58
    :cond_3
    :goto_2
    move v4, v3

    .line 59
    :cond_4
    :goto_3
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 60
    .line 61
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-le v1, v5, :cond_6

    .line 66
    .line 67
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 68
    .line 69
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-gt v1, v5, :cond_6

    .line 74
    .line 75
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 76
    .line 77
    sub-int/2addr v1, v3

    .line 78
    :goto_4
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-lt v1, v5, :cond_7

    .line 83
    .line 84
    invoke-direct {p0, v1, v3}, Lcn/qqtheme/framework/wheelview/WheelView;->addViewItem(IZ)Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-nez v5, :cond_5

    .line 89
    .line 90
    goto :goto_5

    .line 91
    :cond_5
    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 92
    .line 93
    add-int/lit8 v1, v1, -0x1

    .line 94
    .line 95
    goto :goto_4

    .line 96
    :cond_6
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 101
    .line 102
    :cond_7
    :goto_5
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 103
    .line 104
    iget-object v3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 105
    .line 106
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    :goto_6
    invoke-virtual {v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getCount()I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-ge v3, v5, :cond_9

    .line 115
    .line 116
    iget v5, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 117
    .line 118
    add-int/2addr v5, v3

    .line 119
    invoke-direct {p0, v5, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->addViewItem(IZ)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-nez v5, :cond_8

    .line 124
    .line 125
    iget-object v5, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 126
    .line 127
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    if-nez v5, :cond_8

    .line 132
    .line 133
    add-int/lit8 v1, v1, 0x1

    .line 134
    .line 135
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 136
    .line 137
    goto :goto_6

    .line 138
    :cond_9
    iput v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 139
    .line 140
    return v4
.end method

.method private updateView()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->rebuildItems()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->calculateLayoutWidth(II)I

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-direct {p0, v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->layout(II)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public addChangingListener(Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->changingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addClickingListener(Lcn/qqtheme/framework/wheelview/OnWheelClickedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->clickingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addScrollingListener(Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public drawShadows()Z
    .locals 0

    .line 46
    iget-boolean p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows:Z

    return p0
.end method

.method public getCurrentItem()I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 2
    .line 3
    return p0
.end method

.method public getScreenHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "window"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/view/WindowManager;

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Point;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 23
    .line 24
    .line 25
    iget p0, v0, Landroid/graphics/Point;->y:I

    .line 26
    .line 27
    return p0
.end method

.method public getViewAdapter()Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVisibleItems()I
    .locals 0

    .line 1
    iget p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 2
    .line 3
    return p0
.end method

.method public invalidateWheel(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcn/qqtheme/framework/wheelview/WheelRecycle;->clearAll()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->recycle:Lcn/qqtheme/framework/wheelview/WheelRecycle;

    .line 24
    .line 25
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->firstItem:I

    .line 26
    .line 27
    new-instance v2, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 28
    .line 29
    invoke-direct {v2}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1, v1, v2}, Lcn/qqtheme/framework/wheelview/WheelRecycle;->recycleItems(Landroid/widget/LinearLayout;ILcn/qqtheme/framework/wheelview/ItemsRange;)I

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public isCyclic()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 2
    .line 3
    return p0
.end method

.method public notifyChangingListeners(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->changingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;

    .line 18
    .line 19
    invoke-interface {v1, p0, p1, p2}, Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;->onChanged(Lcn/qqtheme/framework/wheelview/WheelView;II)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public notifyClickListenersAboutClick(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->clickingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcn/qqtheme/framework/wheelview/OnWheelClickedListener;

    .line 18
    .line 19
    invoke-interface {v1, p0, p1}, Lcn/qqtheme/framework/wheelview/OnWheelClickedListener;->onItemClicked(Lcn/qqtheme/framework/wheelview/WheelView;I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public notifyScrollingListenersAboutEnd()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;

    .line 18
    .line 19
    invoke-interface {v1, p0}, Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;->onScrollingFinished(Lcn/qqtheme/framework/wheelview/WheelView;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public notifyScrollingListenersAboutStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;

    .line 18
    .line 19
    invoke-interface {v1, p0}, Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;->onScrollingStarted(Lcn/qqtheme/framework/wheelview/WheelView;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->updateView()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->drawCenterRect(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->drawItems(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-boolean v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows(Landroid/graphics/Canvas;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    sub-int/2addr p4, p2

    .line 2
    sub-int/2addr p5, p3

    .line 3
    invoke-direct {p0, p4, p5}, Lcn/qqtheme/framework/wheelview/WheelView;->layout(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->buildViewForMeasuring()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->calculateLayoutWidth(II)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/high16 v0, 0x40000000    # 2.0f

    .line 25
    .line 26
    if-ne v1, v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->itemsLayout:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->getDesiredHeight(Landroid/widget/LinearLayout;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/high16 v2, -0x80000000

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move p2, v0

    .line 45
    :goto_0
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getViewAdapter()Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x2

    .line 20
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    if-eq v0, v2, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    iget-boolean v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isScrollingPerformed:Z

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    float-to-int v0, v0

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    div-int/2addr v1, v2

    .line 53
    sub-int/2addr v0, v1

    .line 54
    if-lez v0, :cond_3

    .line 55
    .line 56
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    div-int/2addr v1, v2

    .line 61
    add-int/2addr v0, v1

    .line 62
    goto :goto_0

    .line 63
    :cond_3
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    div-int/2addr v1, v2

    .line 68
    sub-int/2addr v0, v1

    .line 69
    :goto_0
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    div-int/2addr v0, v1

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 77
    .line 78
    add-int/2addr v1, v0

    .line 79
    invoke-direct {p0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->isValidItemIndex(I)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 86
    .line 87
    add-int/2addr v1, v0

    .line 88
    invoke-virtual {p0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->notifyClickListenersAboutClick(I)V

    .line 89
    .line 90
    .line 91
    :cond_4
    :goto_1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelScroller;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    return p0

    .line 98
    :cond_5
    :goto_2
    return v1
.end method

.method public removeChangingListener(Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->changingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeClickingListener(Lcn/qqtheme/framework/wheelview/OnWheelClickedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->clickingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeScrollingListener(Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scroll(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcn/qqtheme/framework/wheelview/WheelView;->getItemHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/2addr p1, v0

    .line 6
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 7
    .line 8
    sub-int/2addr p1, v0

    .line 9
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcn/qqtheme/framework/wheelview/WheelScroller;->scroll(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setCurrentItem(I)V
    .locals 1

    const/4 v0, 0x0

    .line 105
    invoke-virtual {p0, p1, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->setCurrentItem(IZ)V

    return-void
.end method

.method public setCurrentItem(IZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    invoke-interface {v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 13
    .line 14
    invoke-interface {v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->getItemsCount()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ltz p1, :cond_1

    .line 19
    .line 20
    if-lt p1, v0, :cond_3

    .line 21
    .line 22
    :cond_1
    iget-boolean v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 23
    .line 24
    if-eqz v1, :cond_9

    .line 25
    .line 26
    :goto_0
    if-gez p1, :cond_2

    .line 27
    .line 28
    add-int/2addr p1, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    rem-int/2addr p1, v0

    .line 31
    :cond_3
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 32
    .line 33
    if-eq p1, v1, :cond_9

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    if-eqz p2, :cond_6

    .line 37
    .line 38
    sub-int p2, p1, v1

    .line 39
    .line 40
    iget-boolean v3, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 41
    .line 42
    if-eqz v3, :cond_5

    .line 43
    .line 44
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/2addr v0, v1

    .line 49
    iget v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 50
    .line 51
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    sub-int/2addr v0, p1

    .line 56
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-ge v0, p1, :cond_5

    .line 61
    .line 62
    if-gez p2, :cond_4

    .line 63
    .line 64
    move p2, v0

    .line 65
    goto :goto_1

    .line 66
    :cond_4
    neg-int p1, v0

    .line 67
    move p2, p1

    .line 68
    :cond_5
    :goto_1
    invoke-virtual {p0, p2, v2}, Lcn/qqtheme/framework/wheelview/WheelView;->scroll(II)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_6
    iput v2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scrollingOffset:I

    .line 73
    .line 74
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 75
    .line 76
    iget-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 77
    .line 78
    if-eqz p2, :cond_7

    .line 79
    .line 80
    invoke-virtual {p2}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getFirst()I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-ge p1, p2, :cond_7

    .line 85
    .line 86
    iget p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 87
    .line 88
    iget-object p2, p0, Lcn/qqtheme/framework/wheelview/WheelView;->enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 89
    .line 90
    invoke-virtual {p2}, Lcn/qqtheme/framework/wheelview/ItemsRange;->getLast()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-gt p1, p2, :cond_8

    .line 95
    .line 96
    :cond_7
    iget p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->currentItem:I

    .line 97
    .line 98
    invoke-virtual {p0, v1, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->notifyChangingListeners(II)V

    .line 99
    .line 100
    .line 101
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 102
    .line 103
    .line 104
    :cond_9
    :goto_2
    return-void
.end method

.method public setCyclic(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->isCyclic:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->invalidateWheel(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setDrawShadows(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->drawShadows:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V
    .locals 0
    .param p1    # Lcn/qqtheme/framework/wheelview/ItemsRange;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->enableRange:Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 2
    .line 3
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelScroller;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShadowColor(III)V
    .locals 0

    .line 1
    filled-new-array {p1, p2, p3}, [I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->SHADOWS_COLORS:[I

    .line 6
    .line 7
    return-void
.end method

.method public setViewAdapter(Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->viewAdapter:Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->dataObserver:Landroid/database/DataSetObserver;

    .line 15
    .line 16
    invoke-interface {p1, v0}, Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->invalidateWheel(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setVisibleItems(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->visibleItems:I

    .line 2
    .line 3
    return-void
.end method

.method public setWheelBackground(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelBackground:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setWheelForeground(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelForeground:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->wheelForeground:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView;->centerDrawable:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public stopScrolling()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView;->scroller:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcn/qqtheme/framework/wheelview/WheelScroller;->stopScrolling()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
