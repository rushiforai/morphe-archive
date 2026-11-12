.class public final Lw8e;
.super Lx8e;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lv8e;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final e:[Ll4c;


# instance fields
.field public final c:Ljava/math/BigInteger;

.field public final d:Lh46;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lv8e;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lw8e;->Companion:Lv8e;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Luuc;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Luuc;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object v0, v1, v2

    sput-object v1, Lw8e;->e:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/math/BigInteger;Lh46;)V
    .registers 6

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_e

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lx8e;-><init>(I)V

    iput-object p2, p0, Lw8e;->c:Ljava/math/BigInteger;

    iput-object p3, p0, Lw8e;->d:Lh46;

    return-void

    :cond_e
    sget-object p0, Lu8e;->a:Lu8e;

    invoke-virtual {p0}, Lu8e;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/math/BigInteger;Lh46;)V
    .registers 3

    .line 25
    invoke-direct {p0}, Lx8e;-><init>()V

    .line 26
    iput-object p1, p0, Lw8e;->c:Ljava/math/BigInteger;

    .line 27
    iput-object p2, p0, Lw8e;->d:Lh46;

    return-void
.end method


# virtual methods
.method public final a()Ljava/math/BigInteger;
    .registers 1

    iget-object p0, p0, Lw8e;->c:Ljava/math/BigInteger;

    return-object p0
.end method

.method public final b()Li46;
    .registers 1

    iget-object p0, p0, Lw8e;->d:Lh46;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lw8e;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lw8e;

    iget-object v1, p0, Lw8e;->c:Ljava/math/BigInteger;

    iget-object v3, p1, Lw8e;->c:Ljava/math/BigInteger;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lw8e;->d:Lh46;

    iget-object p1, p1, Lw8e;->d:Lh46;

    if-eq p0, p1, :cond_1e

    return v2

    :cond_1e
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lw8e;->d:Lh46;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    invoke-super {p0}, Lx8e;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
