.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;
.super Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;",
        "Ll/iam<",
        "Ll/h6u;",
        ">;"
    }
.end annotation


# instance fields
.field public L:Ll/h6u;

.field public M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic A5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;)Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    return-object p0
.end method

.method private C5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->L:Ll/h6u;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->L:Ll/h6u;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/h6u;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic w5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->E5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic x5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->C5()V

    return-void
.end method

.method public static synthetic y5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->F5(Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public B5(Ll/h6u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->L:Ll/h6u;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/h6u;->I2()V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/h6u;->o3()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final D5(Ll/v5u;Ljava/util/List;)Ll/h2u;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5u;",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)",
            "Ll/h2u;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h2u;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/v5u;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    xor-int/lit8 p2, p2, 0x1

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2}, Ll/h2u;-><init>(IZZ)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public final synthetic E5(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 12
    .line 13
    mul-int/lit8 v1, v1, 0x5

    .line 14
    .line 15
    sub-int/2addr v0, v1

    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->L:Ll/h6u;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/h6u;->p3()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic F5(Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;->mediaUrl:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->L:Ll/h6u;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p2, p0, v0}, Ll/h6u;->q3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public G5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->v5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->h5(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public I5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->k()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->u5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K5(Ll/v5u;)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 3
    .line 4
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v2, p1, Ll/v5u;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;

    .line 26
    .line 27
    new-instance v4, Ll/w5u;

    .line 28
    .line 29
    iget v5, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 30
    .line 31
    invoke-direct {v4, v3, v5}, Ll/w5u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;I)V

    .line 32
    .line 33
    .line 34
    new-instance v5, Ll/u5u;

    .line 35
    .line 36
    invoke-direct {v5, p0, v3}, Ll/u5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4, v5}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->pageId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v4, v3}, Ll/d3q;->B(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    xor-int/2addr v2, v0

    .line 58
    invoke-virtual {p0, v2, v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->t5(ZZ)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->D5(Ll/v5u;Ljava/util/List;)Ll/h2u;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 69
    .line 70
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {p1}, Ll/v5u;->c()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 79
    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->b0(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 86
    .line 87
    add-int/lit8 p1, v2, -0x1

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    sub-int/2addr v1, v2

    .line 94
    add-int/2addr v1, v0

    .line 95
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    const/4 p0, 0x0

    .line 100
    invoke-virtual {v3, v1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public U4(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->U4(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/h6u;

    .line 5
    .line 6
    new-instance p2, Ll/nus;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p2, v0, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p0, p2}, Ll/h6u;-><init>(Ll/ner;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/a1u;->S2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->w2(Ll/mvc0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a5()I
    .locals 0

    .line 1
    const/high16 p0, 0x42300000    # 44.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/r5u;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/r5u;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/s5u;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/s5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 11
    .line 12
    :cond_0
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 19
    .line 20
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 43
    .line 44
    new-instance v0, Ll/t5u;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/t5u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->M:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/h6u;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->B5(Ll/h6u;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_teen_mode"

    .line 2
    .line 3
    return-object p0
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->L:Ll/h6u;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/h6u;->o3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
