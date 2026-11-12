.class public final Lp3f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lo3f;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final g:[Ll4c;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/Integer;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lo3f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lp3f;->Companion:Lo3f;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvme;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x6

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object v0, v1, v2

    sput-object v1, Lp3f;->g:[Ll4c;

    return-void
.end method

.method public constructor <init>(IILjava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 11

    and-int/lit8 v0, p1, 0x1d

    const/4 v1, 0x0

    const/16 v2, 0x1d

    if-ne v2, v0, :cond_27

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lp3f;->a:I

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_13

    iput-object v1, p0, Lp3f;->b:Ljava/lang/Integer;

    goto :goto_15

    :cond_13
    iput-object p3, p0, Lp3f;->b:Ljava/lang/Integer;

    :goto_15
    iput-object p4, p0, Lp3f;->c:Ljava/lang/String;

    iput-object p5, p0, Lp3f;->d:Ljava/lang/String;

    iput-object p6, p0, Lp3f;->e:Ljava/lang/String;

    and-int/lit8 p1, p1, 0x20

    if-nez p1, :cond_24

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lp3f;->f:Ljava/util/List;

    return-void

    :cond_24
    iput-object p7, p0, Lp3f;->f:Ljava/util/List;

    return-void

    :cond_27
    sget-object p0, Ln3f;->a:Ln3f;

    invoke-virtual {p0}, Ln3f;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lp3f;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lp3f;

    iget v1, p0, Lp3f;->a:I

    iget v3, p1, Lp3f;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lp3f;->b:Ljava/lang/Integer;

    iget-object v3, p1, Lp3f;->b:Ljava/lang/Integer;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lp3f;->c:Ljava/lang/String;

    iget-object v3, p1, Lp3f;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lp3f;->d:Ljava/lang/String;

    iget-object v3, p1, Lp3f;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lp3f;->e:Ljava/lang/String;

    iget-object v3, p1, Lp3f;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    return v2

    :cond_3f
    iget-object p0, p0, Lp3f;->f:Ljava/util/List;

    iget-object p1, p1, Lp3f;->f:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4a

    return v2

    :cond_4a
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lp3f;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lp3f;->b:Ljava/lang/Integer;

    if-nez v2, :cond_f

    const/4 v2, 0x0

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lp3f;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lp3f;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lp3f;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lp3f;->f:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
