.class public final Ldoe;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lcoe;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final f:[Ll4c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lcpe;

.field public final e:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcoe;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ldoe;->Companion:Lcoe;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvme;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x5

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

    aput-object v0, v1, v2

    sput-object v1, Ldoe;->f:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcpe;Ljava/util/List;)V
    .registers 10

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_1c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldoe;->a:Ljava/lang/String;

    iput-object p3, p0, Ldoe;->b:Ljava/lang/String;

    iput-object p4, p0, Ldoe;->c:Ljava/lang/String;

    iput-object p5, p0, Ldoe;->d:Lcpe;

    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_19

    iput-object v1, p0, Ldoe;->e:Ljava/util/List;

    return-void

    :cond_19
    iput-object p6, p0, Ldoe;->e:Ljava/util/List;

    return-void

    :cond_1c
    sget-object p0, Lboe;->a:Lboe;

    invoke-virtual {p0}, Lboe;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

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
    instance-of v1, p1, Ldoe;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ldoe;

    iget-object v1, p0, Ldoe;->a:Ljava/lang/String;

    iget-object v3, p1, Ldoe;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ldoe;->b:Ljava/lang/String;

    iget-object v3, p1, Ldoe;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Ldoe;->c:Ljava/lang/String;

    iget-object v3, p1, Ldoe;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Ldoe;->d:Lcpe;

    iget-object v3, p1, Ldoe;->d:Lcpe;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object p0, p0, Ldoe;->e:Ljava/util/List;

    iget-object p1, p1, Ldoe;->e:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    return v2

    :cond_43
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ldoe;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ldoe;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ldoe;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ldoe;->d:Lcpe;

    invoke-virtual {v2}, Lcpe;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Ldoe;->e:Ljava/util/List;

    if-nez p0, :cond_23

    const/4 p0, 0x0

    goto :goto_27

    :cond_23
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_27
    add-int/2addr v2, p0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
