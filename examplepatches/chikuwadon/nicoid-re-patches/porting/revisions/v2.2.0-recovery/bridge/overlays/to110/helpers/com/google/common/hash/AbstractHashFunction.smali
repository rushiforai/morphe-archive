.class abstract Lcom/google/common/hash/AbstractHashFunction;
.super Ljava/lang/Object;
.source "AbstractHashFunction.java"

# interfaces
.implements Lcom/google/common/hash/HashFunction;


# annotations
.annotation runtime Lcom/google/errorprone/annotations/Immutable;
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hashBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/HashCode;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 72
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/hash/Hasher;->putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashBytes([B)Lcom/google/common/hash/HashCode;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    const/4 v0, 0x0

    .line 61
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/hash/AbstractHashFunction;->hashBytes([BII)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashBytes([BII)Lcom/google/common/hash/HashCode;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "input",
            "off",
            "len"
        }
    .end annotation

    add-int v0, p2, p3

    .line 66
    array-length v1, p1

    invoke-static {p2, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 67
    invoke-virtual {p0, p3}, Lcom/google/common/hash/AbstractHashFunction;->newHasher(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3}, Lcom/google/common/hash/Hasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashInt(I)Lcom/google/common/hash/HashCode;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    const/4 v0, 0x4

    .line 51
    invoke-virtual {p0, v0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/hash/Hasher;->putInt(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashLong(J)Lcom/google/common/hash/HashCode;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    const/16 v0, 0x8

    .line 56
    invoke-virtual {p0, v0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/common/hash/Hasher;->putLong(J)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "instance",
            "funnel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel<",
            "-TT;>;)",
            "Lcom/google/common/hash/HashCode;"
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher()Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/common/hash/Hasher;->putObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/HashCode;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "charset"
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher()Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/common/hash/Hasher;->putString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public hashUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/HashCode;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 40
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    .line 41
    invoke-virtual {p0, v0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/hash/Hasher;->putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/hash/Hasher;->hash()Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public newHasher(I)Lcom/google/common/hash/Hasher;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedInputSize"
        }
    .end annotation

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 77
    :goto_0
    const-string v1, "expectedInputSize must be >= 0 but was %s"

    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 79
    invoke-virtual {p0}, Lcom/google/common/hash/AbstractHashFunction;->newHasher()Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method
