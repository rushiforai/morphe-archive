.class final Le/e/a/CommentGraph215$Binding;
.super Ljava/lang/Object;
.source "CommentGraph215.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentGraph215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Binding"
.end annotation


# instance fields
.field final controllerId:I

.field disposed:Z

.field host:Landroid/view/View;

.field final hostLocation:[I

.field observer:Landroid/view/ViewTreeObserver;

.field final overlay:Le/e/a/CommentGraph215$Overlay;

.field final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final popup:Z

.field final prefs:Landroid/content/SharedPreferences;

.field final root:Landroid/view/View;

.field final seek:Landroid/widget/SeekBar;

.field final seekLocation:[I

.field snapshot:Le/e/a/CommentGraph215$Snapshot;

.field final transform:Landroid/view/animation/Transformation;

.field visualAlpha:F

.field visualX:I

.field visualY:I


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/view/View;Landroid/widget/SeekBar;Z)V
    .registers 9

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Le/e/a/CommentGraph215$Binding;->visualAlpha:F

    const/high16 v0, -0x80000000

    iput v0, p0, Le/e/a/CommentGraph215$Binding;->visualX:I

    iput v0, p0, Le/e/a/CommentGraph215$Binding;->visualY:I

    const/4 v0, 0x2

    new-array v1, v0, [I

    iput-object v1, p0, Le/e/a/CommentGraph215$Binding;->hostLocation:[I

    new-array v0, v0, [I

    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->seekLocation:[I

    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->transform:Landroid/view/animation/Transformation;

    .line 32
    invoke-virtual {p3}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p3}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "controller"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Le/e/a/CommentGraph215$Binding;->controllerId:I

    iput-boolean p4, p0, Le/e/a/CommentGraph215$Binding;->popup:Z

    new-instance p4, Ljava/lang/ref/WeakReference;

    invoke-direct {p4, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Le/e/a/CommentGraph215$Binding;->owner:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    iput-object p3, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    new-instance p1, Le/e/a/CommentGraph215$Overlay;

    invoke-direct {p1, p0}, Le/e/a/CommentGraph215$Overlay;-><init>(Le/e/a/CommentGraph215$Binding;)V

    iput-object p1, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/CommentGraph215$Binding;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method controlsAlpha()F
    .registers 9

    .line 44
    iget-boolean v0, p0, Le/e/a/CommentGraph215$Binding;->disposed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_7d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-eqz v0, :cond_7d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->isShown()Z

    move-result v0

    if-eqz v0, :cond_7d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getWidth()I

    move-result v0

    if-eqz v0, :cond_7d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_7d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2c

    goto :goto_7d

    .line 45
    :cond_2c
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    .line 46
    const/high16 v2, 0x3f800000    # 1.0f

    move v3, v2

    :goto_31
    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-ne v0, v4, :cond_3a

    .line 53
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0

    .line 47
    :cond_3a
    if-eqz v0, :cond_7c

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_43

    goto :goto_7c

    .line 48
    :cond_43
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v4

    mul-float/2addr v3, v4

    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v4

    .line 49
    if-eqz v4, :cond_63

    iget-object v5, p0, Le/e/a/CommentGraph215$Binding;->transform:Landroid/view/animation/Transformation;

    invoke-virtual {v5}, Landroid/view/animation/Transformation;->clear()V

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    iget-object v7, p0, Le/e/a/CommentGraph215$Binding;->transform:Landroid/view/animation/Transformation;

    invoke-virtual {v4, v5, v6, v7}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->transform:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v4

    mul-float/2addr v3, v4

    .line 50
    :cond_63
    const v4, 0x3a83126f    # 0.001f

    cmpg-float v4, v3, v4

    if-gtz v4, :cond_6b

    return v1

    :cond_6b
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/View;

    if-eqz v4, :cond_7a

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_31

    :cond_7a
    const/4 v0, 0x0

    goto :goto_31

    .line 47
    :cond_7c
    :goto_7c
    return v1

    .line 44
    :cond_7d
    :goto_7d
    return v1
.end method

.method dispose()V
    .registers 4

    .line 35
    iget-boolean v0, p0, Le/e/a/CommentGraph215$Binding;->disposed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentGraph215$Binding;->disposed:Z

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_2d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_2d
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->observer:Landroid/view/ViewTreeObserver;

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-eqz v1, :cond_4a

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v1

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v1, v2}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    if-eq v1, v2, :cond_4a

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_4a
    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    sget-object v1, Le/e/a/CommentGraph215;->BINDINGS:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_65

    sget-object v1, Le/e/a/CommentGraph215;->BINDINGS:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_65
    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->snapshot:Le/e/a/CommentGraph215$Snapshot;

    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 62
    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->refresh()V

    return-void
.end method

.method public onPreDraw()Z
    .registers 7

    .line 56
    iget-boolean v0, p0, Le/e/a/CommentGraph215$Binding;->disposed:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->syncHost()V

    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->controlsAlpha()F

    move-result v0

    iget v2, p0, Le/e/a/CommentGraph215$Binding;->visualAlpha:F

    cmpl-float v2, v0, v2

    const/4 v3, 0x0

    if-eqz v2, :cond_16

    move v2, v1

    goto :goto_17

    :cond_16
    move v2, v3

    :goto_17
    iput v0, p0, Le/e/a/CommentGraph215$Binding;->visualAlpha:F

    .line 57
    const/4 v4, 0x0

    cmpl-float v0, v0, v4

    if-lez v0, :cond_4e

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->hostLocation:[I

    invoke-virtual {v0, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->seekLocation:[I

    invoke-virtual {v0, v4}, Landroid/widget/SeekBar;->getLocationOnScreen([I)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seekLocation:[I

    aget v0, v0, v3

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->hostLocation:[I

    aget v4, v4, v3

    sub-int/2addr v0, v4

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->seekLocation:[I

    aget v4, v4, v1

    iget-object v5, p0, Le/e/a/CommentGraph215$Binding;->hostLocation:[I

    aget v5, v5, v1

    sub-int/2addr v4, v5

    iget v5, p0, Le/e/a/CommentGraph215$Binding;->visualX:I

    if-ne v0, v5, :cond_48

    iget v5, p0, Le/e/a/CommentGraph215$Binding;->visualY:I

    if-ne v4, v5, :cond_48

    move v5, v3

    goto :goto_49

    :cond_48
    move v5, v1

    :goto_49
    or-int/2addr v2, v5

    iput v0, p0, Le/e/a/CommentGraph215$Binding;->visualX:I

    iput v4, p0, Le/e/a/CommentGraph215$Binding;->visualY:I

    .line 58
    :cond_4e
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-eqz v0, :cond_88

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v0}, Le/e/a/CommentGraph215$Overlay;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    if-ne v0, v4, :cond_76

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v0}, Le/e/a/CommentGraph215$Overlay;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    if-eq v0, v4, :cond_88

    :cond_76
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object v4, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {v0, v3, v3, v2, v4}, Le/e/a/CommentGraph215$Overlay;->setBounds(IIII)V

    move v2, v1

    .line 59
    :cond_88
    if-eqz v2, :cond_8f

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v0}, Le/e/a/CommentGraph215$Overlay;->invalidateSelf()V

    :cond_8f
    return v1
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 63
    const-string p1, "seek_comment_density"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    iget-object p1, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {p1}, Le/e/a/CommentGraph215$Overlay;->invalidateSelf()V

    :cond_d
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 61
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-ne p1, v0, :cond_f

    iget-object p1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object p1

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {p1, v0}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->refresh()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 61
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    if-ne p1, v0, :cond_7

    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->dispose()V

    :cond_7
    return-void
.end method

.method refresh()V
    .registers 5

    .line 34
    iget-boolean v0, p0, Le/e/a/CommentGraph215$Binding;->disposed:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    :try_start_6
    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_12

    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->dispose()V

    return-void

    :cond_12
    iget-boolean v2, p0, Le/e/a/CommentGraph215$Binding;->popup:Z

    if-eqz v2, :cond_19

    const-string v2, "z"

    goto :goto_1b

    :cond_19
    const-string v2, "h1"

    :goto_1b
    invoke-static {v1, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iget-boolean v3, p0, Le/e/a/CommentGraph215$Binding;->popup:Z

    if-eqz v3, :cond_26

    const-string v3, "f"

    goto :goto_28

    :cond_26
    const-string v3, "b0"

    :goto_28
    invoke-static {v1, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v3, Le/e/a/CommentGraph215;->DATA:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CommentGraph215$Snapshot;

    if-eqz v2, :cond_40

    iget-object v3, v2, Le/e/a/CommentGraph215$Snapshot;->id:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4e

    :cond_40
    iget-boolean v2, p0, Le/e/a/CommentGraph215$Binding;->popup:Z

    if-eqz v2, :cond_4d

    sget-object v2, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CommentGraph215$Snapshot;

    goto :goto_4e

    :cond_4d
    move-object v2, v0

    :cond_4e
    :goto_4e
    if-eqz v2, :cond_59

    iget-object v3, v2, Le/e/a/CommentGraph215$Snapshot;->id:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_59

    goto :goto_5a

    :cond_59
    move-object v2, v0

    :goto_5a
    iput-object v2, p0, Le/e/a/CommentGraph215$Binding;->snapshot:Le/e/a/CommentGraph215$Snapshot;
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_5c} :catch_5d

    goto :goto_60

    :catch_5d
    move-exception v1

    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->snapshot:Le/e/a/CommentGraph215$Snapshot;

    :goto_60
    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->syncHost()V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-eqz v0, :cond_79

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Le/e/a/CommentGraph215$Overlay;->setBounds(IIII)V

    :cond_79
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v0}, Le/e/a/CommentGraph215$Overlay;->invalidateSelf()V

    return-void
.end method

.method start()V
    .registers 2

    .line 33
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Le/e/a/CommentGraph215$Binding;->observer:Landroid/view/ViewTreeObserver;

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    invoke-virtual {p0}, Le/e/a/CommentGraph215$Binding;->refresh()V

    return-void
.end method

.method syncHost()V
    .registers 5

    .line 37
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_15

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    goto :goto_17

    :cond_15
    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    .line 38
    :goto_17
    iget v2, p0, Le/e/a/CommentGraph215$Binding;->controllerId:I

    .line 39
    :goto_19
    if-nez v0, :cond_1c

    :goto_1b
    goto :goto_25

    :cond_1c
    if-eqz v2, :cond_76

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v3

    if-ne v3, v2, :cond_76

    goto :goto_1b

    .line 40
    :goto_25
    if-nez v0, :cond_28

    goto :goto_29

    :cond_28
    move-object v1, v0

    .line 41
    :goto_29
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-eq v0, v1, :cond_75

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    if-eqz v0, :cond_47

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v0, v2}, Landroid/view/ViewOverlay;->remove(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    if-eq v0, v2, :cond_47

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_47
    iput-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    if-eq v0, v1, :cond_54

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_54
    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    invoke-virtual {v0, v1}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le/e/a/CommentGraph215$Binding;->overlay:Le/e/a/CommentGraph215$Overlay;

    iget-object v1, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Le/e/a/CommentGraph215$Binding;->host:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Le/e/a/CommentGraph215$Overlay;->setBounds(IIII)V

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Le/e/a/CommentGraph215$Binding;->visualAlpha:F

    .line 42
    :cond_75
    return-void

    .line 39
    :cond_76
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-eqz v3, :cond_85

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_19

    :cond_85
    const/4 v0, 0x0

    goto :goto_19
.end method
