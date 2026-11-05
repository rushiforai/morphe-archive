.class public final Le/e/a/PopupDrag195;
.super Ljava/lang/Object;
.source "PopupDrag195.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clamp(III)I
    .registers 5
    .param p0, "requested"    # I
    .param p1, "screen"    # I
    .param p2, "measured"    # I

    .line 5
    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v1

    sub-int v1, p1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method
