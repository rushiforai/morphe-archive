.class public Ll/ble;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VLinear;

.field public w:Lv/VText_NoTopPadding;

.field public x:Lv/VImage;

.field public y:Lv/VRecyclerView;

.field public z:Lv/VLinear;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/ble;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ble;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/ble;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ble;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/ble;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ble;->Y(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cle;->b(Ll/ble;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final V()V
    .locals 4

    .line 1
    const-string v0, "e_add_artwork_entrance"

    .line 2
    .line 3
    const-string v1, "p_edit_profile_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/api/p;->q3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Ll/s7m;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Ll/t3m;->from()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "0"

    .line 29
    .line 30
    filled-new-array {v1, v3, v2}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    const-string v2, ""

    .line 57
    .line 58
    invoke-static {p0, v2, v0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ble;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ble;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
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
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
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
    invoke-virtual {p0, v0, p1}, Ll/ble;->U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/ble;->y:Lv/VRecyclerView;

    .line 16
    .line 17
    new-instance v2, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-interface {v3}, Ll/nol;->act()Landroid/app/Activity;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const/4 v4, 0x2

    .line 28
    invoke-direct {v2, v3, v4}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/ble;->y:Lv/VRecyclerView;

    .line 35
    .line 36
    new-instance v2, Ll/e63;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {v3}, Ll/nol;->act()Landroid/app/Activity;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    const/4 v4, 0x4

    .line 49
    invoke-static {v0, v4}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    const/4 v5, 0x1

    .line 54
    invoke-direct {v2, v3, v5, v4}, Ll/e63;-><init>(Lcom/p1/mobile/android/app/Act;ZLjava/util/List;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/xra;->w()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_1

    .line 65
    .line 66
    iget-object v1, p0, Ll/ble;->w:Lv/VText_NoTopPadding;

    .line 67
    .line 68
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_0

    .line 73
    .line 74
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ll/aw90;->H()Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_0

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-interface {v2}, Ll/t3m;->m0()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_0

    .line 97
    .line 98
    invoke-static {}, Ll/gra;->p()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 103
    .line 104
    iget v2, v2, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    const/4 v2, 0x0

    .line 108
    :goto_0
    const-string v3, "\u6211\u7684\u4e66\u5f71\u5267"

    .line 109
    .line 110
    invoke-virtual {p0, v1, v3, v2}, Ll/ep90;->P(Landroid/widget/TextView;Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object v1, p0, Ll/ble;->w:Lv/VText_NoTopPadding;

    .line 114
    .line 115
    new-instance v2, Ll/yke;

    .line 116
    .line 117
    invoke-direct {v2, p0}, Ll/yke;-><init>(Ll/ble;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/ble;->x:Lv/VImage;

    .line 124
    .line 125
    new-instance v2, Ll/zke;

    .line 126
    .line 127
    invoke-direct {v2, p0}, Ll/zke;-><init>(Ll/ble;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/ble;->z:Lv/VLinear;

    .line 134
    .line 135
    new-instance v2, Ll/ale;

    .line 136
    .line 137
    invoke-direct {v2, p0}, Ll/ale;-><init>(Ll/ble;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/ble;->x:Lv/VImage;

    .line 144
    .line 145
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    xor-int/2addr v0, v5

    .line 150
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    return-void
.end method
