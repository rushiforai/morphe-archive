.class Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SeedGenerator"
.end annotation


# instance fields
.field private volatile counter:I

.field private volatile stop:Z

.field final synthetic this$0:Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;


# direct methods
.method private constructor <init>(Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->this$0:Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 8
    .line 9
    iput-boolean p1, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$1;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;-><init>(Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;)V

    return-void
.end method


# virtual methods
.method public generateSeed(IZ)[B
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    new-array v1, p1, [B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 10
    .line 11
    iput-boolean v2, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    mul-int/lit8 p1, p1, 0x8

    .line 20
    .line 21
    :goto_0
    move v0, v2

    .line 22
    :goto_1
    const/4 v3, 0x1

    .line 23
    if-ge v2, p1, :cond_3

    .line 24
    .line 25
    :catch_0
    :goto_2
    iget v4, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 26
    .line 27
    if-ne v4, v0, :cond_1

    .line 28
    .line 29
    const-wide/16 v4, 0x1

    .line 30
    .line 31
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_1
    iget v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 36
    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    and-int/lit16 v3, v0, 0xff

    .line 40
    .line 41
    int-to-byte v3, v3

    .line 42
    aput-byte v3, v1, v2

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_2
    div-int/lit8 v4, v2, 0x8

    .line 46
    .line 47
    aget-byte v5, v1, v4

    .line 48
    .line 49
    shl-int/lit8 v3, v5, 0x1

    .line 50
    .line 51
    and-int/lit8 v5, v0, 0x1

    .line 52
    .line 53
    or-int/2addr v3, v5

    .line 54
    int-to-byte v3, v3

    .line 55
    aput-byte v3, v1, v4

    .line 56
    .line 57
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    iput-boolean v3, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    .line 61
    .line 62
    return-object v1
.end method

.method public run()V
    .locals 1

    .line 1
    :goto_0
    iget-boolean v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void
.end method
