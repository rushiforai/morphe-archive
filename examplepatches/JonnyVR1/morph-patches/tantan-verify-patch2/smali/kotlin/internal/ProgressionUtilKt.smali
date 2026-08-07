.class public final Lkotlin/internal/ProgressionUtilKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\n\u001a\u001f\u0010\u0003\u001a\u00020\u00002\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u0000H\u0002\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u001a\u001f\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0001\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0005H\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u001a\'\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\u0000H\u0002\u00a2\u0006\u0004\u0008\u0001\u0010\t\u001a\'\u0010\u0002\u001a\u00020\u00052\u0006\u0010\u0001\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u0005H\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\n\u001a\'\u0010\u0008\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u0000H\u0001\u00a2\u0006\u0004\u0008\u0008\u0010\t\u001a\'\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u000c\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005H\u0001\u00a2\u0006\u0004\u0008\u000e\u0010\n\u00a8\u0006\u000f"
    }
    d2 = {
        "",
        "a",
        "b",
        "e",
        "(II)I",
        "",
        "f",
        "(JJ)J",
        "c",
        "(III)I",
        "(JJJ)J",
        "start",
        "end",
        "step",
        "d",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final a(III)I
    .locals 0

    .line 1
    invoke-static {p0, p2}, Lkotlin/internal/ProgressionUtilKt;->e(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p2}, Lkotlin/internal/ProgressionUtilKt;->e(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p0, p1

    .line 10
    invoke-static {p0, p2}, Lkotlin/internal/ProgressionUtilKt;->e(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static final b(JJJ)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p4, p5}, Lkotlin/internal/ProgressionUtilKt;->f(JJ)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p2, p3, p4, p5}, Lkotlin/internal/ProgressionUtilKt;->f(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p2

    .line 9
    sub-long/2addr p0, p2

    .line 10
    invoke-static {p0, p1, p4, p5}, Lkotlin/internal/ProgressionUtilKt;->f(JJ)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    return-wide p0
.end method

.method public static final c(III)I
    .locals 0
    .annotation build Lkotlin/PublishedApi;
    .end annotation

    .line 1
    if-lez p2, :cond_1

    .line 2
    .line 3
    if-lt p0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p1, p0, p2}, Lkotlin/internal/ProgressionUtilKt;->a(III)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    sub-int/2addr p1, p0

    .line 11
    return p1

    .line 12
    :cond_1
    if-gez p2, :cond_3

    .line 13
    .line 14
    if-gt p0, p1, :cond_2

    .line 15
    .line 16
    :goto_0
    return p1

    .line 17
    :cond_2
    neg-int p2, p2

    .line 18
    invoke-static {p0, p1, p2}, Lkotlin/internal/ProgressionUtilKt;->a(III)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-int/2addr p1, p0

    .line 23
    return p1

    .line 24
    :cond_3
    const-string p0, "Step is zero."

    .line 25
    .line 26
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public static final d(JJJ)J
    .locals 4
    .annotation build Lkotlin/PublishedApi;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p4, v0

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    cmp-long v0, p0, p2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    move-wide p0, p2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-wide v2, p2

    .line 14
    move-wide p2, p0

    .line 15
    move-wide p0, v2

    .line 16
    invoke-static/range {p0 .. p5}, Lkotlin/internal/ProgressionUtilKt;->b(JJJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide p2

    .line 20
    sub-long p2, p0, p2

    .line 21
    .line 22
    return-wide p2

    .line 23
    :cond_1
    move-wide v2, p2

    .line 24
    move-wide p2, p0

    .line 25
    move-wide p0, v2

    .line 26
    if-gez v0, :cond_3

    .line 27
    .line 28
    cmp-long v0, p2, p0

    .line 29
    .line 30
    if-gtz v0, :cond_2

    .line 31
    .line 32
    :goto_0
    return-wide p0

    .line 33
    :cond_2
    neg-long p4, p4

    .line 34
    move-wide v2, p2

    .line 35
    move-wide p2, p0

    .line 36
    move-wide p0, v2

    .line 37
    invoke-static/range {p0 .. p5}, Lkotlin/internal/ProgressionUtilKt;->b(JJJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    add-long/2addr p2, p0

    .line 42
    return-wide p2

    .line 43
    :cond_3
    const-string p0, "Step is zero."

    .line 44
    .line 45
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 p0, 0x0

    .line 49
    .line 50
    return-wide p0
.end method

.method public static final e(II)I
    .locals 0

    .line 1
    rem-int/2addr p0, p1

    .line 2
    if-ltz p0, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    add-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static final f(JJ)J
    .locals 2

    .line 1
    rem-long/2addr p0, p2

    .line 2
    const-wide/16 v0, 0x0

    .line 3
    .line 4
    cmp-long v0, p0, v0

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    return-wide p0

    .line 9
    :cond_0
    add-long/2addr p0, p2

    .line 10
    return-wide p0
.end method
