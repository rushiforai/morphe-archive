.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/y;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 10

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-ne p0, v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 28
    .line 29
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/BuzzUser;->isBlur:Z

    .line 30
    .line 31
    const-string v2, "right"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/nbw;->N(ZLjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 51
    .line 52
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUser;->buzzToken:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    const/4 v9, 0x0

    .line 58
    const-string v5, ""

    .line 59
    .line 60
    const/4 v6, 0x0

    .line 61
    const/4 v7, 0x0

    .line 62
    invoke-virtual/range {v1 .. v9}, Ll/haw;->W(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Z)V

    .line 63
    .line 64
    .line 65
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 69
    .line 70
    if-ne p0, p1, :cond_2

    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 76
    .line 77
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/d79;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e2:Lcom/p1/mobile/putong/core/api/l;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_2

    .line 29
    .line 30
    return v0

    .line 31
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e2:Lcom/p1/mobile/putong/core/api/l;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/api/l;->y3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_3

    .line 48
    .line 49
    return v0

    .line 50
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e2:Lcom/p1/mobile/putong/core/api/l;

    .line 55
    .line 56
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/l;->x3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 67
    .line 68
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 69
    .line 70
    const/4 v4, 0x1

    .line 71
    if-ne v2, v3, :cond_5

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    return v4

    .line 76
    :cond_4
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 77
    .line 78
    const-string p1, "up"

    .line 79
    .line 80
    invoke-virtual {p0, v0, p1}, Ll/nbw;->N(ZLjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return v0

    .line 84
    :cond_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 85
    .line 86
    if-ne v2, v3, :cond_6

    .line 87
    .line 88
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 89
    .line 90
    const-string p1, "left"

    .line 91
    .line 92
    invoke-virtual {p0, v1, p1}, Ll/nbw;->N(ZLjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return v0

    .line 96
    :cond_6
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 97
    .line 98
    if-ne v2, v1, :cond_8

    .line 99
    .line 100
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    .line 101
    .line 102
    if-eqz v1, :cond_8

    .line 103
    .line 104
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 105
    .line 106
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-eqz p0, :cond_7

    .line 111
    .line 112
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 115
    .line 116
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_7

    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->PROFILE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_7

    .line 141
    .line 142
    return v4

    .line 143
    :cond_7
    return v0

    .line 144
    :cond_8
    return p0
.end method
