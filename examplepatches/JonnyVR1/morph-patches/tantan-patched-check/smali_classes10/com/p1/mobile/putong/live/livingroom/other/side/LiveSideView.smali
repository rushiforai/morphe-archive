.class public Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/axt;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public d:Ll/ogd0;

.field public e:Ll/j0u;

.field public f:Ll/byt;

.field public g:Ll/byt;

.field public h:Ll/byt;

.field public final i:Ll/ayt;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/lang/String;

.field public m:Ll/jxt;

.field public n:Ll/axt;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ayt;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ayt;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->i:Ll/ayt;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->l:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    new-instance p1, Ll/ayt;

    invoke-direct {p1}, Ll/ayt;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->i:Ll/ayt;

    .line 31
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k:Ljava/util/List;

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->l:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    new-instance p1, Ll/ayt;

    invoke-direct {p1}, Ll/ayt;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->i:Ll/ayt;

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k:Ljava/util/List;

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->l:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;Ll/zxt;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->s(Ll/zxt;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->u()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->v(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->w()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->V4(ZZ)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private p(Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/byt;

    .line 4
    .line 5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Rb:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p1, v0}, Ll/byt;-><init>(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->f:Ll/byt;

    .line 17
    .line 18
    new-instance p1, Ll/byt;

    .line 19
    .line 20
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wj:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {p1, v0}, Ll/byt;-><init>(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->g:Ll/byt;

    .line 32
    .line 33
    new-instance p1, Ll/byt;

    .line 34
    .line 35
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 36
    .line 37
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z6:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-direct {p1, v0}, Ll/byt;-><init>(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->h:Ll/byt;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance v0, Ll/byt;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {v0, v1}, Ll/byt;-><init>(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->f:Ll/byt;

    .line 57
    .line 58
    new-instance v0, Ll/byt;

    .line 59
    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 61
    .line 62
    invoke-direct {v0, v1}, Ll/byt;-><init>(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->g:Ll/byt;

    .line 66
    .line 67
    new-instance v0, Ll/byt;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 70
    .line 71
    invoke-direct {v0, p1}, Ll/byt;-><init>(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->h:Ll/byt;

    .line 75
    .line 76
    return-void
.end method

.method private q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->m:Ll/jxt;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 6
    .line 7
    new-instance v3, Ll/cxt;

    .line 8
    .line 9
    invoke-direct {v3, p0}, Ll/cxt;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Ll/v6u;->m0(Ll/dtl;Ll/ner;Ll/pcj;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v1, v2}, Ll/j0u;->C0(Lcom/p1/mobile/android/app/Frag;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 37
    .line 38
    new-instance v2, Ll/dxt;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/dxt;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
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

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

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

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getImageList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/axt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->l(Ll/axt;)V

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
    invoke-static {p0, p1}, Ll/kxt;->a(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/axt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n:Ll/axt;

    .line 2
    .line 3
    return-void
.end method

.method public final m(Ll/ubu;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ubu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/zxt;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    iget-object v1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    :cond_1
    :goto_0
    iget-object v2, p1, Ll/ubu;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_2

    .line 25
    .line 26
    iget-object v2, p1, Ll/ubu;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 33
    .line 34
    new-instance v3, Ll/zxt;

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    invoke-direct {v3, v2, p3, v1}, Ll/zxt;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->d:Ll/ogd0;

    .line 42
    .line 43
    invoke-virtual {v4}, Ll/ogd0;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v3, v4}, Ll/d3q;->B(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    new-instance v4, Ll/ixt;

    .line 54
    .line 55
    invoke-direct {v4, p0, v3, v2}, Ll/ixt;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;Ll/zxt;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v4}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p2, v3}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k:Ljava/util/List;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    :goto_1
    return-object v0
.end method

.method public n(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/ogd0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->d:Ll/ogd0;

    .line 4
    .line 5
    new-instance v0, Ll/jxt;

    .line 6
    .line 7
    invoke-direct {v0, p2}, Ll/jxt;-><init>(Ll/ogd0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->m:Ll/jxt;

    .line 11
    .line 12
    invoke-static {}, Ll/j0u;->H0()Ll/j0u;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->q()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Ll/ogd0;->E0()Ll/agd0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2}, Ll/ogd0;->A0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->z(Ll/agd0;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->a:Lv/VImage;

    .line 37
    .line 38
    new-instance p2, Ll/bxt;

    .line 39
    .line 40
    invoke-direct {p2, p1}, Ll/bxt;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic s(Ll/zxt;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->m:Ll/jxt;

    .line 2
    .line 3
    invoke-virtual {p3, p1}, Ll/jxt;->d(Ll/d3q;)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->d:Ll/ogd0;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->expendToFullLive()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->DEFAULT:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p3, p2}, Ll/ogd0;->V0(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n:Ll/axt;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/axt;->m0(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final synthetic u()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->S4()Z

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

.method public final synthetic v(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x8

    .line 12
    .line 13
    if-le p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->d:Ll/ogd0;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ogd0;->E0()Ll/agd0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/agd0;->t()Ll/v5m;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/v5m;->h()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic w()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v6u;->q0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public x(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/v6u;->p0()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public y(Ll/wwt;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/wwt;->d()Ll/ubu;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Ll/wwt;->g()Ll/ubu;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, Ll/wwt;->e()Ll/ubu;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n:Ll/axt;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/axt;->h0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->k:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 35
    .line 36
    iget-boolean v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 37
    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    iget-object v4, p1, Ll/ubu;->a:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_1

    .line 47
    .line 48
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->h:Ll/byt;

    .line 49
    .line 50
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    const-string v4, "hourRanking"

    .line 54
    .line 55
    invoke-virtual {p0, p1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->m(Ll/ubu;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    iget-object v4, p1, Ll/ubu;->a:Ljava/util/List;

    .line 63
    .line 64
    new-instance v5, Ll/ext;

    .line 65
    .line 66
    invoke-direct {v5}, Ll/ext;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v4, v5}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v1, v4}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 77
    .line 78
    iget-boolean v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 79
    .line 80
    if-eqz v4, :cond_1

    .line 81
    .line 82
    iget-object p1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 83
    .line 84
    new-instance v4, Ll/fxt;

    .line 85
    .line 86
    invoke-direct {v4}, Ll/fxt;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {p1, v4}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {v0, p1}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 97
    .line 98
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 99
    .line 100
    if-eqz p1, :cond_3

    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->g:Ll/byt;

    .line 103
    .line 104
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object p1, v0, Ll/ubu;->a:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_2

    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->i:Ll/ayt;

    .line 116
    .line 117
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    :cond_2
    const-string p1, "follow"

    .line 121
    .line 122
    invoke-virtual {p0, v0, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->m(Ll/ubu;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 127
    .line 128
    .line 129
    iget-object p1, v0, Ll/ubu;->a:Ljava/util/List;

    .line 130
    .line 131
    new-instance v0, Ll/gxt;

    .line 132
    .line 133
    invoke-direct {v0}, Ll/gxt;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {v1, p1}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 141
    .line 142
    .line 143
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 144
    .line 145
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 146
    .line 147
    if-eqz p1, :cond_4

    .line 148
    .line 149
    iget-object p1, v1, Ll/ubu;->a:Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-nez p1, :cond_4

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->f:Ll/byt;

    .line 158
    .line 159
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    :cond_4
    const-string p1, "recommend"

    .line 163
    .line 164
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->m(Ll/ubu;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->e:Ll/j0u;

    .line 172
    .line 173
    const/4 v0, 0x1

    .line 174
    invoke-virtual {p1, v3, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 178
    .line 179
    new-instance v0, Ll/hxt;

    .line 180
    .line 181
    invoke-direct {v0, p0}, Ll/hxt;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public z(Ll/agd0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/agd0;->t()Ll/v5m;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ll/v5m;->c()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 10
    .line 11
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->p(Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n:Ll/axt;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2}, Ll/axt;->i0()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p2, Ll/axt;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->c:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 25
    .line 26
    invoke-direct {p2, v0}, Ll/axt;-><init>(Ll/ner;)V

    .line 27
    .line 28
    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n:Ll/axt;

    .line 30
    .line 31
    invoke-virtual {p2, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n:Ll/axt;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/axt;->l0(Ll/agd0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
