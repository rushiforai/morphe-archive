.class public Ll/xcx$g;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xcx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/BreakIce;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Ll/xcx;


# direct methods
.method public constructor <init>(Ll/xcx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx$g;->d:Ll/xcx;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/xcx$g;->c:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/xcx;Ll/zcx;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/xcx$g;-><init>(Ll/xcx;)V

    return-void
.end method

.method public static synthetic E(Ll/xcx$g;Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/xcx$g;->H(Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/xcx$g;->d:Ll/xcx;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "actor_user_id"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "message_id"

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "chat_content"

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "e_breakice_content"

    .line 46
    .line 47
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Ll/xcx$g;->d:Ll/xcx;

    .line 51
    .line 52
    invoke-static {p2}, Ll/xcx;->L(Ll/xcx;)Ll/xbx;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iget-object v0, p0, Ll/xcx$g;->d:Ll/xcx;

    .line 57
    .line 58
    invoke-static {v0}, Ll/xcx;->L(Ll/xcx;)Ll/xbx;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/k8x;->o0()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p2, p1, v0}, Ll/xbx;->a2(Lcom/p1/mobile/putong/core/data/BreakIce;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    iget-object p0, p0, Ll/xcx$g;->d:Ll/xcx;

    .line 74
    .line 75
    invoke-static {p0}, Ll/xcx;->L(Ll/xcx;)Ll/xbx;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/k8x;->o0()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p2, p0, p1}, Ll/dkb;->I9(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xcx$g;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/BreakIce;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx$g;->c:Ljava/util/List;

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
    iget-object p0, p0, Ll/xcx$g;->d:Ll/xcx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xcx;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Ll/kec0;->j7:I

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/BreakIce;II)V
    .locals 0

    .line 1
    sget p3, Ll/adc0;->Sd:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    new-instance p3, Ll/ycx;

    .line 15
    .line 16
    invoke-direct {p3, p0, p2}, Ll/ycx;-><init>(Ll/xcx$g;Lcom/p1/mobile/putong/core/data/BreakIce;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/BreakIce;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx$g;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/xcx$g;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/xcx$g;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx$g;->G(I)Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
