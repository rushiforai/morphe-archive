.class public final Ld/h/l/t;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static a:Ljava/lang/reflect/Method;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public static a(Landroid/view/ViewConfiguration;Landroid/content/Context;)F
    .registers 3

    invoke-static {p0, p1}, Landroidx/core/view/ViewConfigurationCompat;->getScaledVerticalScrollFactor(Landroid/view/ViewConfiguration;Landroid/content/Context;)F

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/ViewConfiguration;)I
    .registers 2

    invoke-static {p0}, Landroidx/core/view/ViewConfigurationCompat;->getScaledHoverSlop(Landroid/view/ViewConfiguration;)I

    move-result v0

    return v0
.end method

.method public static b(Landroid/view/ViewConfiguration;Landroid/content/Context;)F
    .registers 3

    invoke-static {p0, p1}, Landroidx/core/view/ViewConfigurationCompat;->getScaledHorizontalScrollFactor(Landroid/view/ViewConfiguration;Landroid/content/Context;)F

    move-result v0

    return v0
.end method

.method public static c(Landroid/view/ViewConfiguration;Landroid/content/Context;)Z
    .registers 3

    invoke-static {p0, p1}, Landroidx/core/view/ViewConfigurationCompat;->shouldShowMenuShortcutsWhenKeyboardPresent(Landroid/view/ViewConfiguration;Landroid/content/Context;)Z

    move-result v0

    return v0
.end method
