.class Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;
.super Lcom/google/common/collect/MapMakerInternalMap$AbstractStrongKeyEntry;
.source "MapMakerInternalMap.java"

# interfaces
.implements Lcom/google/common/collect/MapMakerInternalMap$StrongValueEntry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MapMakerInternalMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StrongKeyStrongValueEntry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry$Helper;,
        Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry$LinkedStrongKeyStrongValueEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/MapMakerInternalMap$AbstractStrongKeyEntry<",
        "TK;TV;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry<",
        "TK;TV;>;>;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongValueEntry<",
        "TK;TV;",
        "Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry<",
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
.method private constructor <init>(Ljava/lang/Object;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "hash"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)V"
        }
    .end annotation

    .line 393
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$AbstractStrongKeyEntry;-><init>(Ljava/lang/Object;I)V

    const/4 p1, 0x0

    .line 390
    iput-object p1, p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;ILcom/google/common/collect/MapMakerInternalMap$1;)V
    .registers 4

    .line 387
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;-><init>(Ljava/lang/Object;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;)Ljava/lang/Object;
    .registers 1

    .line 387
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$202(Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 387
    iput-object p1, p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;->value:Ljava/lang/Object;

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

    .line 398
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry;->value:Ljava/lang/Object;

    return-object p0
.end method
