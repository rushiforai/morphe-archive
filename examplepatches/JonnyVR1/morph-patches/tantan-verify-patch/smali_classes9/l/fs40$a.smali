.class public Ll/fs40$a;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fs40;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public e:Z

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public h:I

.field public i:I

.field public final synthetic j:Ll/fs40;


# direct methods
.method public constructor <init>(Ll/fs40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/fs40$a;->f:Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ljava/util/Stack;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/fs40$a;->g:Ljava/util/Stack;

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    iput p1, p0, Ll/fs40$a;->h:I

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput p1, p0, Ll/fs40$a;->i:I

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic q(Ll/fs40$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fs40$a;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/fs40$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fs40$a;->w(Landroid/view/View;)V

    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fs40;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fs40;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fs40$a;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget v0, p0, Ll/fs40$a;->i:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    iput v0, p0, Ll/fs40$a;->i:I

    .line 8
    .line 9
    const/4 p0, -0x2

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Ll/cf60;->getItemPosition(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/fs40$a;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 5
    .line 6
    iget-object v0, v0, Ll/fs40;->h:Lv/VPager;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 15
    .line 16
    iget-object p2, p2, Ll/fs40;->h:Lv/VPager;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p2, v0}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    move-object p2, p3

    .line 23
    check-cast p2, Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    instance-of p1, p3, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/fs40$a;->g:Ljava/util/Stack;

    .line 33
    .line 34
    check-cast p3, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 35
    .line 36
    invoke-virtual {p0, p3}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fs40$a;->g:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/fs40$a;->g:Ljava/util/Stack;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v2, Ll/kec0;->Ge:I

    .line 30
    .line 31
    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 36
    .line 37
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    const/16 v3, 0x8

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->j0(ZZ)V

    .line 51
    .line 52
    .line 53
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Ll/wlj;

    .line 72
    .line 73
    iget-object v4, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 74
    .line 75
    invoke-interface {v4}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    sget v5, Ll/dbc0;->U7:I

    .line 84
    .line 85
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v3, v4}, Ll/wlj;->A(Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Ll/wlj;

    .line 99
    .line 100
    iget-object v4, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 101
    .line 102
    invoke-interface {v4}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    sget v5, Ll/dbc0;->U7:I

    .line 111
    .line 112
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-virtual {v3, v4}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    :cond_1
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->J(ZZ)V

    .line 120
    .line 121
    .line 122
    const v3, 0x3f4ccccd    # 0.8f

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/PictureView;->setAspectRateFitWidth(F)V

    .line 126
    .line 127
    .line 128
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Ll/wlj;

    .line 135
    .line 136
    sget-object v4, Ll/h1e0;->i:Ll/h1e0;

    .line 137
    .line 138
    invoke-virtual {v3, v4}, Ll/wlj;->w(Ll/h1e0;)V

    .line 139
    .line 140
    .line 141
    iget-object v3, p0, Ll/fs40$a;->f:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 148
    .line 149
    const/16 v4, 0x64

    .line 150
    .line 151
    invoke-virtual {p0, v0, v3, v4}, Ll/fs40$a;->x(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 152
    .line 153
    .line 154
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    const/4 p2, 0x0

    .line 162
    invoke-virtual {v0, p2}, Landroid/view/View;->setPivotX(F)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, p2}, Landroid/view/View;->setPivotY(F)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 169
    .line 170
    .line 171
    const/4 p1, 0x0

    .line 172
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    .line 174
    .line 175
    iget-object p2, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 176
    .line 177
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    sget v3, Ll/kec0;->u9:I

    .line 186
    .line 187
    invoke-virtual {p2, v3, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {v0, p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 192
    .line 193
    .line 194
    invoke-static {p1, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 195
    .line 196
    .line 197
    sget p2, Ll/adc0;->c:I

    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    sget v1, Ll/adc0;->d:I

    .line 204
    .line 205
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    new-instance v1, Ll/ds40;

    .line 210
    .line 211
    invoke-direct {v1, p0}, Ll/ds40;-><init>(Ll/fs40$a;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    .line 216
    .line 217
    new-instance p2, Ll/es40;

    .line 218
    .line 219
    invoke-direct {p2, p0}, Ll/es40;-><init>(Ll/fs40$a;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    .line 224
    .line 225
    return-object v0
.end method

.method public s(I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fs40$a;->t(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfilePictureItemView;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/ProfilePictureItemView;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfilePictureItemView;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 18
    .line 19
    :cond_0
    return-object p0
.end method

.method public t(I)Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fs40;->h:Lv/VPager;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v2, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 11
    .line 12
    iget-object v2, v2, Ll/fs40;->h:Lv/VPager;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v0, v2, :cond_2

    .line 19
    .line 20
    iget-object v2, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 21
    .line 22
    iget-object v2, v2, Ll/fs40;->h:Lv/VPager;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    instance-of v3, v2, Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    check-cast v2, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-ne v2, p1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 45
    .line 46
    iget-object p0, p0, Ll/fs40;->h:Lv/VPager;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    return-object v1
.end method

.method public u()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fs40;->h:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public x(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->Y(Lcom/p1/mobile/putong/data/Media;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fs40$a;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/fs40$a;->e:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 14
    .line 15
    invoke-static {p1}, Ll/fs40;->f(Ll/fs40;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/fs40$a;->u()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0, p1, v0}, Ll/fs40$a;->z(Lcom/p1/mobile/putong/data/User;I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ll/fs40$a;->e:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/fs40$a;->getCount()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Ll/fs40$a;->i:I

    .line 35
    .line 36
    iput-object p1, p0, Ll/fs40$a;->f:Ljava/util/List;

    .line 37
    .line 38
    iget-object p0, p0, Ll/fs40$a;->j:Ll/fs40;

    .line 39
    .line 40
    invoke-static {p0}, Ll/fs40;->e(Ll/fs40;)Ll/fs40$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-ge p2, p1, :cond_0

    .line 14
    .line 15
    iget p1, p0, Ll/fs40$a;->h:I

    .line 16
    .line 17
    if-eq p1, p2, :cond_0

    .line 18
    .line 19
    iput p2, p0, Ll/fs40$a;->h:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method
