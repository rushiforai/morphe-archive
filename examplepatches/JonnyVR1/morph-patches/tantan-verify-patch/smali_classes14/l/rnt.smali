.class public Ll/rnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/pmt;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public final b:Ll/pmt;

.field public c:Ll/kcg0;

.field public final d:Lv/VRecyclerView;

.field public final e:Lv/VEditText;


# direct methods
.method public constructor <init>(Ll/pmt;Lv/VRecyclerView;Lv/VText;Lv/VEditText;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    iput-object p2, p0, Ll/rnt;->d:Lv/VRecyclerView;

    .line 12
    .line 13
    iput-object p4, p0, Ll/rnt;->e:Lv/VEditText;

    .line 14
    .line 15
    iput-object p1, p0, Ll/rnt;->b:Ll/pmt;

    .line 16
    .line 17
    invoke-direct {p0}, Ll/rnt;->v()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/rnt;->u()V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/hnt;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ll/hnt;-><init>(Ll/pmt;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p3, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private E()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rnt;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic a(Ll/rnt;Ll/jlt;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rnt;->B(Ll/jlt;)V

    return-void
.end method

.method public static synthetic b(Ll/rnt;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rnt;->w(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic c(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/rnt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;ILl/jlt;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rnt;->A(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;ILl/jlt;)V

    return-void
.end method

.method public static synthetic e(Ll/rnt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rnt;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/rnt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;Ll/jlt;Ll/jlt;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rnt;->C(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;Ll/jlt;Ll/jlt;)V

    return-void
.end method

.method public static synthetic i(Ll/pmt;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pmt;->U2()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic j(Ll/rnt;Ll/jlt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/rnt;->z(Ll/jlt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/rnt;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rnt;->x(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic l(Ll/rnt;)Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnt;->e:Lv/VEditText;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/rnt;)Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    return-object p0
.end method

.method public static q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->k:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->n:I

    .line 16
    .line 17
    new-instance v0, Ll/qnt;

    .line 18
    .line 19
    invoke-direct {v0, p2}, Ll/qnt;-><init>(Ll/x20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->m5()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/rnt;->e:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/rnt;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/rnt;->e:Lv/VEditText;

    .line 23
    .line 24
    invoke-static {v1}, Ll/ynp0;->H(Landroid/widget/EditText;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-wide/16 v1, 0x1f4

    .line 33
    .line 34
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/jnt;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/jnt;-><init>(Ll/rnt;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Ll/rnt;->c:Ll/kcg0;

    .line 62
    .line 63
    iget-object v0, p0, Ll/rnt;->e:Lv/VEditText;

    .line 64
    .line 65
    new-instance v1, Ll/knt;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/knt;-><init>(Ll/rnt;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/rnt;->e:Lv/VEditText;

    .line 74
    .line 75
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    new-instance v1, Ll/fcv;

    .line 79
    .line 80
    invoke-direct {v1, v0}, Ll/fcv;-><init>(Lv/VEditText;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 84
    .line 85
    .line 86
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v0}, Ll/gnt;->g(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/rnt;->e:Lv/VEditText;

    .line 94
    .line 95
    new-instance v1, Ll/lnt;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/lnt;-><init>(Ll/rnt;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method private v()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rnt;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rnt;->d:Lv/VRecyclerView;

    .line 9
    .line 10
    new-instance v1, Ll/rnt$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/rnt$a;-><init>(Ll/rnt;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;ILl/jlt;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p0, p1}, Ll/rnt;->s(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p3, p0, p2}, Ll/gnt;->j(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p3, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->onlive:Z

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p1, p3, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 34
    .line 35
    invoke-static {p0, p1, p2}, Ll/gnt;->j(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {}, Ll/qfs;->k()Ll/qfs$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p2, p3, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ll/qfs$a;->b(Ljava/lang/String;)Ll/qfs$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "anchorSearch"

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Ll/qfs$a;->c(Ljava/lang/String;)Ll/qfs$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p2, p3, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ll/qfs$a;->f(Ljava/lang/String;)Ll/qfs$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Ll/qfs$a;->a()Ll/qfs;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0, p1}, Ll/bfu;->b(Ljava/lang/String;Ll/qfs;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic B(Ll/jlt;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnt;->b:Ll/pmt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pmt;->S2(Ll/jlt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;Ll/jlt;Ll/jlt;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/rnt;->b:Ll/pmt;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    iget-object p3, p3, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchHistoryEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

    .line 8
    .line 9
    invoke-virtual {p3}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;->addRecord()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->getSearchText()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p3, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p2, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->followedButNotMatched()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/rnt;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Ll/rnt;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->s:I

    .line 41
    .line 42
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    new-instance v0, Ll/pnt;

    .line 47
    .line 48
    invoke-direct {v0, p0, p2}, Ll/pnt;-><init>(Ll/rnt;Ll/jlt;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, p3, v0}, Ll/rnt;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-static {}, Ll/qfs;->k()Ll/qfs$a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p3, p2, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p3}, Ll/qfs$a;->b(Ljava/lang/String;)Ll/qfs$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string p3, "anchorSearch"

    .line 68
    .line 69
    invoke-virtual {p1, p3}, Ll/qfs$a;->c(Ljava/lang/String;)Ll/qfs$a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p3, p2, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p3}, Ll/qfs$a;->f(Ljava/lang/String;)Ll/qfs$a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/qfs$a;->a()Ll/qfs;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    invoke-static {p3, p1}, Ll/bfu;->a(Ljava/lang/String;Ll/qfs;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/rnt;->b:Ll/pmt;

    .line 93
    .line 94
    invoke-virtual {p0, p2}, Ll/pmt;->S2(Ll/jlt;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rnt;->b:Ll/pmt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->getAnchorList()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->getAnchorList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    move-object v4, v2

    .line 26
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 27
    .line 28
    iget-object v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/base/bean/BaseLiveInfo;->queryUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    if-nez v6, :cond_0

    .line 35
    .line 36
    move-object v4, p0

    .line 37
    move-object v7, p1

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    iget-object v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->ongoingId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/base/bean/BaseLiveInfo;->queryLiveById(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    iget-object v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/base/bean/BaseLiveInfo;->queryRoomById(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    new-instance v3, Ll/jlt;

    .line 56
    .line 57
    iget-object v2, p0, Ll/rnt;->b:Ll/pmt;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/klt;->E2()Ll/imt;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v8, v2, Ll/imt;->b:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 64
    .line 65
    invoke-direct/range {v3 .. v8}, Ll/jlt;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V

    .line 66
    .line 67
    .line 68
    add-int/lit8 v8, v1, 0x1

    .line 69
    .line 70
    move-object v5, v3

    .line 71
    new-instance v3, Ll/mnt;

    .line 72
    .line 73
    move-object v7, p1

    .line 74
    move-object v6, v4

    .line 75
    move-object v4, p0

    .line 76
    invoke-direct/range {v3 .. v8}, Ll/mnt;-><init>(Ll/rnt;Ll/jlt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;I)V

    .line 77
    .line 78
    .line 79
    move-object p0, v3

    .line 80
    move-object v3, v5

    .line 81
    invoke-virtual {v3, p0}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    new-instance p0, Ll/nnt;

    .line 85
    .line 86
    invoke-direct {p0, v4, v6, v8, v3}, Ll/nnt;-><init>(Ll/rnt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;ILl/jlt;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, p0}, Ll/d3q;->z(Ljava/lang/Runnable;)V

    .line 90
    .line 91
    .line 92
    new-instance p0, Ll/ont;

    .line 93
    .line 94
    invoke-direct {p0, v4, v7, v3}, Ll/ont;-><init>(Ll/rnt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;Ll/jlt;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3, p0}, Ll/jlt;->Q(Ll/y20;)V

    .line 98
    .line 99
    .line 100
    invoke-direct {v4}, Ll/rnt;->E()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v3, p0}, Ll/d3q;->B(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 111
    .line 112
    move-object p0, v4

    .line 113
    move-object p1, v7

    .line 114
    goto :goto_0

    .line 115
    :cond_1
    move-object v4, p0

    .line 116
    iget-object p0, v4, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/d3q;

    .line 22
    .line 23
    instance-of v2, v1, Ll/jlt;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    check-cast v1, Ll/jlt;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, v1, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    iget-object v2, p0, Ll/rnt;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 42
    .line 43
    new-instance v3, Ll/ngk0;

    .line 44
    .line 45
    invoke-direct {v3, p1}, Ll/ngk0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rnt;->b:Ll/pmt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnt;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pmt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rnt;->n(Ll/pmt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public n(Ll/pmt;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rnt;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/rnt;->e:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->jumpLiveId:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->jumpRoomId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 18
    .line 19
    const-string p1, "onlive"

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 26
    .line 27
    return-object p0
.end method

.method public final synthetic w(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnt;->b:Ll/pmt;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/pmt;->V2(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic x(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/rnt;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p0, p0, Ll/rnt;->e:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/gnt;->f(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic z(Ll/jlt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p5, p1, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->onlive:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/rnt;->b:Ll/pmt;

    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->getSearchText()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p2, p5, p3}, Ll/pmt;->N2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p1, p1, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 25
    .line 26
    invoke-static {p0, p1, p4}, Ll/gnt;->h(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 31
    .line 32
    iget-boolean p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 33
    .line 34
    if-eqz p5, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/rnt;->s(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p2, p0, Ll/rnt;->b:Ll/pmt;

    .line 41
    .line 42
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->getSearchText()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p2, p1, p3}, Ll/pmt;->N2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Ll/rnt;->E()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0, p1, p4}, Ll/gnt;->h(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-object p0, p0, Ll/rnt;->b:Ll/pmt;

    .line 58
    .line 59
    iget-object p1, p1, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->getSearchText()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p0, p1, p2}, Ll/pmt;->L0(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
