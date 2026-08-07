.class public Ll/rna0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mna0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public g:Ll/mna0;

.field public h:Landroid/content/Context;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

.field public j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:Lcom/p1/mobile/putong/data/User;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public q:Lcom/p1/mobile/putong/data/Picture;

.field public r:Ll/cya0;

.field public s:I

.field public t:I

.field public final u:I

.field public v:Ljava/lang/String;

.field public w:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/rna0;->l:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {}, Ll/xra;->w()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/16 v0, 0x9

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x6

    .line 24
    :goto_0
    iput v0, p0, Ll/rna0;->u:I

    .line 25
    .line 26
    iput-object p1, p0, Ll/rna0;->h:Landroid/content/Context;

    .line 27
    .line 28
    iput-object p2, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Ll/rna0;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rna0;->s(IZ)V

    return-void
.end method

.method public static synthetic b(Ll/rna0;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rna0;->u(II)V

    return-void
.end method

.method public static synthetic c(Ll/rna0;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rna0;->v(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Ll/rna0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rna0;->w(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rna0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rna0;->n()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/tr90;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v0, v1, v2}, Ll/tr90;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/rna0;->a:Lv/VLinear;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/tr90;->u(Landroid/view/ViewGroup;Z)Landroid/util/Pair;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Landroid/view/View;

    .line 41
    .line 42
    sget v3, Ll/gdc0;->l:I

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/16 v3, 0x8

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 56
    .line 57
    iput-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setEnableDrag(Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setClickEnable(Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 74
    .line 75
    const-string v2, "p_tantanx_pet_photo_normalguide"

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 81
    .line 82
    iget v2, p0, Ll/rna0;->u:I

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/rna0;->b:Lv/VText;

    .line 88
    .line 89
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/rna0;->a:Lv/VLinear;

    .line 100
    .line 101
    const/4 v1, 0x4

    .line 102
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 106
    .line 107
    new-instance v1, Ll/ona0;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/ona0;-><init>(Ll/rna0;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setUploadListener(Lcom/p1/mobile/putong/core/ui/profile/VReorderCards$b;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final A(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v1, p0, Ll/rna0;->u:I

    .line 21
    .line 22
    if-ge v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Ll/rna0;->p:Ljava/util/List;

    .line 25
    .line 26
    new-instance v2, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 35
    .line 36
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/4 v3, 0x3

    .line 41
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/rna0;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 45
    .line 46
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 47
    .line 48
    .line 49
    new-instance v3, Ll/cya0;

    .line 50
    .line 51
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-object v5, p0, Ll/rna0;->p:Ljava/util/List;

    .line 56
    .line 57
    iget v7, p0, Ll/rna0;->u:I

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    if-lt v0, v7, :cond_2

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    move v6, v0

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    move v6, v1

    .line 66
    :goto_0
    iget-object v8, p0, Ll/rna0;->w:Ljava/lang/String;

    .line 67
    .line 68
    invoke-direct/range {v3 .. v8}, Ll/cya0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;ZILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iput-object v3, p0, Ll/rna0;->r:Ll/cya0;

    .line 72
    .line 73
    new-instance v0, Ll/pna0;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/pna0;-><init>(Ll/rna0;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, v0}, Ll/cya0;->H(Ll/cya0$a;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/rna0;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 82
    .line 83
    iget-object v2, p0, Ll/rna0;->r:Ll/cya0;

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/rna0;->e:Lv/VText;

    .line 89
    .line 90
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    iget v3, p0, Ll/rna0;->u:I

    .line 95
    .line 96
    if-ge v2, v3, :cond_3

    .line 97
    .line 98
    const/16 v2, 0x8

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move v2, v1

    .line 102
    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    move v0, v1

    .line 106
    :goto_2
    iget v2, p0, Ll/rna0;->u:I

    .line 107
    .line 108
    if-ge v0, v2, :cond_6

    .line 109
    .line 110
    iget-object v2, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 111
    .line 112
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 117
    .line 118
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-ge v0, v3, :cond_4

    .line 123
    .line 124
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_4
    const/4 v3, 0x0

    .line 132
    :goto_3
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 136
    .line 137
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 142
    .line 143
    new-instance v3, Ll/qna0;

    .line 144
    .line 145
    invoke-direct {v3, p0}, Ll/qna0;-><init>(Ll/rna0;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 149
    .line 150
    .line 151
    iget-object v2, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 152
    .line 153
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 158
    .line 159
    const-string v3, "p_upload_photos"

    .line 160
    .line 161
    invoke-virtual {v2, v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-ne v0, v2, :cond_5

    .line 169
    .line 170
    iget-object v2, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 171
    .line 172
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 177
    .line 178
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P1()V

    .line 179
    .line 180
    .line 181
    :cond_5
    iget-object v2, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 182
    .line 183
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 188
    .line 189
    iget-object v3, p0, Ll/rna0;->k:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setFrom(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    add-int/lit8 v0, v0, 0x1

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_6
    invoke-virtual {p0, v1}, Ll/rna0;->j(Z)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u7167\u7247\u672a\u5b8c\u6210\u4e0a\u4f20"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "\u672a\u5b8c\u6210\u4e0a\u4f20\u7684\u7167\u7247\u5c06\u4f1a\u88ab\u5220\u9664"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "\u653e\u5f03\u4fdd\u5b58\u5e76\u7ee7\u7eed"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/nna0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/nna0;-><init>(Ll/rna0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "\u53d6\u6d88"

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public C()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    move v2, v1

    .line 16
    :goto_0
    iget v3, p0, Ll/rna0;->u:I

    .line 17
    .line 18
    if-ge v1, v3, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 21
    .line 22
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 35
    .line 36
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 48
    .line 49
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 58
    .line 59
    const-string v4, "normal"

    .line 60
    .line 61
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-nez v3, :cond_0

    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Ll/rna0;->n:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 81
    .line 82
    :cond_2
    return v2

    .line 83
    :cond_3
    return v1
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rna0;->h:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_3

    .line 8
    .line 9
    iget-object v1, p0, Ll/rna0;->q:Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_3

    .line 20
    .line 21
    iget v1, p0, Ll/rna0;->s:I

    .line 22
    .line 23
    const/16 v2, 0x101

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    if-eq v1, v2, :cond_1

    .line 27
    .line 28
    const/16 v2, 0x102

    .line 29
    .line 30
    if-eq v1, v2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget v1, p0, Ll/rna0;->t:I

    .line 34
    .line 35
    if-lez v1, :cond_2

    .line 36
    .line 37
    iget v2, p0, Ll/rna0;->u:I

    .line 38
    .line 39
    if-ge v1, v2, :cond_2

    .line 40
    .line 41
    if-ge v1, v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 49
    .line 50
    iget v1, p0, Ll/rna0;->t:I

    .line 51
    .line 52
    iget-object v2, p0, Ll/rna0;->q:Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/rna0;->r:Ll/cya0;

    .line 58
    .line 59
    iget-object v1, p0, Ll/rna0;->p:Ljava/util/List;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/cya0;->G(Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v1, p0, Ll/rna0;->p:Ljava/util/List;

    .line 66
    .line 67
    sub-int/2addr v0, v3

    .line 68
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 73
    .line 74
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    iget-object v1, p0, Ll/rna0;->p:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/rna0;->p:Ljava/util/List;

    .line 88
    .line 89
    iget-object v1, p0, Ll/rna0;->q:Lcom/p1/mobile/putong/data/Picture;

    .line 90
    .line 91
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/rna0;->r:Ll/cya0;

    .line 95
    .line 96
    iget-object v1, p0, Ll/rna0;->p:Ljava/util/List;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/cya0;->G(Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_0
    invoke-virtual {p0, v3}, Ll/rna0;->j(Z)V

    .line 102
    .line 103
    .line 104
    :cond_3
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rna0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "e_tantanx_pet_upload_normalguide_confirm"

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ll/rna0;->t:I

    .line 6
    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget v1, p0, Ll/rna0;->u:I

    .line 10
    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Ll/rna0;->p:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 22
    .line 23
    iget v1, p0, Ll/rna0;->t:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->y1(Lcom/p1/mobile/putong/data/Media;)V

    .line 32
    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    iput-object p1, p0, Ll/rna0;->q:Lcom/p1/mobile/putong/data/Picture;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/rna0;->C()I

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    :goto_0
    iget v0, p0, Ll/rna0;->u:I

    .line 43
    .line 44
    if-ge p1, v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 53
    .line 54
    const-string v1, "p_upload_photos"

    .line 55
    .line 56
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 p1, p1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {p0}, Ll/rna0;->E()V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sna0;->b(Ll/rna0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/mna0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rna0;->g:Ll/mna0;

    .line 2
    .line 3
    return-void
.end method

.method public final i(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/xra;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ll/tr90;->l:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "from_explore_upload_pic"

    .line 22
    .line 23
    iget-object p0, p0, Ll/rna0;->v:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->A8(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/rna0;->p()Ll/xyl;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x1

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-interface {p0, p1, v1, v1, v0}, Ll/xyl;->n0(IZZZ)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mna0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rna0;->f(Ll/mna0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rna0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/rna0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rna0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/rna0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/rna0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget v0, Ll/kbc0;->f:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/rna0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/rna0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 52
    .line 53
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget v0, Ll/kbc0;->r1:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rna0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public l(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    iget v3, p0, Ll/rna0;->u:I

    .line 17
    .line 18
    if-ge v1, v3, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 21
    .line 22
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 35
    .line 36
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 45
    .line 46
    const-string v4, "normal"

    .line 47
    .line 48
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_0

    .line 53
    .line 54
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    iget-object v3, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 57
    .line 58
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    if-lez v2, :cond_2

    .line 73
    .line 74
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public m()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rna0;->h:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public p()Ll/xyl;
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/xyl;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/xyl;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileMediaAct;

    .line 21
    .line 22
    return-object p0
.end method

.method public q()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rna0;->g:Ll/mna0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rna0;->n:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Ll/rna0;->o:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/mna0;->o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public final synthetic s(IZ)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p1, "success"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "fail"

    .line 7
    .line 8
    :goto_0
    const-string v0, "tantanx_pet_photo_uploadstatus"

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    filled-new-array {p1}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "e_editpage_upload"

    .line 19
    .line 20
    const-string v1, "p_tantanx_pet_photo_normalguide"

    .line 21
    .line 22
    invoke-static {v0, v1, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput p1, p0, Ll/rna0;->l:I

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/rna0;->E()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p1, 0x1

    .line 35
    iput p1, p0, Ll/rna0;->l:I

    .line 36
    .line 37
    const-string p0, "\u4e0a\u4f20\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u5c1d\u8bd5"

    .line 38
    .line 39
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic u(II)V
    .locals 2

    .line 1
    const/16 v0, 0x101

    .line 2
    .line 3
    const-string v1, "e_tantanx_pet_upload_normalguide_upload"

    .line 4
    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x102

    .line 8
    .line 9
    if-eq p2, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "e_tantanx_pet_upload_normalguide_change"

    .line 13
    .line 14
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/rna0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput p2, p0, Ll/rna0;->s:I

    .line 22
    .line 23
    iput p1, p0, Ll/rna0;->t:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/rna0;->i(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rna0;->C()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 13
    .line 14
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/rna0;->q:Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/rna0;->C()I

    .line 28
    .line 29
    .line 30
    :goto_0
    iget p1, p0, Ll/rna0;->u:I

    .line 31
    .line 32
    if-ge v0, p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Ll/rna0;->m:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 41
    .line 42
    const-string p2, "p_upload_photos"

    .line 43
    .line 44
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method public final y()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/rna0;->g:Ll/mna0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mna0;->i0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "\u5f20\uff0c\u8bf7\u66ff\u6362\u4e00\u5f20\u7167\u7247"

    .line 12
    .line 13
    const-string v3, "\u4f60\u7684\u7167\u7247\u5df2\u7ecf\u4e0a\u4f20"

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "type"

    .line 24
    .line 25
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/rna0;->v:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "new_pop_up_title"

    .line 32
    .line 33
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v5, "new_pop_up_sub_title"

    .line 38
    .line 39
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const-string v6, "new_pop_up_box_title"

    .line 44
    .line 45
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    iput-object v6, p0, Ll/rna0;->w:Ljava/lang/String;

    .line 50
    .line 51
    const-string v6, "new_pop_up_warning"

    .line 52
    .line 53
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v4, p0, Ll/rna0;->b:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/rna0;->c:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_0

    .line 77
    .line 78
    invoke-static {}, Ll/xra;->w()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_0

    .line 83
    .line 84
    iget-object p0, p0, Ll/rna0;->e:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_0
    iget-object v0, p0, Ll/rna0;->e:Lv/VText;

    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget p0, p0, Ll/rna0;->u:I

    .line 98
    .line 99
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :goto_1
    return-void

    .line 113
    :cond_1
    iget-object v0, p0, Ll/rna0;->e:Lv/VText;

    .line 114
    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget p0, p0, Ll/rna0;->u:I

    .line 121
    .line 122
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rna0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rna0;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rna0;->n()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/rna0;->n:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/rna0;->n()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->y0()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/rna0;->o:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/rna0;->y()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/rna0;->n:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/rna0;->A(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->f5()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/rna0;->n()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->e1()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    iget-object p0, p0, Ll/rna0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopEditPetPicFrag;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->d5()V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method
