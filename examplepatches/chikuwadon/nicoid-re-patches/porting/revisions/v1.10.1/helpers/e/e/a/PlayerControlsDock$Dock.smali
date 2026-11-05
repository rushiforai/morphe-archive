.class final Le/e/a/PlayerControlsDock$Dock;
.super Ljava/lang/Object;
.source "PlayerControlsDock.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerControlsDock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Dock"
.end annotation


# instance fields
.field arranged:Z

.field final bar:Landroid/view/View;

.field final bottom:Landroid/view/View;

.field final bounds:Landroid/graphics/Rect;

.field final central:Landroid/view/View;

.field final comments:Landroid/view/View;

.field final controller:Landroid/view/View;

.field final frame:Landroid/widget/RelativeLayout;

.field final info:Landroid/view/View;

.field final location:[I

.field final order:[Landroid/view/View;

.field final origin:[I

.field final pictureHeight:I

.field final play:Landroid/view/View;

.field final post:Landroid/view/View;

.field final previous:Landroid/graphics/Rect;

.field final rootView:Landroid/view/View;

.field final top:Landroid/view/View;

.field final video:Landroid/view/View;

.field final videoView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/widget/RelativeLayout;)V
    .registers 13

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->origin:[I

    new-array v1, v0, [I

    iput-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->location:[I

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->bounds:Landroid/graphics/Rect;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->previous:Landroid/graphics/Rect;

    .line 25
    iput-object p1, p0, Le/e/a/PlayerControlsDock$Dock;->rootView:Landroid/view/View;

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->frame:Landroid/widget/RelativeLayout;

    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v1, :cond_2d

    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iget p2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_37

    :cond_2d
    invoke-virtual {p2}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    const/16 v1, 0xb4

    invoke-static {p2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p2

    :goto_37
    iput p2, p0, Le/e/a/PlayerControlsDock$Dock;->pictureHeight:I

    const-string p2, "titlebar"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->bar:Landroid/view/View;

    const-string p2, "topmenulay"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->top:Landroid/view/View;

    const-string p2, "bottommenulay"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->bottom:Landroid/view/View;

    const-string p2, "controller"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->controller:Landroid/view/View;

    const-string p2, "video"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->video:Landroid/view/View;

    const-string p2, "commentlay"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->comments:Landroid/view/View;

    const-string p2, "video_view"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->videoView:Landroid/view/View;

    const-string p2, "viewctrllay"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->central:Landroid/view/View;

    const-string p2, "viewbutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->play:Landroid/view/View;

    const-string p2, "commentpostbutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->post:Landroid/view/View;

    const-string p2, "infobutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, p2}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->info:Landroid/view/View;

    iget-object p2, p0, Le/e/a/PlayerControlsDock$Dock;->info:Landroid/view/View;

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->post:Landroid/view/View;

    iget-object v2, p0, Le/e/a/PlayerControlsDock$Dock;->play:Landroid/view/View;

    const-string v3, "modern-speed"

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    const-string v4, "modern-quality"

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    const-string v5, "popupbutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v5}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    const-string v6, "repeatbutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v6}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v6

    const-string v7, "commentbutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v7}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7

    const-string v8, "fullscbutton"

    # invokes: Le/e/a/PlayerControlsDock;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v8}, Le/e/a/PlayerControlsDock;->access$0(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    const/16 v8, 0x9

    new-array v8, v8, [Landroid/view/View;

    const/4 v9, 0x0

    aput-object p2, v8, v9

    const/4 p2, 0x1

    aput-object v1, v8, p2

    aput-object v2, v8, v0

    const/4 p2, 0x3

    aput-object v3, v8, p2

    const/4 p2, 0x4

    aput-object v4, v8, p2

    const/4 p2, 0x5

    aput-object v5, v8, p2

    const/4 p2, 0x6

    aput-object v6, v8, p2

    const/4 p2, 0x7

    aput-object v7, v8, p2

    const/16 p2, 0x8

    aput-object p1, v8, p2

    iput-object v8, p0, Le/e/a/PlayerControlsDock$Dock;->order:[Landroid/view/View;

    return-void
.end method


# virtual methods
.method arrange()V
    .registers 8

    .line 30
    iget-boolean v0, p0, Le/e/a/PlayerControlsDock$Dock;->arranged:Z

    if-nez v0, :cond_3f

    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->top:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-nez v0, :cond_b

    goto :goto_3f

    :cond_b
    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->top:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->order:[Landroid/view/View;

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_14
    if-lt v3, v2, :cond_1f

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->rootView:Landroid/view/View;

    invoke-static {v0, v1}, Le/e/a/PlayerControls194;->arrange(Landroid/widget/LinearLayout;Landroid/view/View;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/PlayerControlsDock$Dock;->arranged:Z

    return-void

    :cond_1f
    aget-object v5, v1, v3

    if-eqz v5, :cond_3c

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    if-eq v6, v0, :cond_2a

    goto :goto_3c

    :cond_2a
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    if-eq v6, v4, :cond_3a

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {v0, v5, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_3a
    add-int/lit8 v4, v4, 0x1

    :cond_3c
    :goto_3c
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    :cond_3f
    :goto_3f
    return-void
.end method

.method clip(Landroid/view/View;II)V
    .registers 12

    .line 33
    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e.e.a.t"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_1d

    const-string v1, "e.e.a.u"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c8

    :cond_1d
    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->location:[I

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->origin:[I

    aget v0, v0, v3

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->location:[I

    aget v1, v1, v3

    sub-int/2addr v0, v1

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v4, p0, Le/e/a/PlayerControlsDock$Dock;->origin:[I

    aget v4, v4, v3

    iget-object v5, p0, Le/e/a/PlayerControlsDock$Dock;->frame:Landroid/widget/RelativeLayout;

    invoke-virtual {v5}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Le/e/a/PlayerControlsDock$Dock;->location:[I

    aget v5, v5, v3

    sub-int/2addr v4, v5

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v4, p0, Le/e/a/PlayerControlsDock$Dock;->origin:[I

    aget v4, v4, v2

    add-int/2addr v4, p2

    iget-object v5, p0, Le/e/a/PlayerControlsDock$Dock;->location:[I

    aget v5, v5, v2

    sub-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v5

    iget-object v6, p0, Le/e/a/PlayerControlsDock$Dock;->origin:[I

    aget v6, v6, v2

    iget-object v7, p0, Le/e/a/PlayerControlsDock$Dock;->frame:Landroid/widget/RelativeLayout;

    invoke-virtual {v7}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v7

    add-int/2addr v6, v7

    sub-int/2addr v6, p3

    iget-object v7, p0, Le/e/a/PlayerControlsDock$Dock;->location:[I

    aget v7, v7, v2

    sub-int/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    iget-object v6, p0, Le/e/a/PlayerControlsDock$Dock;->bounds:Landroid/graphics/Rect;

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v6, v0, v4, v1, v5}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->previous:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->getClipBounds(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_8d

    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->bounds:Landroid/graphics/Rect;

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->previous:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c8

    :cond_8d
    iget-object v0, p0, Le/e/a/PlayerControlsDock$Dock;->bounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    :try_start_92
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v3

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v2

    invoke-virtual {v0, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/PlayerControlsDock$Dock;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v1, v3

    iget-object v4, p0, Le/e/a/PlayerControlsDock$Dock;->bounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_c6} :catch_c7

    goto :goto_c8

    :catch_c7
    move-exception v0

    :cond_c8
    :goto_c8
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_e2

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    :goto_d1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v3, v0, :cond_d8

    goto :goto_e2

    :cond_d8
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Le/e/a/PlayerControlsDock$Dock;->clip(Landroid/view/View;II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_d1

    :cond_e2
    :goto_e2
    return-void
.end method

.method dock(Landroid/view/View;)Z
    .registers 5

    .line 27
    const/4 v0, 0x0

    if-eqz p1, :cond_39

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerControlsDock$Dock;->frame:Landroid/widget/RelativeLayout;

    if-ne v1, v2, :cond_c

    goto :goto_39

    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_15

    return v0

    :cond_15
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->frame:Landroid/widget/RelativeLayout;

    instance-of v2, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v2, :cond_2a

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/widget/RelativeLayout$LayoutParams;)V

    goto :goto_2f

    :cond_2a
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_2f
    invoke-virtual {v1, p1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 p1, 0x1

    return p1

    :cond_39
    :goto_39
    return v0
.end method

.method fit(Landroid/view/View;)Z
    .registers 6

    .line 31
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_12

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v2, v3, :cond_12

    return v0

    :cond_12
    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    return p1
.end method

.method inset(Landroid/view/View;II)Z
    .registers 8

    .line 32
    const/4 v0, 0x0

    if-eqz p1, :cond_2b

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v1, :cond_c

    goto :goto_2b

    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    const/4 v3, -0x1

    if-ne v2, p2, :cond_20

    iget v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    if-ne v2, p3, :cond_20

    iget v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    if-ne v2, v3, :cond_20

    return v0

    :cond_20
    iput p2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iput p3, v1, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    iput v3, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    return p1

    :cond_2b
    :goto_2b
    return v0
.end method

.method public onPreDraw()Z
    .registers 2

    invoke-static {p0}, Le/e/a/PlayerFrame202;->dock(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method show(Landroid/view/View;)Z
    .registers 6

    .line 26
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    if-nez v1, :cond_1c

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1c

    invoke-virtual {p1}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    if-nez v1, :cond_1c

    const/4 v1, 0x0

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x1

    :goto_1d
    if-eqz v1, :cond_2f

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    :cond_2f
    return v1
.end method

.method upper(Landroid/view/View;)Z
    .registers 6

    .line 28
    const/4 v0, 0x0

    if-eqz p1, :cond_44

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->top:Landroid/view/View;

    instance-of v1, v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_44

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerControlsDock$Dock;->top:Landroid/view/View;

    if-ne v1, v2, :cond_12

    goto :goto_44

    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_1b

    return v0

    :cond_1b
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/PlayerControlsDock$Dock;->frame:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x24

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget-object v2, p0, Le/e/a/PlayerControlsDock$Dock;->top:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, p1}, Le/e/a/PlayerControlsDock$Dock;->show(Landroid/view/View;)Z

    const/4 p1, 0x1

    return p1

    :cond_44
    :goto_44
    return v0
.end method
