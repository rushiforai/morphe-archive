.class public final Lf46;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li46;


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Le46;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final f:[Ll4c;


# instance fields
.field public final a:Lg46;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Le46;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lf46;->Companion:Le46;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lki5;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Lki5;-><init>(B)V

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

    sput-object v1, Lf46;->f:[Ll4c;

    return-void
.end method

.method public constructor <init>(ILg46;Ljava/lang/String;Ljava/lang/String;II)V
    .registers 9

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    if-ne v1, v0, :cond_38

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lf46;->a:Lg46;

    and-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_10

    iget-object p3, p2, Lg46;->a:Ljava/lang/String;

    :cond_10
    iput-object p3, p0, Lf46;->b:Ljava/lang/String;

    and-int/lit8 p3, p1, 0x4

    if-nez p3, :cond_1f

    iget-object p3, p2, Lg46;->d:Ljava/lang/String;

    if-nez p3, :cond_1c

    iget-object p3, p2, Lg46;->a:Ljava/lang/String;

    :cond_1c
    iput-object p3, p0, Lf46;->c:Ljava/lang/String;

    goto :goto_21

    :cond_1f
    iput-object p4, p0, Lf46;->c:Ljava/lang/String;

    :goto_21
    and-int/lit8 p3, p1, 0x8

    if-nez p3, :cond_2a

    iget-byte p3, p2, Lg46;->b:B

    iput p3, p0, Lf46;->d:I

    goto :goto_2c

    :cond_2a
    iput p5, p0, Lf46;->d:I

    :goto_2c
    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_35

    iget p1, p2, Lg46;->c:I

    iput p1, p0, Lf46;->e:I

    return-void

    :cond_35
    iput p6, p0, Lf46;->e:I

    return-void

    :cond_38
    sget-object p0, Ld46;->a:Ld46;

    invoke-virtual {p0}, Ld46;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final d()I
    .registers 1

    iget p0, p0, Lf46;->d:I

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lf46;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lf46;

    iget-object v1, p0, Lf46;->a:Lg46;

    iget-object v3, p1, Lf46;->a:Lg46;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lf46;->b:Ljava/lang/String;

    iget-object v3, p1, Lf46;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lf46;->c:Ljava/lang/String;

    iget-object v3, p1, Lf46;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget v1, p0, Lf46;->d:I

    iget v3, p1, Lf46;->d:I

    if-eq v1, v3, :cond_30

    return v2

    :cond_30
    iget p0, p0, Lf46;->e:I

    iget p1, p1, Lf46;->e:I

    if-eq p0, p1, :cond_37

    return v2

    :cond_37
    return v0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lf46;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final h()I
    .registers 1

    iget p0, p0, Lf46;->e:I

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lf46;->a:Lg46;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lf46;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lf46;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lf46;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget p0, p0, Lf46;->e:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final i()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lf46;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Custom(fiat="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lf46;->a:Lg46;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lf46;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", symbol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lf46;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", decimals="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lf46;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", formatDecimals="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    iget p0, p0, Lf46;->e:I

    invoke-static {p0, v1, v0}, Lp3p;->k(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
