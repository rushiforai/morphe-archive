.class public Ll/oaf;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear;

.field public v:Landroid/view/View;

.field public w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/oaf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oaf;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/oaf;Ljava/util/List;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oaf;->X(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    return-void
.end method

.method public static synthetic U(Ll/oaf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oaf;->W(Landroid/view/View;)V

    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_add_artwork_entrance"

    .line 2
    .line 3
    const-string v0, "p_edit_profile_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->q3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Ll/t3m;->from()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "0"

    .line 29
    .line 30
    filled-new-array {v0, v2, v1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v1, ""

    .line 57
    .line 58
    invoke-static {p0, v1, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_add_artwork_entrance"

    .line 2
    .line 3
    const-string v0, "p_edit_profile_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, ""

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->p3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public final synthetic X(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/oaf;->z()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u4e66\u5f71"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "book"

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/kec0;->p2:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v0, Ll/adc0;->O1:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VLinear;

    .line 23
    .line 24
    iput-object v0, p0, Ll/oaf;->u:Lv/VLinear;

    .line 25
    .line 26
    sget v0, Ll/adc0;->r:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/oaf;->v:Landroid/view/View;

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/oaf;->w:Ljava/util/List;

    .line 40
    .line 41
    sget v1, Ll/adc0;->z8:I

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/oaf;->w:Ljava/util/List;

    .line 53
    .line 54
    sget v1, Ll/adc0;->A8:I

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;

    .line 61
    .line 62
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/oaf;->w:Ljava/util/List;

    .line 66
    .line 67
    sget v0, Ll/adc0;->B8:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;

    .line 74
    .line 75
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    return-object p1
.end method

.method public z()V
    .locals 14

    .line 1
    new-instance v0, Ll/laf;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/laf;-><init>(Ll/oaf;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->D(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/oaf;->v:Landroid/view/View;

    .line 10
    .line 11
    new-instance v1, Ll/maf;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/maf;-><init>(Ll/oaf;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->C(Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/oaf;->u:Lv/VLinear;

    .line 44
    .line 45
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 v1, 0x1

    .line 50
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->C(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Ll/oaf;->u:Lv/VLinear;

    .line 54
    .line 55
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    move v12, v2

    .line 59
    :goto_0
    iget-object v3, p0, Ll/oaf;->w:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-ge v12, v3, :cond_2

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-ge v12, v3, :cond_1

    .line 72
    .line 73
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    move-object v11, v3

    .line 78
    check-cast v11, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 79
    .line 80
    iget-object v3, p0, Ll/oaf;->w:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Landroid/view/View;

    .line 87
    .line 88
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Ll/oaf;->w:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    move-object v4, v3

    .line 98
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-interface {v3}, Ll/nol;->act()Landroid/app/Activity;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    move-object v5, v3

    .line 109
    check-cast v5, Ll/ner;

    .line 110
    .line 111
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 114
    .line 115
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget-object v6, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v10, v11, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 122
    .line 123
    new-instance v13, Ll/naf;

    .line 124
    .line 125
    invoke-direct {v13, p0, v0}, Ll/naf;-><init>(Ll/oaf;Ljava/util/List;)V

    .line 126
    .line 127
    .line 128
    const/4 v7, 0x1

    .line 129
    const/4 v8, 0x1

    .line 130
    const-string v9, ""

    .line 131
    .line 132
    invoke-virtual/range {v4 .. v13}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->e(Ll/ner;Ljava/lang/String;ZZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;ILl/y20;)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    iget-object v3, p0, Ll/oaf;->w:Ljava/util/List;

    .line 137
    .line 138
    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    check-cast v3, Landroid/view/View;

    .line 143
    .line 144
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    :goto_1
    add-int/lit8 v12, v12, 0x1

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_2
    return-void
.end method
