.class public Ll/s740;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/hjp;

.field public f:Ll/pkp;

.field public g:Ll/x20;

.field public h:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;

.field public i:Ll/xm4;


# direct methods
.method public constructor <init>(Ll/hjp;Ll/pkp;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/s740;->g:Ll/x20;

    .line 20
    .line 21
    new-instance v0, Ll/o740;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/o740;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/s740;->h:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;

    .line 27
    .line 28
    new-instance v0, Ll/s740$a;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/s740$a;-><init>(Ll/s740;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/s740;->i:Ll/xm4;

    .line 34
    .line 35
    iput-object p1, p0, Ll/s740;->e:Ll/hjp;

    .line 36
    .line 37
    iput-object p2, p0, Ll/s740;->f:Ll/pkp;

    .line 38
    .line 39
    return-void
.end method

.method private synthetic A(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s740;->f:Ll/pkp;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pkp;->U:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "intl_tribe_source_name"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "receiver_user_id"

    .line 12
    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {v0, v1}, [Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_intl_tribe_card"

    .line 24
    .line 25
    const-string v2, "p_intl_tribe_swipe_view"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/s740;->f:Ll/pkp;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->getCardData()Ll/ik4;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iget-object v0, p0, Ll/s740;->f:Ll/pkp;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;->pageId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 58
    .line 59
    iget-object p0, p0, Ll/s740;->e:Ll/hjp;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/hjp;->B1(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-static {p2, v0, p1, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->r(Ll/ik4;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private synthetic B(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 2

    .line 1
    invoke-direct {p0, p3}, Ll/s740;->I(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/d09;->g()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 26
    .line 27
    iget-object p2, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p2}, Ll/uih0;->r0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object v1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 57
    .line 58
    iget-object p2, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    invoke-virtual {v0, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object p0, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private C()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 18
    .line 19
    iget-object v1, p0, Ll/s740;->c:Ljava/util/List;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    invoke-direct {p0, v0}, Ll/s740;->E(Lcom/p1/mobile/putong/data/User;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x1

    .line 46
    if-le v0, v1, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Ll/s740;->d:Ljava/util/Map;

    .line 57
    .line 58
    iget-object v2, p0, Ll/s740;->c:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    invoke-direct {p0, v0}, Ll/s740;->E(Lcom/p1/mobile/putong/data/User;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method private D(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    const-string v1, "raw"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/s740;->z(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private E(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Ll/s740;->D(Lcom/p1/mobile/putong/data/Media;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private I(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string p1, "VirtualCard"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static synthetic s(Ll/s740;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/s740;->B(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    return-void
.end method

.method public static synthetic t(Ll/s740;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/s740;->A(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    return-void
.end method

.method private z(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    const-string p0, "preload"

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/nwb;->e(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public F(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_2

    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_0

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 70
    .line 71
    if-ne v2, v3, :cond_0

    .line 72
    .line 73
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 74
    .line 75
    .line 76
    iget-object p1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 77
    .line 78
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/s740;->c:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v0, "\u5220\u9664Adapter\u6570\u636e\uff1a"

    .line 89
    .line 90
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v0, " , "

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object v0, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v0, ","

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/s740;->c:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    const-string p1, "BifrostLayout"

    .line 127
    .line 128
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    const/4 p0, 0x1

    .line 132
    return p0

    .line 133
    :cond_3
    const/4 p0, 0x0

    .line 134
    return p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/s740;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/s740;->C()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/s740;->notifyDataSetChanged()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public H(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s740;->g:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/s740;->w(Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p2, :cond_3

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;->DEFAULT_CARD:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 4
    .line 5
    invoke-static {p2}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/nql;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p2}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ll/nql;->b()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/s740;->f:Ll/pkp;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p2}, Ll/uj4;->b(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)Ll/nql;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-interface {p2, v0}, Ll/nql;->a(Z)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_1
    instance-of p0, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 51
    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    move-object p0, v0

    .line 55
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setOptStackCard(Z)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-object v0

    .line 62
    :cond_3
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 63
    .line 64
    iget-object p0, p0, Ll/s740;->f:Ll/pkp;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    return-object p1
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s740;->g:Ll/x20;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/s740;->g:Ll/x20;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s740;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;II)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 2
    .line 3
    iget-object p3, p0, Ll/s740;->h:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;

    .line 4
    .line 5
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->setPageHelper(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;)V

    .line 6
    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->setDisableShowBlurCover(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 13
    .line 14
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 21
    .line 22
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->i0()V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->r()V

    .line 26
    .line 27
    .line 28
    iget-object p3, p0, Ll/s740;->d:Ljava/util/Map;

    .line 29
    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    check-cast p3, Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CardInfos;->momentId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Ll/s740;->f:Ll/pkp;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/pkp;->Z()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, p3, p2, p4, v0}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILandroid/view/View;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_2

    .line 97
    .line 98
    invoke-virtual {p1, p3, p2, p4}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    new-instance p3, Ljava/lang/IllegalStateException;

    .line 103
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v1, "card unRender :"

    .line 107
    .line 108
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-direct {p3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    if-nez p4, :cond_7

    .line 127
    .line 128
    iget-object p3, p0, Ll/s740;->f:Ll/pkp;

    .line 129
    .line 130
    invoke-virtual {p3}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 135
    .line 136
    .line 137
    move-result-object p3

    .line 138
    sget-object p4, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 139
    .line 140
    if-ne p3, p4, :cond_7

    .line 141
    .line 142
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 143
    .line 144
    const-string p4, "VirtualCard"

    .line 145
    .line 146
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    if-nez p3, :cond_3

    .line 151
    .line 152
    iget-object p3, p0, Ll/s740;->e:Ll/hjp;

    .line 153
    .line 154
    invoke-virtual {p3}, Ll/hjp;->n1()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result p3

    .line 164
    if-eqz p3, :cond_4

    .line 165
    .line 166
    :cond_3
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result p3

    .line 172
    if-eqz p3, :cond_7

    .line 173
    .line 174
    iget-object p3, p0, Ll/s740;->e:Ll/hjp;

    .line 175
    .line 176
    invoke-virtual {p3}, Ll/hjp;->m1()I

    .line 177
    .line 178
    .line 179
    move-result p3

    .line 180
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eq p3, v0, :cond_7

    .line 185
    .line 186
    :cond_4
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 189
    .line 190
    .line 191
    move-result p3

    .line 192
    if-eqz p3, :cond_5

    .line 193
    .line 194
    iget-object p3, p0, Ll/s740;->e:Ll/hjp;

    .line 195
    .line 196
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result p4

    .line 200
    invoke-virtual {p3, p4}, Ll/hjp;->y2(I)V

    .line 201
    .line 202
    .line 203
    :cond_5
    iget-object p3, p0, Ll/s740;->e:Ll/hjp;

    .line 204
    .line 205
    iget-object p4, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {p3, p4}, Ll/hjp;->z2(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iget-object p3, p0, Ll/s740;->f:Ll/pkp;

    .line 211
    .line 212
    invoke-virtual {p3}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 213
    .line 214
    .line 215
    move-result-object p3

    .line 216
    invoke-virtual {p3}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 217
    .line 218
    .line 219
    move-result p3

    .line 220
    if-eqz p3, :cond_6

    .line 221
    .line 222
    iget-object p0, p0, Ll/s740;->e:Ll/hjp;

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/hjp;->k1()V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_6
    iget-object p3, p0, Ll/s740;->f:Ll/pkp;

    .line 229
    .line 230
    invoke-virtual {p3}, Ll/pkp;->S()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 231
    .line 232
    .line 233
    move-result-object p3

    .line 234
    new-instance p4, Ll/q740;

    .line 235
    .line 236
    invoke-direct {p4, p0, p2, p1}, Ll/q740;-><init>(Ll/s740;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 237
    .line 238
    .line 239
    const-wide/16 p0, 0x64

    .line 240
    .line 241
    invoke-static {p3, p4, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 242
    .line 243
    .line 244
    :cond_7
    return-void
.end method

.method public y(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    new-array v1, v1, [Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/s740;->d:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/r740;

    .line 19
    .line 20
    invoke-direct {v2, p0, v0, v1}, Ll/r740;-><init>(Ll/s740;Ljava/util/List;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/api/n;->Y3(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method
