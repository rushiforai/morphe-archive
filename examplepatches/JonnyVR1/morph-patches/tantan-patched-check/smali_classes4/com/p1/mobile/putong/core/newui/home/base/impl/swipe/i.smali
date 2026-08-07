.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;->g:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x28

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-ge v0, v1, :cond_5

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_5

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_5

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    invoke-static {}, Ll/gra;->f1()Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    return v2

    .line 70
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    iget-object v1, v1, Ll/dkb;->q4:Ll/vxd0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iget v0, v0, Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;->version:I

    .line 87
    .line 88
    if-ne v1, v0, :cond_2

    .line 89
    .line 90
    return v2

    .line 91
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;->g:Z

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    return v2

    .line 96
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->l2:Ll/cf7;

    .line 99
    .line 100
    invoke-static {}, Ll/pzi0;->o()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    invoke-virtual {v0, v3, v4}, Ll/cf7;->a3(J)J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    const-wide/16 v3, 0x1388

    .line 109
    .line 110
    cmp-long v0, v0, v3

    .line 111
    .line 112
    if-ltz v0, :cond_5

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    new-instance v0, Ll/czf0;

    .line 127
    .line 128
    invoke-direct {v0, p1}, Ll/czf0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_4

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget-object v3, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->MARRYSPRINGFESTIVAL:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 146
    .line 147
    const/16 v4, 0x4e20

    .line 148
    .line 149
    invoke-virtual {v1, v3, p1, v0, v4}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_4
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-static {v0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p1, v0}, Ll/cl80;->q(Ll/al80;)V

    .line 162
    .line 163
    .line 164
    :goto_0
    const/4 p1, 0x1

    .line 165
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/i;->g:Z

    .line 166
    .line 167
    :cond_5
    :goto_1
    return v2
.end method
