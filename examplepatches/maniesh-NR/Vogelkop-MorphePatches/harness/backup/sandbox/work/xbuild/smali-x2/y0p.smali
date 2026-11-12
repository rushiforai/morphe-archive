.class public final Ly0p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lx0p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final n:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:Ljava/util/List;

.field public final i:I

.field public final j:Ljava/util/List;

.field public final k:Ljava/lang/Integer;

.field public final l:Ljava/util/List;

.field public final m:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lx0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly0p;->Companion:Lx0p;

    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v1, Lk72;

    sget-object v3, Lecb;->a:Lecb;

    invoke-direct {v1, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v4, Lk72;

    invoke-direct {v4, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v5, Lk72;

    invoke-direct {v5, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v6, Lk72;

    invoke-direct {v6, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v7, Lk72;

    invoke-direct {v7, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v3, 0xd

    new-array v3, v3, [Lkotlinx/serialization/KSerializer;

    aput-object v0, v3, v2

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    const/4 v1, 0x0

    aput-object v1, v3, v0

    const/4 v0, 0x3

    aput-object v1, v3, v0

    const/4 v0, 0x4

    aput-object v1, v3, v0

    const/4 v0, 0x5

    aput-object v1, v3, v0

    const/4 v0, 0x6

    aput-object v1, v3, v0

    const/4 v0, 0x7

    aput-object v4, v3, v0

    const/16 v0, 0x8

    aput-object v1, v3, v0

    const/16 v0, 0x9

    aput-object v5, v3, v0

    const/16 v0, 0xa

    aput-object v1, v3, v0

    const/16 v0, 0xb

    aput-object v6, v3, v0

    const/16 v0, 0xc

    aput-object v7, v3, v0

    sput-object v3, Ly0p;->n:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/util/List;Ljava/util/List;IIIIILjava/util/List;ILjava/util/List;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;)V
    .registers 17

    and-int/lit16 v0, p1, 0x1cdf

    const/16 v1, 0x1cdf

    if-ne v1, v0, :cond_45

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ly0p;->a:Ljava/util/List;

    iput-object p3, p0, Ly0p;->b:Ljava/util/List;

    iput p4, p0, Ly0p;->c:I

    iput p5, p0, Ly0p;->d:I

    iput p6, p0, Ly0p;->e:I

    and-int/lit8 p2, p1, 0x20

    const/4 p3, 0x1

    if-nez p2, :cond_1b

    iput p3, p0, Ly0p;->f:I

    goto :goto_1d

    :cond_1b
    iput p7, p0, Ly0p;->f:I

    :goto_1d
    iput p8, p0, Ly0p;->g:I

    iput-object p9, p0, Ly0p;->h:Ljava/util/List;

    and-int/lit16 p2, p1, 0x100

    if-nez p2, :cond_28

    iput p3, p0, Ly0p;->i:I

    goto :goto_2a

    :cond_28
    iput p10, p0, Ly0p;->i:I

    :goto_2a
    and-int/lit16 p1, p1, 0x200

    if-nez p1, :cond_3a

    const/4 p1, 0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Ly0p;->j:Ljava/util/List;

    goto :goto_3c

    :cond_3a
    iput-object p11, p0, Ly0p;->j:Ljava/util/List;

    :goto_3c
    iput-object p12, p0, Ly0p;->k:Ljava/lang/Integer;

    iput-object p13, p0, Ly0p;->l:Ljava/util/List;

    move-object/from16 p1, p14

    iput-object p1, p0, Ly0p;->m:Ljava/util/List;

    return-void

    :cond_45
    sget-object p0, Lw0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;IIIILjava/util/List;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;)V
    .registers 12

    const/4 v0, 0x2

    .line 76
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 77
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly0p;->a:Ljava/util/List;

    iput-object p2, p0, Ly0p;->b:Ljava/util/List;

    iput p3, p0, Ly0p;->c:I

    iput p4, p0, Ly0p;->d:I

    iput p5, p0, Ly0p;->e:I

    const/4 p1, 0x1

    iput p1, p0, Ly0p;->f:I

    iput p6, p0, Ly0p;->g:I

    iput-object p7, p0, Ly0p;->h:Ljava/util/List;

    iput p1, p0, Ly0p;->i:I

    iput-object v0, p0, Ly0p;->j:Ljava/util/List;

    iput-object p8, p0, Ly0p;->k:Ljava/lang/Integer;

    iput-object p9, p0, Ly0p;->l:Ljava/util/List;

    iput-object p10, p0, Ly0p;->m:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ly0p;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ly0p;

    iget-object v1, p0, Ly0p;->a:Ljava/util/List;

    iget-object v3, p1, Ly0p;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ly0p;->b:Ljava/util/List;

    iget-object v3, p1, Ly0p;->b:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget v1, p0, Ly0p;->c:I

    iget v3, p1, Ly0p;->c:I

    if-eq v1, v3, :cond_29

    return v2

    :cond_29
    iget v1, p0, Ly0p;->d:I

    iget v3, p1, Ly0p;->d:I

    if-eq v1, v3, :cond_30

    return v2

    :cond_30
    iget v1, p0, Ly0p;->e:I

    iget v3, p1, Ly0p;->e:I

    if-eq v1, v3, :cond_37

    return v2

    :cond_37
    iget v1, p0, Ly0p;->f:I

    iget v3, p1, Ly0p;->f:I

    if-eq v1, v3, :cond_3e

    return v2

    :cond_3e
    iget v1, p0, Ly0p;->g:I

    iget v3, p1, Ly0p;->g:I

    if-eq v1, v3, :cond_45

    return v2

    :cond_45
    iget-object v1, p0, Ly0p;->h:Ljava/util/List;

    iget-object v3, p1, Ly0p;->h:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_50

    return v2

    :cond_50
    iget v1, p0, Ly0p;->i:I

    iget v3, p1, Ly0p;->i:I

    if-eq v1, v3, :cond_57

    return v2

    :cond_57
    iget-object v1, p0, Ly0p;->j:Ljava/util/List;

    iget-object v3, p1, Ly0p;->j:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_62

    return v2

    :cond_62
    iget-object v1, p0, Ly0p;->k:Ljava/lang/Integer;

    iget-object v3, p1, Ly0p;->k:Ljava/lang/Integer;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6d

    return v2

    :cond_6d
    iget-object v1, p0, Ly0p;->l:Ljava/util/List;

    iget-object v3, p1, Ly0p;->l:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_78

    return v2

    :cond_78
    iget-object p0, p0, Ly0p;->m:Ljava/util/List;

    iget-object p1, p1, Ly0p;->m:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_83

    return v2

    :cond_83
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ly0p;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ly0p;->b:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget v2, p0, Ly0p;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ly0p;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ly0p;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ly0p;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ly0p;->g:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Ly0p;->h:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget v2, p0, Ly0p;->i:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Ly0p;->j:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Ly0p;->k:Ljava/lang/Integer;

    if-nez v3, :cond_46

    move v3, v2

    goto :goto_4a

    :cond_46
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_4a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ly0p;->l:Ljava/util/List;

    invoke-static {v0, v1, v3}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Ly0p;->m:Ljava/util/List;

    if-eqz p0, :cond_5a

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_5a
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Video(mimes="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ly0p;->a:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", protocols="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ly0p;->b:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", w="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ly0p;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", h="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ly0p;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", placement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ly0p;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", linearity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ly0p;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", skip="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ly0p;->g:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", playbackmethod="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ly0p;->h:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", playbackend="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ly0p;->i:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", delivery="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ly0p;->j:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", pos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ly0p;->k:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", api="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ly0p;->l:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", companiontype="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ly0p;->m:Ljava/util/List;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
