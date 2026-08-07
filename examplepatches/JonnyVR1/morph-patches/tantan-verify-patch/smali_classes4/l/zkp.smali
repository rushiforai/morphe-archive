.class public Ll/zkp;
.super Ll/ufp;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ufp;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/rfh0$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-static {v0}, Ll/sdp;->j(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic j(Ll/rfh0$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-static {v0}, Ll/clp;->r(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic k(Ll/zkp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zkp;->q(Ll/rfh0$a;)V

    return-void
.end method

.method private m(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method private o(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/zkp;->m(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p2}, Ll/zkp;->m(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p2, :cond_2

    .line 15
    .line 16
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    :goto_0
    return v0
.end method

.method private p(Lcom/p1/mobile/putong/data/User;I)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v0, p0, v0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v2, p0

    .line 18
    const-wide/32 p0, 0x36ee80

    .line 19
    .line 20
    .line 21
    div-long/2addr v2, p0

    .line 22
    int-to-long p0, p2

    .line 23
    cmp-long p0, v2, p0

    .line 24
    .line 25
    if-gez p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    return v1
.end method

.method private synthetic q(Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zkp;->r(Ll/rfh0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zkp;->n(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zkp;->s(Ll/rfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final l(Ll/rfh0$a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;
    .locals 4

    .line 1
    invoke-static {}, Ll/sdp;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-static {p0}, Ll/sdp;->j(Z)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-static {}, Ll/d79;->A()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget v2, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 29
    .line 30
    if-lez v2, :cond_2

    .line 31
    .line 32
    invoke-direct {p0, p3, v2}, Ll/zkp;->p(Lcom/p1/mobile/putong/data/User;I)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;->TYPE_C:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    iget v2, p3, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 42
    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 49
    .line 50
    :goto_0
    cmpl-float v3, v2, v3

    .line 51
    .line 52
    if-lez v3, :cond_4

    .line 53
    .line 54
    invoke-direct {p0, p2, p3}, Ll/zkp;->o(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_4

    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;->TYPE_B:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_4
    if-nez v1, :cond_5

    .line 64
    .line 65
    iget p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_5
    iget p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 69
    .line 70
    :goto_1
    cmpl-float p0, v2, p0

    .line 71
    .line 72
    if-lez p0, :cond_6

    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;->TYPE_A:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_6
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p0}, Ll/sdp;->e(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_7

    .line 84
    .line 85
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;->TYPE_D:Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_7
    return-object v0
.end method

.method public n(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ufp;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, p1, v0, v1}, Ll/zkp;->l(Ll/rfh0$a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {v0}, Ll/sdp;->h(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v3, Ll/wkp;

    .line 34
    .line 35
    invoke-direct {v3, p0, p1}, Ll/wkp;-><init>(Ll/zkp;Ll/rfh0$a;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/xkp;

    .line 39
    .line 40
    invoke-direct {p0, p1}, Ll/xkp;-><init>(Ll/rfh0$a;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;Ll/x20;Ll/x20;)Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog;

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    iput-boolean p0, p1, Ll/rfh0$a;->g:Z

    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 50
    .line 51
    return-object p0
.end method

.method public final r(Ll/rfh0$a;)V
    .locals 3

    .line 1
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_5

    .line 8
    .line 9
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_0
    invoke-static {}, Ll/sdp;->d()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 v0, 0x1

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    invoke-static {v0}, Ll/clp;->r(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    iget-object p0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ik4;->a()Ll/q7m;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    iget-object p0, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ik4;->a()Ll/q7m;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    :goto_0
    iget-object v1, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 77
    .line 78
    iget-object v2, v1, Ll/pkp;->o:Lv/VFrame;

    .line 79
    .line 80
    if-eqz p0, :cond_4

    .line 81
    .line 82
    if-nez v2, :cond_3

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    new-instance v0, Ll/ndp;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-direct {v0, v1, v2}, Ll/ndp;-><init>(Landroid/content/Context;Lv/VFrame;)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Ll/ykp;

    .line 95
    .line 96
    invoke-direct {v1, p1}, Ll/ykp;-><init>(Ll/rfh0$a;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p0, v1}, Ll/ndp;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    :goto_1
    invoke-static {v0}, Ll/clp;->r(Z)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 113
    .line 114
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    :goto_2
    return-void
.end method

.method public s(Ll/rfh0$a;)Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p1, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 12
    .line 13
    if-eq v0, v2, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    invoke-static {}, Ll/joa;->D3()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    invoke-virtual {p0}, Ll/ufp;->h()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_8

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_3

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_3
    iget-object v2, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_8

    .line 47
    .line 48
    iget-object v2, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_4

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_4
    iget-object v2, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 62
    .line 63
    invoke-virtual {v2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Ll/sdp;->g(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_5

    .line 72
    .line 73
    return v1

    .line 74
    :cond_5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-static {v2}, Ll/sdp;->a(Z)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-nez v2, :cond_6

    .line 83
    .line 84
    return v1

    .line 85
    :cond_6
    iget-object v2, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-nez v3, :cond_7

    .line 96
    .line 97
    return v1

    .line 98
    :cond_7
    invoke-virtual {p0, p1, v0, v2}, Ll/zkp;->l(Ll/rfh0$a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/intlslguide/IntlSlGuideDialog$GuideType;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    if-eqz p0, :cond_8

    .line 103
    .line 104
    const/4 p0, 0x1

    .line 105
    return p0

    .line 106
    :cond_8
    :goto_0
    return v1
.end method
