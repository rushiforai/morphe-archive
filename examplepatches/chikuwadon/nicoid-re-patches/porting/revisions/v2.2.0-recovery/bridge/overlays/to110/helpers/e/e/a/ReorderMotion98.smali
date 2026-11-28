.class public final Le/e/a/ReorderMotion98;
.super Ljava/lang/Object;
.source "ReorderMotion98.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ReorderMotion98$Glyph;,
        Le/e/a/ReorderMotion98$Listener;
    }
.end annotation


# static fields
.field private static horizontal:Z

.field private static list:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private static final positions:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final shifted:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static source:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static sourceExtent:I

.field private static sourceIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/ReorderMotion98;->source:Ljava/lang/ref/WeakReference;

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ReorderMotion98;->positions:Ljava/util/WeakHashMap;

    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    .line 9
    const/4 v0, -0x1

    sput v0, Le/e/a/ReorderMotion98;->sourceIndex:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()V
    .registers 0

    .line 4
    invoke-static {}, Le/e/a/ReorderMotion98;->clear()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/ref/WeakReference;
    .registers 1

    .line 4
    sget-object v0, Le/e/a/ReorderMotion98;->source:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/ref/WeakReference;
    .registers 1

    .line 4
    sget-object v0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$302(I)I
    .registers 1

    .line 4
    sput p0, Le/e/a/ReorderMotion98;->sourceIndex:I

    return p0
.end method

.method static synthetic access$400(Landroid/view/View;Landroid/view/DragEvent;Z)V
    .registers 3

    .line 4
    invoke-static {p0, p1, p2}, Le/e/a/ReorderMotion98;->preview(Landroid/view/View;Landroid/view/DragEvent;Z)V

    return-void
.end method

.method public static begin(Landroid/view/View;)V
    .registers 2

    .line 21
    invoke-static {}, Le/e/a/ReorderMotion98;->clear()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/ReorderMotion98;->source:Ljava/lang/ref/WeakReference;

    new-instance p0, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    const/4 p0, -0x1

    sput p0, Le/e/a/ReorderMotion98;->sourceIndex:I

    return-void
.end method

.method public static button(Landroid/widget/TextView;Z)V
    .registers 4

    .line 12
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/ReorderMotion98;->glyph(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x18

    invoke-static {v0, v1}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 13
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 v0, 0xc

    invoke-static {p1, v0}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1, v1, p1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-void
.end method

.method private static clear()V
    .registers 2

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    goto :goto_0

    :cond_1
    sget-object v0, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    sget-object v0, Le/e/a/ReorderMotion98;->positions:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    return-void
.end method

.method private static direct(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 3

    .line 34
    :goto_0
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eq v0, p1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static dp(Landroid/content/Context;I)I
    .registers 2

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float p0, p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static folderHover(Landroid/view/View;)V
    .registers 1

    .line 24
    invoke-static {}, Le/e/a/ReorderMotion98;->clear()V

    invoke-static {p0}, Le/e/a/ReorderMotion98;->hide(Landroid/view/View;)V

    return-void
.end method

.method public static followTab(Landroid/view/View;F)V
    .registers 4

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    return-void
.end method

.method public static glyph(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 11
    new-instance v0, Le/e/a/ReorderMotion98$Glyph;

    const/16 v1, 0x18

    invoke-static {p0, v1}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-direct {v0, v1, p0, p1}, Le/e/a/ReorderMotion98$Glyph;-><init>(III)V

    return-object v0
.end method

.method public static grip(Landroid/widget/TextView;)V
    .registers 5

    .line 50
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Le/e/a/ReorderMotion98;->glyph(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x18

    invoke-static {v1, v2}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v1, Landroid/text/SpannableString;

    const-string v3, " "

    invoke-direct {v1, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/text/style/ImageSpan;

    invoke-direct {v3, v0, v2}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    const/4 v0, 0x1

    invoke-virtual {v1, v3, v2, v0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setGravity(I)V

    return-void
.end method

.method private static hide(Landroid/view/View;)V
    .registers 4

    .line 36
    sget-object v0, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    sget-object v0, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    const/high16 v1, 0x7fc00000    # Float.NaN

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static install(Landroid/view/View;Landroid/view/View$OnDragListener;)V
    .registers 4

    .line 22
    new-instance v0, Le/e/a/ReorderMotion98$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Le/e/a/ReorderMotion98$Listener;-><init>(Landroid/view/View$OnDragListener;Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    return-void
.end method

.method public static installVideo(Landroid/view/View;Landroid/view/View$OnDragListener;)V
    .registers 4

    .line 23
    new-instance v0, Le/e/a/ReorderMotion98$Listener;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Le/e/a/ReorderMotion98$Listener;-><init>(Landroid/view/View$OnDragListener;Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    return-void
.end method

.method private static offset(Landroid/view/View;FZ)V
    .registers 8

    .line 35
    sget-object v0, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    if-nez v0, :cond_2

    cmpl-float v2, p1, v1

    if-nez v2, :cond_2

    :cond_1
    return-void

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    if-eqz p2, :cond_4

    move v3, v0

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    :goto_1
    if-eqz p2, :cond_5

    move v4, p1

    goto :goto_2

    :cond_5
    const/4 v4, 0x0

    :goto_2
    if-eqz p2, :cond_6

    const/4 v0, 0x0

    :cond_6
    if-nez p2, :cond_7

    move v1, p1

    :cond_7
    invoke-direct {v2, v3, v4, v0, v1}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v0, 0xa0

    invoke-virtual {v2, v0, v1}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v2, p2}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const/4 p2, 0x1

    invoke-virtual {v2, p2}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    invoke-virtual {p0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    sget-object p2, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static offsetFor(IIII)I
    .registers 4

    .line 47
    if-ge p0, p1, :cond_0

    if-le p2, p0, :cond_0

    if-gt p2, p1, :cond_0

    neg-int p3, p3

    goto :goto_0

    :cond_0
    if-le p0, p1, :cond_1

    if-lt p2, p1, :cond_1

    if-ge p2, p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p3, 0x0

    :goto_0
    return p3
.end method

.method private static preview(Landroid/view/View;Landroid/view/DragEvent;Z)V
    .registers 13

    .line 37
    sget-object v0, Le/e/a/ReorderMotion98;->source:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    .line 38
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Le/e/a/CatalogReorder98$Item;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Le/e/a/CatalogReorder98$Item;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CatalogReorder98$Item;

    iget v1, v1, Le/e/a/CatalogReorder98$Item;->kind:I

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CatalogReorder98$Item;

    iget v2, v2, Le/e/a/CatalogReorder98$Item;->kind:I

    if-eq v1, v2, :cond_1

    return-void

    :cond_1
    instance-of v1, p0, Landroid/widget/ListView;

    .line 39
    const/high16 v2, 0x40000000    # 2.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_8

    check-cast p0, Landroid/widget/ListView;

    invoke-static {v0, p0}, Le/e/a/ReorderMotion98;->direct(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    sget-object v5, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-eq v5, p0, :cond_2

    if-eqz v0, :cond_3

    move-object v5, p0

    check-cast v5, Landroid/widget/ListView;

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->getPositionForView(Landroid/view/View;)I

    move-result v5

    sput v5, Le/e/a/ReorderMotion98;->sourceIndex:I

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ListView;->getDividerHeight()I

    move-result v5

    add-int/2addr v0, v5

    sput v0, Le/e/a/ReorderMotion98;->sourceExtent:I

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    sput-boolean v4, Le/e/a/ReorderMotion98;->horizontal:Z

    :cond_2
    move-object v0, p0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {p0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v0

    if-eqz p2, :cond_5

    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    move-result p2

    const/4 v2, 0x2

    if-eq p2, v2, :cond_4

    :cond_3
    return-void

    :cond_4
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    move-result p2

    invoke-static {p0, p2}, Le/e/a/ReorderMotion98;->videoTarget(Landroid/widget/ListView;F)I

    move-result p2

    goto/16 :goto_9

    :cond_5
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    move-result p2

    move v6, v0

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    if-ge v5, v7, :cond_7

    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    add-int v7, v0, v5

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v6, v2

    add-float/2addr v8, v6

    cmpg-float v6, p2, v8

    if-gez v6, :cond_6

    move p2, v7

    goto/16 :goto_9

    :cond_6
    add-int/lit8 v5, v5, 0x1

    move v6, v7

    goto :goto_0

    :cond_7
    move p2, v6

    goto/16 :goto_9

    .line 40
    :cond_8
    instance-of p2, p0, Landroid/widget/LinearLayout;

    if-eqz p2, :cond_10

    move-object p2, p0

    check-cast p2, Landroid/view/ViewGroup;

    invoke-static {v0, p2}, Le/e/a/ReorderMotion98;->direct(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_10

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-static {v0, p0}, Le/e/a/ReorderMotion98;->direct(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    sget-object v0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_b

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    sput v0, Le/e/a/ReorderMotion98;->sourceIndex:I

    move-object v0, p0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_1

    :cond_9
    const/4 v0, 0x0

    :goto_1
    sput-boolean v0, Le/e/a/ReorderMotion98;->horizontal:Z

    sget-boolean v0, Le/e/a/ReorderMotion98;->horizontal:Z

    if-eqz v0, :cond_a

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    goto :goto_2

    :cond_a
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    :goto_2
    sput p2, Le/e/a/ReorderMotion98;->sourceExtent:I

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p2, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    :cond_b
    sget-boolean p2, Le/e/a/ReorderMotion98;->horizontal:Z

    if-eqz p2, :cond_c

    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    move-result p2

    goto :goto_3

    :cond_c
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    move-result p2

    :goto_3
    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v0, v6, :cond_f

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    sget-boolean v6, Le/e/a/ReorderMotion98;->horizontal:Z

    if-eqz v6, :cond_d

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    goto :goto_5

    :cond_d
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    :goto_5
    int-to-float v5, v5

    div-float/2addr v5, v2

    add-float/2addr v6, v5

    cmpg-float v5, p2, v6

    if-gez v5, :cond_e

    move p2, v0

    goto :goto_6

    :cond_e
    add-int/lit8 v5, v0, 0x1

    move v9, v5

    move v5, v0

    move v0, v9

    goto :goto_4

    :cond_f
    move p2, v5

    :goto_6
    const/4 v0, 0x0

    goto :goto_9

    .line 41
    :cond_10
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/widget/LinearLayout;

    if-eqz p2, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-static {v0, p2}, Le/e/a/ReorderMotion98;->direct(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_12

    :cond_11
    return-void

    :cond_12
    sget-object v2, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p2, :cond_15

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    sput v2, Le/e/a/ReorderMotion98;->sourceIndex:I

    move-object v2, p2

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v2

    if-nez v2, :cond_13

    const/4 v2, 0x1

    goto :goto_7

    :cond_13
    const/4 v2, 0x0

    :goto_7
    sput-boolean v2, Le/e/a/ReorderMotion98;->horizontal:Z

    sget-boolean v2, Le/e/a/ReorderMotion98;->horizontal:Z

    if-eqz v2, :cond_14

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    goto :goto_8

    :cond_14
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    :goto_8
    sput v0, Le/e/a/ReorderMotion98;->sourceExtent:I

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    :cond_15
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p0

    move-object v0, p2

    move p2, p0

    move-object p0, v0

    const/4 v0, 0x0

    .line 42
    :goto_9
    sget v2, Le/e/a/ReorderMotion98;->sourceIndex:I

    if-ltz v2, :cond_1b

    if-ltz p2, :cond_1b

    sget v2, Le/e/a/ReorderMotion98;->sourceExtent:I

    if-lez v2, :cond_1b

    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    move-result p1

    if-eq p1, v3, :cond_1b

    .line 44
    new-instance p1, Ljava/util/ArrayList;

    sget-object v2, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_16
    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, p0, :cond_17

    if-eqz v1, :cond_16

    sget-object v3, Le/e/a/ReorderMotion98;->positions:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_17

    sget-object v3, Le/e/a/ReorderMotion98;->positions:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v5

    add-int/2addr v5, v0

    if-eq v3, v5, :cond_16

    :cond_17
    invoke-virtual {v2}, Landroid/view/View;->clearAnimation()V

    sget-object v3, Le/e/a/ReorderMotion98;->shifted:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v2}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le/e/a/ReorderMotion98;->positions:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v2}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    .line 45
    :cond_18
    nop

    :goto_b
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    if-ge v4, p1, :cond_1a

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    add-int v1, v0, v4

    sget-object v2, Le/e/a/ReorderMotion98;->positions:Ljava/util/WeakHashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget v2, Le/e/a/ReorderMotion98;->sourceIndex:I

    if-ne v1, v2, :cond_19

    invoke-static {p1}, Le/e/a/ReorderMotion98;->hide(Landroid/view/View;)V

    goto :goto_c

    :cond_19
    sget v2, Le/e/a/ReorderMotion98;->sourceIndex:I

    sget v3, Le/e/a/ReorderMotion98;->sourceExtent:I

    invoke-static {v2, p2, v1, v3}, Le/e/a/ReorderMotion98;->offsetFor(IIII)I

    move-result v1

    int-to-float v1, v1

    sget-boolean v2, Le/e/a/ReorderMotion98;->horizontal:Z

    invoke-static {p1, v1, v2}, Le/e/a/ReorderMotion98;->offset(Landroid/view/View;FZ)V

    :goto_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 46
    :cond_1a
    return-void

    .line 42
    :cond_1b
    return-void
.end method

.method public static shadow(Landroid/view/View;)Landroid/view/View$DragShadowBuilder;
    .registers 2

    .line 20
    invoke-static {p0}, Le/e/a/ReorderMotion98;->begin(Landroid/view/View;)V

    new-instance v0, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v0, p0}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static slideX(Landroid/view/View;FLandroid/view/View;)V
    .registers 3

    .line 48
    if-ne p0, p2, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 p1, 0xa0

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public static videoDropPosition(Landroid/widget/ListView;II)I
    .registers 4

    .line 28
    sget-object v0, Le/e/a/ReorderMotion98;->list:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    sget v0, Le/e/a/ReorderMotion98;->sourceIndex:I

    if-ltz v0, :cond_0

    int-to-float p1, p2

    invoke-static {p0, p1}, Le/e/a/ReorderMotion98;->videoTarget(Landroid/widget/ListView;F)I

    move-result p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/widget/ListView;->pointToPosition(II)I

    move-result p0

    :goto_0
    return p0
.end method

.method static videoTarget(IIF[F)I
    .registers 8

    .line 26
    const/4 v0, 0x0

    move v1, p0

    :goto_0
    array-length v2, p3

    if-ge v0, v2, :cond_2

    add-int v2, p1, v0

    if-ge v2, p0, :cond_0

    aget v3, p3, v0

    cmpg-float v3, p2, v3

    if-gez v3, :cond_0

    move v1, v2

    goto :goto_1

    :cond_0
    if-le v2, p0, :cond_1

    aget v3, p3, v0

    cmpl-float v3, p2, v3

    if-lez v3, :cond_1

    move v1, v2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v1
.end method

.method private static videoTarget(Landroid/widget/ListView;F)I
    .registers 8

    .line 27
    invoke-virtual {p0}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    new-array v1, v0, [F

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    invoke-virtual {p0, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    add-float/2addr v4, v3

    aput v4, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    sget v0, Le/e/a/ReorderMotion98;->sourceIndex:I

    invoke-virtual {p0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result p0

    invoke-static {v0, p0, p1, v1}, Le/e/a/ReorderMotion98;->videoTarget(IIF[F)I

    move-result p0

    return p0
.end method
