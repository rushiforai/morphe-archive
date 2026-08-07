.class public Ll/vlf;
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
    iput-object v0, p0, Ll/vlf;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/vlf;->l:Ljava/lang/String;

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
    iget-object v1, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

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
    iget-object v2, p0, Ll/vlf;->k:Ljava/lang/String;

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
    iget-object p0, p0, Ll/vlf;->l:Ljava/lang/String;

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
    iget-object v0, p0, Ll/vlf;->g:Landroid/view/View;

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
    iget-object p0, p0, Ll/vlf;->g:Landroid/view/View;

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
    iput-object p2, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p1, p0, Ll/vlf;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iput p3, p0, Ll/vlf;->j:I

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isMomentInfoCard()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p3}, Ll/vlf;->j(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 20
    .line 21
    invoke-virtual {p0, p3}, Ll/vlf;->k(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2, p3}, Ll/vlf;->l(Lcom/p1/mobile/putong/data/User;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u8d5e\u4e86\u4f60\u7684\u751f\u6d3b\u7167"

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
    invoke-virtual {p0, v0, p1}, Ll/vlf;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/vlf;->g:Landroid/view/View;

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
    iget-object v1, p0, Ll/vlf;->g:Landroid/view/View;

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
    invoke-virtual {p0}, Ll/vlf;->h()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wlf;->a(Ll/vlf;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wlf;->b(Ll/vlf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v0, p0, Ll/vlf;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/vlf;->f(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vlf;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

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
    iget-object p0, p0, Ll/vlf;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 14
    .line 15
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N:Z

    .line 16
    .line 17
    return-void
.end method

.method public i()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vlf;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p0, p0, Ll/vlf;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_1
    :goto_0
    return v1
.end method

.method public final j(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vlf;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/vlf;->i()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0, p1}, Ll/vlf;->k(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Ll/vlf;->l(Lcom/p1/mobile/putong/data/User;I)V

    .line 32
    .line 33
    .line 34
    :cond_2
    :goto_0
    return-void
.end method

.method public final k(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-le v0, p1, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/vlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Ll/vlf;->k:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p0, p0, Ll/vlf;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/data/User;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/vlf;->f:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vlf;->c:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-le v0, p2, :cond_6

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_6

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v2, 0x1

    .line 47
    if-nez v0, :cond_5

    .line 48
    .line 49
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ll/gj40;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const/4 v3, 0x0

    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v0, p0, Ll/vlf;->l:Ljava/lang/String;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-nez v4, :cond_1

    .line 91
    .line 92
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    move-object v3, p1

    .line 97
    check-cast v3, Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    const-string v0, ""

    .line 101
    .line 102
    :cond_1
    :goto_0
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_5

    .line 107
    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_5

    .line 113
    .line 114
    invoke-static {}, Ll/gra;->z()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_2

    .line 119
    .line 120
    invoke-static {}, Ll/zgf;->Z()Ljava/util/HashMap;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->id:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Ljava/lang/String;

    .line 131
    .line 132
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->categoryBackground:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->categoryTextColor:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-eqz v5, :cond_3

    .line 141
    .line 142
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IktPV0g3U0hGRUhQQVpQUUs0STdXNkxSUzVDRzRaNDE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_2
    iget-object p1, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->categoryIcon:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->categoryBackground:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->categoryTextColor:Ljava/lang/String;

    .line 150
    .line 151
    :cond_3
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-nez v5, :cond_5

    .line 156
    .line 157
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    if-nez v5, :cond_5

    .line 162
    .line 163
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    if-nez v5, :cond_5

    .line 168
    .line 169
    :try_start_0
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    iget-object v5, p0, Ll/vlf;->c:Lv/VLinear;

    .line 176
    .line 177
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Ll/vlf;->d:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 181
    .line 182
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    .line 186
    .line 187
    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 188
    .line 189
    .line 190
    const/high16 v6, 0x40c00000    # 6.0f

    .line 191
    .line 192
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 193
    .line 194
    .line 195
    move-result v6

    .line 196
    int-to-float v6, v6

    .line 197
    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 198
    .line 199
    .line 200
    new-instance v6, Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v7

    .line 209
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    new-array v4, v4, [I

    .line 232
    .line 233
    move v7, v1

    .line 234
    :goto_2
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 235
    .line 236
    .line 237
    move-result v8

    .line 238
    if-ge v7, v8, :cond_4

    .line 239
    .line 240
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v8

    .line 244
    check-cast v8, Ljava/lang/Integer;

    .line 245
    .line 246
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 247
    .line 248
    .line 249
    move-result v8

    .line 250
    aput v8, v4, v7

    .line 251
    .line 252
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v8

    .line 256
    check-cast v8, Ljava/lang/Integer;

    .line 257
    .line 258
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 259
    .line 260
    .line 261
    move-result v8

    .line 262
    aput v8, v4, v7

    .line 263
    .line 264
    add-int/lit8 v7, v7, 0x1

    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_4
    invoke-virtual {v5, v4}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 268
    .line 269
    .line 270
    iget-object v4, p0, Ll/vlf;->c:Lv/VLinear;

    .line 271
    .line 272
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 273
    .line 274
    .line 275
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 276
    .line 277
    iget-object v5, p0, Ll/vlf;->d:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 278
    .line 279
    invoke-virtual {v4, v5, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    iget-object p1, p0, Ll/vlf;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 283
    .line 284
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 289
    .line 290
    .line 291
    iget-object p1, p0, Ll/vlf;->e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 292
    .line 293
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :catch_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 298
    .line 299
    const-string v0, " \u56fe\u7247\u6807\u7b7e\u989c\u8272\u914d\u7f6e\u9519\u8bef"

    .line 300
    .line 301
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 305
    .line 306
    .line 307
    :cond_5
    iget-object p1, p0, Ll/vlf;->i:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 308
    .line 309
    if-eqz p1, :cond_6

    .line 310
    .line 311
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isMomentInfoCard()Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-eqz p1, :cond_6

    .line 316
    .line 317
    if-nez p2, :cond_6

    .line 318
    .line 319
    invoke-virtual {p0}, Ll/vlf;->i()Z

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    if-nez p1, :cond_6

    .line 324
    .line 325
    iget-object p1, p0, Ll/vlf;->c:Lv/VLinear;

    .line 326
    .line 327
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 328
    .line 329
    .line 330
    iget-object p1, p0, Ll/vlf;->d:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 331
    .line 332
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 333
    .line 334
    .line 335
    iget-object p1, p0, Ll/vlf;->f:Lv/VText;

    .line 336
    .line 337
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 338
    .line 339
    .line 340
    iget-object p0, p0, Ll/vlf;->f:Lv/VText;

    .line 341
    .line 342
    const/4 p1, 0x3

    .line 343
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-virtual {p0, p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 348
    .line 349
    .line 350
    :cond_6
    return-void
.end method
