.class final Le/e/a/FullscreenScreen203$State;
.super Ljava/lang/Object;
.source "FullscreenScreen203.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenScreen203;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
.end annotation


# instance fields
.field final bar:Landroid/widget/LinearLayout;

.field final barParams:Landroid/view/ViewGroup$LayoutParams;

.field final buttons:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final createdScroll:Z

.field final decor:Landroid/view/ViewGroup;

.field disposed:Z

.field final host:Landroid/view/View;

.field final index:I

.field last:Ljava/lang/String;

.field final layer:Landroid/widget/FrameLayout;

.field final oldBaseline:Z

.field final oldCutout:I

.field final oldGravity:I

.field final oldOrientation:I

.field final parent:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field final position:[I

.field final root:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final safe:Landroid/graphics/Rect;

.field final saved:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/FullscreenScreen203$Saved;",
            ">;"
        }
    .end annotation
.end field

.field testSafe:Landroid/graphics/Rect;

.field final title:Landroid/view/View;

.field final tools:Landroid/widget/LinearLayout;

.field final toolsIndex:I


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V
    .registers 16

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenScreen203$State;->buttons:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Le/e/a/FullscreenScreen203$State;->position:[I

    const-string v1, ""

    iput-object v1, p0, Le/e/a/FullscreenScreen203$State;->last:Ljava/lang/String;

    .line 51
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Le/e/a/FullscreenScreen203$State;->root:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    iput-object p3, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Le/e/a/FullscreenScreen203$State;->parent:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p2

    iput p2, p0, Le/e/a/FullscreenScreen203$State;->index:I

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iput-object p2, p0, Le/e/a/FullscreenScreen203$State;->barParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result p2

    iput p2, p0, Le/e/a/FullscreenScreen203$State;->oldOrientation:I

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getGravity()I

    move-result p2

    iput p2, p0, Le/e/a/FullscreenScreen203$State;->oldGravity:I

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->isBaselineAligned()Z

    move-result p2

    iput-boolean p2, p0, Le/e/a/FullscreenScreen203$State;->oldBaseline:Z

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    const-string v1, "nicoid-fullscreen-screen-controls"

    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    const-string p2, "titlebartext"

    invoke-static {p1, p2}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    const/4 p2, 0x1

    :try_start_7f
    const-string v2, "PlayerButtons192"

    const-string v3, "host"

    new-array v4, p2, [Ljava/lang/Class;

    const-class v5, Landroid/view/View;

    aput-object v5, v4, v1

    new-array v5, p2, [Ljava/lang/Object;

    aput-object p4, v5, v1

    invoke-static {v2, v3, v4, v5}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_99

    check-cast v2, Landroid/view/View;
    :try_end_97
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_97} :catch_98

    goto :goto_9a

    :catch_98
    move-exception v2

    :cond_99
    move-object v2, p4

    :goto_9a
    if-ne v2, p4, :cond_9e

    const/4 v3, 0x1

    goto :goto_9f

    :cond_9e
    const/4 v3, 0x0

    :goto_9f
    iput-boolean v3, p0, Le/e/a/FullscreenScreen203$State;->createdScroll:Z

    invoke-virtual {p3, p4}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result p3

    iput p3, p0, Le/e/a/FullscreenScreen203$State;->toolsIndex:I

    iget-boolean p3, p0, Le/e/a/FullscreenScreen203$State;->createdScroll:Z

    if-eqz p3, :cond_ba

    new-instance v2, Landroid/widget/HorizontalScrollView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {v2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    invoke-virtual {v2, v1}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    :cond_ba
    iput-object v2, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    .line 52
    const-string v9, "comments"

    const-string v10, "fullscreen"

    const-string v3, "speed"

    const-string v4, "quality"

    const-string v5, "popup"

    const-string v6, "background"

    const-string v7, "mute"

    const-string v8, "repeat"

    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    move-result-object p3

    const/4 p4, 0x0

    :goto_d1
    const/16 v2, 0x8

    if-lt p4, v2, :cond_151

    .line 54
    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    new-instance p3, Le/e/a/FullscreenScreen203$Saved;

    iget-object p4, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-direct {p3, p4}, Le/e/a/FullscreenScreen203$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    new-instance p3, Le/e/a/FullscreenScreen203$Saved;

    iget-object p4, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-direct {p3, p4}, Le/e/a/FullscreenScreen203$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean p2, p0, Le/e/a/FullscreenScreen203$State;->createdScroll:Z

    if-nez p2, :cond_103

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    iget-object p3, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    if-eq p2, p3, :cond_103

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    new-instance p3, Le/e/a/FullscreenScreen203$Saved;

    iget-object p4, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-direct {p3, p4}, Le/e/a/FullscreenScreen203$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_103
    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    if-eqz p2, :cond_113

    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    new-instance p3, Le/e/a/FullscreenScreen203$Saved;

    iget-object p4, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    invoke-direct {p3, p4}, Le/e/a/FullscreenScreen203$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_113
    :goto_113
    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p2

    if-lt v1, p2, :cond_13e

    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    instance-of p2, p1, Landroid/app/Activity;

    if-eqz p2, :cond_13a

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1c

    if-lt p2, p3, :cond_13a

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    goto :goto_13b

    :cond_13a
    const/4 p1, -0x1

    :goto_13b
    iput p1, p0, Le/e/a/FullscreenScreen203$State;->oldCutout:I

    .line 56
    return-void

    .line 54
    :cond_13e
    iget-object p2, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    new-instance p3, Le/e/a/FullscreenScreen203$Saved;

    iget-object p4, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {p4, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-direct {p3, p4}, Le/e/a/FullscreenScreen203$Saved;-><init>(Landroid/view/View;)V

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_113

    .line 52
    :cond_151
    aget-object v2, p3, p4

    :try_start_153
    const-string v3, "PlayerControls194"

    const-string v4, "button"

    new-array v5, v0, [Ljava/lang/Class;

    const-class v6, Landroid/view/View;

    aput-object v6, v5, v1

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, p2

    new-array v6, v0, [Ljava/lang/Object;

    aput-object p1, v6, v1

    aput-object v2, v6, p2

    invoke-static {v3, v4, v5, v6}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Landroid/view/View;

    if-eqz v4, :cond_178

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->buttons:Ljava/util/Map;

    check-cast v3, Landroid/view/View;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_176
    .catch Ljava/lang/Exception; {:try_start_153 .. :try_end_176} :catch_177

    goto :goto_178

    :catch_177
    move-exception v2

    :cond_178
    :goto_178
    add-int/lit8 p4, p4, 0x1

    goto/16 :goto_d1
.end method


# virtual methods
.method attach()V
    .registers 9

    .line 57
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-boolean v1, p0, Le/e/a/FullscreenScreen203$State;->createdScroll:Z

    const/16 v2, 0x30

    if-eqz v1, :cond_4d

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    check-cast v1, Landroid/widget/HorizontalScrollView;

    iget-object v3, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, -0x2

    invoke-direct {v4, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    const/4 v4, 0x0

    iget v5, p0, Le/e/a/FullscreenScreen203$State;->toolsIndex:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_4d
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    iget-object v3, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v5, 0x33

    const/4 v6, -0x1

    invoke-direct {v4, v6, v2, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 58
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_9e

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_9e

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/4 v2, 0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_9e
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestApplyInsets()V

    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->layout()V

    return-void
.end method

.method bounds()V
    .registers 5

    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method coordinates()Ljava/lang/String;
    .registers 7

    .line 75
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Le/e/a/FullscreenScreen203;->rect(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/FullscreenScreen203;->rect(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_1a
    if-gez v2, :cond_1e

    const/4 v2, 0x0

    goto :goto_30

    :cond_1e
    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_a8

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    :goto_30
    invoke-static {v2}, Le/e/a/FullscreenScreen203;->rect(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    iget-object v5, p0, Le/e/a/FullscreenScreen203$State;->position:[I

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "fullscreen root="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " decor="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    invoke-static {v4}, Le/e/a/FullscreenScreen203;->rect(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " safe="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " toolbar="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " last="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " topGapPx="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->position:[I

    aget v3, v4, v3

    sub-int/2addr v1, v3

    iget-object v3, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " rightGapPx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Le/e/a/FullscreenScreen203$State;->position:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    sub-int/2addr v2, v3

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_a8
    add-int/lit8 v2, v2, -0x1

    goto/16 :goto_1a
.end method

.method layout()V
    .registers 16

    .line 62
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-boolean v1, p0, Le/e/a/FullscreenScreen203$State;->disposed:Z

    if-nez v1, :cond_2c0

    if-nez v0, :cond_10

    goto/16 :goto_2c0

    :cond_10
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->bounds()V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-nez v1, :cond_1c

    return-void

    .line 63
    :cond_1c
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2}, Le/e/a/FullscreenViewport209;->update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "player_buttons_hidden_v1"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->buttons:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3f
    :goto_3f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/16 v4, 0x8

    if-nez v3, :cond_2a5

    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x28

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    mul-int/lit8 v2, v3, 0x2

    sub-int/2addr v1, v2

    const/4 v6, 0x0

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 65
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v8, 0x0

    :goto_67
    iget-object v9, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v9

    const/high16 v10, 0x3f800000    # 1.0f

    if-lt v1, v9, :cond_1cd

    .line 68
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/FullscreenScreen203;->padding(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getGravity()I

    move-result v1

    const/16 v4, 0x15

    if-eq v1, v4, :cond_85

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    :cond_85
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-static {v1, v8, v5}, Le/e/a/FullscreenScreen203;->set(Landroid/view/View;II)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    iget-object v9, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    if-eq v1, v9, :cond_a3

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-static {v1}, Le/e/a/FullscreenScreen203;->padding(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-static {v1}, Le/e/a/FullscreenScreen203;->minimum(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v1, v9, v5}, Le/e/a/FullscreenScreen203;->set(Landroid/view/View;II)V

    :cond_a3
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    if-eqz v1, :cond_cb

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    invoke-static {v1, v6, v5}, Le/e/a/FullscreenScreen203;->set(Landroid/view/View;II)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v1, :cond_cb

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v9, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v9, v9, v10

    if-eqz v9, :cond_cb

    iput v10, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v9, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    invoke-virtual {v9, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    :cond_cb
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/FullscreenScreen203;->padding(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/FullscreenScreen203;->minimum(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->isBaselineAligned()Z

    move-result v1

    if-eqz v1, :cond_ed

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V

    :cond_ed
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    if-eqz v1, :cond_fa

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    :cond_fa
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getGravity()I

    move-result v1

    if-eq v1, v4, :cond_107

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 70
    :cond_107
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v2, :cond_112

    const/4 v5, 0x0

    :cond_112
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    if-ne v2, v7, :cond_12c

    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    if-ne v2, v5, :cond_12c

    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v3

    if-ne v2, v4, :cond_12c

    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v3

    if-eq v2, v4, :cond_14b

    :cond_12c
    iput v7, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    iput v5, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const/16 v2, 0x33

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v3

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->safe:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v3

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v6, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iput v6, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    :cond_14b
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    iget-object v3, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->title:Landroid/view/View;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/FullscreenViewport209;->top(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "player_controls_visibility_mode"

    const-string v2, "off"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "normal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_187

    const-string v1, "both"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_177

    goto :goto_187

    :cond_177
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->parent:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_191

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    invoke-static {v0, v1}, Le/e/a/FullscreenScreen203;->inherit(Landroid/view/View;Landroid/view/View;)V

    goto :goto_191

    :cond_187
    :goto_187
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/PlayerFrame202;->show(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    invoke-static {v0}, Le/e/a/PlayerFrame202;->show(Landroid/view/View;)V

    .line 72
    :cond_191
    :goto_191
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_1b1

    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_1b1

    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    check-cast v0, Landroid/widget/HorizontalScrollView;

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    sub-int/2addr v8, v1

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1, v6}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    .line 73
    :cond_1b1
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->coordinates()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->last:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1cc

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    if-lez v1, :cond_1cc

    iput-object v0, p0, Le/e/a/FullscreenScreen203$State;->last:Ljava/lang/String;

    const-string v1, "nicoid-layout"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    :cond_1cc
    return-void

    .line 65
    :cond_1cd
    iget-object v9, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-ne v11, v4, :cond_1db

    goto/16 :goto_2a1

    :cond_1db
    add-int/lit8 v2, v2, 0x1

    const-string v11, "modern-speed"

    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1f7

    const-string v11, "modern-quality"

    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1f7

    const/4 v11, 0x0

    goto :goto_1f8

    :cond_1f7
    const/4 v11, 0x1

    :goto_1f8
    if-eqz v11, :cond_205

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    const/16 v13, 0x34

    invoke-static {v12, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    goto :goto_20f

    :cond_205
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    const/16 v13, 0x2c

    invoke-static {v12, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    :goto_20f
    add-int/2addr v8, v12

    .line 66
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v13, v12, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    invoke-static {v12, v13}, Le/e/a/FullscreenScreen203;->same(Landroid/view/ViewGroup$LayoutParams;Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v12

    if-nez v12, :cond_222

    invoke-virtual {v9, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_222
    invoke-static {v9}, Le/e/a/FullscreenScreen203;->minimum(Landroid/view/View;)V

    invoke-static {v9}, Le/e/a/FullscreenScreen203;->padding(Landroid/view/View;)V

    invoke-virtual {v9}, Landroid/view/View;->getScaleX()F

    move-result v12

    cmpl-float v12, v12, v10

    if-eqz v12, :cond_233

    invoke-virtual {v9, v10}, Landroid/view/View;->setScaleX(F)V

    :cond_233
    invoke-virtual {v9}, Landroid/view/View;->getScaleY()F

    move-result v12

    cmpl-float v12, v12, v10

    if-eqz v12, :cond_23e

    invoke-virtual {v9, v10}, Landroid/view/View;->setScaleY(F)V

    :cond_23e
    instance-of v10, v9, Landroid/widget/TextView;

    if-eqz v10, :cond_285

    move-object v10, v9

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getMinWidth()I

    move-result v12

    if-eqz v12, :cond_24e

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setMinWidth(I)V

    :cond_24e
    invoke-virtual {v10}, Landroid/widget/TextView;->getMinHeight()I

    move-result v12

    if-eqz v12, :cond_257

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setMinHeight(I)V

    :cond_257
    invoke-virtual {v10}, Landroid/widget/TextView;->getGravity()I

    move-result v12

    const/16 v13, 0x11

    if-eq v12, v13, :cond_262

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setGravity(I)V

    :cond_262
    invoke-virtual {v10}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    const/4 v13, 0x2

    const/high16 v14, 0x41600000    # 14.0f

    invoke-static {v13, v14, v12}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v12

    invoke-virtual {v10}, Landroid/widget/TextView;->getTextSize()F

    move-result v13

    cmpl-float v12, v13, v12

    if-eqz v12, :cond_27c

    invoke-virtual {v10, v14}, Landroid/widget/TextView;->setTextSize(F)V

    :cond_27c
    invoke-virtual {v10}, Landroid/widget/TextView;->getIncludeFontPadding()Z

    move-result v12

    if-eqz v12, :cond_285

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 67
    :cond_285
    if-nez v11, :cond_2a1

    invoke-virtual {v9}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v10, :cond_2a1

    invoke-virtual {v9}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    instance-of v10, v10, Le/e/a/FullscreenScreen203$Glyph;

    if-nez v10, :cond_2a1

    new-instance v10, Le/e/a/FullscreenScreen203$Glyph;

    invoke-virtual {v9}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-direct {v10, v11}, Le/e/a/FullscreenScreen203$Glyph;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    :cond_2a1
    :goto_2a1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_67

    .line 63
    :cond_2a5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3f

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3f

    .line 62
    :cond_2c0
    :goto_2c0
    return-void
.end method

.method public onPreDraw()Z
    .registers 2

    .line 76
    invoke-virtual {p0}, Le/e/a/FullscreenScreen203$State;->layout()V

    const/4 v0, 0x1

    return v0
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 77
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 78
    invoke-static {p1}, Le/e/a/FullscreenScreen203;->restore(Landroid/view/View;)V

    return-void
.end method

.method restore()V
    .registers 7

    .line 79
    iget-boolean v0, p0, Le/e/a/FullscreenScreen203$State;->disposed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/FullscreenScreen203$State;->disposed:Z

    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->decor:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_1d
    iget-object v0, p0, Le/e/a/FullscreenScreen203$State;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_2a

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_2a
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->layer:Landroid/widget/FrameLayout;

    invoke-static {v1}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-boolean v1, p0, Le/e/a/FullscreenScreen203$State;->createdScroll:Z

    if-eqz v1, :cond_68

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->host:Landroid/view/View;

    invoke-static {v1}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->tools:Landroid/widget/LinearLayout;

    iget v3, p0, Le/e/a/FullscreenScreen203$State;->toolsIndex:I

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v5, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/FullscreenScreen203$Saved;

    iget-object v4, v4, Le/e/a/FullscreenScreen203$Saved;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-static {v4}, Le/e/a/FullscreenScreen203;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_68
    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->saved:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_d0

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget v2, p0, Le/e/a/FullscreenScreen203$State;->oldOrientation:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget v2, p0, Le/e/a/FullscreenScreen203$State;->oldGravity:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget-boolean v2, p0, Le/e/a/FullscreenScreen203$State;->oldBaseline:Z

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V

    iget-object v1, p0, Le/e/a/FullscreenScreen203$State;->parent:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_a4

    iget-object v2, p0, Le/e/a/FullscreenScreen203$State;->bar:Landroid/widget/LinearLayout;

    iget v3, p0, Le/e/a/FullscreenScreen203$State;->index:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget-object v4, p0, Le/e/a/FullscreenScreen203$State;->barParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 80
    :cond_a4
    if-nez v0, :cond_a8

    const/4 v0, 0x0

    goto :goto_b0

    :cond_a8
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    :goto_b0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_cf

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_cf

    iget v1, p0, Le/e/a/FullscreenScreen203$State;->oldCutout:I

    if-ltz v1, :cond_cf

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget v2, p0, Le/e/a/FullscreenScreen203$State;->oldCutout:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_cf
    return-void

    .line 79
    :cond_d0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FullscreenScreen203$Saved;

    invoke-virtual {v2}, Le/e/a/FullscreenScreen203$Saved;->restore()V

    goto :goto_6e
.end method
