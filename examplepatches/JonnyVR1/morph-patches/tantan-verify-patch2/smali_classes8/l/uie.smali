.class public Ll/uie;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uie$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/uie;->a:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Ll/vie;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ll/uie;-><init>()V

    return-void
.end method

.method public static b()Ll/uie;
    .locals 1

    .line 1
    sget-object v0, Ll/uie$b;->a:Ll/uie;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uie;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    new-instance v0, Ll/uie$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uie$a;-><init>(Ll/uie;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/uie;->d(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/y4m$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/y4m$a;)V
    .locals 6
    .param p2    # Ll/y4m$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uie;->a:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "video"

    .line 14
    .line 15
    invoke-static {p0}, Ll/ahe;->b(Ljava/lang/String;)Ll/k4;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/k4;->a()Ll/y4m;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->priority:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 30
    .line 31
    move-object v5, p2

    .line 32
    invoke-interface/range {v0 .. v5}, Ll/y4m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreGiftPriority;Ll/y4m$a;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;)V"
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
    goto :goto_1

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 23
    .line 24
    const-string v1, "LOW"

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/CoreGiftPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->priority:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/uie;->c(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 1

    .line 1
    const-string v0, "HIGH"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/CoreGiftPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->priority:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/uie;->c(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
