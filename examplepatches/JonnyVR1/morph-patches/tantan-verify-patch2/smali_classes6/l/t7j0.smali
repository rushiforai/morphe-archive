.class public Ll/t7j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/s7j0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Ll/s7j0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    iget-object p0, p0, Ll/t7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/s7j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t7j0;->b:Ll/s7j0;

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
    check-cast p1, Ll/s7j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t7j0;->a(Ll/s7j0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p2, p0, Ll/t7j0;->b:Ll/s7j0;

    .line 10
    .line 11
    iget-object v0, p2, Ll/s7j0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p2, Ll/s7j0;->c:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v2, 0x7

    .line 16
    iget-object p2, p2, Ll/s7j0;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, v0, v1, v2, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;->O4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p2, p0, Ll/t7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const v0, 0x1020002

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v0, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/t7j0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method
