.class public final Le/e/a/TabOrder113;
.super Ljava/lang/Object;
.source "TabOrder113.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static afterRemoval(II)I
    .registers 2

    .line 5
    if-nez p1, :cond_4

    const/4 p0, -0x1

    goto :goto_11

    :cond_4
    add-int/lit8 p0, p0, -0x1

    add-int/lit8 p1, p1, -0x1

    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    :goto_11
    return p0
.end method

.method public static insertAfter(II)I
    .registers 2

    .line 4
    if-ltz p0, :cond_7

    if-lt p0, p1, :cond_5

    goto :goto_7

    :cond_5
    add-int/lit8 p1, p0, 0x1

    :cond_7
    :goto_7
    return p1
.end method
