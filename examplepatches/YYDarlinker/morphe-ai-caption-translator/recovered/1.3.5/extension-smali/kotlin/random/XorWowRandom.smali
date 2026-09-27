.class public final Lkotlin/random/XorWowRandom;
.super Lkotlin/random/Random;
.source "XorWowRandom.kt"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/random/XorWowRandom$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nXorWowRandom.kt\nKotlin\n*S Kotlin\n*F\n+ 1 XorWowRandom.kt\nkotlin/random/XorWowRandom\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,68:1\n1#2:69\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0005\u0008\u0000\u0018\u0000 \u00172\u00020\u00012\u00060\u0002j\u0002`\u0003:\u0001\u0017B9\u0008@\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0005\u0012\u0006\u0010\t\u001a\u00020\u0005\u0012\u0006\u0010\n\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u000b\u0010\u000cB\u0019\u0008P\u0012\u0006\u0010\r\u001a\u00020\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u000b\u0010\u000fJ\n\u0010\u0010\u001a\u00020\u0011H\u0082\u0080\u0004J\n\u0010\u0012\u001a\u00020\u0013H\u0082\u0080\u0004J\n\u0010\u0014\u001a\u00020\u0005H\u0096\u0080\u0004J\u0012\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u0005H\u0096\u0080\u0004R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0006\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0007\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0008\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\t\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\n\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lkotlin/random/XorWowRandom;",
        "Lkotlin/random/Random;",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "x",
        "",
        "y",
        "z",
        "w",
        "v",
        "addend",
        "<init>",
        "(IIIIII)V",
        "seed1",
        "seed2",
        "(II)V",
        "checkInvariants",
        "",
        "readResolve",
        "",
        "nextInt",
        "nextBits",
        "bitCount",
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
.field private static final Companion:Lkotlin/random/XorWowRandom$Companion;

.field private static final serialVersionUID:J


# instance fields
.field private addend:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/random/XorWowRandom$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/random/XorWowRandom$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/random/XorWowRandom;->Companion:Lkotlin/random/XorWowRandom$Companion;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 10

    not-int v5, p1

    shl-int/lit8 v0, p1, 0xa

    ushr-int/lit8 v1, p2, 0x4

    xor-int v6, v0, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    .line 30
    invoke-direct/range {v0 .. v6}, Lkotlin/random/XorWowRandom;-><init>(IIIIII)V

    return-void
.end method

.method public constructor <init>(IIIIII)V
    .registers 7

    .line 20
    invoke-direct {p0}, Lkotlin/random/Random;-><init>()V

    .line 21
    iput p1, p0, Lkotlin/random/XorWowRandom;->x:I

    .line 22
    iput p2, p0, Lkotlin/random/XorWowRandom;->y:I

    .line 23
    iput p3, p0, Lkotlin/random/XorWowRandom;->z:I

    .line 24
    iput p4, p0, Lkotlin/random/XorWowRandom;->w:I

    .line 25
    iput p5, p0, Lkotlin/random/XorWowRandom;->v:I

    .line 26
    iput p6, p0, Lkotlin/random/XorWowRandom;->addend:I

    .line 33
    invoke-direct {p0}, Lkotlin/random/XorWowRandom;->checkInvariants()V

    const/4 p1, 0x0

    :goto_13
    const/16 p2, 0x40

    if-ge p1, p2, :cond_1d

    .line 36
    invoke-virtual {p0}, Lkotlin/random/XorWowRandom;->nextInt()I

    add-int/lit8 p1, p1, 0x1

    goto :goto_13

    :cond_1d
    return-void
.end method

.method private final checkInvariants()V
    .registers 3

    .line 40
    iget v0, p0, Lkotlin/random/XorWowRandom;->x:I

    iget v1, p0, Lkotlin/random/XorWowRandom;->y:I

    or-int/2addr v0, v1

    iget v1, p0, Lkotlin/random/XorWowRandom;->z:I

    or-int/2addr v0, v1

    iget v1, p0, Lkotlin/random/XorWowRandom;->w:I

    or-int/2addr v0, v1

    iget p0, p0, Lkotlin/random/XorWowRandom;->v:I

    or-int/2addr p0, v0

    if-eqz p0, :cond_11

    return-void

    :cond_11
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Initial state must have at least one non-zero element."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final readResolve()Ljava/lang/Object;
    .registers 3

    .line 43
    move-object v0, p0

    check-cast v0, Lkotlin/random/XorWowRandom;

    :try_start_3
    invoke-direct {p0}, Lkotlin/random/XorWowRandom;->checkInvariants()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    return-object p0

    :catchall_7
    move-exception p0

    new-instance v0, Ljava/io/InvalidObjectException;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/io/InvalidObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    const-string v0, "initCause(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public nextBits(I)I
    .registers 2

    .line 62
    invoke-virtual {p0}, Lkotlin/random/XorWowRandom;->nextInt()I

    move-result p0

    invoke-static {p0, p1}, Lkotlin/random/RandomKt;->takeUpperBits(II)I

    move-result p0

    return p0
.end method

.method public nextInt()I
    .registers 4

    .line 48
    iget v0, p0, Lkotlin/random/XorWowRandom;->x:I

    ushr-int/lit8 v1, v0, 0x2

    xor-int/2addr v0, v1

    .line 50
    iget v1, p0, Lkotlin/random/XorWowRandom;->y:I

    iput v1, p0, Lkotlin/random/XorWowRandom;->x:I

    .line 51
    iget v1, p0, Lkotlin/random/XorWowRandom;->z:I

    iput v1, p0, Lkotlin/random/XorWowRandom;->y:I

    .line 52
    iget v1, p0, Lkotlin/random/XorWowRandom;->w:I

    iput v1, p0, Lkotlin/random/XorWowRandom;->z:I

    .line 53
    iget v1, p0, Lkotlin/random/XorWowRandom;->v:I

    .line 54
    iput v1, p0, Lkotlin/random/XorWowRandom;->w:I

    shl-int/lit8 v2, v0, 0x1

    xor-int/2addr v0, v2

    xor-int/2addr v0, v1

    shl-int/lit8 v1, v1, 0x4

    xor-int/2addr v0, v1

    .line 56
    iput v0, p0, Lkotlin/random/XorWowRandom;->v:I

    .line 57
    iget v1, p0, Lkotlin/random/XorWowRandom;->addend:I

    const v2, 0x587c5

    add-int/2addr v1, v2

    iput v1, p0, Lkotlin/random/XorWowRandom;->addend:I

    add-int/2addr v0, v1

    return v0
.end method
