.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Landroid/widget/ImageView;

.field public C:Ll/pol;

.field public D:Z

.field public E:Ljava/lang/String;

.field public F:Z

.field public G:Ll/kcg0;

.field public v:Landroid/view/View;

.field public w:Lv/VDraweeView;

.field public x:Landroid/widget/ImageView;

.field public y:Landroid/widget/ImageView;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->E:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->E:Ljava/lang/String;

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->E:Ljava/lang/String;

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    return-void
.end method

.method public static synthetic i(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->z(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/Throwable;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->d(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-static {p2}, Ll/e39;->b(Ljava/lang/Throwable;)I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    const-string v3, "p_chat_view"

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move v6, p1

    .line 21
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Yc(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;ZIZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->y()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->x(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->A(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic w(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 12

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/r97;->e4()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v1, "live_moment_type"

    .line 19
    .line 20
    const-string v2, "revision"

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v1, "moment_id"

    .line 27
    .line 28
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const-string v1, "moment_photo_numbers"

    .line 33
    .line 34
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const-string p2, "moment_type"

    .line 43
    .line 44
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    const/4 p2, 0x0

    .line 49
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v1, "order"

    .line 54
    .line 55
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const-string p2, "owner_id"

    .line 60
    .line 61
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    const-string p2, "recommend_tag_type"

    .line 66
    .line 67
    const-string v1, ""

    .line 68
    .line 69
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    const-string p2, "report"

    .line 74
    .line 75
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    const-string p2, "video_time"

    .line 80
    .line 81
    move-object/from16 v1, p5

    .line 82
    .line 83
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    filled-new-array/range {v3 .. v11}, [Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    const-string v1, "e_moment"

    .line 92
    .line 93
    const-string v2, "p_chat_view"

    .line 94
    .line 95
    invoke-static {v1, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const-string v2, "chat"

    .line 107
    .line 108
    invoke-interface {p2, v1, v2, p1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentDetailAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    if-nez p1, :cond_1

    .line 113
    .line 114
    :goto_0
    return-void

    .line 115
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Landroid/view/View;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u8be5\u52a8\u6001\u56e0\u4e3a\u9690\u79c1\u8bbe\u7f6e\uff0c\u5df2\u4e0d\u53ef\u89c1"

    .line 4
    .line 5
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->C:Ll/pol;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->t()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v4, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-boolean v5, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 26
    .line 27
    xor-int/lit8 v5, v5, 0x1

    .line 28
    .line 29
    const-string v6, "p_chat_view"

    .line 30
    .line 31
    invoke-interface {v2, v3, v4, v5, v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kn(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/pcq;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1, p2}, Ll/pcq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Z)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/gcq;

    .line 45
    .line 46
    invoke-direct {p0, p1, p2}, Ll/gcq;-><init>(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Z)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final C(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->D:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->D:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->C:Ll/pol;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->t()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->t()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/jcq;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1, p2}, Ll/jcq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public D(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->us(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->G:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    invoke-interface {v1, p2, p1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->momentRefresh(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/kcq;

    .line 43
    .line 44
    invoke-direct {p2}, Ll/kcq;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p2, Ll/lcq;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Ll/lcq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/mcq;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/mcq;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {p2, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->G:Ll/kcg0;

    .line 70
    .line 71
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    iget-boolean p1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 78
    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_1

    .line 94
    .line 95
    sget p1, Ll/ibc0;->Y4:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    sget p1, Ll/ibc0;->X4:I

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    sget p1, Ll/ibc0;->e5:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    sget p1, Ll/ibc0;->d5:I

    .line 119
    .line 120
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 121
    .line 122
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 127
    .line 128
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    if-eqz p2, :cond_5

    .line 141
    .line 142
    sget p2, Ll/ibc0;->e5:I

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_5
    sget p2, Ll/ibc0;->d5:I

    .line 146
    .line 147
    :goto_1
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 148
    .line 149
    .line 150
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-eqz p1, :cond_6

    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Landroid/view/View;

    .line 169
    .line 170
    invoke-virtual {p1}, Landroid/view/View;->getTouchDelegate()Landroid/view/TouchDelegate;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    if-nez p1, :cond_6

    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 177
    .line 178
    new-instance p2, Ll/ncq;

    .line 179
    .line 180
    invoke-direct {p2, p0}, Ll/ncq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 184
    .line 185
    .line 186
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 187
    .line 188
    new-instance p2, Ll/ocq;

    .line 189
    .line 190
    invoke-direct {p2, p0, v0}, Ll/ocq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 191
    .line 192
    .line 193
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    invoke-super/range {p0 .. p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 6
    .line 7
    .line 8
    move-object/from16 v0, p1

    .line 9
    .line 10
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->C:Ll/pol;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    :try_start_0
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 22
    .line 23
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    move-object v0, v3

    .line 37
    :goto_0
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->E:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v5, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/4 v5, 0x0

    .line 46
    if-nez v4, :cond_1

    .line 47
    .line 48
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v2, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->E:Ljava/lang/String;

    .line 51
    .line 52
    iput-boolean v5, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    .line 53
    .line 54
    iput-boolean v5, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->D:Z

    .line 55
    .line 56
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->y:Landroid/widget/ImageView;

    .line 57
    .line 58
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->x:Landroid/widget/ImageView;

    .line 62
    .line 63
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v:Landroid/view/View;

    .line 71
    .line 72
    if-eqz v2, :cond_10

    .line 73
    .line 74
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->id:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->ownerId:Ljava/lang/String;

    .line 80
    .line 81
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 84
    .line 85
    invoke-virtual {v6, v4}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    if-eqz v6, :cond_3

    .line 90
    .line 91
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    if-eqz v6, :cond_2

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    const-string v6, "\u4ed6\u53d1\u5e03\u4e86\u52a8\u6001"

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    :goto_1
    const-string v6, "\u5979\u53d1\u5e03\u4e86\u52a8\u6001"

    .line 102
    .line 103
    :goto_2
    iget-object v7, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->z:Lv/VText;

    .line 104
    .line 105
    sget-object v8, Ll/pzi0;->m:Ljava/text/SimpleDateFormat;

    .line 106
    .line 107
    new-instance v9, Ljava/util/Date;

    .line 108
    .line 109
    iget-wide v10, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->createdTime:D

    .line 110
    .line 111
    double-to-long v10, v10

    .line 112
    invoke-direct {v9, v10, v11}, Ljava/util/Date;-><init>(J)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v8, v9}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v7, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->A:Lv/VText;

    .line 123
    .line 124
    iget-object v8, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    if-eqz v8, :cond_4

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_4
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->desc:Ljava/lang/String;

    .line 134
    .line 135
    :goto_3
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v:Landroid/view/View;

    .line 139
    .line 140
    invoke-virtual {v6, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 141
    .line 142
    .line 143
    new-instance v12, Ll/q3d0;

    .line 144
    .line 145
    const/high16 v3, 0x42a00000    # 80.0f

    .line 146
    .line 147
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    invoke-direct {v12, v6, v3}, Ll/q3d0;-><init>(II)V

    .line 156
    .line 157
    .line 158
    iget v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 159
    .line 160
    const/4 v6, 0x4

    .line 161
    const/4 v14, 0x2

    .line 162
    const/4 v15, 0x1

    .line 163
    if-ne v3, v15, :cond_6

    .line 164
    .line 165
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 166
    .line 167
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    if-nez v3, :cond_6

    .line 172
    .line 173
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 180
    .line 181
    iget-object v8, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w:Lv/VDraweeView;

    .line 182
    .line 183
    iget-object v9, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    check-cast v9, Ljava/lang/String;

    .line 190
    .line 191
    const/4 v11, 0x0

    .line 192
    const/4 v13, 0x0

    .line 193
    const/4 v10, 0x1

    .line 194
    invoke-virtual/range {v7 .. v13}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 195
    .line 196
    .line 197
    iget-object v7, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->y:Landroid/widget/ImageView;

    .line 198
    .line 199
    if-le v3, v15, :cond_5

    .line 200
    .line 201
    move v8, v15

    .line 202
    goto :goto_4

    .line 203
    :cond_5
    move v8, v5

    .line 204
    :goto_4
    invoke-static {v7, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->u(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V

    .line 208
    .line 209
    .line 210
    goto/16 :goto_8

    .line 211
    .line 212
    :cond_6
    iget v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 213
    .line 214
    if-ne v3, v14, :cond_7

    .line 215
    .line 216
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 217
    .line 218
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    if-nez v3, :cond_7

    .line 223
    .line 224
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->x:Landroid/widget/ImageView;

    .line 225
    .line 226
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 227
    .line 228
    .line 229
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 230
    .line 231
    iget-object v8, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w:Lv/VDraweeView;

    .line 232
    .line 233
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->imageUrlList:Ljava/util/List;

    .line 234
    .line 235
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    move-object v9, v3

    .line 240
    check-cast v9, Ljava/lang/String;

    .line 241
    .line 242
    const/4 v11, 0x0

    .line 243
    const/4 v13, 0x0

    .line 244
    const/4 v10, 0x1

    .line 245
    invoke-virtual/range {v7 .. v13}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->u(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V

    .line 249
    .line 250
    .line 251
    goto :goto_7

    .line 252
    :cond_7
    iget v3, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 253
    .line 254
    const-string v7, "/"

    .line 255
    .line 256
    const-string v8, "res://"

    .line 257
    .line 258
    if-ne v3, v6, :cond_9

    .line 259
    .line 260
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 261
    .line 262
    iget-object v9, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w:Lv/VDraweeView;

    .line 263
    .line 264
    new-instance v10, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v10, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 270
    .line 271
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v8

    .line 275
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 282
    .line 283
    .line 284
    move-result-object v7

    .line 285
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 286
    .line 287
    .line 288
    move-result-object v7

    .line 289
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    if-eqz v7, :cond_8

    .line 294
    .line 295
    sget v7, Ll/ibc0;->g5:I

    .line 296
    .line 297
    goto :goto_5

    .line 298
    :cond_8
    sget v7, Ll/ibc0;->f5:I

    .line 299
    .line 300
    :goto_5
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v7

    .line 307
    invoke-virtual {v3, v9, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    goto :goto_7

    .line 311
    :cond_9
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 312
    .line 313
    iget-object v9, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w:Lv/VDraweeView;

    .line 314
    .line 315
    new-instance v10, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {v10, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 321
    .line 322
    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v8

    .line 326
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 333
    .line 334
    .line 335
    move-result-object v7

    .line 336
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 337
    .line 338
    .line 339
    move-result-object v7

    .line 340
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 341
    .line 342
    .line 343
    move-result v7

    .line 344
    if-eqz v7, :cond_a

    .line 345
    .line 346
    sget v7, Ll/ibc0;->c5:I

    .line 347
    .line 348
    goto :goto_6

    .line 349
    :cond_a
    sget v7, Ll/ibc0;->b5:I

    .line 350
    .line 351
    :goto_6
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v7

    .line 358
    invoke-virtual {v3, v9, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    :goto_7
    move v3, v5

    .line 362
    :goto_8
    invoke-virtual {v1, v2, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    iget v7, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->type:I

    .line 366
    .line 367
    const-string v8, ""

    .line 368
    .line 369
    if-ne v7, v6, :cond_b

    .line 370
    .line 371
    const-string v6, "voice"

    .line 372
    .line 373
    goto :goto_9

    .line 374
    :cond_b
    if-ne v7, v15, :cond_c

    .line 375
    .line 376
    const-string v6, "photo"

    .line 377
    .line 378
    goto :goto_9

    .line 379
    :cond_c
    if-ne v7, v14, :cond_d

    .line 380
    .line 381
    const-string v6, "video"

    .line 382
    .line 383
    goto :goto_9

    .line 384
    :cond_d
    const/4 v6, 0x3

    .line 385
    if-ne v7, v6, :cond_e

    .line 386
    .line 387
    const-string v6, "word"

    .line 388
    .line 389
    goto :goto_9

    .line 390
    :cond_e
    move-object v6, v8

    .line 391
    :goto_9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->videoDuration:Ljava/lang/String;

    .line 392
    .line 393
    iget-boolean v7, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    .line 394
    .line 395
    if-nez v7, :cond_f

    .line 396
    .line 397
    iput-boolean v15, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    .line 398
    .line 399
    const-string v7, "live_moment_type"

    .line 400
    .line 401
    const-string v9, "revision"

    .line 402
    .line 403
    invoke-static {v7, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 404
    .line 405
    .line 406
    move-result-object v10

    .line 407
    const-string v7, "moment_id"

    .line 408
    .line 409
    invoke-static {v7, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 410
    .line 411
    .line 412
    move-result-object v11

    .line 413
    const-string v7, "moment_photo_numbers"

    .line 414
    .line 415
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 416
    .line 417
    .line 418
    move-result-object v9

    .line 419
    invoke-static {v7, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 420
    .line 421
    .line 422
    move-result-object v12

    .line 423
    const-string v7, "moment_type"

    .line 424
    .line 425
    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 426
    .line 427
    .line 428
    move-result-object v13

    .line 429
    const-string v7, "order"

    .line 430
    .line 431
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 432
    .line 433
    .line 434
    move-result-object v5

    .line 435
    invoke-static {v7, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 436
    .line 437
    .line 438
    move-result-object v14

    .line 439
    const-string v5, "owner_id"

    .line 440
    .line 441
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 442
    .line 443
    .line 444
    move-result-object v15

    .line 445
    const-string v5, "recommend_tag_type"

    .line 446
    .line 447
    invoke-static {v5, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 448
    .line 449
    .line 450
    move-result-object v16

    .line 451
    const-string v5, "report"

    .line 452
    .line 453
    invoke-static {v5, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 454
    .line 455
    .line 456
    move-result-object v17

    .line 457
    const-string v5, "video_time"

    .line 458
    .line 459
    invoke-static {v5, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 460
    .line 461
    .line 462
    move-result-object v18

    .line 463
    filled-new-array/range {v10 .. v18}, [Ll/pf60;

    .line 464
    .line 465
    .line 466
    move-result-object v5

    .line 467
    const-string v7, "e_moment"

    .line 468
    .line 469
    const-string v8, "p_chat_view"

    .line 470
    .line 471
    invoke-static {v7, v8, v5}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 472
    .line 473
    .line 474
    :cond_f
    iget-object v7, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v:Landroid/view/View;

    .line 475
    .line 476
    move-object v5, v4

    .line 477
    move-object v4, v6

    .line 478
    move-object v6, v0

    .line 479
    new-instance v0, Ll/fcq;

    .line 480
    .line 481
    invoke-direct/range {v0 .. v6}, Ll/fcq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    invoke-static {v7, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 485
    .line 486
    .line 487
    goto :goto_a

    .line 488
    :cond_10
    invoke-virtual {v4, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 489
    .line 490
    .line 491
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v:Landroid/view/View;

    .line 492
    .line 493
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 494
    .line 495
    .line 496
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v:Landroid/view/View;

    .line 497
    .line 498
    const/16 v1, 0x8

    .line 499
    .line 500
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 501
    .line 502
    .line 503
    :goto_a
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->F:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->G:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->v:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/edc0;->r2:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VDraweeView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w:Lv/VDraweeView;

    .line 21
    .line 22
    sget v0, Ll/edc0;->l3:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/ImageView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->x:Landroid/widget/ImageView;

    .line 31
    .line 32
    sget v0, Ll/edc0;->w2:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/ImageView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->y:Landroid/widget/ImageView;

    .line 41
    .line 42
    sget v0, Ll/edc0;->R4:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VText;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->z:Lv/VText;

    .line 51
    .line 52
    sget v0, Ll/edc0;->A2:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lv/VText;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->A:Lv/VText;

    .line 61
    .line 62
    sget v0, Ll/edc0;->L1:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Landroid/widget/ImageView;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 71
    .line 72
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->z:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget v2, Ll/g9c0;->i:I

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->A:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Ll/g9c0;->g:I

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->y:Landroid/widget/ImageView;

    .line 117
    .line 118
    sget v1, Ll/ibc0;->Z4:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 124
    .line 125
    sget v1, Ll/ibc0;->e5:I

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->x:Landroid/widget/ImageView;

    .line 131
    .line 132
    sget v1, Ll/ibc0;->a5:I

    .line 133
    .line 134
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->w:Lv/VDraweeView;

    .line 138
    .line 139
    sget v0, Ll/ibc0;->c5:I

    .line 140
    .line 141
    invoke-static {p0, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 142
    .line 143
    .line 144
    :cond_0
    return-void
.end method

.method public t()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageMomentGuide;->ownerId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->t()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Ll/mzl;->k0()Ll/s000;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    iget-boolean v2, v1, Ll/s000;->b:Z

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 47
    .line 48
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->lastMomentExpandedTime:D

    .line 49
    .line 50
    double-to-long v2, v2

    .line 51
    invoke-static {v2, v3}, Ll/e39;->c(J)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 61
    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    .line 63
    .line 64
    .line 65
    move-result-wide v3

    .line 66
    long-to-double v3, v3

    .line 67
    iput-wide v3, v2, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->lastMomentExpandedTime:D

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Ll/j000;->n(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v2, Ll/hcq;

    .line 78
    .line 79
    invoke-direct {v2}, Ll/hcq;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v3, Ll/icq;

    .line 83
    .line 84
    invoke-direct {v3}, Ll/icq;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ll/j3z;->g0()Ll/iam;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ll/h100;

    .line 99
    .line 100
    invoke-virtual {v0, p1, p0}, Ll/h100;->e0(Lcom/p1/mobile/putong/core/data/MessageMomentGuide;Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic v(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->D(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget p1, Ll/ibc0;->Y4:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget p1, Ll/ibc0;->X4:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    sget p1, Ll/ibc0;->e5:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    sget p1, Ll/ibc0;->d5:I

    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic y()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    sget v2, Ll/qa00;->l:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    add-int/2addr v1, v2

    .line 21
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    sub-int/2addr v1, v2

    .line 26
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    new-instance v1, Landroid/view/TouchDelegate;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-direct {v1, v0, v2}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLl/uxj0;)V
    .locals 6

    .line 1
    iget-boolean p3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 2
    .line 3
    xor-int/lit8 v0, p3, 0x1

    .line 4
    .line 5
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 6
    .line 7
    if-nez p3, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    sget p3, Ll/ibc0;->Y4:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget p3, Ll/ibc0;->X4:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    if-eqz p3, :cond_2

    .line 42
    .line 43
    sget p3, Ll/ibc0;->e5:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    sget p3, Ll/ibc0;->d5:I

    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->B:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    iget-boolean p3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 54
    .line 55
    if-eqz p3, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->t()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0, p1}, Ll/j000;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v3, 0x0

    .line 69
    const/16 v4, 0xc9

    .line 70
    .line 71
    const-string v2, "p_chat_view"

    .line 72
    .line 73
    move-object v1, p1

    .line 74
    move v5, p2

    .line 75
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Yc(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;ZIZ)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
