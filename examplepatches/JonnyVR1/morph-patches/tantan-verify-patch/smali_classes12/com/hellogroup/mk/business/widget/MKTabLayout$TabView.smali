.class public Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TabView"
.end annotation


# instance fields
.field private a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

.field private b:Landroid/view/View;

.field final synthetic c:Lcom/hellogroup/mk/business/widget/MKTabLayout;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/content/Context;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout;->m:I

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p2, v0}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget p2, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout;->e:I

    .line 18
    .line 19
    iget v0, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout;->f:I

    .line 20
    .line 21
    iget v1, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout;->g:I

    .line 22
    .line 23
    iget p1, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout;->h:I

    .line 24
    .line 25
    invoke-static {p0, p2, v0, v1, p1}, Ll/kkl0;->z0(Landroid/view/View;IIII)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->setTab(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final b()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->c()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v2, v1

    .line 12
    :goto_0
    const/4 v3, 0x0

    .line 13
    if-eqz v2, :cond_4

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eq v1, p0, :cond_2

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    check-cast v1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/4 v4, -0x2

    .line 31
    invoke-direct {v1, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 44
    .line 45
    invoke-virtual {v4}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->u()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_3

    .line 50
    .line 51
    iget-object v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 52
    .line 53
    const/16 v5, 0x8

    .line 54
    .line 55
    invoke-virtual {v4, v5}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s(I)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 60
    .line 61
    const/16 v4, 0x53

    .line 62
    .line 63
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 67
    .line 68
    const/16 v4, 0x11

    .line 69
    .line 70
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 71
    .line 72
    :goto_1
    iput-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->b:Landroid/view/View;

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_4
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->b:Landroid/view/View;

    .line 76
    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->b:Landroid/view/View;

    .line 83
    .line 84
    :cond_5
    :goto_2
    if-eqz v0, :cond_6

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->e()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    const/4 v3, 0x1

    .line 93
    :cond_6
    invoke-virtual {p0, v3}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->setSelected(Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public getTab()Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Landroid/app/ActionBar$Tab;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Landroid/app/ActionBar$Tab;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    new-instance v2, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    const/4 v6, 0x1

    .line 28
    aget v7, v1, v6

    .line 29
    .line 30
    div-int/lit8 v8, v5, 0x2

    .line 31
    .line 32
    add-int/2addr v7, v8

    .line 33
    const/4 v8, 0x0

    .line 34
    aget v9, v1, v8

    .line 35
    .line 36
    div-int/2addr v4, v0

    .line 37
    add-int/2addr v9, v4

    .line 38
    invoke-static {p1}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 53
    .line 54
    sub-int v9, p1, v9

    .line 55
    .line 56
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->b()Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v3, p0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-ge v7, p1, :cond_1

    .line 71
    .line 72
    aget p1, v1, v6

    .line 73
    .line 74
    add-int/2addr p1, v5

    .line 75
    iget v0, v2, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    sub-int/2addr p1, v0

    .line 78
    const v0, 0x800035

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0, v9, p1}, Landroid/widget/Toast;->setGravity(III)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const/16 p1, 0x51

    .line 86
    .line 87
    invoke-virtual {p0, p1, v8, v5}, Landroid/widget/Toast;->setGravity(III)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 91
    .line 92
    .line 93
    return v6
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getTabMaxWidth()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-lez v2, :cond_1

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    if-le v0, v2, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 22
    .line 23
    iget p1, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout;->n:I

    .line 24
    .line 25
    const/high16 v0, -0x80000000

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public performClick()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g()V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    return v0
.end method

.method public setSelected(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->b:Landroid/view/View;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setTab(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->b()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
