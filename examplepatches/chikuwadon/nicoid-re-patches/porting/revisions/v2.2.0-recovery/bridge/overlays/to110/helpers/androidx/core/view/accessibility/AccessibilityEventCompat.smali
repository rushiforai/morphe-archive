.class public final Landroidx/core/view/accessibility/AccessibilityEventCompat;
.super Ljava/lang/Object;
.source "AccessibilityEventCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/view/accessibility/AccessibilityEventCompat$Api34Impl;,
        Landroidx/core/view/accessibility/AccessibilityEventCompat$ContentChangeType;
    }
.end annotation


# static fields
.field public static final CONTENT_CHANGE_TYPE_CHECKED:I = 0x2000

.field public static final CONTENT_CHANGE_TYPE_CONTENT_DESCRIPTION:I = 0x4

.field public static final CONTENT_CHANGE_TYPE_CONTENT_INVALID:I = 0x400

.field public static final CONTENT_CHANGE_TYPE_DRAG_CANCELLED:I = 0x200

.field public static final CONTENT_CHANGE_TYPE_DRAG_DROPPED:I = 0x100

.field public static final CONTENT_CHANGE_TYPE_DRAG_STARTED:I = 0x80

.field public static final CONTENT_CHANGE_TYPE_ENABLED:I = 0x1000

.field public static final CONTENT_CHANGE_TYPE_ERROR:I = 0x800

.field public static final CONTENT_CHANGE_TYPE_EXPANDED:I = 0x4000

.field public static final CONTENT_CHANGE_TYPE_PANE_APPEARED:I = 0x10

.field public static final CONTENT_CHANGE_TYPE_PANE_DISAPPEARED:I = 0x20

.field public static final CONTENT_CHANGE_TYPE_PANE_TITLE:I = 0x8

.field public static final CONTENT_CHANGE_TYPE_SORT_DIRECTION:I = 0x10000

.field public static final CONTENT_CHANGE_TYPE_STATE_DESCRIPTION:I = 0x40

.field public static final CONTENT_CHANGE_TYPE_SUBTREE:I = 0x1

.field public static final CONTENT_CHANGE_TYPE_SUPPLEMENTAL_DESCRIPTION:I = 0x8000

.field public static final CONTENT_CHANGE_TYPE_TEXT:I = 0x2

.field public static final CONTENT_CHANGE_TYPE_UNDEFINED:I = 0x0

.field public static final TYPES_ALL_MASK:I = -0x1

.field public static final TYPE_ANNOUNCEMENT:I = 0x4000

.field public static final TYPE_ASSIST_READING_CONTEXT:I = 0x1000000

.field public static final TYPE_GESTURE_DETECTION_END:I = 0x80000

.field public static final TYPE_GESTURE_DETECTION_START:I = 0x40000

.field public static final TYPE_TOUCH_EXPLORATION_GESTURE_END:I = 0x400
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TYPE_TOUCH_EXPLORATION_GESTURE_START:I = 0x200
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TYPE_TOUCH_INTERACTION_END:I = 0x200000

.field public static final TYPE_TOUCH_INTERACTION_START:I = 0x100000

.field public static final TYPE_VIEW_ACCESSIBILITY_FOCUSED:I = 0x8000

.field public static final TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED:I = 0x10000

.field public static final TYPE_VIEW_CONTEXT_CLICKED:I = 0x800000

.field public static final TYPE_VIEW_HOVER_ENTER:I = 0x80
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TYPE_VIEW_HOVER_EXIT:I = 0x100
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TYPE_VIEW_SCROLLED:I = 0x1000
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TYPE_VIEW_TARGETED_BY_SCROLL:I = 0x4000000

.field public static final TYPE_VIEW_TEXT_SELECTION_CHANGED:I = 0x2000
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TYPE_VIEW_TEXT_TRAVERSED_AT_MOVEMENT_GRANULARITY:I = 0x20000

.field public static final TYPE_WINDOWS_CHANGED:I = 0x400000

.field public static final TYPE_WINDOW_CONTENT_CHANGED:I = 0x800
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 410
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 412
    return-void
.end method

.method public static getAction(Landroid/view/accessibility/AccessibilityEvent;)I
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.getAction()"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 587
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->getAction()I

    move-result v0

    return v0
.end method

.method public static getContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;)I
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.getContentChangeTypes()"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 523
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->getContentChangeTypes()I

    move-result v0

    return v0
.end method

.method public static getMovementGranularity(Landroid/view/accessibility/AccessibilityEvent;)I
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.getMovementGranularity()"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 550
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->getMovementGranularity()I

    move-result v0

    return v0
.end method

.method public static getRecordCount(Landroid/view/accessibility/AccessibilityEvent;)I
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.getRecordCount()"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 424
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->getRecordCount()I

    move-result v0

    return v0
.end method

.method public static isAccessibilityDataSensitive(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 3
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 606
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_0

    .line 607
    invoke-static {p0}, Landroidx/core/view/accessibility/AccessibilityEventCompat$Api34Impl;->isAccessibilityDataSensitive(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0

    .line 610
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static setAccessibilityDataSensitive(Landroid/view/accessibility/AccessibilityEvent;Z)V
    .registers 4
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p1, "accessibilityDataSensitive"    # Z

    .line 634
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_0

    .line 635
    invoke-static {p0, p1}, Landroidx/core/view/accessibility/AccessibilityEventCompat$Api34Impl;->setAccessibilityDataSensitive(Landroid/view/accessibility/AccessibilityEvent;Z)V

    .line 637
    :cond_0
    return-void
.end method

.method public static setAction(Landroid/view/accessibility/AccessibilityEvent;I)V
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p1, "action"    # I
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.setAction(action)"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 575
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setAction(I)V

    .line 576
    return-void
.end method

.method public static setContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;I)V
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p1, "changeTypes"    # I
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.setContentChangeTypes(changeTypes)"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 498
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setContentChangeTypes(I)V

    .line 499
    return-void
.end method

.method public static setMovementGranularity(Landroid/view/accessibility/AccessibilityEvent;I)V
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p1, "granularity"    # I
    .annotation runtime Landroidx/annotation/ReplaceWith;
        expression = "event.setMovementGranularity(granularity)"
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 538
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setMovementGranularity(I)V

    .line 539
    return-void
.end method
