.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/csp;


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

.field public e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/ClipLayout;

.field public f:Lv/VImage;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Ll/oqp;

.field public m:Ljava/util/concurrent/ConcurrentLinkedDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lv/VDraweeView;

.field public o:Landroid/animation/Animator;

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m:Ljava/util/concurrent/ConcurrentLinkedDeque;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m:Ljava/util/concurrent/ConcurrentLinkedDeque;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/dq1;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 10
    .line 11
    sget v0, Ll/xec0;->N1:I

    .line 12
    .line 13
    invoke-static {p1, v0, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->Y(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/oqp;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1, p2}, Ll/oqp;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Ll/ner;Ll/dq1;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->l:Ll/oqp;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->f0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->e0(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;)Ljava/util/concurrent/ConcurrentLinkedDeque;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m:Ljava/util/concurrent/ConcurrentLinkedDeque;

    return-object p0
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->n:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->b0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Z)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->h0(Lv/VDraweeView;)V

    return-void
.end method

.method private l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/ClipLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->j:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->k:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->f:Lv/VImage;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/ClipLayout;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->clear()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->o:Landroid/animation/Animator;

    .line 43
    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method


# virtual methods
.method public final Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uqp;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Z()Lv/VDraweeView;
    .locals 4

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/high16 v2, 0x42700000    # 60.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-direct {v1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/xlj;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v2, p0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Ll/h1e0;->i:Ll/h1e0;

    .line 51
    .line 52
    invoke-virtual {v2, p0}, Ll/xlj;->v(Ll/h1e0;)Ll/xlj;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, v1}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ll/xlj;->a()Ll/wlj;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public a0(ZLcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V
    .locals 8

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "audio_tab_id"

    .line 5
    .line 6
    const-string v1, "NA"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->p:I

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "index"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const-string p0, "liveId"

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getVoiceLiveId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string p0, "anchorId"

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getUserId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    const-string p0, "audio_room_type"

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getLiveMode()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    const-string p0, "msg_audio_follow_cell"

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const-string p0, "msg_audio_multi_follow_cell"

    .line 60
    .line 61
    :goto_0
    const-string p1, "audio_card_type"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "e_live_audio_room_enter"

    .line 72
    .line 73
    const-string p2, "p_messages_view"

    .line 74
    .line 75
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Z)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getVoiceLiveId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getVoiceRoomId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->L(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Ll/itd0;->d:Ll/itd0;

    .line 46
    .line 47
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ll/bk3;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/bk3;->f()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->f:Lv/VImage;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    const-string v0, "audio_tab_id"

    .line 63
    .line 64
    const-string v1, "NA"

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->p:I

    .line 71
    .line 72
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string v0, "index"

    .line 77
    .line 78
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    const-string p0, "liveId"

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getVoiceLiveId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const-string p0, "anchorId"

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getUserId()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    const-string p0, "audio_room_type"

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getLiveMode()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    if-eqz p2, :cond_0

    .line 113
    .line 114
    const-string p0, "msg_audio_follow_cell"

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    const-string p0, "msg_audio_multi_follow_cell"

    .line 118
    .line 119
    :goto_0
    const-string p1, "audio_card_type"

    .line 120
    .line 121
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string p1, "e_live_audio_room_enter"

    .line 130
    .line 131
    const-string p2, "p_messages_view"

    .line 132
    .line 133
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "audio_tab_id"

    .line 18
    .line 19
    const-string p1, "NA"

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "is_show_red_dot"

    .line 26
    .line 27
    const-string v1, "false"

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "tooltips_type_ui"

    .line 34
    .line 35
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "red_dot_num"

    .line 40
    .line 41
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v2, "status"

    .line 46
    .line 47
    const-string v3, "no_audio_available"

    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    filled-new-array {p0, v0, v1, p1, v2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "e_audio_follow"

    .line 58
    .line 59
    const-string v0, "p_messages_view"

    .line 60
    .line 61
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->b0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic e0(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->b0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final g0()Lv/VDraweeView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m:Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->poll()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->Z()Lv/VDraweeView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->h0(Lv/VDraweeView;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public final h0(Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of p0, p0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public i0()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->l0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->c:Lv/VDraweeView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->j:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->h:Lv/VText;

    .line 16
    .line 17
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->w0:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i:Lv/VText;

    .line 23
    .line 24
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->t0:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/pqp;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/pqp;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "audio_tab_id"

    .line 38
    .line 39
    const-string v0, "NA"

    .line 40
    .line 41
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v1, "is_show_red_dot"

    .line 46
    .line 47
    const-string v2, "false"

    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "tooltips_type_ui"

    .line 54
    .line 55
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "red_dot_num"

    .line 60
    .line 61
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v3, "status"

    .line 66
    .line 67
    const-string v4, "no_audio_available"

    .line 68
    .line 69
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    filled-new-array {p0, v1, v2, v0, v3}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "e_audio_follow"

    .line 78
    .line 79
    const-string v1, "p_messages_view"

    .line 80
    .line 81
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;ZIJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/ClipLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->n:Lv/VDraweeView;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->g0()Lv/VDraweeView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->n0(Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->l0()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m0()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->g0()Lv/VDraweeView;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/ClipLayout;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->k:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    const-string v0, "context_common"

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getUserAvatar()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v0, p2, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/sqp;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Ll/sqp;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->e:Lcom/p1/mobile/putong/live/external/intl/view/widgets/ClipLayout;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->n:Lv/VDraweeView;

    .line 67
    .line 68
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->h:Lv/VText;

    .line 69
    .line 70
    sget p2, Lcom/p1/mobile/putong/live/external/R$string;->v0:I

    .line 71
    .line 72
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-static {p2, p3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    sget p3, Lcom/p1/mobile/putong/live/external/R$string;->s0:I

    .line 90
    .line 91
    invoke-static {p3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    invoke-static {p2, p3}, Ll/vuf0;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    sget v0, Ll/m9c0;->o:I

    .line 108
    .line 109
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    invoke-virtual {p2, p3}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p2}, Ll/vuf0$a;->b()Landroid/text/SpannableStringBuilder;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->k:Landroid/widget/TextView;

    .line 125
    .line 126
    long-to-double p1, p4

    .line 127
    invoke-static {p1, p2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;J)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->l0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->m0()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->k:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->k:Landroid/widget/TextView;

    .line 19
    .line 20
    long-to-double p2, p2

    .line 21
    invoke-static {p2, p3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->h:Lv/VText;

    .line 29
    .line 30
    sget p3, Lcom/p1/mobile/putong/live/external/R$string;->u0:I

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getUserName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p3, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->s0:I

    .line 50
    .line 51
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {p3, v0}, Ll/vuf0;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v2, Ll/m9c0;->o:I

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p3, v0}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    invoke-virtual {p3}, Ll/vuf0$a;->b()Landroid/text/SpannableStringBuilder;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;->getUserAvatar()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-virtual {p2, p3}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    new-instance p3, Ll/q3d0;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;->getAvatarSize()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 103
    .line 104
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;->getAvatarSize()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-direct {p3, v0, v2}, Ll/q3d0;-><init>(II)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 120
    .line 121
    new-instance v0, Ll/qqp;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/qqp;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p3, p2, v0}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 127
    .line 128
    .line 129
    new-instance p2, Ll/rqp;

    .line 130
    .line 131
    invoke-direct {p2, p0, p1}, Ll/rqp;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V

    .line 132
    .line 133
    .line 134
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->a0(ZLcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final m0()V
    .locals 1

    .line 1
    sget-object v0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/bk3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/bk3;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->f:Lv/VImage;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final n0(Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V
    .locals 12

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 8
    .line 9
    invoke-static {p1, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-wide/16 v3, 0x1f4

    .line 14
    .line 15
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v5, Ll/qa00;->B:I

    .line 20
    .line 21
    neg-int v6, v5

    .line 22
    int-to-float v6, v6

    .line 23
    new-array v7, v0, [F

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    const/4 v9, 0x0

    .line 27
    aput v9, v7, v8

    .line 28
    .line 29
    const/4 v10, 0x1

    .line 30
    aput v6, v7, v10

    .line 31
    .line 32
    sget-object v6, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 33
    .line 34
    invoke-static {p1, v6, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    invoke-virtual {v7, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    int-to-float v5, v5

    .line 43
    new-array v11, v0, [F

    .line 44
    .line 45
    aput v9, v11, v8

    .line 46
    .line 47
    aput v5, v11, v10

    .line 48
    .line 49
    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 50
    .line 51
    invoke-static {p1, v5, v11}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v11

    .line 55
    invoke-virtual {v11, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    filled-new-array {v1, v7, v11}, [Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    .line 68
    .line 69
    invoke-direct {v7}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v7}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    new-instance v7, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;

    .line 76
    .line 77
    invoke-direct {v7, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lv/VDraweeView;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v7}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 81
    .line 82
    .line 83
    new-array p1, v0, [F

    .line 84
    .line 85
    fill-array-data p1, :array_1

    .line 86
    .line 87
    .line 88
    invoke-static {p2, v2, p1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const/high16 v2, 0x420c0000    # 35.0f

    .line 97
    .line 98
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    int-to-float v7, v7

    .line 103
    new-array v11, v0, [F

    .line 104
    .line 105
    aput v7, v11, v8

    .line 106
    .line 107
    aput v9, v11, v10

    .line 108
    .line 109
    invoke-static {p2, v6, v11}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-virtual {v6, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    neg-int v2, v2

    .line 122
    int-to-float v2, v2

    .line 123
    new-array v0, v0, [F

    .line 124
    .line 125
    aput v2, v0, v8

    .line 126
    .line 127
    aput v9, v0, v10

    .line 128
    .line 129
    invoke-static {p2, v5, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    filled-new-array {p1, v6, v0}, [Landroid/animation/Animator;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 146
    .line 147
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 151
    .line 152
    .line 153
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$b;

    .line 154
    .line 155
    invoke-direct {v0, p0, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView$b;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 159
    .line 160
    .line 161
    filled-new-array {p1, v1}, [Landroid/animation/Animator;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->o:Landroid/animation/Animator;

    .line 170
    .line 171
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->l:Ll/oqp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/oqp;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->o:Landroid/animation/Animator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->d:Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveHaloAvatar;->e()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public z(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->p:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->l:Ll/oqp;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/oqp;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
