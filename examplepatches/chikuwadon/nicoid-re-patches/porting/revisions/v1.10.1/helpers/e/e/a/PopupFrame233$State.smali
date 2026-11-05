.class final Le/e/a/PopupFrame233$State;
.super Ljava/lang/Object;
.source "PopupFrame233.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PopupFrame233;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
.end annotation


# instance fields
.field generation:I

.field image:Landroid/widget/ImageView;

.field final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final video:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final watch:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/view/View;)V
    .registers 4

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le/e/a/PopupFrame233$State$1;

    invoke-direct {v0, p0}, Le/e/a/PopupFrame233$State$1;-><init>(Le/e/a/PopupFrame233$State;)V

    iput-object v0, p0, Le/e/a/PopupFrame233$State;->watch:Ljava/lang/Runnable;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PopupFrame233$State;->owner:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/PopupFrame233$State;->video:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method clear()V
    .registers 4

    .line 6
    iget v0, p0, Le/e/a/PopupFrame233$State;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/PopupFrame233$State;->generation:I

    iget-object v0, p0, Le/e/a/PopupFrame233$State;->video:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v1, p0, Le/e/a/PopupFrame233$State;->watch:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_15
    iget-object v0, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    if-eqz v0, :cond_38

    iget-object v0, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_36

    iget-object v0, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v2, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_36
    iput-object v1, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    :cond_38
    return-void
.end method

.method dispose()V
    .registers 3

    .line 6
    invoke-virtual {p0}, Le/e/a/PopupFrame233$State;->clear()V

    iget-object v0, p0, Le/e/a/PopupFrame233$State;->video:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_15

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v1, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_15
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 6
    iget-object v0, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    if-eqz v0, :cond_9

    iget-object v0, p0, Le/e/a/PopupFrame233$State;->watch:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_9
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 6
    invoke-virtual {p0}, Le/e/a/PopupFrame233$State;->clear()V

    return-void
.end method
