.class public Ll/qit;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/vit;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VRecyclerView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

.field public p:Lv/VImage;

.field public q:Lv/VText;

.field public r:Lv/VRecyclerView;

.field public s:Landroid/widget/FrameLayout;

.field public t:Landroid/widget/FrameLayout;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Landroid/widget/LinearLayout;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/vit;)V
    .locals 2
    .param p2    # Ll/vit;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->h5:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ll/qag0;->c(F)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "p_live_exit_popup"

    .line 12
    .line 13
    iput-object p1, p0, Ll/qit;->A:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic F(Ll/qit;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qit;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/qit;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qit;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object p1, p0, Ll/qit;->A:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "p_live_exit_popup"

    .line 9
    .line 10
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object v0, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getSuggestedLives()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const/4 p1, 0x0

    .line 39
    :goto_0
    if-eqz p1, :cond_3

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Ll/qit;->A:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/amd0;->a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 60
    .line 61
    check-cast v0, Ll/vit;

    .line 62
    .line 63
    iget-object p0, p0, Ll/qit;->A:Ljava/lang/String;

    .line 64
    .line 65
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 70
    .line 71
    invoke-virtual {v0, p0, p1}, Ll/vit;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_1
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_live_exit_popup_exit"

    .line 2
    .line 3
    iget-object v0, p0, Ll/qit;->A:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 12
    .line 13
    check-cast p0, Ll/vit;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vit;->V3()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qit;->x:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/oit;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/oit;-><init>(Ll/qit;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/qit;->y:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/pit;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/pit;-><init>(Ll/qit;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rit;->a(Ll/qit;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qit;->s:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget p1, Ll/obc0;->e4:I

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->e3:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    sget p1, Ll/obc0;->g4:I

    .line 21
    .line 22
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f3:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move p1, v2

    .line 26
    move v0, p1

    .line 27
    :goto_0
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object v3, p0, Ll/qit;->s:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Ll/qit;->o:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ll/qit;->k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/qit;->u:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/qit;->v:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public L(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/qit;->A:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/qit;->o:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 18
    .line 19
    check-cast p2, Ll/vit;

    .line 20
    .line 21
    iget-object v0, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->W(Ll/vit;Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Ll/qit;->k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->Y()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/qit;->o:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->T()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p1, p0, Ll/qit;->k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 44
    .line 45
    check-cast p2, Ll/vit;

    .line 46
    .line 47
    iget-object v0, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 48
    .line 49
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->Z(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/qit;->k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->V()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/qit;->o:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->V()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 2
    .line 3
    const-string v0, "p_live_exit_popup"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getSuggestedLives()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getSuggestedLives()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 29
    .line 30
    invoke-static {v0, p1}, Ll/amd0;->b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iput-object v0, p0, Ll/qit;->A:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p1, p0, Ll/qit;->o:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 36
    .line 37
    const/16 v0, 0x8

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/qit;->k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/qit;->k:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 50
    .line 51
    check-cast v0, Ll/vit;

    .line 52
    .line 53
    iget-object v2, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 54
    .line 55
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->Z(Ll/vit;Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/qit;->z:Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;

    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->getSuggestedLives()Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    :cond_1
    const/4 v1, 0x1

    .line 73
    :cond_2
    invoke-virtual {p0, v1}, Ll/qit;->I(Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/qit;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/qit;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
