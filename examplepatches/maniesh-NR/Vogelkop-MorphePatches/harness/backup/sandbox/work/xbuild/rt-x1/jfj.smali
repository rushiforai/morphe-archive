.class public final Ljfj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lifj;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final k:[Ll4c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/List;

.field public final g:Ljava/lang/String;

.field public final h:Ltfj;

.field public final i:Ljava/lang/String;

.field public final j:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lifj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljfj;->Companion:Lifj;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lgzh;

    const/16 v2, 0x19

    invoke-direct {v1, v2}, Lgzh;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/16 v1, 0xa

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

    const/4 v0, 0x6

    aput-object v3, v1, v0

    const/4 v0, 0x7

    aput-object v3, v1, v0

    const/16 v0, 0x8

    aput-object v3, v1, v0

    const/16 v0, 0x9

    aput-object v3, v1, v0

    sput-object v1, Ljfj;->k:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ltfj;Ljava/lang/String;Z)V
    .registers 15

    and-int/lit8 v0, p1, 0x9

    const/4 v1, 0x0

    const/16 v2, 0x9

    if-ne v2, v0, :cond_58

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljfj;->a:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_13

    iput-object v1, p0, Ljfj;->b:Ljava/lang/String;

    goto :goto_15

    :cond_13
    iput-object p3, p0, Ljfj;->b:Ljava/lang/String;

    :goto_15
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_1c

    iput-object v1, p0, Ljfj;->c:Ljava/lang/String;

    goto :goto_1e

    :cond_1c
    iput-object p4, p0, Ljfj;->c:Ljava/lang/String;

    :goto_1e
    iput-object p5, p0, Ljfj;->d:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_27

    iput-object v1, p0, Ljfj;->e:Ljava/lang/String;

    goto :goto_29

    :cond_27
    iput-object p6, p0, Ljfj;->e:Ljava/lang/String;

    :goto_29
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_30

    iput-object v1, p0, Ljfj;->f:Ljava/util/List;

    goto :goto_32

    :cond_30
    iput-object p7, p0, Ljfj;->f:Ljava/util/List;

    :goto_32
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_39

    iput-object v1, p0, Ljfj;->g:Ljava/lang/String;

    goto :goto_3b

    :cond_39
    iput-object p8, p0, Ljfj;->g:Ljava/lang/String;

    :goto_3b
    and-int/lit16 p2, p1, 0x80

    if-nez p2, :cond_42

    iput-object v1, p0, Ljfj;->h:Ltfj;

    goto :goto_44

    :cond_42
    iput-object p9, p0, Ljfj;->h:Ltfj;

    :goto_44
    and-int/lit16 p2, p1, 0x100

    if-nez p2, :cond_4b

    iput-object v1, p0, Ljfj;->i:Ljava/lang/String;

    goto :goto_4d

    :cond_4b
    iput-object p10, p0, Ljfj;->i:Ljava/lang/String;

    :goto_4d
    and-int/lit16 p1, p1, 0x200

    if-nez p1, :cond_55

    const/4 p1, 0x0

    iput-boolean p1, p0, Ljfj;->j:Z

    return-void

    :cond_55
    iput-boolean p11, p0, Ljfj;->j:Z

    return-void

    :cond_58
    sget-object p0, Lhfj;->a:Lhfj;

    invoke-virtual {p0}, Lhfj;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

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
    instance-of v1, p1, Ljfj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ljfj;

    iget-object v1, p0, Ljfj;->a:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ljfj;->b:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Ljfj;->c:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Ljfj;->d:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Ljfj;->e:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-object v1, p0, Ljfj;->f:Ljava/util/List;

    iget-object v3, p1, Ljfj;->f:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4e

    return v2

    :cond_4e
    iget-object v1, p0, Ljfj;->g:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_59

    return v2

    :cond_59
    iget-object v1, p0, Ljfj;->h:Ltfj;

    iget-object v3, p1, Ljfj;->h:Ltfj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_64

    return v2

    :cond_64
    iget-object v1, p0, Ljfj;->i:Ljava/lang/String;

    iget-object v3, p1, Ljfj;->i:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6f

    return v2

    :cond_6f
    iget-boolean p0, p0, Ljfj;->j:Z

    iget-boolean p1, p1, Ljfj;->j:Z

    if-eq p0, p1, :cond_76

    return v2

    :cond_76
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ljfj;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Ljfj;->b:Ljava/lang/String;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljfj;->c:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljfj;->d:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v3, p0, Ljfj;->e:Ljava/lang/String;

    if-nez v3, :cond_2e

    move v3, v2

    goto :goto_32

    :cond_2e
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_32
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljfj;->f:Ljava/util/List;

    if-nez v3, :cond_3a

    move v3, v2

    goto :goto_3e

    :cond_3a
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_3e
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljfj;->g:Ljava/lang/String;

    if-nez v3, :cond_46

    move v3, v2

    goto :goto_4a

    :cond_46
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_4a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljfj;->h:Ltfj;

    if-nez v3, :cond_52

    move v3, v2

    goto :goto_56

    :cond_52
    invoke-virtual {v3}, Ltfj;->hashCode()I

    move-result v3

    :goto_56
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljfj;->i:Ljava/lang/String;

    if-eqz v3, :cond_60

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_60
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean p0, p0, Ljfj;->j:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
