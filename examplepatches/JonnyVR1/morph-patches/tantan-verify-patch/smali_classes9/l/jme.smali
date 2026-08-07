.class public Ll/jme;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/jme;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jme;->V()V

    return-void
.end method


# virtual methods
.method public S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kme;->b(Ll/jme;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    iget-object v2, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ge v1, v2, :cond_1

    .line 22
    .line 23
    iget-object v2, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->m0()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-object v0
.end method

.method public U()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    move v0, v1

    .line 11
    :goto_0
    iget-object v2, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 20
    .line 21
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->m0()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return v1
.end method

.method public final synthetic V()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->Z2()I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public W(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setMedia(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->setIllegalVisible(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41200000    # 10.0f

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setElevation(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->Y0()Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-virtual {p1, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/jme;->S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 14
    .line 15
    invoke-static {}, Ll/zk1;->b()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 23
    .line 24
    new-instance v1, Ll/adf;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/adf;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setConfig(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards$b;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setMedia(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/jme;->u:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 48
    .line 49
    new-instance v1, Ll/ime;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ime;-><init>(Ll/jme;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setOnMediaChanged(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    return-object p1
.end method

.method public t()V
    .locals 0

    .line 1
    return-void
.end method
