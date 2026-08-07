.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;-><init>(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->real_auth_success:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->U:Ll/jxd0;

    .line 21
    .line 22
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->real_auth_fail:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->V:Ll/jxd0;

    .line 45
    .line 46
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_identityVerification_succeed_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->R:Ll/jxd0;

    .line 69
    .line 70
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_identityVerification_fail_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->S:Ll/jxd0;

    .line 93
    .line 94
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_3
    return-void
.end method


# virtual methods
.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s0;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 8
    .line 9
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->i0:Ll/z1f;

    .line 2
    .line 3
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 12
    .line 13
    const-string v3, "e_swipe_before"

    .line 14
    .line 15
    invoke-static {v3}, Lcom/p1/mobile/putong/data/OMSEventId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSEventId;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "p_suggest_users_home_view"

    .line 24
    .line 25
    invoke-static {v4}, Lcom/p1/mobile/putong/data/OMSPosition;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSPosition;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v1, v2, v3, v4}, Ll/rj50;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/y1f;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/z1f;->a(Ll/y1f;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/rj50;->K(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->proxy:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 63
    .line 64
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 65
    .line 66
    if-ne v0, v1, :cond_1

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->i:Z

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    iput-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/s0;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-object v0

    .line 78
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 79
    .line 80
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/pk50;->f()Ll/rj50;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;->g:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v2, Ll/ukh0;

    .line 30
    .line 31
    invoke-direct {v2, p1}, Ll/ukh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {v0, v1, p0, p1, v2}, Ll/rj50;->u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
