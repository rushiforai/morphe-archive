.class public Ll/y670;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/v670;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public d:Ll/v670;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public f:Z

.field public g:Z

.field public h:Ll/ie80;

.field public i:Z

.field public j:Z

.field public k:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public l:Landroidx/recyclerview/widget/RecyclerView$q;

.field public m:Landroidx/recyclerview/widget/RecyclerView$t;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/y670;->f:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/y670;->j:Z

    .line 8
    .line 9
    new-instance v0, Ll/y670$a;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/y670$a;-><init>(Ll/y670;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/y670;->l:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 15
    .line 16
    new-instance v0, Ll/y670$b;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/y670$b;-><init>(Ll/y670;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/y670;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 22
    .line 23
    iput-object p1, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Ll/y670;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Ll/y670;->x(Landroid/view/View;IIIIIIII)V

    return-void
.end method

.method public static bridge synthetic b(Ll/y670;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/y670;->g:Z

    return p0
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y670;->h:Ll/ie80;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/y670;->h:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/ie80;->pause()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public B()Z
    .locals 13

    .line 1
    iget-object v0, p0, Ll/y670;->d:Ll/v670;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v670;->k1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_8

    .line 9
    .line 10
    invoke-static {}, Ll/reh;->b()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_7

    .line 22
    .line 23
    iget-object v3, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 24
    .line 25
    if-eqz v3, :cond_7

    .line 26
    .line 27
    iget-object v3, p0, Ll/y670;->h:Ll/ie80;

    .line 28
    .line 29
    if-nez v3, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    div-int/lit8 v0, v0, 0x2

    .line 38
    .line 39
    iget-object v3, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 40
    .line 41
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 46
    .line 47
    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    const/high16 v6, -0x40800000    # -1.0f

    .line 56
    .line 57
    const/4 v7, -0x1

    .line 58
    move v9, v6

    .line 59
    move v8, v7

    .line 60
    :goto_0
    if-gt v4, v5, :cond_4

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v10

    .line 66
    instance-of v11, v10, Ll/stl;

    .line 67
    .line 68
    if-eqz v11, :cond_3

    .line 69
    .line 70
    move-object v11, v10

    .line 71
    check-cast v11, Ll/stl;

    .line 72
    .line 73
    invoke-interface {v11}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 74
    .line 75
    .line 76
    move-result-object v12

    .line 77
    invoke-static {v12}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 78
    .line 79
    .line 80
    move-result v12

    .line 81
    if-eqz v12, :cond_3

    .line 82
    .line 83
    invoke-interface {v11}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    .line 88
    .line 89
    .line 90
    move-result v11

    .line 91
    if-eqz v11, :cond_3

    .line 92
    .line 93
    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    .line 94
    .line 95
    .line 96
    move-result v11

    .line 97
    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    add-int/2addr v11, v10

    .line 102
    div-int/lit8 v11, v11, 0x2

    .line 103
    .line 104
    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    .line 105
    .line 106
    .line 107
    move-result v10

    .line 108
    sub-int/2addr v10, v0

    .line 109
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    cmpl-float v11, v9, v6

    .line 114
    .line 115
    if-eqz v11, :cond_2

    .line 116
    .line 117
    int-to-float v11, v10

    .line 118
    cmpg-float v11, v11, v9

    .line 119
    .line 120
    if-gez v11, :cond_3

    .line 121
    .line 122
    :cond_2
    int-to-float v9, v10

    .line 123
    move v8, v4

    .line 124
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    move v0, v2

    .line 128
    :goto_1
    iget-object v4, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 129
    .line 130
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    if-ge v0, v4, :cond_6

    .line 135
    .line 136
    iget-object v4, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 137
    .line 138
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    instance-of v5, v4, Ll/stl;

    .line 143
    .line 144
    if-eqz v5, :cond_5

    .line 145
    .line 146
    check-cast v4, Ll/stl;

    .line 147
    .line 148
    invoke-interface {v4}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-static {v5}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-eqz v5, :cond_5

    .line 157
    .line 158
    invoke-interface {v4}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    if-eqz v5, :cond_5

    .line 167
    .line 168
    if-eq v0, v8, :cond_5

    .line 169
    .line 170
    invoke-interface {v4}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    const/4 v5, 0x0

    .line 175
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 176
    .line 177
    .line 178
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_6
    if-eq v8, v7, :cond_7

    .line 182
    .line 183
    invoke-virtual {v3, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    instance-of v3, v0, Ll/stl;

    .line 188
    .line 189
    if-eqz v3, :cond_7

    .line 190
    .line 191
    check-cast v0, Ll/stl;

    .line 192
    .line 193
    invoke-interface {v0}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-eqz v3, :cond_7

    .line 202
    .line 203
    invoke-interface {v0}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v2, p0, Ll/y670;->h:Ll/ie80;

    .line 208
    .line 209
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 213
    .line 214
    .line 215
    iget-object p0, p0, Ll/y670;->h:Ll/ie80;

    .line 216
    .line 217
    invoke-interface {p0}, Ll/ie80;->b()V

    .line 218
    .line 219
    .line 220
    return v1

    .line 221
    :cond_7
    :goto_2
    return v2

    .line 222
    :cond_8
    :goto_3
    return v1
.end method

.method public C()V
    .locals 1

    .line 1
    invoke-static {}, Ll/j4h;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/y670;->k:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ll/y670$d;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/y670$d;-><init>(Ll/y670;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/y670;->k:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 22
    .line 23
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/y670;->k:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;Z",
            "Lcom/p1/mobile/putong/data/User;",
            "I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    new-instance v1, Ll/vg60;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 7
    .line 8
    .line 9
    iget-object v3, p0, Ll/y670;->d:Ll/v670;

    .line 10
    .line 11
    iget-object v3, v3, Ll/v670;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p2, v3, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->n0(Ll/vg60;ZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 19
    .line 20
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    const/4 p3, 0x0

    .line 27
    if-nez p2, :cond_0

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 36
    .line 37
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-boolean p1, p0, Ll/y670;->j:Z

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 46
    .line 47
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 48
    .line 49
    .line 50
    iput-boolean p3, p0, Ll/y670;->j:Z

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 54
    .line 55
    iget p1, p1, Ll/v670;->f:I

    .line 56
    .line 57
    const/4 p2, -0x1

    .line 58
    if-eq p1, p2, :cond_2

    .line 59
    .line 60
    iget-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 61
    .line 62
    invoke-virtual {p1, p4}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 66
    .line 67
    iput p2, p1, Ll/v670;->f:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-boolean p1, p1, Ll/t8c;->a:Z

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget p1, p1, Ll/t8c;->c:I

    .line 83
    .line 84
    if-lez p1, :cond_3

    .line 85
    .line 86
    iget-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 87
    .line 88
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 89
    .line 90
    .line 91
    move-result-object p4

    .line 92
    iget p4, p4, Ll/t8c;->c:I

    .line 93
    .line 94
    invoke-virtual {p1, p4}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-boolean p3, p1, Ll/t8c;->a:Z

    .line 102
    .line 103
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput p2, p1, Ll/t8c;->c:I

    .line 108
    .line 109
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object v2, p1, Ll/t8c;->b:Ljava/lang/String;

    .line 114
    .line 115
    :cond_3
    :goto_0
    const/4 p1, 0x1

    .line 116
    iput-boolean p1, p0, Ll/y670;->i:Z

    .line 117
    .line 118
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    new-instance v1, Ll/y670$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/y670$c;-><init>(Ll/y670;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I()V
    .locals 0

    .line 1
    return-void
.end method

.method public J(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/y670;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public K(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/y670;->f:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/y670;->B()Z

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Ll/y670;->h:Ll/ie80;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/y670;->h:Ll/ie80;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z670;->b(Ll/y670;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/z670;->c(Ll/y670;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/v670;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 2
    .line 3
    return-void
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/reh;->b()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v670;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y670;->e(Ll/v670;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y670;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/y670;->I()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/y670;->i()V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/s2m;->s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 20
    .line 21
    iget-object v0, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/s2m;->X0()Ll/s8h;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/y670;->s()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 51
    .line 52
    iget-object v1, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget-object v0, p0, Ll/y670;->d:Ll/v670;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/v670;->e1()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 63
    .line 64
    iget-object p0, p0, Ll/y670;->d:Ll/v670;

    .line 65
    .line 66
    iget-object p0, p0, Ll/v670;->b:Ll/n570;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->q0(Ll/n570;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y670;->k:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/y670;->k:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 21
    .line 22
    iget-object v1, p0, Ll/y670;->l:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 28
    .line 29
    iget-object p0, p0, Ll/y670;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y670;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget v0, Ll/k9c0;->p0:I

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    iget-object p2, p0, Ll/y670;->d:Ll/v670;

    .line 31
    .line 32
    iget-object p2, p2, Ll/v670;->d:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "from_live_square_tab"

    .line 35
    .line 36
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    iget-object p2, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/y670;->a:Lv/VFrame;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-object p1
.end method

.method public p()Landroidx/recyclerview/widget/RecyclerView$o;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->V(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public s()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    iget-object v3, p0, Ll/y670;->d:Ll/v670;

    .line 8
    .line 9
    move-object v4, v3

    .line 10
    iget-object v3, v4, Ll/v670;->c:Ljava/lang/String;

    .line 11
    .line 12
    move-object v5, v4

    .line 13
    iget-object v4, v5, Ll/v670;->d:Ljava/lang/String;

    .line 14
    .line 15
    move-object v6, v5

    .line 16
    iget v5, v6, Ll/v670;->h:I

    .line 17
    .line 18
    iget-boolean v6, v6, Ll/v670;->e:Z

    .line 19
    .line 20
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/y670;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 24
    .line 25
    return-object v0
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y670;->d:Ll/v670;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v670;->k1()Z

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
    iget-object v0, p0, Ll/y670;->h:Ll/ie80;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/ye80;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ye80;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/y670;->h:Ll/ie80;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Ll/y670;->h:Ll/ie80;

    .line 22
    .line 23
    iget-object v1, p0, Ll/y670;->d:Ll/v670;

    .line 24
    .line 25
    iget-object v1, v1, Ll/v670;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 31
    .line 32
    new-instance v1, Ll/w670;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/w670;-><init>(Ll/y670;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public v(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Ll/y670;->l:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 9
    .line 10
    iget-object v0, p0, Ll/y670;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/y670;->u()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/j4h;->d()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 25
    .line 26
    iget-object p1, p1, Ll/v670;->b:Ll/n570;

    .line 27
    .line 28
    instance-of p1, p1, Ll/bg20;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 33
    .line 34
    const/high16 p1, 0x60000

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic x(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/y670;->i:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Ll/y670;->i:Z

    .line 7
    .line 8
    iget-boolean p1, p0, Ll/y670;->f:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/y670;->B()Z

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->C:Ll/s2m;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/s2m;->p()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/y670;->d:Ll/v670;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/v670;->F1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    new-instance v0, Ll/x670;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x670;-><init>(Ll/y670;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
