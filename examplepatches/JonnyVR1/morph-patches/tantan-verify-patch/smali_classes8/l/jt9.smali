.class public Ll/jt9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ht9;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public b:Landroid/view/View;

.field public c:Lv/VText;

.field public d:Ll/ht9;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoPreviewAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/jt9;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jt9;->e(Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kt9;->b(Ll/jt9;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/ht9;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jt9;->d:Ll/ht9;

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
    iget-object v1, p0, Ll/jt9;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

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
    iget-object v0, p0, Ll/jt9;->c:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ll/it9;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/it9;-><init>(Ll/jt9;Ljava/util/ArrayList;)V

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

.method public final synthetic e(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jt9;->e:Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoPreviewAct;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMemePhotoZoomAct;->Z1(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/16 p2, 0x124

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ht9;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jt9;->c(Ll/ht9;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jt9;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
