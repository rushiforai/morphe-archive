.class final enum Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType$1;
.super Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;-><init>(Ljava/lang/String;ILl/m9r;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/m9r;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType$1;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getLayoutDesc()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->Like:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 7
    .line 8
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->c(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->Dislike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->c(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Ljava/lang/Boolean;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->c(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Ljava/lang/Boolean;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->OneKeyMatch:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 24
    .line 25
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->c(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method
