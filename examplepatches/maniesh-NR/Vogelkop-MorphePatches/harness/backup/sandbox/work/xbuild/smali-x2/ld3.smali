.class public final Lld3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lkd3;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final i:[Ll4c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/util/List;

.field public final h:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkd3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lld3;->Companion:Lkd3;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvk1;

    const/16 v2, 0x1c

    invoke-direct {v1, v2}, Lvk1;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v1

    new-instance v2, Lvk1;

    const/16 v3, 0x1d

    invoke-direct {v2, v3}, Lvk1;-><init>(B)V

    invoke-static {v0, v2}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/16 v2, 0x8

    new-array v2, v2, [Ll4c;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    aput-object v4, v2, v3

    const/4 v3, 0x6

    aput-object v1, v2, v3

    const/4 v1, 0x7

    aput-object v0, v2, v1

    sput-object v2, Lld3;->i:[Ll4c;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .registers 13

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_4f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lld3;->a:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_12

    iput-object v1, p0, Lld3;->b:Ljava/lang/String;

    goto :goto_14

    :cond_12
    iput-object p3, p0, Lld3;->b:Ljava/lang/String;

    :goto_14
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_1b

    iput-object v1, p0, Lld3;->c:Ljava/lang/String;

    goto :goto_1d

    :cond_1b
    iput-object p4, p0, Lld3;->c:Ljava/lang/String;

    :goto_1d
    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_24

    iput-object v1, p0, Lld3;->d:Ljava/lang/String;

    goto :goto_26

    :cond_24
    iput-object p5, p0, Lld3;->d:Ljava/lang/String;

    :goto_26
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_2d

    iput-object v1, p0, Lld3;->e:Ljava/lang/String;

    goto :goto_2f

    :cond_2d
    iput-object p6, p0, Lld3;->e:Ljava/lang/String;

    :goto_2f
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_36

    iput-object v1, p0, Lld3;->f:Ljava/lang/String;

    goto :goto_38

    :cond_36
    iput-object p7, p0, Lld3;->f:Ljava/lang/String;

    :goto_38
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_41

    sget-object p2, Ll08;->a:Ll08;

    iput-object p2, p0, Lld3;->g:Ljava/util/List;

    goto :goto_43

    :cond_41
    iput-object p8, p0, Lld3;->g:Ljava/util/List;

    :goto_43
    and-int/lit16 p1, p1, 0x80

    if-nez p1, :cond_4c

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lld3;->h:Ljava/util/List;

    return-void

    :cond_4c
    iput-object p9, p0, Lld3;->h:Ljava/util/List;

    return-void

    :cond_4f
    sget-object p0, Ljd3;->a:Ljd3;

    invoke-virtual {p0}, Ljd3;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

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
    instance-of v1, p1, Lld3;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lld3;

    iget-object v1, p0, Lld3;->a:Ljava/lang/String;

    iget-object v3, p1, Lld3;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lld3;->b:Ljava/lang/String;

    iget-object v3, p1, Lld3;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lld3;->c:Ljava/lang/String;

    iget-object v3, p1, Lld3;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lld3;->d:Ljava/lang/String;

    iget-object v3, p1, Lld3;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Lld3;->e:Ljava/lang/String;

    iget-object v3, p1, Lld3;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-object v1, p0, Lld3;->f:Ljava/lang/String;

    iget-object v3, p1, Lld3;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4e

    return v2

    :cond_4e
    iget-object v1, p0, Lld3;->g:Ljava/util/List;

    iget-object v3, p1, Lld3;->g:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_59

    return v2

    :cond_59
    iget-object p0, p0, Lld3;->h:Ljava/util/List;

    iget-object p1, p1, Lld3;->h:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    return v2

    :cond_64
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lld3;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lld3;->b:Ljava/lang/String;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lld3;->c:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lld3;->d:Ljava/lang/String;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lld3;->e:Ljava/lang/String;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lld3;->f:Ljava/lang/String;

    if-eqz v3, :cond_42

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_42
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lld3;->g:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Lld3;->h:Ljava/util/List;

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
