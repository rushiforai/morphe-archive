.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/qmg;

.field public B:Ll/rmg;

.field public z:Ll/v370;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v370;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/v370;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->z:Ll/v370;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->Q4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->R4()V

    return-void
.end method

.method private O4()V
    .locals 1

    .line 1
    new-instance v0, Ll/qmg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qmg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->A:Ll/qmg;

    .line 7
    .line 8
    new-instance v0, Ll/rmg;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/rmg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->B:Ll/rmg;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->A:Ll/qmg;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic Q4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->T4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic R4()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->U4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static S4(ILjava/lang/String;Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;-><init>()V

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
    const-string v2, "tab_tag"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    const-string p0, "from"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "needRefreshData"

    .line 22
    .line 23
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method private T4()V
    .locals 0

    .line 1
    return-void
.end method

.method private U4()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public P4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->A:Ll/qmg;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/umh;->d1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->O4()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->A:Ll/qmg;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/qmg;->a0()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/jnh;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/jnh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/knh;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/knh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->B:Ll/rmg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rmg;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
