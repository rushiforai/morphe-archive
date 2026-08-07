.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/kyo0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

.field public b:Lv/VRelative;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VRecyclerView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

.field public k:Ll/kyo0;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

.field public m:Ll/nwo0;

.field public n:Ll/g3p0;

.field public o:Ll/m2p0;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/lang/String;

.field public s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->u(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 2
    .line 3
    new-instance v1, Ll/nwo0$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/nwo0$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->f(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 25
    .line 26
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/a;

    .line 27
    .line 28
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/a;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->z(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$c;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m:Ll/nwo0;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->y(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->h:Lv/VRecyclerView;

    .line 47
    .line 48
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->C0()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private setBrandView(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->b:Lv/VRelative;

    .line 2
    .line 3
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->d:Lv/VText;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "LV."

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/kyo0;->J4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->r:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0, p0}, Ll/kyo0;->M4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final B(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m:Ll/nwo0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->H(I)Ll/d3q;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    instance-of v0, p1, Ll/gxo0;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    check-cast p1, Ll/gxo0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/gxo0;->L()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->setBrandView(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 31
    .line 32
    .line 33
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->F(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/kyo0;->I4()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const/4 v0, 0x1

    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->F(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, v0, p1}, Ll/kyo0;->H4(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    return-void
.end method

.method public C(ZZI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const v1, 0x43938000    # 295.0f

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const v1, 0x43bd8000    # 379.0f

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;

    .line 27
    .line 28
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;->setStyle(Z)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;

    .line 32
    .line 33
    invoke-static {p3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;->setSubTitle(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetErrorView;

    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->l6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vwt;->l6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->isShow:Z

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final F(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->h:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->o:Ll/m2p0;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->g:Lv/VText;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    :cond_0
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->n:Ll/g3p0;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->g:Lv/VText;

    .line 38
    .line 39
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->taskList:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->nextHouseId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->r:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->o:Ll/m2p0;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->taskList:Ljava/util/List;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/m2p0;->f0(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->g:Lv/VText;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    xor-int/2addr v1, v2

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->g:Lv/VText;

    .line 41
    .line 42
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->cg:I

    .line 43
    .line 44
    invoke-static {v1, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->r:Ljava/lang/String;

    .line 52
    .line 53
    const-string v0, "-1"

    .line 54
    .line 55
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->e:Lv/VText;

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->f:Lv/VImage;

    .line 68
    .line 69
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->f:Lv/VImage;

    .line 77
    .line 78
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public H(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->n:Ll/g3p0;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/g3p0;->f0(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->mg:I

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->C(ZZI)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getSelectCpInfo()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->l(Ll/kyo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ezo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/kyo0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 2
    .line 3
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseLuxuryValue:D

    .line 2
    .line 3
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpLuxuryValue:D

    .line 4
    .line 5
    sub-double/2addr v0, p0

    .line 6
    const-wide/16 p0, 0x0

    .line 7
    .line 8
    cmpg-double p0, v0, p0

    .line 9
    .line 10
    const-string p1, ""

    .line 11
    .line 12
    if-gtz p0, :cond_0

    .line 13
    .line 14
    return-object p1

    .line 15
    :cond_0
    :try_start_0
    sget-object p0, Ll/mxo0;->Companion:Ll/mxo0$a;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/mxo0$a;->a(D)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public final n(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/dzo0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/dzo0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/nwo0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/nwo0;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m:Ll/nwo0;

    .line 13
    .line 14
    new-instance v0, Ll/g3p0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/g3p0;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->n:Ll/g3p0;

    .line 20
    .line 21
    new-instance v0, Ll/m2p0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/m2p0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->o:Ll/m2p0;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->r()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m:Ll/nwo0;

    .line 32
    .line 33
    new-instance v1, Ll/wyo0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/wyo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/nwo0;->g0(Ll/a30;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->n:Ll/g3p0;

    .line 42
    .line 43
    new-instance v1, Ll/xyo0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/xyo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/g3p0;->g0(Ll/z20;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->o:Ll/m2p0;

    .line 52
    .line 53
    new-instance v1, Ll/yyo0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/yyo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/m2p0;->g0(Ll/z20;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 62
    .line 63
    new-instance v1, Ll/zyo0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/zyo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->A(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->c:Lv/VText;

    .line 72
    .line 73
    new-instance v1, Ll/azo0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/azo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->e:Lv/VText;

    .line 82
    .line 83
    new-instance v1, Ll/bzo0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/bzo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->E()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/vwt;->l6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 106
    .line 107
    const/4 v2, 0x1

    .line 108
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    const-string v1, "svga"

    .line 112
    .line 113
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->iconType:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 120
    .line 121
    if-eqz v1, :cond_0

    .line 122
    .line 123
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->icon:Ljava/lang/String;

    .line 124
    .line 125
    const/4 v3, -0x1

    .line 126
    const/4 v4, 0x0

    .line 127
    invoke-virtual {v2, v1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->d(Ljava/lang/String;ILl/wo0;)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_0
    const-string v1, "context_single_room"

    .line 132
    .line 133
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->icon:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v2, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 139
    .line 140
    new-instance v2, Ll/czo0;

    .line 141
    .line 142
    invoke-direct {v2, p0, v0}, Ll/czo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 146
    .line 147
    .line 148
    :cond_1
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/kyo0;->U4(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/kyo0;->U4(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void

    .line 33
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/kyo0;->J4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/kyo0;->U4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p0}, Ll/kyo0;->O4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kyo0;->N4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpTask;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->B(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->k:Ll/kyo0;

    .line 2
    .line 3
    const/16 p2, 0x464

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public y(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 6
    .line 7
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->b:Lv/VRelative;

    .line 11
    .line 12
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->g:Lv/VText;

    .line 16
    .line 17
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->h:Lv/VRecyclerView;

    .line 21
    .line 22
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->s:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->s:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 31
    .line 32
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->h:Lv/VRecyclerView;

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->m:Ll/nwo0;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/nwo0;->f0(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-nez p1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 25
    .line 26
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->q:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    add-int/lit8 p0, p0, -0x1

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->lg:I

    .line 45
    .line 46
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->n(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v0, -0x1

    .line 55
    if-ne p1, v0, :cond_3

    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ng:I

    .line 58
    .line 59
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetSmoothSpeedRecycle;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
