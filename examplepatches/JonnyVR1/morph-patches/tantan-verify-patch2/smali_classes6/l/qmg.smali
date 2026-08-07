.class public Ll/qmg;
.super Ll/umh;
.source "SourceFile"


# instance fields
.field public m:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

.field public n:Ll/rmg;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/umh;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qmg;->m:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v0, "tab_tag"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/umh;->b:I

    .line 23
    .line 24
    const-string v0, "from"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/umh;->a:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "needRefreshData"

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput-boolean p1, p0, Ll/umh;->e:Z

    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic W1(Ll/qmg;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qmg;->X1(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public final synthetic X1(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qmg;->n:Ll/rmg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/elh;->z(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rmg;

    .line 4
    .line 5
    iput-object v0, p0, Ll/qmg;->n:Ll/rmg;

    .line 6
    .line 7
    invoke-super {p0}, Ll/umh;->a0()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 11
    .line 12
    iget-object v0, v0, Ll/jka;->X0:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pmg;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/pmg;-><init>(Ll/qmg;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
