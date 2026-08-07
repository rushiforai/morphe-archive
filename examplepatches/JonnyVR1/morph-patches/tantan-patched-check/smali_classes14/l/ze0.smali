.class public Ll/ze0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ye0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/view/View;

.field public c:Lv/VFrame;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;

.field public g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

.field public h:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;

.field public i:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/ye0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ze0;->j:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ze0;->k:Ll/ye0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ze0;->f:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->setPresenter(Ll/ye0;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ze0;->g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/ze0;->k:Ll/ye0;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;->setPresenter(Ll/ye0;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ze0;->h:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ze0;->k:Ll/ye0;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;->setPresenter(Ll/ye0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ze0;->i:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 25
    .line 26
    iget-object v1, p0, Ll/ze0;->k:Ll/ye0;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->setPresenter(Ll/ye0;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/ze0;->d:Lv/VDraweeView;

    .line 34
    .line 35
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkVCRjVaR0FFWjNBVkk1SlhZQjczTUdWV0dDTUkyNTE0IiwidyI6MTEyNSwiaCI6Nzk1LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjcxMjgxMTQ2MTkzMDkxNzZ9.webp"

    .line 36
    .line 37
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/af0;->b(Ll/ze0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ye0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ze0;->k:Ll/ye0;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ze0;->f:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;

    .line 2
    .line 3
    const-string v1, "init"

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ze0;->g:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerView;

    .line 13
    .line 14
    const-string v1, "checking"

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ze0;->h:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumRenderView;

    .line 24
    .line 25
    const-string v1, "processing"

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/ze0;->i:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 35
    .line 36
    const-string v0, "finished"

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
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
    check-cast p1, Ll/ye0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ze0;->b(Ll/ye0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ze0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/ze0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
