.class public Ll/kpj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kpj;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kpj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(ILcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;->bindGiftId:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;->bindTabId:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic c(ILcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;->bindTabId:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kpj;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kpj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/kpj;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

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

.method public f()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/kpj;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/kpj;->a:Ljava/util/List;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public g(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/kpj;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/kpj;->a:Ljava/util/List;

    .line 8
    .line 9
    new-instance v0, Ll/hpj;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/hpj;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public h(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/kpj;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/kpj;->a:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/ipj;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/ipj;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/kpj;->a:Ljava/util/List;

    .line 23
    .line 24
    new-instance p1, Ll/jpj;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/jpj;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    return-object p1

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kpj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 2
    .line 3
    return-object p0
.end method
