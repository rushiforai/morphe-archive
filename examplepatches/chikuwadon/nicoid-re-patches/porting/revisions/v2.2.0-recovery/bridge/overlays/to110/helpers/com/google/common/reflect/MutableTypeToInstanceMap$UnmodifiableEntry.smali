.class final Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;
.super Lcom/google/common/collect/ForwardingMapEntry;
.source "MutableTypeToInstanceMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/MutableTypeToInstanceMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnmodifiableEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMapEntry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final delegate:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$PXRRP_NYxQ7IKAyO13H8YX2p-q0(Ljava/util/Map$Entry;)Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;
    .registers 2

    new-instance v0, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;-><init>(Ljava/util/Map$Entry;)V

    return-object v0
.end method

.method private constructor <init>(Ljava/util/Map$Entry;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 161
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMapEntry;-><init>()V

    .line 162
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    iput-object p1, p0, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;->delegate:Ljava/util/Map$Entry;

    return-void
.end method

.method static synthetic access$000(Ljava/util/Iterator;)Ljava/util/Iterator;
    .registers 1

    .line 117
    invoke-static {p0}, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;->transformEntries(Ljava/util/Iterator;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method private static transformEntries(Ljava/util/Iterator;)Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entries"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;)",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 158
    new-instance v0, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry$0;

    invoke-direct {v0}, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry$0;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method static transformEntries(Ljava/util/Set;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entries"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;)",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 124
    new-instance v0, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry$1;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry$1;-><init>(Ljava/util/Set;)V

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 117
    invoke-virtual {p0}, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected delegate()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 167
    iget-object p0, p0, Lcom/google/common/reflect/MutableTypeToInstanceMap$UnmodifiableEntry;->delegate:Ljava/util/Map$Entry;

    return-object p0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .line 173
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
