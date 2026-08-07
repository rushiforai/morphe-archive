.class public Ll/lza0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static k:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ll/t3m;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Ll/kcg0;

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:Z

.field public j:Ll/th0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/lza0;->k:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Ll/t3m;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/lza0;->h:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/lza0;->i:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/lza0;->a:Ll/t3m;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const-string v2, "p_suggest_user_profile_info_view"

    .line 15
    .line 16
    invoke-interface {p1, v0, p0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->or(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic b(Ll/lza0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lza0;->l(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Ll/lza0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lza0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/lza0;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/lza0;->m(Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    .line 30
    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method


# virtual methods
.method public f(ZLandroid/widget/TextView;Landroid/widget/TextView;Ll/ner;Ljava/lang/String;Ljava/lang/String;ZLv/VText;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/lza0;->f:Z

    .line 2
    .line 3
    iput-object p2, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object p8, p0, Ll/lza0;->d:Lv/VText;

    .line 8
    .line 9
    iput-object p6, p0, Ll/lza0;->g:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean p7, p0, Ll/lza0;->h:Z

    .line 12
    .line 13
    iget-object p1, p0, Ll/lza0;->e:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 19
    .line 20
    iget-object p1, p1, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->s9()Lrx/subjects/b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p4, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance p2, Ll/gza0;

    .line 31
    .line 32
    invoke-direct {p2, p0}, Ll/gza0;-><init>(Ll/lza0;)V

    .line 33
    .line 34
    .line 35
    new-instance p3, Ll/hza0;

    .line 36
    .line 37
    invoke-direct {p3}, Ll/hza0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/lza0;->e:Ll/kcg0;

    .line 49
    .line 50
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1, p5}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/lza0;->o(Lcom/p1/mobile/putong/data/User;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public h(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lza0;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p2, 0x1

    .line 9
    iput-boolean p2, p0, Ll/lza0;->i:Z

    .line 10
    .line 11
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string p2, "owner_id"

    .line 17
    .line 18
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const-string p2, "receiver_user_id"

    .line 26
    .line 27
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    const-string p1, "subscribe_button_place"

    .line 35
    .line 36
    const-string p2, "top"

    .line 37
    .line 38
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    new-array p1, p1, [Ll/pf60;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, [Ll/pf60;

    .line 53
    .line 54
    const-string p1, "e_follow"

    .line 55
    .line 56
    const-string p2, "p_suggest_user_profile_info_view"

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public i(ZLjava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "owner_id"

    .line 7
    .line 8
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const-string v0, "receiver_user_id"

    .line 16
    .line 17
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    const-string p2, "subscribe_button_place"

    .line 25
    .line 26
    const-string v0, "top"

    .line 27
    .line 28
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const-string p1, "e_follow"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p1, "e_cancelfollow"

    .line 41
    .line 42
    :goto_0
    const/4 p2, 0x0

    .line 43
    new-array p2, p2, [Ll/pf60;

    .line 44
    .line 45
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, [Ll/pf60;

    .line 50
    .line 51
    const-string p2, "p_suggest_user_profile_info_view"

    .line 52
    .line 53
    invoke-static {p1, p2, p0}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 8
    .line 9
    const-string v1, "matched"

    .line 10
    .line 11
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 20
    .line 21
    const-string p1, "following"

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v0

    .line 31
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public final synthetic l(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/lza0;->o(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 10

    .line 1
    iget-object p3, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    iget-object p3, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    const-string v1, "\u559c\u6b22"

    .line 21
    .line 22
    invoke-static {p3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    instance-of p2, p0, Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    if-eqz p2, :cond_0

    .line 37
    .line 38
    move-object v1, p0

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    const-string p0, "likers"

    .line 42
    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    const/4 v8, 0x0

    .line 48
    new-array v9, v0, [Z

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    const/4 v4, 0x0

    .line 52
    const/4 v6, 0x0

    .line 53
    const/4 v7, 0x0

    .line 54
    move-object v2, p1

    .line 55
    invoke-static/range {v1 .. v9}, Ll/j1a;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;[Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move-object v2, p1

    .line 60
    :goto_0
    const-string p0, "moments_user_id"

    .line 61
    .line 62
    iget-object p1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    filled-new-array {p0}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "e_likeButton"

    .line 73
    .line 74
    const-string p2, "PutongPageIds.P_SUGGEST_USER_PROFILE_INFO_VIEW"

    .line 75
    .line 76
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    move-object v2, p1

    .line 81
    if-eqz p2, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-static {p1}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0, v0, p2}, Ll/lza0;->i(ZLjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    instance-of p2, p1, Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    if-eqz p2, :cond_2

    .line 97
    .line 98
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    invoke-virtual {p0, p1, v2}, Ll/lza0;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void

    .line 104
    :cond_3
    iget-object p1, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 107
    .line 108
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 109
    .line 110
    const/4 p2, 0x1

    .line 111
    if-eqz p1, :cond_4

    .line 112
    .line 113
    invoke-static {v2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_4

    .line 118
    .line 119
    iget-object p1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p0, p2, p1}, Ll/lza0;->i(ZLjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sget p0, Lcom/p1/mobile/putong/core/R$string;->P:I

    .line 125
    .line 126
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_4
    sget-object p1, Ll/lza0;->k:Lrx/subjects/b;

    .line 131
    .line 132
    sget-object p3, Ll/uxj0;->a:Ll/uxj0;

    .line 133
    .line 134
    invoke-virtual {p1, p3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p0, p2, p1}, Ll/lza0;->i(ZLjava/lang/String;)V

    .line 140
    .line 141
    .line 142
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 143
    .line 144
    iget-object p0, p0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    const-string p3, "p_suggest_user_profile_info_view"

    .line 155
    .line 156
    invoke-interface {p0, p1, v2, p2, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->or(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lza0;->j:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/lza0;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_b

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 17
    .line 18
    const-string v2, "matched"

    .line 19
    .line 20
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0, p1}, Ll/lza0;->j(Lcom/p1/mobile/putong/data/User;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v2, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 42
    .line 43
    iget-boolean v3, p0, Ll/lza0;->h:Z

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    xor-int/2addr v3, v4

    .line 47
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-static {v2, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 56
    .line 57
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 68
    .line 69
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 75
    .line 76
    .line 77
    const-string v2, "following"

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    iget-object v5, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 82
    .line 83
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 84
    .line 85
    invoke-static {v5, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    iget-object v6, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 90
    .line 91
    if-eqz v5, :cond_2

    .line 92
    .line 93
    sget v5, Lcom/p1/mobile/putong/core/R$string;->n5:I

    .line 94
    .line 95
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(I)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 99
    .line 100
    sget v6, Lcom/p1/mobile/putong/core/R$string;->n5:I

    .line 101
    .line 102
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/lza0;->p()V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    sget v5, Lcom/p1/mobile/putong/core/R$string;->m5:I

    .line 110
    .line 111
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(I)V

    .line 112
    .line 113
    .line 114
    iget-object v5, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 115
    .line 116
    sget v6, Lcom/p1/mobile/putong/core/R$string;->m5:I

    .line 117
    .line 118
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/lza0;->p()V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_3
    invoke-virtual {p0, p1}, Ll/lza0;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 126
    .line 127
    .line 128
    :goto_0
    new-instance v5, Ll/iza0;

    .line 129
    .line 130
    invoke-direct {v5, p0, p1, v0}, Ll/iza0;-><init>(Ll/lza0;Lcom/p1/mobile/putong/data/User;Z)V

    .line 131
    .line 132
    .line 133
    iget-object v6, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 134
    .line 135
    invoke-static {v6, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    iget-object v6, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 139
    .line 140
    invoke-static {v6, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    iget-object v6, p0, Ll/lza0;->d:Lv/VText;

    .line 144
    .line 145
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-eqz v6, :cond_6

    .line 150
    .line 151
    iget-object v6, p0, Ll/lza0;->d:Lv/VText;

    .line 152
    .line 153
    iget-boolean v7, p0, Ll/lza0;->h:Z

    .line 154
    .line 155
    invoke-static {v6, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    iget-object v6, p0, Ll/lza0;->d:Lv/VText;

    .line 159
    .line 160
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 161
    .line 162
    .line 163
    if-eqz v0, :cond_5

    .line 164
    .line 165
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 166
    .line 167
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 168
    .line 169
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    iget-object v3, p0, Ll/lza0;->d:Lv/VText;

    .line 174
    .line 175
    if-eqz v0, :cond_4

    .line 176
    .line 177
    sget v0, Lcom/p1/mobile/putong/core/R$string;->n5:I

    .line 178
    .line 179
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_4
    sget v0, Lcom/p1/mobile/putong/core/R$string;->m5:I

    .line 184
    .line 185
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 186
    .line 187
    .line 188
    :cond_5
    :goto_1
    iget-object v0, p0, Ll/lza0;->d:Lv/VText;

    .line 189
    .line 190
    invoke-static {v0, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Bd()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_6

    .line 202
    .line 203
    invoke-static {p1}, Ll/lza0;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-nez v0, :cond_6

    .line 208
    .line 209
    iget-object v0, p0, Ll/lza0;->d:Lv/VText;

    .line 210
    .line 211
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Bd()Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-eqz v0, :cond_7

    .line 223
    .line 224
    invoke-static {p1}, Ll/lza0;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-nez v0, :cond_7

    .line 229
    .line 230
    iget-object v0, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 231
    .line 232
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 236
    .line 237
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 241
    .line 242
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-eqz v0, :cond_8

    .line 247
    .line 248
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 249
    .line 250
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 251
    .line 252
    goto :goto_2

    .line 253
    :cond_8
    const/4 v0, 0x0

    .line 254
    :goto_2
    invoke-static {}, Ll/gra;->M3()Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    if-nez v3, :cond_b

    .line 259
    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    invoke-interface {v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 265
    .line 266
    .line 267
    move-result v3

    .line 268
    if-eqz v3, :cond_b

    .line 269
    .line 270
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    invoke-interface {v3, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ud(Lcom/p1/mobile/putong/data/User;)Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-nez p1, :cond_a

    .line 279
    .line 280
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-eqz p1, :cond_9

    .line 285
    .line 286
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result p1

    .line 290
    if-eqz p1, :cond_9

    .line 291
    .line 292
    goto :goto_3

    .line 293
    :cond_9
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 294
    .line 295
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 296
    .line 297
    .line 298
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 299
    .line 300
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 301
    .line 302
    .line 303
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 304
    .line 305
    const-string v0, "\u559c\u6b22"

    .line 306
    .line 307
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 311
    .line 312
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_a
    :goto_3
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 317
    .line 318
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 322
    .line 323
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 324
    .line 325
    .line 326
    :goto_4
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 327
    .line 328
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 332
    .line 333
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Ll/lza0;->d:Lv/VText;

    .line 337
    .line 338
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    if-eqz p1, :cond_b

    .line 343
    .line 344
    iget-object p0, p0, Ll/lza0;->d:Lv/VText;

    .line 345
    .line 346
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 347
    .line 348
    .line 349
    :cond_b
    :goto_5
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/lza0;->i:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 5
    .line 6
    sget v1, Ll/dbc0;->V1:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 12
    .line 13
    const/high16 v1, 0x26000000

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 19
    .line 20
    sget v2, Ll/dbc0;->V1:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Ll/lza0;->h:Z

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/lza0;->d:Lv/VText;

    .line 35
    .line 36
    sget v2, Ll/dbc0;->W1:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/lza0;->d:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/lza0;->h(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/R$string;->o5:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    sget v0, Ll/dbc0;->v:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/lza0;->b:Landroid/widget/TextView;

    .line 32
    .line 33
    const/4 v0, -0x1

    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Lcom/p1/mobile/putong/core/R$string;->o5:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 55
    .line 56
    sget v1, Ll/dbc0;->v:I

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/lza0;->c:Landroid/widget/TextView;

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    sget v2, Ll/c9c0;->c2:I

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    iget-boolean p1, p0, Ll/lza0;->h:Z

    .line 79
    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    iget-object p1, p0, Ll/lza0;->d:Lv/VText;

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget v2, Lcom/p1/mobile/putong/core/R$string;->o5:I

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/lza0;->d:Lv/VText;

    .line 100
    .line 101
    sget v1, Ll/dbc0;->v:I

    .line 102
    .line 103
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/lza0;->d:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    :cond_0
    return-void
.end method

.method public r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v1, Lcom/p1/mobile/putong/core/R$string;->M0:I

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v1, Lcom/p1/mobile/putong/core/R$string;->T:I

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget v1, Ll/c9c0;->I:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v1, Ll/jza0;

    .line 33
    .line 34
    invoke-direct {v1, p2}, Ll/jza0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Ll/kza0;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Ll/kza0;-><init>(Ll/lza0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Ll/lza0;->j:Ll/th0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void
.end method
