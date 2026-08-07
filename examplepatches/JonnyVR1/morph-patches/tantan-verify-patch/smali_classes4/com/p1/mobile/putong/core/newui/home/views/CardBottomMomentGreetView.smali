.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/pql;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public f:Lv/VLinear;

.field public g:Lv/VFrame;

.field public h:Lv/VDraweeView;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public p:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/data/RecommendMessage;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendMessage;->messageValue:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/data/RecommendMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "text"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;Ll/oql;Landroid/view/View;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->X(Ll/oql;Landroid/view/View;Ll/vg60;)V

    return-void
.end method

.method public static synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 8

    .line 1
    const-string p1, "is_reply"

    .line 2
    .line 3
    const-string v0, "0"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->o:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const-string v7, ""

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->o:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object p1, v7

    .line 25
    :goto_0
    const-string v2, "moment_id"

    .line 26
    .line 27
    invoke-static {v2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string p1, "is_input"

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string p1, "is_match"

    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "owner_id"

    .line 48
    .line 49
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string p1, "state_id"

    .line 54
    .line 55
    invoke-static {p1, v7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string v0, "e_send_message"

    .line 64
    .line 65
    const-string v1, "p_suggest_users_home_view"

    .line 66
    .line 67
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->o:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->o:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 79
    .line 80
    iget-object v7, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 87
    .line 88
    const-string v1, "card"

    .line 89
    .line 90
    invoke-direct {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v7}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 94
    .line 95
    .line 96
    const-string v0, "p_home,greet"

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xi4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Ll/oql;Landroid/view/View;Ll/vg60;)V
    .locals 8

    .line 1
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :cond_0
    const-string v0, "is_reply"

    .line 22
    .line 23
    const-string v1, "0"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const-string v3, ""

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-object v0, v3

    .line 48
    :goto_0
    const-string v4, "moment_id"

    .line 49
    .line 50
    invoke-static {v4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v4, "is_input"

    .line 55
    .line 56
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    const-string v5, "is_match"

    .line 61
    .line 62
    invoke-static {v5, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    const-string v6, "owner_id"

    .line 73
    .line 74
    invoke-static {v6, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    const-string v1, "state_id"

    .line 79
    .line 80
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    move-object v3, v0

    .line 85
    filled-new-array/range {v2 .. v7}, [Ll/sfj0$a;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "e_send_message"

    .line 90
    .line 91
    const-string v2, "p_suggest_users_home_view"

    .line 92
    .line 93
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->a0(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p2}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public Y(Ll/oql;Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    invoke-interface {p1}, Ll/oql;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRecommendMessage()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->b0(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_2

    .line 18
    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-nez p3, :cond_1

    .line 36
    .line 37
    :cond_0
    const-string p3, "is_reply"

    .line 38
    .line 39
    const-string v1, "1"

    .line 40
    .line 41
    invoke-static {p3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string p3, "moment_id"

    .line 46
    .line 47
    const-string v1, ""

    .line 48
    .line 49
    invoke-static {p3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string p3, "is_input"

    .line 54
    .line 55
    const-string v4, "0"

    .line 56
    .line 57
    invoke-static {p3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    const-string v5, "is_match"

    .line 62
    .line 63
    invoke-static {v5, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const-string v6, "owner_id"

    .line 76
    .line 77
    invoke-static {v6, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    const-string v4, "state_id"

    .line 82
    .line 83
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    move-object v4, p3

    .line 88
    filled-new-array/range {v2 .. v7}, [Ll/sfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    const-string v1, "e_send_message"

    .line 93
    .line 94
    const-string v2, "p_suggest_users_home_view"

    .line 95
    .line 96
    invoke-static {v1, v2, p3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->Z(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 107
    .line 108
    new-instance p1, Ll/ti4;

    .line 109
    .line 110
    invoke-direct {p1, p2}, Ll/ti4;-><init>(Landroid/view/View;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->p:Ll/kcg0;

    .line 118
    .line 119
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 123
    .line 124
    if-eqz v0, :cond_3

    .line 125
    .line 126
    invoke-interface {p1}, Ll/oql;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-interface {p1}, Ll/oql;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 151
    .line 152
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentPrevious(Ljava/lang/String;)Lrx/c;

    .line 153
    .line 154
    .line 155
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-interface {p1}, Ll/oql;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 164
    .line 165
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 166
    .line 167
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object p3

    .line 175
    new-instance v0, Ll/ui4;

    .line 176
    .line 177
    invoke-direct {v0, p0, p1, p2}, Ll/ui4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;Ll/oql;Landroid/view/View;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p3, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->p:Ll/kcg0;

    .line 189
    .line 190
    return-void
.end method

.method public final Z(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->g:Lv/VFrame;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 21
    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->m:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 31
    .line 32
    sget v2, Ll/dbc0;->l8:I

    .line 33
    .line 34
    invoke-virtual {v0, v2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 52
    .line 53
    sget v1, Lcom/p1/mobile/putong/core/R$string;->X4:I

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 64
    .line 65
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Z4:I

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 80
    .line 81
    new-instance v0, Ll/vi4;

    .line 82
    .line 83
    invoke-direct {v0}, Ll/vi4;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {p2, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setTextList(Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 94
    .line 95
    const/4 v3, 0x1

    .line 96
    const-wide/16 v4, 0x96

    .line 97
    .line 98
    const-wide/16 v1, 0x1f4

    .line 99
    .line 100
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g(JZJ)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->n:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->m:Lv/VText;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-string v0, "\u5979"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v0, "\u4ed6"

    .line 30
    .line 31
    :goto_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/high16 v4, 0x41a00000    # 20.0f

    .line 36
    .line 37
    if-nez v3, :cond_3

    .line 38
    .line 39
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->o:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 46
    .line 47
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->g:Lv/VFrame;

    .line 100
    .line 101
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->i:Lv/VImage;

    .line 105
    .line 106
    instance-of v4, v0, Lcom/p1/mobile/putong/data/Video;

    .line 107
    .line 108
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 112
    .line 113
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->h:Lv/VDraweeView;

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v3, v4, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->f:Lv/VLinear;

    .line 127
    .line 128
    const/high16 v3, 0x41200000    # 10.0f

    .line 129
    .line 130
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    invoke-static {v0, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->g:Lv/VFrame;

    .line 139
    .line 140
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->f:Lv/VLinear;

    .line 144
    .line 145
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-static {v0, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 150
    .line 151
    .line 152
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 153
    .line 154
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 162
    .line 163
    if-eqz p1, :cond_2

    .line 164
    .line 165
    sget p1, Lcom/p1/mobile/putong/core/R$string;->W4:I

    .line 166
    .line 167
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_2
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Y4:I

    .line 172
    .line 173
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 174
    .line 175
    .line 176
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 177
    .line 178
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 183
    .line 184
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 190
    .line 191
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 196
    .line 197
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    xor-int/2addr p2, v2

    .line 204
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->g:Lv/VFrame;

    .line 209
    .line 210
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 211
    .line 212
    .line 213
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 214
    .line 215
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 219
    .line 220
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->f:Lv/VLinear;

    .line 224
    .line 225
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    invoke-static {p2, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 230
    .line 231
    .line 232
    const-wide/16 v3, 0x0

    .line 233
    .line 234
    :try_start_0
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 235
    .line 236
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 237
    .line 238
    .line 239
    move-result-wide p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    goto :goto_3

    .line 241
    :catch_0
    move-wide p1, v3

    .line 242
    :goto_3
    const-wide/16 v5, 0x2

    .line 243
    .line 244
    rem-long/2addr p1, v5

    .line 245
    cmp-long p1, p1, v3

    .line 246
    .line 247
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 248
    .line 249
    if-nez p1, :cond_4

    .line 250
    .line 251
    const-string p1, "%1$s\u5f88\u53d7\u6b22\u8fce\uff0c\u548c%2$s\u804a\u4e00\u804a\u5174\u8da3\u7231\u597d\u66f4\u5bb9\u6613\u6536\u5230\u56de\u590d"

    .line 252
    .line 253
    filled-new-array {v0, v0}, [Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_4
    const-string p1, "\u8ddf%1$s\u8ba4\u771f\u4ecb\u7ecd\u4e00\u4e0b\u81ea\u5df1\uff0c\u8ba9%2$s\u66f4\u4e86\u89e3\u4f60"

    .line 266
    .line 267
    filled-new-array {v0, v0}, [Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    .line 277
    .line 278
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 279
    .line 280
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 281
    .line 282
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 283
    .line 284
    .line 285
    move-result p2

    .line 286
    if-eqz p2, :cond_5

    .line 287
    .line 288
    goto :goto_5

    .line 289
    :cond_5
    const/4 v2, 0x2

    .line 290
    :goto_5
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 291
    .line 292
    .line 293
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->j:Lv/VText;

    .line 294
    .line 295
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-eqz p1, :cond_6

    .line 300
    .line 301
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 302
    .line 303
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    if-eqz p1, :cond_6

    .line 308
    .line 309
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 310
    .line 311
    const/high16 p1, 0x40b00000    # 5.5f

    .line 312
    .line 313
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 318
    .line 319
    .line 320
    goto :goto_6

    .line 321
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->k:Lv/VText;

    .line 322
    .line 323
    invoke-static {p0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 324
    .line 325
    .line 326
    :goto_6
    return-void
.end method

.method public final b0(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/wi4;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wi4;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getBaseInfoLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserContentLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setAnimateDirection(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->l:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 14
    .line 15
    const/16 v1, 0x13

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setTextGravity(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;->m:Lv/VText;

    .line 21
    .line 22
    new-instance v1, Ll/si4;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/si4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentGreetView;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
