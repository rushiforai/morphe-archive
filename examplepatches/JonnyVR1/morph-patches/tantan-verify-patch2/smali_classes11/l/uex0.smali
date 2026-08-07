.class public final Ll/uex0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jww0;


# instance fields
.field public final a:Ll/pfx0;

.field public final b:Ll/kxw0;

.field public final c:I

.field public final d:[B


# direct methods
.method public constructor <init>(Ll/pfx0;Ll/kxw0;I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uex0;->a:Ll/pfx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uex0;->b:Ll/kxw0;

    .line 7
    .line 8
    iput p3, p0, Ll/uex0;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Ll/uex0;->d:[B

    .line 11
    .line 12
    return-void
.end method

.method public static b(Ll/nyw0;)Ll/jww0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uex0;

    .line 2
    .line 3
    new-instance v1, Ll/nex0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nyw0;->c()Ll/xfx0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v2, v3}, Ll/xfx0;->d(Ll/ayw0;)[B

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0}, Ll/nyw0;->a()Ll/xyw0;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Ll/xyw0;->d()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-direct {v1, v2, v3}, Ll/nex0;-><init>([BI)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/tfx0;

    .line 29
    .line 30
    new-instance v3, Ll/sfx0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nyw0;->a()Ll/xyw0;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Ll/xyw0;->f()Ll/uyw0;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/nyw0;->d()Ll/xfx0;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-virtual {v6, v7}, Ll/xfx0;->d(Ll/ayw0;)[B

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    const-string v7, "HMAC"

    .line 59
    .line 60
    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v7, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-direct {v3, v4, v5}, Ll/sfx0;-><init>(Ljava/lang/String;Ljava/security/Key;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/nyw0;->a()Ll/xyw0;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Ll/xyw0;->e()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-direct {v2, v3, v4}, Ll/tfx0;-><init>(Ll/zax0;I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/nyw0;->a()Ll/xyw0;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v3}, Ll/xyw0;->e()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {p0}, Ll/nyw0;->b()Ll/wfx0;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/wfx0;->c()[B

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-direct {v0, v1, v2, v3, p0}, Ll/uex0;-><init>(Ll/pfx0;Ll/kxw0;I[B)V

    .line 98
    .line 99
    .line 100
    return-object v0
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uex0;->d:[B

    .line 2
    .line 3
    iget v1, p0, Ll/uex0;->c:I

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    array-length v3, p1

    .line 7
    add-int/2addr v1, v2

    .line 8
    const/4 v2, 0x0

    .line 9
    if-lt v3, v1, :cond_3

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/u7x0;->b([B[B)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Ll/uex0;->d:[B

    .line 18
    .line 19
    iget v1, p0, Ll/uex0;->c:I

    .line 20
    .line 21
    sub-int v1, v3, v1

    .line 22
    .line 23
    array-length v0, v0

    .line 24
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v1, p0, Ll/uex0;->c:I

    .line 29
    .line 30
    sub-int v1, v3, v1

    .line 31
    .line 32
    invoke-static {p1, v1, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    const/4 p2, 0x0

    .line 39
    new-array p2, p2, [B

    .line 40
    .line 41
    :cond_0
    const/16 v1, 0x8

    .line 42
    .line 43
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    array-length v4, p2

    .line 48
    int-to-long v4, v4

    .line 49
    const-wide/16 v6, 0x8

    .line 50
    .line 51
    mul-long/2addr v4, v6

    .line 52
    invoke-virtual {v3, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v3, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v3, p0, Ll/uex0;->b:Ll/kxw0;

    .line 65
    .line 66
    filled-new-array {p2, v0, v1}, [[B

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {p2}, Ll/sex0;->b([[B)[B

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    check-cast v3, Ll/tfx0;

    .line 75
    .line 76
    invoke-virtual {v3, p2}, Ll/tfx0;->c([B)[B

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-static {p2, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    iget-object p0, p0, Ll/uex0;->a:Ll/pfx0;

    .line 87
    .line 88
    invoke-interface {p0, v0}, Ll/pfx0;->zza([B)[B

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_1
    const-string p0, "invalid MAC"

    .line 94
    .line 95
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-object v2

    .line 99
    :cond_2
    const-string p0, "Decryption failed (OutputPrefix mismatch)."

    .line 100
    .line 101
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-object v2

    .line 105
    :cond_3
    const-string p0, "Decryption failed (ciphertext too short)."

    .line 106
    .line 107
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-object v2
.end method
