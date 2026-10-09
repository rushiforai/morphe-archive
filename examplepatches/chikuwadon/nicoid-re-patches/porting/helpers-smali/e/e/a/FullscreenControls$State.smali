.class Le/e/a/FullscreenControls$State;
.super Ljava/lang/Object;
.source "FullscreenControls.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FullscreenControls;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field barHeight:I

.field controlsLayout:Landroid/view/ViewGroup$LayoutParams;

.field gravity:I

.field heights:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "[I>;"
        }
    .end annotation
.end field

.field orientation:I

.field original:Landroid/view/ViewGroup;

.field padding:[I

.field textLayout:Landroid/view/ViewGroup$LayoutParams;

.field textSize:F


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FullscreenControls$State;->heights:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/FullscreenControls$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/FullscreenControls$1;

    .line 4
    invoke-direct {p0}, Le/e/a/FullscreenControls$State;-><init>()V

    return-void
.end method
