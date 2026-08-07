.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->p(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;I)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x64

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-ne p1, v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 13
    .line 14
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    move v0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v2

    .line 25
    :goto_0
    invoke-static {v3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 29
    .line 30
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move v0, v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v0, v2

    .line 41
    :goto_1
    invoke-static {v3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 61
    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->a:Lv/VText;

    .line 68
    .line 69
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    goto/16 :goto_3

    .line 73
    .line 74
    :cond_2
    const/16 v0, 0x65

    .line 75
    .line 76
    if-ne p1, v0, :cond_3

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 81
    .line 82
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 88
    .line 89
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 95
    .line 96
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 102
    .line 103
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 109
    .line 110
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->a:Lv/VText;

    .line 116
    .line 117
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_3
    const/16 v0, 0x66

    .line 122
    .line 123
    if-ne p1, v0, :cond_5

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 135
    .line 136
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->a:Lv/VText;

    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 147
    .line 148
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 151
    .line 152
    .line 153
    move-result-wide v0

    .line 154
    const-wide/16 v2, 0xbb8

    .line 155
    .line 156
    cmp-long v0, v0, v2

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 159
    .line 160
    if-gez v0, :cond_4

    .line 161
    .line 162
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 163
    .line 164
    sget v1, Ll/lbc0;->j3:I

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_4
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 171
    .line 172
    sget v1, Ll/lbc0;->i3:I

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 175
    .line 176
    .line 177
    :goto_2
    new-instance v0, Ll/pf60;

    .line 178
    .line 179
    const-string v1, "event_type"

    .line 180
    .line 181
    const-string v2, "MV"

    .line 182
    .line 183
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    filled-new-array {v0}, [Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    const-string v1, "e_camera_video_next"

    .line 191
    .line 192
    const-string v2, "p_camera_video"

    .line 193
    .line 194
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_5
    const/16 v0, 0x67

    .line 199
    .line 200
    if-ne p1, v0, :cond_6

    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 203
    .line 204
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 205
    .line 206
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 212
    .line 213
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    :cond_6
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 217
    .line 218
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    if-eqz v0, :cond_7

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 225
    .line 226
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->a(I)V

    .line 231
    .line 232
    .line 233
    :cond_7
    return-void
.end method

.method public onEvent(II)V
    .locals 4

    .line 1
    const/16 v0, 0x68

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 17
    .line 18
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v3, 0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    move v0, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v1

    .line 30
    :goto_0
    invoke-static {v2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    move v0, v3

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v0, v1

    .line 46
    :goto_1
    invoke-static {v2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->a:Lv/VText;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    const-wide/16 v2, 0xbb8

    .line 86
    .line 87
    cmp-long v0, v0, v2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 90
    .line 91
    if-gez v0, :cond_3

    .line 92
    .line 93
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 94
    .line 95
    sget v1, Ll/lbc0;->j3:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 102
    .line 103
    sget v1, Ll/lbc0;->i3:I

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    const/16 v0, 0x69

    .line 110
    .line 111
    if-ne p1, v0, :cond_5

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 114
    .line 115
    const/16 v2, 0xf

    .line 116
    .line 117
    invoke-static {v0, v1, v2, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->q(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;III)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const-string v1, "<b><font size=\"5\">%d</font><font size=\"3\">s</font></b>"

    .line 130
    .line 131
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->a:Lv/VText;

    .line 138
    .line 139
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 147
    .line 148
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    if-eqz v0, :cond_6

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 155
    .line 156
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->onEvent(II)V

    .line 161
    .line 162
    .line 163
    :cond_6
    return-void
.end method
