.class public Ll/v7l;
.super Ll/im5;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/im5;-><init>(Ll/zq90;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/zq90;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/zq90;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/zq90;->F()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public b(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Dislike_Like_SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Dislike_Like_SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/lp90;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    instance-of v1, v1, Lv/VFrame_Shadow;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lv/VFrame_Shadow;

    .line 20
    .line 21
    new-instance v2, Ll/v7l$a;

    .line 22
    .line 23
    invoke-direct {v2, p0, v0}, Ll/v7l$a;-><init>(Ll/v7l;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lv/VFrame_Shadow;->setOnLongPressListener(Lv/VFrame_Shadow$a;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-super {p0, p1}, Ll/im5;->d(Ll/lp90;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
