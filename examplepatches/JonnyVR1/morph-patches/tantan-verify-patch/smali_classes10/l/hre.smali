.class public Ll/hre;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/x20;

.field public d:Ll/x20;

.field public e:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ll/udl0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEffect;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hre;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hre;->g:Ljava/util/List;

    .line 3
    .line 4
    return-void
.end method

.method public b()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hre;->c:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hre;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hre;->g:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hre;->d:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/pcj;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hre;->b:Ll/pcj;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hre;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/z20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/z20<",
            "Ll/udl0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEffect;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hre;->e:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/x20;)Ll/hre;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hre;->c:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/util/List;)Ll/hre;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;",
            ">;)",
            "Ll/hre;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iput-object p1, p0, Ll/hre;->f:Ljava/util/List;

    .line 9
    .line 10
    return-object p0
.end method

.method public k(Ljava/util/List;)Ll/hre;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;)",
            "Ll/hre;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hre;->g:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Ll/x20;)Ll/hre;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hre;->d:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/pcj;)Ll/hre;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/hre;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hre;->b:Ll/pcj;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ll/z20;)Ll/hre;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ll/udl0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEffect;",
            ">;)",
            "Ll/hre;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hre;->e:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method
