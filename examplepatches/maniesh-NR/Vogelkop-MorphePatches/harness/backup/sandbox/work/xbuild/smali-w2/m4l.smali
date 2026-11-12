.class public final Lm4l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ll4l;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Ljava/util/List;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Ll4l;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lm4l;->Companion:Ll4l;

    new-instance v1, Lk4l;

    new-instance v0, Ldxh;

    const v2, 0x7f040225

    invoke-direct {v0, v2}, Ldxh;-><init>(I)V

    new-instance v2, Ldxh;

    const v3, 0x7f040239

    invoke-direct {v2, v3}, Ldxh;-><init>(I)V

    invoke-direct {v1, v0, v2}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v2, Lk4l;

    new-instance v0, Ldxh;

    const v3, 0x7f040260

    invoke-direct {v0, v3}, Ldxh;-><init>(I)V

    new-instance v3, Ldxh;

    const v4, 0x7f04024a

    invoke-direct {v3, v4}, Ldxh;-><init>(I)V

    invoke-direct {v2, v0, v3}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v3, Lk4l;

    new-instance v0, Ldxh;

    const v4, 0x7f04026a

    invoke-direct {v0, v4}, Ldxh;-><init>(I)V

    new-instance v4, Ldxh;

    const v5, 0x7f040254

    invoke-direct {v4, v5}, Ldxh;-><init>(I)V

    invoke-direct {v3, v0, v4}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v4, Lk4l;

    new-instance v0, Ldxh;

    const v5, 0x7f040272

    invoke-direct {v0, v5}, Ldxh;-><init>(I)V

    new-instance v5, Ldxh;

    const v6, 0x7f04025c

    invoke-direct {v5, v6}, Ldxh;-><init>(I)V

    invoke-direct {v4, v0, v5}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v5, Lk4l;

    new-instance v0, Ldxh;

    const v6, 0x7f040268

    invoke-direct {v0, v6}, Ldxh;-><init>(I)V

    new-instance v6, Ldxh;

    const v7, 0x7f040252

    invoke-direct {v6, v7}, Ldxh;-><init>(I)V

    invoke-direct {v5, v0, v6}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v6, Lk4l;

    new-instance v0, Ldxh;

    const v7, 0x7f040227

    invoke-direct {v0, v7}, Ldxh;-><init>(I)V

    new-instance v7, Ldxh;

    const v8, 0x7f04023b

    invoke-direct {v7, v8}, Ldxh;-><init>(I)V

    invoke-direct {v6, v0, v7}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v7, Lk4l;

    new-instance v0, Ldxh;

    const v8, 0x7f04022b

    invoke-direct {v0, v8}, Ldxh;-><init>(I)V

    new-instance v8, Ldxh;

    const v9, 0x7f04023f

    invoke-direct {v8, v9}, Ldxh;-><init>(I)V

    invoke-direct {v7, v0, v8}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v8, Lk4l;

    new-instance v0, Ldxh;

    const v9, 0x7f040264

    invoke-direct {v0, v9}, Ldxh;-><init>(I)V

    new-instance v9, Ldxh;

    const v10, 0x7f04024e

    invoke-direct {v9, v10}, Ldxh;-><init>(I)V

    invoke-direct {v8, v0, v9}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v9, Lk4l;

    new-instance v0, Ldxh;

    const v10, 0x7f04025e

    invoke-direct {v0, v10}, Ldxh;-><init>(I)V

    new-instance v10, Ldxh;

    const v11, 0x7f040248

    invoke-direct {v10, v11}, Ldxh;-><init>(I)V

    invoke-direct {v9, v0, v10}, Lk4l;-><init>(Ldxh;Ldxh;)V

    new-instance v10, Lk4l;

    new-instance v0, Ldxh;

    const v11, 0x7f04022f

    invoke-direct {v0, v11}, Ldxh;-><init>(I)V

    new-instance v11, Ldxh;

    const v12, 0x7f040243

    invoke-direct {v11, v12}, Ldxh;-><init>(I)V

    invoke-direct {v10, v0, v11}, Lk4l;-><init>(Ldxh;Ldxh;)V

    filled-new-array/range {v1 .. v10}, [Lk4l;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lm4l;->d:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(IIILjava/lang/String;)V
    .registers 8

    and-int/lit8 v0, p1, 0x5

    const/4 v1, 0x0

    const/4 v2, 0x5

    if-ne v2, v0, :cond_17

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lm4l;->a:I

    and-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_12

    iput-object v1, p0, Lm4l;->b:Ljava/lang/String;

    goto :goto_14

    :cond_12
    iput-object p4, p0, Lm4l;->b:Ljava/lang/String;

    :goto_14
    iput p3, p0, Lm4l;->c:I

    return-void

    :cond_17
    sget-object p0, Lj4l;->a:Lj4l;

    invoke-virtual {p0}, Lj4l;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .registers 4

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput p1, p0, Lm4l;->a:I

    .line 35
    iput-object p2, p0, Lm4l;->b:Ljava/lang/String;

    .line 36
    iput p3, p0, Lm4l;->c:I

    return-void
.end method

.method public static a(Lm4l;Ljava/lang/String;II)Lm4l;
    .registers 5

    iget v0, p0, Lm4l;->a:I

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_8

    iget p2, p0, Lm4l;->c:I

    :cond_8
    new-instance p0, Lm4l;

    invoke-direct {p0, v0, p1, p2}, Lm4l;-><init>(ILjava/lang/String;I)V

    return-object p0
.end method


# virtual methods
.method public final b()Lk4l;
    .registers 5

    sget-object v0, Lm4l;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    iget p0, p0, Lm4l;->c:I

    rem-int/2addr p0, v1

    xor-int v2, p0, v1

    neg-int v3, p0

    or-int/2addr v3, p0

    and-int/2addr v2, v3

    shr-int/lit8 v2, v2, 0x1f

    and-int/2addr v1, v2

    add-int/2addr p0, v1

    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk4l;

    return-object p0
.end method

.method public final c()Lpxh;
    .registers 2

    iget-object p0, p0, Lm4l;->b:Ljava/lang/String;

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Lqxh;

    invoke-direct {v0, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    return-object v0

    :cond_10
    sget-object p0, Lu4l;->f:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lm4l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lm4l;

    iget v1, p0, Lm4l;->a:I

    iget v3, p1, Lm4l;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lm4l;->b:Ljava/lang/String;

    iget-object v3, p1, Lm4l;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget p0, p0, Lm4l;->c:I

    iget p1, p1, Lm4l;->c:I

    if-eq p0, p1, :cond_25

    return v2

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lm4l;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lm4l;->b:Ljava/lang/String;

    if-nez v1, :cond_e

    const/4 v1, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lm4l;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
