.class public Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;Ll/pm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->e(Ll/pm0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;Ll/pm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->f(Ll/pm0;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tm0;->a(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic e(Ll/pm0;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Ll/pm0;->c:Lcom/p1/mobile/putong/data/Live;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "liked_user"

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {p2, p0, p1, v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic f(Ll/pm0;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p1, p1, Ll/pm0;->b:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "liked_users_anchor"

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-interface {v0, p0, p1, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public g(Ll/pm0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pm0;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/pm0;->a()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->h(Ll/pm0;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->i(Ll/pm0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final h(Ll/pm0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->d:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->b:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    .line 19
    .line 20
    const v1, -0x9655

    .line 21
    .line 22
    .line 23
    const v2, -0xa116

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;->d(II)V

    .line 27
    .line 28
    .line 29
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v1, p1, Ll/pm0;->b:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/q3d0;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;->getAvatarSize()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;->getAvatarSize()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-direct {v1, v2, v3}, Ll/q3d0;-><init>(II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    .line 73
    .line 74
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    new-instance v3, Ll/qm0;

    .line 78
    .line 79
    invoke-direct {v3, v2}, Ll/qm0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0, v3}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->a:Landroid/widget/RelativeLayout;

    .line 86
    .line 87
    new-instance v1, Ll/rm0;

    .line 88
    .line 89
    invoke-direct {v1, p0, p1}, Ll/rm0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;Ll/pm0;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final i(Ll/pm0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->d:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->b:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->b:Lv/VDraweeView;

    .line 21
    .line 22
    iget-object v2, p1, Ll/pm0;->b:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->a:Landroid/widget/RelativeLayout;

    .line 36
    .line 37
    new-instance v1, Ll/sm0;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/sm0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;Ll/pm0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/AnchorLikedUserItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
