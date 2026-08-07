.class public Ll/jp90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hp90;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jp90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jp90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->c5()Ll/cla0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/cla0;->E1(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jp90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->c5()Ll/cla0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Ll/cla0;->J1(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jp90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->g5()Ll/ima0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/ima0;->S0(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jp90;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->D:Z

    .line 4
    .line 5
    return-void
.end method
