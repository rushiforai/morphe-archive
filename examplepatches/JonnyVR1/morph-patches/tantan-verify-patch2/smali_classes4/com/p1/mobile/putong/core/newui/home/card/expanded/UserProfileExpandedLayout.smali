.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;
.super Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public B:I

.field public w:Z

.field public x:Ll/fmf;

.field public y:Ll/ik4;

.field public z:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->w:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->w:Z

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->w:Z

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    return-void
.end method

.method private Q0()V
    .locals 2

    .line 1
    new-instance v0, Ll/fmf;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/fmf;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->x:Ll/fmf;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setAdapter(Ll/gmf;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->o1(Lcom/p1/mobile/putong/data/User;I)V

    return-void
.end method


# virtual methods
.method public H()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 7

    .line 1
    invoke-static {}, Ll/g6v;->f()Ll/g6v;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/g6v;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/c760;->d()Ll/c760;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/c760;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/mp5;->h()Ll/mp5;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/mp5;->m(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->z:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->A:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 31
    .line 32
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->B:I

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->x:Ll/fmf;

    .line 35
    .line 36
    invoke-virtual {v0, p2, p1, p3}, Ll/fmf;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->A:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    new-instance v6, Ll/nhk0;

    .line 44
    .line 45
    invoke-direct {v6, p0, p1, p3}, Ll/nhk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;Lcom/p1/mobile/putong/data/User;I)V

    .line 46
    .line 47
    .line 48
    move-object v1, p0

    .line 49
    move-object v3, p1

    .line 50
    move v5, p3

    .line 51
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->l1(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILjava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public Y()Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public getCardData()Ll/ik4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->getCardDataProxy()Ll/ik4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getCardDataProxy()Ll/ik4;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ik4;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ik4;-><init>(Ll/q7m;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 11
    .line 12
    new-instance v1, Ll/ik4$a;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ik4$a;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ik4;->h(Ll/ik4$a;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->z:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/ik4;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->A:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/ik4;->j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->y()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput-boolean v1, v0, Ll/ik4$a;->e:Z

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->z:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->z:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 63
    .line 64
    iput-object v1, v0, Ll/ik4$a;->c:Ljava/util/List;

    .line 65
    .line 66
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->y:Ll/ik4;

    .line 67
    .line 68
    return-object p0
.end method

.method public getCardView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getCardViewProxy()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getMomentInfoProxy()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->A:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserProxy()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->z:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/q7m;->getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    move-result-object p0

    return-object p0
.end method

.method public j0(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final n1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ohk0;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o1(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->x:Ll/fmf;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->A:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ll/fmf;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->n1(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedLayout;->Q0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic setExpandedScrollListener(Ll/atl;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q7m;->setExpandedScrollListener(Ll/atl;)V

    return-void
.end method

.method public bridge synthetic setUndoClickAction(Ll/x20;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q7m;->setUndoClickAction(Ll/x20;)V

    return-void
.end method

.method public t()Landroid/view/ViewStub;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method
