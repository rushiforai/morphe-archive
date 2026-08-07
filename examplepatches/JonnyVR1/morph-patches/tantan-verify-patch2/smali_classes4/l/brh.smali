.class public Ll/brh;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    move-object v3, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    :goto_0
    invoke-direct {v0, p1, v1, v3}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    :goto_1
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 26
    .line 27
    .line 28
    invoke-static {p3}, Ll/brh;->c(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 33
    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const-string p0, "click"

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    const-string p0, "swipe"

    .line 41
    .line 42
    :goto_2
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 43
    .line 44
    .line 45
    if-eqz p2, :cond_7

    .line 46
    .line 47
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 48
    .line 49
    if-ne p3, p0, :cond_4

    .line 50
    .line 51
    const-string p0, "e_likeButton"

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 54
    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 58
    .line 59
    if-ne p3, p0, :cond_5

    .line 60
    .line 61
    const-string p0, "e_dislikeButton"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 68
    .line 69
    if-ne p3, p0, :cond_6

    .line 70
    .line 71
    const-string p0, "e_superlikeButton"

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 74
    .line 75
    .line 76
    :cond_6
    return-object v0

    .line 77
    :cond_7
    const-string p0, "e_card"

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 80
    .line 81
    .line 82
    return-object v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->UNDO:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v1, "click"

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 25
    .line 26
    .line 27
    const-string p0, "e_undo_button"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;
    .locals 1

    .line 1
    sget-object v0, Ll/brh$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->DISLIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 28
    .line 29
    return-object p0
.end method
