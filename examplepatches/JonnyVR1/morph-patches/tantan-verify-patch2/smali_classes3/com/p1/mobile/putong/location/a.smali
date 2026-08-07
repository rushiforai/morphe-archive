.class public abstract Lcom/p1/mobile/putong/location/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/location/a$b;,
        Lcom/p1/mobile/putong/location/a$a;
    }
.end annotation


# static fields
.field public static l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/location/a$a;",
            ">;"
        }
    .end annotation
.end field

.field public static m:[B


# instance fields
.field public a:Ll/jxd0;

.field public b:Ll/mxd0;

.field public c:Ll/mxd0;

.field public d:J

.field public final e:I

.field public final f:I

.field public final g:I

.field public h:Lcom/p1/mobile/putong/location/a$b;

.field public i:J

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/location/Location;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/location/a$a;

    .line 9
    .line 10
    const v2, 0x42e61180

    .line 11
    .line 12
    .line 13
    const v3, 0x466a6000    # 15000.0f

    .line 14
    .line 15
    .line 16
    const v4, 0x420f16d8

    .line 17
    .line 18
    .line 19
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/location/a$a;-><init>(FFF)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 26
    .line 27
    new-instance v1, Lcom/p1/mobile/putong/location/a$a;

    .line 28
    .line 29
    const v2, 0x42fa95fa

    .line 30
    .line 31
    .line 32
    const v3, 0x468ca000    # 18000.0f

    .line 33
    .line 34
    .line 35
    const v4, 0x422f7179

    .line 36
    .line 37
    .line 38
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/location/a$a;-><init>(FFF)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 45
    .line 46
    new-instance v1, Lcom/p1/mobile/putong/location/a$a;

    .line 47
    .line 48
    const v2, 0x42ec54eb

    .line 49
    .line 50
    .line 51
    const v3, 0x461c4000    # 10000.0f

    .line 52
    .line 53
    .line 54
    const v4, 0x421e9e08

    .line 55
    .line 56
    .line 57
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/location/a$a;-><init>(FFF)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 64
    .line 65
    new-instance v1, Lcom/p1/mobile/putong/location/a$a;

    .line 66
    .line 67
    const v2, 0x42d51a54

    .line 68
    .line 69
    .line 70
    const v3, 0x4684d000    # 17000.0f

    .line 71
    .line 72
    .line 73
    const v4, 0x41ec7f28

    .line 74
    .line 75
    .line 76
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/location/a$a;-><init>(FFF)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 83
    .line 84
    new-instance v1, Lcom/p1/mobile/putong/location/a$a;

    .line 85
    .line 86
    const v2, 0x42ed973e

    .line 87
    .line 88
    .line 89
    const v3, 0x46c35000    # 25000.0f

    .line 90
    .line 91
    .line 92
    const v4, 0x42001ba0

    .line 93
    .line 94
    .line 95
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/location/a$a;-><init>(FFF)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    sget-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 102
    .line 103
    new-instance v1, Lcom/p1/mobile/putong/location/a$a;

    .line 104
    .line 105
    const v2, 0x42d56aa0

    .line 106
    .line 107
    .line 108
    const v3, 0x469c4000    # 20000.0f

    .line 109
    .line 110
    .line 111
    const v4, 0x41d46e48

    .line 112
    .line 113
    .line 114
    invoke-direct {v1, v4, v2, v3}, Lcom/p1/mobile/putong/location/a$a;-><init>(FFF)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    const/16 v0, 0x8

    .line 121
    .line 122
    new-array v0, v0, [B

    .line 123
    .line 124
    fill-array-data v0, :array_0

    .line 125
    .line 126
    .line 127
    sput-object v0, Lcom/p1/mobile/putong/location/a;->m:[B

    .line 128
    .line 129
    return-void

    .line 130
    nop

    .line 131
    :array_0
    .array-data 1
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/a;->d:J

    .line 9
    .line 10
    const v0, 0x493e0

    .line 11
    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/location/a;->e:I

    .line 14
    .line 15
    const v0, 0x57e40

    .line 16
    .line 17
    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/location/a;->f:I

    .line 19
    .line 20
    const/16 v0, 0x4e20

    .line 21
    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/location/a;->g:I

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/a;->i:J

    .line 27
    .line 28
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/location/a;->k:Z

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->j()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Lcom/p1/mobile/putong/location/a$b;

    .line 42
    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v3, "TantanLocationProvider.latestLocation_"

    .line 46
    .line 47
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->j()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const/4 v3, 0x0

    .line 62
    invoke-direct {v1, v0, v2, v3}, Lcom/p1/mobile/putong/location/a$b;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/location/Location;)V

    .line 63
    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/location/a;->h:Lcom/p1/mobile/putong/location/a$b;

    .line 66
    .line 67
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/location/a;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->l(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/location/a;Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/location/a;->n(Lcom/p1/mobile/putong/location/Location;Z)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/location/a;Landroid/location/LocationManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->m(Landroid/location/LocationManager;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/location/a;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->o(Z)V

    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/location/a;->m:[B

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v2, "DES"

    .line 20
    .line 21
    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "DES/CBC/PKCS5Padding"

    .line 25
    .line 26
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v2, 0x2

    .line 31
    invoke-virtual {p1, v2, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    .line 41
    .line 42
    .line 43
    return-object p1
.end method

.method public static f(DDDDDD)D
    .locals 4

    .line 1
    sub-double v0, p2, p0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sub-double/2addr p6, p4

    .line 8
    invoke-static {p6, p7}, Ljava/lang/Math;->toRadians(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide p4

    .line 12
    const-wide/high16 p6, 0x4000000000000000L    # 2.0

    .line 13
    .line 14
    div-double/2addr v0, p6

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    mul-double/2addr v2, v0

    .line 24
    invoke-static {p0, p1}, Ljava/lang/Math;->toRadians(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    .line 29
    .line 30
    .line 31
    move-result-wide p0

    .line 32
    invoke-static {p2, p3}, Ljava/lang/Math;->toRadians(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide p2

    .line 36
    invoke-static {p2, p3}, Ljava/lang/Math;->cos(D)D

    .line 37
    .line 38
    .line 39
    move-result-wide p2

    .line 40
    mul-double/2addr p0, p2

    .line 41
    div-double/2addr p4, p6

    .line 42
    invoke-static {p4, p5}, Ljava/lang/Math;->sin(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide p2

    .line 46
    mul-double/2addr p0, p2

    .line 47
    invoke-static {p4, p5}, Ljava/lang/Math;->sin(D)D

    .line 48
    .line 49
    .line 50
    move-result-wide p2

    .line 51
    mul-double/2addr p0, p2

    .line 52
    add-double/2addr v2, p0

    .line 53
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide p0

    .line 57
    const-wide/high16 p2, 0x3ff0000000000000L    # 1.0

    .line 58
    .line 59
    sub-double/2addr p2, v2

    .line 60
    invoke-static {p2, p3}, Ljava/lang/Math;->sqrt(D)D

    .line 61
    .line 62
    .line 63
    move-result-wide p2

    .line 64
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->atan2(DD)D

    .line 65
    .line 66
    .line 67
    move-result-wide p0

    .line 68
    mul-double/2addr p0, p6

    .line 69
    const-wide p2, 0x40b8e30000000000L    # 6371.0

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    mul-double/2addr p0, p2

    .line 75
    const-wide p2, 0x408f400000000000L    # 1000.0

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    mul-double/2addr p0, p2

    .line 81
    sub-double/2addr p8, p10

    .line 82
    invoke-static {p0, p1, p6, p7}, Ljava/lang/Math;->pow(DD)D

    .line 83
    .line 84
    .line 85
    move-result-wide p0

    .line 86
    invoke-static {p8, p9, p6, p7}, Ljava/lang/Math;->pow(DD)D

    .line 87
    .line 88
    .line 89
    move-result-wide p2

    .line 90
    add-double/2addr p0, p2

    .line 91
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 92
    .line 93
    .line 94
    move-result-wide p0

    .line 95
    return-wide p0
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/location/a;->m:[B

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v2, "DES"

    .line 15
    .line 16
    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p1, "DES/CBC/PKCS5Padding"

    .line 20
    .line 21
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {p1, v2, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method


# virtual methods
.method public A(Z)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/a;->d:J

    .line 6
    .line 7
    return-void
.end method

.method public abstract B()V
.end method

.method public abstract g()V
.end method

.method public final i(Landroid/location/LocationManager;Ljava/lang/String;)Lcom/p1/mobile/putong/location/Location;
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    new-instance p2, Lcom/p1/mobile/putong/location/Location;

    .line 12
    .line 13
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/location/Location;-><init>(Landroid/location/Location;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p2, 0x0

    .line 18
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/location/a;->k(Lcom/p1/mobile/putong/location/Location;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Ll/qei0;

    .line 31
    .line 32
    invoke-direct {p1, p0, p2}, Ll/qei0;-><init>(Lcom/p1/mobile/putong/location/a;Lcom/p1/mobile/putong/location/Location;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-object p2
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public k(Lcom/p1/mobile/putong/location/Location;)Z
    .locals 9

    .line 1
    const/4 p0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmpl-double v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    cmpl-double v0, v0, v2

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return p0

    .line 24
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 29
    .line 30
    cmpl-double v0, v0, v2

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    cmpl-double v0, v0, v2

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    return p0

    .line 43
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    const-wide/high16 v2, 0x403e000000000000L    # 30.0

    .line 48
    .line 49
    cmpl-double v0, v0, v2

    .line 50
    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    const-wide/high16 v2, 0x405a000000000000L    # 104.0

    .line 58
    .line 59
    cmpl-double v0, v0, v2

    .line 60
    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    return p0

    .line 64
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    const-wide v2, 0x3f689374bc6a7efaL    # 0.003

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    add-double/2addr v0, v2

    .line 74
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    const-wide v2, 0x3f50624de0000000L    # 0.0010000000474974513

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    cmpg-double v0, v0, v2

    .line 84
    .line 85
    const-wide v1, 0x3f847ae140000000L    # 0.009999999776482582

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    const-wide v3, 0x3f847ae147ae147bL    # 0.01

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    if-gtz v0, :cond_4

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    add-double/2addr v5, v3

    .line 102
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    cmpg-double v0, v5, v1

    .line 107
    .line 108
    if-gtz v0, :cond_4

    .line 109
    .line 110
    return p0

    .line 111
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 112
    .line 113
    .line 114
    move-result-wide v5

    .line 115
    const-wide v7, 0x3f661e4f765fd8aeL    # 0.0027

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    add-double/2addr v5, v7

    .line 121
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 122
    .line 123
    .line 124
    move-result-wide v5

    .line 125
    const-wide v7, 0x3f1a36e2e0000000L    # 9.999999747378752E-5

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    cmpg-double v0, v5, v7

    .line 131
    .line 132
    if-gtz v0, :cond_5

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 135
    .line 136
    .line 137
    move-result-wide v5

    .line 138
    add-double/2addr v5, v3

    .line 139
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    cmpg-double p1, v3, v1

    .line 144
    .line 145
    if-gtz p1, :cond_5

    .line 146
    .line 147
    return p0

    .line 148
    :cond_5
    const/4 p0, 0x0

    .line 149
    return p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/location/Location;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/location/a;->s(Lcom/p1/mobile/putong/location/Location;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic m(Landroid/location/LocationManager;)V
    .locals 1

    .line 1
    const-string v0, "network"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/location/a;->i(Landroid/location/LocationManager;Ljava/lang/String;)Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "gps"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/location/a;->i(Landroid/location/LocationManager;Ljava/lang/String;)Lcom/p1/mobile/putong/location/Location;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "passive"

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/location/a;->i(Landroid/location/LocationManager;Ljava/lang/String;)Lcom/p1/mobile/putong/location/Location;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/location/Location;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->k(Lcom/p1/mobile/putong/location/Location;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_3

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    cmpl-double v1, v1, v3

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    cmpl-double v1, v1, v3

    .line 38
    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    cmpl-float v1, v1, v2

    .line 50
    .line 51
    if-nez v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->w()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->w()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eq v0, v1, :cond_3

    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->h:Lcom/p1/mobile/putong/location/a$b;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/location/a;->l:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lcom/p1/mobile/putong/location/a$a;

    .line 90
    .line 91
    iget-object v2, v1, Lcom/p1/mobile/putong/location/a$a;->a:Lcom/p1/mobile/putong/location/Location;

    .line 92
    .line 93
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/location/Location;->r(Lcom/p1/mobile/putong/location/Location;)F

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    iget v1, v1, Lcom/p1/mobile/putong/location/a$a;->b:F

    .line 98
    .line 99
    cmpg-float v1, v2, v1

    .line 100
    .line 101
    if-gez v1, :cond_1

    .line 102
    .line 103
    const/4 v1, 0x1

    .line 104
    iput-boolean v1, p0, Lcom/p1/mobile/putong/location/a;->k:Z

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 108
    .line 109
    .line 110
    move-result-wide v0

    .line 111
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/a;->i:J

    .line 112
    .line 113
    :cond_3
    if-eqz p2, :cond_4

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->B()V

    .line 116
    .line 117
    .line 118
    :cond_4
    return-void
.end method

.method public final synthetic o(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->y(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/location/Location;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public q()Lcom/p1/mobile/putong/location/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/location/Location;

    .line 8
    .line 9
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->h:Lcom/p1/mobile/putong/location/a$b;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/location/Location;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/location/a;->s(Lcom/p1/mobile/putong/location/Location;Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/location/a;->k(Lcom/p1/mobile/putong/location/Location;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 36
    .line 37
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 44
    .line 45
    const-string v1, "location"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Landroid/location/LocationManager;

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    new-instance v1, Ll/pei0;

    .line 57
    .line 58
    invoke-direct {v1, p0, v0}, Ll/pei0;-><init>(Lcom/p1/mobile/putong/location/a;Landroid/location/LocationManager;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    :goto_1
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/rei0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, Ll/rei0;-><init>(Lcom/p1/mobile/putong/location/a;Lcom/p1/mobile/putong/location/Location;Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/location/a;->w(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u(J)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/location/a;->v(JZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v(JZ)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/a;->i:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide p1

    .line 8
    cmp-long p1, v0, p1

    .line 9
    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/location/a;->w(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public w(Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/oei0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/oei0;-><init>(Lcom/p1/mobile/putong/location/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public x()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/location/a;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/location/Location;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/high16 v2, 0x43480000    # 200.0f

    .line 16
    .line 17
    cmpl-float v1, v1, v2

    .line 18
    .line 19
    if-gtz v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->z()J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    sub-long/2addr v1, v3

    .line 30
    const-wide/32 v3, 0x36ee80

    .line 31
    .line 32
    .line 33
    cmp-long v0, v1, v3

    .line 34
    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final y(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 12
    .line 13
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/a;->A(Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/a;->i:J

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->g()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public z()V
    .locals 0

    .line 1
    return-void
.end method
