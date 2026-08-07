.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;
.super Lv/VFrame_Shadow;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

.field public B:Ll/ji80;

.field public h:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardScrollView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemUserHeadView;

.field public m:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;

.field public n:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;

.field public o:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;

.field public p:Landroid/widget/LinearLayout;

.field public q:Lv/VFrame_Shadow;

.field public r:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

.field public s:Lv/VFrame_Shadow;

.field public t:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

.field public u:Lv/VFrame_Shadow;

.field public v:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

.field public w:Lv/VFrame_Shadow;

.field public x:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

.field public y:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSendGreetView;

.field public z:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->N4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->O4()Ll/fsh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->O4()Ll/fsh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic k(Ll/ji80;Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p2, "is_reply"

    .line 2
    .line 3
    const-string v0, "0"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p2, p0, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const-string v2, ""

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object p2, v2

    .line 25
    :goto_0
    const-string v3, "moment_id"

    .line 26
    .line 27
    invoke-static {v3, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string v3, "is_input"

    .line 32
    .line 33
    invoke-static {v3, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v4, "is_match"

    .line 38
    .line 39
    invoke-static {v4, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    iget-object v0, p0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    const-string v5, "owner_id"

    .line 48
    .line 49
    invoke-static {v5, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string v0, "state_id"

    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    move-object v2, p2

    .line 60
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    const-string v0, "e_send_message"

    .line 65
    .line 66
    const-string v1, "p_poi_nearby_card"

    .line 67
    .line 68
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 69
    .line 70
    .line 71
    new-instance p2, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 72
    .line 73
    iget-object p0, p0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-direct {p2, p0, v1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const-string p0, "p_home,greet"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->O4()Ll/fsh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vph;->a(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "moments_user_id"

    .line 5
    .line 6
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_moment_card"

    .line 17
    .line 18
    const-string v0, "p_poi_nearby_card"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "moment_id"

    .line 5
    .line 6
    iget-object v1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "owner_id"

    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "moment_type"

    .line 31
    .line 32
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->p(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v3, "moment_distance"

    .line 45
    .line 46
    invoke-static {v3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-wide v3, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 51
    .line 52
    double-to-long v3, v3

    .line 53
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v3, "moment_create_time"

    .line 58
    .line 59
    invoke-static {v3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    filled-new-array {v0, v1, v2, p0, p1}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_moment"

    .line 68
    .line 69
    const-string v0, "p_poi_nearby_card"

    .line 70
    .line 71
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->z:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->j:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardScrollView;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b(Lv/VScroll;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->i:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    sget v1, Ll/qa00;->o:I

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->r(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->distance:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return-wide p0

    .line 17
    :catch_0
    :cond_1
    :goto_0
    return-wide v0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->B:Ll/ji80;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p2, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->j:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardScrollView;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1, v1}, Landroid/view/View;->scrollTo(II)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->A:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->B:Ll/ji80;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->l:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemUserHeadView;

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemUserHeadView;->g(Ll/ji80;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->m:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMomentInfoView;->b(Ll/ji80;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->n:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;

    .line 41
    .line 42
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemAboutMeView;->h(Ll/ji80;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->o:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;

    .line 46
    .line 47
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->k(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->y:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSendGreetView;

    .line 51
    .line 52
    new-instance v1, Ll/qph;

    .line 53
    .line 54
    invoke-direct {v1, p2, p1}, Ll/qph;-><init>(Ll/ji80;Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->r:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 61
    .line 62
    sget v0, Ll/dbc0;->fk:I

    .line 63
    .line 64
    sget v1, Ll/dbc0;->ik:I

    .line 65
    .line 66
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;->s(II)V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->r:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 70
    .line 71
    new-instance v0, Ll/rph;

    .line 72
    .line 73
    invoke-direct {v0, p1}, Ll/rph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->t:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 80
    .line 81
    sget v0, Ll/dbc0;->fk:I

    .line 82
    .line 83
    sget v1, Ll/dbc0;->bk:I

    .line 84
    .line 85
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;->s(II)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->t:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 89
    .line 90
    new-instance v0, Ll/sph;

    .line 91
    .line 92
    invoke-direct {v0, p1}, Ll/sph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->v:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 99
    .line 100
    sget v0, Ll/dbc0;->fk:I

    .line 101
    .line 102
    sget v1, Ll/dbc0;->ek:I

    .line 103
    .line 104
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;->s(II)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->v:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 108
    .line 109
    new-instance v0, Ll/tph;

    .line 110
    .line 111
    invoke-direct {v0, p1}, Ll/tph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->x:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 118
    .line 119
    sget v0, Ll/dbc0;->fk:I

    .line 120
    .line 121
    sget v1, Ll/dbc0;->hk:I

    .line 122
    .line 123
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;->s(II)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->x:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardOperationButton;

    .line 127
    .line 128
    new-instance p2, Ll/uph;

    .line 129
    .line 130
    invoke-direct {p2, p1}, Ll/uph;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final r(Landroid/view/View;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->setClipToOutline(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
