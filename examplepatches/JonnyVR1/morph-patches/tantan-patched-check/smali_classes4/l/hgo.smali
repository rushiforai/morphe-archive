.class public Ll/hgo;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hgo$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/svl;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/uho;

.field public d:Ll/zgo;

.field public e:Landroid/view/View;

.field public f:Ll/keo;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/svl;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z


# direct methods
.method public constructor <init>(Ll/uho;)V
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
    iput-object v0, p0, Ll/hgo;->g:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/hgo;->h:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/hgo;->c:Ll/uho;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Ll/hgo;Ll/cio;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hgo;->O(Ll/cio;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;)V

    return-void
.end method

.method public static synthetic F(Ll/hgo;Ll/cio;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hgo;->Q(Ll/cio;)V

    return-void
.end method

.method public static synthetic G(Ll/hgo;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hgo;->N(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/hgo;Ll/cio;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hgo;->P(Ll/cio;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/svl;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hgo;->I(Landroid/view/View;Ll/svl;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hgo;->g:Ljava/util/List;

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
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eq p2, v1, :cond_4

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    if-eq p2, p0, :cond_3

    .line 15
    .line 16
    const/4 p0, 0x3

    .line 17
    if-eq p2, p0, :cond_2

    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    if-eq p2, p0, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x5

    .line 23
    if-eq p2, p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p2, Ll/pec0;->D:I

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_0
    sget p0, Ll/pec0;->z:I

    .line 41
    .line 42
    invoke-virtual {v0, p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    sget p0, Ll/pec0;->t:I

    .line 48
    .line 49
    invoke-virtual {v0, p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_2
    sget p0, Ll/pec0;->u:I

    .line 55
    .line 56
    invoke-virtual {v0, p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget p2, Ll/pec0;->C:I

    .line 70
    .line 71
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_4
    new-instance p2, Ll/zgo;

    .line 77
    .line 78
    invoke-direct {p2}, Ll/zgo;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object p2, p0, Ll/hgo;->d:Ll/zgo;

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    sget v0, Ll/pec0;->B:I

    .line 92
    .line 93
    invoke-virtual {p2, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersView;

    .line 98
    .line 99
    iget-object p0, p0, Ll/hgo;->d:Ll/zgo;

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersView;->d(Ll/zgo;)V

    .line 102
    .line 103
    .line 104
    return-object p1
.end method

.method public I(Landroid/view/View;Ll/svl;II)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/4 p4, 0x1

    .line 5
    if-eq p3, p4, :cond_6

    .line 6
    .line 7
    const/4 p4, 0x2

    .line 8
    if-eq p3, p4, :cond_5

    .line 9
    .line 10
    const/4 p4, 0x3

    .line 11
    if-eq p3, p4, :cond_4

    .line 12
    .line 13
    const/4 p4, 0x4

    .line 14
    if-eq p3, p4, :cond_3

    .line 15
    .line 16
    const/4 p4, 0x5

    .line 17
    if-eq p3, p4, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Ll/hgo;->S(Landroid/view/View;Ll/svl;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Ll/hgo;->e:Landroid/view/View;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersAdmobItem;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersAdmobItem;->e(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void

    .line 33
    :cond_3
    move-object p2, p1

    .line 34
    check-cast p2, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;->k0()V

    .line 37
    .line 38
    .line 39
    new-instance p3, Ll/dgo;

    .line 40
    .line 41
    invoke-direct {p3, p0, p2}, Ll/dgo;-><init>(Ll/hgo;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_4
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;

    .line 49
    .line 50
    iget-object p0, p0, Ll/hgo;->c:Ll/uho;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;->n(Lcom/p1/mobile/android/app/Act;Ll/svl;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersTitleView;

    .line 61
    .line 62
    check-cast p2, Ll/zho;

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersTitleView;->b(Ll/zho;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_6
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersView;

    .line 69
    .line 70
    check-cast p2, Ll/aho;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersView;->e(Ll/aho;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public J(Ll/keo;ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hgo;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le p2, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p3, p0, Ll/hgo;->e:Landroid/view/View;

    .line 11
    .line 12
    iput-object p1, p0, Ll/hgo;->f:Ll/keo;

    .line 13
    .line 14
    iget-object p3, p0, Ll/hgo;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p3, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/yho;->f()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public K(I)Ll/svl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hgo;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/svl;

    .line 8
    .line 9
    return-object p0
.end method

.method public final L(Ll/cio;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Ll/yio;->a(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string v2, "superlike_tag"

    .line 30
    .line 31
    :cond_0
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ll/yio;->c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v3, v1, v2, v0}, Ll/yho;->p(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0, v1, v2, v2}, Ll/yho;->p(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    const-string v0, "see_feed"

    .line 59
    .line 60
    invoke-static {v0}, Ll/yho;->g(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/hgo;->c:Ll/uho;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    invoke-interface {v0, p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pl(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final M(Ll/cio;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hgo;->c:Ll/uho;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cio;->a()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0}, Ll/uho;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hgo;->c:Ll/uho;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeTurboItem;->l0(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic O(Ll/cio;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hgo;->L(Ll/cio;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Ll/cio;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/hgo;->M(Ll/cio;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic Q(Ll/cio;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/hgo;->M(Ll/cio;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public R()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hgo;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/hgo;->f:Ll/keo;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Ll/hgo;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, -0x1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eq v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Ll/hgo;->g:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    iput-object v2, p0, Ll/hgo;->e:Landroid/view/View;

    .line 30
    .line 31
    iput-object v2, p0, Ll/hgo;->f:Ll/keo;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iput-object v2, p0, Ll/hgo;->e:Landroid/view/View;

    .line 38
    .line 39
    iput-object v2, p0, Ll/hgo;->f:Ll/keo;

    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public final S(Landroid/view/View;Ll/svl;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;

    .line 2
    .line 3
    check-cast p2, Ll/cio;

    .line 4
    .line 5
    new-instance v0, Ll/ego;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2, p1}, Ll/ego;-><init>(Ll/hgo;Ll/cio;Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/fgo;

    .line 11
    .line 12
    invoke-direct {v1, p0, p2}, Ll/fgo;-><init>(Ll/hgo;Ll/cio;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/ggo;

    .line 16
    .line 17
    invoke-direct {v2, p0, p2}, Ll/ggo;-><init>(Ll/hgo;Ll/cio;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersItemView;->l(Ll/cio;Ll/x20;Ll/x20;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public T(Ljava/util/List;Z)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/svl;",
            ">;Z)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hgo;->h:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/hgo;->g:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eq v1, v2, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    :cond_0
    if-nez p2, :cond_2

    .line 18
    .line 19
    iget-object p2, p0, Ll/hgo;->g:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance p2, Ll/hgo$a;

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    iget-object v2, p0, Ll/hgo;->g:Ljava/util/List;

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p2, v1, p1}, Ll/hgo$a;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Landroidx/recyclerview/widget/g;->b(Landroidx/recyclerview/widget/g$b;)Landroidx/recyclerview/widget/g$e;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v1, p0, Ll/hgo;->g:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/hgo;->g:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/g$e;->b(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 55
    .line 56
    .line 57
    return v0

    .line 58
    :cond_2
    :goto_0
    iget-object p2, p0, Ll/hgo;->g:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Ll/hgo;->g:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 69
    .line 70
    .line 71
    return v0
.end method

.method public e(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/jic0;->e(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hgo;->g:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/hgo;->h:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/hgo;->g:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/lit8 v0, v0, -0x2

    .line 23
    .line 24
    if-ge p1, v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p0, Ll/hgo;->c:Ll/uho;

    .line 28
    .line 29
    iget-object p1, p1, Ll/uho;->c:Lcom/p1/mobile/putong/data/DbLinks;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Ll/hgo;->h:Z

    .line 45
    .line 46
    iget-object p0, p0, Ll/hgo;->c:Ll/uho;

    .line 47
    .line 48
    iget-object p1, p0, Ll/uho;->c:Lcom/p1/mobile/putong/data/DbLinks;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/uho;->O0(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hgo;->K(I)Ll/svl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hgo;->K(I)Ll/svl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Ll/zho;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    instance-of p1, p0, Ll/aho;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    instance-of p1, p0, Ll/leo;

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    const/4 p0, 0x4

    .line 22
    return p0

    .line 23
    :cond_2
    instance-of p1, p0, Ll/keo;

    .line 24
    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    const/4 p0, 0x5

    .line 28
    return p0

    .line 29
    :cond_3
    instance-of p0, p0, Ll/oeo;

    .line 30
    .line 31
    if-eqz p0, :cond_4

    .line 32
    .line 33
    const/4 p0, 0x3

    .line 34
    return p0

    .line 35
    :cond_4
    const/4 p0, 0x0

    .line 36
    return p0
.end method
