.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static h:I = 0x100

.field public static i:I = 0x200

.field public static j:Ljava/lang/String; = "like"

.field public static k:Ljava/lang/String; = "interaction"

.field public static l:Ljava/lang/String; = "interested_users_front_part"

.field public static m:Ljava/lang/String; = "interested_users_removed"

.field public static n:Ljava/lang/String; = "interested_users_counter"

.field public static o:Ljava/lang/String; = "interested_users_counter_bundle"


# instance fields
.field public c:Ll/umh;

.field public d:Ll/elh;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public static X1(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "from"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "hasUnreadActivities"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "needRefreshData"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    const/high16 p0, 0x10000000

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const/high16 p0, 0x80000

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-object v0
.end method


# virtual methods
.method public Y1()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "from"

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pollUserCounters()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/umg;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/umh;->R1()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/elh;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->Y1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/hnh;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/hnh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 19
    .line 20
    new-instance v0, Ll/zmh;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/zmh;-><init>(Ll/ner;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v0, Ll/h570;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/h570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 34
    .line 35
    new-instance v0, Ll/w370;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/w370;-><init>(Ll/ner;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 41
    .line 42
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 47
    .line 48
    .line 49
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/umh;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->i:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne p1, v0, :cond_2

    .line 5
    .line 6
    if-ne p2, v1, :cond_2

    .line 7
    .line 8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->n:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p3, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->o:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p3, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->l:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    sget-object v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->m:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v4, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-nez v5, :cond_1

    .line 55
    .line 56
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz v5, :cond_1

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Ljava/lang/String;

    .line 71
    .line 72
    sget-object v6, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 73
    .line 74
    invoke-virtual {v6, v5}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_0

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 89
    .line 90
    invoke-virtual {v3, v4, v0}, Ll/elh;->y(Ljava/util/List;I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Ll/elh;->z(Ljava/util/List;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->h:I

    .line 99
    .line 100
    if-ne p1, v0, :cond_3

    .line 101
    .line 102
    if-ne p2, v1, :cond_3

    .line 103
    .line 104
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    const-string p1, "deletedMoment"

    .line 111
    .line 112
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_3

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 119
    .line 120
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p0, p1}, Ll/umh;->b1(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->d:Ll/elh;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/elh;->m()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "p_content_likes"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "p_activity"

    .line 21
    .line 22
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "from"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    move-object v1, v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v1, "activities"

    .line 20
    .line 21
    :goto_0
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->e:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "hasUnreadActivities"

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->f:Z

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "needRefreshData"

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->g:Z

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->pageId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->c:Ll/umh;

    .line 58
    .line 59
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->f:Z

    .line 60
    .line 61
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->g:Z

    .line 62
    .line 63
    invoke-virtual {v1, v0, v2, v3}, Ll/umh;->f1(Ljava/lang/String;ZZ)V

    .line 64
    .line 65
    .line 66
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
