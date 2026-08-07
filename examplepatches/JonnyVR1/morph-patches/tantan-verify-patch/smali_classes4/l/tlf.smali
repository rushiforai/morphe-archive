.class public Ll/tlf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eof;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardPhotoFrame;

.field public b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public c:Lv/VLinear;

.field public d:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public j:I

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/tlf;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/tlf;->l:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Z)Lcom/p1/mobile/putong/core/data/ProfileLikeComment;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/tlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "life_pic"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/tlf;->k:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->picture:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "\u751f\u6d3b\u7167"

    .line 28
    .line 29
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p0, p0, Ll/tlf;->l:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 34
    .line 35
    iput-boolean p1, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->hasComment:Z

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->toJson()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 42
    .line 43
    return-object v0
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tlf;->g:Landroid/view/View;

    .line 2
    .line 3
    filled-new-array {v0}, [Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/tlf;->g:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/tlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p1, p0, Ll/tlf;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iput p3, p0, Ll/tlf;->j:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tlf;->i()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/tlf;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/tlf;->g:Landroid/view/View;

    .line 14
    .line 15
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 23
    .line 24
    iget-object v1, p0, Ll/tlf;->g:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/tlf;->h()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ulf;->a(Ll/tlf;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ulf;->b(Ll/tlf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tlf;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/tlf;->f(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tlf;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v2, v1, v2, v2}, Lcom/p1/mobile/putong/core/ui/PictureView;->L(ZZZZ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/tlf;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 14
    .line 15
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N:Z

    .line 16
    .line 17
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p0, Ll/tlf;->k:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Ll/tlf;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method
