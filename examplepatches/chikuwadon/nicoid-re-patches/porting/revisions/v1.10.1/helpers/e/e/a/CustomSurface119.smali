.class public final Le/e/a/CustomSurface119;
.super Ljava/lang/Object;
.source "CustomSurface119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static color(Landroid/content/Context;)I
    .registers 2

    .line 2
    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p0}, Le/e/a/CustomTheme119;->background(Landroid/content/Context;)I

    move-result p0

    goto :goto_c

    :cond_b
    const/4 p0, 0x0

    :goto_c
    return p0
.end method
