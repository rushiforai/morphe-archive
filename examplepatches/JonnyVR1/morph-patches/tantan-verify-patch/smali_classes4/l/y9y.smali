.class public Ll/y9y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/czl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y9y$b;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VPager;

.field public c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

.field public f:Ll/y9y$b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic b(Ll/y9y;)Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y9y;->e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/y9y;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y9y;->g(F)V

    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    new-instance v0, Ll/y9y$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y9y$b;-><init>(Ll/y9y;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/y9y;->f:Ll/y9y$b;

    .line 7
    .line 8
    iget-object v1, p0, Ll/y9y;->b:Lv/VPager;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/y9y;->b:Lv/VPager;

    .line 14
    .line 15
    new-instance v1, Ll/y9y$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/y9y$a;-><init>(Ll/y9y;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private g(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/y9y;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y9y;->b:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/high16 v2, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr v1, v2

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/y9y;->a:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    iget-object v1, p0, Ll/y9y;->b:Lv/VPager;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    div-float/2addr v1, v2

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/y9y;->b:Lv/VPager;

    .line 30
    .line 31
    sget-object v0, Landroid/view/View;->ROTATION_Y:Landroid/util/Property;

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    new-array v1, v1, [F

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    aput v3, v1, v2

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    aput p1, v1, v2

    .line 42
    .line 43
    const/4 p1, 0x2

    .line 44
    aput v3, v1, p1

    .line 45
    .line 46
    invoke-static {p0, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-wide/16 v0, 0xc8

    .line 51
    .line 52
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 2
    .line 3
    iput-object p1, p0, Ll/y9y;->e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/y9y;->c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/y9y;->c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-le v3, v2, :cond_0

    .line 39
    .line 40
    move v3, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v3, v1

    .line 43
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/y9y;->b:Lv/VPager;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/y9y$b;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ll/y9y$b;->s(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object p1, p0, Ll/y9y;->b:Lv/VPager;

    .line 58
    .line 59
    iget-object v0, p0, Ll/y9y;->e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 60
    .line 61
    iget v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->picIndex:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/y9y;->e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 73
    .line 74
    const-string v0, "superliked"

    .line 75
    .line 76
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    iget-object p1, p0, Ll/y9y;->e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RelationshipExt;->recvSuperLikedNum:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p1}, Ll/z5h0;->r(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-le p1, v2, :cond_3

    .line 115
    .line 116
    iget-object p1, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 117
    .line 118
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 128
    .line 129
    iget-object v0, p0, Ll/y9y;->c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 130
    .line 131
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_2

    .line 136
    .line 137
    sget v0, Ll/qa00;->h:I

    .line 138
    .line 139
    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    sget v0, Ll/qa00;->j:I

    .line 143
    .line 144
    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 145
    .line 146
    :goto_1
    iget-object v0, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 147
    .line 148
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 152
    .line 153
    sget v0, Ll/gbc0;->j2:I

    .line 154
    .line 155
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-static {p1, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 163
    .line 164
    sget v0, Ll/gbc0;->m2:I

    .line 165
    .line 166
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 174
    .line 175
    const/4 p2, 0x2

    .line 176
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-virtual {p1, p2, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 184
    .line 185
    iget-object p0, p0, Ll/y9y;->e:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 186
    .line 187
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RelationshipExt;->recvSuperLikedNum:Ljava/lang/String;

    .line 194
    .line 195
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    const-string p2, "\u8d85\u7ea7\u559c\u6b22x%s"

    .line 200
    .line 201
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_3
    iget-object p0, p0, Ll/y9y;->d:Landroid/widget/TextView;

    .line 210
    .line 211
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y9y;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/y9y;->f()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/aay;->b(Ll/y9y;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
