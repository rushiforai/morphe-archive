.class public Ll/xwa0;
.super Ll/rwa0;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/data/UserTagsData;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public x:Lv/VFrame;

.field public y:Z

.field public z:Z


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
    invoke-direct {p0, p1, p2}, Ll/rwa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/xwa0;->y:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/xwa0;->z:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic X(Ll/xwa0;Lcom/p1/mobile/putong/core/data/UserTagsData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xwa0;->h0(Lcom/p1/mobile/putong/core/data/UserTagsData;)V

    return-void
.end method

.method public static synthetic Y(Ll/xwa0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xwa0;->f0()V

    return-void
.end method

.method public static synthetic Z(Ll/xwa0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xwa0;->g0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a0(Ll/xwa0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xwa0;->i0()V

    return-void
.end method

.method public static synthetic b0(Ll/xwa0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xwa0;->e0(Ll/uxj0;)V

    return-void
.end method

.method private synthetic f0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xwa0;->v:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xwa0;->v:Lv/VText;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public T(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/rwa0;->T(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->highlighted:Z

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/dbc0;->An:I

    .line 28
    .line 29
    invoke-static {p0, p1, p2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Ll/t3m;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget p2, Ll/dbc0;->zn:I

    .line 42
    .line 43
    invoke-static {p0, p1, p2}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    return-object p1
.end method

.method public c0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ywa0;->b(Ll/xwa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d0(Lcom/p1/mobile/putong/core/data/UserTagsData;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xwa0;->v:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setMaxLines(I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 13
    .line 14
    new-instance v0, Ll/vwa0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/vwa0;-><init>(Ll/xwa0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setCallBack(Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->f:Z

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/rwa0;->U(Lcom/p1/mobile/putong/core/data/UserTagsData;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic e0(Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2}, Ll/t3m;->N2()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {p1, v0, v1, v2}, Ll/gj40;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Ll/xwa0;->z:Z

    .line 52
    .line 53
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->clickable:Z

    .line 54
    .line 55
    iput-boolean v0, p0, Ll/xwa0;->y:Z

    .line 56
    .line 57
    const/4 v0, 0x3

    .line 58
    invoke-virtual {p0, p1, v0}, Ll/xwa0;->d0(Lcom/p1/mobile/putong/core/data/UserTagsData;I)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 63
    iput-boolean p1, p0, Ll/xwa0;->z:Z

    .line 64
    .line 65
    :goto_1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2}, Ll/rwa0;->V(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ll/t3m;->N2()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/16 v1, 0xbb9

    .line 26
    .line 27
    invoke-virtual {p2, v0, v1, p1, p0}, Ll/gj40;->G(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/putong/data/User;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/core/data/UserTagsData;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ge v0, v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    invoke-virtual {p0, p1, v1, v2}, Ll/rwa0;->W(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;Z)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-void
.end method

.method public final i0()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "bubble_new_tag_click_guide"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    const/high16 v2, 0x40e00000    # 7.0f

    .line 39
    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/high16 v3, 0x41200000    # 10.0f

    .line 49
    .line 50
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v2, v4, v5, v6, v3}, Lcom/p1/mobile/android/ui/bubble/a;->H(IIII)Lcom/p1/mobile/android/ui/bubble/a;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    sget v3, Ll/c9c0;->e:I

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const v3, -0x181e3

    .line 77
    .line 78
    .line 79
    filled-new-array {v3}, [I

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const/16 v3, 0x4b

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const/high16 v3, 0x41500000    # 13.0f

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    const-wide/16 v3, 0xbb8

    .line 100
    .line 101
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-interface {v3}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-eqz v3, :cond_1

    .line 118
    .line 119
    const-string v3, "\u5979"

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    const-string v3, "\u4ed6"

    .line 123
    .line 124
    :goto_0
    const-string v4, "\u70b9\u51fb\u770b\u770b\u8fd8\u6709\u8c01\u6dfb\u52a0\u4e86\u8fd9\u4e2a\u6807\u7b7e\uff0c\n\u9047\u89c1\u6709\u5171\u9e23\u7684"

    .line 125
    .line 126
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget-object v3, p0, Ll/xwa0;->x:Lv/VFrame;

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->A(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 141
    .line 142
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 143
    .line 144
    or-int/2addr v3, v4

    .line 145
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    const/4 v3, 0x0

    .line 150
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->K(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    sget v4, Ll/qa00;->o:I

    .line 155
    .line 156
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    const/high16 v4, 0x41000000    # 8.0f

    .line 161
    .line 162
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    neg-int v4, v4

    .line 167
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 168
    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget-object v4, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 175
    .line 176
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    iget-object p0, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 185
    .line 186
    if-eqz v4, :cond_2

    .line 187
    .line 188
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    :cond_2
    invoke-virtual {v2, v0, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/xwa0;->u:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/xwa0;->v:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Ll/gj40;->j:Lrx/subjects/b;

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/uwa0;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/uwa0;-><init>(Ll/xwa0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/core/data/UserTagsData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/wwa0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/wwa0;-><init>(Ll/xwa0;Lcom/p1/mobile/putong/core/data/UserTagsData;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 p0, 0x64

    .line 13
    .line 14
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

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
    invoke-virtual {p0, v0, p1}, Ll/xwa0;->c0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    instance-of v1, v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Ll/xwa0;->w:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 34
    .line 35
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-interface {v3}, Ll/t3m;->N2()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {v2, v1, v0, v3}, Ll/gj40;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p0, Ll/xwa0;->A:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    iget-object v1, p0, Ll/xwa0;->A:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 60
    .line 61
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/UserTagsData;->clickable:Z

    .line 62
    .line 63
    iput-boolean v1, p0, Ll/xwa0;->y:Z

    .line 64
    .line 65
    :cond_0
    iget-object v1, p0, Ll/xwa0;->A:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 66
    .line 67
    const/4 v2, 0x3

    .line 68
    invoke-virtual {p0, v1, v2}, Ll/xwa0;->d0(Lcom/p1/mobile/putong/core/data/UserTagsData;I)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/xwa0;->v:Lv/VText;

    .line 72
    .line 73
    new-instance v2, Ll/swa0;

    .line 74
    .line 75
    invoke-direct {v2, p0, v0}, Ll/swa0;-><init>(Ll/xwa0;Lcom/p1/mobile/putong/data/User;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/xwa0;->A:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/4 v1, 0x1

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    iget-object v0, p0, Ll/xwa0;->A:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 91
    .line 92
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/UserTagsData;->clickable:Z

    .line 93
    .line 94
    if-eqz v0, :cond_1

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 99
    .line 100
    iget-object v0, v0, Ll/dkb;->X1:Ll/jxd0;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ljava/lang/Boolean;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Ll/xwa0;->x:Lv/VFrame;

    .line 115
    .line 116
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v2, Ll/twa0;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/twa0;-><init>(Ll/xwa0;)V

    .line 130
    .line 131
    .line 132
    const-wide/16 v3, 0x3e8

    .line 133
    .line 134
    invoke-static {v0, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 135
    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 140
    .line 141
    iget-object v0, v0, Ll/dkb;->X1:Ll/jxd0;

    .line 142
    .line 143
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    :cond_1
    invoke-virtual {p0, v1}, Ll/rwa0;->V(Z)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/xwa0;->A:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Ll/xwa0;->j0(Lcom/p1/mobile/putong/core/data/UserTagsData;)V

    .line 154
    .line 155
    .line 156
    :cond_2
    return-void
.end method
