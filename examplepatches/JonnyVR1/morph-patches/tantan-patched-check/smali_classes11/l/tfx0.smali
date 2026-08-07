.class public final Ll/tfx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kxw0;


# static fields
.field public static final e:[B


# instance fields
.field public final a:Ll/zax0;

.field public final b:I

.field public final c:[B

.field public final d:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput-byte v1, v0, v1

    .line 6
    .line 7
    sput-object v0, Ll/tfx0;->e:[B

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/y7x0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ll/qfx0;

    invoke-virtual {p1}, Ll/y7x0;->d()Ll/xfx0;

    move-result-object v1

    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/xfx0;->d(Ll/ayw0;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ll/qfx0;-><init>([B)V

    iput-object v0, p0, Ll/tfx0;->a:Ll/zax0;

    .line 99
    invoke-virtual {p1}, Ll/y7x0;->c()Ll/h8x0;

    move-result-object v0

    invoke-virtual {v0}, Ll/h8x0;->b()I

    move-result v0

    iput v0, p0, Ll/tfx0;->b:I

    .line 100
    invoke-virtual {p1}, Ll/y7x0;->b()Ll/wfx0;

    move-result-object v0

    invoke-virtual {v0}, Ll/wfx0;->c()[B

    move-result-object v0

    iput-object v0, p0, Ll/tfx0;->c:[B

    .line 101
    invoke-virtual {p1}, Ll/y7x0;->c()Ll/h8x0;

    move-result-object p1

    invoke-virtual {p1}, Ll/h8x0;->e()Ll/f8x0;

    move-result-object p1

    sget-object v0, Ll/f8x0;->d:Ll/f8x0;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Ll/tfx0;->e:[B

    const/4 v0, 0x1

    .line 102
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p1

    iput-object p1, p0, Ll/tfx0;->d:[B

    return-void

    :cond_0
    const/4 p1, 0x0

    new-array p1, p1, [B

    iput-object p1, p0, Ll/tfx0;->d:[B

    return-void
.end method

.method public constructor <init>(Ll/z8x0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/sfx0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/z8x0;->d()Ll/k9x0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/k9x0;->f()Ll/h9x0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/z8x0;->e()Ll/xfx0;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v3, v4}, Ll/xfx0;->d(Ll/ayw0;)[B

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string v4, "HMAC"

    .line 33
    .line 34
    invoke-direct {v2, v3, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-direct {v0, v1, v2}, Ll/sfx0;-><init>(Ljava/lang/String;Ljava/security/Key;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/tfx0;->a:Ll/zax0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/z8x0;->d()Ll/k9x0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/k9x0;->b()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput v0, p0, Ll/tfx0;->b:I

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/z8x0;->b()Ll/wfx0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/wfx0;->c()[B

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Ll/tfx0;->c:[B

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/z8x0;->d()Ll/k9x0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ll/k9x0;->g()Ll/i9x0;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget-object v0, Ll/i9x0;->d:Ll/i9x0;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    sget-object p1, Ll/tfx0;->e:[B

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Ll/tfx0;->d:[B

    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    const/4 p1, 0x0

    .line 93
    new-array p1, p1, [B

    .line 94
    .line 95
    iput-object p1, p0, Ll/tfx0;->d:[B

    .line 96
    .line 97
    return-void
.end method

.method public constructor <init>(Ll/zax0;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tfx0;->a:Ll/zax0;

    iput p2, p0, Ll/tfx0;->b:I

    const/4 v0, 0x0

    new-array v1, v0, [B

    iput-object v1, p0, Ll/tfx0;->c:[B

    new-array v1, v0, [B

    iput-object v1, p0, Ll/tfx0;->d:[B

    new-array p0, v0, [B

    invoke-interface {p1, p0, p2}, Ll/zax0;->a([BI)[B

    return-void
.end method

.method public static a(Ll/y7x0;)Ll/kxw0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tfx0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tfx0;-><init>(Ll/y7x0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Ll/z8x0;)Ll/kxw0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tfx0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tfx0;-><init>(Ll/z8x0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final c([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tfx0;->d:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget-object v2, p0, Ll/tfx0;->c:[B

    .line 5
    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Ll/tfx0;->a:Ll/zax0;

    .line 9
    .line 10
    filled-new-array {p1, v0}, [[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Ll/sex0;->b([[B)[B

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget p0, p0, Ll/tfx0;->b:I

    .line 19
    .line 20
    invoke-interface {v1, p1, p0}, Ll/zax0;->a([BI)[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    filled-new-array {v2, p0}, [[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/sex0;->b([[B)[B

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    iget-object v0, p0, Ll/tfx0;->a:Ll/zax0;

    .line 34
    .line 35
    iget p0, p0, Ll/tfx0;->b:I

    .line 36
    .line 37
    invoke-interface {v0, p1, p0}, Ll/zax0;->a([BI)[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {v2, p0}, [[B

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/sex0;->b([[B)[B

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method
