.class Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;
.super Lcom/google/common/collect/MapMakerInternalMap$AbstractWeakKeyEntry;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$StrongValueEntry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WeakKeyStrongValueEntry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry$Helper;,
        Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry$LinkedWeakKeyStrongValueEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/MapMakerInternalMap$AbstractWeakKeyEntry<",
        "TK;TV;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry<",
        "TK;TV;>;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongValueEntry<",
        "TK;TV;",
        "Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private volatile value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "queue",
            "key",
            "hash"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;TK;I)V"
        }
    .end annotation

    .line 786
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$AbstractWeakKeyEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V

    const/4 p1, 0x0

    .line 783
    iput-object p1, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$1;)V
    .registers 5

    .line 780
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;-><init>(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;)Ljava/lang/Object;
    .registers 1

    .line 780
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 780
    iput-object p1, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-object p1
.end method


# virtual methods
.method public final getValue()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 791
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-object p0
.end method
