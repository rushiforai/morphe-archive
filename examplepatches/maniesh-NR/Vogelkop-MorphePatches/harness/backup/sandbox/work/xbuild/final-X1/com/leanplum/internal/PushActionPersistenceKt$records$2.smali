.class final Lcom/leanplum/internal/PushActionPersistenceKt$records$2;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/PushActionPersistenceKt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lozb;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0010\t\n\u0000\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/leanplum/internal/PushActionPersistenceKt$records$2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/PushActionPersistenceKt$records$2;

    invoke-direct {v0}, Lcom/leanplum/internal/PushActionPersistenceKt$records$2;-><init>()V

    sput-object v0, Lcom/leanplum/internal/PushActionPersistenceKt$records$2;->INSTANCE:Lcom/leanplum/internal/PushActionPersistenceKt$records$2;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .registers 1

    .line 79
    invoke-virtual {p0}, Lcom/leanplum/internal/PushActionPersistenceKt$records$2;->invoke()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    # invokes: Lcom/leanplum/internal/PushActionPersistenceKt;->load()Ljava/util/Map;
    invoke-static {}, Lcom/leanplum/internal/PushActionPersistenceKt;->access$load()Ljava/util/Map;

    move-result-object p0

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_11
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {}, Lcom/leanplum/internal/Clock;->getInstance()Lcom/leanplum/internal/Clock;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Lcom/leanplum/internal/Clock;->lessThanMonthAgo(J)Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    :cond_3d
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    if-ge v1, p0, :cond_4a

    # invokes: Lcom/leanplum/internal/PushActionPersistenceKt;->save(Ljava/util/Map;)V
    invoke-static {v0}, Lcom/leanplum/internal/PushActionPersistenceKt;->access$save(Ljava/util/Map;)V

    :cond_4a
    invoke-static {v0}, Ly9m;->r(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method
