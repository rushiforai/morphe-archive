.class final Le/e/a/TabUiRules244;
.super Ljava/lang/Object;
.source "TabUiRules244.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static related(ILjava/lang/String;)Z
    .registers 3

    .line 5
    const/16 v0, 0xd

    if-eq p0, v0, :cond_24

    const/16 v0, 0xe

    if-eq p0, v0, :cond_24

    if-eqz p1, :cond_22

    const-string p0, "nicovideo.jp/v1/recommend"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_24

    const-string p0, "nicovideo.jp/recommendations"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_24

    const-string p0, "flapi.nicovideo.jp/api/getrelation"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method static reveal(IIII)I
    .registers 5

    .line 4
    if-gtz p1, :cond_3

    return p0

    :cond_3
    const/4 v0, 0x0

    if-ge p2, p0, :cond_b

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0

    :cond_b
    add-int p2, p0, p1

    if-le p3, p2, :cond_14

    sub-int/2addr p3, p1

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result p0

    :cond_14
    return p0
.end method
