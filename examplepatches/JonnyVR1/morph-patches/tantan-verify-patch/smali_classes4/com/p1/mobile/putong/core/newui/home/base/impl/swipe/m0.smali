.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;
.source "SourceFile"


# instance fields
.field public j:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public k:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;-><init>(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const-string v0, "lost_location_notify_dlg"

    .line 13
    .line 14
    invoke-direct {p1, v0, p2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->j:Ll/byd0;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->k:I

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->v()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->v2()Ll/b240;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/b240;->K8()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne v0, v1, :cond_7

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->k:I

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    if-ge v0, v1, :cond_7

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    add-int/2addr v0, v2

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->k:I

    .line 19
    .line 20
    invoke-static {}, Ll/spl0;->y()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {}, Ll/hve0;->v()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    sget-object v0, Ll/uqb0;->i0:Ll/z1f;

    .line 36
    .line 37
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 46
    .line 47
    const-string v4, "e_swipe_before"

    .line 48
    .line 49
    invoke-static {v4}, Lcom/p1/mobile/putong/data/OMSEventId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSEventId;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "p_suggest_users_home_view"

    .line 58
    .line 59
    invoke-static {v5}, Lcom/p1/mobile/putong/data/OMSPosition;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSPosition;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-virtual {v1, v3, v4, v5}, Ll/rj50;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/y1f;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ll/z1f;->a(Ll/y1f;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_6

    .line 76
    .line 77
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_2
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    .line 81
    .line 82
    const-string v3, "android.permission.ACCESS_COARSE_LOCATION"

    .line 83
    .line 84
    filled-new-array {v0, v3}, [Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-static {}, Ll/qxv;->c()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    invoke-static {}, Ll/xxv;->o()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 107
    .line 108
    return-object p0

    .line 109
    :cond_4
    invoke-static {}, Ll/pzi0;->o()J

    .line 110
    .line 111
    .line 112
    move-result-wide v3

    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->j:Ll/byd0;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Ljava/lang/Long;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 122
    .line 123
    .line 124
    move-result-wide v5

    .line 125
    const/4 v0, 0x4

    .line 126
    invoke-static {v3, v4, v5, v6, v0}, Ll/tzi0;->h(JJI)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_5

    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 133
    .line 134
    return-object p0

    .line 135
    :cond_5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->k:I

    .line 136
    .line 137
    if-eq v0, v1, :cond_6

    .line 138
    .line 139
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 140
    .line 141
    return-object p0

    .line 142
    :cond_6
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 143
    .line 144
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    new-instance v2, Ll/jkh0;

    .line 151
    .line 152
    invoke-direct {v2, p1}, Ll/jkh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 153
    .line 154
    .line 155
    new-instance v3, Ll/kkh0;

    .line 156
    .line 157
    invoke-direct {v3, p0}, Ll/kkh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;)V

    .line 158
    .line 159
    .line 160
    const/4 v5, 0x0

    .line 161
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 162
    .line 163
    const/4 v4, 0x1

    .line 164
    invoke-static/range {v1 .. v6}, Ll/c6w;->j(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 165
    .line 166
    .line 167
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 168
    .line 169
    return-object p0

    .line 170
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 171
    .line 172
    return-object p0
.end method

.method public final synthetic v()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m0;->j:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
