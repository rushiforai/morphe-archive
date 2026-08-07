.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public H:I

.field public I:I

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->H:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->I:I

    .line 8
    .line 9
    return-void
.end method

.method public static M4(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "user_id"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public N4(I)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->I:I

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->H:I

    .line 12
    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Y4()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->b5()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 v0, 0x0

    .line 34
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/4 v4, 0x2

    .line 43
    if-ne p1, v4, :cond_3

    .line 44
    .line 45
    const-string v5, "FriendsFeedContainerFrag_Dating"

    .line 46
    .line 47
    invoke-virtual {v2, v5}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    if-nez v6, :cond_3

    .line 52
    .line 53
    sget v6, Ll/hdc0;->Q:I

    .line 54
    .line 55
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 56
    .line 57
    invoke-virtual {v3, v6, v7, v5}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 58
    .line 59
    .line 60
    :cond_3
    const/4 v5, 0x1

    .line 61
    if-ne p1, v5, :cond_4

    .line 62
    .line 63
    const-string v6, "FriendsFeedContainerFrag_Following"

    .line 64
    .line 65
    invoke-virtual {v2, v6}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    if-nez v7, :cond_4

    .line 70
    .line 71
    sget v7, Ll/hdc0;->Q:I

    .line 72
    .line 73
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->E:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 74
    .line 75
    invoke-virtual {v3, v7, v8, v6}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 76
    .line 77
    .line 78
    move v6, v5

    .line 79
    goto :goto_1

    .line 80
    :cond_4
    move v6, v1

    .line 81
    :goto_1
    if-eq p1, v5, :cond_6

    .line 82
    .line 83
    if-eq p1, v4, :cond_5

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 87
    .line 88
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->E:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 92
    .line 93
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 94
    .line 95
    :goto_2
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->H:I

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 98
    .line 99
    invoke-virtual {v3, p1}, Landroidx/fragment/app/k;->y(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_7

    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 109
    .line 110
    if-eq v0, p1, :cond_7

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3, v0}, Landroidx/fragment/app/k;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 119
    .line 120
    .line 121
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 122
    .line 123
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->B:Z

    .line 124
    .line 125
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 129
    .line 130
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->C:Z

    .line 131
    .line 132
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3}, Landroidx/fragment/app/k;->j()I

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->E:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 143
    .line 144
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 145
    .line 146
    if-ne v2, v3, :cond_8

    .line 147
    .line 148
    if-nez v6, :cond_8

    .line 149
    .line 150
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iget-boolean v2, v2, Ll/t8c;->a:Z

    .line 155
    .line 156
    if-eqz v2, :cond_8

    .line 157
    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 159
    .line 160
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->c5()V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 164
    .line 165
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 166
    .line 167
    .line 168
    :cond_8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    if-eqz v2, :cond_9

    .line 173
    .line 174
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 175
    .line 176
    if-eq v0, v2, :cond_9

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->setUserVisibleHint(Z)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 182
    .line 183
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->A:Z

    .line 184
    .line 185
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->setUserVisibleHint(Z)V

    .line 186
    .line 187
    .line 188
    :cond_9
    return p1
.end method

.method public final O4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->E:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "from_nearby_focus"

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, -0x1

    .line 30
    const-string v4, "-1"

    .line 31
    .line 32
    invoke-static {v0, v1, v3, v4, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->E:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "from_discover_dating"

    .line 47
    .line 48
    const/16 v2, 0xe

    .line 49
    .line 50
    invoke-static {v0, v1, v3, v4, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 55
    .line 56
    return-void
.end method

.method public P0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->P0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public P4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->P4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->O4()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 15
    .line 16
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 17
    .line 18
    return-object p0
.end method

.method public R4()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Q4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public S4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->V4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final T4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->O4()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->D:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->U4()Ll/hf70;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/hf70;->j0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public U4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->D:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->U4()Ll/hf70;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/hf70;->j0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public V4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Z4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->a5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->b5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->C:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->B:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->m5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->T4()V

    .line 5
    .line 6
    .line 7
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->H:I

    .line 8
    .line 9
    if-gez p1, :cond_1

    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->I:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x2

    .line 18
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->N4(I)Z

    .line 19
    .line 20
    .line 21
    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->I:I

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->w0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/hdc0;->Q:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->z:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    return-object p1
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Y4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->b5()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->A:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->A:Z

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->setUserVisibleHint(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    return-void
.end method
