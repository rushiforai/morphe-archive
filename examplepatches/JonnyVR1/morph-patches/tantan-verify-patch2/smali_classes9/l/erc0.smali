.class public Ll/erc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;


# instance fields
.field public a:Ll/zq90;

.field public b:Ll/brc0;

.field public c:Ll/lp90;


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/erc0;->a:Ll/zq90;

    .line 5
    .line 6
    new-instance v0, Ll/brc0;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/brc0;-><init>(Ll/zq90;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/erc0;->b:Ll/brc0;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic f(Ll/erc0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/erc0;->g(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V

    return-void
.end method

.method private synthetic g(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/erc0;->b:Ll/brc0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/brc0;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/zq90;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/zq90;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/zq90;->T()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public b(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/erc0;->a:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/zq90;->b()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 14
    .line 15
    const-string v0, "dismissed"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->None:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Recovery_Single:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 27
    .line 28
    :goto_0
    iget-object v0, p0, Ll/erc0;->c:Ll/lp90;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/erc0;->c:Ll/lp90;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->getLayoutDesc()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/lp90;->l(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-object p1
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->None:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/lp90;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/erc0;->c:Ll/lp90;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->Recovery:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/drc0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/drc0;-><init>(Ll/erc0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)Ll/lp90;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/fkf;

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Ll/fkf;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Ll/crc0;

    .line 14
    .line 15
    invoke-direct {p0, p1, p2}, Ll/crc0;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method
