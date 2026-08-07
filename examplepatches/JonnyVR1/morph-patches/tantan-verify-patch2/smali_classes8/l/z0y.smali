.class public Ll/z0y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/r0y;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/ViewStub;

.field public b:Lcom/google/android/material/tabs/TabLayout;

.field public c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

.field public d:Lv/VPager;

.field public e:Lv/VProgressBar;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Ll/r0y;

.field public m:Z

.field public n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

.field public o:Ll/uyh0;

.field public p:Ll/uyh0;

.field public q:Ll/uyh0;

.field public r:Lv/VList;

.field public s:Ll/jwi;

.field public t:Ll/l4g0;

.field public u:Ll/l4g0;

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/uyh0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/z0y;->m:Z

    .line 6
    .line 7
    new-instance v0, Ll/l4g0;

    .line 8
    .line 9
    const-class v1, Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "p_video_albums_view"

    .line 16
    .line 17
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/z0y;->t:Ll/l4g0;

    .line 21
    .line 22
    new-instance v0, Ll/l4g0;

    .line 23
    .line 24
    const-string v2, "p_picture_albums_view"

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/z0y;->u:Ll/l4g0;

    .line 34
    .line 35
    iput-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 36
    .line 37
    return-void
.end method

.method private K(Ll/uyh0;Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/uyh0;",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    iget-object p0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    check-cast p2, Ll/ewi;

    .line 40
    .line 41
    iget-object v0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ll/ewi;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iput-object p2, p1, Ll/uyh0;->c:Ll/ewi;

    .line 50
    .line 51
    iget-object p0, p1, Ll/uyh0;->d:Ll/jic0;

    .line 52
    .line 53
    check-cast p0, Ll/pgm;

    .line 54
    .line 55
    iget-object p1, p2, Ll/ewi;->c:Ll/vg60;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/pgm;->L(Ll/vg60;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const/4 p0, 0x0

    .line 62
    iput-object p0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ll/z0y;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z0y;->F()V

    return-void
.end method

.method public static synthetic c(Ll/z0y;ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z0y;->G(ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V

    return-void
.end method

.method public static synthetic d(Ll/z0y;IZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/z0y;->H(IZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Ll/z0y;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z0y;->I(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/z0y;)Ll/uyh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->q:Ll/uyh0;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/z0y;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->v:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/z0y;)Ll/uyh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->o:Ll/uyh0;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/z0y;)Ll/uyh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->p:Ll/uyh0;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/z0y;Ll/uyh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z0y;->q:Ll/uyh0;

    return-void
.end method


# virtual methods
.method public A(IIZIZLcom/p1/mobile/putong/data/Gender;Z)V
    .locals 13

    .line 1
    move/from16 v8, p4

    .line 2
    .line 3
    const/high16 v9, 0x40800000    # 4.0f

    .line 4
    .line 5
    const/4 v10, 0x1

    .line 6
    const/4 v11, 0x0

    .line 7
    if-lez p1, :cond_1

    .line 8
    .line 9
    iget-object v6, p0, Ll/z0y;->o:Ll/uyh0;

    .line 10
    .line 11
    new-instance v0, Ll/pgm;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 14
    .line 15
    move v2, p2

    .line 16
    if-ne v2, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 20
    .line 21
    :goto_0
    iget-object v3, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 22
    .line 23
    const/4 v7, 0x0

    .line 24
    const/4 v2, 0x0

    .line 25
    move v4, p1

    .line 26
    move/from16 v5, p7

    .line 27
    .line 28
    invoke-direct/range {v0 .. v7}, Ll/pgm;-><init>(IZLcom/p1/mobile/putong/app/PutongAct;IZLl/uyh0;Z)V

    .line 29
    .line 30
    .line 31
    iput-object v0, v6, Ll/uyh0;->d:Ll/jic0;

    .line 32
    .line 33
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget v2, Ll/kec0;->be:I

    .line 42
    .line 43
    iget-object v3, p0, Ll/z0y;->d:Lv/VPager;

    .line 44
    .line 45
    invoke-virtual {v1, v2, v3, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    iput-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    .line 53
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/z0y;->C0()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {v0, v1, v8}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/z0y;->o:Ll/uyh0;

    .line 66
    .line 67
    iget-object v1, v1, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 73
    .line 74
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 75
    .line 76
    new-instance v1, Ll/muf0;

    .line 77
    .line 78
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-direct {v1, v2, v8}, Ll/muf0;-><init>(II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 89
    .line 90
    iget-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 91
    .line 92
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    if-eqz p3, :cond_2

    .line 98
    .line 99
    iget-object v12, p0, Ll/z0y;->p:Ll/uyh0;

    .line 100
    .line 101
    new-instance v0, Ll/pgm;

    .line 102
    .line 103
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 104
    .line 105
    iget-object v3, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 106
    .line 107
    iget-object v6, p0, Ll/z0y;->o:Ll/uyh0;

    .line 108
    .line 109
    const/4 v7, 0x0

    .line 110
    const/4 v2, 0x1

    .line 111
    move v4, p1

    .line 112
    move/from16 v5, p7

    .line 113
    .line 114
    invoke-direct/range {v0 .. v7}, Ll/pgm;-><init>(IZLcom/p1/mobile/putong/app/PutongAct;IZLl/uyh0;Z)V

    .line 115
    .line 116
    .line 117
    iput-object v0, v12, Ll/uyh0;->d:Ll/jic0;

    .line 118
    .line 119
    iget-object v0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 120
    .line 121
    iget-object v1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    sget v2, Ll/kec0;->be:I

    .line 128
    .line 129
    iget-object v3, p0, Ll/z0y;->d:Lv/VPager;

    .line 130
    .line 131
    invoke-virtual {v1, v2, v3, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 136
    .line 137
    iput-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/z0y;->C0()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-direct {v0, v1, v8}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Ll/z0y;->p:Ll/uyh0;

    .line 152
    .line 153
    iget-object v1, v1, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 154
    .line 155
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 159
    .line 160
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 161
    .line 162
    new-instance v1, Ll/muf0;

    .line 163
    .line 164
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    invoke-direct {v1, v2, v8}, Ll/muf0;-><init>(II)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 175
    .line 176
    iget-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 177
    .line 178
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 179
    .line 180
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 181
    .line 182
    .line 183
    :cond_2
    new-instance v0, Ll/unw;

    .line 184
    .line 185
    iget-object v3, p0, Ll/z0y;->o:Ll/uyh0;

    .line 186
    .line 187
    iget-object v4, p0, Ll/z0y;->p:Ll/uyh0;

    .line 188
    .line 189
    iget-object v5, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 190
    .line 191
    move v2, p1

    .line 192
    move/from16 v1, p3

    .line 193
    .line 194
    invoke-direct/range {v0 .. v5}, Ll/unw;-><init>(ZILl/uyh0;Ll/uyh0;Lcom/p1/mobile/android/app/Act;)V

    .line 195
    .line 196
    .line 197
    iget-object v1, p0, Ll/z0y;->d:Lv/VPager;

    .line 198
    .line 199
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 203
    .line 204
    iget-object v1, p0, Ll/z0y;->d:Lv/VPager;

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Ll/z0y;->d:Lv/VPager;

    .line 210
    .line 211
    new-instance v1, Ll/z0y$a;

    .line 212
    .line 213
    move/from16 v2, p5

    .line 214
    .line 215
    move-object/from16 v3, p6

    .line 216
    .line 217
    invoke-direct {v1, p0, p1, v2, v3}, Ll/z0y$a;-><init>(Ll/z0y;IZLcom/p1/mobile/putong/data/Gender;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public B(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z0y;->k:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-le p1, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/z0y;->k:Lv/VText;

    .line 12
    .line 13
    new-instance v0, Ll/x0y;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/x0y;-><init>(Ll/z0y;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C(ILjava/lang/String;Ljava/lang/String;ZIZLcom/p1/mobile/putong/data/Gender;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/eu9;->i(Lcom/google/android/material/tabs/TabLayout;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->vu:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    const-string v0, "force_select_image"

    .line 27
    .line 28
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-eqz p3, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/z0y;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/z0y;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p3, v0}, Ll/c30;->w(Z)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0, p6, p7}, Ll/z0y;->q(ZLcom/p1/mobile/putong/data/Gender;)V

    .line 54
    .line 55
    .line 56
    sget p3, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 57
    .line 58
    iget-object p6, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 59
    .line 60
    if-ne p1, p3, :cond_2

    .line 61
    .line 62
    sget p1, Ll/c9c0;->r1:I

    .line 63
    .line 64
    invoke-virtual {p6, p1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {p6, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 72
    .line 73
    sget p3, Ll/c9c0;->q1:I

    .line 74
    .line 75
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->setActionBarColor(I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 83
    .line 84
    sget p3, Lcom/p1/mobile/putong/core/R$string;->hi:I

    .line 85
    .line 86
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/z0y;->j:Lv/VText;

    .line 90
    .line 91
    iget-object p3, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 92
    .line 93
    sget p6, Ll/c9c0;->a:I

    .line 94
    .line 95
    invoke-virtual {p3, p6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/z0y;->e:Lv/VProgressBar;

    .line 103
    .line 104
    const/4 p3, 0x1

    .line 105
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    sget p1, Lcom/p1/mobile/putong/core/R$string;->pi:I

    .line 110
    .line 111
    invoke-virtual {p6, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 112
    .line 113
    .line 114
    :goto_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_3

    .line 119
    .line 120
    iget-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    :cond_3
    if-eqz p4, :cond_5

    .line 126
    .line 127
    if-lez p5, :cond_5

    .line 128
    .line 129
    iget-object p1, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 130
    .line 131
    iget-object p2, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 132
    .line 133
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p2}, Ll/c30;->j()F

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout;->setElevation(F)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/app/PutongAct;->statusHeaderView:Landroid/view/View;

    .line 147
    .line 148
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    const/4 p2, 0x0

    .line 153
    if-eqz p1, :cond_4

    .line 154
    .line 155
    iget-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 156
    .line 157
    iget-object p1, p1, Lcom/p1/mobile/putong/app/PutongAct;->statusHeaderView:Landroid/view/View;

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Landroid/view/View;->setElevation(F)V

    .line 160
    .line 161
    .line 162
    :cond_4
    iget-object p0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 163
    .line 164
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {p0, p2}, Ll/c30;->A(F)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_5
    iget-object p0, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 173
    .line 174
    const/16 p1, 0x8

    .line 175
    .line 176
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->e:Lv/VProgressBar;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z0y;->q:Ll/uyh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic G(ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/z0y;->q:Ll/uyh0;

    .line 12
    .line 13
    iget-object p2, p0, Ll/z0y;->p:Ll/uyh0;

    .line 14
    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/z0y;->t:Ll/l4g0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/z0y;->t:Ll/l4g0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Ll/z0y;->u:Ll/l4g0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/z0y;->u:Ll/l4g0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Ll/z0y;->t:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/z0y;->t:Ll/l4g0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object p1, p0, Ll/z0y;->u:Ll/l4g0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/z0y;->u:Ll/l4g0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic H(IZLandroid/view/View;)V
    .locals 3

    .line 1
    iget-object p3, p0, Ll/z0y;->e:Lv/VProgressBar;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p3, Lv/VList;

    .line 11
    .line 12
    iget-object v0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 13
    .line 14
    invoke-direct {p3, v0}, Lv/VList;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, Ll/z0y;->r:Lv/VList;

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p3, p0, Ll/z0y;->r:Lv/VList;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p3, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ll/jwi;

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 32
    .line 33
    if-ne p1, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 37
    .line 38
    :goto_0
    iget-object p1, p0, Ll/z0y;->q:Ll/uyh0;

    .line 39
    .line 40
    iget-object v2, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 41
    .line 42
    invoke-direct {p3, v1, p1, v2, v2}, Ll/jwi;-><init>(ILl/uyh0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;)V

    .line 43
    .line 44
    .line 45
    iput-object p3, p0, Ll/z0y;->s:Ll/jwi;

    .line 46
    .line 47
    iget-object p1, p0, Ll/z0y;->r:Lv/VList;

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/z0y;->s:Ll/jwi;

    .line 53
    .line 54
    iget-object p3, p0, Ll/z0y;->q:Ll/uyh0;

    .line 55
    .line 56
    iget-object p3, p3, Ll/uyh0;->b:Ll/vg60;

    .line 57
    .line 58
    invoke-virtual {p1, p3}, Ll/jwi;->w(Ll/vg60;)V

    .line 59
    .line 60
    .line 61
    const/high16 p1, 0x42800000    # 64.0f

    .line 62
    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget-object p3, p0, Ll/z0y;->q:Ll/uyh0;

    .line 68
    .line 69
    iget-object p3, p3, Ll/uyh0;->b:Ll/vg60;

    .line 70
    .line 71
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    mul-int/2addr p3, p1

    .line 78
    iget-object p1, p0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    div-int/lit8 p1, p1, 0x2

    .line 85
    .line 86
    iget-object v1, p0, Ll/z0y;->r:Lv/VList;

    .line 87
    .line 88
    if-ge p3, p1, :cond_2

    .line 89
    .line 90
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 91
    .line 92
    invoke-direct {p1, v0, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 99
    .line 100
    int-to-float p3, p3

    .line 101
    invoke-virtual {p1, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setPeekSheetTranslation(F)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 106
    .line 107
    const/4 v2, -0x2

    .line 108
    invoke-direct {p3, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    iget-object p3, p0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 115
    .line 116
    int-to-float p1, p1

    .line 117
    invoke-virtual {p3, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setPeekSheetTranslation(F)V

    .line 118
    .line 119
    .line 120
    :goto_1
    iget-object p1, p0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 121
    .line 122
    new-instance p3, Ll/y0y;

    .line 123
    .line 124
    invoke-direct {p3, p0, p2}, Ll/y0y;-><init>(Ll/z0y;Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->m(Ll/qn50;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 131
    .line 132
    iget-object p3, p0, Ll/z0y;->r:Lv/VList;

    .line 133
    .line 134
    invoke-virtual {p1, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 138
    .line 139
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    const/16 p3, 0x8

    .line 144
    .line 145
    if-eq p1, p3, :cond_4

    .line 146
    .line 147
    iget-object p1, p0, Ll/z0y;->q:Ll/uyh0;

    .line 148
    .line 149
    iget-object p2, p0, Ll/z0y;->p:Ll/uyh0;

    .line 150
    .line 151
    if-ne p1, p2, :cond_3

    .line 152
    .line 153
    iget-object p1, p0, Ll/z0y;->t:Ll/l4g0;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Ll/z0y;->t:Ll/l4g0;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    iget-object p1, p0, Ll/z0y;->u:Ll/l4g0;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Ll/z0y;->u:Ll/l4g0;

    .line 170
    .line 171
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_4
    if-eqz p2, :cond_5

    .line 176
    .line 177
    iget-object p1, p0, Ll/z0y;->t:Ll/l4g0;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Ll/z0y;->t:Ll/l4g0;

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_5
    iget-object p1, p0, Ll/z0y;->u:Ll/l4g0;

    .line 189
    .line 190
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Ll/z0y;->u:Ll/l4g0;

    .line 194
    .line 195
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z0y;->d:Lv/VPager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/c9c0;->c2:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/z0y;->a:Landroid/view/ViewStub;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/adc0;->N5:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lv/VImage;

    .line 31
    .line 32
    sget v2, Ll/adc0;->Sd:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    iget-object v2, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 41
    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget v2, Ll/dbc0;->mu:I

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {v1, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget v2, Ll/dbc0;->nu:I

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    iget-object p1, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 72
    .line 73
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ip:I

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 80
    .line 81
    sget v1, Lcom/p1/mobile/putong/core/R$string;->jp:I

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    filled-new-array {p0}, [Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string v1, "#d74d37"

    .line 96
    .line 97
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 102
    .line 103
    invoke-static {p1, p0, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string p1, "signup_source"

    .line 119
    .line 120
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string p1, "phone_num"

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p1, "e_picture_albums_tips"

    .line 139
    .line 140
    const-string v0, "p_picture_albums_view"

    .line 141
    .line 142
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public L(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 2
    .line 3
    new-instance v1, Ll/vg60;

    .line 4
    .line 5
    new-instance v2, Ll/w0y;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/w0y;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v1, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Ll/uyh0;->a:Ll/vg60;

    .line 19
    .line 20
    iget-object p0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 21
    .line 22
    iget-object p1, p0, Ll/uyh0;->d:Ll/jic0;

    .line 23
    .line 24
    check-cast p1, Ll/pgm;

    .line 25
    .line 26
    iget-object p0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ll/pgm;->L(Ll/vg60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public M(Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, v0, Ll/uyh0;->b:Ll/vg60;

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Ll/z0y;->K(Ll/uyh0;Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/z0y;->q:Ll/uyh0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/z0y;->s:Ll/jwi;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/z0y;->s:Ll/jwi;

    .line 23
    .line 24
    iget-object p0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 25
    .line 26
    iget-object p0, p0, Ll/uyh0;->b:Ll/vg60;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ll/jwi;->w(Ll/vg60;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Video;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 2
    .line 3
    new-instance v1, Ll/vg60;

    .line 4
    .line 5
    new-instance v2, Ll/v0y;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/v0y;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v1, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Ll/uyh0;->a:Ll/vg60;

    .line 19
    .line 20
    iget-object p0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 21
    .line 22
    iget-object p1, p0, Ll/uyh0;->d:Ll/jic0;

    .line 23
    .line 24
    check-cast p1, Ll/pgm;

    .line 25
    .line 26
    iget-object p0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ll/pgm;->L(Ll/vg60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public O(Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, v0, Ll/uyh0;->b:Ll/vg60;

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Ll/z0y;->K(Ll/uyh0;Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/z0y;->q:Ll/uyh0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/z0y;->s:Ll/jwi;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/z0y;->s:Ll/jwi;

    .line 23
    .line 24
    iget-object p0, p0, Ll/z0y;->p:Ll/uyh0;

    .line 25
    .line 26
    iget-object p0, p0, Ll/uyh0;->b:Ll/vg60;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ll/jwi;->w(Ll/vg60;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public P(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/uyh0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/z0y;->v:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public Q(Ll/ewi;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->q:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uyh0;->c:Ll/ewi;

    .line 4
    .line 5
    return-void
.end method

.method public R()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 2
    .line 3
    sget v1, Ll/b9c0;->p:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 15
    .line 16
    const/4 v2, -0x1

    .line 17
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/c30;->u(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Ll/dbc0;->Fd:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/c30;->B(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 35
    .line 36
    const-string v0, ""

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public S(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/z0y;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public T(Ll/uyh0;Ll/uyh0;Ll/uyh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z0y;->o:Ll/uyh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z0y;->p:Ll/uyh0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/z0y;->q:Ll/uyh0;

    .line 6
    .line 7
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/r0y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z0y;->p(Ll/r0y;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z0y;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a1y;->b(Ll/z0y;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/r0y;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z0y;->l:Ll/r0y;

    .line 2
    .line 3
    return-void
.end method

.method public q(ZLcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0y;->f:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s(Ll/ewi;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z0y;->q:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/uyh0;->d:Ll/jic0;

    .line 4
    .line 5
    check-cast v0, Ll/pgm;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p1, Ll/ewi;->c:Ll/vg60;

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, p0}, Ll/pgm;->L(Ll/vg60;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z0y;->q:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/z0y;->n:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 10
    .line 11
    new-instance v1, Ll/t0y;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/t0y;-><init>(Ll/z0y;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public v(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z0y;->k:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public w(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 11
    .line 12
    iput-object p1, p0, Ll/uyh0;->b:Ll/vg60;

    .line 13
    .line 14
    iget-object v0, p0, Ll/uyh0;->c:Ll/ewi;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ll/ewi;

    .line 25
    .line 26
    iput-object p1, p0, Ll/uyh0;->c:Ll/ewi;

    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Ll/z0y;->e:Lv/VProgressBar;

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z0y;->e:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public y(Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z0y;->o:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 4
    .line 5
    check-cast v0, Ll/pgm;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/pgm;->L(Ll/vg60;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/z0y;->e:Lv/VProgressBar;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public z(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z0y;->j:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->y8:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/z0y;->j:Lv/VText;

    .line 9
    .line 10
    new-instance v1, Ll/u0y;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, p2}, Ll/u0y;-><init>(Ll/z0y;IZ)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
