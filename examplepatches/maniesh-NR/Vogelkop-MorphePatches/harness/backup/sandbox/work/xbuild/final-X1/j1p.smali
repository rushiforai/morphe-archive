.class public final Lj1p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lp0p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lk0p;

.field public final c:Ly0p;

.field public final d:Lv0p;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:I

.field public final h:Ljava/lang/String;

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:Ls0p;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lp0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lj1p;->Companion:Lp0p;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lk0p;Ly0p;Lv0p;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IIIILs0p;)V
    .registers 18

    and-int/lit16 v0, p1, 0x14c1

    const/4 v1, 0x0

    const/16 v2, 0x14c1

    if-ne v2, v0, :cond_77

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lj1p;->a:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_14

    iput-object v1, p0, Lj1p;->b:Lk0p;

    move-object p3, v1

    goto :goto_16

    :cond_14
    iput-object p3, p0, Lj1p;->b:Lk0p;

    :goto_16
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_1e

    iput-object v1, p0, Lj1p;->c:Ly0p;

    move-object p4, v1

    goto :goto_20

    :cond_1e
    iput-object p4, p0, Lj1p;->c:Ly0p;

    :goto_20
    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_28

    iput-object v1, p0, Lj1p;->d:Lv0p;

    move-object p5, v1

    goto :goto_2a

    :cond_28
    iput-object p5, p0, Lj1p;->d:Lv0p;

    :goto_2a
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_33

    const-string p2, "Opera"

    iput-object p2, p0, Lj1p;->e:Ljava/lang/String;

    goto :goto_35

    :cond_33
    iput-object p6, p0, Lj1p;->e:Ljava/lang/String;

    :goto_35
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_3e

    const-string p2, "2.14.0"

    iput-object p2, p0, Lj1p;->f:Ljava/lang/String;

    goto :goto_40

    :cond_3e
    iput-object p7, p0, Lj1p;->f:Ljava/lang/String;

    :goto_40
    iput p8, p0, Lj1p;->g:I

    iput-object p9, p0, Lj1p;->h:Ljava/lang/String;

    and-int/lit16 p2, p1, 0x100

    const/4 p6, 0x1

    if-nez p2, :cond_4c

    iput p6, p0, Lj1p;->i:I

    goto :goto_4e

    :cond_4c
    iput p10, p0, Lj1p;->i:I

    :goto_4e
    and-int/lit16 p2, p1, 0x200

    if-nez p2, :cond_55

    iput p6, p0, Lj1p;->j:I

    goto :goto_57

    :cond_55
    iput p11, p0, Lj1p;->j:I

    :goto_57
    iput p12, p0, Lj1p;->k:I

    and-int/lit16 p1, p1, 0x800

    if-nez p1, :cond_64

    const/16 p1, 0xe10

    :goto_5f
    iput p1, p0, Lj1p;->l:I

    move-object/from16 p1, p14

    goto :goto_67

    :cond_64
    move/from16 p1, p13

    goto :goto_5f

    :goto_67
    iput-object p1, p0, Lj1p;->m:Ls0p;

    if-nez p3, :cond_76

    if-nez p4, :cond_76

    if-nez p5, :cond_76

    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_76
    return-void

    :cond_77
    sget-object p0, Le0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Lk0p;Ly0p;Lv0p;ILjava/lang/String;ILs0p;)V
    .registers 9

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj1p;->a:Ljava/lang/String;

    iput-object p2, p0, Lj1p;->b:Lk0p;

    iput-object p3, p0, Lj1p;->c:Ly0p;

    iput-object p4, p0, Lj1p;->d:Lv0p;

    const-string p1, "Opera"

    iput-object p1, p0, Lj1p;->e:Ljava/lang/String;

    const-string p1, "2.14.0"

    iput-object p1, p0, Lj1p;->f:Ljava/lang/String;

    iput p5, p0, Lj1p;->g:I

    iput-object p6, p0, Lj1p;->h:Ljava/lang/String;

    const/4 p1, 0x1

    iput p1, p0, Lj1p;->i:I

    iput p1, p0, Lj1p;->j:I

    iput p7, p0, Lj1p;->k:I

    const/16 p1, 0xe10

    iput p1, p0, Lj1p;->l:I

    iput-object p8, p0, Lj1p;->m:Ls0p;

    if-nez p2, :cond_31

    if-nez p3, :cond_31

    if-nez p4, :cond_31

    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_31
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lj1p;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lj1p;

    iget-object v1, p0, Lj1p;->a:Ljava/lang/String;

    iget-object v3, p1, Lj1p;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lj1p;->b:Lk0p;

    iget-object v3, p1, Lj1p;->b:Lk0p;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lj1p;->c:Ly0p;

    iget-object v3, p1, Lj1p;->c:Ly0p;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lj1p;->d:Lv0p;

    iget-object v3, p1, Lj1p;->d:Lv0p;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Lj1p;->e:Ljava/lang/String;

    iget-object v3, p1, Lj1p;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-object v1, p0, Lj1p;->f:Ljava/lang/String;

    iget-object v3, p1, Lj1p;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4e

    return v2

    :cond_4e
    iget v1, p0, Lj1p;->g:I

    iget v3, p1, Lj1p;->g:I

    if-eq v1, v3, :cond_55

    return v2

    :cond_55
    iget-object v1, p0, Lj1p;->h:Ljava/lang/String;

    iget-object v3, p1, Lj1p;->h:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    return v2

    :cond_60
    iget v1, p0, Lj1p;->i:I

    iget v3, p1, Lj1p;->i:I

    if-eq v1, v3, :cond_67

    return v2

    :cond_67
    iget v1, p0, Lj1p;->j:I

    iget v3, p1, Lj1p;->j:I

    if-eq v1, v3, :cond_6e

    return v2

    :cond_6e
    iget v1, p0, Lj1p;->k:I

    iget v3, p1, Lj1p;->k:I

    if-eq v1, v3, :cond_75

    return v2

    :cond_75
    iget v1, p0, Lj1p;->l:I

    iget v3, p1, Lj1p;->l:I

    if-eq v1, v3, :cond_7c

    return v2

    :cond_7c
    iget-object p0, p0, Lj1p;->m:Ls0p;

    iget-object p1, p1, Lj1p;->m:Ls0p;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_87

    return v2

    :cond_87
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lj1p;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lj1p;->b:Lk0p;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Lk0p;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lj1p;->c:Ly0p;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ly0p;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lj1p;->d:Lv0p;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Lv0p;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lj1p;->e:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v3, p0, Lj1p;->f:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v3, p0, Lj1p;->g:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v3, p0, Lj1p;->h:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v3, p0, Lj1p;->i:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v3, p0, Lj1p;->j:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v3, p0, Lj1p;->k:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v3, p0, Lj1p;->l:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lj1p;->m:Ls0p;

    if-eqz p0, :cond_68

    iget p0, p0, Ls0p;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    :cond_68
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ImpObject(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lj1p;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", banner="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lj1p;->b:Lk0p;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", video="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lj1p;->c:Ly0p;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", native="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lj1p;->d:Lv0p;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", displaymanager="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lj1p;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", displaymanagerver="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lj1p;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", instl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lj1p;->g:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", placementId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lj1p;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", clickbrowser="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lj1p;->i:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", secure="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lj1p;->j:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", rwdd="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lj1p;->k:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", exp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lj1p;->l:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", ext="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lj1p;->m:Ls0p;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
