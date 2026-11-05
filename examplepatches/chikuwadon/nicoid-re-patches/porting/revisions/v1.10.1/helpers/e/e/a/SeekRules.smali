.class final Le/e/a/SeekRules;
.super Ljava/lang/Object;
.source "SeekRules.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static progress(I)I
    .registers 2

    .line 4
    const/16 v0, 0x3c

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method static seconds(I)I
    .registers 2

    .line 3
    const/16 v0, 0x3c

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method static target(JJII)J
    .registers 10

    .line 5
    const/4 v0, 0x0

    invoke-static {v0, p5}, Ljava/lang/Math;->max(II)I

    move-result p5

    const/16 v0, 0x3c

    invoke-static {v0, p5}, Ljava/lang/Math;->min(II)I

    move-result p5

    int-to-long v0, p5

    const-wide/16 v2, 0x3e8

    mul-long v0, v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    if-gez p4, :cond_19

    neg-long v0, v0

    :cond_19
    add-long/2addr p0, v0

    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    return-wide p0
.end method
