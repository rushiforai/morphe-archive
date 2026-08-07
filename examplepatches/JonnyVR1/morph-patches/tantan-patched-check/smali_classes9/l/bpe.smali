.class public Ll/bpe;
.super Ll/ep90;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public A:Lv/VImage;

.field public B:Landroidx/recyclerview/widget/RecyclerView;

.field public C:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ll/q320;

.field public E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;"
        }
    .end annotation
.end field

.field public F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation
.end field

.field public G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;"
        }
    .end annotation
.end field

.field public u:Landroid/widget/FrameLayout;

.field public v:Lv/VText;

.field public w:Lv/VImage;

.field public x:Lv/VText;

.field public y:Landroid/widget/FrameLayout;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/bpe;->C:Ljava/util/Map;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/bpe;->G:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic R(Ll/bpe;)Ll/q320;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bpe;->D:Ll/q320;

    return-object p0
.end method


# virtual methods
.method public S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cpe;->b(Ll/bpe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final T()V
    .locals 4

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/t3m;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/t3m;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/q320;

    .line 21
    .line 22
    iget-object v2, p0, Ll/bpe;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-direct {v1, v2, v3}, Ll/q320;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ll/t3m;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/bpe;->D:Ll/q320;

    .line 32
    .line 33
    iget-object v1, p0, Ll/bpe;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/bpe;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 39
    .line 40
    new-instance v1, Ll/bpe$a;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/bpe$a;-><init>(Ll/bpe;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/bpe;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 49
    .line 50
    iget-object p0, p0, Ll/bpe;->D:Ll/q320;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->k(Ljava/util/List;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/bpe;->E:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/bpe;->v:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/bpe;->x:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/bpe;->z:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/bpe;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    const/high16 p1, 0x41a00000    # 20.0f

    .line 24
    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public l()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H3()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Ljava/util/List;

    .line 18
    .line 19
    iput-object v1, p0, Ll/bpe;->E:Ljava/util/List;

    .line 20
    .line 21
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/util/List;

    .line 24
    .line 25
    iput-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Ll/bpe;->E:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    :cond_1
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_2
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bpe;->x:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const-string p1, "e_add_artwork_entrance"

    .line 8
    .line 9
    const-string v0, "p_edit_profile_view"

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->p3()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v0, p0, Ll/bpe;->A:Lv/VImage;

    .line 45
    .line 46
    if-ne p1, v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->p3()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object v0, p0, Ll/bpe;->w:Lv/VImage;

    .line 79
    .line 80
    if-ne p1, v0, :cond_4

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    const-string p1, "e_check_all_artwork_entrance"

    .line 93
    .line 94
    const-string v0, "p_suggest_user_profile_info_view"

    .line 95
    .line 96
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->p3()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    goto :goto_0

    .line 114
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->q3()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-interface {v2}, Ll/t3m;->from()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const-string v3, "0"

    .line 135
    .line 136
    filled-new-array {v0, v3, v2}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    :goto_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {p0, v1, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 167
    .line 168
    .line 169
    :cond_4
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/bpe;->S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/bpe;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bpe;->U()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/bpe;->x:Lv/VText;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    const-string v0, "e_add_artwork_entrance"

    .line 33
    .line 34
    const-string v3, "p_edit_profile_view"

    .line 35
    .line 36
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Ll/bpe;->x:Lv/VText;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Ll/bpe;->y:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-interface {v3}, Ll/t3m;->m0()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    iget-object v3, p0, Ll/bpe;->F:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    move v3, v1

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    move v3, v2

    .line 68
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/bpe;->A:Lv/VImage;

    .line 72
    .line 73
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/bpe;->E:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    const/4 v3, 0x3

    .line 83
    if-le v0, v3, :cond_2

    .line 84
    .line 85
    move v0, v1

    .line 86
    goto :goto_2

    .line 87
    :cond_2
    move v0, v2

    .line 88
    :goto_2
    iget-object v3, p0, Ll/bpe;->w:Lv/VImage;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-interface {v4}, Ll/t3m;->m0()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-nez v4, :cond_3

    .line 99
    .line 100
    if-nez v0, :cond_5

    .line 101
    .line 102
    :cond_3
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-interface {v4}, Ll/t3m;->m0()Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_4

    .line 111
    .line 112
    iget-object v4, p0, Ll/bpe;->F:Ljava/util/List;

    .line 113
    .line 114
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-nez v4, :cond_4

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_4
    move v1, v2

    .line 122
    :cond_5
    :goto_3
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-nez v1, :cond_6

    .line 134
    .line 135
    if-eqz v0, :cond_6

    .line 136
    .line 137
    const-string v0, "e_check_all_artwork_entrance"

    .line 138
    .line 139
    const-string v1, "p_suggest_user_profile_info_view"

    .line 140
    .line 141
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_6
    iget-object v0, p0, Ll/bpe;->G:Ljava/util/List;

    .line 145
    .line 146
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_8

    .line 151
    .line 152
    iget-object v0, p0, Ll/bpe;->F:Ljava/util/List;

    .line 153
    .line 154
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_7

    .line 159
    .line 160
    new-instance v0, Ljava/util/ArrayList;

    .line 161
    .line 162
    iget-object v1, p0, Ll/bpe;->E:Ljava/util/List;

    .line 163
    .line 164
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 165
    .line 166
    .line 167
    iput-object v0, p0, Ll/bpe;->G:Ljava/util/List;

    .line 168
    .line 169
    goto :goto_4

    .line 170
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .line 174
    .line 175
    iput-object v0, p0, Ll/bpe;->G:Ljava/util/List;

    .line 176
    .line 177
    :cond_8
    :goto_4
    iget-object v0, p0, Ll/bpe;->D:Ll/q320;

    .line 178
    .line 179
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_9

    .line 184
    .line 185
    iget-object v0, p0, Ll/bpe;->D:Ll/q320;

    .line 186
    .line 187
    iget-object v1, p0, Ll/bpe;->G:Ljava/util/List;

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Ll/q320;->J(Ljava/util/List;)V

    .line 190
    .line 191
    .line 192
    :cond_9
    iget-object v0, p0, Ll/bpe;->D:Ll/q320;

    .line 193
    .line 194
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 203
    .line 204
    iget-object v3, p0, Ll/bpe;->E:Ljava/util/List;

    .line 205
    .line 206
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    const/16 v5, 0xa

    .line 211
    .line 212
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    invoke-interface {v3, v2, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    iget-object v4, p0, Ll/bpe;->F:Ljava/util/List;

    .line 221
    .line 222
    iget-object v5, p0, Ll/bpe;->C:Ljava/util/Map;

    .line 223
    .line 224
    invoke-virtual {v0, v1, v3, v4, v5}, Ll/q320;->K(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Ll/bpe;->v:Lv/VText;

    .line 228
    .line 229
    iget-object v1, p0, Ll/bpe;->F:Ljava/util/List;

    .line 230
    .line 231
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-eqz v1, :cond_a

    .line 236
    .line 237
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {v1}, Ll/aw90;->H()Ljava/util/List;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-eqz v1, :cond_a

    .line 250
    .line 251
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-interface {v1}, Ll/t3m;->m0()Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_a

    .line 260
    .line 261
    invoke-static {}, Ll/gra;->p()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 266
    .line 267
    iget v2, v1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 268
    .line 269
    :cond_a
    const-string v1, "\u6211\u7684\u4e66\u5f71\u5267"

    .line 270
    .line 271
    invoke-virtual {p0, v0, v1, v2}, Ll/ep90;->P(Landroid/widget/TextView;Ljava/lang/String;I)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Ll/bpe;->x:Lv/VText;

    .line 275
    .line 276
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Ll/bpe;->A:Lv/VImage;

    .line 280
    .line 281
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Ll/bpe;->w:Lv/VImage;

    .line 285
    .line 286
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 287
    .line 288
    .line 289
    return-void
.end method
