.class public Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/sg5;

.field public z:Ll/yf5;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->A:Ll/sg5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sg5;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->A:Ll/sg5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sg5;->b0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    const/16 p2, 0x3e9

    .line 5
    .line 6
    if-ne p1, p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->A:Ll/sg5;

    .line 9
    .line 10
    const-string p1, "result_selected"

    .line 11
    .line 12
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/sg5;->J0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/yf5;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/yf5;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->z:Ll/yf5;

    .line 10
    .line 11
    new-instance p1, Ll/sg5;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/sg5;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->A:Ll/sg5;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->z:Ll/yf5;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderFrag;->z:Ll/yf5;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/yf5;->Z()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
