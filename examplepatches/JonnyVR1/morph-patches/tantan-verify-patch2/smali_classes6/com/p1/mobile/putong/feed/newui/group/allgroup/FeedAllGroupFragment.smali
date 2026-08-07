.class public Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/wng;

.field public z:Ll/xng;


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

.method public static M4(I)Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;-><init>()V

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
    const-string v2, "page_type"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

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
.method public N4()V
    .locals 1

    .line 1
    new-instance v0, Ll/xng;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xng;-><init>(Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->z:Ll/xng;

    .line 7
    .line 8
    new-instance v0, Ll/wng;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/wng;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->A:Ll/wng;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->z:Ll/xng;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public O4()Ll/wng;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->A:Ll/wng;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->A:Ll/wng;

    .line 9
    .line 10
    return-object p0
.end method

.method public P4()Ll/xng;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->z:Ll/xng;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->z:Ll/xng;

    .line 9
    .line 10
    return-object p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->O4()Ll/wng;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/wng;->a0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->z:Ll/xng;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/xng;->d(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->P4()Ll/xng;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xng;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->O4()Ll/wng;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wng;->i0()V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->z:Ll/xng;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xng;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
