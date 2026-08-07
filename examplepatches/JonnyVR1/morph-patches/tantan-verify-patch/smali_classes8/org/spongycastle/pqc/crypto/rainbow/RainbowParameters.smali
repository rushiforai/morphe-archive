.class public Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private final DEFAULT_VI:[I

.field private vi:[I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x16

    const/16 v1, 0x21

    const/4 v2, 0x6

    const/16 v3, 0xc

    const/16 v4, 0x11

    .line 31
    filled-new-array {v2, v3, v4, v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->DEFAULT_VI:[I

    .line 32
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    return-void
.end method

.method public constructor <init>([I)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x16

    .line 5
    .line 6
    const/16 v1, 0x21

    .line 7
    .line 8
    const/4 v2, 0x6

    .line 9
    const/16 v3, 0xc

    .line 10
    .line 11
    const/16 v4, 0x11

    .line 12
    .line 13
    filled-new-array {v2, v3, v4, v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->DEFAULT_VI:[I

    .line 18
    .line 19
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 20
    .line 21
    :try_start_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->checkParams()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private checkParams()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-le v0, v1, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 11
    .line 12
    array-length v3, v2

    .line 13
    sub-int/2addr v3, v1

    .line 14
    if-ge v0, v3, :cond_1

    .line 15
    .line 16
    aget v3, v2, v0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    aget v2, v2, v0

    .line 21
    .line 22
    if-ge v3, v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "v[i] has to be smaller than v[i+1]"

    .line 26
    .line 27
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void

    .line 31
    :cond_2
    const-string p0, "Rainbow needs at least 1 layer, such that v1 < v2."

    .line 32
    .line 33
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    const-string p0, "no layers defined."

    .line 38
    .line 39
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public getDocLength()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    aget v0, p0, v0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget p0, p0, v1

    .line 10
    .line 11
    sub-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public getNumOfLayers()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    add-int/lit8 p0, p0, -0x1

    .line 5
    .line 6
    return p0
.end method

.method public getVi()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 2
    .line 3
    return-object p0
.end method
