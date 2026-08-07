.class public Ll/h0g;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h0g$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/h0g$a;

.field public e:Ll/m1g;

.field public f:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

.field public g:I

.field public h:Ljava/lang/String;

.field public final i:J

.field public j:Z

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/data/User;

.field public m:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;)V
    .locals 2

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
    iput-object v0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/h0g;->g:I

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    iput-object v0, p0, Ll/h0g;->h:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/h0g;->m:I

    .line 20
    .line 21
    iput-object p1, p0, Ll/h0g;->f:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->Q4()Ll/m1g;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/h0g;->e:Ll/m1g;

    .line 28
    .line 29
    iget-wide v0, p1, Ll/m1g;->i:J

    .line 30
    .line 31
    iput-wide v0, p0, Ll/h0g;->i:J

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic E(Ll/h0g;Landroid/view/View;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/h0g;->S(Landroid/view/View;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C5(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "instant_chat"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "see"

    .line 15
    .line 16
    :goto_0
    const-string p2, "see_card_source"

    .line 17
    .line 18
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p2, "e_see_who_likes_me_like"

    .line 27
    .line 28
    const-string v0, "p_see_who_likes_me_view"

    .line 29
    .line 30
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic G(Ll/h0g;Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/h0g;->Q(Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/h0g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h0g;->T()V

    return-void
.end method

.method public static synthetic I(Ll/h0g;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h0g;->R(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private synthetic T()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m1g;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/h0g;->J(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Ll/h0g;->P()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    return v0

    .line 39
    :cond_2
    :goto_0
    invoke-static {}, Ll/rs9;->h()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    iput v1, p0, Ll/h0g;->m:I

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    const/4 v1, 0x1

    .line 50
    iput v1, p0, Ll/h0g;->m:I

    .line 51
    .line 52
    :goto_1
    iget p0, p0, Ll/h0g;->m:I

    .line 53
    .line 54
    add-int/2addr v0, p0

    .line 55
    return v0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p2, Ll/pec0;->c1:I

    .line 16
    .line 17
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 v0, 0x3

    .line 23
    if-ne p2, v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p2, Ll/pec0;->m:I

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    const/4 v0, 0x6

    .line 41
    if-ne p2, v0, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget p2, Ll/pec0;->f0:I

    .line 54
    .line 55
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    const/4 p0, 0x4

    .line 61
    if-ne p2, p0, :cond_3

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget p2, Ll/pec0;->l:I

    .line 72
    .line 73
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_3
    const/4 p0, 0x5

    .line 79
    if-ne p2, p0, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget p2, Ll/pec0;->p:I

    .line 90
    .line 91
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget p2, Ll/pec0;->i:I

    .line 105
    .line 106
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p3, v0, :cond_1

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 5
    .line 6
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 7
    .line 8
    iget-object p0, p0, Ll/m1g;->b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 9
    .line 10
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;->PICKS:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 11
    .line 12
    if-ne p0, p2, :cond_0

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->n()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->EXPAND:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->HIDE:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->b(Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/4 v0, 0x5

    .line 36
    if-ne p3, v0, :cond_3

    .line 37
    .line 38
    iget-object p0, p0, Ll/h0g;->k:Landroid/view/View;

    .line 39
    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    check-cast p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlLikersAdmobItem;

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlLikersAdmobItem;->e(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;

    .line 50
    .line 51
    if-eqz p3, :cond_4

    .line 52
    .line 53
    move-object p3, p1

    .line 54
    check-cast p3, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;

    .line 55
    .line 56
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->l(Lcom/p1/mobile/putong/data/User;)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ll/c0g;

    .line 60
    .line 61
    invoke-direct {v0, p0, p2, p4}, Ll/c0g;-><init>(Ll/h0g;Lcom/p1/mobile/putong/data/User;I)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->m:Lv/VImage;

    .line 68
    .line 69
    new-instance p3, Ll/d0g;

    .line 70
    .line 71
    invoke-direct {p3, p2, p1}, Ll/d0g;-><init>(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    instance-of p3, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;

    .line 79
    .line 80
    if-eqz p3, :cond_5

    .line 81
    .line 82
    move-object p3, p1

    .line 83
    check-cast p3, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;

    .line 84
    .line 85
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 86
    .line 87
    .line 88
    new-instance p3, Ll/e0g;

    .line 89
    .line 90
    invoke-direct {p3, p0, p2}, Ll/e0g;-><init>(Ll/h0g;Lcom/p1/mobile/putong/data/User;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_5
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 98
    .line 99
    if-eqz p2, :cond_7

    .line 100
    .line 101
    iget-boolean p2, p0, Ll/h0g;->j:Z

    .line 102
    .line 103
    if-eqz p2, :cond_6

    .line 104
    .line 105
    const/4 p2, 0x1

    .line 106
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    :cond_6
    move-object p2, p1

    .line 110
    check-cast p2, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 111
    .line 112
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;->k0(I)V

    .line 113
    .line 114
    .line 115
    new-instance p2, Ll/f0g;

    .line 116
    .line 117
    invoke-direct {p2, p0, p1, p4}, Ll/f0g;-><init>(Ll/h0g;Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_7
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;

    .line 125
    .line 126
    if-eqz p2, :cond_8

    .line 127
    .line 128
    check-cast p1, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;

    .line 129
    .line 130
    new-instance p2, Ll/g0g;

    .line 131
    .line 132
    invoke-direct {p2, p0}, Ll/g0g;-><init>(Ll/h0g;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->z(Ll/x20;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/m1g;->x0()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/LikersFilterItemView;->setSeeCount(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_8
    :goto_1
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p2, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p3, p0, Ll/h0g;->k:Landroid/view/View;

    .line 11
    .line 12
    iput-object p1, p0, Ll/h0g;->l:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object p3, p0, Ll/h0g;->c:Ljava/util/List;

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
    return-void
.end method

.method public L(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h0g;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 6
    .line 7
    iget-object v1, p0, Ll/h0g;->l:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/h0g;->l:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iput-object v0, p0, Ll/h0g;->k:Landroid/view/View;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public M(I)Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/h0g;->O(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget v0, p0, Ll/h0g;->m:I

    .line 24
    .line 25
    if-ge p1, v0, :cond_1

    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_1
    iget-object p0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 29
    .line 30
    sub-int/2addr p1, v0

    .line 31
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    iget-object p0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    return-object p0
.end method

.method public final N(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string p1, "intlSeeListAd"

    .line 28
    .line 29
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v1
.end method

.method public final O(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/h0g;->P()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ne p1, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final P()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h0g;->e:Ll/m1g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/m1g;->P0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/h0g;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x4

    .line 16
    if-ge p0, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/h0g;->d:Ll/h0g$a;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/h0g;->d:Ll/h0g$a;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/h0g$a;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/h0g;->d:Ll/h0g$a;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/h0g;->d:Ll/h0g$a;

    .line 10
    .line 11
    const/4 p2, -0x1

    .line 12
    invoke-interface {p0, p1, p2}, Ll/h0g$a;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic S(Landroid/view/View;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeTurboItem;->n0(ILcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public U(Ll/h0g$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h0g;->d:Ll/h0g$a;

    .line 2
    .line 3
    return-void
.end method

.method public V(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h0g;->c:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/h0g;->j:Z

    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h0g;->M(I)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/h0g;->O(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x4

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Ll/h0g;->N(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x5

    .line 16
    return p0

    .line 17
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    const/4 p0, 0x2

    .line 34
    return p0

    .line 35
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x1

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    invoke-static {}, Ll/rs9;->h()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    if-ne p1, v1, :cond_3

    .line 57
    .line 58
    const/4 p0, 0x6

    .line 59
    return p0

    .line 60
    :cond_3
    iget-object p0, p0, Ll/h0g;->e:Ll/m1g;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/m1g;->P0()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    const/4 p0, 0x3

    .line 69
    return p0

    .line 70
    :cond_4
    return v1
.end method
