.class public final Lcom/google/common/hash/MessageDigestHashFunction$b;
.super Ll/w6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/MessageDigestHashFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final b:Ljava/security/MessageDigest;

.field public final c:I

.field public d:Z


# direct methods
.method public constructor <init>(Ljava/security/MessageDigest;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w6;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->b:Ljava/security/MessageDigest;

    .line 5
    .line 6
    iput p2, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->c:I

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ljava/security/MessageDigest;ILcom/google/common/hash/MessageDigestHashFunction$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/google/common/hash/MessageDigestHashFunction$b;-><init>(Ljava/security/MessageDigest;I)V

    return-void
.end method


# virtual methods
.method public e()Lcom/google/common/hash/HashCode;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/common/hash/MessageDigestHashFunction$b;->q()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->d:Z

    .line 6
    .line 7
    iget v0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->c:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->b:Ljava/security/MessageDigest;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/security/MessageDigest;->getDigestLength()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->b:Ljava/security/MessageDigest;

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/google/common/hash/HashCode;->fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget p0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->c:I

    .line 33
    .line 34
    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lcom/google/common/hash/HashCode;->fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public m(B)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/hash/MessageDigestHashFunction$b;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->b:Ljava/security/MessageDigest;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update(B)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/hash/MessageDigestHashFunction$b;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->b:Ljava/security/MessageDigest;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p([BII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/hash/MessageDigestHashFunction$b;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->b:Ljava/security/MessageDigest;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-boolean p0, p0, Lcom/google/common/hash/MessageDigestHashFunction$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    const-string v0, "Cannot re-use a Hasher after calling hash() on it"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/xn80;->w(ZLjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
