.class final Le/e/a/ModernShorts$State;
.super Ljava/lang/Object;
.source "ModernShorts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ModernShorts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field bar:Landroid/view/View;

.field blocked:Z

.field busy:Z

.field cancelling:Z

.field controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field controlsTapped:Z

.field dead:Z

.field downTime:J

.field dragging:Z

.field feed:Le/e/a/ModernShorts$Feed;

.field home:Z

.field index:I

.field launching:Z

.field listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field number:Landroid/widget/TextView;

.field progress:Landroid/widget/ProgressBar;

.field redraw:Ljava/lang/Runnable;

.field request:Le/e/a/NetworkTask;

.field resumeRequest:Ljava/lang/Runnable;

.field video:Landroid/view/View;

.field x:F

.field y:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/ModernShorts$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/ModernShorts$1;

    .line 93
    invoke-direct {p0}, Le/e/a/ModernShorts$State;-><init>()V

    return-void
.end method
