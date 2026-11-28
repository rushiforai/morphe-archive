.class public final synthetic Landroidx/core/view/DifferentialMotionFlingController$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/view/DifferentialMotionFlingController$DifferentialVelocityProvider;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/core/view/DifferentialMotionFlingController;"
    method = "getCurrentVelocity"
    proto = "(Landroid/view/VelocityTracker;Landroid/view/MotionEvent;I)F"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getCurrentVelocity(Landroid/view/VelocityTracker;Landroid/view/MotionEvent;I)F
    .registers 4

    .line 0
    invoke-static {p1, p2, p3}, Landroidx/core/view/DifferentialMotionFlingController;->$r8$lambda$rCNQ1h5KBIaVcUXhwymI_1638W0(Landroid/view/VelocityTracker;Landroid/view/MotionEvent;I)F

    move-result p1

    return p1
.end method
