.class public final Le/e/a/CommentListRules;
.super Ljava/lang/Object;
.source "CommentListRules.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compare(JIJIZ)I
    .registers 7

    .line 4
    if-eqz p6, :cond_9

    invoke-static {p5, p2}, Ljava/lang/Integer;->compare(II)I

    move-result p2

    if-eqz p2, :cond_9

    return p2

    :cond_9
    invoke-static {p0, p1, p3, p4}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method public static refreshable(Ljava/lang/String;)Z
    .registers 2

    .line 5
    if-eqz p0, :cond_2c

    const-string v0, "/search/video"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, "nicovideo.jp/search/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, "nicovideo.jp/tag/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, "/ranking/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, "/by_ranking"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2c

    :cond_2a
    const/4 p0, 0x1

    goto :goto_2d

    :cond_2c
    const/4 p0, 0x0

    :goto_2d
    return p0
.end method
