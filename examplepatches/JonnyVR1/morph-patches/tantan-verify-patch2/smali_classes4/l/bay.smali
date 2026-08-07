.class public Ll/bay;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/czl;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

.field public c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;

.field public h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

.field public i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

.field public j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

.field public k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;


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


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 2
    .line 3
    iput-object p1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 4
    .line 5
    iget-object p1, p0, Ll/bay;->a:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    sget v0, Ll/gbc0;->J0:I

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/bay;->d()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 p2, 0x1

    .line 43
    if-ne p1, p2, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/bay;->f()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object p1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const/4 p2, 0x2

    .line 60
    if-ne p1, p2, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/bay;->h()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget-object p1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    const/4 p2, 0x3

    .line 77
    if-ne p1, p2, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/bay;->g()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    invoke-virtual {p0}, Ll/bay;->e()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cay;->b(Ll/bay;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bay;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 39
    .line 40
    iget-object p0, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;->b(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    const/high16 v0, 0x43070000    # 135.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v3, p0, Ll/bay;->a:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v3, v0}, Ll/bay;->i(Landroid/view/ViewGroup;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 50
    .line 51
    iget-object v3, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 67
    .line 68
    iget-object v1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 84
    .line 85
    iget-object v1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 90
    .line 91
    const/4 v2, 0x2

    .line 92
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 102
    .line 103
    iget-object v1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 108
    .line 109
    const/4 v2, 0x3

    .line 110
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    check-cast v1, Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 120
    .line 121
    const/16 v1, 0xe

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 142
    .line 143
    const/high16 v1, 0x42700000    # 60.0f

    .line 144
    .line 145
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 153
    .line 154
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 162
    .line 163
    const/high16 v2, -0x3ee00000    # -10.0f

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Landroid/view/View;->setRotation(F)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 169
    .line 170
    const/high16 v2, 0x428c0000    # 70.0f

    .line 171
    .line 172
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 180
    .line 181
    const/high16 v2, 0x42820000    # 65.0f

    .line 182
    .line 183
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 191
    .line 192
    const/high16 v3, 0x41000000    # 8.0f

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Landroid/view/View;->setRotation(F)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 198
    .line 199
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    invoke-static {v0, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 207
    .line 208
    const/high16 v3, 0x420c0000    # 35.0f

    .line 209
    .line 210
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 218
    .line 219
    const/high16 v3, -0x3e700000    # -18.0f

    .line 220
    .line 221
    invoke-virtual {v0, v3}, Landroid/view/View;->setRotation(F)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 225
    .line 226
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 234
    .line 235
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 243
    .line 244
    const/high16 v1, 0x41700000    # 15.0f

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 250
    .line 251
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 252
    .line 253
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 254
    .line 255
    iget-object v1, p0, Ll/bay;->g:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;

    .line 256
    .line 257
    const/16 v2, 0x63

    .line 258
    .line 259
    if-le v0, v2, :cond_0

    .line 260
    .line 261
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    goto :goto_0

    .line 269
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    .line 275
    .line 276
    :goto_0
    iget-object p0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 277
    .line 278
    const/high16 v0, 0x41400000    # 12.0f

    .line 279
    .line 280
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    const/high16 v0, 0x432d0000    # 173.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v2, p0, Ll/bay;->a:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v2, v0}, Ll/bay;->i(Landroid/view/ViewGroup;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->c()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 55
    .line 56
    iget-object v2, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 72
    .line 73
    const/16 v1, 0x12

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 79
    .line 80
    const/high16 v1, 0x41a00000    # 20.0f

    .line 81
    .line 82
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 90
    .line 91
    const/high16 v1, 0x41200000    # 10.0f

    .line 92
    .line 93
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 101
    .line 102
    const/high16 v0, -0x3ee00000    # -10.0f

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    const/high16 v0, 0x43070000    # 135.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v3, p0, Ll/bay;->a:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v3, v0}, Ll/bay;->i(Landroid/view/ViewGroup;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 50
    .line 51
    iget-object v3, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 67
    .line 68
    iget-object v1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 84
    .line 85
    iget-object v1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 90
    .line 91
    const/4 v2, 0x2

    .line 92
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 102
    .line 103
    const/16 v1, 0xe

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 119
    .line 120
    const/high16 v1, 0x428c0000    # 70.0f

    .line 121
    .line 122
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 130
    .line 131
    const/high16 v1, 0x41200000    # 10.0f

    .line 132
    .line 133
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 141
    .line 142
    const/high16 v1, -0x3f400000    # -6.0f

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 148
    .line 149
    const/high16 v1, 0x42480000    # 50.0f

    .line 150
    .line 151
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 159
    .line 160
    const/high16 v2, 0x420c0000    # 35.0f

    .line 161
    .line 162
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 170
    .line 171
    const/high16 v2, -0x3e500000    # -22.0f

    .line 172
    .line 173
    invoke-virtual {v0, v2}, Landroid/view/View;->setRotation(F)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 177
    .line 178
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 186
    .line 187
    const/high16 v1, 0x42820000    # 65.0f

    .line 188
    .line 189
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 197
    .line 198
    const/high16 v0, 0x41700000    # 15.0f

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    const/high16 v0, 0x43140000    # 148.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v3, p0, Ll/bay;->a:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v3, v0}, Ll/bay;->i(Landroid/view/ViewGroup;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 50
    .line 51
    iget-object v3, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 67
    .line 68
    iget-object v1, p0, Ll/bay;->k:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->b(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 84
    .line 85
    const/16 v1, 0xf

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setTextSize(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 96
    .line 97
    const/high16 v1, 0x42700000    # 60.0f

    .line 98
    .line 99
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 107
    .line 108
    const/high16 v1, 0x41700000    # 15.0f

    .line 109
    .line 110
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 118
    .line 119
    const/high16 v2, -0x3e500000    # -22.0f

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/view/View;->setRotation(F)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 125
    .line 126
    const/high16 v2, 0x42480000    # 50.0f

    .line 127
    .line 128
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 136
    .line 137
    const/high16 v2, 0x41c80000    # 25.0f

    .line 138
    .line 139
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 147
    .line 148
    invoke-virtual {p0, v1}, Landroid/view/View;->setRotation(F)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final i(Landroid/view/ViewGroup;I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    check-cast v1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 17
    .line 18
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;->setWidth(I)V

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    check-cast v1, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {p0, v1, p2}, Ll/bay;->i(Landroid/view/ViewGroup;I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
