.class public final Loho;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lnho;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final q:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/Integer;

.field public final i:Ljava/lang/Integer;

.field public final j:Ljava/util/List;

.field public final k:Ljava/util/List;

.field public final l:Lsho;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/Double;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnho;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Loho;->Companion:Lnho;

    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v3, Lk72;

    invoke-direct {v3, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v1, 0x10

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v4, 0x0

    aput-object v4, v1, v2

    const/4 v2, 0x1

    aput-object v4, v1, v2

    const/4 v2, 0x2

    aput-object v4, v1, v2

    const/4 v2, 0x3

    aput-object v4, v1, v2

    const/4 v2, 0x4

    aput-object v4, v1, v2

    const/4 v2, 0x5

    aput-object v4, v1, v2

    const/4 v2, 0x6

    aput-object v4, v1, v2

    const/4 v2, 0x7

    aput-object v4, v1, v2

    const/16 v2, 0x8

    aput-object v4, v1, v2

    const/16 v2, 0x9

    aput-object v0, v1, v2

    const/16 v0, 0xa

    aput-object v3, v1, v0

    const/16 v0, 0xb

    aput-object v4, v1, v0

    const/16 v0, 0xc

    aput-object v4, v1, v0

    const/16 v0, 0xd

    aput-object v4, v1, v0

    const/16 v0, 0xe

    aput-object v4, v1, v0

    const/16 v0, 0xf

    aput-object v4, v1, v0

    sput-object v1, Loho;->q:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;Lsho;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V
    .registers 22

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    and-int/lit16 v1, p1, 0x81f

    const/4 v2, 0x0

    const/16 v3, 0x81f

    if-ne v3, v1, :cond_85

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Loho;->a:Ljava/lang/String;

    iput-object p3, p0, Loho;->b:Ljava/lang/String;

    iput-object p4, p0, Loho;->c:Ljava/lang/String;

    iput p5, p0, Loho;->d:I

    iput-object p6, p0, Loho;->e:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_20

    iput-object v2, p0, Loho;->f:Ljava/lang/String;

    goto :goto_22

    :cond_20
    iput-object p7, p0, Loho;->f:Ljava/lang/String;

    :goto_22
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_29

    iput-object v2, p0, Loho;->g:Ljava/lang/String;

    goto :goto_2b

    :cond_29
    iput-object p8, p0, Loho;->g:Ljava/lang/String;

    :goto_2b
    and-int/lit16 p2, p1, 0x80

    if-nez p2, :cond_32

    iput-object v0, p0, Loho;->h:Ljava/lang/Integer;

    goto :goto_34

    :cond_32
    iput-object p9, p0, Loho;->h:Ljava/lang/Integer;

    :goto_34
    and-int/lit16 p2, p1, 0x100

    if-nez p2, :cond_3b

    iput-object v0, p0, Loho;->i:Ljava/lang/Integer;

    goto :goto_3d

    :cond_3b
    iput-object p10, p0, Loho;->i:Ljava/lang/Integer;

    :goto_3d
    and-int/lit16 p2, p1, 0x200

    if-nez p2, :cond_44

    iput-object v2, p0, Loho;->j:Ljava/util/List;

    goto :goto_46

    :cond_44
    iput-object p11, p0, Loho;->j:Ljava/util/List;

    :goto_46
    and-int/lit16 p2, p1, 0x400

    if-nez p2, :cond_4f

    iput-object v2, p0, Loho;->k:Ljava/util/List;

    :goto_4c
    move-object/from16 p2, p13

    goto :goto_54

    :cond_4f
    move-object/from16 p2, p12

    iput-object p2, p0, Loho;->k:Ljava/util/List;

    goto :goto_4c

    :goto_54
    iput-object p2, p0, Loho;->l:Lsho;

    and-int/lit16 p2, p1, 0x1000

    if-nez p2, :cond_5d

    iput-object v2, p0, Loho;->m:Ljava/lang/String;

    goto :goto_61

    :cond_5d
    move-object/from16 p2, p14

    iput-object p2, p0, Loho;->m:Ljava/lang/String;

    :goto_61
    and-int/lit16 p2, p1, 0x2000

    if-nez p2, :cond_68

    iput-object v2, p0, Loho;->n:Ljava/lang/String;

    goto :goto_6c

    :cond_68
    move-object/from16 p2, p15

    iput-object p2, p0, Loho;->n:Ljava/lang/String;

    :goto_6c
    and-int/lit16 p2, p1, 0x4000

    if-nez p2, :cond_73

    iput-object v2, p0, Loho;->o:Ljava/lang/String;

    goto :goto_77

    :cond_73
    move-object/from16 p2, p16

    iput-object p2, p0, Loho;->o:Ljava/lang/String;

    :goto_77
    const p2, 0x8000

    and-int/2addr p1, p2

    if-nez p1, :cond_80

    iput-object v2, p0, Loho;->p:Ljava/lang/Double;

    return-void

    :cond_80
    move-object/from16 p1, p17

    iput-object p1, p0, Loho;->p:Ljava/lang/Double;

    return-void

    :cond_85
    sget-object p0, Lmho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v3, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v2
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Loho;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Loho;

    iget-object v1, p0, Loho;->a:Ljava/lang/String;

    iget-object v3, p1, Loho;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Loho;->b:Ljava/lang/String;

    iget-object v3, p1, Loho;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Loho;->c:Ljava/lang/String;

    iget-object v3, p1, Loho;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget v1, p0, Loho;->d:I

    iget v3, p1, Loho;->d:I

    if-eq v1, v3, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Loho;->e:Ljava/lang/String;

    iget-object v3, p1, Loho;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    return v2

    :cond_3f
    iget-object v1, p0, Loho;->f:Ljava/lang/String;

    iget-object v3, p1, Loho;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    return v2

    :cond_4a
    iget-object v1, p0, Loho;->g:Ljava/lang/String;

    iget-object v3, p1, Loho;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    return v2

    :cond_55
    iget-object v1, p0, Loho;->h:Ljava/lang/Integer;

    iget-object v3, p1, Loho;->h:Ljava/lang/Integer;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    return v2

    :cond_60
    iget-object v1, p0, Loho;->i:Ljava/lang/Integer;

    iget-object v3, p1, Loho;->i:Ljava/lang/Integer;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6b

    return v2

    :cond_6b
    iget-object v1, p0, Loho;->j:Ljava/util/List;

    iget-object v3, p1, Loho;->j:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_76

    return v2

    :cond_76
    iget-object v1, p0, Loho;->k:Ljava/util/List;

    iget-object v3, p1, Loho;->k:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_81

    return v2

    :cond_81
    iget-object v1, p0, Loho;->l:Lsho;

    iget-object v3, p1, Loho;->l:Lsho;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8c

    return v2

    :cond_8c
    iget-object v1, p0, Loho;->m:Ljava/lang/String;

    iget-object v3, p1, Loho;->m:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_97

    return v2

    :cond_97
    iget-object v1, p0, Loho;->n:Ljava/lang/String;

    iget-object v3, p1, Loho;->n:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a2

    return v2

    :cond_a2
    iget-object v1, p0, Loho;->o:Ljava/lang/String;

    iget-object v3, p1, Loho;->o:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_ad

    return v2

    :cond_ad
    iget-object p0, p0, Loho;->p:Ljava/lang/Double;

    iget-object p1, p1, Loho;->p:Ljava/lang/Double;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b8

    return v2

    :cond_b8
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Loho;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Loho;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Loho;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Loho;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Loho;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Loho;->f:Ljava/lang/String;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Loho;->g:Ljava/lang/String;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Loho;->h:Ljava/lang/Integer;

    if-nez v3, :cond_40

    move v3, v2

    goto :goto_44

    :cond_40
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_44
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Loho;->i:Ljava/lang/Integer;

    if-nez v3, :cond_4c

    move v3, v2

    goto :goto_50

    :cond_4c
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_50
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Loho;->j:Ljava/util/List;

    if-nez v3, :cond_58

    move v3, v2

    goto :goto_5c

    :cond_58
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_5c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Loho;->k:Ljava/util/List;

    if-nez v3, :cond_64

    move v3, v2

    goto :goto_68

    :cond_64
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_68
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Loho;->l:Lsho;

    invoke-virtual {v3}, Lsho;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Loho;->m:Ljava/lang/String;

    if-nez v0, :cond_78

    move v0, v2

    goto :goto_7c

    :cond_78
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_7c
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Loho;->n:Ljava/lang/String;

    if-nez v0, :cond_84

    move v0, v2

    goto :goto_88

    :cond_84
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_88
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Loho;->o:Ljava/lang/String;

    if-nez v0, :cond_90

    move v0, v2

    goto :goto_94

    :cond_90
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_94
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object p0, p0, Loho;->p:Ljava/lang/Double;

    if-eqz p0, :cond_9e

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_9e
    add-int/2addr v3, v2

    return v3
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BidData(bidderId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Loho;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", impId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", adMarkup="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", expiration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Loho;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", campaignId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", adId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", creativeId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->h:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->i:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", adDomain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->j:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", categories="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->k:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", bidExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->l:Lsho;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", winUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", lossUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->n:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", bundle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Loho;->o:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", price="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Loho;->p:Ljava/lang/Double;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
