.class public Ll/cal;
.super Ll/n4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/p8l$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b240;->Y4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 7
    .line 8
    iget-object p0, p0, Ll/b240;->G:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static e()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/xxv;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cal;->d(Ll/p8l$a;)Ljava/lang/Boolean;

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
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cal;->f(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 16
    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmp-long p0, v1, v3

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->a0:Ll/byd0;

    .line 24
    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 33
    .line 34
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 41
    .line 42
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :goto_0
    new-instance v5, Ll/bal;

    .line 48
    .line 49
    invoke-direct {v5, p1}, Ll/bal;-><init>(Ll/p8l$a;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {}, Ll/kyo;->q()Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v3, "intl_swipe_first_enter_fullscreen_discount"

    .line 61
    .line 62
    const/4 v4, 0x0

    .line 63
    move-object v6, v5

    .line 64
    invoke-static/range {v1 .. v6}, Ll/kyo;->s(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;)V

    .line 65
    .line 66
    .line 67
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    return-object p0
.end method

.method public f(Ll/p8l$a;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->j6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->W3()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    return v0

    .line 36
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->N3()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    return v0

    .line 47
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    return v0

    .line 62
    :cond_3
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 67
    .line 68
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Y3(J)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    return v0

    .line 75
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 78
    .line 79
    const-wide/16 v2, 0x0

    .line 80
    .line 81
    cmp-long v2, p0, v2

    .line 82
    .line 83
    if-lez v2, :cond_6

    .line 84
    .line 85
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    iget-object v3, v1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->a0:Ll/byd0;

    .line 98
    .line 99
    if-eqz v2, :cond_5

    .line 100
    .line 101
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v3, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    iget-object p0, v1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 109
    .line 110
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    return v0

    .line 116
    :cond_5
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Ljava/lang/Long;

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 123
    .line 124
    .line 125
    move-result-wide v1

    .line 126
    cmp-long p0, p0, v1

    .line 127
    .line 128
    if-nez p0, :cond_7

    .line 129
    .line 130
    return v0

    .line 131
    :cond_6
    iget-object p0, v1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    check-cast p0, Ljava/lang/Boolean;

    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_7

    .line 144
    .line 145
    return v0

    .line 146
    :cond_7
    invoke-static {}, Ll/cal;->e()Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    return p0
.end method
