.class public Ll/h3i;
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

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/h3i;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U1:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;)Z
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/h3i;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z
    .locals 4

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 13
    .line 14
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 27
    .line 28
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 29
    .line 30
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/KanPostData;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 37
    .line 38
    const-string v1, "start"

    .line 39
    .line 40
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    const-string p0, "\u72b6\u6001\u53d1\u5e03\u4e2d..."

    .line 47
    .line 48
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return v0

    .line 52
    :cond_0
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-static {}, Ll/orb0;->I()V

    .line 63
    .line 64
    .line 65
    return v0

    .line 66
    :cond_1
    invoke-static {}, Ll/owi;->a()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    const/4 v1, 0x0

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    new-instance p1, Ll/f3i;

    .line 74
    .line 75
    invoke-direct {p1}, Ll/f3i;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v2, Ll/g3i;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Ll/g3i;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 81
    .line 82
    .line 83
    sget-object v3, Ll/l3h;->a:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p0, p1, v1, v2, v3}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return v0

    .line 89
    :cond_2
    return v1
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/h3i;->c(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/cmg;->A()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->u2(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->E2(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/h3i;->c(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/cmg;->A()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->v2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->F2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
