.class Landroidx/core/view/accessibility/AccessibilityEventCompat$Api34Impl;
.super Ljava/lang/Object;
.source "AccessibilityEventCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/accessibility/AccessibilityEventCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Api34Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 641
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 643
    return-void
.end method

.method static isAccessibilityDataSensitive(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 646
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->isAccessibilityDataSensitive()Z

    move-result v0

    return v0
.end method

.method static setAccessibilityDataSensitive(Landroid/view/accessibility/AccessibilityEvent;Z)V
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p1, "accessibilityDataSensitive"    # Z

    .line 651
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setAccessibilityDataSensitive(Z)V

    .line 652
    return-void
.end method
