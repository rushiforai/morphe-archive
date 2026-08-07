.class public Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;,
        Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;
    }
.end annotation


# static fields
.field public static a:J = 0x0L

.field public static b:Z = false

.field public static c:J = 0x0L

.field public static d:Z = false

.field public static e:Z = false

.field public static f:J = 0x0L

.field public static g:Z = false

.field public static h:Z = false

.field public static i:Z = false

.field public static j:Ljava/lang/String; = "launch"

.field public static k:Ljava/lang/String; = "loading"

.field public static l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->l:Lrx/subjects/a;

    .line 8
    .line 9
    new-instance v1, Ll/qbl;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/qbl;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_swipeaction"

    .line 13
    .line 14
    iput-object v0, p1, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->l()[Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static C(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public static D(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static E(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    sput-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static F(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sput-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->j:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static G(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->DISLIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 28
    .line 29
    return-object p0
.end method

.method public static H(Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_5

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;Ll/q7m;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->a:[I

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    aget p0, p1, p0

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    if-eq p0, p1, :cond_3

    .line 29
    .line 30
    const/4 p1, 0x2

    .line 31
    if-eq p0, p1, :cond_2

    .line 32
    .line 33
    const/4 p1, 0x3

    .line 34
    if-eq p0, p1, :cond_1

    .line 35
    .line 36
    const-string p0, ""

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string p0, "left"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const-string p0, "right"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const-string p0, "up"

    .line 46
    .line 47
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c2:Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    const-string v1, "swipe_directions"

    .line 58
    .line 59
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    if-nez p1, :cond_4

    .line 63
    .line 64
    const-string p0, "1"

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_4
    const-string p0, "0"

    .line 68
    .line 69
    :goto_1
    const-string p1, "is_guided_action"

    .line 70
    .line 71
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    const-string p0, "e_card"

    .line 75
    .line 76
    const-string p1, "p_suggest_users_home_view"

    .line 77
    .line 78
    invoke-static {p0, p1, v0}, Ll/sfj0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 79
    .line 80
    .line 81
    :cond_5
    :goto_2
    return-void
.end method

.method public static synthetic a(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    sput-boolean p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->q()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    sput-boolean p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->p()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public static b(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/LikeExtraData;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-string p0, ""

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->FOLLOW:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "click"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 26
    .line 27
    .line 28
    if-eqz p3, :cond_1

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 33
    .line 34
    .line 35
    const-string p1, "e_superlikeButton"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    if-eqz p2, :cond_2

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 46
    .line 47
    .line 48
    const-string p1, "e_likeButton"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->DISLIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 57
    .line 58
    .line 59
    const-string p1, "e_dislikeButton"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 62
    .line 63
    .line 64
    :goto_1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    iget-object p1, p4, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 71
    .line 72
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picUrl:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 75
    .line 76
    .line 77
    iget p2, p1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picNum:I

    .line 78
    .line 79
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 80
    .line 81
    .line 82
    iget p1, p1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picUploads:I

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 85
    .line 86
    .line 87
    :cond_3
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-string v1, "p_suggest_user_profile_info_view"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v1, "p_suggest_users_home_view"

    .line 9
    .line 10
    :goto_0
    if-eqz p2, :cond_1

    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->PROFILE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 16
    .line 17
    :goto_1
    const-string v3, ""

    .line 18
    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    move-object v4, v3

    .line 22
    goto :goto_2

    .line 23
    :cond_2
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    :goto_2
    invoke-direct {v0, v1, v2, v4}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-eqz p0, :cond_4

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 31
    .line 32
    if-nez p0, :cond_3

    .line 33
    .line 34
    goto :goto_3

    .line 35
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    :goto_3
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 38
    .line 39
    .line 40
    invoke-static {p3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->G(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 45
    .line 46
    .line 47
    if-eqz p1, :cond_5

    .line 48
    .line 49
    const-string p0, "click"

    .line 50
    .line 51
    goto :goto_4

    .line 52
    :cond_5
    const-string p0, "swipe"

    .line 53
    .line 54
    :goto_4
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 55
    .line 56
    .line 57
    const-string p0, "e_superlikeButton"

    .line 58
    .line 59
    const-string v1, "e_dislikeButton"

    .line 60
    .line 61
    const-string v2, "e_likeButton"

    .line 62
    .line 63
    if-eqz p2, :cond_8

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 66
    .line 67
    if-ne p3, p1, :cond_6

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 70
    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 74
    .line 75
    if-ne p3, p1, :cond_7

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 78
    .line 79
    .line 80
    return-object v0

    .line 81
    :cond_7
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 82
    .line 83
    if-ne p3, p1, :cond_b

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_8
    if-eqz p1, :cond_c

    .line 90
    .line 91
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 92
    .line 93
    if-ne p3, p1, :cond_9

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 96
    .line 97
    .line 98
    return-object v0

    .line 99
    :cond_9
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 100
    .line 101
    if-ne p3, p1, :cond_a

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 104
    .line 105
    .line 106
    return-object v0

    .line 107
    :cond_a
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 108
    .line 109
    if-ne p3, p1, :cond_b

    .line 110
    .line 111
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 112
    .line 113
    .line 114
    :cond_b
    return-object v0

    .line 115
    :cond_c
    const-string p0, "e_card"

    .line 116
    .line 117
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 118
    .line 119
    .line 120
    return-object v0
.end method

.method public static d(Ll/ik4;ZZLcom/p1/mobile/putong/core/data/SwipeDirection;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-static {v0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->c(Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p4, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->c(Ll/f1g0;Ll/ik4;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ik4;->b()Ll/ik4$a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ik4;->b()Ll/ik4$a;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object p2, p2, Ll/ik4$a;->d:Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ik4;->b()Ll/ik4$a;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iget-object p2, p2, Ll/ik4$a;->d:Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 71
    .line 72
    .line 73
    iget-object p3, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p3, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 89
    .line 90
    .line 91
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    const/4 p3, 0x1

    .line 96
    if-eqz p2, :cond_6

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_6

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 113
    .line 114
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_2

    .line 119
    .line 120
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/home/d;->u(Z)V

    .line 121
    .line 122
    .line 123
    :cond_2
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 128
    .line 129
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-eqz p2, :cond_3

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 140
    .line 141
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardName:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-nez p2, :cond_3

    .line 148
    .line 149
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 154
    .line 155
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardName:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 158
    .line 159
    .line 160
    :cond_3
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 165
    .line 166
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    if-eqz p2, :cond_6

    .line 171
    .line 172
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 177
    .line 178
    .line 179
    move-result-object p4

    .line 180
    if-nez p4, :cond_4

    .line 181
    .line 182
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 185
    .line 186
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p4, v0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 189
    .line 190
    .line 191
    move-result-object p4

    .line 192
    :cond_4
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 193
    .line 194
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->onlineHighReplyRate:Z

    .line 195
    .line 196
    if-eqz p2, :cond_5

    .line 197
    .line 198
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-eqz p2, :cond_5

    .line 203
    .line 204
    iget-object p2, p4, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 205
    .line 206
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Location;->isHideUpdateTime()Z

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    if-nez p2, :cond_5

    .line 211
    .line 212
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 213
    .line 214
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 215
    .line 216
    invoke-virtual {p2, p4}, Ll/ina;->w3(Lcom/p1/mobile/putong/data/User;)Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-nez p2, :cond_5

    .line 221
    .line 222
    move p2, p3

    .line 223
    goto :goto_1

    .line 224
    :cond_5
    const/4 p2, 0x0

    .line 225
    :goto_1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->x(Z)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 226
    .line 227
    .line 228
    :cond_6
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    invoke-static {p2}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 233
    .line 234
    .line 235
    move-result p2

    .line 236
    if-eqz p2, :cond_7

    .line 237
    .line 238
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/home/d;->y(Z)V

    .line 239
    .line 240
    .line 241
    :cond_7
    invoke-virtual {p0}, Ll/ik4;->b()Ll/ik4$a;

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    if-eqz p2, :cond_8

    .line 246
    .line 247
    invoke-virtual {p0}, Ll/ik4;->b()Ll/ik4$a;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    iget-object p2, p2, Ll/ik4$a;->f:Ljava/util/List;

    .line 252
    .line 253
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->C(Ljava/util/List;)V

    .line 254
    .line 255
    .line 256
    :cond_8
    invoke-virtual {p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/pf60;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    const-string p2, "ideal_type"

    .line 265
    .line 266
    iget-object p3, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 267
    .line 268
    invoke-static {p2, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 269
    .line 270
    .line 271
    move-result-object p2

    .line 272
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 273
    .line 274
    .line 275
    const-string p2, "ideal_type_relate_profile"

    .line 276
    .line 277
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 278
    .line 279
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 284
    .line 285
    .line 286
    return-object p1
.end method

.method public static e(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string p0, "click"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "swipe"

    .line 12
    .line 13
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p4, :cond_1

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iget-object v1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p1, :cond_4

    .line 29
    .line 30
    if-eqz p3, :cond_2

    .line 31
    .line 32
    const-string p1, "e_superlikeButton"

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const-string p1, "e_likeButton"

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    const-string p1, "e_dislikeButton"

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_4
    const-string p1, "e_card"

    .line 44
    .line 45
    :goto_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->PICKS:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-eqz p3, :cond_5

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_5
    if-eqz p2, :cond_6

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->DISLIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 66
    .line 67
    :goto_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 68
    .line 69
    .line 70
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    iget-object p0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 77
    .line 78
    const/4 p1, 0x0

    .line 79
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 88
    .line 89
    .line 90
    iget-object p0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 100
    .line 101
    .line 102
    :cond_7
    return-object v0
.end method

.method public static f(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string p0, "click"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "swipe"

    .line 12
    .line 13
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p4, :cond_1

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iget-object v1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p1, :cond_4

    .line 29
    .line 30
    if-eqz p3, :cond_2

    .line 31
    .line 32
    const-string p1, "e_superlikeButton"

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const-string p1, "e_likeButton"

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    const-string p1, "e_dislikeButton"

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_4
    const-string p1, "e_card"

    .line 44
    .line 45
    :goto_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SEE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-eqz p3, :cond_5

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_5
    if-eqz p2, :cond_6

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->DISLIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 66
    .line 67
    :goto_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 68
    .line 69
    .line 70
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    iget-object p0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 77
    .line 78
    const/4 p1, 0x0

    .line 79
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 88
    .line 89
    .line 90
    iget-object p0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 100
    .line 101
    .line 102
    :cond_7
    return-object v0
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->UNDO:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v1, "click"

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 25
    .line 26
    .line 27
    const-string p0, "e_undo_button"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->g(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/d;->d(Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V
    .locals 2

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->descriptionId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasDescTagShow:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "other_user_id"

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "tag_type"

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->descriptionId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {v0, p0}, [Ll/sfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "e_home_card_info_tag"

    .line 40
    .line 41
    invoke-static {v0, p1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ControlCardInfo;->resourceKey:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ControlCardInfo;->ruleKey:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ControlCardInfo;->business:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ControlCardInfo;->cardType:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ControlCardInfo;->cardType:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "ad_card_id"

    .line 60
    .line 61
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ControlCardInfo;->business:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "ad_card_type"

    .line 69
    .line 70
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/pf60;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "none"

    .line 6
    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_5

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ljava/util/HashSet;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v4, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-nez v4, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_2

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/p1/mobile/putong/data/IdealTag;

    .line 59
    .line 60
    iget-object v5, v4, Lcom/p1/mobile/putong/data/IdealTag;->fitIdealDetails:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    if-eqz v6, :cond_0

    .line 71
    .line 72
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    check-cast v6, Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-nez v7, :cond_1

    .line 83
    .line 84
    invoke-virtual {v3, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    if-nez v7, :cond_1

    .line 89
    .line 90
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    const/4 v8, 0x3

    .line 95
    if-ge v7, v8, :cond_1

    .line 96
    .line 97
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iget-object v4, v4, Lcom/p1/mobile/putong/data/IdealTag;->name:Ljava/lang/String;

    .line 104
    .line 105
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    const-string v3, ","

    .line 114
    .line 115
    if-nez p0, :cond_3

    .line 116
    .line 117
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    new-array p0, p0, [Ljava/lang/String;

    .line 122
    .line 123
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, [Ljava/lang/CharSequence;

    .line 128
    .line 129
    invoke-static {v3, p0}, Ll/pbl;->a(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    goto :goto_1

    .line 134
    :cond_3
    move-object p0, v1

    .line 135
    :goto_1
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_4

    .line 140
    .line 141
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    new-array v0, v0, [Ljava/lang/String;

    .line 146
    .line 147
    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, [Ljava/lang/CharSequence;

    .line 152
    .line 153
    invoke-static {v3, v0}, Ll/pbl;->a(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    :cond_4
    move-object v9, v1

    .line 158
    move-object v1, p0

    .line 159
    move-object p0, v9

    .line 160
    goto :goto_2

    .line 161
    :cond_5
    move-object p0, v1

    .line 162
    :goto_2
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0
.end method

.method public static l()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d:Z

    .line 2
    .line 3
    return v0
.end method

.method public static m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;Ll/q7m;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/q7m;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto/16 :goto_6

    .line 4
    .line 5
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/r4a;->b()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "card_order"

    .line 18
    .line 19
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/gra;->J3()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 29
    .line 30
    invoke-static {p2}, Ll/jj40;->a(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    const-string p2, "verified"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string p2, "tantan"

    .line 40
    .line 41
    :goto_0
    const-string v0, "from_top_tab"

    .line 42
    .line 43
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-static {}, Ll/gra;->E1()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_3

    .line 51
    .line 52
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 53
    .line 54
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const-string v0, "city_cover"

    .line 63
    .line 64
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    const-string v0, "mystery_status"

    .line 72
    .line 73
    if-eqz p2, :cond_4

    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-nez p2, :cond_4

    .line 82
    .line 83
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p2, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-static {p2}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_4

    .line 98
    .line 99
    const-string p2, "mystery"

    .line 100
    .line 101
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    const-string p2, "normal"

    .line 106
    .line 107
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    const-string v0, "ideal_type"

    .line 115
    .line 116
    iget-object v1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 117
    .line 118
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    const-string v0, "ideal_type_relate_profile"

    .line 122
    .line 123
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 124
    .line 125
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    const-string v0, ","

    .line 133
    .line 134
    const-string v1, ""

    .line 135
    .line 136
    const-string v2, "recommend_tag"

    .line 137
    .line 138
    const-string v3, "card_name"

    .line 139
    .line 140
    if-eqz p2, :cond_b

    .line 141
    .line 142
    const-string p2, "VirtualCard"

    .line 143
    .line 144
    iget-object v4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-eqz p2, :cond_b

    .line 151
    .line 152
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 153
    .line 154
    iget-object v4, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 155
    .line 156
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    aget p2, p2, v4

    .line 161
    .line 162
    const-string v4, "moments_user_id"

    .line 163
    .line 164
    packed-switch p2, :pswitch_data_0

    .line 165
    .line 166
    .line 167
    goto/16 :goto_6

    .line 168
    .line 169
    :pswitch_0
    const-string p0, "male_love_sayhi"

    .line 170
    .line 171
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :pswitch_1
    const-string p0, "live_audio_room"

    .line 176
    .line 177
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :pswitch_2
    const-string p0, "live_room_multiple"

    .line 182
    .line 183
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :pswitch_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 188
    .line 189
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    if-eqz p2, :cond_14

    .line 194
    .line 195
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 196
    .line 197
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->userId:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    if-nez p2, :cond_14

    .line 204
    .line 205
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 206
    .line 207
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->userId:Ljava/lang/String;

    .line 208
    .line 209
    invoke-interface {p1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 213
    .line 214
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardName:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-nez p2, :cond_5

    .line 221
    .line 222
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 223
    .line 224
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardName:Ljava/lang/String;

    .line 225
    .line 226
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_5
    invoke-interface {p1, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 234
    .line 235
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardTypes:Ljava/util/List;

    .line 236
    .line 237
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    if-nez p2, :cond_6

    .line 242
    .line 243
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 244
    .line 245
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CardInfos;->cardTypes:Ljava/util/List;

    .line 246
    .line 247
    invoke-static {p0, v0}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-interface {p1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :cond_6
    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :pswitch_4
    invoke-static {p0}, Ll/fb0;->g(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 260
    .line 261
    .line 262
    move-result p2

    .line 263
    if-eqz p2, :cond_7

    .line 264
    .line 265
    const-string p0, "add_tag"

    .line 266
    .line 267
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_7
    invoke-static {p0}, Ll/fb0;->f(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 272
    .line 273
    .line 274
    move-result p2

    .line 275
    if-eqz p2, :cond_8

    .line 276
    .line 277
    const-string p0, "add_operation_tag"

    .line 278
    .line 279
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_8
    invoke-static {p0}, Ll/fb0;->c(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 284
    .line 285
    .line 286
    move-result p2

    .line 287
    if-eqz p2, :cond_9

    .line 288
    .line 289
    const-string p0, "artwork"

    .line 290
    .line 291
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_9
    invoke-static {p0}, Ll/fb0;->d(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 296
    .line 297
    .line 298
    move-result p2

    .line 299
    if-eqz p2, :cond_a

    .line 300
    .line 301
    const-string p0, "artwork_multiple_choice"

    .line 302
    .line 303
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_a
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 308
    .line 309
    instance-of p2, p0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 310
    .line 311
    if-eqz p2, :cond_14

    .line 312
    .line 313
    check-cast p0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 314
    .line 315
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 316
    .line 317
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :pswitch_5
    const-string p2, "love_signal"

    .line 322
    .line 323
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 327
    .line 328
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    if-eqz p2, :cond_14

    .line 333
    .line 334
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 335
    .line 336
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 337
    .line 338
    .line 339
    move-result-object p2

    .line 340
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result p2

    .line 344
    if-eqz p2, :cond_14

    .line 345
    .line 346
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 347
    .line 348
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 349
    .line 350
    .line 351
    move-result-object p2

    .line 352
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 353
    .line 354
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 355
    .line 356
    .line 357
    move-result p2

    .line 358
    if-nez p2, :cond_14

    .line 359
    .line 360
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 361
    .line 362
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 363
    .line 364
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 365
    .line 366
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {p2, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result p2

    .line 380
    if-eqz p2, :cond_14

    .line 381
    .line 382
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 383
    .line 384
    invoke-interface {p1, v4, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :pswitch_6
    const-string p0, "newbieguide_undo"

    .line 389
    .line 390
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    return-void

    .line 394
    :pswitch_7
    const-string p0, "newbieguide_superlike"

    .line 395
    .line 396
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    return-void

    .line 400
    :pswitch_8
    const-string p0, "choose"

    .line 401
    .line 402
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    return-void

    .line 406
    :pswitch_9
    const-string p2, "quickchat"

    .line 407
    .line 408
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extraInfo:Ljava/lang/String;

    .line 412
    .line 413
    invoke-interface {p1, v4, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :cond_b
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 418
    .line 419
    if-eqz p2, :cond_c

    .line 420
    .line 421
    const/4 p2, 0x1

    .line 422
    goto :goto_3

    .line 423
    :cond_c
    const/4 p2, 0x0

    .line 424
    :goto_3
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 425
    .line 426
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 427
    .line 428
    iget-object v5, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {v4, v5}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 431
    .line 432
    .line 433
    move-result-object v4

    .line 434
    invoke-static {}, Ll/ln40;->f()Ll/ln40;

    .line 435
    .line 436
    .line 437
    move-result-object v5

    .line 438
    invoke-virtual {v5, p0}, Ll/ln40;->i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 439
    .line 440
    .line 441
    move-result v5

    .line 442
    const-string v6, "normal_card"

    .line 443
    .line 444
    if-eqz v5, :cond_d

    .line 445
    .line 446
    const-string p2, "greeting_new"

    .line 447
    .line 448
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    goto :goto_4

    .line 452
    :cond_d
    if-eqz p2, :cond_e

    .line 453
    .line 454
    const-string p2, "moment_card"

    .line 455
    .line 456
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    goto :goto_4

    .line 460
    :cond_e
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 461
    .line 462
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 463
    .line 464
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 465
    .line 466
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 467
    .line 468
    .line 469
    move-result p2

    .line 470
    if-nez p2, :cond_f

    .line 471
    .line 472
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 473
    .line 474
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 475
    .line 476
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 477
    .line 478
    iget-object v5, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 479
    .line 480
    invoke-static {p2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 481
    .line 482
    .line 483
    move-result p2

    .line 484
    if-eqz p2, :cond_f

    .line 485
    .line 486
    const-string p2, "anchor"

    .line 487
    .line 488
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    goto :goto_4

    .line 492
    :cond_f
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 493
    .line 494
    .line 495
    move-result p2

    .line 496
    if-eqz p2, :cond_10

    .line 497
    .line 498
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 499
    .line 500
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 501
    .line 502
    .line 503
    move-result p2

    .line 504
    if-eqz p2, :cond_10

    .line 505
    .line 506
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 507
    .line 508
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->onlineHighReplyRate:Z

    .line 509
    .line 510
    if-eqz p2, :cond_10

    .line 511
    .line 512
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 513
    .line 514
    .line 515
    move-result p2

    .line 516
    if-eqz p2, :cond_10

    .line 517
    .line 518
    iget-object p2, v4, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 519
    .line 520
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 521
    .line 522
    .line 523
    move-result p2

    .line 524
    if-eqz p2, :cond_10

    .line 525
    .line 526
    iget-object p2, v4, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 527
    .line 528
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Location;->isHideUpdateTime()Z

    .line 529
    .line 530
    .line 531
    move-result p2

    .line 532
    if-nez p2, :cond_10

    .line 533
    .line 534
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 535
    .line 536
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 537
    .line 538
    invoke-virtual {p2, v4}, Ll/ina;->w3(Lcom/p1/mobile/putong/data/User;)Z

    .line 539
    .line 540
    .line 541
    move-result p2

    .line 542
    if-nez p2, :cond_10

    .line 543
    .line 544
    const-string p2, "online_like"

    .line 545
    .line 546
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    goto :goto_4

    .line 550
    :cond_10
    invoke-interface {p1, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    .line 552
    .line 553
    :goto_4
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 554
    .line 555
    .line 556
    move-result p2

    .line 557
    if-eqz p2, :cond_14

    .line 558
    .line 559
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 560
    .line 561
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 562
    .line 563
    .line 564
    move-result p2

    .line 565
    if-eqz p2, :cond_14

    .line 566
    .line 567
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 568
    .line 569
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->userId:Ljava/lang/String;

    .line 570
    .line 571
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 572
    .line 573
    .line 574
    move-result p2

    .line 575
    if-nez p2, :cond_14

    .line 576
    .line 577
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 578
    .line 579
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardName:Ljava/lang/String;

    .line 580
    .line 581
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 582
    .line 583
    .line 584
    move-result p2

    .line 585
    if-nez p2, :cond_11

    .line 586
    .line 587
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 588
    .line 589
    iget-object v6, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardName:Ljava/lang/String;

    .line 590
    .line 591
    :cond_11
    invoke-interface {p1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 592
    .line 593
    .line 594
    move-result p2

    .line 595
    if-eqz p2, :cond_12

    .line 596
    .line 597
    new-instance p2, Ljava/lang/StringBuilder;

    .line 598
    .line 599
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 600
    .line 601
    .line 602
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    .line 604
    .line 605
    move-result-object v4

    .line 606
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    .line 614
    .line 615
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 616
    .line 617
    .line 618
    move-result-object p2

    .line 619
    invoke-interface {p1, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    goto :goto_5

    .line 623
    :cond_12
    invoke-interface {p1, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 624
    .line 625
    .line 626
    :goto_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 627
    .line 628
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardInfos;->cardTypes:Ljava/util/List;

    .line 629
    .line 630
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 631
    .line 632
    .line 633
    move-result p2

    .line 634
    if-nez p2, :cond_13

    .line 635
    .line 636
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 637
    .line 638
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CardInfos;->cardTypes:Ljava/util/List;

    .line 639
    .line 640
    invoke-static {p0, v0}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 641
    .line 642
    .line 643
    move-result-object p0

    .line 644
    invoke-interface {p1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 645
    .line 646
    .line 647
    return-void

    .line 648
    :cond_13
    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    .line 650
    .line 651
    :cond_14
    :goto_6
    return-void

    .line 652
    nop

    .line 653
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static n()Z
    .locals 2

    .line 1
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    .line 2
    .line 3
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static o()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 3
    .line 4
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 5
    .line 6
    return-void
.end method

.method public static p()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->x()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->v()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->t()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static q()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "no_lo"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->y()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "loading"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->w()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->u()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static r(Ll/ik4;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->s(Ll/ik4;Ljava/lang/String;Ljava/lang/String;ZLl/wql;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static s(Ll/ik4;Ljava/lang/String;Ljava/lang/String;ZLl/wql;)V
    .locals 23
    .param p4    # Ll/wql;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 1
    invoke-static/range {p0 .. p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 2
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->b()Ll/ik4$a;

    move-result-object v2

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->b()Ll/ik4$a;

    move-result-object v2

    iget-object v2, v2, Ll/ik4$a;->a:Lrx/subjects/a;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->b()Ll/ik4$a;

    move-result-object v2

    iget-object v2, v2, Ll/ik4$a;->a:Lrx/subjects/a;

    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    xor-int/2addr v2, v3

    goto :goto_0

    :cond_0
    move v2, v3

    .line 5
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Ll/q7m;

    if-eqz v4, :cond_1

    .line 6
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v4

    check-cast v4, Ll/q7m;

    const-string v6, "female_like_flag"

    invoke-interface {v4, v6}, Ll/q7m;->D(Ljava/lang/String;)Z

    move-result v4

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    if-eqz v4, :cond_2

    .line 7
    const-string v6, "upper_right"

    goto :goto_2

    .line 8
    :cond_2
    const-string v6, "null"

    .line 9
    :goto_2
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v7

    instance-of v7, v7, Ll/q7m;

    if-eqz v7, :cond_3

    .line 10
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v7

    check-cast v7, Ll/q7m;

    const-string v8, "female_like_flag_lower_left"

    .line 11
    invoke-interface {v7, v8}, Ll/q7m;->D(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 12
    const-string v6, "lower_left"

    move v4, v3

    .line 13
    :cond_3
    invoke-static/range {p0 .. p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 14
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v7

    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 15
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUserLikeMe()Z

    move-result v7

    if-eqz v7, :cond_4

    move v4, v3

    .line 16
    :cond_4
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v7

    instance-of v7, v7, Ll/q7m;

    if-eqz v7, :cond_5

    .line 17
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v7

    check-cast v7, Ll/q7m;

    const-string v8, "common_points_label_flag"

    .line 18
    invoke-interface {v7, v8}, Ll/q7m;->D(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    move v7, v3

    goto :goto_3

    :cond_5
    const/4 v7, 0x0

    .line 19
    :goto_3
    invoke-static/range {p0 .. p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 20
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v8

    goto :goto_4

    :cond_6
    const/4 v8, 0x0

    .line 21
    :goto_4
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 22
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v11

    instance-of v11, v11, Ll/q7m;

    const-string v12, "e_card"

    const-string v13, "is_moment_card"

    const-string v14, "theme_card_ornot"

    const-string v15, "show_he_liked_position"

    const-string v3, "default"

    const-string v5, "swipe_scene"

    const-string v9, "show_he_liked"

    move/from16 v17, v2

    const-string v2, "is_first_picture"

    move/from16 v18, v4

    const-string v4, "moments_user_id"

    move/from16 v19, v7

    const-string v7, "IsWhiteBlock"

    const-string v20, "1"

    const-string v21, "0"

    if-eqz v11, :cond_12

    const-string v11, "p_activity_momentcard_view"

    .line 23
    invoke-static {v0, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_12

    .line 24
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v11

    check-cast v11, Ll/q7m;

    .line 25
    instance-of v0, v11, Ll/t7m;

    if-eqz v0, :cond_7

    .line 26
    move-object v0, v11

    check-cast v0, Ll/t7m;

    invoke-interface {v0}, Ll/t7m;->getMomentInfoThemeSlide()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    move-result-object v16

    .line 27
    invoke-interface {v0}, Ll/t7m;->a0()Z

    move-result v0

    :goto_5
    move-object/from16 v22, v16

    move/from16 v16, v0

    move-object/from16 v0, v22

    move-object/from16 v22, v12

    goto :goto_7

    :cond_7
    if-nez v8, :cond_8

    const/4 v0, 0x0

    goto :goto_6

    .line 28
    :cond_8
    iget-object v0, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    :goto_6
    move-object/from16 v16, v0

    if-eqz v8, :cond_9

    .line 29
    iget-object v0, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    goto :goto_5

    :cond_9
    const/4 v0, 0x0

    goto :goto_5

    .line 30
    :goto_7
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v10, v7, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    invoke-interface {v10, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_a

    .line 32
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->b()Ll/ik4$a;

    move-result-object v1

    invoke-virtual {v1}, Ll/ik4$a;->a()I

    move-result v1

    if-nez v1, :cond_a

    const/4 v1, 0x1

    goto :goto_8

    :cond_a
    const/4 v1, 0x0

    :goto_8
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 33
    invoke-interface {v10, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v10, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    invoke-interface {v10, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    invoke-interface {v10, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    iget-boolean v1, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    if-eqz v1, :cond_b

    const/4 v3, 0x1

    goto :goto_9

    :cond_b
    const/4 v3, 0x0

    :goto_9
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v10, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v16, :cond_c

    move-object/from16 v1, v20

    goto :goto_a

    :cond_c
    move-object/from16 v1, v21

    .line 38
    :goto_a
    invoke-interface {v10, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v0, :cond_d

    .line 39
    iget-object v1, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    goto :goto_b

    :cond_d
    move-object/from16 v1, v21

    :goto_b
    const-string v2, "moment_id"

    invoke-interface {v10, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    const-string v1, "topic_key"

    invoke-static {}, Ll/eui0;->a()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v10, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    invoke-static {v8, v10, v11}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;Ll/q7m;)V

    .line 42
    invoke-static {v8, v10}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;)V

    move-object/from16 v11, p1

    move-object/from16 v12, v22

    .line 43
    invoke-static {v12, v11, v10}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 44
    iget-boolean v1, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    if-nez v1, :cond_f

    iget-boolean v1, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentCard:Z

    if-eqz v1, :cond_e

    goto :goto_c

    :cond_e
    return-void

    :cond_f
    :goto_c
    if-eqz v0, :cond_10

    .line 45
    iget-object v1, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    goto :goto_d

    :cond_10
    move-object/from16 v1, v21

    :goto_d
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v1

    if-eqz v0, :cond_11

    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    goto :goto_e

    :cond_11
    move-object/from16 v0, v21

    :goto_e
    const-string v2, "owner_id"

    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v0

    const-string v2, "recommend_reason"

    .line 47
    const-string v3, "more history like"

    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v2

    filled-new-array {v1, v0, v2}, [Ll/sfj0$a;

    move-result-object v0

    .line 48
    const-string v1, "e_moment"

    invoke-static {v1, v11, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    return-void

    :cond_12
    move-object v11, v0

    .line 49
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v10, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    invoke-interface {v10, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Ll/t7m;

    if-eqz v0, :cond_14

    .line 52
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->c()Landroid/view/View;

    move-result-object v0

    check-cast v0, Ll/t7m;

    .line 53
    invoke-interface {v0}, Ll/t7m;->e()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object/from16 v0, v20

    goto :goto_f

    :cond_13
    move-object/from16 v0, v21

    :goto_f
    invoke-interface {v10, v13, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    if-eqz p3, :cond_15

    .line 54
    invoke-virtual/range {p0 .. p0}, Ll/ik4;->b()Ll/ik4$a;

    move-result-object v0

    invoke-virtual {v0}, Ll/ik4$a;->a()I

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    goto :goto_10

    :cond_15
    const/4 v0, 0x0

    :goto_10
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 55
    invoke-interface {v10, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v10, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v0, "receiver_user_id"

    const-string v1, ""

    invoke-interface {v10, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    invoke-interface {v10, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    invoke-interface {v10, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-boolean v0, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    goto :goto_11

    :cond_16
    const/4 v0, 0x0

    :goto_11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v10, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v0, "is_show_common_tag"

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    invoke-static {}, Ll/gra;->r1()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 63
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-boolean v0, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->meetAgain:Z

    if-eqz v0, :cond_17

    move-object/from16 v0, v20

    goto :goto_12

    :cond_17
    move-object/from16 v0, v21

    .line 64
    :goto_12
    const-string v1, "is_show_longtimenosee_tag"

    invoke-interface {v10, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->operationUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v3, 0x1

    goto :goto_13

    :cond_18
    const/4 v3, 0x0

    :goto_13
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 66
    const-string v1, "is_activity"

    invoke-interface {v10, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    invoke-static {v8, v10}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;)V

    const/4 v0, 0x0

    .line 68
    invoke-static {v8, v10, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/Map;Ll/q7m;)V

    .line 69
    invoke-static {v12, v11, v10}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static t()V
    .locals 8

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->g:Z

    .line 8
    .line 9
    new-instance v0, Ll/q4f;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "e_suggest_users_home_status_end"

    .line 15
    .line 16
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 21
    .line 22
    const-string v1, "p_suggest_users_home_view"

    .line 23
    .line 24
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v1, Ll/pf60;

    .line 27
    .line 28
    const-string v2, "status"

    .line 29
    .line 30
    const-string v3, "card"

    .line 31
    .line 32
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/pf60;

    .line 36
    .line 37
    const/4 v3, 0x1

    .line 38
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v4, "view_appear"

    .line 43
    .line 44
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    new-instance v3, Ll/pf60;

    .line 48
    .line 49
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v4

    .line 53
    sget-wide v6, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f:J

    .line 54
    .line 55
    sub-long/2addr v4, v6

    .line 56
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    const-string v5, "duration"

    .line 61
    .line 62
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    new-instance v4, Ll/pf60;

    .line 66
    .line 67
    const-string v5, "loadingsource"

    .line 68
    .line 69
    const-string v6, ""

    .line 70
    .line 71
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    filled-new-array {v1, v2, v3, v4}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {v0, v1}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static u()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    sput-wide v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f:J

    .line 11
    .line 12
    const-string v0, "card"

    .line 13
    .line 14
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 15
    .line 16
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    sput-boolean v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->g:Z

    .line 26
    .line 27
    new-instance v2, Ll/q4f;

    .line 28
    .line 29
    invoke-direct {v2}, Ll/q4f;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v3, "e_suggest_users_home_status_start"

    .line 33
    .line 34
    iput-object v3, v2, Ll/q4f;->s:Ljava/lang/String;

    .line 35
    .line 36
    sget-object v3, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 37
    .line 38
    iput-object v3, v2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 39
    .line 40
    const-string v3, "p_suggest_users_home_view"

    .line 41
    .line 42
    iput-object v3, v2, Ll/q4f;->n:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v3, Ll/pf60;

    .line 45
    .line 46
    const-string v4, "status"

    .line 47
    .line 48
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/pf60;

    .line 52
    .line 53
    const-string v4, "view_appear"

    .line 54
    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {v0, v4, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    filled-new-array {v3, v0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v2, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public static v()V
    .locals 8

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d:Z

    .line 8
    .line 9
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ll/q4f;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "e_suggest_users_home_status_end"

    .line 19
    .line 20
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 23
    .line 24
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 25
    .line 26
    const-string v1, "p_suggest_users_home_view"

    .line 27
    .line 28
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v1, Ll/pf60;

    .line 31
    .line 32
    const-string v2, "status"

    .line 33
    .line 34
    const-string v3, "loading"

    .line 35
    .line 36
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/pf60;

    .line 40
    .line 41
    sget-boolean v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i:Z

    .line 42
    .line 43
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v4, "view_appear"

    .line 48
    .line 49
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Ll/pf60;

    .line 53
    .line 54
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    sget-wide v6, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->c:J

    .line 59
    .line 60
    sub-long/2addr v4, v6

    .line 61
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    const-string v5, "duration"

    .line 66
    .line 67
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    new-instance v4, Ll/pf60;

    .line 71
    .line 72
    const-string v5, "loadingsource"

    .line 73
    .line 74
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->j:Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    filled-new-array {v1, v2, v3, v4}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v0, v1}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    :goto_0
    return-void
.end method

.method public static w()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d:Z

    .line 8
    .line 9
    const-string v0, "loading"

    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 12
    .line 13
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 18
    .line 19
    sput-boolean v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i:Z

    .line 20
    .line 21
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    sput-wide v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->c:J

    .line 26
    .line 27
    new-instance v1, Ll/q4f;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/q4f;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "e_suggest_users_home_status_start"

    .line 33
    .line 34
    iput-object v2, v1, Ll/q4f;->s:Ljava/lang/String;

    .line 35
    .line 36
    sget-object v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 37
    .line 38
    iput-object v2, v1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 39
    .line 40
    const-string v2, "p_suggest_users_home_view"

    .line 41
    .line 42
    iput-object v2, v1, Ll/q4f;->n:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v2, Ll/pf60;

    .line 45
    .line 46
    const-string v3, "status"

    .line 47
    .line 48
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/pf60;

    .line 52
    .line 53
    sget-boolean v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 54
    .line 55
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "view_appear"

    .line 60
    .line 61
    invoke-direct {v0, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    filled-new-array {v2, v0}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v1, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    return-void
.end method

.method public static x()V
    .locals 8

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->b:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->n()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const-string v0, "card"

    .line 16
    .line 17
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 18
    .line 19
    :cond_1
    new-instance v0, Ll/q4f;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "e_suggest_users_home_status_end"

    .line 25
    .line 26
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 27
    .line 28
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 29
    .line 30
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 31
    .line 32
    const-string v1, "p_suggest_users_home_view"

    .line 33
    .line 34
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v1, Ll/pf60;

    .line 37
    .line 38
    const-string v2, "status"

    .line 39
    .line 40
    const-string v3, "no_lo"

    .line 41
    .line 42
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/pf60;

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v4, "view_appear"

    .line 53
    .line 54
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    new-instance v3, Ll/pf60;

    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    sget-wide v6, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->a:J

    .line 64
    .line 65
    sub-long/2addr v4, v6

    .line 66
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    const-string v5, "duration"

    .line 71
    .line 72
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    new-instance v4, Ll/pf60;

    .line 76
    .line 77
    const-string v5, "loadingsource"

    .line 78
    .line 79
    const-string v6, ""

    .line 80
    .line 81
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    filled-new-array {v1, v2, v3, v4}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v0, v1}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static y()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->o()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sput-wide v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->a:J

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->b:Z

    .line 17
    .line 18
    const-string v1, "no_lo"

    .line 19
    .line 20
    sput-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v2, Ll/q4f;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/q4f;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v3, "e_suggest_users_home_status_start"

    .line 28
    .line 29
    iput-object v3, v2, Ll/q4f;->s:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v3, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 32
    .line 33
    iput-object v3, v2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 34
    .line 35
    const-string v3, "p_suggest_users_home_view"

    .line 36
    .line 37
    iput-object v3, v2, Ll/q4f;->n:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v3, Ll/pf60;

    .line 40
    .line 41
    const-string v4, "status"

    .line 42
    .line 43
    invoke-direct {v3, v4, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/pf60;

    .line 47
    .line 48
    const-string v4, "view_appear"

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-direct {v1, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    filled-new-array {v3, v1}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v2, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static z()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e:Z

    .line 3
    .line 4
    sput-boolean v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->h:Z

    .line 5
    .line 6
    const-string v0, "others"

    .line 7
    .line 8
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->j:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "loading"

    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->k:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->l:Lrx/subjects/a;

    .line 15
    .line 16
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
