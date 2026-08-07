.class public Landroidx/fragment/app/b;
.super Landroidx/fragment/app/SpecialEffectsController;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/b$m;,
        Landroidx/fragment/app/b$k;,
        Landroidx/fragment/app/b$l;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/fragment/app/SpecialEffectsController;-><init>(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public f(Ljava/util/List;Z)V
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move-object v2, v1

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v4, 0x1

    .line 12
    if-eqz v3, :cond_3

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 25
    .line 26
    invoke-static {v5}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->from(Landroid/view/View;)Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    sget-object v6, Landroidx/fragment/app/b$a;->a:[I

    .line 31
    .line 32
    invoke-virtual {v3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->e()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    aget v6, v6, v7

    .line 41
    .line 42
    if-eq v6, v4, :cond_2

    .line 43
    .line 44
    const/4 v4, 0x2

    .line 45
    if-eq v6, v4, :cond_2

    .line 46
    .line 47
    const/4 v4, 0x3

    .line 48
    if-eq v6, v4, :cond_2

    .line 49
    .line 50
    const/4 v4, 0x4

    .line 51
    if-eq v6, v4, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    sget-object v4, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 55
    .line 56
    if-eq v5, v4, :cond_0

    .line 57
    .line 58
    move-object v2, v3

    .line 59
    goto :goto_0

    .line 60
    :cond_2
    sget-object v4, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 61
    .line 62
    if-ne v5, v4, :cond_0

    .line 63
    .line 64
    if-nez v1, :cond_0

    .line 65
    .line 66
    move-object v1, v3

    .line 67
    goto :goto_0

    .line 68
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    new-instance v3, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v5, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v5, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-eqz v6, :cond_6

    .line 92
    .line 93
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    check-cast v6, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 98
    .line 99
    new-instance v7, Ll/fg4;

    .line 100
    .line 101
    invoke-direct {v7}, Ll/fg4;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v6, v7}, Landroidx/fragment/app/SpecialEffectsController$Operation;->j(Ll/fg4;)V

    .line 105
    .line 106
    .line 107
    new-instance v8, Landroidx/fragment/app/b$k;

    .line 108
    .line 109
    invoke-direct {v8, v6, v7}, Landroidx/fragment/app/b$k;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation;Ll/fg4;)V

    .line 110
    .line 111
    .line 112
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    new-instance v7, Ll/fg4;

    .line 116
    .line 117
    invoke-direct {v7}, Ll/fg4;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6, v7}, Landroidx/fragment/app/SpecialEffectsController$Operation;->j(Ll/fg4;)V

    .line 121
    .line 122
    .line 123
    new-instance v8, Landroidx/fragment/app/b$m;

    .line 124
    .line 125
    const/4 v9, 0x0

    .line 126
    if-eqz p2, :cond_4

    .line 127
    .line 128
    if-ne v6, v1, :cond_5

    .line 129
    .line 130
    :goto_2
    move v9, v4

    .line 131
    goto :goto_3

    .line 132
    :cond_4
    if-ne v6, v2, :cond_5

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_5
    :goto_3
    invoke-direct {v8, v6, v7, p2, v9}, Landroidx/fragment/app/b$m;-><init>(Landroidx/fragment/app/SpecialEffectsController$Operation;Ll/fg4;ZZ)V

    .line 136
    .line 137
    .line 138
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    new-instance v7, Landroidx/fragment/app/b$b;

    .line 142
    .line 143
    invoke-direct {v7, p0, v5, v6}, Landroidx/fragment/app/b$b;-><init>(Landroidx/fragment/app/b;Ljava/util/List;Landroidx/fragment/app/SpecialEffectsController$Operation;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6, v7}, Landroidx/fragment/app/SpecialEffectsController$Operation;->a(Ljava/lang/Runnable;)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_6
    invoke-virtual {p0, v3, p2, v1, v2}, Landroidx/fragment/app/b;->x(Ljava/util/List;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;)Ljava/util/Map;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 155
    .line 156
    invoke-interface {p1, p2}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    invoke-virtual {p0, v0, v5, p2, p1}, Landroidx/fragment/app/b;->w(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V

    .line 161
    .line 162
    .line 163
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-eqz p2, :cond_7

    .line 172
    .line 173
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    check-cast p2, Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 178
    .line 179
    invoke-virtual {p0, p2}, Landroidx/fragment/app/b;->s(Landroidx/fragment/app/SpecialEffectsController$Operation;)V

    .line 180
    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_7
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public s(Landroidx/fragment/app/SpecialEffectsController$Operation;)V
    .locals 0
    .param p1    # Landroidx/fragment/app/SpecialEffectsController$Operation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/fragment/app/SpecialEffectsController$Operation;->e()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1, p0}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->applyState(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    check-cast p2, Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-static {p2}, Ll/zkl0;->b(Landroid/view/ViewGroup;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    if-ge v1, v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0, p1, v2}, Landroidx/fragment/app/b;->t(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    return-void

    .line 41
    :cond_3
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public u(Ljava/util/Map;Landroid/view/View;)V
    .locals 4
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    check-cast p2, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ge v1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p1, v2}, Landroidx/fragment/app/b;->u(Ljava/util/Map;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return-void
.end method

.method public v(Ll/l01;Ljava/util/Collection;)V
    .locals 0
    .param p1    # Ll/l01;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Collection;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/l01;->entrySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/util/Map$Entry;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Landroid/view/View;

    .line 26
    .line 27
    invoke-static {p1}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p2, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public final w(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
    .locals 15
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/b$k;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ">;Z",
            "Ljava/util/Map<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    new-instance v8, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v9

    .line 18
    const/4 v10, 0x0

    .line 19
    move v0, v10

    .line 20
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v3, 0x2

    .line 25
    if-eqz v1, :cond_7

    .line 26
    .line 27
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v6, v1

    .line 32
    check-cast v6, Landroidx/fragment/app/b$k;

    .line 33
    .line 34
    invoke-virtual {v6}, Landroidx/fragment/app/b$l;->d()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {v6}, Landroidx/fragment/app/b$l;->a()V

    .line 41
    .line 42
    .line 43
    :goto_1
    move-object/from16 v12, p4

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v6, v7}, Landroidx/fragment/app/b$k;->e(Landroid/content/Context;)Landroidx/fragment/app/d$d;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v6}, Landroidx/fragment/app/b$l;->a()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget-object v11, v1, Landroidx/fragment/app/d$d;->b:Landroid/animation/Animator;

    .line 57
    .line 58
    if-nez v11, :cond_2

    .line 59
    .line 60
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    invoke-virtual {v6}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    move-object/from16 v12, p4

    .line 75
    .line 76
    invoke-interface {v12, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v13

    .line 80
    invoke-virtual {v4, v13}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eqz v4, :cond_4

    .line 85
    .line 86
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->G0(I)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_3

    .line 91
    .line 92
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    :cond_3
    invoke-virtual {v6}, Landroidx/fragment/app/b$l;->a()V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual {v5}, Landroidx/fragment/app/SpecialEffectsController$Operation;->e()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sget-object v3, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->GONE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 104
    .line 105
    const/4 v13, 0x1

    .line 106
    if-ne v0, v3, :cond_5

    .line 107
    .line 108
    move v4, v13

    .line 109
    goto :goto_2

    .line 110
    :cond_5
    move v4, v10

    .line 111
    :goto_2
    move-object/from16 v14, p2

    .line 112
    .line 113
    if-eqz v4, :cond_6

    .line 114
    .line 115
    invoke-interface {v14, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    :cond_6
    iget-object v3, v1, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 119
    .line 120
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 121
    .line 122
    .line 123
    new-instance v0, Landroidx/fragment/app/b$c;

    .line 124
    .line 125
    move-object v1, p0

    .line 126
    invoke-direct/range {v0 .. v6}, Landroidx/fragment/app/b$c;-><init>(Landroidx/fragment/app/b;Landroid/view/ViewGroup;Landroid/view/View;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/b$k;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v11, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v11, v3}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v11}, Landroid/animation/Animator;->start()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v6}, Landroidx/fragment/app/b$l;->c()Ll/fg4;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v3, Landroidx/fragment/app/b$d;

    .line 143
    .line 144
    invoke-direct {v3, p0, v11}, Landroidx/fragment/app/b$d;-><init>(Landroidx/fragment/app/b;Landroid/animation/Animator;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v3}, Ll/fg4;->d(Ll/fg4$a;)V

    .line 148
    .line 149
    .line 150
    move v0, v13

    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_7
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    if-eqz v5, :cond_d

    .line 162
    .line 163
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    check-cast v5, Landroidx/fragment/app/b$k;

    .line 168
    .line 169
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-virtual {v6}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    if-eqz p3, :cond_9

    .line 178
    .line 179
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->G0(I)Z

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    if-eqz v6, :cond_8

    .line 184
    .line 185
    invoke-static {v8}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    :cond_8
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->a()V

    .line 189
    .line 190
    .line 191
    goto :goto_3

    .line 192
    :cond_9
    if-eqz v0, :cond_b

    .line 193
    .line 194
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->G0(I)Z

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    if-eqz v6, :cond_a

    .line 199
    .line 200
    invoke-static {v8}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    :cond_a
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->a()V

    .line 204
    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_b
    iget-object v8, v8, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 208
    .line 209
    invoke-virtual {v5, v7}, Landroidx/fragment/app/b$k;->e(Landroid/content/Context;)Landroidx/fragment/app/d$d;

    .line 210
    .line 211
    .line 212
    move-result-object v9

    .line 213
    invoke-static {v9}, Ll/yn80;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v9

    .line 217
    check-cast v9, Landroidx/fragment/app/d$d;

    .line 218
    .line 219
    iget-object v9, v9, Landroidx/fragment/app/d$d;->a:Landroid/view/animation/Animation;

    .line 220
    .line 221
    invoke-static {v9}, Ll/yn80;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v9

    .line 225
    check-cast v9, Landroid/view/animation/Animation;

    .line 226
    .line 227
    invoke-virtual {v6}, Landroidx/fragment/app/SpecialEffectsController$Operation;->e()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 228
    .line 229
    .line 230
    move-result-object v6

    .line 231
    sget-object v10, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->REMOVED:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 232
    .line 233
    if-eq v6, v10, :cond_c

    .line 234
    .line 235
    invoke-virtual {v8, v9}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->a()V

    .line 239
    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_c
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 243
    .line 244
    .line 245
    new-instance v6, Landroidx/fragment/app/d$e;

    .line 246
    .line 247
    invoke-direct {v6, v9, v2, v8}, Landroidx/fragment/app/d$e;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 248
    .line 249
    .line 250
    new-instance v9, Landroidx/fragment/app/b$e;

    .line 251
    .line 252
    invoke-direct {v9, p0, v2, v8, v5}, Landroidx/fragment/app/b$e;-><init>(Landroidx/fragment/app/b;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/b$k;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v6, v9}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v8, v6}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 259
    .line 260
    .line 261
    :goto_4
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->c()Ll/fg4;

    .line 262
    .line 263
    .line 264
    move-result-object v6

    .line 265
    new-instance v9, Landroidx/fragment/app/b$f;

    .line 266
    .line 267
    invoke-direct {v9, p0, v8, v2, v5}, Landroidx/fragment/app/b$f;-><init>(Landroidx/fragment/app/b;Landroid/view/View;Landroid/view/ViewGroup;Landroidx/fragment/app/b$k;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v6, v9}, Ll/fg4;->d(Ll/fg4$a;)V

    .line 271
    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_d
    return-void
.end method

.method public final x(Ljava/util/List;ZLandroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;)Ljava/util/Map;
    .locals 27
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/fragment/app/SpecialEffectsController$Operation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroidx/fragment/app/SpecialEffectsController$Operation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/b$m;",
            ">;Z",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            ")",
            "Ljava/util/Map<",
            "Landroidx/fragment/app/SpecialEffectsController$Operation;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v4, p2

    .line 4
    .line 5
    new-instance v6, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v8, 0x0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_4

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroidx/fragment/app/b$m;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroidx/fragment/app/b$l;->d()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {v2}, Landroidx/fragment/app/b$m;->e()Ll/v5j;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-nez v8, :cond_2

    .line 39
    .line 40
    move-object v8, v3

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    if-eqz v3, :cond_0

    .line 43
    .line 44
    if-ne v8, v3, :cond_3

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 48
    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v3, "Mixing framework transitions and AndroidX transitions is not allowed. Fragment "

    .line 52
    .line 53
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Landroidx/fragment/app/b$m;->h()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const-string v3, " returned Transition "

    .line 72
    .line 73
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, " which uses a different Transition  type than other Fragments."

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    throw v0

    .line 92
    :cond_4
    if-nez v8, :cond_5

    .line 93
    .line 94
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_2f

    .line 103
    .line 104
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Landroidx/fragment/app/b$m;

    .line 109
    .line 110
    invoke-virtual {v1}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-interface {v6, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Landroidx/fragment/app/b$l;->a()V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_5
    new-instance v9, Landroid/view/View;

    .line 124
    .line 125
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-direct {v9, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 134
    .line 135
    .line 136
    new-instance v10, Landroid/graphics/Rect;

    .line 137
    .line 138
    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 139
    .line 140
    .line 141
    new-instance v11, Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .line 145
    .line 146
    new-instance v15, Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .line 150
    .line 151
    new-instance v12, Ll/l01;

    .line 152
    .line 153
    invoke-direct {v12}, Ll/l01;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 157
    .line 158
    .line 159
    move-result-object v16

    .line 160
    const/4 v0, 0x0

    .line 161
    const/4 v14, 0x0

    .line 162
    const/16 v17, 0x0

    .line 163
    .line 164
    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_19

    .line 169
    .line 170
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    check-cast v2, Landroidx/fragment/app/b$m;

    .line 175
    .line 176
    invoke-virtual {v2}, Landroidx/fragment/app/b$m;->i()Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-eqz v5, :cond_18

    .line 181
    .line 182
    if-eqz p3, :cond_18

    .line 183
    .line 184
    if-eqz p4, :cond_18

    .line 185
    .line 186
    invoke-virtual {v2}, Landroidx/fragment/app/b$m;->g()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v8, v0}, Ll/v5j;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v8, v0}, Ll/v5j;->B(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getSharedElementSourceNames()Ljava/util/ArrayList;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual/range {p3 .. p3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getSharedElementSourceNames()Ljava/util/ArrayList;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    invoke-virtual/range {p3 .. p3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 215
    .line 216
    .line 217
    move-result-object v18

    .line 218
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/Fragment;->getSharedElementTargetNames()Ljava/util/ArrayList;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    const/4 v13, 0x0

    .line 223
    const/16 v19, 0x1

    .line 224
    .line 225
    :goto_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    if-ge v13, v3, :cond_7

    .line 230
    .line 231
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    move-object/from16 v20, v0

    .line 240
    .line 241
    const/4 v0, -0x1

    .line 242
    if-eq v3, v0, :cond_6

    .line 243
    .line 244
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v2, v3, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    :cond_6
    add-int/lit8 v13, v13, 0x1

    .line 252
    .line 253
    move-object/from16 v0, v20

    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_7
    move-object/from16 v20, v0

    .line 257
    .line 258
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getSharedElementTargetNames()Ljava/util/ArrayList;

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    if-nez v4, :cond_8

    .line 267
    .line 268
    invoke-virtual/range {p3 .. p3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()Ll/j3f0;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Ll/j3f0;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    goto :goto_4

    .line 285
    :cond_8
    invoke-virtual/range {p3 .. p3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Ll/j3f0;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()Ll/j3f0;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    :goto_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 302
    .line 303
    .line 304
    move-result v5

    .line 305
    const/4 v13, 0x0

    .line 306
    :goto_5
    if-ge v13, v5, :cond_9

    .line 307
    .line 308
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v21

    .line 312
    move/from16 v22, v5

    .line 313
    .line 314
    move-object/from16 v5, v21

    .line 315
    .line 316
    check-cast v5, Ljava/lang/String;

    .line 317
    .line 318
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v21

    .line 322
    move/from16 v23, v13

    .line 323
    .line 324
    move-object/from16 v13, v21

    .line 325
    .line 326
    check-cast v13, Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {v12, v5, v13}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    add-int/lit8 v13, v23, 0x1

    .line 332
    .line 333
    move/from16 v5, v22

    .line 334
    .line 335
    goto :goto_5

    .line 336
    :cond_9
    new-instance v13, Ll/l01;

    .line 337
    .line 338
    invoke-direct {v13}, Ll/l01;-><init>()V

    .line 339
    .line 340
    .line 341
    invoke-virtual/range {p3 .. p3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 342
    .line 343
    .line 344
    move-result-object v5

    .line 345
    iget-object v5, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 346
    .line 347
    invoke-virtual {v1, v13, v5}, Landroidx/fragment/app/b;->u(Ljava/util/Map;Landroid/view/View;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v13, v2}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 351
    .line 352
    .line 353
    if-eqz v0, :cond_c

    .line 354
    .line 355
    invoke-virtual {v0, v2, v13}, Ll/j3f0;->d(Ljava/util/List;Ljava/util/Map;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    add-int/lit8 v0, v0, -0x1

    .line 363
    .line 364
    :goto_6
    if-ltz v0, :cond_d

    .line 365
    .line 366
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    check-cast v5, Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {v13, v5}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v21

    .line 376
    check-cast v21, Landroid/view/View;

    .line 377
    .line 378
    if-nez v21, :cond_a

    .line 379
    .line 380
    invoke-virtual {v12, v5}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move/from16 v22, v0

    .line 384
    .line 385
    goto :goto_7

    .line 386
    :cond_a
    move/from16 v22, v0

    .line 387
    .line 388
    invoke-static/range {v21 .. v21}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    move-result v0

    .line 396
    if-nez v0, :cond_b

    .line 397
    .line 398
    invoke-virtual {v12, v5}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    check-cast v0, Ljava/lang/String;

    .line 403
    .line 404
    invoke-static/range {v21 .. v21}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    invoke-virtual {v12, v5, v0}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    :cond_b
    :goto_7
    add-int/lit8 v0, v22, -0x1

    .line 412
    .line 413
    goto :goto_6

    .line 414
    :cond_c
    invoke-virtual {v13}, Ll/l01;->keySet()Ljava/util/Set;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {v12, v0}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 419
    .line 420
    .line 421
    :cond_d
    new-instance v5, Ll/l01;

    .line 422
    .line 423
    invoke-direct {v5}, Ll/l01;-><init>()V

    .line 424
    .line 425
    .line 426
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 431
    .line 432
    invoke-virtual {v1, v5, v0}, Landroidx/fragment/app/b;->u(Ljava/util/Map;Landroid/view/View;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v5, v7}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 436
    .line 437
    .line 438
    invoke-virtual {v12}, Ll/l01;->values()Ljava/util/Collection;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    invoke-virtual {v5, v0}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 443
    .line 444
    .line 445
    if-eqz v3, :cond_11

    .line 446
    .line 447
    invoke-virtual {v3, v7, v5}, Ll/j3f0;->d(Ljava/util/List;Ljava/util/Map;)V

    .line 448
    .line 449
    .line 450
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    add-int/lit8 v0, v0, -0x1

    .line 455
    .line 456
    :goto_8
    if-ltz v0, :cond_12

    .line 457
    .line 458
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v3

    .line 462
    check-cast v3, Ljava/lang/String;

    .line 463
    .line 464
    invoke-virtual {v5, v3}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v21

    .line 468
    check-cast v21, Landroid/view/View;

    .line 469
    .line 470
    if-nez v21, :cond_f

    .line 471
    .line 472
    invoke-static {v12, v3}, Landroidx/fragment/app/l;->q(Ll/l01;Ljava/lang/String;)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v3

    .line 476
    if-eqz v3, :cond_e

    .line 477
    .line 478
    invoke-virtual {v12, v3}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    :cond_e
    move/from16 v22, v0

    .line 482
    .line 483
    goto :goto_9

    .line 484
    :cond_f
    move/from16 v22, v0

    .line 485
    .line 486
    invoke-static/range {v21 .. v21}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 491
    .line 492
    .line 493
    move-result v0

    .line 494
    if-nez v0, :cond_10

    .line 495
    .line 496
    invoke-static {v12, v3}, Landroidx/fragment/app/l;->q(Ll/l01;Ljava/lang/String;)Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    if-eqz v0, :cond_10

    .line 501
    .line 502
    invoke-static/range {v21 .. v21}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v3

    .line 506
    invoke-virtual {v12, v0, v3}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    .line 508
    .line 509
    :cond_10
    :goto_9
    add-int/lit8 v0, v22, -0x1

    .line 510
    .line 511
    goto :goto_8

    .line 512
    :cond_11
    invoke-static {v12, v5}, Landroidx/fragment/app/l;->y(Ll/l01;Ll/l01;)V

    .line 513
    .line 514
    .line 515
    :cond_12
    invoke-virtual {v12}, Ll/l01;->keySet()Ljava/util/Set;

    .line 516
    .line 517
    .line 518
    move-result-object v0

    .line 519
    invoke-virtual {v1, v13, v0}, Landroidx/fragment/app/b;->v(Ll/l01;Ljava/util/Collection;)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v12}, Ll/l01;->values()Ljava/util/Collection;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    invoke-virtual {v1, v5, v0}, Landroidx/fragment/app/b;->v(Ll/l01;Ljava/util/Collection;)V

    .line 527
    .line 528
    .line 529
    invoke-virtual {v12}, Ll/oof0;->isEmpty()Z

    .line 530
    .line 531
    .line 532
    move-result v0

    .line 533
    if-eqz v0, :cond_13

    .line 534
    .line 535
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 536
    .line 537
    .line 538
    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 539
    .line 540
    .line 541
    move-object/from16 v3, p3

    .line 542
    .line 543
    move-object/from16 v2, p4

    .line 544
    .line 545
    move-object v5, v9

    .line 546
    move-object v7, v10

    .line 547
    move-object v10, v11

    .line 548
    move-object/from16 v19, v12

    .line 549
    .line 550
    move-object v9, v15

    .line 551
    const/4 v0, 0x0

    .line 552
    const/4 v4, 0x0

    .line 553
    goto/16 :goto_d

    .line 554
    .line 555
    :cond_13
    invoke-virtual/range {p4 .. p4}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    invoke-virtual/range {p3 .. p3}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 560
    .line 561
    .line 562
    move-result-object v3

    .line 563
    move/from16 v1, v19

    .line 564
    .line 565
    invoke-static {v0, v3, v4, v13, v1}, Landroidx/fragment/app/l;->f(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLl/l01;Z)V

    .line 566
    .line 567
    .line 568
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 569
    .line 570
    .line 571
    move-result-object v0

    .line 572
    move-object v3, v0

    .line 573
    new-instance v0, Landroidx/fragment/app/b$g;

    .line 574
    .line 575
    move/from16 v22, v1

    .line 576
    .line 577
    move-object/from16 v19, v12

    .line 578
    .line 579
    move-object/from16 v21, v14

    .line 580
    .line 581
    move-object/from16 v12, v20

    .line 582
    .line 583
    move-object/from16 v1, p0

    .line 584
    .line 585
    move-object/from16 v20, v2

    .line 586
    .line 587
    move-object v14, v3

    .line 588
    move-object/from16 v3, p3

    .line 589
    .line 590
    move-object/from16 v2, p4

    .line 591
    .line 592
    invoke-direct/range {v0 .. v5}, Landroidx/fragment/app/b$g;-><init>(Landroidx/fragment/app/b;Landroidx/fragment/app/SpecialEffectsController$Operation;Landroidx/fragment/app/SpecialEffectsController$Operation;ZLl/l01;)V

    .line 593
    .line 594
    .line 595
    invoke-static {v14, v0}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 596
    .line 597
    .line 598
    invoke-virtual {v13}, Ll/l01;->values()Ljava/util/Collection;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 607
    .line 608
    .line 609
    move-result v4

    .line 610
    if-eqz v4, :cond_14

    .line 611
    .line 612
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 613
    .line 614
    .line 615
    move-result-object v4

    .line 616
    check-cast v4, Landroid/view/View;

    .line 617
    .line 618
    invoke-virtual {v1, v11, v4}, Landroidx/fragment/app/b;->t(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 619
    .line 620
    .line 621
    goto :goto_a

    .line 622
    :cond_14
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->isEmpty()Z

    .line 623
    .line 624
    .line 625
    move-result v0

    .line 626
    if-nez v0, :cond_15

    .line 627
    .line 628
    move-object/from16 v0, v20

    .line 629
    .line 630
    const/4 v4, 0x0

    .line 631
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    check-cast v0, Ljava/lang/String;

    .line 636
    .line 637
    invoke-virtual {v13, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    .line 639
    .line 640
    move-result-object v0

    .line 641
    move-object v14, v0

    .line 642
    check-cast v14, Landroid/view/View;

    .line 643
    .line 644
    invoke-virtual {v8, v12, v14}, Ll/v5j;->v(Ljava/lang/Object;Landroid/view/View;)V

    .line 645
    .line 646
    .line 647
    move-object/from16 v21, v14

    .line 648
    .line 649
    :cond_15
    invoke-virtual {v5}, Ll/l01;->values()Ljava/util/Collection;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 658
    .line 659
    .line 660
    move-result v4

    .line 661
    if-eqz v4, :cond_16

    .line 662
    .line 663
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 664
    .line 665
    .line 666
    move-result-object v4

    .line 667
    check-cast v4, Landroid/view/View;

    .line 668
    .line 669
    invoke-virtual {v1, v15, v4}, Landroidx/fragment/app/b;->t(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 670
    .line 671
    .line 672
    goto :goto_b

    .line 673
    :cond_16
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 674
    .line 675
    .line 676
    move-result v0

    .line 677
    const/4 v4, 0x0

    .line 678
    if-nez v0, :cond_17

    .line 679
    .line 680
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 681
    .line 682
    .line 683
    move-result-object v0

    .line 684
    check-cast v0, Ljava/lang/String;

    .line 685
    .line 686
    invoke-virtual {v5, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    .line 688
    .line 689
    move-result-object v0

    .line 690
    check-cast v0, Landroid/view/View;

    .line 691
    .line 692
    if-eqz v0, :cond_17

    .line 693
    .line 694
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 695
    .line 696
    .line 697
    move-result-object v5

    .line 698
    new-instance v7, Landroidx/fragment/app/b$h;

    .line 699
    .line 700
    invoke-direct {v7, v1, v8, v0, v10}, Landroidx/fragment/app/b$h;-><init>(Landroidx/fragment/app/b;Ll/v5j;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 701
    .line 702
    .line 703
    invoke-static {v5, v7}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 704
    .line 705
    .line 706
    move/from16 v17, v22

    .line 707
    .line 708
    :cond_17
    invoke-virtual {v8, v12, v9, v11}, Ll/v5j;->z(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 709
    .line 710
    .line 711
    move-object/from16 v20, v12

    .line 712
    .line 713
    const/4 v12, 0x0

    .line 714
    const/4 v13, 0x0

    .line 715
    move-object v0, v10

    .line 716
    const/4 v10, 0x0

    .line 717
    move-object v5, v11

    .line 718
    const/4 v11, 0x0

    .line 719
    move-object/from16 v14, v20

    .line 720
    .line 721
    move-object v7, v0

    .line 722
    move-object v0, v5

    .line 723
    move-object v5, v9

    .line 724
    move-object/from16 v9, v20

    .line 725
    .line 726
    invoke-virtual/range {v8 .. v15}, Ll/v5j;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 727
    .line 728
    .line 729
    move-object v9, v15

    .line 730
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 731
    .line 732
    invoke-interface {v6, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 733
    .line 734
    .line 735
    invoke-interface {v6, v2, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-object v10, v0

    .line 739
    move-object/from16 v0, v20

    .line 740
    .line 741
    :goto_c
    move-object/from16 v14, v21

    .line 742
    .line 743
    goto :goto_d

    .line 744
    :cond_18
    move-object/from16 v3, p3

    .line 745
    .line 746
    move-object/from16 v2, p4

    .line 747
    .line 748
    move-object v5, v9

    .line 749
    move-object v7, v10

    .line 750
    move-object v10, v11

    .line 751
    move-object/from16 v19, v12

    .line 752
    .line 753
    move-object/from16 v21, v14

    .line 754
    .line 755
    move-object v9, v15

    .line 756
    const/4 v4, 0x0

    .line 757
    goto :goto_c

    .line 758
    :goto_d
    move/from16 v4, p2

    .line 759
    .line 760
    move-object v15, v9

    .line 761
    move-object v11, v10

    .line 762
    move-object/from16 v12, v19

    .line 763
    .line 764
    move-object v9, v5

    .line 765
    move-object v10, v7

    .line 766
    goto/16 :goto_2

    .line 767
    .line 768
    :cond_19
    move-object/from16 v3, p3

    .line 769
    .line 770
    move-object/from16 v2, p4

    .line 771
    .line 772
    move-object v5, v9

    .line 773
    move-object v7, v10

    .line 774
    move-object v10, v11

    .line 775
    move-object/from16 v19, v12

    .line 776
    .line 777
    move-object/from16 v21, v14

    .line 778
    .line 779
    move-object v9, v15

    .line 780
    const/4 v4, 0x0

    .line 781
    const/16 v22, 0x1

    .line 782
    .line 783
    new-instance v11, Ljava/util/ArrayList;

    .line 784
    .line 785
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 786
    .line 787
    .line 788
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 789
    .line 790
    .line 791
    move-result-object v16

    .line 792
    const/4 v12, 0x0

    .line 793
    const/4 v13, 0x0

    .line 794
    :goto_e
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    .line 795
    .line 796
    .line 797
    move-result v14

    .line 798
    if-eqz v14, :cond_26

    .line 799
    .line 800
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 801
    .line 802
    .line 803
    move-result-object v14

    .line 804
    move-object/from16 v18, v14

    .line 805
    .line 806
    check-cast v18, Landroidx/fragment/app/b$m;

    .line 807
    .line 808
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$l;->d()Z

    .line 809
    .line 810
    .line 811
    move-result v14

    .line 812
    if-eqz v14, :cond_1a

    .line 813
    .line 814
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 815
    .line 816
    .line 817
    move-result-object v14

    .line 818
    sget-object v15, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 819
    .line 820
    invoke-interface {v6, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 821
    .line 822
    .line 823
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$l;->a()V

    .line 824
    .line 825
    .line 826
    goto :goto_e

    .line 827
    :cond_1a
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$m;->h()Ljava/lang/Object;

    .line 828
    .line 829
    .line 830
    move-result-object v14

    .line 831
    invoke-virtual {v8, v14}, Ll/v5j;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    .line 833
    .line 834
    move-result-object v14

    .line 835
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 836
    .line 837
    .line 838
    move-result-object v15

    .line 839
    if-eqz v0, :cond_1c

    .line 840
    .line 841
    if-eq v15, v3, :cond_1b

    .line 842
    .line 843
    if-ne v15, v2, :cond_1c

    .line 844
    .line 845
    :cond_1b
    move/from16 v20, v22

    .line 846
    .line 847
    goto :goto_f

    .line 848
    :cond_1c
    move/from16 v20, v4

    .line 849
    .line 850
    :goto_f
    if-nez v14, :cond_1e

    .line 851
    .line 852
    if-nez v20, :cond_1d

    .line 853
    .line 854
    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 855
    .line 856
    invoke-interface {v6, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 857
    .line 858
    .line 859
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$l;->a()V

    .line 860
    .line 861
    .line 862
    :cond_1d
    move-object/from16 v20, v5

    .line 863
    .line 864
    move-object/from16 v26, v10

    .line 865
    .line 866
    move-object v4, v11

    .line 867
    move-object/from16 v5, v21

    .line 868
    .line 869
    const/4 v10, 0x0

    .line 870
    move-object/from16 v21, v9

    .line 871
    .line 872
    goto/16 :goto_14

    .line 873
    .line 874
    :cond_1e
    move-object/from16 v23, v11

    .line 875
    .line 876
    new-instance v11, Ljava/util/ArrayList;

    .line 877
    .line 878
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 879
    .line 880
    .line 881
    invoke-virtual {v15}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 882
    .line 883
    .line 884
    move-result-object v4

    .line 885
    iget-object v4, v4, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 886
    .line 887
    invoke-virtual {v1, v11, v4}, Landroidx/fragment/app/b;->t(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 888
    .line 889
    .line 890
    if-eqz v20, :cond_20

    .line 891
    .line 892
    if-ne v15, v3, :cond_1f

    .line 893
    .line 894
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 895
    .line 896
    .line 897
    goto :goto_10

    .line 898
    :cond_1f
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 899
    .line 900
    .line 901
    :cond_20
    :goto_10
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 902
    .line 903
    .line 904
    move-result v4

    .line 905
    if-eqz v4, :cond_21

    .line 906
    .line 907
    invoke-virtual {v8, v14, v5}, Ll/v5j;->a(Ljava/lang/Object;Landroid/view/View;)V

    .line 908
    .line 909
    .line 910
    move-object/from16 v20, v5

    .line 911
    .line 912
    move-object/from16 v26, v10

    .line 913
    .line 914
    move-object v2, v12

    .line 915
    move-object v3, v13

    .line 916
    move-object/from16 p2, v15

    .line 917
    .line 918
    move-object/from16 v5, v21

    .line 919
    .line 920
    move-object/from16 v4, v23

    .line 921
    .line 922
    move-object/from16 v21, v9

    .line 923
    .line 924
    move-object v9, v14

    .line 925
    goto :goto_11

    .line 926
    :cond_21
    invoke-virtual {v8, v14, v11}, Ll/v5j;->b(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 927
    .line 928
    .line 929
    move-object v4, v9

    .line 930
    move-object v9, v14

    .line 931
    const/4 v14, 0x0

    .line 932
    move-object/from16 v20, v15

    .line 933
    .line 934
    const/4 v15, 0x0

    .line 935
    move-object/from16 v24, v12

    .line 936
    .line 937
    const/4 v12, 0x0

    .line 938
    move-object/from16 v25, v13

    .line 939
    .line 940
    const/4 v13, 0x0

    .line 941
    move-object/from16 v26, v10

    .line 942
    .line 943
    move-object v10, v9

    .line 944
    move-object/from16 p2, v20

    .line 945
    .line 946
    move-object/from16 v2, v24

    .line 947
    .line 948
    move-object/from16 v3, v25

    .line 949
    .line 950
    move-object/from16 v20, v5

    .line 951
    .line 952
    move-object/from16 v5, v21

    .line 953
    .line 954
    move-object/from16 v21, v4

    .line 955
    .line 956
    move-object/from16 v4, v23

    .line 957
    .line 958
    invoke-virtual/range {v8 .. v15}, Ll/v5j;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 959
    .line 960
    .line 961
    invoke-virtual/range {p2 .. p2}, Landroidx/fragment/app/SpecialEffectsController$Operation;->e()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 962
    .line 963
    .line 964
    move-result-object v10

    .line 965
    sget-object v12, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->GONE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 966
    .line 967
    if-ne v10, v12, :cond_22

    .line 968
    .line 969
    invoke-virtual/range {p2 .. p2}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 970
    .line 971
    .line 972
    move-result-object v10

    .line 973
    iget-object v10, v10, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 974
    .line 975
    invoke-virtual {v8, v9, v10, v11}, Ll/v5j;->r(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 976
    .line 977
    .line 978
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 979
    .line 980
    .line 981
    move-result-object v10

    .line 982
    new-instance v12, Landroidx/fragment/app/b$i;

    .line 983
    .line 984
    invoke-direct {v12, v1, v11}, Landroidx/fragment/app/b$i;-><init>(Landroidx/fragment/app/b;Ljava/util/ArrayList;)V

    .line 985
    .line 986
    .line 987
    invoke-static {v10, v12}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 988
    .line 989
    .line 990
    :cond_22
    :goto_11
    invoke-virtual/range {p2 .. p2}, Landroidx/fragment/app/SpecialEffectsController$Operation;->e()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 991
    .line 992
    .line 993
    move-result-object v10

    .line 994
    sget-object v12, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->VISIBLE:Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    .line 995
    .line 996
    if-ne v10, v12, :cond_23

    .line 997
    .line 998
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 999
    .line 1000
    .line 1001
    if-eqz v17, :cond_24

    .line 1002
    .line 1003
    invoke-virtual {v8, v9, v7}, Ll/v5j;->u(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 1004
    .line 1005
    .line 1006
    goto :goto_12

    .line 1007
    :cond_23
    invoke-virtual {v8, v9, v5}, Ll/v5j;->v(Ljava/lang/Object;Landroid/view/View;)V

    .line 1008
    .line 1009
    .line 1010
    :cond_24
    :goto_12
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1011
    .line 1012
    move-object/from16 v11, p2

    .line 1013
    .line 1014
    invoke-interface {v6, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1015
    .line 1016
    .line 1017
    invoke-virtual/range {v18 .. v18}, Landroidx/fragment/app/b$m;->j()Z

    .line 1018
    .line 1019
    .line 1020
    move-result v10

    .line 1021
    if-eqz v10, :cond_25

    .line 1022
    .line 1023
    const/4 v10, 0x0

    .line 1024
    invoke-virtual {v8, v2, v9, v10}, Ll/v5j;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v2

    .line 1028
    :goto_13
    move-object v12, v2

    .line 1029
    move-object v13, v3

    .line 1030
    goto :goto_14

    .line 1031
    :cond_25
    const/4 v10, 0x0

    .line 1032
    invoke-virtual {v8, v3, v9, v10}, Ll/v5j;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1033
    .line 1034
    .line 1035
    move-result-object v3

    .line 1036
    goto :goto_13

    .line 1037
    :goto_14
    move-object/from16 v3, p3

    .line 1038
    .line 1039
    move-object/from16 v2, p4

    .line 1040
    .line 1041
    move-object v11, v4

    .line 1042
    move-object/from16 v9, v21

    .line 1043
    .line 1044
    move-object/from16 v10, v26

    .line 1045
    .line 1046
    const/4 v4, 0x0

    .line 1047
    move-object/from16 v21, v5

    .line 1048
    .line 1049
    move-object/from16 v5, v20

    .line 1050
    .line 1051
    goto/16 :goto_e

    .line 1052
    .line 1053
    :cond_26
    move-object/from16 v21, v9

    .line 1054
    .line 1055
    move-object/from16 v26, v10

    .line 1056
    .line 1057
    move-object v4, v11

    .line 1058
    move-object v2, v12

    .line 1059
    move-object v3, v13

    .line 1060
    invoke-virtual {v8, v2, v3, v0}, Ll/v5j;->m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1061
    .line 1062
    .line 1063
    move-result-object v2

    .line 1064
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v3

    .line 1068
    :cond_27
    :goto_15
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 1069
    .line 1070
    .line 1071
    move-result v5

    .line 1072
    if-eqz v5, :cond_2e

    .line 1073
    .line 1074
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v5

    .line 1078
    check-cast v5, Landroidx/fragment/app/b$m;

    .line 1079
    .line 1080
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->d()Z

    .line 1081
    .line 1082
    .line 1083
    move-result v7

    .line 1084
    if-eqz v7, :cond_28

    .line 1085
    .line 1086
    goto :goto_15

    .line 1087
    :cond_28
    invoke-virtual {v5}, Landroidx/fragment/app/b$m;->h()Ljava/lang/Object;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v7

    .line 1091
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 1092
    .line 1093
    .line 1094
    move-result-object v9

    .line 1095
    move-object/from16 v10, p3

    .line 1096
    .line 1097
    move-object/from16 v11, p4

    .line 1098
    .line 1099
    if-eqz v0, :cond_2a

    .line 1100
    .line 1101
    if-eq v9, v10, :cond_29

    .line 1102
    .line 1103
    if-ne v9, v11, :cond_2a

    .line 1104
    .line 1105
    :cond_29
    move/from16 v13, v22

    .line 1106
    .line 1107
    goto :goto_16

    .line 1108
    :cond_2a
    const/4 v13, 0x0

    .line 1109
    :goto_16
    if-nez v7, :cond_2b

    .line 1110
    .line 1111
    if-eqz v13, :cond_27

    .line 1112
    .line 1113
    :cond_2b
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 1114
    .line 1115
    .line 1116
    move-result-object v7

    .line 1117
    invoke-static {v7}, Ll/kkl0;->P(Landroid/view/View;)Z

    .line 1118
    .line 1119
    .line 1120
    move-result v7

    .line 1121
    if-nez v7, :cond_2d

    .line 1122
    .line 1123
    const/4 v7, 0x2

    .line 1124
    invoke-static {v7}, Landroidx/fragment/app/FragmentManager;->G0(I)Z

    .line 1125
    .line 1126
    .line 1127
    move-result v7

    .line 1128
    if-eqz v7, :cond_2c

    .line 1129
    .line 1130
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 1131
    .line 1132
    .line 1133
    move-result-object v7

    .line 1134
    invoke-static {v7}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 1135
    .line 1136
    .line 1137
    invoke-static {v9}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 1138
    .line 1139
    .line 1140
    :cond_2c
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->a()V

    .line 1141
    .line 1142
    .line 1143
    goto :goto_15

    .line 1144
    :cond_2d
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->b()Landroidx/fragment/app/SpecialEffectsController$Operation;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v7

    .line 1148
    invoke-virtual {v7}, Landroidx/fragment/app/SpecialEffectsController$Operation;->f()Landroidx/fragment/app/Fragment;

    .line 1149
    .line 1150
    .line 1151
    move-result-object v7

    .line 1152
    invoke-virtual {v5}, Landroidx/fragment/app/b$l;->c()Ll/fg4;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v9

    .line 1156
    new-instance v12, Landroidx/fragment/app/b$j;

    .line 1157
    .line 1158
    invoke-direct {v12, v1, v5}, Landroidx/fragment/app/b$j;-><init>(Landroidx/fragment/app/b;Landroidx/fragment/app/b$m;)V

    .line 1159
    .line 1160
    .line 1161
    invoke-virtual {v8, v7, v2, v9, v12}, Ll/v5j;->w(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Ll/fg4;Ljava/lang/Runnable;)V

    .line 1162
    .line 1163
    .line 1164
    goto :goto_15

    .line 1165
    :cond_2e
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v3

    .line 1169
    invoke-static {v3}, Ll/kkl0;->P(Landroid/view/View;)Z

    .line 1170
    .line 1171
    .line 1172
    move-result v3

    .line 1173
    if-nez v3, :cond_30

    .line 1174
    .line 1175
    :cond_2f
    return-object v6

    .line 1176
    :cond_30
    const/4 v3, 0x4

    .line 1177
    invoke-static {v4, v3}, Landroidx/fragment/app/l;->B(Ljava/util/ArrayList;I)V

    .line 1178
    .line 1179
    .line 1180
    move-object/from16 v11, v21

    .line 1181
    .line 1182
    invoke-virtual {v8, v11}, Ll/v5j;->o(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v12

    .line 1186
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v3

    .line 1190
    invoke-virtual {v8, v3, v2}, Ll/v5j;->c(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 1191
    .line 1192
    .line 1193
    invoke-virtual {v1}, Landroidx/fragment/app/SpecialEffectsController;->m()Landroid/view/ViewGroup;

    .line 1194
    .line 1195
    .line 1196
    move-result-object v9

    .line 1197
    move-object/from16 v13, v19

    .line 1198
    .line 1199
    move-object/from16 v10, v26

    .line 1200
    .line 1201
    invoke-virtual/range {v8 .. v13}, Ll/v5j;->y(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 1202
    .line 1203
    .line 1204
    const/4 v1, 0x0

    .line 1205
    invoke-static {v4, v1}, Landroidx/fragment/app/l;->B(Ljava/util/ArrayList;I)V

    .line 1206
    .line 1207
    .line 1208
    invoke-virtual {v8, v0, v10, v11}, Ll/v5j;->A(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1209
    .line 1210
    .line 1211
    return-object v6
.end method
