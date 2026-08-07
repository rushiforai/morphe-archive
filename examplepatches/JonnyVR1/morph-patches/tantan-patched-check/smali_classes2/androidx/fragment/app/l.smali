.class public Landroidx/fragment/app/l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/l$h;,
        Landroidx/fragment/app/l$g;
    }
.end annotation


# static fields
.field public static final a:[I

.field public static final b:Ll/v5j;

.field public static final c:Ll/v5j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xb

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Landroidx/fragment/app/l;->a:[I

    .line 9
    .line 10
    new-instance v0, Ll/u5j;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/u5j;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Landroidx/fragment/app/l;->b:Ll/v5j;

    .line 16
    .line 17
    invoke-static {}, Landroidx/fragment/app/l;->x()Ll/v5j;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Landroidx/fragment/app/l;->c:Ll/v5j;

    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :array_0
    .array-data 4
        0x0
        0x3
        0x0
        0x1
        0x5
        0x4
        0x7
        0x6
        0x9
        0x8
        0xa
    .end array-data
.end method

.method public static A(Ll/v5j;Ljava/lang/Object;Ljava/lang/Object;Ll/l01;ZLandroidx/fragment/app/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z",
            "Landroidx/fragment/app/a;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p5, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p4, :cond_0

    .line 13
    .line 14
    iget-object p4, p5, Landroidx/fragment/app/k;->q:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    check-cast p4, Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p4, p5, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    check-cast p4, Ljava/lang/String;

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p3, p4}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    check-cast p3, Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p3}, Ll/v5j;->v(Ljava/lang/Object;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    if-eqz p2, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p2, p3}, Ll/v5j;->v(Ljava/lang/Object;Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public static B(Ljava/util/ArrayList;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    :goto_0
    if-ltz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    :goto_1
    return-void
.end method

.method public static C(Landroid/content/Context;Ll/o5j;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZLandroidx/fragment/app/l$g;)V
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/o5j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/o5j;",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;IIZ",
            "Landroidx/fragment/app/l$g;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    move v1, p4

    .line 7
    :goto_0
    if-ge v1, p5, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Landroidx/fragment/app/a;

    .line 14
    .line 15
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-static {v2, v0, p6}, Landroidx/fragment/app/l;->e(Landroidx/fragment/app/a;Landroid/util/SparseArray;Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    invoke-static {v2, v0, p6}, Landroidx/fragment/app/l;->c(Landroidx/fragment/app/a;Landroid/util/SparseArray;Z)V

    .line 32
    .line 33
    .line 34
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_5

    .line 42
    .line 43
    new-instance v1, Landroid/view/View;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    const/4 v2, 0x0

    .line 53
    :goto_2
    if-ge v2, p0, :cond_5

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->keyAt(I)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-static {v3, p2, p3, p4, p5}, Landroidx/fragment/app/l;->d(ILjava/util/ArrayList;Ljava/util/ArrayList;II)Ll/l01;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Landroidx/fragment/app/l$h;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/o5j;->d()Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-eqz v6, :cond_4

    .line 74
    .line 75
    invoke-virtual {p1, v3}, Ll/o5j;->c(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Landroid/view/ViewGroup;

    .line 80
    .line 81
    if-nez v3, :cond_2

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_2
    if-eqz p6, :cond_3

    .line 85
    .line 86
    invoke-static {v3, v5, v1, v4, p7}, Landroidx/fragment/app/l;->o(Landroid/view/ViewGroup;Landroidx/fragment/app/l$h;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$g;)V

    .line 87
    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_3
    invoke-static {v3, v5, v1, v4, p7}, Landroidx/fragment/app/l;->n(Landroid/view/ViewGroup;Landroidx/fragment/app/l$h;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$g;)V

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_5
    return-void
.end method

.method public static a(Ljava/util/ArrayList;Ll/l01;Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
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
    invoke-virtual {p1}, Ll/oof0;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/oof0;->m(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/view/View;

    .line 14
    .line 15
    invoke-static {v1}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {p2, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public static b(Landroidx/fragment/app/a;Landroidx/fragment/app/k$a;Landroid/util/SparseArray;ZZ)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/a;",
            "Landroidx/fragment/app/k$a;",
            "Landroid/util/SparseArray<",
            "Landroidx/fragment/app/l$h;",
            ">;ZZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/k$a;->b:Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_6

    .line 6
    .line 7
    :cond_0
    iget v1, v0, Landroidx/fragment/app/Fragment;->mContainerId:I

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    goto/16 :goto_6

    .line 12
    .line 13
    :cond_1
    iget p1, p1, Landroidx/fragment/app/k$a;->a:I

    .line 14
    .line 15
    if-eqz p3, :cond_2

    .line 16
    .line 17
    sget-object v2, Landroidx/fragment/app/l;->a:[I

    .line 18
    .line 19
    aget p1, v2, p1

    .line 20
    .line 21
    :cond_2
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-eq p1, v3, :cond_b

    .line 24
    .line 25
    const/4 v4, 0x3

    .line 26
    if-eq p1, v4, :cond_9

    .line 27
    .line 28
    const/4 v4, 0x4

    .line 29
    if-eq p1, v4, :cond_6

    .line 30
    .line 31
    const/4 v4, 0x5

    .line 32
    if-eq p1, v4, :cond_3

    .line 33
    .line 34
    const/4 v4, 0x6

    .line 35
    if-eq p1, v4, :cond_9

    .line 36
    .line 37
    const/4 v4, 0x7

    .line 38
    if-eq p1, v4, :cond_b

    .line 39
    .line 40
    move p1, v2

    .line 41
    move v3, p1

    .line 42
    move v4, v3

    .line 43
    goto/16 :goto_5

    .line 44
    .line 45
    :cond_3
    if-eqz p4, :cond_5

    .line 46
    .line 47
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHiddenChanged:Z

    .line 48
    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 52
    .line 53
    if-nez p1, :cond_4

    .line 54
    .line 55
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mAdded:Z

    .line 56
    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    :goto_0
    move p1, v3

    .line 60
    goto :goto_1

    .line 61
    :cond_4
    move p1, v2

    .line 62
    goto :goto_1

    .line 63
    :cond_5
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 64
    .line 65
    :goto_1
    move v4, v2

    .line 66
    move v2, p1

    .line 67
    move p1, v4

    .line 68
    goto :goto_5

    .line 69
    :cond_6
    if-eqz p4, :cond_8

    .line 70
    .line 71
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHiddenChanged:Z

    .line 72
    .line 73
    if-eqz p1, :cond_7

    .line 74
    .line 75
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mAdded:Z

    .line 76
    .line 77
    if-eqz p1, :cond_7

    .line 78
    .line 79
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 80
    .line 81
    if-eqz p1, :cond_7

    .line 82
    .line 83
    :goto_2
    move p1, v3

    .line 84
    goto :goto_3

    .line 85
    :cond_7
    move p1, v2

    .line 86
    goto :goto_3

    .line 87
    :cond_8
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mAdded:Z

    .line 88
    .line 89
    if-eqz p1, :cond_7

    .line 90
    .line 91
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 92
    .line 93
    if-nez p1, :cond_7

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :goto_3
    move v4, p1

    .line 97
    move p1, v3

    .line 98
    move v3, v2

    .line 99
    goto :goto_5

    .line 100
    :cond_9
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mAdded:Z

    .line 101
    .line 102
    if-eqz p4, :cond_a

    .line 103
    .line 104
    if-nez p1, :cond_7

    .line 105
    .line 106
    iget-object p1, v0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 107
    .line 108
    if-eqz p1, :cond_7

    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_7

    .line 115
    .line 116
    iget p1, v0, Landroidx/fragment/app/Fragment;->mPostponedAlpha:F

    .line 117
    .line 118
    const/4 v4, 0x0

    .line 119
    cmpl-float p1, p1, v4

    .line 120
    .line 121
    if-ltz p1, :cond_7

    .line 122
    .line 123
    :goto_4
    goto :goto_2

    .line 124
    :cond_a
    if-eqz p1, :cond_7

    .line 125
    .line 126
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 127
    .line 128
    if-nez p1, :cond_7

    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_b
    if-eqz p4, :cond_c

    .line 132
    .line 133
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mIsNewlyAdded:Z

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_c
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mAdded:Z

    .line 137
    .line 138
    if-nez p1, :cond_4

    .line 139
    .line 140
    iget-boolean p1, v0, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 141
    .line 142
    if-nez p1, :cond_4

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :goto_5
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    check-cast v5, Landroidx/fragment/app/l$h;

    .line 150
    .line 151
    if-eqz v2, :cond_d

    .line 152
    .line 153
    invoke-static {v5, p2, v1}, Landroidx/fragment/app/l;->p(Landroidx/fragment/app/l$h;Landroid/util/SparseArray;I)Landroidx/fragment/app/l$h;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    iput-object v0, v5, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 158
    .line 159
    iput-boolean p3, v5, Landroidx/fragment/app/l$h;->b:Z

    .line 160
    .line 161
    iput-object p0, v5, Landroidx/fragment/app/l$h;->c:Landroidx/fragment/app/a;

    .line 162
    .line 163
    :cond_d
    const/4 v2, 0x0

    .line 164
    if-nez p4, :cond_f

    .line 165
    .line 166
    if-eqz v3, :cond_f

    .line 167
    .line 168
    if-eqz v5, :cond_e

    .line 169
    .line 170
    iget-object v3, v5, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 171
    .line 172
    if-ne v3, v0, :cond_e

    .line 173
    .line 174
    iput-object v2, v5, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 175
    .line 176
    :cond_e
    iget-boolean v3, p0, Landroidx/fragment/app/k;->r:Z

    .line 177
    .line 178
    if-nez v3, :cond_f

    .line 179
    .line 180
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/FragmentManager;

    .line 181
    .line 182
    invoke-virtual {v3, v0}, Landroidx/fragment/app/FragmentManager;->v(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/h;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->s0()Landroidx/fragment/app/j;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    invoke-virtual {v7, v6}, Landroidx/fragment/app/j;->p(Landroidx/fragment/app/h;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v3, v0}, Landroidx/fragment/app/FragmentManager;->S0(Landroidx/fragment/app/Fragment;)V

    .line 194
    .line 195
    .line 196
    :cond_f
    if-eqz v4, :cond_11

    .line 197
    .line 198
    if-eqz v5, :cond_10

    .line 199
    .line 200
    iget-object v3, v5, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 201
    .line 202
    if-nez v3, :cond_11

    .line 203
    .line 204
    :cond_10
    invoke-static {v5, p2, v1}, Landroidx/fragment/app/l;->p(Landroidx/fragment/app/l$h;Landroid/util/SparseArray;I)Landroidx/fragment/app/l$h;

    .line 205
    .line 206
    .line 207
    move-result-object v5

    .line 208
    iput-object v0, v5, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 209
    .line 210
    iput-boolean p3, v5, Landroidx/fragment/app/l$h;->e:Z

    .line 211
    .line 212
    iput-object p0, v5, Landroidx/fragment/app/l$h;->f:Landroidx/fragment/app/a;

    .line 213
    .line 214
    :cond_11
    if-nez p4, :cond_12

    .line 215
    .line 216
    if-eqz p1, :cond_12

    .line 217
    .line 218
    if-eqz v5, :cond_12

    .line 219
    .line 220
    iget-object p0, v5, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 221
    .line 222
    if-ne p0, v0, :cond_12

    .line 223
    .line 224
    iput-object v2, v5, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 225
    .line 226
    :cond_12
    :goto_6
    return-void
.end method

.method public static c(Landroidx/fragment/app/a;Landroid/util/SparseArray;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/a;",
            "Landroid/util/SparseArray<",
            "Landroidx/fragment/app/l$h;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/k;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_0

    .line 10
    .line 11
    iget-object v3, p0, Landroidx/fragment/app/k;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Landroidx/fragment/app/k$a;

    .line 18
    .line 19
    invoke-static {p0, v3, p1, v1, p2}, Landroidx/fragment/app/l;->b(Landroidx/fragment/app/a;Landroidx/fragment/app/k$a;Landroid/util/SparseArray;ZZ)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public static d(ILjava/util/ArrayList;Ljava/util/ArrayList;II)Ll/l01;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;II)",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l01;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    add-int/lit8 p4, p4, -0x1

    .line 7
    .line 8
    :goto_0
    if-lt p4, p3, :cond_4

    .line 9
    .line 10
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroidx/fragment/app/a;

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Landroidx/fragment/app/a;->H(I)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    goto :goto_4

    .line 23
    :cond_0
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v3, v1, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 34
    .line 35
    if-eqz v3, :cond_3

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    iget-object v4, v1, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    iget-object v1, v1, Landroidx/fragment/app/k;->q:Ljava/util/ArrayList;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget-object v1, v1, Landroidx/fragment/app/k;->q:Ljava/util/ArrayList;

    .line 49
    .line 50
    move-object v8, v4

    .line 51
    move-object v4, v1

    .line 52
    move-object v1, v8

    .line 53
    :goto_1
    const/4 v2, 0x0

    .line 54
    :goto_2
    if-ge v2, v3, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    check-cast v6, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v6}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    check-cast v7, Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v7, :cond_2

    .line 75
    .line 76
    invoke-virtual {v0, v5, v7}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_2
    invoke-virtual {v0, v5, v6}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    :goto_4
    add-int/lit8 p4, p4, -0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    return-object v0
.end method

.method public static e(Landroidx/fragment/app/a;Landroid/util/SparseArray;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/a;",
            "Landroid/util/SparseArray<",
            "Landroidx/fragment/app/l$h;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->o0()Ll/o5j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/o5j;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p0, Landroidx/fragment/app/k;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    sub-int/2addr v0, v1

    .line 22
    :goto_0
    if-ltz v0, :cond_1

    .line 23
    .line 24
    iget-object v2, p0, Landroidx/fragment/app/k;->c:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroidx/fragment/app/k$a;

    .line 31
    .line 32
    invoke-static {p0, v2, p1, v1, p2}, Landroidx/fragment/app/l;->b(Landroidx/fragment/app/a;Landroidx/fragment/app/k$a;Landroid/util/SparseArray;ZZ)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    return-void
.end method

.method public static f(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLl/l01;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/Fragment;",
            "Landroidx/fragment/app/Fragment;",
            "Z",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Ll/j3f0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Ll/j3f0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    if-eqz p0, :cond_4

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance p2, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    if-nez p3, :cond_1

    .line 26
    .line 27
    move v1, v0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p3}, Ll/oof0;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    :goto_1
    if-ge v0, v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p3, v0}, Ll/oof0;->i(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3, v0}, Ll/oof0;->m(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    const/4 p3, 0x0

    .line 53
    if-eqz p4, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0, p2, p1, p3}, Ll/j3f0;->g(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    invoke-virtual {p0, p2, p1, p3}, Ll/j3f0;->f(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    :cond_4
    return-void
.end method

.method public static g(Ll/v5j;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {p0, v3}, Ll/v5j;->e(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public static h(Ll/v5j;Ll/l01;Ljava/lang/Object;Landroidx/fragment/app/l$h;)Ll/l01;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Landroidx/fragment/app/l$h;",
            ")",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p3, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1}, Ll/oof0;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_7

    .line 12
    .line 13
    if-eqz p2, :cond_7

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_3

    .line 18
    :cond_0
    new-instance p2, Ll/l01;

    .line 19
    .line 20
    invoke-direct {p2}, Ll/l01;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2, v1}, Ll/v5j;->j(Ljava/util/Map;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p3, Landroidx/fragment/app/l$h;->c:Landroidx/fragment/app/a;

    .line 27
    .line 28
    iget-boolean p3, p3, Landroidx/fragment/app/l$h;->b:Z

    .line 29
    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()Ll/j3f0;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    iget-object p0, p0, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Ll/j3f0;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    iget-object p0, p0, Landroidx/fragment/app/k;->q:Ljava/util/ArrayList;

    .line 44
    .line 45
    :goto_0
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p2, p0}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ll/l01;->values()Ljava/util/Collection;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p2, v0}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    :cond_2
    if-eqz p3, :cond_6

    .line 58
    .line 59
    invoke-virtual {p3, p0, p2}, Ll/j3f0;->d(Ljava/util/List;Ljava/util/Map;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    add-int/lit8 p3, p3, -0x1

    .line 67
    .line 68
    :goto_1
    if-ltz p3, :cond_5

    .line 69
    .line 70
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Landroid/view/View;

    .line 81
    .line 82
    if-nez v1, :cond_3

    .line 83
    .line 84
    invoke-static {p1, v0}, Landroidx/fragment/app/l;->q(Ll/l01;Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    invoke-static {v1}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_4

    .line 103
    .line 104
    invoke-static {p1, v0}, Landroidx/fragment/app/l;->q(Ll/l01;Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    if-eqz v0, :cond_4

    .line 109
    .line 110
    invoke-static {v1}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {p1, v0, v1}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    :cond_4
    :goto_2
    add-int/lit8 p3, p3, -0x1

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    return-object p2

    .line 121
    :cond_6
    invoke-static {p1, p2}, Landroidx/fragment/app/l;->y(Ll/l01;Ll/l01;)V

    .line 122
    .line 123
    .line 124
    return-object p2

    .line 125
    :cond_7
    :goto_3
    invoke-virtual {p1}, Ll/oof0;->clear()V

    .line 126
    .line 127
    .line 128
    const/4 p0, 0x0

    .line 129
    return-object p0
.end method

.method public static i(Ll/v5j;Ll/l01;Ljava/lang/Object;Landroidx/fragment/app/l$h;)Ll/l01;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Landroidx/fragment/app/l$h;",
            ")",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/oof0;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_7

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    iget-object p2, p3, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    new-instance v0, Ll/l01;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->requireView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v0, v1}, Ll/v5j;->j(Ljava/util/Map;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p3, Landroidx/fragment/app/l$h;->f:Landroidx/fragment/app/a;

    .line 25
    .line 26
    iget-boolean p3, p3, Landroidx/fragment/app/l$h;->e:Z

    .line 27
    .line 28
    if-eqz p3, :cond_1

    .line 29
    .line 30
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getEnterTransitionCallback()Ll/j3f0;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object p0, p0, Landroidx/fragment/app/k;->q:Ljava/util/ArrayList;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getExitTransitionCallback()Ll/j3f0;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iget-object p0, p0, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 42
    .line 43
    :goto_0
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    :cond_2
    if-eqz p2, :cond_6

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Ll/j3f0;->d(Ljava/util/List;Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    add-int/lit8 p2, p2, -0x1

    .line 58
    .line 59
    :goto_1
    if-ltz p2, :cond_5

    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    check-cast p3, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, p3}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Landroid/view/View;

    .line 72
    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    invoke-virtual {p1, p3}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_3
    invoke-static {v1}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_4

    .line 88
    .line 89
    invoke-virtual {p1, p3}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    check-cast p3, Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1}, Ll/kkl0;->F(Landroid/view/View;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {p1, v1, p3}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_2
    add-int/lit8 p2, p2, -0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_5
    return-object v0

    .line 106
    :cond_6
    invoke-virtual {v0}, Ll/l01;->keySet()Ljava/util/Set;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p1, p0}, Ll/l01;->o(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    return-object v0

    .line 114
    :cond_7
    :goto_3
    invoke-virtual {p1}, Ll/oof0;->clear()V

    .line 115
    .line 116
    .line 117
    const/4 p0, 0x0

    .line 118
    return-object p0
.end method

.method public static j(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;)Ll/v5j;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getExitTransition()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getReturnTransition()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getSharedElementReturnTransition()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_2
    if-eqz p1, :cond_5

    .line 36
    .line 37
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getEnterTransition()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getReenterTransition()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    if-eqz p0, :cond_4

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    :cond_4
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getSharedElementEnterTransition()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/4 p1, 0x0

    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    return-object p1

    .line 72
    :cond_6
    sget-object p0, Landroidx/fragment/app/l;->b:Ll/v5j;

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    invoke-static {p0, v0}, Landroidx/fragment/app/l;->g(Ll/v5j;Ljava/util/List;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_7

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_7
    sget-object v1, Landroidx/fragment/app/l;->c:Ll/v5j;

    .line 84
    .line 85
    if-eqz v1, :cond_8

    .line 86
    .line 87
    invoke-static {v1, v0}, Landroidx/fragment/app/l;->g(Ll/v5j;Ljava/util/List;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_8

    .line 92
    .line 93
    return-object v1

    .line 94
    :cond_8
    if-nez p0, :cond_9

    .line 95
    .line 96
    if-nez v1, :cond_9

    .line 97
    .line 98
    return-object p1

    .line 99
    :cond_9
    const-string p0, "Invalid Transition types"

    .line 100
    .line 101
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-object p1
.end method

.method public static k(Ll/v5j;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Ljava/lang/Object;",
            "Landroidx/fragment/app/Fragment;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v0, p2}, Ll/v5j;->f(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    if-eqz p3, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1, v0}, Ll/v5j;->b(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-object v0

    .line 35
    :cond_3
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public static l(Ll/v5j;Landroid/view/ViewGroup;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/fragment/app/l$h;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    move-object/from16 v6, p4

    .line 2
    .line 3
    move-object/from16 v10, p5

    .line 4
    .line 5
    move-object/from16 v11, p7

    .line 6
    .line 7
    iget-object v7, v6, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    iget-object v8, v6, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v7, :cond_6

    .line 13
    .line 14
    if-nez v8, :cond_0

    .line 15
    .line 16
    goto/16 :goto_4

    .line 17
    .line 18
    :cond_0
    iget-boolean v9, v6, Landroidx/fragment/app/l$h;->b:Z

    .line 19
    .line 20
    invoke-virtual/range {p3 .. p3}, Ll/oof0;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    move-object v2, v1

    .line 27
    :goto_0
    move-object/from16 v12, p3

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {p0, v7, v8, v9}, Landroidx/fragment/app/l;->u(Ll/v5j;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    invoke-static {p0, v12, v2, v6}, Landroidx/fragment/app/l;->i(Ll/v5j;Ll/l01;Ljava/lang/Object;Landroidx/fragment/app/l$h;)Ll/l01;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v12}, Ll/oof0;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    move-object v2, v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-virtual {v3}, Ll/l01;->values()Ljava/util/Collection;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    :goto_2
    if-nez v11, :cond_3

    .line 55
    .line 56
    if-nez p8, :cond_3

    .line 57
    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    return-object v1

    .line 61
    :cond_3
    const/4 v4, 0x1

    .line 62
    invoke-static {v7, v8, v9, v3, v4}, Landroidx/fragment/app/l;->f(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLl/l01;Z)V

    .line 63
    .line 64
    .line 65
    if-eqz v2, :cond_5

    .line 66
    .line 67
    new-instance v13, Landroid/graphics/Rect;

    .line 68
    .line 69
    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 70
    .line 71
    .line 72
    move-object/from16 v14, p2

    .line 73
    .line 74
    invoke-virtual {p0, v2, v14, v10}, Ll/v5j;->z(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 75
    .line 76
    .line 77
    iget-boolean v4, v6, Landroidx/fragment/app/l$h;->e:Z

    .line 78
    .line 79
    iget-object v5, v6, Landroidx/fragment/app/l$h;->f:Landroidx/fragment/app/a;

    .line 80
    .line 81
    move-object v0, p0

    .line 82
    move-object v1, v2

    .line 83
    move-object/from16 v2, p8

    .line 84
    .line 85
    invoke-static/range {v0 .. v5}, Landroidx/fragment/app/l;->A(Ll/v5j;Ljava/lang/Object;Ljava/lang/Object;Ll/l01;ZLandroidx/fragment/app/a;)V

    .line 86
    .line 87
    .line 88
    move-object v3, v1

    .line 89
    if-eqz v11, :cond_4

    .line 90
    .line 91
    invoke-virtual {p0, v11, v13}, Ll/v5j;->u(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 92
    .line 93
    .line 94
    :cond_4
    move-object v1, v13

    .line 95
    goto :goto_3

    .line 96
    :cond_5
    move-object/from16 v14, p2

    .line 97
    .line 98
    move-object v3, v2

    .line 99
    :goto_3
    new-instance v0, Landroidx/fragment/app/l$f;

    .line 100
    .line 101
    move-object/from16 v5, p6

    .line 102
    .line 103
    move-object v4, v6

    .line 104
    move-object v2, v12

    .line 105
    move-object v6, v14

    .line 106
    move-object v12, v1

    .line 107
    move-object v1, p0

    .line 108
    invoke-direct/range {v0 .. v12}, Landroidx/fragment/app/l$f;-><init>(Ll/v5j;Ll/l01;Ljava/lang/Object;Landroidx/fragment/app/l$h;Ljava/util/ArrayList;Landroid/view/View;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLjava/util/ArrayList;Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 109
    .line 110
    .line 111
    move-object v1, v0

    .line 112
    move-object/from16 v0, p1

    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 115
    .line 116
    .line 117
    return-object v3

    .line 118
    :cond_6
    :goto_4
    return-object v1
.end method

.method public static m(Ll/v5j;Landroid/view/ViewGroup;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/fragment/app/l$h;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p2

    .line 2
    .line 3
    move-object/from16 v2, p3

    .line 4
    .line 5
    move-object/from16 v6, p4

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    move-object/from16 v4, p6

    .line 10
    .line 11
    move-object/from16 v7, p7

    .line 12
    .line 13
    iget-object v8, v6, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    iget-object v9, v6, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 16
    .line 17
    if-eqz v8, :cond_0

    .line 18
    .line 19
    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->requireView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    const/4 v10, 0x0

    .line 24
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 v5, 0x0

    .line 28
    if-eqz v8, :cond_9

    .line 29
    .line 30
    if-nez v9, :cond_1

    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_1
    iget-boolean v10, v6, Landroidx/fragment/app/l$h;->b:Z

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/oof0;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v11

    .line 40
    if-eqz v11, :cond_2

    .line 41
    .line 42
    move-object v11, v5

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-static {p0, v8, v9, v10}, Landroidx/fragment/app/l;->u(Ll/v5j;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v11

    .line 48
    :goto_0
    invoke-static {p0, v2, v11, v6}, Landroidx/fragment/app/l;->i(Ll/v5j;Ll/l01;Ljava/lang/Object;Landroidx/fragment/app/l$h;)Ll/l01;

    .line 49
    .line 50
    .line 51
    move-result-object v12

    .line 52
    invoke-static {p0, v2, v11, v6}, Landroidx/fragment/app/l;->h(Ll/v5j;Ll/l01;Ljava/lang/Object;Landroidx/fragment/app/l$h;)Ll/l01;

    .line 53
    .line 54
    .line 55
    move-result-object v13

    .line 56
    invoke-virtual {v2}, Ll/oof0;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v14

    .line 60
    if-eqz v14, :cond_5

    .line 61
    .line 62
    if-eqz v12, :cond_3

    .line 63
    .line 64
    invoke-virtual {v12}, Ll/oof0;->clear()V

    .line 65
    .line 66
    .line 67
    :cond_3
    if-eqz v13, :cond_4

    .line 68
    .line 69
    invoke-virtual {v13}, Ll/oof0;->clear()V

    .line 70
    .line 71
    .line 72
    :cond_4
    move-object v11, v5

    .line 73
    goto :goto_1

    .line 74
    :cond_5
    invoke-virtual {v2}, Ll/l01;->keySet()Ljava/util/Set;

    .line 75
    .line 76
    .line 77
    move-result-object v14

    .line 78
    invoke-static {v3, v12, v14}, Landroidx/fragment/app/l;->a(Ljava/util/ArrayList;Ll/l01;Ljava/util/Collection;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ll/l01;->values()Ljava/util/Collection;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v4, v13, v2}, Landroidx/fragment/app/l;->a(Ljava/util/ArrayList;Ll/l01;Ljava/util/Collection;)V

    .line 86
    .line 87
    .line 88
    :goto_1
    if-nez v7, :cond_6

    .line 89
    .line 90
    if-nez p8, :cond_6

    .line 91
    .line 92
    if-nez v11, :cond_6

    .line 93
    .line 94
    return-object v5

    .line 95
    :cond_6
    const/4 v2, 0x1

    .line 96
    invoke-static {v8, v9, v10, v12, v2}, Landroidx/fragment/app/l;->f(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLl/l01;Z)V

    .line 97
    .line 98
    .line 99
    if-eqz v11, :cond_8

    .line 100
    .line 101
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v11, v1, v3}, Ll/v5j;->z(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 105
    .line 106
    .line 107
    iget-boolean v4, v6, Landroidx/fragment/app/l$h;->e:Z

    .line 108
    .line 109
    iget-object v5, v6, Landroidx/fragment/app/l$h;->f:Landroidx/fragment/app/a;

    .line 110
    .line 111
    move-object v0, p0

    .line 112
    move-object/from16 v2, p8

    .line 113
    .line 114
    move-object v1, v11

    .line 115
    move-object v3, v12

    .line 116
    invoke-static/range {v0 .. v5}, Landroidx/fragment/app/l;->A(Ll/v5j;Ljava/lang/Object;Ljava/lang/Object;Ll/l01;ZLandroidx/fragment/app/a;)V

    .line 117
    .line 118
    .line 119
    new-instance v5, Landroid/graphics/Rect;

    .line 120
    .line 121
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-static {v13, v6, v7, v10}, Landroidx/fragment/app/l;->t(Ll/l01;Landroidx/fragment/app/l$h;Ljava/lang/Object;Z)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    if-eqz v1, :cond_7

    .line 129
    .line 130
    invoke-virtual {p0, v7, v5}, Ll/v5j;->u(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 131
    .line 132
    .line 133
    :cond_7
    move-object v7, v5

    .line 134
    move-object v5, v1

    .line 135
    goto :goto_2

    .line 136
    :cond_8
    move-object v7, v5

    .line 137
    :goto_2
    new-instance v0, Landroidx/fragment/app/l$e;

    .line 138
    .line 139
    move-object v6, p0

    .line 140
    move-object v1, v8

    .line 141
    move-object v2, v9

    .line 142
    move v3, v10

    .line 143
    move-object v4, v13

    .line 144
    invoke-direct/range {v0 .. v7}, Landroidx/fragment/app/l$e;-><init>(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLl/l01;Landroid/view/View;Ll/v5j;Landroid/graphics/Rect;)V

    .line 145
    .line 146
    .line 147
    move-object v1, v0

    .line 148
    move-object/from16 v0, p1

    .line 149
    .line 150
    invoke-static {v0, v1}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 151
    .line 152
    .line 153
    return-object v11

    .line 154
    :cond_9
    :goto_3
    return-object v5
.end method

.method public static n(Landroid/view/ViewGroup;Landroidx/fragment/app/l$h;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$g;)V
    .locals 16
    .param p0    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Landroidx/fragment/app/l$h;",
            "Landroid/view/View;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/fragment/app/l$g;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v4, p1

    .line 2
    .line 3
    move-object/from16 v9, p4

    .line 4
    .line 5
    iget-object v10, v4, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    iget-object v11, v4, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    invoke-static {v11, v10}, Landroidx/fragment/app/l;->j(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;)Ll/v5j;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    iget-boolean v1, v4, Landroidx/fragment/app/l$h;->b:Z

    .line 18
    .line 19
    iget-boolean v2, v4, Landroidx/fragment/app/l$h;->e:Z

    .line 20
    .line 21
    invoke-static {v0, v10, v1}, Landroidx/fragment/app/l;->r(Ll/v5j;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v11, v2}, Landroidx/fragment/app/l;->s(Ll/v5j;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    new-instance v5, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v6, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    move-object/from16 v2, p2

    .line 40
    .line 41
    move-object/from16 v3, p3

    .line 42
    .line 43
    move-object v7, v1

    .line 44
    move-object/from16 v1, p0

    .line 45
    .line 46
    invoke-static/range {v0 .. v8}, Landroidx/fragment/app/l;->l(Ll/v5j;Landroid/view/ViewGroup;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v12

    .line 50
    move-object v13, v2

    .line 51
    move-object v14, v3

    .line 52
    move-object v1, v7

    .line 53
    move-object v7, v6

    .line 54
    move-object v6, v5

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    if-nez v12, :cond_1

    .line 58
    .line 59
    if-nez v8, :cond_1

    .line 60
    .line 61
    goto/16 :goto_3

    .line 62
    .line 63
    :cond_1
    invoke-static {v0, v8, v11, v6, v13}, Landroidx/fragment/app/l;->k(Ll/v5j;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v15

    .line 67
    if-eqz v15, :cond_3

    .line 68
    .line 69
    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    :goto_0
    move-object v2, v8

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    :goto_1
    const/4 v8, 0x0

    .line 79
    goto :goto_0

    .line 80
    :goto_2
    invoke-virtual {v0, v1, v13}, Ll/v5j;->a(Ljava/lang/Object;Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-boolean v5, v4, Landroidx/fragment/app/l$h;->b:Z

    .line 84
    .line 85
    move-object v4, v10

    .line 86
    move-object v3, v12

    .line 87
    invoke-static/range {v0 .. v5}, Landroidx/fragment/app/l;->v(Ll/v5j;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    move-object v8, v4

    .line 92
    if-eqz v11, :cond_5

    .line 93
    .line 94
    if-eqz v15, :cond_5

    .line 95
    .line 96
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-gtz v4, :cond_4

    .line 101
    .line 102
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-lez v4, :cond_5

    .line 107
    .line 108
    :cond_4
    new-instance v4, Ll/fg4;

    .line 109
    .line 110
    invoke-direct {v4}, Ll/fg4;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-interface {v9, v11, v4}, Landroidx/fragment/app/l$g;->b(Landroidx/fragment/app/Fragment;Ll/fg4;)V

    .line 114
    .line 115
    .line 116
    new-instance v6, Landroidx/fragment/app/l$c;

    .line 117
    .line 118
    invoke-direct {v6, v9, v11, v4}, Landroidx/fragment/app/l$c;-><init>(Landroidx/fragment/app/l$g;Landroidx/fragment/app/Fragment;Ll/fg4;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v11, v5, v4, v6}, Ll/v5j;->w(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Ll/fg4;Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    :cond_5
    if-eqz v5, :cond_6

    .line 125
    .line 126
    new-instance v6, Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .line 130
    .line 131
    move-object v4, v6

    .line 132
    move-object v6, v3

    .line 133
    move-object v3, v4

    .line 134
    move-object v4, v2

    .line 135
    move-object v2, v1

    .line 136
    move-object v1, v5

    .line 137
    move-object v5, v15

    .line 138
    invoke-virtual/range {v0 .. v7}, Ll/v5j;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 139
    .line 140
    .line 141
    move-object v6, v5

    .line 142
    move-object v5, v2

    .line 143
    move-object v2, v8

    .line 144
    move-object v8, v6

    .line 145
    move-object v6, v7

    .line 146
    move-object v7, v4

    .line 147
    move-object v4, v6

    .line 148
    move-object v9, v1

    .line 149
    move-object v6, v3

    .line 150
    move-object v3, v13

    .line 151
    move-object/from16 v1, p0

    .line 152
    .line 153
    invoke-static/range {v0 .. v8}, Landroidx/fragment/app/l;->z(Ll/v5j;Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 154
    .line 155
    .line 156
    move-object v7, v4

    .line 157
    invoke-virtual {v0, v1, v7, v14}, Ll/v5j;->x(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v1, v9}, Ll/v5j;->c(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v1, v7, v14}, Ll/v5j;->s(Landroid/view/ViewGroup;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 164
    .line 165
    .line 166
    :cond_6
    :goto_3
    return-void
.end method

.method public static o(Landroid/view/ViewGroup;Landroidx/fragment/app/l$h;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$g;)V
    .locals 14
    .param p0    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Landroidx/fragment/app/l$h;",
            "Landroid/view/View;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/fragment/app/l$g;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v9, p4

    .line 2
    .line 3
    iget-object v10, p1, Landroidx/fragment/app/l$h;->a:Landroidx/fragment/app/Fragment;

    .line 4
    .line 5
    iget-object v11, p1, Landroidx/fragment/app/l$h;->d:Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    invoke-static {v11, v10}, Landroidx/fragment/app/l;->j(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;)Ll/v5j;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    iget-boolean v12, p1, Landroidx/fragment/app/l$h;->b:Z

    .line 16
    .line 17
    iget-boolean v1, p1, Landroidx/fragment/app/l$h;->e:Z

    .line 18
    .line 19
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v10, v12}, Landroidx/fragment/app/l;->r(Ll/v5j;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-static {v0, v11, v1}, Landroidx/fragment/app/l;->s(Ll/v5j;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    move-object v1, p0

    .line 38
    move-object v4, p1

    .line 39
    move-object v5, v2

    .line 40
    move-object v6, v3

    .line 41
    move-object/from16 v2, p2

    .line 42
    .line 43
    move-object/from16 v3, p3

    .line 44
    .line 45
    invoke-static/range {v0 .. v8}, Landroidx/fragment/app/l;->m(Ll/v5j;Landroid/view/ViewGroup;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    move-object v1, v7

    .line 50
    move-object v3, v8

    .line 51
    move-object v8, v5

    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    if-nez v4, :cond_1

    .line 55
    .line 56
    if-nez v3, :cond_1

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :cond_1
    invoke-static {v0, v3, v11, v8, v2}, Landroidx/fragment/app/l;->k(Ll/v5j;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-static {v0, v1, v10, v6, v2}, Landroidx/fragment/app/l;->k(Ll/v5j;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object v13

    .line 68
    const/4 v2, 0x4

    .line 69
    invoke-static {v13, v2}, Landroidx/fragment/app/l;->B(Ljava/util/ArrayList;I)V

    .line 70
    .line 71
    .line 72
    move-object v2, v3

    .line 73
    move-object v3, v4

    .line 74
    move-object v4, v10

    .line 75
    move v5, v12

    .line 76
    invoke-static/range {v0 .. v5}, Landroidx/fragment/app/l;->v(Ll/v5j;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    if-eqz v11, :cond_3

    .line 81
    .line 82
    if-eqz v7, :cond_3

    .line 83
    .line 84
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-gtz v5, :cond_2

    .line 89
    .line 90
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-lez v5, :cond_3

    .line 95
    .line 96
    :cond_2
    new-instance v5, Ll/fg4;

    .line 97
    .line 98
    invoke-direct {v5}, Ll/fg4;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-interface {v9, v11, v5}, Landroidx/fragment/app/l$g;->b(Landroidx/fragment/app/Fragment;Ll/fg4;)V

    .line 102
    .line 103
    .line 104
    new-instance v10, Landroidx/fragment/app/l$a;

    .line 105
    .line 106
    invoke-direct {v10, v9, v11, v5}, Landroidx/fragment/app/l$a;-><init>(Landroidx/fragment/app/l$g;Landroidx/fragment/app/Fragment;Ll/fg4;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v11, v4, v5, v10}, Ll/v5j;->w(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Ll/fg4;Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    if-eqz v4, :cond_4

    .line 113
    .line 114
    invoke-static {v0, v2, v11, v7}, Landroidx/fragment/app/l;->w(Ll/v5j;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v6}, Ll/v5j;->o(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    move-object v5, v2

    .line 122
    move-object v2, v1

    .line 123
    move-object v1, v4

    .line 124
    move-object v4, v5

    .line 125
    move-object v5, v7

    .line 126
    move-object v7, v6

    .line 127
    move-object v6, v3

    .line 128
    move-object v3, v13

    .line 129
    invoke-virtual/range {v0 .. v7}, Ll/v5j;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 130
    .line 131
    .line 132
    move-object v2, v7

    .line 133
    move-object v7, v6

    .line 134
    move-object v6, v2

    .line 135
    move-object v2, v1

    .line 136
    move-object v10, v3

    .line 137
    invoke-virtual {v0, p0, v2}, Ll/v5j;->c(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    move-object v1, p0

    .line 141
    move-object/from16 v5, p3

    .line 142
    .line 143
    move-object v3, v6

    .line 144
    move-object v2, v8

    .line 145
    move-object v4, v9

    .line 146
    invoke-virtual/range {v0 .. v5}, Ll/v5j;->y(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 147
    .line 148
    .line 149
    const/4 v1, 0x0

    .line 150
    invoke-static {v10, v1}, Landroidx/fragment/app/l;->B(Ljava/util/ArrayList;I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v7, v2, v6}, Ll/v5j;->A(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 154
    .line 155
    .line 156
    :cond_4
    :goto_0
    return-void
.end method

.method public static p(Landroidx/fragment/app/l$h;Landroid/util/SparseArray;I)Landroidx/fragment/app/l$h;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/l$h;",
            "Landroid/util/SparseArray<",
            "Landroidx/fragment/app/l$h;",
            ">;I)",
            "Landroidx/fragment/app/l$h;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Landroidx/fragment/app/l$h;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/fragment/app/l$h;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public static q(Ll/l01;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/oof0;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/oof0;->m(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/oof0;->i(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/String;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public static r(Ll/v5j;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getReenterTransition()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getEnterTransition()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Ll/v5j;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static s(Ll/v5j;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getReturnTransition()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getExitTransition()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Ll/v5j;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static t(Ll/l01;Landroidx/fragment/app/l$h;Ljava/lang/Object;Z)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroidx/fragment/app/l$h;",
            "Ljava/lang/Object;",
            "Z)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Landroidx/fragment/app/l$h;->c:Landroidx/fragment/app/a;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p2, p1, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    iget-object p1, p1, Landroidx/fragment/app/k;->p:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p1, Landroidx/fragment/app/k;->q:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/lang/String;

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/view/View;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method public static u(Ll/v5j;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    if-eqz p3, :cond_1

    .line 7
    .line 8
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getSharedElementReturnTransition()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getSharedElementEnterTransition()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :goto_0
    invoke-virtual {p0, p1}, Ll/v5j;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/v5j;->B(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static v(Ll/v5j;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Z)Ljava/lang/Object;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    if-eqz p4, :cond_1

    .line 6
    .line 7
    if-eqz p5, :cond_0

    .line 8
    .line 9
    invoke-virtual {p4}, Landroidx/fragment/app/Fragment;->getAllowReturnTransitionOverlap()Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p4}, Landroidx/fragment/app/Fragment;->getAllowEnterTransitionOverlap()Z

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p4, 0x1

    .line 20
    :goto_0
    if-eqz p4, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1, p3}, Ll/v5j;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_2
    invoke-virtual {p0, p2, p1, p3}, Ll/v5j;->m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static w(Ll/v5j;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Ljava/lang/Object;",
            "Landroidx/fragment/app/Fragment;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p2, Landroidx/fragment/app/Fragment;->mAdded:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p2, Landroidx/fragment/app/Fragment;->mHidden:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p2, Landroidx/fragment/app/Fragment;->mHiddenChanged:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Landroidx/fragment/app/Fragment;->setHideReplaced(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, p1, v0, p3}, Ll/v5j;->r(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p2, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    .line 29
    .line 30
    new-instance p1, Landroidx/fragment/app/l$b;

    .line 31
    .line 32
    invoke-direct {p1, p3}, Landroidx/fragment/app/l$b;-><init>(Ljava/util/ArrayList;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static x()Ll/v5j;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-class v1, Ll/w5j;

    .line 3
    .line 4
    invoke-virtual {v1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/v5j;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :catch_0
    return-object v0
.end method

.method public static y(Ll/l01;Ll/l01;)V
    .locals 2
    .param p0    # Ll/l01;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/l01;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/l01<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/oof0;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/oof0;->m(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Ll/oof0;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/oof0;->k(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method

.method public static z(Ll/v5j;Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5j;",
            "Landroid/view/ViewGroup;",
            "Landroidx/fragment/app/Fragment;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/fragment/app/l$d;

    .line 2
    .line 3
    move-object v2, p0

    .line 4
    move-object v4, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v1, p5

    .line 8
    move-object v6, p6

    .line 9
    move-object/from16 v8, p7

    .line 10
    .line 11
    move-object/from16 v7, p8

    .line 12
    .line 13
    invoke-direct/range {v0 .. v8}, Landroidx/fragment/app/l$d;-><init>(Ljava/lang/Object;Ll/v5j;Landroid/view/View;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/eq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/eq50;

    .line 17
    .line 18
    .line 19
    return-void
.end method
