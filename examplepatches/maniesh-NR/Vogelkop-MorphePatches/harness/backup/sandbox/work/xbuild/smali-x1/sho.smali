.class public final Lsho;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lrho;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final n:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Laio;

.field public final e:Liio;

.field public final f:Ljava/util/List;

.field public final g:Ljava/util/List;

.field public final h:Ljava/util/List;

.field public final i:Ljava/util/List;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Leio;

.field public final m:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lrho;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lsho;->Companion:Lrho;

    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v3, Lk72;

    invoke-direct {v3, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v4, Lk72;

    invoke-direct {v4, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v5, Lk72;

    invoke-direct {v5, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v1, 0xd

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v6, 0x0

    aput-object v6, v1, v2

    const/4 v2, 0x1

    aput-object v6, v1, v2

    const/4 v2, 0x2

    aput-object v6, v1, v2

    const/4 v2, 0x3

    aput-object v6, v1, v2

    const/4 v2, 0x4

    aput-object v6, v1, v2

    const/4 v2, 0x5

    aput-object v0, v1, v2

    const/4 v0, 0x6

    aput-object v3, v1, v0

    const/4 v0, 0x7

    aput-object v4, v1, v0

    const/16 v0, 0x8

    aput-object v5, v1, v0

    const/16 v0, 0x9

    aput-object v6, v1, v0

    const/16 v0, 0xa

    aput-object v6, v1, v0

    const/16 v0, 0xb

    aput-object v6, v1, v0

    const/16 v0, 0xc

    aput-object v6, v1, v0

    sput-object v1, Lsho;->n:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;Laio;Liio;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Leio;Ljava/lang/Integer;)V
    .registers 18

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_7e

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lsho;->a:I

    and-int/lit8 p2, p1, 0x2

    const-string v0, ""

    if-nez p2, :cond_14

    iput-object v0, p0, Lsho;->b:Ljava/lang/String;

    goto :goto_16

    :cond_14
    iput-object p3, p0, Lsho;->b:Ljava/lang/String;

    :goto_16
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_1d

    iput-object v0, p0, Lsho;->c:Ljava/lang/String;

    goto :goto_1f

    :cond_1d
    iput-object p4, p0, Lsho;->c:Ljava/lang/String;

    :goto_1f
    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_26

    iput-object v1, p0, Lsho;->d:Laio;

    goto :goto_28

    :cond_26
    iput-object p5, p0, Lsho;->d:Laio;

    :goto_28
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_2f

    iput-object v1, p0, Lsho;->e:Liio;

    goto :goto_31

    :cond_2f
    iput-object p6, p0, Lsho;->e:Liio;

    :goto_31
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_38

    iput-object v1, p0, Lsho;->f:Ljava/util/List;

    goto :goto_3a

    :cond_38
    iput-object p7, p0, Lsho;->f:Ljava/util/List;

    :goto_3a
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_41

    iput-object v1, p0, Lsho;->g:Ljava/util/List;

    goto :goto_43

    :cond_41
    iput-object p8, p0, Lsho;->g:Ljava/util/List;

    :goto_43
    and-int/lit16 p2, p1, 0x80

    if-nez p2, :cond_4a

    iput-object v1, p0, Lsho;->h:Ljava/util/List;

    goto :goto_4c

    :cond_4a
    iput-object p9, p0, Lsho;->h:Ljava/util/List;

    :goto_4c
    and-int/lit16 p2, p1, 0x100

    if-nez p2, :cond_53

    iput-object v1, p0, Lsho;->i:Ljava/util/List;

    goto :goto_55

    :cond_53
    iput-object p10, p0, Lsho;->i:Ljava/util/List;

    :goto_55
    and-int/lit16 p2, p1, 0x200

    if-nez p2, :cond_5c

    iput-object v1, p0, Lsho;->j:Ljava/lang/String;

    goto :goto_5e

    :cond_5c
    iput-object p11, p0, Lsho;->j:Ljava/lang/String;

    :goto_5e
    and-int/lit16 p2, p1, 0x400

    if-nez p2, :cond_65

    iput-object v1, p0, Lsho;->k:Ljava/lang/String;

    goto :goto_67

    :cond_65
    iput-object p12, p0, Lsho;->k:Ljava/lang/String;

    :goto_67
    and-int/lit16 p2, p1, 0x800

    if-nez p2, :cond_6e

    iput-object v1, p0, Lsho;->l:Leio;

    goto :goto_72

    :cond_6e
    move-object/from16 p2, p13

    iput-object p2, p0, Lsho;->l:Leio;

    :goto_72
    and-int/lit16 p1, p1, 0x1000

    if-nez p1, :cond_79

    iput-object v1, p0, Lsho;->m:Ljava/lang/Integer;

    return-void

    :cond_79
    move-object/from16 p1, p14

    iput-object p1, p0, Lsho;->m:Ljava/lang/Integer;

    return-void

    :cond_7e
    sget-object p0, Lqho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

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
    instance-of v1, p1, Lsho;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lsho;

    iget v1, p0, Lsho;->a:I

    iget v3, p1, Lsho;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lsho;->b:Ljava/lang/String;

    iget-object v3, p1, Lsho;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lsho;->c:Ljava/lang/String;

    iget-object v3, p1, Lsho;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lsho;->d:Laio;

    iget-object v3, p1, Lsho;->d:Laio;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lsho;->e:Liio;

    iget-object v3, p1, Lsho;->e:Liio;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    return v2

    :cond_3f
    iget-object v1, p0, Lsho;->f:Ljava/util/List;

    iget-object v3, p1, Lsho;->f:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    return v2

    :cond_4a
    iget-object v1, p0, Lsho;->g:Ljava/util/List;

    iget-object v3, p1, Lsho;->g:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    return v2

    :cond_55
    iget-object v1, p0, Lsho;->h:Ljava/util/List;

    iget-object v3, p1, Lsho;->h:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    return v2

    :cond_60
    iget-object v1, p0, Lsho;->i:Ljava/util/List;

    iget-object v3, p1, Lsho;->i:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6b

    return v2

    :cond_6b
    iget-object v1, p0, Lsho;->j:Ljava/lang/String;

    iget-object v3, p1, Lsho;->j:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_76

    return v2

    :cond_76
    iget-object v1, p0, Lsho;->k:Ljava/lang/String;

    iget-object v3, p1, Lsho;->k:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_81

    return v2

    :cond_81
    iget-object v1, p0, Lsho;->l:Leio;

    iget-object v3, p1, Lsho;->l:Leio;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8c

    return v2

    :cond_8c
    iget-object p0, p0, Lsho;->m:Ljava/lang/Integer;

    iget-object p1, p1, Lsho;->m:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_97

    return v2

    :cond_97
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget v0, p0, Lsho;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lsho;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lsho;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lsho;->d:Laio;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Laio;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->e:Liio;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Liio;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->f:Ljava/util/List;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->g:Ljava/util/List;

    if-nez v3, :cond_40

    move v3, v2

    goto :goto_44

    :cond_40
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_44
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->h:Ljava/util/List;

    if-nez v3, :cond_4c

    move v3, v2

    goto :goto_50

    :cond_4c
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_50
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->i:Ljava/util/List;

    if-nez v3, :cond_58

    move v3, v2

    goto :goto_5c

    :cond_58
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_5c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->j:Ljava/lang/String;

    if-nez v3, :cond_64

    move v3, v2

    goto :goto_68

    :cond_64
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_68
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->k:Ljava/lang/String;

    if-nez v3, :cond_70

    move v3, v2

    goto :goto_74

    :cond_70
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_74
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsho;->l:Leio;

    if-nez v3, :cond_7c

    move v3, v2

    goto :goto_80

    :cond_7c
    invoke-virtual {v3}, Leio;->hashCode()I

    move-result v3

    :goto_80
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Lsho;->m:Ljava/lang/Integer;

    if-eqz p0, :cond_8a

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_8a
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BidExt(adType="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lsho;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", deepLink="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", fallbackUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", omParams="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->d:Laio;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", templateConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->e:Liio;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", adLoadTrackers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->f:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", adVisibleTrackers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->g:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", adViewableTrackers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->h:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", clickTrackers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->i:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", privacyUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->j:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", adChoiceUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", rewarded="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsho;->l:Leio;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", refreshInterval="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lsho;->m:Ljava/lang/Integer;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
