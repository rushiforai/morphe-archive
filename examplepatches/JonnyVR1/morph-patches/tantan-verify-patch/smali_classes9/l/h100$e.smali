.class public Ll/h100$e;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h100;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/h100;


# direct methods
.method public constructor <init>(Ll/h100;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h100$e;->g:Ll/h100;

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
    iput-object p1, p0, Ll/h100$e;->e:Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ljava/util/Stack;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/h100$e;->f:Ljava/util/Stack;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic q(Ll/h100$e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100$e;->t(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/h100$e;Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h100$e;->v(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/h100$e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h100$e;->u(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h100$e;->e:Ljava/util/List;

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
    .locals 0

    .line 1
    move-object p2, p3

    .line 2
    check-cast p2, Landroid/view/View;

    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    instance-of p1, p3, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/h100$e;->f:Ljava/util/Stack;

    .line 12
    .line 13
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;

    .line 14
    .line 15
    invoke-virtual {p0, p3}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h100$e;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Lq()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    move-object v1, v0

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 28
    .line 29
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/h100$e;->g:Ll/h100;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/h100;->C()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget v3, Ll/qec0;->f2:I

    .line 46
    .line 47
    invoke-virtual {v0, v3, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

    .line 52
    .line 53
    invoke-static {}, Ll/bnl0;->y0()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    sget v3, Ll/qa00;->h:I

    .line 58
    .line 59
    sub-int/2addr v2, v3

    .line 60
    sub-int/2addr v2, v3

    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/h100$e;->g:Ll/h100;

    .line 65
    .line 66
    iget-object p1, p1, Ll/h100;->q:Ljava/util/HashMap;

    .line 67
    .line 68
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v1}, Ll/h100$e;->w(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Video;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->Z(Lcom/p1/mobile/putong/data/Video;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v2, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->b0(II)V

    .line 83
    .line 84
    .line 85
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->g:Landroid/view/View;

    .line 86
    .line 87
    new-instance p2, Ll/i100;

    .line 88
    .line 89
    invoke-direct {p2, p0}, Ll/i100;-><init>(Ll/h100$e;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->i:Landroid/view/View;

    .line 96
    .line 97
    new-instance p2, Ll/j100;

    .line 98
    .line 99
    invoke-direct {p2, p0}, Ll/j100;-><init>(Ll/h100$e;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    return-object v0

    .line 106
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 107
    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    iget-object p2, p0, Ll/h100$e;->f:Ljava/util/Stack;

    .line 111
    .line 112
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-nez p2, :cond_1

    .line 117
    .line 118
    iget-object p2, p0, Ll/h100$e;->f:Ljava/util/Stack;

    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_1
    iget-object p2, p0, Ll/h100$e;->g:Ll/h100;

    .line 128
    .line 129
    invoke-virtual {p2}, Ll/h100;->C()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    sget v1, Ll/qec0;->g2:I

    .line 138
    .line 139
    invoke-virtual {p2, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;

    .line 144
    .line 145
    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    new-instance p1, Ll/k100;

    .line 149
    .line 150
    invoke-direct {p1, p0, p2}, Ll/k100;-><init>(Ll/h100$e;Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;)V

    .line 151
    .line 152
    .line 153
    invoke-static {p2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->z(Lcom/p1/mobile/putong/data/Picture;)V

    .line 159
    .line 160
    .line 161
    return-object p2

    .line 162
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 163
    .line 164
    if-eqz v1, :cond_3

    .line 165
    .line 166
    iget-object p2, p0, Ll/h100$e;->g:Ll/h100;

    .line 167
    .line 168
    invoke-virtual {p2}, Ll/h100;->C()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    sget v1, Ll/qec0;->h2:I

    .line 177
    .line 178
    invoke-virtual {p2, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 183
    .line 184
    invoke-static {}, Ll/bnl0;->y0()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    sget v2, Ll/qa00;->h:I

    .line 189
    .line 190
    sub-int/2addr v1, v2

    .line 191
    sub-int/2addr v1, v2

    .line 192
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Ll/h100$e;->g:Ll/h100;

    .line 196
    .line 197
    iput-object p2, p0, Ll/h100;->p:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 198
    .line 199
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 200
    .line 201
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->e0(Lcom/p1/mobile/putong/data/Video;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p2, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->h0(II)V

    .line 205
    .line 206
    .line 207
    return-object p2

    .line 208
    :cond_3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    return-object p0
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/h100$e;->g:Ll/h100;

    .line 2
    .line 3
    iget-object p1, p1, Ll/h100;->c:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/h100$e;->g:Ll/h100;

    .line 12
    .line 13
    iget-object p0, p0, Ll/h100;->c:Lv/VPager;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    add-int/lit8 p1, p1, -0x1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/h100$e;->g:Ll/h100;

    .line 2
    .line 3
    iget-object p1, p1, Ll/h100;->c:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Ll/h100$e;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    if-ge p1, v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/h100$e;->g:Ll/h100;

    .line 18
    .line 19
    iget-object p0, p0, Ll/h100;->c:Lv/VPager;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    add-int/lit8 p1, p1, 0x1

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPictureView;->q()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, -0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    iget-object p2, p0, Ll/h100$e;->g:Ll/h100;

    .line 11
    .line 12
    iget-object p2, p2, Ll/h100;->c:Lv/VPager;

    .line 13
    .line 14
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-lez p2, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/h100$e;->g:Ll/h100;

    .line 21
    .line 22
    iget-object p0, p0, Ll/h100;->c:Lv/VPager;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    sub-int/2addr p1, v1

    .line 29
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    if-ne p1, v1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Ll/h100$e;->g:Ll/h100;

    .line 36
    .line 37
    iget-object p1, p1, Ll/h100;->c:Lv/VPager;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0}, Ll/h100$e;->getCount()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    sub-int/2addr p2, v1

    .line 48
    if-ge p1, p2, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Ll/h100$e;->g:Ll/h100;

    .line 51
    .line 52
    iget-object p0, p0, Ll/h100;->c:Lv/VPager;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    add-int/2addr p1, v1

    .line 59
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Video;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 31
    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    const-string v1, "normal"

    .line 35
    .line 36
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 68
    .line 69
    iget v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->duration:F

    .line 70
    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 76
    .line 77
    return-object p0
.end method

.method public x(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h100$e;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
