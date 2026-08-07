.class public Ll/r1a0;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

.field public h:Lcom/p1/mobile/putong/core/util/view/RoundTextView;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/r1a0;->i:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/r1a0;->E(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    iget-object p1, p0, Ll/r1a0;->i:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Ll/r1a0;->f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

    .line 20
    .line 21
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/16 p3, 0xa

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Ll/u2n;->j(I)Ll/o2n;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p3, "profileUserId"

    .line 35
    .line 36
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p3, p4}, Ll/o2n;->j(Ljava/lang/String;Ljava/lang/Object;)Ll/o2n;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of p3, p1, Ll/xn90;

    .line 43
    .line 44
    if-eqz p3, :cond_1

    .line 45
    .line 46
    check-cast p1, Ll/xn90;

    .line 47
    .line 48
    new-instance p3, Ll/r1a0$a;

    .line 49
    .line 50
    invoke-direct {p3, p0}, Ll/r1a0$a;-><init>(Ll/r1a0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p3}, Ll/xn90;->u(Ll/y20;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iget-object p4, p0, Ll/r1a0;->g:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 61
    .line 62
    invoke-virtual {p1, p3, p4}, Ll/xn90;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    iput-object p1, p0, Ll/r1a0;->i:Ljava/lang/String;

    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object p0, p0, Ll/r1a0;->f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

    .line 71
    .line 72
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final D(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s1a0;->a(Ll/r1a0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/data/User;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/d79;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-virtual {v0, v1}, Ll/u2n;->j(I)Ll/o2n;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 75
    .line 76
    double-to-long v2, v2

    .line 77
    invoke-static {}, Ll/d79;->j()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-static {v0, v1, v2, v3, v4}, Ll/tzi0;->h(JJI)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_0

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ll/f6l;->x(Lcom/p1/mobile/putong/data/User;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_0

    .line 92
    .line 93
    const/4 p0, 0x1

    .line 94
    return p0

    .line 95
    :cond_0
    const/4 p0, 0x0

    .line 96
    return p0
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/r1a0;->D(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/r1a0;->h:Lcom/p1/mobile/putong/core/util/view/RoundTextView;

    .line 8
    .line 9
    const/high16 p1, 0x40c00000    # 6.0f

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/view/RoundTextView;->setRadius(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public q(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->q(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/r1a0;->f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

    .line 7
    .line 8
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    new-array p0, p0, [Ll/sfj0$a;

    .line 16
    .line 17
    const-string p1, "e_clone_profile_info_ads"

    .line 18
    .line 19
    const-string v0, "p_suggest_users_home_view"

    .line 20
    .line 21
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
