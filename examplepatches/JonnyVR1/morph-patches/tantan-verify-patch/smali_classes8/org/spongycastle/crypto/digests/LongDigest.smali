.class public abstract Lorg/spongycastle/crypto/digests/LongDigest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;
.implements Lorg/spongycastle/util/Memoable;
.implements Lorg/spongycastle/crypto/digests/EncodableDigest;


# static fields
.field private static final BYTE_LENGTH:I = 0x80

.field static final K:[J


# instance fields
.field protected H1:J

.field protected H2:J

.field protected H3:J

.field protected H4:J

.field protected H5:J

.field protected H6:J

.field protected H7:J

.field protected H8:J

.field private W:[J

.field private byteCount1:J

.field private byteCount2:J

.field private wOff:I

.field private xBuf:[B

.field private xBufOff:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x50

    .line 2
    .line 3
    new-array v0, v0, [J

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/digests/LongDigest;->K:[J

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 8
        0x428a2f98d728ae22L    # 3.5989662528217666E12
        0x7137449123ef65cdL    # 2.367405559035152E237
        -0x4a3f043013b2c4d1L    # -9.0786554787018E-50
        -0x164a245a7e762444L
        0x3956c25bf348b538L
        0x59f111f1b605d019L    # 1.8054860536953294E125
        -0x6dc07d5b50e6b065L    # -8.717181310573585E-221
        -0x54e3a12a25927ee8L
        -0x27f855675cfcfdbeL    # -1.1656291332323638E116
        0x12835b0145706fbeL
        0x243185be4ee4b28cL    # 2.410773468256423E-134
        0x550c7dc3d5ffb4e2L    # 4.985403983718413E101
        0x72be5d74f27b896fL    # 5.183352230240388E244
        -0x7f214e01c4e9694fL
        -0x6423f958da38edcbL
        -0x3e640e8b3096d96cL    # -1.1720222785268623E8
        -0x1b64963e610eb52eL    # -4.339261227288659E176
        -0x1041b879c7b0da1dL    # -1.836300920646737E230
        0xfc19dc68b8cd5b5L    # 8.864787397362889E-233
        0x240ca1cc77ac9c65L    # 4.924067956729057E-135
        0x2de92c6f592b0275L    # 1.5818166760957606E-87
        0x4a7484aa6ea6e483L    # 4.79798724707082E50
        0x5cb0a9dcbd41fbd4L    # 3.100593885146353E138
        0x76f988da831153b5L    # 1.2864857866870779E265
        -0x67c1aead11992055L
        -0x57ce3992d24bcdf0L    # -4.511217866312199E-115
        -0x4ffcd8376704dec1L    # -2.0678662886600765E-77
        -0x40a680384110f11cL    # -0.0015563440936014411
        -0x391ff40cc257703eL    # -2.603722742751637E33
        -0x2a586eb86cf558dbL    # -4.222814448133811E104
        0x6ca6351e003826fL
        0x142929670a0e6e70L
        0x27b70a8546d22ffcL
        0x2e1b21385c26c926L    # 1.3637893953385892E-86
        0x4d2c6dfc5ac42aedL    # 5.84763610164635E63
        0x53380d139d95b3dfL    # 7.838866619197482E92
        0x650a73548baf63deL    # 5.35921865865203E178
        0x766a0abb3c77b2a8L    # 2.5625906234442426E262
        -0x7e3d36d1b812511aL    # -3.506432391784029E-300
        -0x6d8dd37aeb7dcac5L    # -8.044358981173315E-220
        -0x5d40175eb30efc9cL
        -0x57e599b443bdcfffL
        -0x3db4748f2f07686fL    # -2.366070870891841E11
        -0x3893ae5cf9ab41d0L    # -1.17632082693375E36
        -0x2e6d17e62910ade8L    # -9.182337425192181E84
        -0x2966f9dbaa9a56f0L    # -1.4692477645833556E109
        -0xbf1ca7aa88edfd6L
        0x106aa07032bbd1b8L
        0x19a4c116b8d2d0c8L
        0x1e376c085141ab53L    # 4.067301537801791E-163
        0x2748774cdf8eeb99L    # 1.894937972556452E-119
        0x34b0bcb5e19b48a8L    # 6.82593759724882E-55
        0x391c0cb3c5c95a63L    # 1.3505399862746614E-33
        0x4ed8aa4ae3418acbL    # 6.809319594147137E71
        0x5b9cca4f7763e373L    # 2.0435436325319052E133
        0x682e6ff3d6b2b8a3L    # 6.943421982965376E193
        0x748f82ee5defb2fcL    # 2.887850816088868E253
        0x78a5636f43172f60L    # 1.4463210820003646E273
        -0x7b3787eb5e0f548eL
        -0x7338fdf7e59bc614L
        -0x6f410005dc9ce1d8L    # -5.111680914909667E-228
        -0x5baf9314217d4217L    # -9.03940504491957E-134
        -0x41065c084d3986ebL    # -2.445268471406536E-5
        -0x398e870d1c8dacd5L    # -2.2148969568888243E31
        -0x35d8c13115d99e64L    # -1.6986554718624063E49
        -0x2e794738de3f3df9L    # -5.517613964471652E84
        -0x15258229321f14e2L    # -5.315750124715331E206
        -0xa82b08011912e88L    # -8.801976642581914E257
        0x6f067aa72176fbaL
        0xa637dc5a2c898a6L
        0x113f9804bef90daeL
        0x1b710b35131c471bL
        0x28db77f523047d84L    # 7.138679721560702E-112
        0x32caab7b40c72493L    # 5.064907242937011E-64
        0x3c9ebe0a15c9bebcL    # 1.0665892261952011E-16
        0x431d67c49c100d4cL    # 2.069217113539411E15
        0x4cc5d4becb3e42b6L    # 7.016224550123326E61
        0x597f299cfc657e2aL    # 1.2875119238090917E123
        0x5fcb6fab3ad6faecL    # 2.873901462601813E153
        0x6c44198c4a475817L    # 3.3832852265175575E213
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 9
    .line 10
    const/16 v0, 0x50

    .line 11
    .line 12
    new-array v0, v0, [J

    .line 13
    .line 14
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/LongDigest;->reset()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/LongDigest;)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x8

    .line 24
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    const/16 v0, 0x50

    .line 25
    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 26
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/digests/LongDigest;->copyIn(Lorg/spongycastle/crypto/digests/LongDigest;)V

    return-void
.end method

.method private Ch(JJJ)J
    .locals 0

    and-long/2addr p3, p1

    not-long p0, p1

    and-long/2addr p0, p5

    xor-long/2addr p0, p3

    return-wide p0
.end method

.method private Maj(JJJ)J
    .locals 2

    and-long v0, p1, p3

    and-long p0, p1, p5

    xor-long/2addr p0, v0

    and-long p2, p3, p5

    xor-long/2addr p0, p2

    return-wide p0
.end method

.method private Sigma0(J)J
    .locals 6

    const/16 p0, 0x3f

    shl-long v0, p1, p0

    const/4 p0, 0x1

    ushr-long v2, p1, p0

    or-long/2addr v0, v2

    const/16 p0, 0x38

    shl-long v2, p1, p0

    const/16 p0, 0x8

    ushr-long v4, p1, p0

    or-long/2addr v2, v4

    xor-long/2addr v0, v2

    const/4 p0, 0x7

    ushr-long p0, p1, p0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method private Sigma1(J)J
    .locals 6

    const/16 p0, 0x2d

    shl-long v0, p1, p0

    const/16 p0, 0x13

    ushr-long v2, p1, p0

    or-long/2addr v0, v2

    const/4 p0, 0x3

    shl-long v2, p1, p0

    const/16 p0, 0x3d

    ushr-long v4, p1, p0

    or-long/2addr v2, v4

    xor-long/2addr v0, v2

    const/4 p0, 0x6

    ushr-long p0, p1, p0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method private Sum0(J)J
    .locals 6

    const/16 p0, 0x24

    shl-long v0, p1, p0

    const/16 p0, 0x1c

    ushr-long v2, p1, p0

    or-long/2addr v0, v2

    const/16 p0, 0x1e

    shl-long v2, p1, p0

    const/16 p0, 0x22

    ushr-long v4, p1, p0

    or-long/2addr v2, v4

    xor-long/2addr v0, v2

    const/16 p0, 0x19

    shl-long v2, p1, p0

    const/16 p0, 0x27

    ushr-long p0, p1, p0

    or-long/2addr p0, v2

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method private Sum1(J)J
    .locals 6

    const/16 p0, 0x32

    shl-long v0, p1, p0

    const/16 p0, 0xe

    ushr-long v2, p1, p0

    or-long/2addr v0, v2

    const/16 p0, 0x2e

    shl-long v2, p1, p0

    const/16 p0, 0x12

    ushr-long v4, p1, p0

    or-long/2addr v2, v4

    xor-long/2addr v0, v2

    const/16 p0, 0x17

    shl-long v2, p1, p0

    const/16 p0, 0x29

    ushr-long p0, p1, p0

    or-long/2addr p0, v2

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method private adjustByteCounts()V
    .locals 8

    .line 1
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 2
    .line 3
    const-wide v2, 0x1fffffffffffffffL

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-lez v4, :cond_0

    .line 11
    .line 12
    iget-wide v4, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 13
    .line 14
    const/16 v6, 0x3d

    .line 15
    .line 16
    ushr-long v6, v0, v6

    .line 17
    .line 18
    add-long/2addr v4, v6

    .line 19
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 20
    .line 21
    and-long/2addr v0, v2

    .line 22
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public copyIn(Lorg/spongycastle/crypto/digests/LongDigest;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    .line 9
    .line 10
    iget v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 13
    .line 14
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 15
    .line 16
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 17
    .line 18
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 19
    .line 20
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 21
    .line 22
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 23
    .line 24
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 25
    .line 26
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 27
    .line 28
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 29
    .line 30
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 31
    .line 32
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 33
    .line 34
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 35
    .line 36
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 37
    .line 38
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 39
    .line 40
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 41
    .line 42
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 43
    .line 44
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 45
    .line 46
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 47
    .line 48
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 49
    .line 50
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 51
    .line 52
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 53
    .line 54
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 55
    .line 56
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 57
    .line 58
    array-length v2, v0

    .line 59
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    iget p1, p1, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 63
    .line 64
    iput p1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 65
    .line 66
    return-void
.end method

.method public finish()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/LongDigest;->adjustByteCounts()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 5
    .line 6
    const/4 v2, 0x3

    .line 7
    shl-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 9
    .line 10
    const/16 v4, -0x80

    .line 11
    .line 12
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/digests/LongDigest;->update(B)V

    .line 13
    .line 14
    .line 15
    :goto_0
    iget v4, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 16
    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/digests/LongDigest;->update(B)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/LongDigest;->processLength(JJ)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/LongDigest;->processBlock()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public getByteLength()I
    .locals 0

    const/16 p0, 0x80

    return p0
.end method

.method public getEncodedStateSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 2
    .line 3
    mul-int/lit8 p0, p0, 0x8

    .line 4
    .line 5
    add-int/lit8 p0, p0, 0x60

    .line 6
    .line 7
    return p0
.end method

.method public populateState([B)V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 14
    .line 15
    .line 16
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 17
    .line 18
    const/16 v3, 0xc

    .line 19
    .line 20
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 21
    .line 22
    .line 23
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 24
    .line 25
    const/16 v3, 0x14

    .line 26
    .line 27
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 28
    .line 29
    .line 30
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 31
    .line 32
    const/16 v3, 0x1c

    .line 33
    .line 34
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 35
    .line 36
    .line 37
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 38
    .line 39
    const/16 v3, 0x24

    .line 40
    .line 41
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 42
    .line 43
    .line 44
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 45
    .line 46
    const/16 v3, 0x2c

    .line 47
    .line 48
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 49
    .line 50
    .line 51
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 52
    .line 53
    const/16 v3, 0x34

    .line 54
    .line 55
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 56
    .line 57
    .line 58
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 59
    .line 60
    const/16 v3, 0x3c

    .line 61
    .line 62
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 63
    .line 64
    .line 65
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 66
    .line 67
    const/16 v3, 0x44

    .line 68
    .line 69
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 70
    .line 71
    .line 72
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 73
    .line 74
    const/16 v3, 0x4c

    .line 75
    .line 76
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 77
    .line 78
    .line 79
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 80
    .line 81
    const/16 v3, 0x54

    .line 82
    .line 83
    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 84
    .line 85
    .line 86
    iget v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 87
    .line 88
    const/16 v1, 0x5c

    .line 89
    .line 90
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 94
    .line 95
    if-ge v2, v0, :cond_0

    .line 96
    .line 97
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 98
    .line 99
    aget-wide v3, v0, v2

    .line 100
    .line 101
    mul-int/lit8 v0, v2, 0x8

    .line 102
    .line 103
    add-int/lit8 v0, v0, 0x60

    .line 104
    .line 105
    invoke-static {v3, v4, p1, v0}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 106
    .line 107
    .line 108
    add-int/lit8 v2, v2, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_0
    return-void
.end method

.method public processBlock()V
    .locals 33

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/LongDigest;->adjustByteCounts()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    :goto_0
    const/16 v2, 0x4f

    .line 9
    .line 10
    if-gt v1, v2, :cond_0

    .line 11
    .line 12
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 13
    .line 14
    add-int/lit8 v3, v1, -0x2

    .line 15
    .line 16
    aget-wide v3, v2, v3

    .line 17
    .line 18
    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/digests/LongDigest;->Sigma1(J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 23
    .line 24
    add-int/lit8 v6, v1, -0x7

    .line 25
    .line 26
    aget-wide v8, v5, v6

    .line 27
    .line 28
    add-long/2addr v3, v8

    .line 29
    add-int/lit8 v6, v1, -0xf

    .line 30
    .line 31
    aget-wide v8, v5, v6

    .line 32
    .line 33
    invoke-direct {v0, v8, v9}, Lorg/spongycastle/crypto/digests/LongDigest;->Sigma0(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v5

    .line 37
    add-long/2addr v3, v5

    .line 38
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 39
    .line 40
    add-int/lit8 v6, v1, -0x10

    .line 41
    .line 42
    aget-wide v8, v5, v6

    .line 43
    .line 44
    add-long/2addr v3, v8

    .line 45
    aput-wide v3, v2, v1

    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 51
    .line 52
    iget-wide v3, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 53
    .line 54
    iget-wide v5, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 55
    .line 56
    iget-wide v8, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 57
    .line 58
    iget-wide v10, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 59
    .line 60
    iget-wide v12, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 61
    .line 62
    iget-wide v14, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 63
    .line 64
    move-wide/from16 v16, v8

    .line 65
    .line 66
    iget-wide v7, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 67
    .line 68
    move-wide/from16 v19, v12

    .line 69
    .line 70
    const/4 v9, 0x0

    .line 71
    const/16 v18, 0x0

    .line 72
    .line 73
    move-wide v12, v5

    .line 74
    move-wide v5, v14

    .line 75
    move-wide v14, v7

    .line 76
    move-wide v7, v1

    .line 77
    move-wide v1, v10

    .line 78
    move-wide v10, v3

    .line 79
    :goto_1
    const/16 v3, 0xa

    .line 80
    .line 81
    if-ge v9, v3, :cond_1

    .line 82
    .line 83
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 84
    .line 85
    .line 86
    move-result-wide v21

    .line 87
    move-wide/from16 v3, v19

    .line 88
    .line 89
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 90
    .line 91
    .line 92
    move-result-wide v19

    .line 93
    move-wide/from16 v23, v1

    .line 94
    .line 95
    move-wide/from16 v25, v3

    .line 96
    .line 97
    move-wide/from16 v27, v5

    .line 98
    .line 99
    add-long v21, v21, v19

    .line 100
    .line 101
    sget-object v19, Lorg/spongycastle/crypto/digests/LongDigest;->K:[J

    .line 102
    .line 103
    aget-wide v1, v19, v18

    .line 104
    .line 105
    add-long v21, v21, v1

    .line 106
    .line 107
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 108
    .line 109
    add-int/lit8 v20, v18, 0x1

    .line 110
    .line 111
    aget-wide v2, v1, v18

    .line 112
    .line 113
    add-long v21, v21, v2

    .line 114
    .line 115
    add-long v14, v14, v21

    .line 116
    .line 117
    add-long v1, v16, v14

    .line 118
    .line 119
    invoke-direct {v0, v7, v8}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 120
    .line 121
    .line 122
    move-result-wide v16

    .line 123
    move-wide v3, v7

    .line 124
    move-wide v7, v1

    .line 125
    move-wide v1, v3

    .line 126
    move-wide v3, v10

    .line 127
    move-wide v5, v12

    .line 128
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 129
    .line 130
    .line 131
    move-result-wide v10

    .line 132
    move-wide v12, v1

    .line 133
    move-wide/from16 v21, v3

    .line 134
    .line 135
    move-wide/from16 v29, v5

    .line 136
    .line 137
    add-long v16, v16, v10

    .line 138
    .line 139
    add-long v14, v14, v16

    .line 140
    .line 141
    invoke-direct {v0, v7, v8}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 142
    .line 143
    .line 144
    move-result-wide v10

    .line 145
    move-wide v1, v7

    .line 146
    move-wide/from16 v3, v23

    .line 147
    .line 148
    move-wide/from16 v5, v25

    .line 149
    .line 150
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 151
    .line 152
    .line 153
    move-result-wide v7

    .line 154
    move-wide/from16 v16, v1

    .line 155
    .line 156
    add-long/2addr v10, v7

    .line 157
    aget-wide v1, v19, v20

    .line 158
    .line 159
    add-long/2addr v10, v1

    .line 160
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 161
    .line 162
    add-int/lit8 v7, v18, 0x2

    .line 163
    .line 164
    aget-wide v2, v1, v20

    .line 165
    .line 166
    add-long/2addr v10, v2

    .line 167
    add-long v10, v27, v10

    .line 168
    .line 169
    add-long v1, v29, v10

    .line 170
    .line 171
    invoke-direct {v0, v14, v15}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 172
    .line 173
    .line 174
    move-result-wide v27

    .line 175
    move-wide v3, v12

    .line 176
    move-wide/from16 v5, v21

    .line 177
    .line 178
    move-wide v12, v1

    .line 179
    move-wide v1, v14

    .line 180
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 181
    .line 182
    .line 183
    move-result-wide v14

    .line 184
    move-wide/from16 v29, v1

    .line 185
    .line 186
    move-wide/from16 v20, v3

    .line 187
    .line 188
    move-wide/from16 v31, v5

    .line 189
    .line 190
    add-long v27, v27, v14

    .line 191
    .line 192
    add-long v10, v10, v27

    .line 193
    .line 194
    invoke-direct {v0, v12, v13}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 195
    .line 196
    .line 197
    move-result-wide v14

    .line 198
    move-wide v1, v12

    .line 199
    move-wide/from16 v3, v16

    .line 200
    .line 201
    move-wide/from16 v5, v23

    .line 202
    .line 203
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 204
    .line 205
    .line 206
    move-result-wide v12

    .line 207
    move-wide/from16 v27, v1

    .line 208
    .line 209
    add-long/2addr v14, v12

    .line 210
    aget-wide v1, v19, v7

    .line 211
    .line 212
    add-long/2addr v14, v1

    .line 213
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 214
    .line 215
    add-int/lit8 v8, v18, 0x3

    .line 216
    .line 217
    aget-wide v2, v1, v7

    .line 218
    .line 219
    add-long/2addr v14, v2

    .line 220
    add-long v12, v25, v14

    .line 221
    .line 222
    add-long v14, v31, v12

    .line 223
    .line 224
    invoke-direct {v0, v10, v11}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 225
    .line 226
    .line 227
    move-result-wide v25

    .line 228
    move-wide v1, v10

    .line 229
    move-wide/from16 v5, v20

    .line 230
    .line 231
    move-wide/from16 v3, v29

    .line 232
    .line 233
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 234
    .line 235
    .line 236
    move-result-wide v10

    .line 237
    move-wide/from16 v31, v1

    .line 238
    .line 239
    add-long v25, v25, v10

    .line 240
    .line 241
    add-long v12, v12, v25

    .line 242
    .line 243
    invoke-direct {v0, v14, v15}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 244
    .line 245
    .line 246
    move-result-wide v10

    .line 247
    move-wide v1, v14

    .line 248
    move-wide/from16 v5, v16

    .line 249
    .line 250
    move-wide/from16 v3, v27

    .line 251
    .line 252
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 253
    .line 254
    .line 255
    move-result-wide v14

    .line 256
    move-wide/from16 v25, v1

    .line 257
    .line 258
    add-long/2addr v10, v14

    .line 259
    aget-wide v1, v19, v8

    .line 260
    .line 261
    add-long/2addr v10, v1

    .line 262
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 263
    .line 264
    add-int/lit8 v7, v18, 0x4

    .line 265
    .line 266
    aget-wide v2, v1, v8

    .line 267
    .line 268
    add-long/2addr v10, v2

    .line 269
    add-long v10, v23, v10

    .line 270
    .line 271
    add-long v14, v20, v10

    .line 272
    .line 273
    invoke-direct {v0, v12, v13}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 274
    .line 275
    .line 276
    move-result-wide v20

    .line 277
    move-wide v1, v12

    .line 278
    move-wide/from16 v5, v29

    .line 279
    .line 280
    move-wide/from16 v3, v31

    .line 281
    .line 282
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 283
    .line 284
    .line 285
    move-result-wide v12

    .line 286
    move-wide/from16 v22, v1

    .line 287
    .line 288
    add-long v20, v20, v12

    .line 289
    .line 290
    add-long v10, v10, v20

    .line 291
    .line 292
    invoke-direct {v0, v14, v15}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 293
    .line 294
    .line 295
    move-result-wide v12

    .line 296
    move-wide v1, v14

    .line 297
    move-wide/from16 v3, v25

    .line 298
    .line 299
    move-wide/from16 v5, v27

    .line 300
    .line 301
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 302
    .line 303
    .line 304
    move-result-wide v14

    .line 305
    move-wide/from16 v20, v1

    .line 306
    .line 307
    add-long/2addr v12, v14

    .line 308
    aget-wide v1, v19, v7

    .line 309
    .line 310
    add-long/2addr v12, v1

    .line 311
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 312
    .line 313
    add-int/lit8 v8, v18, 0x5

    .line 314
    .line 315
    aget-wide v2, v1, v7

    .line 316
    .line 317
    add-long/2addr v12, v2

    .line 318
    add-long v12, v16, v12

    .line 319
    .line 320
    add-long v14, v29, v12

    .line 321
    .line 322
    invoke-direct {v0, v10, v11}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 323
    .line 324
    .line 325
    move-result-wide v16

    .line 326
    move-wide v1, v10

    .line 327
    move-wide/from16 v3, v22

    .line 328
    .line 329
    move-wide/from16 v5, v31

    .line 330
    .line 331
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 332
    .line 333
    .line 334
    move-result-wide v10

    .line 335
    move-wide/from16 v29, v1

    .line 336
    .line 337
    add-long v16, v16, v10

    .line 338
    .line 339
    add-long v12, v12, v16

    .line 340
    .line 341
    invoke-direct {v0, v14, v15}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 342
    .line 343
    .line 344
    move-result-wide v10

    .line 345
    move-wide v1, v14

    .line 346
    move-wide/from16 v3, v20

    .line 347
    .line 348
    move-wide/from16 v5, v25

    .line 349
    .line 350
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 351
    .line 352
    .line 353
    move-result-wide v14

    .line 354
    move-wide/from16 v16, v1

    .line 355
    .line 356
    add-long/2addr v10, v14

    .line 357
    aget-wide v1, v19, v8

    .line 358
    .line 359
    add-long/2addr v10, v1

    .line 360
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 361
    .line 362
    add-int/lit8 v7, v18, 0x6

    .line 363
    .line 364
    aget-wide v2, v1, v8

    .line 365
    .line 366
    add-long/2addr v10, v2

    .line 367
    add-long v10, v27, v10

    .line 368
    .line 369
    add-long v14, v31, v10

    .line 370
    .line 371
    invoke-direct {v0, v12, v13}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 372
    .line 373
    .line 374
    move-result-wide v27

    .line 375
    move-wide v1, v12

    .line 376
    move-wide/from16 v5, v22

    .line 377
    .line 378
    move-wide/from16 v3, v29

    .line 379
    .line 380
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 381
    .line 382
    .line 383
    move-result-wide v12

    .line 384
    move-wide/from16 v31, v1

    .line 385
    .line 386
    add-long v27, v27, v12

    .line 387
    .line 388
    add-long v10, v10, v27

    .line 389
    .line 390
    invoke-direct {v0, v14, v15}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 391
    .line 392
    .line 393
    move-result-wide v12

    .line 394
    move-wide v1, v14

    .line 395
    move-wide/from16 v3, v16

    .line 396
    .line 397
    move-wide/from16 v5, v20

    .line 398
    .line 399
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 400
    .line 401
    .line 402
    move-result-wide v14

    .line 403
    move-wide/from16 v27, v1

    .line 404
    .line 405
    add-long/2addr v12, v14

    .line 406
    aget-wide v1, v19, v7

    .line 407
    .line 408
    add-long/2addr v12, v1

    .line 409
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 410
    .line 411
    add-int/lit8 v8, v18, 0x7

    .line 412
    .line 413
    aget-wide v2, v1, v7

    .line 414
    .line 415
    add-long/2addr v12, v2

    .line 416
    add-long v14, v25, v12

    .line 417
    .line 418
    add-long v12, v22, v14

    .line 419
    .line 420
    invoke-direct {v0, v10, v11}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 421
    .line 422
    .line 423
    move-result-wide v22

    .line 424
    move-wide v1, v10

    .line 425
    move-wide/from16 v5, v29

    .line 426
    .line 427
    move-wide/from16 v3, v31

    .line 428
    .line 429
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 430
    .line 431
    .line 432
    move-result-wide v10

    .line 433
    move-wide/from16 v24, v1

    .line 434
    .line 435
    add-long v22, v22, v10

    .line 436
    .line 437
    add-long v14, v14, v22

    .line 438
    .line 439
    invoke-direct {v0, v12, v13}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum1(J)J

    .line 440
    .line 441
    .line 442
    move-result-wide v10

    .line 443
    move-wide v1, v12

    .line 444
    move-wide/from16 v5, v16

    .line 445
    .line 446
    move-wide/from16 v3, v27

    .line 447
    .line 448
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Ch(JJJ)J

    .line 449
    .line 450
    .line 451
    move-result-wide v12

    .line 452
    move-wide/from16 v22, v1

    .line 453
    .line 454
    add-long/2addr v10, v12

    .line 455
    aget-wide v1, v19, v8

    .line 456
    .line 457
    add-long/2addr v10, v1

    .line 458
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 459
    .line 460
    add-int/lit8 v18, v18, 0x8

    .line 461
    .line 462
    aget-wide v2, v1, v8

    .line 463
    .line 464
    add-long/2addr v10, v2

    .line 465
    add-long v7, v20, v10

    .line 466
    .line 467
    add-long v10, v29, v7

    .line 468
    .line 469
    invoke-direct {v0, v14, v15}, Lorg/spongycastle/crypto/digests/LongDigest;->Sum0(J)J

    .line 470
    .line 471
    .line 472
    move-result-wide v12

    .line 473
    move-wide v1, v14

    .line 474
    move-wide/from16 v3, v24

    .line 475
    .line 476
    move-wide/from16 v5, v31

    .line 477
    .line 478
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/LongDigest;->Maj(JJJ)J

    .line 479
    .line 480
    .line 481
    move-result-wide v14

    .line 482
    add-long/2addr v12, v14

    .line 483
    add-long/2addr v7, v12

    .line 484
    add-int/lit8 v9, v9, 0x1

    .line 485
    .line 486
    move-wide v5, v10

    .line 487
    move-wide v10, v1

    .line 488
    move-wide v1, v5

    .line 489
    move-wide v12, v3

    .line 490
    move-wide/from16 v14, v16

    .line 491
    .line 492
    move-wide/from16 v19, v22

    .line 493
    .line 494
    move-wide/from16 v5, v27

    .line 495
    .line 496
    move-wide/from16 v16, v31

    .line 497
    .line 498
    goto/16 :goto_1

    .line 499
    .line 500
    :cond_1
    move-wide/from16 v23, v1

    .line 501
    .line 502
    move-wide/from16 v27, v5

    .line 503
    .line 504
    move-wide/from16 v31, v10

    .line 505
    .line 506
    move-wide/from16 v29, v12

    .line 507
    .line 508
    move-wide/from16 v25, v19

    .line 509
    .line 510
    move-wide/from16 v20, v7

    .line 511
    .line 512
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 513
    .line 514
    add-long v1, v1, v20

    .line 515
    .line 516
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 517
    .line 518
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 519
    .line 520
    add-long v1, v1, v31

    .line 521
    .line 522
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 523
    .line 524
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 525
    .line 526
    add-long v1, v1, v29

    .line 527
    .line 528
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 529
    .line 530
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 531
    .line 532
    add-long v1, v1, v16

    .line 533
    .line 534
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 535
    .line 536
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 537
    .line 538
    add-long v1, v1, v23

    .line 539
    .line 540
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 541
    .line 542
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 543
    .line 544
    add-long v1, v1, v25

    .line 545
    .line 546
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 547
    .line 548
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 549
    .line 550
    add-long v1, v1, v27

    .line 551
    .line 552
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 553
    .line 554
    iget-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 555
    .line 556
    add-long/2addr v1, v14

    .line 557
    iput-wide v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 558
    .line 559
    const/4 v1, 0x0

    .line 560
    iput v1, v0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 561
    .line 562
    move v9, v1

    .line 563
    const/16 v1, 0x10

    .line 564
    .line 565
    :goto_2
    if-ge v9, v1, :cond_2

    .line 566
    .line 567
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 568
    .line 569
    const-wide/16 v3, 0x0

    .line 570
    .line 571
    aput-wide v3, v2, v9

    .line 572
    .line 573
    add-int/lit8 v9, v9, 0x1

    .line 574
    .line 575
    goto :goto_2

    .line 576
    :cond_2
    return-void
.end method

.method public processLength(JJ)V
    .locals 2

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/LongDigest;->processBlock()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 11
    .line 12
    aput-wide p3, p0, v1

    .line 13
    .line 14
    const/16 p3, 0xf

    .line 15
    .line 16
    aput-wide p1, p0, p3

    .line 17
    .line 18
    return-void
.end method

.method public processWord([BI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 4
    .line 5
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    aput-wide p1, v0, v1

    .line 10
    .line 11
    iget p1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 12
    .line 13
    add-int/lit8 p1, p1, 0x1

    .line 14
    .line 15
    iput p1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 16
    .line 17
    const/16 p2, 0x10

    .line 18
    .line 19
    if-ne p1, p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/LongDigest;->processBlock()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 4
    .line 5
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    iput v2, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 9
    .line 10
    move v3, v2

    .line 11
    :goto_0
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 12
    .line 13
    array-length v5, v4

    .line 14
    if-ge v3, v5, :cond_0

    .line 15
    .line 16
    aput-byte v2, v4, v3

    .line 17
    .line 18
    add-int/lit8 v3, v3, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iput v2, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 22
    .line 23
    :goto_1
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 24
    .line 25
    array-length v4, v3

    .line 26
    if-eq v2, v4, :cond_1

    .line 27
    .line 28
    aput-wide v0, v3, v2

    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    return-void
.end method

.method public restoreState([B)V
    .locals 5

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 8
    .line 9
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0xc

    .line 16
    .line 17
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 22
    .line 23
    const/16 v0, 0x14

    .line 24
    .line 25
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount2:J

    .line 30
    .line 31
    const/16 v0, 0x1c

    .line 32
    .line 33
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H1:J

    .line 38
    .line 39
    const/16 v0, 0x24

    .line 40
    .line 41
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H2:J

    .line 46
    .line 47
    const/16 v0, 0x2c

    .line 48
    .line 49
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H3:J

    .line 54
    .line 55
    const/16 v0, 0x34

    .line 56
    .line 57
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H4:J

    .line 62
    .line 63
    const/16 v0, 0x3c

    .line 64
    .line 65
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H5:J

    .line 70
    .line 71
    const/16 v0, 0x44

    .line 72
    .line 73
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 74
    .line 75
    .line 76
    move-result-wide v0

    .line 77
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H6:J

    .line 78
    .line 79
    const/16 v0, 0x4c

    .line 80
    .line 81
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H7:J

    .line 86
    .line 87
    const/16 v0, 0x54

    .line 88
    .line 89
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->H8:J

    .line 94
    .line 95
    const/16 v0, 0x5c

    .line 96
    .line 97
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iput v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 102
    .line 103
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->wOff:I

    .line 104
    .line 105
    if-ge v2, v0, :cond_0

    .line 106
    .line 107
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->W:[J

    .line 108
    .line 109
    mul-int/lit8 v1, v2, 0x8

    .line 110
    .line 111
    add-int/lit8 v1, v1, 0x60

    .line 112
    .line 113
    invoke-static {p1, v1}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    .line 114
    .line 115
    .line 116
    move-result-wide v3

    .line 117
    aput-wide v3, v0, v2

    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_0
    return-void
.end method

.method public update(B)V
    .locals 4

    .line 52
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    aput-byte p1, v0, v1

    .line 53
    array-length p1, v0

    if-ne v2, p1, :cond_0

    const/4 p1, 0x0

    .line 54
    invoke-virtual {p0, v0, p1}, Lorg/spongycastle/crypto/digests/LongDigest;->processWord([BI)V

    .line 55
    iput p1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 56
    :cond_0
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    return-void
.end method

.method public update([BII)V
    .locals 5

    .line 1
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBufOff:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-lez p3, :cond_0

    .line 6
    .line 7
    aget-byte v0, p1, p2

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/LongDigest;->update(B)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 p2, p2, 0x1

    .line 13
    .line 14
    add-int/lit8 p3, p3, -0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    :goto_1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 18
    .line 19
    array-length v0, v0

    .line 20
    if-le p3, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/digests/LongDigest;->processWord([BI)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/LongDigest;->xBuf:[B

    .line 26
    .line 27
    array-length v1, v0

    .line 28
    add-int/2addr p2, v1

    .line 29
    array-length v1, v0

    .line 30
    sub-int/2addr p3, v1

    .line 31
    iget-wide v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 32
    .line 33
    array-length v0, v0

    .line 34
    int-to-long v3, v0

    .line 35
    add-long/2addr v1, v3

    .line 36
    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/LongDigest;->byteCount1:J

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_2
    if-lez p3, :cond_2

    .line 40
    .line 41
    aget-byte v0, p1, p2

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/LongDigest;->update(B)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 p2, p2, 0x1

    .line 47
    .line 48
    add-int/lit8 p3, p3, -0x1

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    return-void
.end method
