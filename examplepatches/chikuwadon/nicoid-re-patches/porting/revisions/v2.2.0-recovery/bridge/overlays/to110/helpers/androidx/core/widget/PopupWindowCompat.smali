.class public final Landroidx/core/widget/PopupWindowCompat;
.super Ljava/lang/Object;
.source "PopupWindowCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static getOverlapAnchor(Landroid/widget/PopupWindow;)Z
    .registers 2
    .param p0, "popupWindow"    # Landroid/widget/PopupWindow;

    .line 75
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getOverlapAnchor()Z

    move-result v0

    return v0
.end method

.method public static getWindowLayoutType(Landroid/widget/PopupWindow;)I
    .registers 2
    .param p0, "popupWindow"    # Landroid/widget/PopupWindow;

    .line 98
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getWindowLayoutType()I

    move-result v0

    return v0
.end method

.method public static setOverlapAnchor(Landroid/widget/PopupWindow;Z)V
    .registers 2
    .param p0, "popupWindow"    # Landroid/widget/PopupWindow;
    .param p1, "overlapAnchor"    # Z

    .line 65
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setOverlapAnchor(Z)V

    .line 66
    return-void
.end method

.method public static setWindowLayoutType(Landroid/widget/PopupWindow;I)V
    .registers 2
    .param p0, "popupWindow"    # Landroid/widget/PopupWindow;
    .param p1, "layoutType"    # I

    .line 89
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setWindowLayoutType(I)V

    .line 90
    return-void
.end method

.method public static showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V
    .registers 5
    .param p0, "popup"    # Landroid/widget/PopupWindow;
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I
    .param p4, "gravity"    # I
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "popup.showAsDropDown(anchor, xoff, yoff, gravity)"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 54
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 55
    return-void
.end method
