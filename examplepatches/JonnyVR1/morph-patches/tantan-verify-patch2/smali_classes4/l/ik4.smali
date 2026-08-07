.class public Ll/ik4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ik4$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public c:Ll/q7m;

.field public d:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

.field public e:Landroid/view/View;

.field public f:Ll/ik4$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/ik4;->d:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 18
    iput-object v0, p0, Ll/ik4;->c:Ll/q7m;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Ll/ik4;->d:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 21
    iput-object p1, p0, Ll/ik4;->e:Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Ll/q7m;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ik4;->d:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 6
    .line 7
    iput-object p1, p0, Ll/ik4;->c:Ll/q7m;

    .line 8
    .line 9
    invoke-interface {p1}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/ik4;->e:Landroid/view/View;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Ll/q7m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ik4;->c:Ll/q7m;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/ik4$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ik4;->f:Ll/ik4$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ik4;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ik4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ik4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/ik4;

    .line 20
    .line 21
    iget-object v2, p0, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v3, p1, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Ll/ik4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 32
    .line 33
    iget-object p1, p1, Ll/ik4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 34
    .line 35
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    return v0

    .line 42
    :cond_2
    :goto_0
    return v1
.end method

.method public f()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ik4;->d:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/ik4;->c:Ll/q7m;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Ll/q7m;->getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public h(Ll/ik4$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ik4;->f:Ll/ik4$a;

    .line 2
    .line 3
    return-void
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ik4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ik4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ik4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-void
.end method
