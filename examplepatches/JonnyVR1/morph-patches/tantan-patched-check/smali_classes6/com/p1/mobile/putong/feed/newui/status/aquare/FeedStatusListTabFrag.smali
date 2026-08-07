.class public Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Ll/p2i$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Landroidx/viewpager/widget/ViewPager$j;",
        "Ll/p2i$a<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/data/BubbleInfo;",
        ">;>;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

.field public C:Landroid/widget/TextView;

.field public D:Lcom/p1/mobile/putong/feed/newui/status/display/card/VPagerWithDefaultSize;

.field public E:Landroid/widget/LinearLayout;

.field public F:Landroid/widget/RelativeLayout;

.field public G:Landroid/widget/ImageView;

.field public H:Landroid/widget/TextView;

.field public I:Ll/e7;

.field public J:I

.field public K:Ll/p2i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/p2i<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public L:I

.field public M:Z

.field public N:Ll/s4i;

.field public O:Ll/t4i;

.field public z:Lv/navigationbar/VNavigationBar;


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
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->L:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->i5(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->b5(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->a5(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static S4(ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;
    .locals 2

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "stateId"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "userId"

    .line 17
    .line 18
    invoke-virtual {v0, p1, p4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p1, "needAppendFeed"

    .line 22
    .line 23
    invoke-virtual {v0, p1, p3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    const-string p1, "from"

    .line 27
    .line 28
    invoke-virtual {v0, p1, p5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p1, "next"

    .line 32
    .line 33
    const-string p3, ""

    .line 34
    .line 35
    invoke-virtual {v0, p1, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string p1, "initialShowIndex"

    .line 39
    .line 40
    invoke-virtual {v0, p1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string p0, "stateSquare"

    .line 44
    .line 45
    invoke-virtual {v0, p0, p6}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 49
    .line 50
    .line 51
    return-object p2
.end method

.method private T4(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t4i;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr v0, p1

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x4

    .line 11
    if-ge v0, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/p2i;->next()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private X4()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "initialShowIndex"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->J:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "stateId"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v3, "next"

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v4, "needAppendFeed"

    .line 39
    .line 40
    invoke-virtual {v3, v4, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    iput-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->M:Z

    .line 45
    .line 46
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-string v4, "userId"

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    iget-object v4, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 57
    .line 58
    const-string v5, "where_show_from"

    .line 59
    .line 60
    const-string v6, "moment"

    .line 61
    .line 62
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    const-string v7, "from"

    .line 71
    .line 72
    invoke-virtual {v6, v7}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    const-string v7, "source_page"

    .line 77
    .line 78
    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    filled-new-array {v5, v6}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v4, v5}, Ll/l4g0;->p([Ll/pf60;)V

    .line 87
    .line 88
    .line 89
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->M:Z

    .line 90
    .line 91
    if-eqz v4, :cond_0

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-interface {v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-nez v4, :cond_0

    .line 108
    .line 109
    new-instance v1, Ll/d3i;

    .line 110
    .line 111
    invoke-direct {v1, v0, v3}, Ll/d3i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    const-string v5, "stateSquare"

    .line 122
    .line 123
    invoke-virtual {v4, v5, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_1

    .line 128
    .line 129
    new-instance v0, Ll/x2i;

    .line 130
    .line 131
    invoke-direct {v0}, Ll/x2i;-><init>()V

    .line 132
    .line 133
    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-nez v2, :cond_2

    .line 142
    .line 143
    new-instance v1, Ll/l3i;

    .line 144
    .line 145
    invoke-direct {v1, v0, v3}, Ll/l3i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_2
    new-instance v0, Ll/s2i;

    .line 152
    .line 153
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 154
    .line 155
    invoke-direct {v0, v2, v1}, Ll/s2i;-><init>(Lrx/subjects/a;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 159
    .line 160
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 161
    .line 162
    invoke-interface {v0, p0}, Ll/p2i;->a(Ll/p2i$a;)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->K:Ll/p2i;

    .line 166
    .line 167
    invoke-interface {p0}, Ll/p2i;->previous()V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method private synthetic a5(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    sput-boolean v1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->p:Z

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ec()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 17
    .line 18
    if-ne p1, v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->W4()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->c5(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 28
    .line 29
    if-ne p1, v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->j5()V

    .line 32
    .line 33
    .line 34
    sget-boolean p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->p:Z

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->c5(Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public static g5(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/b4i;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b4i;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private k5()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/jka;->K7()Lrx/subjects/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/d4i;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/d4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e4i;->b(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final R4()Ll/e7;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public S0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/t4i;->e()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->F:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->G:Landroid/widget/ImageView;

    .line 23
    .line 24
    sget v0, Ll/lbc0;->c5:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->H:Landroid/widget/TextView;

    .line 30
    .line 31
    const-string v0, "\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->h5()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final U4(Ll/t4i;)Ll/e7;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ll/jxg;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/jxg;-><init>(Ll/t4i;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final V4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->Y4()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->J:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->onPageSelected(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->I:Ll/e7;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ll/i3i;->c(Lv/navigationbar/VNavigationBar;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->I:Ll/e7;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->E:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-interface {v0, p0}, Ll/i3i;->d(Landroid/widget/LinearLayout;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public W4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Y4()V
    .locals 2

    .line 1
    new-instance v0, Ll/s4i;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s4i;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 7
    .line 8
    new-instance v1, Ll/c4i;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/c4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/s4i;->v(Ll/y20;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/s4i;->s(Ll/t4i;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->D:Lcom/p1/mobile/putong/feed/newui/status/display/card/VPagerWithDefaultSize;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->D:Lcom/p1/mobile/putong/feed/newui/status/display/card/VPagerWithDefaultSize;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->D:Lcom/p1/mobile/putong/feed/newui/status/display/card/VPagerWithDefaultSize;

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->J:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->D:Lcom/p1/mobile/putong/feed/newui/status/display/card/VPagerWithDefaultSize;

    .line 43
    .line 44
    const/high16 v1, 0x41a00000    # 20.0f

    .line 45
    .line 46
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->D:Lcom/p1/mobile/putong/feed/newui/status/display/card/VPagerWithDefaultSize;

    .line 54
    .line 55
    const/4 v0, 0x2

    .line 56
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final Z4(Ll/t4i;)V
    .locals 2

    .line 1
    new-instance v0, Ll/lmd0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/lmd0;-><init>(Ll/t4i;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->I:Ll/e7;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->U4(Ll/t4i;)Ll/e7;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/e7;->e(Ll/e7;)Ll/e7;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->l5(Ll/t4i;)Ll/e7;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Ll/e7;->e(Ll/e7;)Ll/e7;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->R4()Ll/e7;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Ll/e7;->e(Ll/e7;)Ll/e7;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public bridge synthetic a3(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->d5(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b5(Ljava/util/Map;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/t4i;->e()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/t4i;->e()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    invoke-virtual {p1, p0, v0}, Ll/s4i;->t(Ll/t4i;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final c5(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s4i;->q()Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->N(ZZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public d5(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Ll/t4i;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->J:I

    .line 34
    .line 35
    invoke-direct {v0, v1, v2, v3}, Ll/t4i;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;I)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/t4i;->e()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/t4i;->e()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->g5(Ljava/util/List;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 63
    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ll/s4i;->s(Ll/t4i;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->f5()V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_0
    return-void
.end method

.method public final e5(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->L:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "state_id"

    .line 13
    .line 14
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "owner_id"

    .line 25
    .line 26
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {v1, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "e_other_state"

    .line 35
    .line 36
    const-string v2, "p_other_state"

    .line 37
    .line 38
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->L:I

    .line 42
    .line 43
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/a4i;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/a4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final f5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t4i;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->F:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->G:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget v1, Ll/lbc0;->b5:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->H:Landroid/widget/TextView;

    .line 23
    .line 24
    const-string v1, "\u4f60\u7684\u597d\u53cb\u6682\u65f6\u6ca1\u6709\u72b6\u6001"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->h5()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/16 v0, 0x8

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->Z4(Ll/t4i;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->V4()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->k5()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final h5()V
    .locals 4

    .line 1
    new-instance v0, Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-direct {v0, v1, v2, v3}, Ll/t4i;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;I)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/jxg;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ll/jxg;-><init>(Ll/t4i;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/jxg;->c(Lv/navigationbar/VNavigationBar;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/fzh;

    .line 27
    .line 28
    invoke-direct {v1, v0}, Ll/fzh;-><init>(Ll/t4i;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ll/fzh;->c(Lv/navigationbar/VNavigationBar;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final i5(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->I:Ll/e7;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/i3i;->b(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/cmg;->E()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y2()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 30
    .line 31
    sget v0, Ll/qa00;->E:I

    .line 32
    .line 33
    invoke-direct {p2, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    const/high16 v0, 0x40c00000    # 6.0f

    .line 37
    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->A:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

    .line 48
    .line 49
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-static {}, Ll/bnl0;->F0()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-static {p1, p2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->X4()V

    .line 61
    .line 62
    .line 63
    return-object p1
.end method

.method public j5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final l5(Ll/t4i;)Ll/e7;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    new-instance p0, Ll/yyh;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ll/yyh;-><init>(Ll/t4i;)V

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    new-instance p0, Ll/fzh;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Ll/fzh;-><init>(Ll/t4i;)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->I:Ll/e7;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->C:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->A:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

    .line 8
    .line 9
    invoke-interface {v0, p1, v1, v2, v3}, Ll/i3i;->a(ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedLinearWithExtraIconsView;Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->O:Ll/t4i;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/t4i;->g(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->e5(I)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->T4(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->N:Ll/s4i;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/s4i;->u(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/List;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    const-string p0, "p_my_state"

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_0
    const-string p0, "p_other_state"

    .line 68
    .line 69
    return-object p0
.end method
