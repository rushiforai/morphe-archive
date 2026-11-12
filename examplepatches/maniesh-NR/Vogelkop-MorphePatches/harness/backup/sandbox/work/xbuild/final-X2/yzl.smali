.class public final Lyzl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lqzl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final h:[Ll4c;


# instance fields
.field public final a:Lnle;

.field public final b:Lwv;

.field public final c:Lwv;

.field public final d:Lw8e;

.field public final e:Ljava/lang/String;

.field public final f:Lrzl;

.field public final g:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lqzl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lyzl;->Companion:Lqzl;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lthk;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lthk;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v1

    new-instance v2, Lthk;

    const/16 v3, 0x19

    invoke-direct {v2, v3}, Lthk;-><init>(B)V

    invoke-static {v0, v2}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v2, 0x7

    new-array v2, v2, [Ll4c;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    const/4 v3, 0x0

    aput-object v3, v2, v1

    const/4 v1, 0x2

    aput-object v3, v2, v1

    const/4 v1, 0x3

    aput-object v3, v2, v1

    const/4 v1, 0x4

    aput-object v3, v2, v1

    const/4 v1, 0x5

    aput-object v0, v2, v1

    const/4 v0, 0x6

    aput-object v3, v2, v0

    sput-object v2, Lyzl;->h:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILnle;Lwv;Lwv;Lw8e;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;)V
    .registers 12

    and-int/lit8 v0, p1, 0x3f

    const/4 v1, 0x0

    const/16 v2, 0x3f

    if-ne v2, v0, :cond_20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyzl;->a:Lnle;

    iput-object p3, p0, Lyzl;->b:Lwv;

    iput-object p4, p0, Lyzl;->c:Lwv;

    iput-object p5, p0, Lyzl;->d:Lw8e;

    iput-object p6, p0, Lyzl;->e:Ljava/lang/String;

    iput-object p7, p0, Lyzl;->f:Lrzl;

    and-int/lit8 p1, p1, 0x40

    if-nez p1, :cond_1d

    iput-object v1, p0, Lyzl;->g:Ljava/math/BigInteger;

    return-void

    :cond_1d
    iput-object p8, p0, Lyzl;->g:Ljava/math/BigInteger;

    return-void

    :cond_20
    sget-object p0, Lpzl;->a:Lpzl;

    invoke-virtual {p0}, Lpzl;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Lnle;Lwv;Lwv;Lw8e;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;)V
    .registers 8

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lyzl;->a:Lnle;

    .line 44
    iput-object p2, p0, Lyzl;->b:Lwv;

    .line 45
    iput-object p3, p0, Lyzl;->c:Lwv;

    .line 46
    iput-object p4, p0, Lyzl;->d:Lw8e;

    .line 47
    iput-object p5, p0, Lyzl;->e:Ljava/lang/String;

    .line 48
    iput-object p6, p0, Lyzl;->f:Lrzl;

    .line 49
    iput-object p7, p0, Lyzl;->g:Ljava/math/BigInteger;

    return-void
.end method

.method public static a(Lyzl;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;I)Lyzl;
    .registers 13

    iget-object v1, p0, Lyzl;->a:Lnle;

    iget-object v2, p0, Lyzl;->b:Lwv;

    iget-object v3, p0, Lyzl;->c:Lwv;

    iget-object v4, p0, Lyzl;->d:Lw8e;

    and-int/lit8 v0, p4, 0x10

    if-eqz v0, :cond_e

    iget-object p1, p0, Lyzl;->e:Ljava/lang/String;

    :cond_e
    move-object v5, p1

    and-int/lit8 p1, p4, 0x20

    if-eqz p1, :cond_15

    iget-object p2, p0, Lyzl;->f:Lrzl;

    :cond_15
    move-object v6, p2

    and-int/lit8 p4, p4, 0x40

    if-eqz p4, :cond_1c

    iget-object p3, p0, Lyzl;->g:Ljava/math/BigInteger;

    :cond_1c
    move-object v7, p3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lyzl;

    invoke-direct/range {v0 .. v7}, Lyzl;-><init>(Lnle;Lwv;Lwv;Lw8e;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lyzl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lyzl;

    iget-object v1, p0, Lyzl;->a:Lnle;

    iget-object v3, p1, Lyzl;->a:Lnle;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lyzl;->b:Lwv;

    iget-object v3, p1, Lyzl;->b:Lwv;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lyzl;->c:Lwv;

    iget-object v3, p1, Lyzl;->c:Lwv;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lyzl;->d:Lw8e;

    iget-object v3, p1, Lyzl;->d:Lw8e;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lyzl;->e:Ljava/lang/String;

    iget-object v3, p1, Lyzl;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    return v2

    :cond_3f
    iget-object v1, p0, Lyzl;->f:Lrzl;

    iget-object v3, p1, Lyzl;->f:Lrzl;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    return v2

    :cond_4a
    iget-object p0, p0, Lyzl;->g:Ljava/math/BigInteger;

    iget-object p1, p1, Lyzl;->g:Ljava/math/BigInteger;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    return v2

    :cond_55
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lyzl;->a:Lnle;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lyzl;->b:Lwv;

    iget-object v2, v2, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {v2}, Ljava/math/BigInteger;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    const/4 v0, 0x0

    iget-object v3, p0, Lyzl;->c:Lwv;

    if-nez v3, :cond_1a

    move v3, v0

    goto :goto_20

    :cond_1a
    iget-object v3, v3, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {v3}, Ljava/math/BigInteger;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Lyzl;->d:Lw8e;

    invoke-virtual {v3}, Lw8e;->hashCode()I

    move-result v3

    add-int/2addr v3, v2

    mul-int/2addr v3, v1

    iget-object v2, p0, Lyzl;->e:Ljava/lang/String;

    invoke-static {v3, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lyzl;->f:Lrzl;

    if-nez v3, :cond_36

    move v3, v0

    goto :goto_3a

    :cond_36
    invoke-virtual {v3}, Lrzl;->hashCode()I

    move-result v3

    :goto_3a
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object p0, p0, Lyzl;->g:Ljava/math/BigInteger;

    if-eqz p0, :cond_44

    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    :cond_44
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Transaction(net="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lyzl;->a:Lnle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", from="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lyzl;->b:Lwv;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", to="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lyzl;->c:Lwv;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", money="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lyzl;->d:Lw8e;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", encodedData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lyzl;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", decodedData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lyzl;->f:Lrzl;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", nonce="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lyzl;->g:Ljava/math/BigInteger;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
