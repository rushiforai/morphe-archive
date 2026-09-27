.class final Lkotlin/random/KotlinRandom;
.super Ljava/util/Random;
.source "PlatformRandom.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/random/KotlinRandom$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0005\u0008\u0002\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001cB\u0011\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0014J\u0008\u0010\u000b\u001a\u00020\tH\u0016J\u0010\u0010\u000b\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\tH\u0016J\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J\u0010\u0010\u001a\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u0010H\u0016R\u0015\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u000f\u0010\u0019\u001a\u00020\u000eX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lkotlin/random/KotlinRandom;",
        "Ljava/util/Random;",
        "impl",
        "Lkotlin/random/Random;",
        "<init>",
        "(Lkotlin/random/Random;)V",
        "getImpl",
        "()Lkotlin/random/Random;",
        "next",
        "",
        "bits",
        "nextInt",
        "bound",
        "nextBoolean",
        "",
        "nextLong",
        "",
        "nextFloat",
        "",
        "nextDouble",
        "",
        "nextBytes",
        "",
        "bytes",
        "",
        "seedInitialized",
        "setSeed",
        "seed",
        "Companion",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final Companion:Lkotlin/random/KotlinRandom$Companion;

.field private static final serialVersionUID:J


# instance fields
.field private final impl:Lkotlin/random/Random;

.field private seedInitialized:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/random/KotlinRandom$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/random/KotlinRandom$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/random/KotlinRandom;->Companion:Lkotlin/random/KotlinRandom$Companion;

    return-void
.end method

.method public constructor <init>(Lkotlin/random/Random;)V
    .registers 3

    const-string v0, "impl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    return-void
.end method


# virtual methods
.method public final getImpl()Lkotlin/random/Random;
    .registers 1

    .line 66
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    return-object p0
.end method

.method protected next(I)I
    .registers 2

    .line 67
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0, p1}, Lkotlin/random/Random;->nextBits(I)I

    move-result p0

    return p0
.end method

.method public nextBoolean()Z
    .registers 1

    .line 70
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0}, Lkotlin/random/Random;->nextBoolean()Z

    move-result p0

    return p0
.end method

.method public nextBytes([B)V
    .registers 3

    const-string v0, "bytes"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0, p1}, Lkotlin/random/Random;->nextBytes([B)[B

    return-void
.end method

.method public nextDouble()D
    .registers 3

    .line 73
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0}, Lkotlin/random/Random;->nextDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public nextFloat()F
    .registers 1

    .line 72
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0}, Lkotlin/random/Random;->nextFloat()F

    move-result p0

    return p0
.end method

.method public nextInt()I
    .registers 1

    .line 68
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0}, Lkotlin/random/Random;->nextInt()I

    move-result p0

    return p0
.end method

.method public nextInt(I)I
    .registers 2

    .line 69
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0, p1}, Lkotlin/random/Random;->nextInt(I)I

    move-result p0

    return p0
.end method

.method public nextLong()J
    .registers 3

    .line 71
    iget-object p0, p0, Lkotlin/random/KotlinRandom;->impl:Lkotlin/random/Random;

    invoke-virtual {p0}, Lkotlin/random/Random;->nextLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public setSeed(J)V
    .registers 3

    .line 82
    iget-boolean p1, p0, Lkotlin/random/KotlinRandom;->seedInitialized:Z

    if-nez p1, :cond_8

    const/4 p1, 0x1

    .line 84
    iput-boolean p1, p0, Lkotlin/random/KotlinRandom;->seedInitialized:Z

    return-void

    .line 86
    :cond_8
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Setting seed is not supported."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
