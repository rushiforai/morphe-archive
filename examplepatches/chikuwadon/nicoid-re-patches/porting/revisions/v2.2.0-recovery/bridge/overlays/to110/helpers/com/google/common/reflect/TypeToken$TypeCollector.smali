.class abstract Lcom/google/common/reflect/TypeToken$TypeCollector;
.super Ljava/lang/Object;
.source "TypeToken.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/TypeToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "TypeCollector"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/reflect/TypeToken$TypeCollector$ForwardingTypeCollector;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final FOR_GENERIC_TYPE:Lcom/google/common/reflect/TypeToken$TypeCollector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/reflect/TypeToken$TypeCollector<",
            "Lcom/google/common/reflect/TypeToken<",
            "*>;>;"
        }
    .end annotation
.end field

.field static final FOR_RAW_TYPE:Lcom/google/common/reflect/TypeToken$TypeCollector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/reflect/TypeToken$TypeCollector<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1331
    new-instance v0, Lcom/google/common/reflect/TypeToken$TypeCollector$1;

    invoke-direct {v0}, Lcom/google/common/reflect/TypeToken$TypeCollector$1;-><init>()V

    sput-object v0, Lcom/google/common/reflect/TypeToken$TypeCollector;->FOR_GENERIC_TYPE:Lcom/google/common/reflect/TypeToken$TypeCollector;

    .line 1349
    new-instance v0, Lcom/google/common/reflect/TypeToken$TypeCollector$2;

    invoke-direct {v0}, Lcom/google/common/reflect/TypeToken$TypeCollector$2;-><init>()V

    sput-object v0, Lcom/google/common/reflect/TypeToken$TypeCollector;->FOR_RAW_TYPE:Lcom/google/common/reflect/TypeToken$TypeCollector;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 1329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/reflect/TypeToken$1;)V
    .registers 2

    .line 1329
    invoke-direct {p0}, Lcom/google/common/reflect/TypeToken$TypeCollector;-><init>()V

    return-void
.end method

.method private collectTypes(Ljava/lang/Object;Ljava/util/Map;)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "type",
            "map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Map<",
            "-TK;",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1404
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 1407
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 1410
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/reflect/TypeToken$TypeCollector;->getRawType(Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    .line 1411
    invoke-virtual {p0, p1}, Lcom/google/common/reflect/TypeToken$TypeCollector;->getInterfaces(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1412
    invoke-direct {p0, v2, p2}, Lcom/google/common/reflect/TypeToken$TypeCollector;->collectTypes(Ljava/lang/Object;Ljava/util/Map;)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_0

    .line 1414
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/common/reflect/TypeToken$TypeCollector;->getSuperclass(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1416
    invoke-direct {p0, v1, p2}, Lcom/google/common/reflect/TypeToken$TypeCollector;->collectTypes(Ljava/lang/Object;Ljava/util/Map;)I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 1423
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method private static sortKeysByValue(Ljava/util/Map;Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableList;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "map",
            "valueComparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Ljava/util/Comparator<",
            "-TV;>;)",
            "Lcom/google/common/collect/ImmutableList<",
            "TK;>;"
        }
    .end annotation

    .line 1429
    new-instance v0, Lcom/google/common/reflect/TypeToken$TypeCollector$4;

    invoke-direct {v0, p1, p0}, Lcom/google/common/reflect/TypeToken$TypeCollector$4;-><init>(Ljava/util/Comparator;Ljava/util/Map;)V

    .line 1438
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/common/collect/Ordering;->immutableSortedCopy(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method final classesOnly()Lcom/google/common/reflect/TypeToken$TypeCollector;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken$TypeCollector<",
            "TK;>;"
        }
    .end annotation

    .line 1369
    new-instance v0, Lcom/google/common/reflect/TypeToken$TypeCollector$3;

    invoke-direct {v0, p0, p0}, Lcom/google/common/reflect/TypeToken$TypeCollector$3;-><init>(Lcom/google/common/reflect/TypeToken$TypeCollector;Lcom/google/common/reflect/TypeToken$TypeCollector;)V

    return-object v0
.end method

.method collectTypes(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+TK;>;)",
            "Lcom/google/common/collect/ImmutableList<",
            "TK;>;"
        }
    .end annotation

    .line 1394
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1395
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1396
    invoke-direct {p0, v1, v0}, Lcom/google/common/reflect/TypeToken$TypeCollector;->collectTypes(Ljava/lang/Object;Ljava/util/Map;)I

    goto :goto_0

    .line 1398
    :cond_0
    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/Ordering;->reverse()Lcom/google/common/collect/Ordering;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/common/reflect/TypeToken$TypeCollector;->sortKeysByValue(Ljava/util/Map;Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method final collectTypes(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/google/common/collect/ImmutableList<",
            "TK;>;"
        }
    .end annotation

    .line 1389
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/reflect/TypeToken$TypeCollector;->collectTypes(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method abstract getInterfaces(Ljava/lang/Object;)Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/lang/Iterable<",
            "+TK;>;"
        }
    .end annotation
.end method

.method abstract getRawType(Ljava/lang/Object;)Ljava/lang/Class;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end method

.method abstract getSuperclass(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TK;"
        }
    .end annotation
.end method
