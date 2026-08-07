.class public Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tantanapp/common/data/ValueObject;",
        "V:",
        "Lcom/tantanapp/common/data/ValueObject;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/HashMap<",
        "TK;TT;>;"
    }
.end annotation


# instance fields
.field jsonAdapter:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;"
        }
    .end annotation
.end field

.field old:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;->jsonAdapter:Lcom/tantanapp/common/data/JsonAdapter;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Lcom/tantanapp/common/data/ValueObject;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;->old:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;->jsonAdapter:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;->get(Ljava/lang/Object;)Lcom/tantanapp/common/data/ValueObject;

    move-result-object p0

    return-object p0
.end method

.method public getOriginMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;->old:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public setOldList(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/dbcenter/db/bus/ModuleTransMap;->old:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method
