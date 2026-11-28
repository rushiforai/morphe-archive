.class public final Landroidx/core/view/ViewCompat;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/view/ViewCompat$Api29Impl;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDisplay(Landroid/view/View;)Landroid/view/Display;
    .registers 1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p0

    return-object p0
.end method

.method public static getElevation(Landroid/view/View;)F
    .registers 1

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getElevation()F

    move-result p0

    return p0
.end method

.method public static getImportantForAutofill(Landroid/view/View;)I
    .registers 1

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getImportantForAutofill()I

    move-result p0

    return p0
.end method

.method public static getMinimumHeight(Landroid/view/View;)I
    .registers 1

    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result p0

    return p0
.end method

.method public static getMinimumWidth(Landroid/view/View;)I
    .registers 1

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getMinimumWidth()I

    move-result p0

    return p0
.end method

.method public static getPaddingEnd(Landroid/view/View;)I
    .registers 1

    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result p0

    return p0
.end method

.method public static getPaddingStart(Landroid/view/View;)I
    .registers 1

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result p0

    return p0
.end method

.method public static getRootWindowInsets(Landroid/view/View;)Landroidx/core/view/WindowInsetsCompat;
    .registers 4
    .param p0, "v"    # Landroid/view/View;

    .line 5111
    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    .line 5112
    .local v0, "wi":Landroid/view/WindowInsets;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 5114
    :cond_0
    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v1

    .line 5117
    .local v1, "insets":Landroidx/core/view/WindowInsetsCompat;
    invoke-virtual {v1, v1}, Landroidx/core/view/WindowInsetsCompat;->setRootWindowInsets(Landroidx/core/view/WindowInsetsCompat;)V

    .line 5118
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/core/view/WindowInsetsCompat;->init(Landroid/view/View;)V

    .line 5119
    return-object v1
.end method

.method public static hasTransientState(Landroid/view/View;)Z
    .registers 1

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->hasTransientState()Z

    move-result p0

    return p0
.end method

.method public static isNestedScrollingEnabled(Landroid/view/View;)Z
    .registers 1

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->isNestedScrollingEnabled()Z

    move-result p0

    return p0
.end method

.method public static offsetTopAndBottom(Landroid/view/View;I)V
    .registers 2

    .line 53
    invoke-virtual {p0, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    return-void
.end method

.method public static postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 2

    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V
    .registers 4

    .line 33
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public static saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V
    .registers 9

    .line 62
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 63
    invoke-static/range {p0 .. p6}, Landroidx/core/view/ViewCompat$Api29Impl;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 65
    :cond_0
    return-void
.end method

.method public static setElevation(Landroid/view/View;F)V
    .registers 2

    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    return-void
.end method

.method public static setImportantForAutofill(Landroid/view/View;I)V
    .registers 2

    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAutofill(I)V

    return-void
.end method

.method public static stopNestedScroll(Landroid/view/View;)V
    .registers 1

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->stopNestedScroll()V

    return-void
.end method
