.class final Le/e/a/TabPager233$Drag;
.super Ljava/lang/Object;
.source "TabPager233.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/TabPager233;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Drag"
.end annotation


# instance fields
.field animator:Landroid/animation/ValueAnimator;

.field body:Landroid/view/View;

.field candidate:Z

.field captured:Landroid/graphics/Bitmap;

.field claimed:Z

.field dx:F

.field host:Le/e/a/MultiTabs227$Host;

.field live:Z

.field neighbor:Landroid/view/View;

.field neighborVisibility:I

.field outgoing:Landroid/view/View;

.field overlay:Landroid/view/ViewGroup;

.field released:Z

.field stage:Landroid/widget/FrameLayout;

.field target:Le/e/a/SavedTabs227$Tab;

.field velocity:Landroid/view/VelocityTracker;

.field x:F

.field y:F


# direct methods
.method constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
