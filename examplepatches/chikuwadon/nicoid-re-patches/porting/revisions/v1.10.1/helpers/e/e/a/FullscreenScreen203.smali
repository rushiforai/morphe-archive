.class public final Le/e/a/FullscreenScreen203;
.super Ljava/lang/Object;
.source "FullscreenScreen203.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FullscreenScreen203$Glyph;,
        Le/e/a/FullscreenScreen203$Saved;,
        Le/e/a/FullscreenScreen203$State;
    }
.end annotation


# static fields
.field static final ACTIVE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/FullscreenScreen203$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static active(Landroid/view/View;)Z
    .registers 2

    .line 19
    sget-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static before(Ljava/lang/Object;)V
    .registers 1

    .line 21
    :try_start_0
    invoke-static {p0}, Le/e/a/FullscreenScreen203;->root(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/FullscreenScreen203;->restore(Landroid/view/View;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_9

    :catch_8
    move-exception p0

    :goto_9
    return-void
.end method

.method public static button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 3

    .line 36
    sget-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenScreen203$State;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return-object p0

    :cond_c
    iget-object p0, p0, Le/e/a/FullscreenScreen203$State;->buttons:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method static copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 82
    instance-of v0, p0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_c

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    return-object v0

    :cond_c
    instance-of v0, p0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_18

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/widget/RelativeLayout$LayoutParams;)V

    return-object v0

    :cond_18
    instance-of v0, p0, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v0, :cond_24

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    return-object v0

    :cond_24
    if-nez p0, :cond_2d

    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    goto :goto_33

    :cond_2d
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    move-object p0, v0

    :goto_33
    return-object p0
.end method

.method public static heldDock(Ljava/lang/Object;)Z
    .registers 9

    .line 38
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "rootView"

    invoke-static {p0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    sget-object v2, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FullscreenScreen203$State;

    if-nez v1, :cond_14

    return v0

    .line 39
    :cond_14
    const-string v2, "controller"

    invoke-static {p0, v2}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Le/e/a/PlayerFrame202;->show(Landroid/view/View;)V

    if-eqz v2, :cond_26

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 40
    :cond_26
    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "central"

    aput-object v4, v3, v0

    const-string v4, "bottom"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x0

    :goto_33
    if-lt v4, v2, :cond_39

    .line 41
    invoke-virtual {v1}, Le/e/a/FullscreenScreen203$State;->layout()V

    return v5

    .line 40
    :cond_39
    aget-object v6, v3, v4

    invoke-static {p0, v6}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Landroid/view/View;

    if-eqz v7, :cond_4a

    check-cast v6, Landroid/view/View;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4a} :catch_4d

    :cond_4a
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 42
    :catch_4d
    move-exception p0

    return v0
.end method

.method static inherit(Landroid/view/View;Landroid/view/View;)V
    .registers 7

    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    if-eqz v1, :cond_1c

    new-instance v2, Landroid/view/animation/Transformation;

    invoke-direct {v2}, Landroid/view/animation/Transformation;-><init>()V

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v3

    invoke-virtual {v1, v3, v4, v2}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    invoke-virtual {v2}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v1

    mul-float v0, v0, v1

    :cond_1c
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_27

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    :cond_27
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eq v0, v1, :cond_38

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_38
    return-void
.end method

.method static install(Landroid/view/View;Landroid/view/ViewGroup;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)Le/e/a/FullscreenScreen203$State;
    .registers 5

    .line 31
    sget-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FullscreenScreen203$State;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Le/e/a/FullscreenScreen203$State;->layout()V

    return-object v0

    .line 32
    :cond_e
    new-instance v0, Le/e/a/FullscreenScreen203$State;

    invoke-direct {v0, p0, p1, p2, p3}, Le/e/a/FullscreenScreen203$State;-><init>(Landroid/view/View;Landroid/view/ViewGroup;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    sget-object p1, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Le/e/a/FullscreenScreen203$State;->attach()V

    return-object v0
.end method

.method public static layout(Landroid/view/View;)Z
    .registers 2

    .line 35
    sget-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenScreen203$State;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->layout()V

    const/4 p0, 0x1

    return p0
.end method

.method static minimum(Landroid/view/View;)V
    .registers 3

    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getMinimumWidth()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {p0, v1}, Landroid/view/View;->setMinimumWidth(I)V

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {p0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    :cond_13
    return-void
.end method

.method static padding(Landroid/view/View;)V
    .registers 2

    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    if-eqz v0, :cond_1c

    :cond_18
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    :cond_1c
    return-void
.end method

.method static rect(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 8

    .line 87
    if-nez p0, :cond_8

    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    return-object p0

    :cond_8
    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v1, Landroid/graphics/Rect;

    const/4 v2, 0x0

    aget v3, v0, v2

    const/4 v4, 0x1

    aget v5, v0, v4

    aget v2, v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v2, v6

    aget v0, v0, v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    add-int/2addr v0, p0

    invoke-direct {v1, v3, v5, v2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method

.method public static restore(Landroid/view/View;)V
    .registers 2

    invoke-static {p0}, Le/e/a/FullscreenViewport209;->restore(Landroid/view/View;)V

    .line 34
    sget-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenScreen203$State;

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->restore()V

    :cond_10
    return-void
.end method

.method static root(Ljava/lang/Object;)Landroid/view/View;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    const-string v0, "x1"

    invoke-static {p0, v0}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method static same(Landroid/view/ViewGroup$LayoutParams;Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 4

    .line 85
    if-eqz p0, :cond_10

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v0, v1, :cond_10

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne p0, p1, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method static set(Landroid/view/View;II)V
    .registers 5

    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_15

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, p1, :cond_e

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p2, :cond_15

    :cond_e
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_15
    return-void
.end method

.method public static snapshot(Landroid/view/View;)Ljava/lang/String;
    .registers 2

    .line 37
    sget-object v0, Le/e/a/FullscreenScreen203;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FullscreenScreen203$State;

    if-nez p0, :cond_d

    const-string p0, "fullscreen controls inactive"

    goto :goto_11

    :cond_d
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->coordinates()Ljava/lang/String;

    move-result-object p0

    :goto_11
    return-object p0
.end method

.method public static update(Ljava/lang/Object;)V
    .registers 5

    .line 23
    :try_start_0
    invoke-static {p0}, Le/e/a/FullscreenScreen203;->root(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    const-string v1, "B0"

    invoke-static {p0, v1}, Le/e/a/Revision201;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    .line 24
    if-nez p0, :cond_16

    invoke-static {v0}, Le/e/a/FullscreenScreen203;->restore(Landroid/view/View;)V

    return-void

    .line 25
    :cond_16
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    instance-of v1, p0, Landroid/app/Activity;

    if-nez v1, :cond_23

    return-void

    .line 26
    :cond_23
    const-string v1, "titlebar"

    invoke-static {v0, v1}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "topmenulay"

    invoke-static {v0, v2}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 27
    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_54

    instance-of v3, v2, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_54

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-nez v3, :cond_40

    goto :goto_54

    .line 28
    :cond_40
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-static {v0, p0, v1, v2}, Le/e/a/FullscreenScreen203;->install(Landroid/view/View;Landroid/view/ViewGroup;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)Le/e/a/FullscreenScreen203$State;
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_53} :catch_55

    .line 29
    goto :goto_5d

    .line 27
    :cond_54
    :goto_54
    return-void

    .line 29
    :catch_55
    move-exception p0

    const-string v0, "nicoid-layout"

    const-string v1, "Cannot attach fullscreen controls"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5d
    return-void
.end method
