.class final Lcom/google/common/hash/ChecksumHashFunction;
.super Lcom/google/common/hash/AbstractHashFunction;
.source "ChecksumHashFunction.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation runtime Lcom/google/errorprone/annotations/Immutable;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/hash/ChecksumHashFunction$ChecksumHasher;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final bits:I

.field private final checksumSupplier:Lcom/google/common/hash/ImmutableSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/hash/ImmutableSupplier<",
            "+",
            "Ljava/util/zip/Checksum;",
            ">;"
        }
    .end annotation
.end field

.field private final toString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/common/hash/ImmutableSupplier;ILjava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "checksumSupplier",
            "bits",
            "toString"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/hash/ImmutableSupplier<",
            "+",
            "Ljava/util/zip/Checksum;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Lcom/google/common/hash/AbstractHashFunction;-><init>()V

    .line 39
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/hash/ImmutableSupplier;

    iput-object p1, p0, Lcom/google/common/hash/ChecksumHashFunction;->checksumSupplier:Lcom/google/common/hash/ImmutableSupplier;

    const/16 p1, 0x20

    if-eq p2, p1, :cond_0

    const/16 p1, 0x40

    if-eq p2, p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 40
    :goto_0
    const-string v0, "bits (%s) must be either 32 or 64"

    invoke-static {p1, v0, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 41
    iput p2, p0, Lcom/google/common/hash/ChecksumHashFunction;->bits:I

    .line 42
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/common/hash/ChecksumHashFunction;->toString:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100(Lcom/google/common/hash/ChecksumHashFunction;)I
    .registers 1

    .line 32
    iget p0, p0, Lcom/google/common/hash/ChecksumHashFunction;->bits:I

    return p0
.end method


# virtual methods
.method public bits()I
    .registers 1

    .line 47
    iget p0, p0, Lcom/google/common/hash/ChecksumHashFunction;->bits:I

    return p0
.end method

.method public newHasher()Lcom/google/common/hash/Hasher;
    .registers 4

    .line 52
    new-instance v0, Lcom/google/common/hash/ChecksumHashFunction$ChecksumHasher;

    iget-object v1, p0, Lcom/google/common/hash/ChecksumHashFunction;->checksumSupplier:Lcom/google/common/hash/ImmutableSupplier;

    invoke-interface {v1}, Lcom/google/common/hash/ImmutableSupplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/Checksum;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/google/common/hash/ChecksumHashFunction$ChecksumHasher;-><init>(Lcom/google/common/hash/ChecksumHashFunction;Ljava/util/zip/Checksum;Lcom/google/common/hash/ChecksumHashFunction$1;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 57
    iget-object p0, p0, Lcom/google/common/hash/ChecksumHashFunction;->toString:Ljava/lang/String;

    return-object p0
.end method
