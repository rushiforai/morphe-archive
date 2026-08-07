.class public Ll/uew;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/pdw;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VRecyclerView;

.field public d:Ll/pdw;

.field public e:Lcom/p1/mobile/putong/core/newui/loveletter/a;

.field public f:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;

.field public g:Lv/VIcon;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/uew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uew;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/uew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uew;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/uew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uew;->j(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/uew;)Lcom/p1/mobile/putong/core/newui/loveletter/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uew;->e:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/uew;)Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uew;->c:Lv/VRecyclerView;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/uew;)Lv/VIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uew;->g:Lv/VIcon;

    return-object p0
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_explain"

    .line 2
    .line 3
    const-string v0, "p_love_letter"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/uew;->q()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Ll/pdw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uew;->d:Ll/pdw;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pdw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uew;->i(Ll/pdw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    sget v0, Ll/kec0;->x6:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->N8:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    iput-object p2, p0, Ll/uew;->b:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    sget p2, Ll/adc0;->qb:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lv/VRecyclerView;

    .line 25
    .line 26
    iput-object p2, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 27
    .line 28
    sget p2, Ll/adc0;->p4:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;

    .line 35
    .line 36
    iput-object p2, p0, Ll/uew;->f:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;

    .line 37
    .line 38
    iget-object p2, p0, Ll/uew;->b:Lv/navigationbar/VNavigationBar;

    .line 39
    .line 40
    new-instance v0, Ll/rew;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/rew;-><init>(Ll/uew;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/uew;->b:Lv/navigationbar/VNavigationBar;

    .line 49
    .line 50
    sget v0, Ll/c9c0;->V1:I

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Lv/VIcon;

    .line 56
    .line 57
    iget-object v0, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 58
    .line 59
    invoke-direct {p2, v0}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    const/4 v0, 0x4

    .line 63
    invoke-virtual {p2, v0}, Lv/VIcon;->setIconStyle(I)V

    .line 64
    .line 65
    .line 66
    sget v2, Ll/dbc0;->Gd:I

    .line 67
    .line 68
    invoke-virtual {p2, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Ll/sew;

    .line 72
    .line 73
    invoke-direct {v2, p0}, Ll/sew;-><init>(Ll/uew;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p2, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Lv/VIcon;

    .line 80
    .line 81
    iget-object v3, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 82
    .line 83
    invoke-direct {v2, v3}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    iput-object v2, p0, Ll/uew;->g:Lv/VIcon;

    .line 87
    .line 88
    invoke-virtual {v2, v0}, Lv/VIcon;->setIconStyle(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/uew;->g:Lv/VIcon;

    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/uew;->g:Lv/VIcon;

    .line 97
    .line 98
    sget v2, Ll/dbc0;->Hd:I

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/uew;->g:Lv/VIcon;

    .line 104
    .line 105
    new-instance v2, Ll/tew;

    .line 106
    .line 107
    invoke-direct {v2, p0}, Ll/tew;-><init>(Ll/uew;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/uew;->b:Lv/navigationbar/VNavigationBar;

    .line 114
    .line 115
    iget-object v2, p0, Ll/uew;->g:Lv/VIcon;

    .line 116
    .line 117
    const/4 v3, 0x2

    .line 118
    new-array v3, v3, [Landroid/view/View;

    .line 119
    .line 120
    aput-object v2, v3, v1

    .line 121
    .line 122
    const/4 v1, 0x1

    .line 123
    aput-object p2, v3, v1

    .line 124
    .line 125
    invoke-virtual {v0, v3}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    iget-object p2, p0, Ll/uew;->b:Lv/navigationbar/VNavigationBar;

    .line 129
    .line 130
    invoke-static {}, Ll/bnl0;->F0()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-static {p2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/uew;->p()V

    .line 138
    .line 139
    .line 140
    return-object p1
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uew;->d:Ll/pdw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pdw;->F()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uew;->f:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/uew;->g:Lv/VIcon;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/uew;->f:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;

    .line 19
    .line 20
    iget-object p0, p0, Ll/uew;->d:Ll/pdw;

    .line 21
    .line 22
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;->b(Ll/pdw;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public n(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uew;->e:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->S(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uew;->f:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    iget-object v1, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/uew$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/uew$a;-><init>(Ll/uew;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 35
    .line 36
    iget-object v1, p0, Ll/uew;->d:Ll/pdw;

    .line 37
    .line 38
    iget-object v2, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 39
    .line 40
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/loveletter/a;-><init>(Ll/few;Lv/VRecyclerView;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/uew;->e:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 44
    .line 45
    iget-object v1, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/uew;->c:Lv/VRecyclerView;

    .line 51
    .line 52
    new-instance v1, Ll/uew$b;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/uew$b;-><init>(Ll/uew;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    new-instance v0, Ll/ycw;

    .line 2
    .line 3
    iget-object v1, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ycw;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/uew;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 9
    .line 10
    iget-object p0, p0, Ll/uew;->d:Ll/pdw;

    .line 11
    .line 12
    iget-object p0, p0, Ll/pdw;->d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Ll/ycw;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
