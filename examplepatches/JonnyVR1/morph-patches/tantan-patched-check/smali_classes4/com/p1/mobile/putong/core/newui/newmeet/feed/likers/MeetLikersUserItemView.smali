.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VRelative;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Landroid/view/View;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;Ll/dzl;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->f(Lcom/p1/mobile/putong/data/User;Ll/dzl;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;ZLl/dzl;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e(Lcom/p1/mobile/putong/data/User;ZLl/dzl;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pdy;->a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d()Lcom/p1/mobile/android/app/Act;
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

.method public final synthetic e(Lcom/p1/mobile/putong/data/User;ZLl/dzl;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/api/s;->M4()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {p4, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p4

    .line 22
    const-string v0, "other_user_id"

    .line 23
    .line 24
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "e_meet_see_card"

    .line 35
    .line 36
    invoke-static {v1, p4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    if-nez p2, :cond_0

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p4

    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->k(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p3, p0}, Ll/dzl;->a(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p2, p4, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {p2, p3, p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/data/User;Ll/dzl;Landroid/view/View;)V
    .locals 6

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/s;->M4()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {p3, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p3, "other_user_id"

    .line 23
    .line 24
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    filled-new-array {p3}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    const-string v0, "e_meet_see_card_like"

    .line 35
    .line 36
    invoke-static {v0, p0, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->new_()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p3, "localLikersUser"

    .line 44
    .line 45
    invoke-static {p3}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 52
    .line 53
    invoke-direct {v1, p1, p0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v2, 0x1

    .line 59
    const/4 v3, 0x0

    .line 60
    move-object v0, p2

    .line 61
    invoke-interface/range {v0 .. v5}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/data/User;Ll/dzl;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->j:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->i:Lv/VImage;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/joa;->f4()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    xor-int/lit8 v2, v0, 0x1

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-static {p1}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->a:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v0, v3, v4, v1}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->a:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const/4 v4, 0x2

    .line 65
    const/16 v5, 0x1e

    .line 66
    .line 67
    invoke-virtual {v0, v1, v3, v4, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->h(Lcom/p1/mobile/putong/data/User;Ll/dzl;)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/ndy;

    .line 74
    .line 75
    invoke-direct {v0, p0, p1, v2, p2}, Ll/ndy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;ZLl/dzl;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/data/User;Ll/dzl;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->h:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d:Lv/VRelative;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->g:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 19
    .line 20
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->b:Lv/VImage;

    .line 27
    .line 28
    invoke-interface {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/Long;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->j(Lcom/p1/mobile/putong/data/User;J)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Yp()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_0

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->f:Lv/VText;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 77
    .line 78
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const-string v2, "%1$s %2$s"

    .line 83
    .line 84
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 102
    .line 103
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 104
    .line 105
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v2, "%s\u5c81"

    .line 110
    .line 111
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->f:Lv/VText;

    .line 119
    .line 120
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    invoke-interface {p2}, Ll/dzl;->c()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_1

    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->v4()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_1

    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->g:Lv/VImage;

    .line 146
    .line 147
    sget v1, Ll/gbc0;->n1:I

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->g:Lv/VImage;

    .line 154
    .line 155
    sget v1, Ll/gbc0;->m1:I

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 158
    .line 159
    .line 160
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d:Lv/VRelative;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    sget v2, Ll/gbc0;->q0:I

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->g:Lv/VImage;

    .line 176
    .line 177
    new-instance v1, Ll/ody;

    .line 178
    .line 179
    invoke-direct {v1, p0, p1, p2}, Ll/ody;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;Lcom/p1/mobile/putong/data/User;Ll/dzl;)V

    .line 180
    .line 181
    .line 182
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v1, "visit"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x2

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v1, "online"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "nearby"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x0

    .line 47
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 52
    .line 53
    const-string v0, "\u770b\u8fc7\u6211"

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget v0, Ll/gbc0;->f1:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p1, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :pswitch_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 75
    .line 76
    const-string v0, "\u6700\u8fd1\u6d3b\u8dc3"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget v0, Ll/gbc0;->e1:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p1, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_2
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 98
    .line 99
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 100
    .line 101
    const/16 v0, 0x3e8

    .line 102
    .line 103
    if-lt p1, v0, :cond_3

    .line 104
    .line 105
    new-instance v0, Ljava/text/DecimalFormat;

    .line 106
    .line 107
    const-string v1, "0.0"

    .line 108
    .line 109
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    int-to-float p1, p1

    .line 113
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 114
    .line 115
    div-float/2addr p1, v1

    .line 116
    float-to-double v1, p1

    .line 117
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const-string v0, "%skm"

    .line 126
    .line 127
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    goto :goto_1

    .line 132
    :cond_3
    const/16 v0, 0x64

    .line 133
    .line 134
    if-ge p1, v0, :cond_4

    .line 135
    .line 136
    move p1, v0

    .line 137
    :cond_4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const-string v0, "%sm"

    .line 146
    .line 147
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 152
    .line 153
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->e:Lv/VText;

    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    sget v0, Ll/gbc0;->d1:I

    .line 163
    .line 164
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p1, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    nop

    .line 173
    :sswitch_data_0
    .sparse-switch
        -0x3e8dd581 -> :sswitch_2
        -0x3c5549ad -> :sswitch_1
        0x6b04d4b -> :sswitch_0
    .end sparse-switch

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final j(Lcom/p1/mobile/putong/data/User;J)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 8
    .line 9
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeCardInfo;->cardTypes:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeCardInfo;->cardTypes:Ljava/util/List;

    .line 50
    .line 51
    const-string v3, "newLikeAfterVerification"

    .line 52
    .line 53
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 60
    .line 61
    const-string p2, "\u6765\u81ea\u9080\u8bf7\u8ba4\u8bc1"

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 67
    .line 68
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 74
    .line 75
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 76
    .line 77
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 78
    .line 79
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_0

    .line 84
    .line 85
    sget p2, Ll/gbc0;->l2:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    sget p2, Ll/gbc0;->k2:I

    .line 89
    .line 90
    :goto_0
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 94
    .line 95
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 96
    .line 97
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 98
    .line 99
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_1

    .line 104
    .line 105
    sget p2, Ll/gbc0;->h2:I

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    sget p2, Ll/gbc0;->g2:I

    .line 109
    .line 110
    :goto_1
    invoke-virtual {p1, p2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 114
    .line 115
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_4

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_3

    .line 130
    .line 131
    const-string p1, "\u5979"

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_3
    const-string p1, "\u4ed6"

    .line 135
    .line 136
    :goto_2
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    const-string p2, "%s\u8d85\u7ea7\u559c\u6b22\u4f60"

    .line 141
    .line 142
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 147
    .line 148
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 152
    .line 153
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 154
    .line 155
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 159
    .line 160
    sget p2, Ll/gbc0;->m2:I

    .line 161
    .line 162
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 166
    .line 167
    sget p2, Ll/gbc0;->e2:I

    .line 168
    .line 169
    invoke-virtual {p1, p2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 173
    .line 174
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 181
    .line 182
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C5(Lcom/p1/mobile/putong/data/User;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_5

    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 189
    .line 190
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 194
    .line 195
    const-string p2, "\u5373\u523b\u804a\u5929"

    .line 196
    .line 197
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 201
    .line 202
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 208
    .line 209
    sget p2, Ll/gbc0;->b2:I

    .line 210
    .line 211
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 215
    .line 216
    sget p1, Ll/gbc0;->i:I

    .line 217
    .line 218
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_5
    const-wide/16 v3, 0x0

    .line 223
    .line 224
    cmp-long v0, p2, v3

    .line 225
    .line 226
    if-lez v0, :cond_7

    .line 227
    .line 228
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 229
    .line 230
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-eqz v0, :cond_7

    .line 235
    .line 236
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 237
    .line 238
    long-to-double p2, p2

    .line 239
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 240
    .line 241
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 242
    .line 243
    cmpg-double p1, p2, v3

    .line 244
    .line 245
    if-gez p1, :cond_6

    .line 246
    .line 247
    goto :goto_3

    .line 248
    :cond_6
    move v2, v1

    .line 249
    :goto_3
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 253
    .line 254
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 255
    .line 256
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 260
    .line 261
    const-string p2, "\u65b0\u559c\u6b22"

    .line 262
    .line 263
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 267
    .line 268
    sget p2, Ll/gbc0;->k2:I

    .line 269
    .line 270
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 271
    .line 272
    .line 273
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 274
    .line 275
    sget p1, Ll/gbc0;->d2:I

    .line 276
    .line 277
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 278
    .line 279
    .line 280
    return-void

    .line 281
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c:Lv/VText;

    .line 282
    .line 283
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 284
    .line 285
    .line 286
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->new_()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "localLikersUser"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 14
    .line 15
    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    int-to-float p2, p2

    .line 9
    const v0, 0x3faa3d71    # 1.33f

    .line 10
    .line 11
    .line 12
    mul-float/2addr p2, v0

    .line 13
    float-to-int p2, p2

    .line 14
    const/high16 v0, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-super {p0, p1, v0}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d:Lv/VRelative;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    int-to-float p2, p2

    .line 32
    const v0, 0x3ec28f5c    # 0.38f

    .line 33
    .line 34
    .line 35
    mul-float/2addr p2, v0

    .line 36
    float-to-int p2, p2

    .line 37
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 38
    .line 39
    if-eq v0, p2, :cond_0

    .line 40
    .line 41
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersUserItemView;->d:Lv/VRelative;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method
