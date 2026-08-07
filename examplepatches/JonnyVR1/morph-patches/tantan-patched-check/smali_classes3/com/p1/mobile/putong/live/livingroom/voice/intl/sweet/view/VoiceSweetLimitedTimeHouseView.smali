.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Ljava/lang/String;

.field public e:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/c0p0;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m0p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->f:Ll/c0p0;

    .line 2
    .line 3
    new-instance v1, Ll/l0p0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/l0p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/c0p0;->g0(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    new-instance v1, Ll/szo0$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/szo0$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->a:Lv/VRecyclerView;

    .line 12
    .line 13
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x3

    .line 20
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->a:Lv/VRecyclerView;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->f:Ll/c0p0;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->e:Ll/z20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public f(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->d:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->f:Ll/c0p0;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/c0p0;->f0(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->b:Lv/VLinear;

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->c:Lv/VText;

    .line 24
    .line 25
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Eh:I

    .line 26
    .line 27
    invoke-static {p1}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->b:Lv/VLinear;

    .line 40
    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->c:Lv/VText;

    .line 47
    .line 48
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Dh:I

    .line 49
    .line 50
    invoke-static {p1}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    const/4 p0, 0x0

    .line 59
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c0p0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/c0p0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->f:Ll/c0p0;

    .line 10
    .line 11
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->b(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->d()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->c()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setHouseItemClickListener(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;->e:Ll/z20;

    .line 2
    .line 3
    return-void
.end method
