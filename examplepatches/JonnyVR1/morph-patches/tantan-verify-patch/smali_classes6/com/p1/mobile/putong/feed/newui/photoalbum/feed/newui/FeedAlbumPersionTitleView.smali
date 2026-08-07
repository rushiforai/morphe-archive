.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VLinear_FillerMeasure;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

.field public k:Lv/VImage;

.field public l:Landroid/widget/FrameLayout;

.field public m:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VLinear;

.field public q:Lv/VDraweeView;

.field public r:Lv/VText;

.field public s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedWriterLevelInProfileView;

.field public t:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic h0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;Landroid/view/View;)V
    .locals 8

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p3, "state_id"

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "owner_id"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {p3, v0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    const-string v0, "e_other_state"

    .line 27
    .line 28
    const-string v1, "p_album"

    .line 29
    .line 30
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BubbleInfo;->checkStateTimeIsValid()Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_1

    .line 38
    .line 39
    const-string p0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    if-eqz p3, :cond_2

    .line 50
    .line 51
    new-instance p1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    const-string p3, ""

    .line 61
    .line 62
    invoke-static {p2, p1, p0, p3, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r2(Landroid/content/Context;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-interface {p3, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 91
    .line 92
    const/4 p3, 0x1

    .line 93
    invoke-static {p2, p1, p0, p3, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 106
    .line 107
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1}, Ll/ksg;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const/4 v6, 0x0

    .line 116
    const-string v7, ""

    .line 117
    .line 118
    const-string v4, "p_album"

    .line 119
    .line 120
    move-object v1, p2

    .line 121
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Yn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method


# virtual methods
.method public act()Lcom/p1/mobile/android/app/Act;
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

.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qng;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->p:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->t:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->n:Lv/VText;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->n:Lv/VText;

    .line 16
    .line 17
    sget v0, Ll/qa00;->m:I

    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/ksg;->A0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {p1}, Ll/ksg;->z0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->t:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    const-string v5, "  \u2022  "

    .line 33
    .line 34
    if-nez v4, :cond_1

    .line 35
    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_0

    .line 53
    .line 54
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->o:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->j:Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->j:Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 98
    .line 99
    const/4 v0, 0x6

    .line 100
    const/4 v1, 0x2

    .line 101
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d(Lcom/p1/mobile/putong/data/User;II)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Exception;

    .line 4
    .line 5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string p3, "PhotoAlbumProfileInfoView render user = null userId:"

    .line 8
    .line 9
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->t:Ljava/lang/String;

    .line 29
    .line 30
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->f:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/high16 v2, 0x42b40000    # 90.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const/high16 v3, 0x42f00000    # 120.0f

    .line 53
    .line 54
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-virtual {p2, v0, v1, v2, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->h:Lv/VText;

    .line 62
    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->h:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v1, 0x1

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 82
    .line 83
    .line 84
    :cond_1
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 85
    .line 86
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->i:Lv/VImage;

    .line 93
    .line 94
    invoke-interface {p2, v0, p1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->l:Landroid/widget/FrameLayout;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->m:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 104
    .line 105
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->k:Lv/VImage;

    .line 113
    .line 114
    invoke-static {p2, p1, v2, v1, v0}, Ll/orb0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->k:Lv/VImage;

    .line 118
    .line 119
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-nez p2, :cond_2

    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->k:Lv/VImage;

    .line 126
    .line 127
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->k:Lv/VImage;

    .line 132
    .line 133
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 138
    .line 139
    invoke-virtual {p0, p2, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->p0(Landroid/view/View;Landroid/graphics/drawable/Drawable;I)V

    .line 140
    .line 141
    .line 142
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    if-nez p2, :cond_3

    .line 149
    .line 150
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->n:Lv/VText;

    .line 151
    .line 152
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->n:Lv/VText;

    .line 156
    .line 157
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->m0(Lcom/p1/mobile/putong/data/User;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->f:Lv/VDraweeView;

    .line 166
    .line 167
    new-instance p2, Ll/ong;

    .line 168
    .line 169
    invoke-direct {p2, p3}, Ll/ong;-><init>(Ll/x20;)V

    .line 170
    .line 171
    .line 172
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->l0()V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 4

    .line 1
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-nez p4, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->p:Lv/VLinear;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    const-string p3, "state_id"

    .line 20
    .line 21
    iget-object v0, p4, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    iget-object v0, p4, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "owner_id"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    filled-new-array {p3, v0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    const-string v0, "e_other_state"

    .line 42
    .line 43
    const-string v1, "p_album"

    .line 44
    .line 45
    invoke-static {v0, v1, p3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->p:Lv/VLinear;

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->q:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v2, p4, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 61
    .line 62
    sget v3, Ll/qa00;->q:I

    .line 63
    .line 64
    invoke-virtual {p3, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 65
    .line 66
    .line 67
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->r:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 74
    .line 75
    .line 76
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->r:Lv/VText;

    .line 77
    .line 78
    iget-object v0, p4, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->p:Lv/VLinear;

    .line 86
    .line 87
    new-instance p3, Ll/png;

    .line 88
    .line 89
    invoke-direct {p3, p4, p1, p2}, Ll/png;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onFinishInflate()V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0(Landroid/view/View;Landroid/graphics/drawable/Drawable;I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    if-lez p3, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-gtz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr v0, v1

    .line 27
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    mul-int/2addr v1, p3

    .line 32
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    div-int/2addr v1, p2

    .line 37
    add-int/2addr v0, v1

    .line 38
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-void
.end method
