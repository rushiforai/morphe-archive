.class public Ll/du70;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Landroid/view/View;

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Landroid/widget/TextView;

.field public m:Landroidx/recyclerview/widget/RecyclerView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public o:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public p:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

.field public q:Ll/kcg0;

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;",
            ">;"
        }
    .end annotation
.end field

.field public s:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x5

    .line 5
    iput p1, p0, Ll/du70;->s:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/du70;Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/du70;->e4(Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V

    return-void
.end method

.method public static synthetic K3(Ll/du70;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/du70;->c4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->startTs:J

    .line 2
    .line 3
    iget v2, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->duration:I

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E(JI)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->type:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "magnetCardResult"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->type:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "critCardResult"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic M3(Ll/du70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/du70;->Y3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N3(Ll/du70;Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/du70;->X3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;)V

    return-void
.end method

.method public static synthetic O3(Ll/du70;Ll/hct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/du70;->d4(Ll/hct;)V

    return-void
.end method

.method public static synthetic P3(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x6

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic R3(Ll/du70;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/du70;->b4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic S3(Ll/du70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/du70;->a4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T3(Ll/du70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/du70;->Z3(Landroid/view/View;)V

    return-void
.end method

.method private W3()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/du70;->m:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/du70;->o:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 25
    .line 26
    iget-object p0, p0, Ll/du70;->m:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic Y3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/du70;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Z3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/du70;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic a4(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Ll/efv;->O:Ljava/lang/String;

    .line 2
    .line 3
    const/high16 v0, 0x439b0000    # 310.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x258

    .line 10
    .line 11
    const/16 v2, 0x18

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic d4(Ll/hct;)V
    .locals 1

    .line 1
    iget v0, p1, Ll/hct;->a:I

    .line 2
    .line 3
    iput v0, p0, Ll/du70;->s:I

    .line 4
    .line 5
    iget-boolean p1, p1, Ll/hct;->b:Z

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-direct {p0}, Ll/du70;->isShowing()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/du70;->g4()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p0}, Ll/du70;->V3()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method


# virtual methods
.method public U3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eu70;->b(Ll/du70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public V3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;->itemCardList:Ljava/util/List;

    .line 2
    .line 3
    iput-object p1, p0, Ll/du70;->r:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/du70;->h4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du70;->q:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/du70;->h4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/du70;->s:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->BLiveUserItemCards:Ljava/util/List;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->BLiveOtherUserItemCardsList:Ljava/util/List;

    .line 10
    .line 11
    :goto_0
    iput-object p1, p0, Ll/du70;->r:Ljava/util/List;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/du70;->isShowing()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/du70;->h4()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final f4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du70;->p:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    iget-object v0, p0, Ll/du70;->p:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->G5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/cu70;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/cu70;-><init>(Ll/du70;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public g4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v1, v2}, Ll/du70;->U3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    iget-object v0, p0, Ll/du70;->j:Lv/VImage;

    .line 26
    .line 27
    new-instance v1, Ll/xt70;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/xt70;-><init>(Ll/du70;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/du70;->i:Landroid/view/View;

    .line 36
    .line 37
    new-instance v1, Ll/yt70;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/yt70;-><init>(Ll/du70;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/du70;->k:Lv/VImage;

    .line 46
    .line 47
    new-instance v1, Ll/zt70;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/zt70;-><init>(Ll/du70;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 56
    .line 57
    new-instance v1, Ll/au70;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/au70;-><init>(Ll/du70;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Ll/du70;->W3()V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, Ll/du70;->m:Landroidx/recyclerview/widget/RecyclerView;

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/ru70;

    .line 75
    .line 76
    const/16 v1, 0x258

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ll/ru70;-><init>(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 86
    .line 87
    iput-object v0, p0, Ll/du70;->p:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 88
    .line 89
    iget-object v0, p0, Ll/du70;->l:Landroid/widget/TextView;

    .line 90
    .line 91
    iget v1, p0, Ll/du70;->s:I

    .line 92
    .line 93
    const/4 v2, 0x5

    .line 94
    if-ne v1, v2, :cond_1

    .line 95
    .line 96
    const-string v1, "PK\u9053\u5177\u5361"

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Ll/du70;->p:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 105
    .line 106
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 111
    .line 112
    const/4 v3, 0x3

    .line 113
    invoke-static {v2, v3}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v2, "\u7684PK\u9053\u5177\u5361"

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    iget v0, p0, Ll/du70;->s:I

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ll/du70;->f4(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ll/du70;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/du70;->q:Ll/kcg0;

    .line 143
    .line 144
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    new-instance v1, Ll/bu70;

    .line 162
    .line 163
    invoke-direct {v1, p0}, Ll/bu70;-><init>(Ll/du70;)V

    .line 164
    .line 165
    .line 166
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iput-object v0, p0, Ll/du70;->q:Ll/kcg0;

    .line 175
    .line 176
    return-void
.end method

.method public final h4()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/du70;->r:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/wt70;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/wt70;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/du70;->r:Ljava/util/List;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/du70;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/du70;->r:Ljava/util/List;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    iget-object v2, p0, Ll/du70;->r:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-ge v1, v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Ll/du70;->r:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 45
    .line 46
    new-instance v3, Ll/bm4;

    .line 47
    .line 48
    invoke-direct {v3, v2}, Ll/bm4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object v1, p0, Ll/du70;->o:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/du70;->o:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/tt70;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/tt70;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/ut70;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/ut70;-><init>(Ll/du70;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Ll/aj1;->e2:Lrx/subjects/b;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/vt70;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/vt70;-><init>(Ll/du70;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    return-void
.end method
