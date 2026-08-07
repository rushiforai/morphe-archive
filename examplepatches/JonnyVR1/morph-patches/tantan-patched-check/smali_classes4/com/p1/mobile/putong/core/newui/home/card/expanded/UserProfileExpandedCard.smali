.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;
.super Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ll/zsl;

.field public D:Ll/qmj0;

.field public w:Ll/fmf;

.field public x:Ll/ik4;

.field public y:Lcom/p1/mobile/putong/data/User;

.field public z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->A:I

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->C:Ll/zsl;

    .line 11
    .line 12
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

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    const/4 p2, -0x1

    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->A:I

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->C:Ll/zsl;

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

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    const/4 p2, -0x1

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->A:I

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->C:Ll/zsl;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard$a;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/fmf;->n(Ll/jm50;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setAdapter(Ll/gmf;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->p1(Lcom/p1/mobile/putong/data/User;I)V

    return-void
.end method

.method public static bridge synthetic n1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;)Ll/qmj0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->D:Ll/qmj0;

    return-object p0
.end method


# virtual methods
.method public A0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/tql;->A0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fmf;->k()Ll/pzk;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fmf;->k()Ll/pzk;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public I()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 8

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    if-ne v0, p1, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    if-ne v0, p2, :cond_0

    .line 39
    .line 40
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->A:I

    .line 41
    .line 42
    if-ne v0, p3, :cond_0

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->setRenderUser(Lcom/p1/mobile/putong/data/User;)V

    .line 50
    .line 51
    .line 52
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->A:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    invoke-virtual {v0, v1, p1, p3}, Ll/fmf;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 59
    .line 60
    .line 61
    iget-object v3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 64
    .line 65
    new-instance v7, Ll/wgk0;

    .line 66
    .line 67
    invoke-direct {v7, p0, p1, p3}, Ll/wgk0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;Lcom/p1/mobile/putong/data/User;I)V

    .line 68
    .line 69
    .line 70
    move-object v2, p0

    .line 71
    move-object v4, p1

    .line 72
    move v6, p3

    .line 73
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->l1(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILjava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public Y()Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fmf;->k()Ll/pzk;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fmf;->k()Ll/pzk;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/pzk;->j0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public getCardData()Ll/ik4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->getCardDataProxy()Ll/ik4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getCardDataProxy()Ll/ik4;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/ik4;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/ik4;->j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput-boolean v1, v0, Ll/ik4$a;->e:Z

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getRendingList()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a()Ll/dmf;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    instance-of v3, v3, Ll/pzk;

    .line 77
    .line 78
    if-eqz v3, :cond_1

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a()Ll/dmf;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ll/pzk;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    const/4 v1, 0x0

    .line 88
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-eqz v2, :cond_3

    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 95
    .line 96
    invoke-virtual {v2}, Ll/ik4;->b()Ll/ik4$a;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-interface {v1}, Ll/aof;->b()Lrx/subjects/a;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    iput-object v3, v2, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 105
    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 107
    .line 108
    invoke-virtual {v2}, Ll/ik4;->b()Ll/ik4$a;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v1}, Ll/aof;->c()Lrx/subjects/a;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    iput-object v3, v2, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 117
    .line 118
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 119
    .line 120
    invoke-virtual {v2}, Ll/ik4;->b()Ll/ik4$a;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-interface {v1}, Ll/aof;->d()Lcom/p1/mobile/putong/data/Media;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iput-object v1, v2, Ll/ik4$a;->d:Lcom/p1/mobile/putong/data/Media;

    .line 129
    .line 130
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-nez v2, :cond_6

    .line 140
    .line 141
    const/4 v2, 0x0

    .line 142
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getLatestRenderIndex()I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-gt v2, v3, :cond_5

    .line 147
    .line 148
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 153
    .line 154
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getType()I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->createType(I)Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    if-nez v3, :cond_4

    .line 163
    .line 164
    const-string v3, "unknown"

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_4
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getAlias()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    :goto_2
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    add-int/lit8 v2, v2, 0x1

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 178
    .line 179
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iput-object v1, v0, Ll/ik4$a;->f:Ljava/util/List;

    .line 184
    .line 185
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y:Lcom/p1/mobile/putong/data/User;

    .line 186
    .line 187
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_7

    .line 192
    .line 193
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 194
    .line 195
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y:Lcom/p1/mobile/putong/data/User;

    .line 200
    .line 201
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 202
    .line 203
    iput-object v1, v0, Ll/ik4$a;->c:Ljava/util/List;

    .line 204
    .line 205
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->x:Ll/ik4;

    .line 206
    .line 207
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

.method public getGuidePictureView()Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fmf;->k()Ll/pzk;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fmf;->k()Ll/pzk;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserProxy()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->y:Lcom/p1/mobile/putong/data/User;

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

.method public k(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/tql;->k(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->I0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o1(Ll/zsl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->C:Ll/zsl;

    .line 2
    .line 3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->Q0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p1(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->w:Ll/fmf;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->z:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ll/fmf;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getRendingList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->b()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 32
    .line 33
    if-ne v1, v2, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a()Ll/dmf;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    instance-of v1, v1, Ll/f6l;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a()Ll/dmf;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/f6l;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/f6l;->y()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    return-void
.end method

.method public r1(F)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getRendingList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->b()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 32
    .line 33
    if-ne v1, v2, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a()Ll/dmf;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    instance-of v1, v1, Ll/f6l;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a()Ll/dmf;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/f6l;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ll/f6l;->z(F)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public bridge synthetic setExpandedScrollListener(Ll/atl;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q7m;->setExpandedScrollListener(Ll/atl;)V

    return-void
.end method

.method public setTwoFingerHelper(Ll/qmj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->D:Ll/qmj0;

    .line 2
    .line 3
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

.method public y()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method
