.class public final Luzl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ltzl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final f:[Ll4c;


# instance fields
.field public final a:Lh46;

.field public final b:Ljava/math/BigInteger;

.field public final c:Ljava/math/BigInteger;

.field public final d:Ljava/math/BigInteger;

.field public final e:Lw8e;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ltzl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Luzl;->Companion:Ltzl;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lthk;

    const/16 v2, 0x1a

    invoke-direct {v1, v2}, Lthk;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x5

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    const/4 v2, 0x0

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v2, v1, v0

    const/4 v0, 0x3

    aput-object v2, v1, v0

    const/4 v0, 0x4

    aput-object v2, v1, v0

    sput-object v1, Luzl;->f:[Ll4c;

    return-void
.end method

.method public constructor <init>(ILh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lw8e;)V
    .registers 10

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_48

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Luzl;->a:Lh46;

    and-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_12

    iput-object v1, p0, Luzl;->b:Ljava/math/BigInteger;

    goto :goto_14

    :cond_12
    iput-object p3, p0, Luzl;->b:Ljava/math/BigInteger;

    :goto_14
    and-int/lit8 p3, p1, 0x4

    if-nez p3, :cond_1b

    iput-object v1, p0, Luzl;->c:Ljava/math/BigInteger;

    goto :goto_1d

    :cond_1b
    iput-object p4, p0, Luzl;->c:Ljava/math/BigInteger;

    :goto_1d
    and-int/lit8 p3, p1, 0x8

    if-nez p3, :cond_24

    iput-object v1, p0, Luzl;->d:Ljava/math/BigInteger;

    goto :goto_26

    :cond_24
    iput-object p5, p0, Luzl;->d:Ljava/math/BigInteger;

    :goto_26
    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_45

    new-instance p1, Lw8e;

    iget-object p3, p0, Luzl;->c:Ljava/math/BigInteger;

    if-eqz p3, :cond_39

    iget-object p4, p0, Luzl;->d:Ljava/math/BigInteger;

    if-eqz p4, :cond_39

    invoke-virtual {p3, p4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p3

    goto :goto_3b

    :cond_39
    sget-object p3, Lpe3;->a:Ljava/math/BigInteger;

    :goto_3b
    invoke-virtual {p2, p3}, Lh46;->j(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p3

    invoke-direct {p1, p3, p2}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    iput-object p1, p0, Luzl;->e:Lw8e;

    return-void

    :cond_45
    iput-object p6, p0, Luzl;->e:Lw8e;

    return-void

    :cond_48
    sget-object p0, Lszl;->a:Lszl;

    invoke-virtual {p0}, Lszl;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Lh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .registers 5

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Luzl;->a:Lh46;

    .line 84
    iput-object p2, p0, Luzl;->b:Ljava/math/BigInteger;

    .line 85
    iput-object p3, p0, Luzl;->c:Ljava/math/BigInteger;

    .line 86
    iput-object p4, p0, Luzl;->d:Ljava/math/BigInteger;

    .line 87
    new-instance p2, Lw8e;

    if-eqz p3, :cond_16

    if-eqz p4, :cond_16

    .line 88
    invoke-virtual {p3, p4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p3

    goto :goto_18

    .line 89
    :cond_16
    sget-object p3, Lpe3;->a:Ljava/math/BigInteger;

    .line 90
    :goto_18
    invoke-virtual {p1, p3}, Lh46;->j(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    iput-object p2, p0, Luzl;->e:Lw8e;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Luzl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Luzl;

    iget-object v1, p0, Luzl;->a:Lh46;

    iget-object v3, p1, Luzl;->a:Lh46;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Luzl;->b:Ljava/math/BigInteger;

    iget-object v3, p1, Luzl;->b:Ljava/math/BigInteger;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Luzl;->c:Ljava/math/BigInteger;

    iget-object v3, p1, Luzl;->c:Ljava/math/BigInteger;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object p0, p0, Luzl;->d:Ljava/math/BigInteger;

    iget-object p1, p1, Luzl;->d:Ljava/math/BigInteger;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    return v2

    :cond_34
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Luzl;->a:Lh46;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Luzl;->b:Ljava/math/BigInteger;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/math/BigInteger;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Luzl;->c:Ljava/math/BigInteger;

    if-nez v2, :cond_1c

    move v2, v1

    goto :goto_20

    :cond_1c
    invoke-virtual {v2}, Ljava/math/BigInteger;->hashCode()I

    move-result v2

    :goto_20
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Luzl;->d:Ljava/math/BigInteger;

    if-eqz p0, :cond_2b

    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    move-result v1

    :cond_2b
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Fee(currency="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Luzl;->a:Lh46;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", maxPriorityPerGas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Luzl;->b:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", maxPerGas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Luzl;->c:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", amount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Luzl;->d:Ljava/math/BigInteger;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
