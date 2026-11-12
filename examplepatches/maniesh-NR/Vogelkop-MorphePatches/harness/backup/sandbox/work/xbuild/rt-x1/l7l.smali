.class public final Ll7l;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lk7l;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:I

.field public final d:Z

.field public final e:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lk7l;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ll7l;->Companion:Lk7l;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;IIZF)V
    .registers 9

    and-int/lit8 v0, p1, 0x1f

    const/16 v1, 0x1f

    if-ne v1, v0, :cond_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ll7l;->a:Ljava/lang/String;

    iput p3, p0, Ll7l;->b:I

    iput p4, p0, Ll7l;->c:I

    iput-boolean p5, p0, Ll7l;->d:Z

    iput p6, p0, Ll7l;->e:F

    return-void

    :cond_14
    sget-object p0, Lj7l;->a:Lj7l;

    invoke-virtual {p0}, Lj7l;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;IIZF)V
    .registers 6

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Ll7l;->a:Ljava/lang/String;

    .line 33
    iput p2, p0, Ll7l;->b:I

    .line 34
    iput p3, p0, Ll7l;->c:I

    .line 35
    iput-boolean p4, p0, Ll7l;->d:Z

    .line 36
    iput p5, p0, Ll7l;->e:F

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ll7l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ll7l;

    iget-object v1, p0, Ll7l;->a:Ljava/lang/String;

    iget-object v3, p1, Ll7l;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget v1, p0, Ll7l;->b:I

    iget v3, p1, Ll7l;->b:I

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget v1, p0, Ll7l;->c:I

    iget v3, p1, Ll7l;->c:I

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget-boolean v1, p0, Ll7l;->d:Z

    iget-boolean v3, p1, Ll7l;->d:Z

    if-eq v1, v3, :cond_2c

    return v2

    :cond_2c
    iget p0, p0, Ll7l;->e:F

    iget p1, p1, Ll7l;->e:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_37

    return v2

    :cond_37
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ll7l;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ll7l;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ll7l;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Ll7l;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget p0, p0, Ll7l;->e:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
