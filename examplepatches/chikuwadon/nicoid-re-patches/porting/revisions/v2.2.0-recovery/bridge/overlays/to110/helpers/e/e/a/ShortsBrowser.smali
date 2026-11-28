.class final Le/e/a/ShortsBrowser;
.super Ljava/lang/Object;
.source "ShortsBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ShortsBrowser$SearchGlyph;,
        Le/e/a/ShortsBrowser$Cards;,
        Le/e/a/ShortsBrowser$OrderRows;,
        Le/e/a/ShortsBrowser$OrderRow;,
        Le/e/a/ShortsBrowser$Card;
    }
.end annotation


# static fields
.field private static final LIKES:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/ModernShorts$Item;",
            ">;"
        }
    .end annotation
.end field

.field private static final NEWEST:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/ModernShorts$Item;",
            ">;"
        }
    .end annotation
.end field

.field private static final ORDER:Ljava/lang/String; = "shorts_manual_order"

.field private static final RANDOM_ORDER:I = 0x5

.field private static final VIEWS:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/ModernShorts$Item;",
            ">;"
        }
    .end annotation
.end field

.field private static final randomSeeds:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Le/e/a/ModernShorts$Home;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 24
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ShortsBrowser;->randomSeeds:Ljava/util/WeakHashMap;

    .line 25
    new-instance v0, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda3;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Le/e/a/ShortsBrowser;->VIEWS:Ljava/util/Comparator;

    .line 26
    new-instance v0, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda4;-><init>()V

    invoke-static {v0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Le/e/a/ShortsBrowser;->LIKES:Ljava/util/Comparator;

    .line 27
    new-instance v0, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda5;-><init>()V

    .line 28
    invoke-static {}, Ljava/util/Comparator;->reverseOrder()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Comparator;->nullsLast(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Le/e/a/ShortsBrowser;->NEWEST:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 21
    invoke-static {p0, p1, p2}, Le/e/a/ShortsBrowser;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/content/Context;I)I
    .registers 2

    .line 21
    invoke-static {p0, p1}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Landroid/content/Context;II)Landroid/widget/TextView;
    .registers 3

    .line 21
    invoke-static {p0, p1, p2}, Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 21
    invoke-static {p0, p1, p2, p3}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V
    .registers 2

    .line 21
    invoke-static {p0, p1}, Le/e/a/ShortsBrowser;->showCounts(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V

    return-void
.end method

.method static synthetic access$500(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V
    .registers 2

    .line 21
    invoke-static {p0, p1}, Le/e/a/ShortsBrowser;->bindThumbnail(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V

    return-void
.end method

.method static appended(Ljava/util/ArrayList;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;I)V"
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "related parsed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " added="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " discarded="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 144
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, p1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 143
    const-string p1, "nicoid-shorts"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    return-void
.end method

.method private static applyOrder(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;)V"
        }
    .end annotation

    .line 256
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 257
    invoke-static {p0}, Le/e/a/ShortsBrowser;->storedOrder(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 258
    :cond_0
    new-instance p0, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda2;

    invoke-direct {p0, v0}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda2;-><init>(Ljava/util/HashMap;)V

    invoke-static {p0}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 259
    return-void
.end method

.method static attach(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 16

    .line 31
    iget-object v0, p2, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    .line 32
    const/16 v1, 0x8

    invoke-static {p0, v1}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 33
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 35
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 36
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 37
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 38
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 39
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 40
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 41
    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v4

    invoke-static {v4}, Landroid/graphics/Color;->luminance(I)F

    move-result v4

    const/high16 v5, 0x3f000000    # 0.5f

    cmpg-float v4, v4, v5

    if-gez v4, :cond_0

    const v4, 0x22ffffff

    goto :goto_0

    :cond_0
    const/high16 v4, 0x14000000

    :goto_0
    const/16 v5, 0xe

    invoke-static {p0, v4, v5}, Le/e/a/ShortsBrowser;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 43
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-static {p0, v5}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v7

    const/16 v8, 0x36

    invoke-static {p0, v8}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {v4, v7, v9, v8, v9}, Landroid/widget/EditText;->setPaddingRelative(IIII)V

    .line 44
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v7, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    const-string v7, ""

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 46
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    invoke-virtual {v4, v6, v6, v6, v6}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 47
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    const-string v7, "Search"

    const-string/jumbo v10, "\u641c\u5c0b"

    const-string/jumbo v11, "\u691c\u7d22"

    invoke-static {p0, v11, v7, v10}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v10, 0x30

    invoke-static {p0, v10}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v11

    const v12, 0x800005

    invoke-direct {v7, v11, v8, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    new-instance v7, Landroid/graphics/drawable/RippleDrawable;

    .line 50
    const v11, 0x33ffffff

    invoke-static {v11}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v11

    invoke-static {p0, v8, v5}, Le/e/a/ShortsBrowser;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-direct {v7, v11, v6, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 49
    invoke-virtual {v4, v7}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 51
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 52
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    new-instance v5, Le/e/a/ShortsBrowser$SearchGlyph;

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v6

    const/16 v7, 0x18

    invoke-static {p0, v7}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Le/e/a/ShortsBrowser$SearchGlyph;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setForegroundGravity(I)V

    .line 54
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v10}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v4, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 56
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 57
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 58
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 59
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 60
    new-instance v2, Landroid/widget/GridView;

    invoke-direct {v2, p0}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    iput-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    .line 61
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 62
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {v2, v5}, Landroid/widget/GridView;->setStretchMode(I)V

    .line 63
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {v2, v1}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    .line 64
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {v2, v1}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    .line 65
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {v2, v9}, Landroid/widget/GridView;->setClipToPadding(Z)V

    .line 66
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    const v5, 0x106000d

    invoke-virtual {v2, v5}, Landroid/widget/GridView;->setSelector(I)V

    .line 67
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    new-instance v5, Le/e/a/ShortsBrowser$1;

    invoke-direct {v5, p0, p1, p2}, Le/e/a/ShortsBrowser$1;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v2, v5}, Landroid/widget/GridView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 76
    iget-object v2, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {v0, v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 78
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 79
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 80
    iget-object v3, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 81
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 82
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, -0x2

    invoke-direct {v5, v9, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    .line 84
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    const v5, 0x800015

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 85
    iget-object v4, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    invoke-virtual {v4, v1, v9, v1, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 86
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v10}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v4, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    new-instance v4, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, p2, p1}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$Home;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object p1, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    invoke-static {p1}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 103
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 104
    invoke-static {p0}, Le/e/a/ShortsBrowser;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, "shorts_display_order"

    invoke-interface {p0, p1, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 p1, 0x5

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v9, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    iput p0, p2, Le/e/a/ModernShorts$Home;->order:I

    .line 105
    return-void
.end method

.method private static bindThumbnail(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V
    .registers 4

    .line 309
    invoke-virtual {p0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 310
    :cond_0
    iget-object v0, p1, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 311
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 312
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 313
    iget-object p1, p1, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-static {p1, p0, v0}, Le/e/a/ModernShorts;->loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 314
    return-void
.end method

.method static date(Le/e/a/ModernShorts$Item;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .registers 7

    .line 262
    const-string v0, "count"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 263
    if-nez v1, :cond_0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 264
    :cond_0
    const/4 v0, -0x1

    if-nez v1, :cond_1

    move v1, v0

    goto :goto_0

    :cond_1
    const-string v2, "like"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    :goto_0
    iput v1, p0, Le/e/a/ModernShorts$Item;->likes:I

    .line 265
    iget v1, p0, Le/e/a/ModernShorts$Item;->likes:I

    if-gez v1, :cond_2

    const-string v1, "likeCount"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p2, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Le/e/a/ModernShorts$Item;->likes:I

    .line 266
    :cond_2
    const-string v0, "firstRegisteredAt"

    const-string v1, ""

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "registeredAt"

    invoke-virtual {p2, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 267
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v3, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 268
    :cond_3
    const-string p1, "^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}.*"

    invoke-virtual {p2, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    return-void

    .line 269
    :cond_4
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x12

    if-le p1, v0, :cond_5

    const/16 p1, 0x10

    invoke-virtual {p2, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 v0, 0x3a

    if-ne p1, v0, :cond_5

    const/4 p1, 0x1

    goto :goto_1

    :cond_5
    const/4 p1, 0x0

    .line 271
    :goto_1
    :try_start_0
    invoke-static {p2}, Ljava/time/OffsetDateTime;->parse(Ljava/lang/CharSequence;)Ljava/time/OffsetDateTime;

    move-result-object v0

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/time/OffsetDateTime;->atZoneSameInstant(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v0

    .line 272
    if-eqz p1, :cond_6

    const-string p1, "yyyy/MM/dd HH:mm:ss"

    goto :goto_2

    :cond_6
    const-string p1, "yyyy/MM/dd HH:mm"

    :goto_2
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p1, v1}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;Ljava/util/Locale;)Ljava/time/format/DateTimeFormatter;

    move-result-object p1

    .line 271
    invoke-virtual {v0, p1}, Ljava/time/ZonedDateTime;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;
    :try_end_0
    .catch Ljava/time/format/DateTimeParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    goto :goto_3

    .line 273
    :catch_0
    move-exception p1

    .line 274
    const-string p1, "^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}(:\\d{2})?$"

    invoke-virtual {p2, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 275
    const/16 p1, 0x2d

    const/16 v0, 0x2f

    invoke-virtual {p2, p1, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x54

    const/16 v0, 0x20

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    .line 278
    :cond_7
    :goto_3
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 292
    invoke-static {p0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static filters(IIII)V
    .registers 6

    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "accepted="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " blocked="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " limit="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " duplicates="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "nicoid-shorts"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    return-void
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 291
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$applyOrder$11(Ljava/util/HashMap;Le/e/a/ModernShorts$Item;)I
    .registers 3

    .line 258
    iget-object p1, p1, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    const v0, 0x7fffffff

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method static synthetic lambda$attach$3(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/MenuItem;)Z
    .registers 6

    .line 93
    invoke-interface {p3}, Landroid/view/MenuItem;->getItemId()I

    move-result p3

    iput p3, p0, Le/e/a/ModernShorts$Home;->order:I

    .line 94
    iget p3, p0, Le/e/a/ModernShorts$Home;->order:I

    const/4 v0, 0x5

    if-ne p3, v0, :cond_0

    sget-object p3, Le/e/a/ShortsBrowser;->randomSeeds:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p3, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    :cond_0
    invoke-static {p1}, Le/e/a/ShortsBrowser;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v0, "shorts_display_order"

    iget v1, p0, Le/e/a/ModernShorts$Home;->order:I

    invoke-interface {p3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 96
    invoke-static {p1, p2, p0}, Le/e/a/ShortsBrowser;->render(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 97
    iget-object p0, p0, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/GridView;->setSelection(I)V

    .line 98
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$attach$4(Landroid/app/Activity;Le/e/a/ModernShorts$Home;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 9

    .line 89
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-direct {v0, p0, p3}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 90
    invoke-static {p0}, Le/e/a/ShortsBrowser;->sortNames(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p3

    .line 91
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, p3

    if-ge v2, v3, :cond_0

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    aget-object v4, p3, v2

    invoke-interface {v3, v1, v2, v2, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 92
    :cond_0
    new-instance p3, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda1;

    invoke-direct {p3, p1, p0, p2}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda1;-><init>(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v0, p3}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 100
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 101
    return-void
.end method

.method static synthetic lambda$render$5(Le/e/a/ModernShorts$Home;)Ljava/lang/Long;
    .registers 3

    .line 154
    new-instance p0, Ljava/util/Random;

    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    invoke-virtual {p0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$showOrder$6(Landroid/app/Activity;Landroid/widget/ListView;Ljava/util/ArrayList;Le/e/a/ShortsBrowser$OrderRows;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 11

    .line 172
    invoke-virtual {p5}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p4

    instance-of p4, p4, Le/e/a/ModernShorts$Item;

    const/4 v0, 0x0

    if-nez p4, :cond_0

    return v0

    .line 173
    :cond_0
    invoke-virtual {p5}, Landroid/view/DragEvent;->getAction()I

    move-result p4

    const/4 v1, 0x2

    if-ne p4, v1, :cond_2

    .line 174
    invoke-virtual {p5}, Landroid/view/DragEvent;->getY()F

    move-result p4

    const/16 v1, 0x24

    invoke-static {p0, v1}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    cmpg-float p4, p4, v2

    const/16 v2, 0x50

    const/16 v3, 0x20

    if-gez p4, :cond_1

    invoke-static {p0, v3}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result p4

    neg-int p4, p4

    invoke-virtual {p1, p4, v2}, Landroid/widget/ListView;->smoothScrollBy(II)V

    .line 175
    :cond_1
    invoke-virtual {p5}, Landroid/view/DragEvent;->getY()F

    move-result p4

    invoke-virtual {p1}, Landroid/widget/ListView;->getHeight()I

    move-result v4

    invoke-static {p0, v1}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v1

    sub-int/2addr v4, v1

    int-to-float v1, v4

    cmpl-float p4, p4, v1

    if-lez p4, :cond_2

    invoke-static {p0, v3}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0, v2}, Landroid/widget/ListView;->smoothScrollBy(II)V

    .line 177
    :cond_2
    invoke-virtual {p5}, Landroid/view/DragEvent;->getAction()I

    move-result p0

    const/4 p4, 0x3

    if-ne p0, p4, :cond_4

    .line 178
    invoke-virtual {p5}, Landroid/view/DragEvent;->getX()F

    move-result p0

    float-to-int p0, p0

    invoke-virtual {p5}, Landroid/view/DragEvent;->getY()F

    move-result p4

    float-to-int p4, p4

    invoke-virtual {p1, p0, p4}, Landroid/widget/ListView;->pointToPosition(II)I

    move-result p0

    .line 179
    const/4 p1, -0x1

    if-ne p0, p1, :cond_3

    return v0

    .line 180
    :cond_3
    invoke-virtual {p5}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 181
    invoke-virtual {p5}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/ModernShorts$Item;

    invoke-virtual {p2, p0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 182
    invoke-virtual {p3}, Le/e/a/ShortsBrowser$OrderRows;->notifyDataSetChanged()V

    .line 184
    :cond_4
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$showOrder$7(Ljava/util/ArrayList;Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ShortsBrowser$OrderRows;Landroid/widget/ListView;Landroid/widget/TextView;[Ljava/lang/String;Landroid/view/MenuItem;)Z
    .registers 10

    .line 198
    invoke-interface {p7}, Landroid/view/MenuItem;->getItemId()I

    move-result p7

    .line 199
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 200
    iget-object p1, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p1, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 201
    const/4 p1, 0x5

    if-ne p7, p1, :cond_0

    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    invoke-virtual {p1}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    invoke-static {p2, p0, p7, v0, v1}, Le/e/a/ShortsBrowser;->sort(Landroid/content/Context;Ljava/util/ArrayList;IJ)V

    .line 202
    invoke-virtual {p3}, Le/e/a/ShortsBrowser$OrderRows;->notifyDataSetChanged()V

    .line 203
    const/4 p0, 0x0

    invoke-virtual {p4, p0}, Landroid/widget/ListView;->setSelection(I)V

    .line 204
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    aget-object p1, p6, p7

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " \u25be"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$showOrder$8(Landroid/app/Activity;Landroid/widget/TextView;[Ljava/lang/String;Ljava/util/ArrayList;Le/e/a/ModernShorts$State;Le/e/a/ShortsBrowser$OrderRows;Landroid/widget/ListView;Landroid/view/View;)V
    .registers 18

    .line 195
    move-object v7, p2

    new-instance v8, Landroid/widget/PopupMenu;

    move-object v3, p0

    move-object v6, p1

    const v0, 0x800005

    invoke-direct {v8, p0, p1, v0}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;I)V

    .line 196
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v2, v7

    if-ge v1, v2, :cond_0

    invoke-virtual {v8}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    aget-object v4, v7, v1

    invoke-interface {v2, v0, v1, v1, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 197
    :cond_0
    new-instance v9, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda11;

    move-object v0, v9

    move-object v1, p3

    move-object v2, p4

    move-object v3, p0

    move-object v4, p5

    move-object/from16 v5, p6

    move-object v6, p1

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda11;-><init>(Ljava/util/ArrayList;Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ShortsBrowser$OrderRows;Landroid/widget/ListView;Landroid/widget/TextView;[Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 207
    invoke-virtual {v8}, Landroid/widget/PopupMenu;->show()V

    .line 208
    return-void
.end method

.method static synthetic lambda$showOrder$9(Ljava/util/ArrayList;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Le/e/a/ModernShorts$State;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 218
    new-instance p4, Ljava/util/ArrayList;

    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 219
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p5

    if-eqz p5, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Le/e/a/ModernShorts$Item;

    iget-object p5, p5, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {p4, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 220
    :cond_0
    invoke-static {p1}, Le/e/a/ShortsBrowser;->storedOrder(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p5

    if-eqz p5, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    invoke-virtual {p4, p5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p4, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 221
    :cond_2
    invoke-static {p1}, Le/e/a/ShortsBrowser;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p5, ","

    invoke-static {p5, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p4

    const-string p5, "shorts_manual_order"

    invoke-interface {p0, p5, p4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p4, "shorts_display_order"

    const/4 p5, 0x2

    invoke-interface {p0, p4, p5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 222
    iput p5, p2, Le/e/a/ModernShorts$Home;->order:I

    .line 223
    invoke-static {p1, p3, p2}, Le/e/a/ShortsBrowser;->render(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 224
    return-void
.end method

.method static synthetic lambda$sort$10(JLe/e/a/ModernShorts$Item;)J
    .registers 3

    .line 233
    iget-object p2, p2, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-static {p2, p0, p1}, Le/e/a/ShortsBrowser;->randomRank(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic lambda$static$0(Le/e/a/ModernShorts$Item;)I
    .registers 1

    .line 25
    iget p0, p0, Le/e/a/ModernShorts$Item;->views:I

    return p0
.end method

.method static synthetic lambda$static$1(Le/e/a/ModernShorts$Item;)I
    .registers 1

    .line 26
    iget p0, p0, Le/e/a/ModernShorts$Item;->likes:I

    return p0
.end method

.method static synthetic lambda$static$2(Le/e/a/ModernShorts$Item;)Ljava/lang/String;
    .registers 1

    .line 28
    iget-object p0, p0, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    return-object p0
.end method

.method static merge(Landroid/app/Activity;Le/e/a/ModernShorts$Home;Ljava/util/ArrayList;)Le/e/a/ModernShorts$Feed;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Le/e/a/ModernShorts$Home;",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;)",
            "Le/e/a/ModernShorts$Feed;"
        }
    .end annotation

    .line 108
    new-instance v0, Le/e/a/ModernShorts$Feed;

    invoke-direct {v0}, Le/e/a/ModernShorts$Feed;-><init>()V

    .line 109
    invoke-static {p0, v0, p2}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    move-result p2

    .line 110
    iget-object v1, p1, Le/e/a/ModernShorts$Home;->recommendations:Le/e/a/ModernShorts$Feed;

    if-nez v1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p1, Le/e/a/ModernShorts$Home;->recommendations:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-static {p0, v0, v1}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    move-result p0

    .line 111
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "recommended loaded="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " retained="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p2, "nicoid-shorts"

    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    iput-object v0, p1, Le/e/a/ModernShorts$Home;->recommendations:Le/e/a/ModernShorts$Feed;

    .line 113
    sget-object p0, Le/e/a/ShortsBrowser;->randomSeeds:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    iget-object p0, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    if-nez p0, :cond_1

    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p0, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    goto :goto_1

    .line 115
    :cond_1
    iget-object p0, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Ljava/util/LinkedHashSet;->clear()V

    .line 116
    :goto_1
    return-object v0
.end method

.method static nextAnchor(Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)Ljava/lang/String;
    .registers 9

    .line 120
    iget-object v0, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    .line 121
    :cond_0
    iget-object p0, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p0, p0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    .line 122
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 123
    const/16 v1, 0xc8

    const/4 v2, 0x0

    if-lt v0, v1, :cond_1

    return-object v2

    .line 124
    :cond_1
    iget-object v1, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->size()I

    move-result v1

    int-to-double v3, v1

    const-wide v5, 0x3fe3c6ef372fed03L    # 0.61803398875

    mul-double/2addr v3, v5

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    rem-double/2addr v3, v5

    int-to-double v5, v0

    mul-double/2addr v3, v5

    double-to-int v1, v3

    .line 125
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_3

    .line 126
    add-int v4, v1, v3

    rem-int/2addr v4, v0

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/ModernShorts$Item;

    iget-object v4, v4, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    .line 127
    iget-object v5, p1, Le/e/a/ModernShorts$Home;->anchors:Ljava/util/LinkedHashSet;

    invoke-virtual {v5, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    return-object v4

    .line 125
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 129
    :cond_3
    return-object v2
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 247
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static randomRank(Ljava/lang/String;J)J
    .registers 6

    .line 239
    nop

    .line 240
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    int-to-long v1, v1

    xor-long/2addr p1, v1

    const-wide v1, 0x100000001b3L

    mul-long/2addr p1, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 241
    :cond_0
    const/16 p0, 0x1e

    ushr-long v0, p1, p0

    xor-long p0, p1, v0

    const-wide v0, -0x40a7b892e31b1a47L    # -0.0014818730883930777

    mul-long/2addr p0, v0

    .line 242
    const/16 p2, 0x1b

    ushr-long v0, p0, p2

    xor-long/2addr p0, v0

    const-wide v0, -0x6b2fb644ecceee15L    # -1.981759996145912E-208

    mul-long/2addr p0, v0

    .line 243
    const/16 p2, 0x1f

    ushr-long v0, p0, p2

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method static render(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 7

    .line 153
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 154
    iget v1, p2, Le/e/a/ModernShorts$Home;->order:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    sget-object v1, Le/e/a/ShortsBrowser;->randomSeeds:Ljava/util/WeakHashMap;

    new-instance v2, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda7;

    invoke-direct {v2}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda7;-><init>()V

    invoke-virtual {v1, p2, v2}, Ljava/util/WeakHashMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    .line 155
    :goto_0
    iget v3, p2, Le/e/a/ModernShorts$Home;->order:I

    invoke-static {p0, v0, v3, v1, v2}, Le/e/a/ShortsBrowser;->sort(Landroid/content/Context;Ljava/util/ArrayList;IJ)V

    .line 156
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {v1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    new-instance v2, Le/e/a/ShortsBrowser$Cards;

    invoke-direct {v2, p0, p1}, Le/e/a/ShortsBrowser$Cards;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 157
    :cond_1
    iget-object p1, p2, Le/e/a/ModernShorts$Home;->grid:Landroid/widget/GridView;

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Le/e/a/ShortsBrowser$Cards;

    .line 158
    iput-object v0, p1, Le/e/a/ShortsBrowser$Cards;->items:Ljava/util/List;

    .line 159
    invoke-virtual {p1}, Le/e/a/ShortsBrowser$Cards;->notifyDataSetChanged()V

    .line 160
    iget-object p1, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p1, v0}, Le/e/a/ShortsHomeUi;->summary(Landroid/widget/TextView;I)V

    .line 161
    iget-object p1, p2, Le/e/a/ModernShorts$Home;->sort:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Le/e/a/ShortsBrowser;->sortNames(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    iget p2, p2, Le/e/a/ModernShorts$Home;->order:I

    aget-object p0, p0, p2

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " \u25be"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    return-void
.end method

.method static response(Lorg/json/JSONArray;Ljava/util/ArrayList;Ljava/net/HttpURLConnection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;",
            "Ljava/net/HttpURLConnection;",
            ")V"
        }
    .end annotation

    .line 133
    nop

    .line 135
    const/4 v0, -0x1

    if-eqz p2, :cond_0

    :try_start_0
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 136
    :catch_0
    move-exception p2

    goto :goto_1

    .line 137
    :cond_0
    :goto_0
    nop

    .line 138
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "recommendation HTTP="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " returned="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 139
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " invalid="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p0, p1

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 138
    const-string p1, "nicoid-shorts"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    return-void
.end method

.method private static round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;
    .registers 4

    .line 295
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 296
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 297
    invoke-static {p0, p2}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 298
    return-object v0
.end method

.method private static showCounts(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V
    .registers 9

    .line 317
    iget v0, p1, Le/e/a/ModernShorts$Item;->views:I

    int-to-long v0, v0

    iget p1, p1, Le/e/a/ModernShorts$Item;->likes:I

    int-to-long v2, p1

    const/4 p1, 0x4

    new-array p1, p1, [J

    const/4 v4, 0x0

    aput-wide v0, p1, v4

    const/4 v0, 0x1

    const-wide/16 v5, -0x1

    aput-wide v5, p1, v0

    const/4 v0, 0x2

    aput-wide v2, p1, v0

    const/4 v0, 0x3

    aput-wide v5, p1, v0

    invoke-static {p0, p1}, Le/e/a/VideoCounts;->render(Landroid/widget/TextView;[J)V

    .line 318
    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    move-result p1

    if-nez p1, :cond_0

    const/16 v4, 0x8

    :cond_0
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 319
    return-void
.end method

.method static showOrder(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 19

    .line 165
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    new-instance v10, Ljava/util/ArrayList;

    iget-object v0, v9, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v0, v0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-direct {v10, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 166
    invoke-static/range {p0 .. p0}, Le/e/a/ShortsBrowser;->storedOrder(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/ShortsBrowser;->VIEWS:Ljava/util/Comparator;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    goto :goto_0

    .line 167
    :cond_0
    invoke-static {v8, v10}, Le/e/a/ShortsBrowser;->applyOrder(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 168
    :goto_0
    new-instance v11, Landroid/widget/ListView;

    invoke-direct {v11, v8}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 169
    new-instance v6, Le/e/a/ShortsBrowser$OrderRows;

    invoke-direct {v6, v8, v10}, Le/e/a/ShortsBrowser$OrderRows;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;)V

    .line 170
    invoke-virtual {v11, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 171
    new-instance v0, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda8;

    invoke-direct {v0, v8, v11, v10, v6}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda8;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Ljava/util/ArrayList;Le/e/a/ShortsBrowser$OrderRows;)V

    invoke-static {v11, v0}, Le/e/a/ReorderMotion98;->install(Landroid/view/View;Landroid/view/View$OnDragListener;)V

    .line 186
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 187
    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 188
    const/16 v0, 0x8

    invoke-static {v8, v0}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {v12, v1, v0, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 189
    const/16 v0, 0xe

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {v8, v0, v2}, Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v14

    .line 190
    const v0, 0x800015

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 191
    const/16 v0, 0x14

    invoke-static {v8, v0}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v8, v0}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v14, v2, v1, v0, v1}, Landroid/widget/TextView;->setPaddingRelative(IIII)V

    .line 192
    invoke-static/range {p0 .. p0}, Le/e/a/ShortsBrowser;->sortNames(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p0 .. p0}, Le/e/a/ShortsBrowser;->storedOrder(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v13

    goto :goto_1

    :cond_1
    const/4 v1, 0x2

    :goto_1
    aget-object v1, v3, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u25be"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    new-instance v7, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda9;

    move-object v0, v7

    move-object/from16 v1, p0

    move-object v2, v14

    move-object v4, v10

    move-object/from16 v5, p1

    move-object v15, v7

    move-object v7, v11

    invoke-direct/range {v0 .. v7}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda9;-><init>(Landroid/app/Activity;Landroid/widget/TextView;[Ljava/lang/String;Ljava/util/ArrayList;Le/e/a/ModernShorts$State;Le/e/a/ShortsBrowser$OrderRows;Landroid/widget/ListView;)V

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    invoke-static {v14}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 210
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v1, 0x2c

    invoke-static {v8, v1}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const v2, 0x800005

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v12, v14, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 211
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x6

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0x52

    invoke-static {v8, v0}, Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    const/4 v3, 0x2

    div-int/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 212
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 214
    const-string v1, "\u53d6\u5f97\u6e08\u307f\u30b7\u30e7\u30fc\u30c8"

    const-string v2, "Loaded Shorts"

    const-string v3, "\u5df2\u8f09\u5165\u7684\u77ed\u7247"

    invoke-static {v8, v1, v2, v3}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 215
    invoke-virtual {v0, v12}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 216
    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 217
    const-string v1, "\u4fdd\u5b58"

    const-string v2, "Save"

    const-string v3, "\u5132\u5b58"

    invoke-static {v8, v1, v2, v3}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda10;

    move-object/from16 v3, p2

    invoke-direct {v2, v10, v8, v3, v9}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda10;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 213
    invoke-static {v0}, Le/e/a/UiDialogs;->showBuilder(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 225
    return-void
.end method

.method private static sort(Landroid/content/Context;Ljava/util/ArrayList;IJ)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;IJ)V"
        }
    .end annotation

    .line 228
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 233
    :pswitch_0
    new-instance p0, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda6;

    invoke-direct {p0, p3, p4}, Le/e/a/ShortsBrowser$$ExternalSyntheticLambda6;-><init>(J)V

    invoke-static {p0}, Ljava/util/Comparator;->comparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    goto :goto_0

    .line 232
    :pswitch_1
    sget-object p0, Le/e/a/ShortsBrowser;->LIKES:Ljava/util/Comparator;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    goto :goto_0

    .line 231
    :pswitch_2
    sget-object p0, Le/e/a/ShortsBrowser;->NEWEST:Ljava/util/Comparator;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    goto :goto_0

    .line 230
    :pswitch_3
    invoke-static {p0, p1}, Le/e/a/ShortsBrowser;->applyOrder(Landroid/content/Context;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 229
    :pswitch_4
    sget-object p0, Le/e/a/ShortsBrowser;->VIEWS:Ljava/util/Comparator;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 236
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static sortNames(Landroid/content/Context;)[Ljava/lang/String;
    .registers 10

    .line 281
    nop

    .line 282
    const-string v0, "\u53d6\u5f97\u9806"

    const-string v1, "Feed order"

    const-string/jumbo v2, "\u8f09\u5165\u9806\u5e8f"

    invoke-static {p0, v0, v1, v2}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 283
    const-string v0, "\u518d\u751f\u6570\u304c\u591a\u3044\u9806"

    const-string v1, "Most viewed"

    const-string/jumbo v2, "\u89c0\u770b\u6b21\u6578\u6700\u591a"

    invoke-static {p0, v0, v1, v2}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 284
    const-string v0, "\u4fdd\u5b58\u3057\u305f\u4e26\u3073\u9806"

    const-string v1, "Saved order"

    const-string v2, "\u5df2\u5132\u5b58\u9806\u5e8f"

    invoke-static {p0, v0, v1, v2}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 285
    const-string v0, "\u6295\u7a3f\u65e5\u304c\u65b0\u3057\u3044\u9806"

    const-string v1, "Newest first"

    const-string/jumbo v2, "\u6700\u65b0\u767c\u5e03"

    invoke-static {p0, v0, v1, v2}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 286
    const-string v0, "\u3044\u3044\u306d\u6570\u304c\u591a\u3044\u9806"

    const-string v1, "Most liked"

    const-string/jumbo v2, "\u6700\u591a\u8b9a"

    invoke-static {p0, v0, v1, v2}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 287
    const-string v0, "\u30e9\u30f3\u30c0\u30e0"

    const-string v1, "Random"

    const-string/jumbo v2, "\u96a8\u6a5f"

    invoke-static {p0, v0, v1, v2}, Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    move-result-object p0

    .line 281
    return-object p0
.end method

.method private static storedOrder(Landroid/content/Context;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 251
    invoke-static {p0}, Le/e/a/ShortsBrowser;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "shorts_manual_order"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 252
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static text(Landroid/content/Context;II)Landroid/widget/TextView;
    .registers 4

    .line 302
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 303
    int-to-float p0, p1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 304
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 305
    return-object v0
.end method
