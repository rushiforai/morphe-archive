.class public Ll/pub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fub0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Ll/fub0;

.field public c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/fub0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pub0;->b:Ll/fub0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fub0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pub0;->a(Ll/fub0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    iget-object p1, p0, Ll/pub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const p2, 0x1020002

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Ll/pub0;->b:Ll/fub0;

    .line 25
    .line 26
    iget-object v1, v0, Ll/fub0;->b:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v2, v0, Ll/fub0;->c:Ljava/lang/String;

    .line 29
    .line 30
    const/16 v3, 0x8

    .line 31
    .line 32
    iget-object v0, v0, Ll/fub0;->d:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1, v1, v2, v3, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;->O4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/pub0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;

    .line 39
    .line 40
    iget-object p1, p0, Ll/pub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Ll/pub0;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;

    .line 51
    .line 52
    invoke-virtual {p1, p2, v0}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/pub0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 66
    .line 67
    .line 68
    :cond_0
    const/4 p0, 0x0

    .line 69
    return-object p0
.end method
