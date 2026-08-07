.class public Ll/lgl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;


# instance fields
.field public a:Ll/zq90;

.field public b:Ll/lp90;

.field public c:Ll/o4h0;

.field public d:Ll/rbl0;

.field public e:Ll/pu4;

.field public f:Z


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lgl0;->a:Ll/zq90;

    .line 5
    .line 6
    new-instance v0, Ll/o4h0;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/o4h0;-><init>(Ll/zq90;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/lgl0;->c:Ll/o4h0;

    .line 12
    .line 13
    new-instance v0, Ll/rbl0;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/rbl0;-><init>(Ll/zq90;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/lgl0;->d:Ll/rbl0;

    .line 19
    .line 20
    new-instance v0, Ll/pu4;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ll/pu4;-><init>(Ll/zq90;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/lgl0;->e:Ll/pu4;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic f(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/lgl0;->j(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/lgl0;->k(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/lgl0;->i(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lgl0;->c:Ll/o4h0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o4h0;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lgl0;->d:Ll/rbl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rbl0;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lgl0;->e:Ll/pu4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pu4;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/zq90;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/zq90;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lgl0;->a:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->b()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 14
    .line 15
    const-string v1, "dismissed"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Chat_VideoChat:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Ll/lgl0;->a:Ll/zq90;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/zq90;->S()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->SuperLike_VideoChat:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->VideoChat:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 38
    .line 39
    :goto_0
    iget-object v1, p0, Ll/lgl0;->b:Ll/lp90;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Ll/lgl0;->b:Ll/lp90;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->getLayoutDesc()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Ll/lp90;->l(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 54
    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iget-boolean p1, p0, Ll/lgl0;->f:Z

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Ll/lgl0;->d:Ll/rbl0;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/rbl0;->d()V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x1

    .line 68
    iput-boolean p1, p0, Ll/lgl0;->f:Z

    .line 69
    .line 70
    :cond_2
    return-object v0
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->VideoChat:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/lp90;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/lgl0;->b:Ll/lp90;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/igl0;

    .line 14
    .line 15
    invoke-direct {v2, p0, v0}, Ll/igl0;-><init>(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->VideoChat:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/jgl0;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0}, Ll/jgl0;-><init>(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->Chat:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/kgl0;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Ll/kgl0;-><init>(Ll/lgl0;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
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
    new-instance p0, Ll/pkf;

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Ll/pkf;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Ll/sbl0;

    .line 14
    .line 15
    invoke-direct {p0, p1, p2}, Ll/sbl0;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method
