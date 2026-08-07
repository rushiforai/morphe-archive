.class public Ll/fmf;
.super Ll/gmf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gmf<",
        "Ll/f6l;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Landroid/content/Context;

.field public e:Lcom/p1/mobile/putong/data/User;

.field public f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public g:I

.field public h:Ll/jm50;

.field public i:Ll/pzk;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gmf;-><init>()V

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
    iput-object v0, p0, Ll/fmf;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/fmf;->d:Landroid/content/Context;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/dmf;II)V
    .locals 0

    .line 1
    check-cast p1, Ll/f6l;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/fmf;->i(Ll/f6l;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Landroid/view/ViewGroup;I)Ll/dmf;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fmf;->j(Landroid/view/ViewGroup;I)Ll/f6l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fmf;->c:Ljava/util/List;

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

.method public e(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fmf;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/pf60;

    .line 8
    .line 9
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getType()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fmf;->f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/fmf;->f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public i(Ll/f6l;II)V
    .locals 7

    .line 1
    iget-object p3, p0, Ll/fmf;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Ll/pf60;

    .line 8
    .line 9
    iget-object v0, p0, Ll/fmf;->h:Ll/jm50;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/f6l;->C(Ll/jm50;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ll/fmf;->f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 15
    .line 16
    iget-object v3, p0, Ll/fmf;->e:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget v4, p0, Ll/fmf;->g:I

    .line 19
    .line 20
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p3, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    move-object v1, p1

    .line 29
    move v5, p2

    .line 30
    invoke-virtual/range {v1 .. v6}, Ll/f6l;->B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V

    .line 31
    .line 32
    .line 33
    instance-of p1, v1, Ll/pzk;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    move-object p1, v1

    .line 38
    check-cast p1, Ll/pzk;

    .line 39
    .line 40
    iput-object p1, p0, Ll/fmf;->i:Ll/pzk;

    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public j(Landroid/view/ViewGroup;I)Ll/f6l;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->createType(I)Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p0, p0, Ll/fmf;->d:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->createHolder(Landroid/content/Context;Landroid/view/ViewGroup;)Ll/f6l;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k()Ll/pzk;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fmf;->i:Ll/pzk;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->Y1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-eqz p0, :cond_6

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_6

    .line 13
    .line 14
    invoke-static {}, Ll/gra;->G2()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    iget-boolean p0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowFakePhotoFeedback:Z

    .line 21
    .line 22
    if-nez p0, :cond_6

    .line 23
    .line 24
    :cond_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_6

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isMomentInfoCard()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getIdealList()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_5

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-ge v1, v2, :cond_5

    .line 65
    .line 66
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 73
    .line 74
    iget-boolean v3, v2, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 75
    .line 76
    if-eqz v3, :cond_3

    .line 77
    .line 78
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-nez v3, :cond_3

    .line 85
    .line 86
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_3

    .line 97
    .line 98
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lcom/p1/mobile/putong/data/IdealTag;

    .line 103
    .line 104
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IdealTag;->id:Ljava/lang/String;

    .line 105
    .line 106
    invoke-interface {p0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-eqz v3, :cond_2

    .line 111
    .line 112
    move v0, v1

    .line 113
    :cond_3
    if-lez v0, :cond_4

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_5
    :goto_1
    iput v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->autoAvatarIndex:I

    .line 120
    .line 121
    return-void

    .line 122
    :cond_6
    :goto_2
    iput v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->autoAvatarIndex:I

    .line 123
    .line 124
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/fmf;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p1, p0, Ll/fmf;->f:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iput p3, p0, Ll/fmf;->g:I

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/fmf;->l(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 8
    .line 9
    .line 10
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Ll/gmf;->h(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p3, p0, Ll/fmf;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object p3, p0, Ll/fmf;->d:Landroid/content/Context;

    .line 21
    .line 22
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-static {p3, p2, p1}, Ll/vmf;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/fmf;->c:Ljava/util/List;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/gmf;->g()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public n(Ll/jm50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fmf;->h:Ll/jm50;

    .line 2
    .line 3
    return-void
.end method
