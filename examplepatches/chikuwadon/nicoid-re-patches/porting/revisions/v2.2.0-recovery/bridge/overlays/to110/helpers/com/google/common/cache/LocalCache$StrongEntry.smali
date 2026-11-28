.class Lcom/google/common/cache/LocalCache$StrongEntry;
.super Lcom/google/common/cache/LocalCache$AbstractReferenceEntry;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StrongEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/LocalCache$AbstractReferenceEntry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final hash:I

.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final next:Lcom/google/common/cache/ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field volatile valueReference:Lcom/google/common/cache/LocalCache$ValueReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ValueReference<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;ILcom/google/common/cache/ReferenceEntry;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "hash",
            "next"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 974
    invoke-direct {p0}, Lcom/google/common/cache/LocalCache$AbstractReferenceEntry;-><init>()V

    .line 989
    invoke-static {}, Lcom/google/common/cache/LocalCache;->unset()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->valueReference:Lcom/google/common/cache/LocalCache$ValueReference;

    .line 975
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->key:Ljava/lang/Object;

    .line 976
    iput p2, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->hash:I

    .line 977
    iput-object p3, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->next:Lcom/google/common/cache/ReferenceEntry;

    return-void
.end method


# virtual methods
.method public getHash()I
    .registers 1

    .line 1003
    iget p0, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->hash:I

    return p0
.end method

.method public getKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 982
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->key:Ljava/lang/Object;

    return-object p0
.end method

.method public getNext()Lcom/google/common/cache/ReferenceEntry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/ReferenceEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1008
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->next:Lcom/google/common/cache/ReferenceEntry;

    return-object p0
.end method

.method public getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ValueReference<",
            "TK;TV;>;"
        }
    .end annotation

    .line 993
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->valueReference:Lcom/google/common/cache/LocalCache$ValueReference;

    return-object p0
.end method

.method public setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "valueReference"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ValueReference<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 998
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$StrongEntry;->valueReference:Lcom/google/common/cache/LocalCache$ValueReference;

    return-void
.end method
