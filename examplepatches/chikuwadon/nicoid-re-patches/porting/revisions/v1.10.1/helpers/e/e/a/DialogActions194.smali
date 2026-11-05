.class public final Le/e/a/DialogActions194;
.super Ljava/lang/Object;
.source "DialogActions194.java"


# static fields
.field private static final LAYOUT:Landroid/view/View$OnLayoutChangeListener;

.field private static final WATCHED:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/DialogActions194;->WATCHED:Ljava/util/Set;

    .line 9
    new-instance v0, Le/e/a/DialogActions194$1;

    invoke-direct {v0}, Le/e/a/DialogActions194$1;-><init>()V

    sput-object v0, Le/e/a/DialogActions194;->LAYOUT:Landroid/view/View$OnLayoutChangeListener;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/widget/LinearLayout;)V
    .registers 1
    .param p0, "x0"    # Landroid/widget/LinearLayout;

    .line 7
    invoke-static {p0}, Le/e/a/DialogActions194;->fit(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method private static fit(Landroid/widget/LinearLayout;)V
    .registers 9
    .param p0, "row"    # Landroid/widget/LinearLayout;

    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    if-gtz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    .local v0, "needed":I
    const/4 v1, 0x0

    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_6e

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .local v3, "v":Landroid/view/View;
    instance-of v4, v3, Landroid/widget/Button;

    if-eqz v4, :cond_6b

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_29

    goto :goto_6b

    :cond_29
    move-object v4, v3

    check-cast v4, Landroid/widget/Button;

    .local v4, "b":Landroid/widget/Button;
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v4}, Landroid/widget/Button;->getMinimumWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/widget/Button;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-virtual {v4}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v6

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    invoke-virtual {v4}, Landroid/widget/Button;->getPaddingLeft()I

    move-result v7

    add-int/2addr v6, v7

    invoke-virtual {v4}, Landroid/widget/Button;->getPaddingRight()I

    move-result v7

    add-int/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int/2addr v0, v5

    invoke-virtual {v4}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_6b

    invoke-virtual {v4}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .local v5, "p":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v6, v7

    add-int/2addr v0, v6

    .end local v3    # "v":Landroid/view/View;
    .end local v4    # "b":Landroid/widget/Button;
    .end local v5    # "p":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_6b
    :goto_6b
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .end local v2    # "i":I
    :cond_6e
    const/4 v2, 0x1

    if-le v1, v2, :cond_78

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v3

    if-le v0, v3, :cond_78

    goto :goto_79

    :cond_78
    const/4 v2, 0x0

    .local v2, "direction":I
    :goto_79
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    if-eq v3, v2, :cond_98

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v3, 0x800015

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .local v3, "p":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v3, :cond_98

    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v5, -0x2

    if-eq v4, v5, :cond_98

    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .end local v3    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_98
    return-void
.end method

.method public static watch(Landroid/app/AlertDialog;)V
    .registers 4
    .param p0, "d"    # Landroid/app/AlertDialog;

    .line 11
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .local v0, "b":Landroid/widget/Button;
    if-nez v0, :cond_c

    const/4 v1, -0x2

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    :cond_c
    if-nez v0, :cond_13

    const/4 v1, -0x3

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    :cond_13
    if-eqz v0, :cond_34

    invoke-virtual {v0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-nez v1, :cond_1e

    goto :goto_34

    :cond_1e
    invoke-virtual {v0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .local v1, "row":Landroid/widget/LinearLayout;
    sget-object v2, Le/e/a/DialogActions194;->WATCHED:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    sget-object v2, Le/e/a/DialogActions194;->LAYOUT:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_31
    invoke-static {v1}, Le/e/a/DialogActions194;->fit(Landroid/widget/LinearLayout;)V

    .end local v1    # "row":Landroid/widget/LinearLayout;
    :cond_34
    :goto_34
    return-void
.end method
