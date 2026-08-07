.class public Ll/sng;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/sng;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/sng;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput p2, p0, Ll/sng;->e:I

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Ll/sng;Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/sng;->I(Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V

    return-void
.end method

.method private H(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rng;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/rng;-><init>(Ll/sng;Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic I(Lcom/p1/mobile/putong/feed/data/Group;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/sng;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, p2, v1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ll/pf60;

    .line 18
    .line 19
    const-string v0, "circle_id"

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p2, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/pf60;

    .line 27
    .line 28
    iget p0, p0, Ll/sng;->e:I

    .line 29
    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const-string p0, "joined"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string p0, "popular"

    .line 36
    .line 37
    :goto_0
    const-string v0, "circle_source"

    .line 38
    .line 39
    invoke-direct {p1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "e_circle_card"

    .line 47
    .line 48
    const-string p2, "p_circle_list"

    .line 49
    .line 50
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/sng;->F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sng;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sng;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->B:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;

    .line 2
    .line 3
    iget p3, p0, Ll/sng;->e:I

    .line 4
    .line 5
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupItemView;->z(Lcom/p1/mobile/putong/feed/data/Group;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Ll/sng;->H(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/feed/data/Group;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sng;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 8
    .line 9
    return-object p0
.end method

.method public J(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sng;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sng;->G(I)Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
