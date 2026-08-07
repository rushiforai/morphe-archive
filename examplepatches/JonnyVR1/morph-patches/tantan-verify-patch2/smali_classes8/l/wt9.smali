.class public Ll/wt9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ut9;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/View;

.field public c:Lv/VText;

.field public d:Ll/ut9;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/wt9;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/wt9;->e(Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/wt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "e_add_stickers"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/wt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;

    .line 13
    .line 14
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->p7:I

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/wt9;->d:Ll/ut9;

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ut9;->s0(Lcom/p1/mobile/putong/data/Media;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xt9;->b(Ll/wt9;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/ut9;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wt9;->d:Ll/ut9;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/wt9;->a:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/wt9;->c:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ll/vt9;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/vt9;-><init>(Ll/wt9;Ljava/util/ArrayList;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    :cond_0
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
    check-cast p1, Ll/ut9;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wt9;->c(Ll/ut9;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wt9;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
