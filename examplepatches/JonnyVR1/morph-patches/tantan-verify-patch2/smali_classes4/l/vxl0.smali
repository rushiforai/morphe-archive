.class public Ll/vxl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xql;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public b:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

.field public c:Ll/ik4;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vxl0;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vxl0;->b:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getCardDataProxy()Ll/ik4;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vxl0;->c:Ll/ik4;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ik4;

    .line 6
    .line 7
    iget-object v1, p0, Ll/vxl0;->b:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ik4;-><init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/vxl0;->c:Ll/ik4;

    .line 13
    .line 14
    new-instance v1, Ll/ik4$a;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/ik4$a;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/ik4;->h(Ll/ik4$a;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/vxl0;->c:Ll/ik4;

    .line 23
    .line 24
    iget-object v1, p0, Ll/vxl0;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/ik4;->j(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/vxl0;->c:Ll/ik4;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Ll/ik4;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/vxl0;->c:Ll/ik4;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/ik4;->b()Ll/ik4$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/ik4$a;->b()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/vxl0;->c:Ll/ik4;

    .line 45
    .line 46
    return-object p0
.end method

.method public getMomentInfoProxy()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getShowPictureIndexProxy()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxl0;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserProxy()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j0(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
