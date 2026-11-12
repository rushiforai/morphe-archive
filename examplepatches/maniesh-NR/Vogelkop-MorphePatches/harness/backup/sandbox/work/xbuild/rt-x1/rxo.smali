.class public final Lrxo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ldwo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final j:[Lkotlinx/serialization/KSerializer;

.field public static final k:Ljava/lang/String;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/List;

.field public final c:Lhuo;

.field public final d:Ljzo;

.field public final e:Lwwo;

.field public final f:I

.field public final g:Lmwo;

.field public final h:Lhwo;

.field public final i:Lzvo;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ldwo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrxo;->Companion:Ldwo;

    new-instance v0, Lk72;

    sget-object v1, Le0p;->a:Le0p;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v1, 0x9

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v0, v1, v2

    const/4 v0, 0x2

    aput-object v3, v1, v0

    const/4 v0, 0x3

    aput-object v3, v1, v0

    const/4 v0, 0x4

    aput-object v3, v1, v0

    const/4 v0, 0x5

    aput-object v3, v1, v0

    const/4 v0, 0x6

    aput-object v3, v1, v0

    const/4 v0, 0x7

    aput-object v3, v1, v0

    const/16 v0, 0x8

    aput-object v3, v1, v0

    sput-object v1, Lrxo;->j:[Lkotlinx/serialization/KSerializer;

    const-string v0, "opera-android-2.14.0"

    sput-object v0, Lrxo;->k:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/util/List;Lhuo;Ljzo;Lwwo;ILmwo;Lhwo;Lzvo;)V
    .registers 13

    and-int/lit16 v0, p1, 0x1df

    const/16 v1, 0x1df

    if-ne v1, v0, :cond_3d

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lrxo;->a:Ljava/lang/String;

    iput-object p3, p0, Lrxo;->b:Ljava/util/List;

    iput-object p4, p0, Lrxo;->c:Lhuo;

    iput-object p5, p0, Lrxo;->d:Ljzo;

    iput-object p6, p0, Lrxo;->e:Lwwo;

    and-int/lit8 p1, p1, 0x20

    if-nez p1, :cond_1b

    const/4 p1, 0x1

    iput p1, p0, Lrxo;->f:I

    goto :goto_1d

    :cond_1b
    iput p7, p0, Lrxo;->f:I

    :goto_1d
    iput-object p8, p0, Lrxo;->g:Lmwo;

    iput-object p9, p0, Lrxo;->h:Lhwo;

    iput-object p10, p0, Lrxo;->i:Lzvo;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p0

    const-string p1, "Failed requirement."

    if-lez p0, :cond_38

    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_37

    iget-object p0, p8, Lmwo;->a:Lqwo;

    iget-object p0, p0, Lqwo;->f:Ljava/lang/String;

    if-eqz p0, :cond_38

    :cond_37
    return-void

    :cond_38
    invoke-static {p1}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_3d
    sget-object p0, Lnvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Lhuo;Ljzo;Lwwo;Lmwo;Lhwo;Lzvo;)V
    .registers 9

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrxo;->a:Ljava/lang/String;

    iput-object p2, p0, Lrxo;->b:Ljava/util/List;

    iput-object p3, p0, Lrxo;->c:Lhuo;

    iput-object p4, p0, Lrxo;->d:Ljzo;

    iput-object p5, p0, Lrxo;->e:Lwwo;

    const/4 p3, 0x1

    iput p3, p0, Lrxo;->f:I

    iput-object p6, p0, Lrxo;->g:Lmwo;

    iput-object p7, p0, Lrxo;->h:Lhwo;

    iput-object p8, p0, Lrxo;->i:Lzvo;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/4 p1, 0x0

    const-string p3, "Failed requirement."

    if-lez p0, :cond_2c

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_2b

    .line 69
    iget-object p0, p6, Lmwo;->a:Lqwo;

    .line 70
    iget-object p0, p0, Lqwo;->f:Ljava/lang/String;

    if-eqz p0, :cond_2c

    :cond_2b
    return-void

    .line 71
    :cond_2c
    invoke-static {p3}, Lqp2;->o(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lrxo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lrxo;

    iget-object v1, p0, Lrxo;->a:Ljava/lang/String;

    iget-object v3, p1, Lrxo;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lrxo;->b:Ljava/util/List;

    iget-object v3, p1, Lrxo;->b:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lrxo;->c:Lhuo;

    iget-object v3, p1, Lrxo;->c:Lhuo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lrxo;->d:Ljzo;

    iget-object v3, p1, Lrxo;->d:Ljzo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Lrxo;->e:Lwwo;

    iget-object v3, p1, Lrxo;->e:Lwwo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget v1, p0, Lrxo;->f:I

    iget v3, p1, Lrxo;->f:I

    if-eq v1, v3, :cond_4a

    return v2

    :cond_4a
    iget-object v1, p0, Lrxo;->g:Lmwo;

    iget-object v3, p1, Lrxo;->g:Lmwo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    return v2

    :cond_55
    iget-object v1, p0, Lrxo;->h:Lhwo;

    iget-object v3, p1, Lrxo;->h:Lhwo;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    return v2

    :cond_60
    iget-object p0, p0, Lrxo;->i:Lzvo;

    iget-object p1, p1, Lrxo;->i:Lzvo;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6b

    return v2

    :cond_6b
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lrxo;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lrxo;->b:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Lrxo;->c:Lhuo;

    invoke-virtual {v2}, Lhuo;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lrxo;->d:Ljzo;

    invoke-virtual {v0}, Ljzo;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lrxo;->e:Lwwo;

    invoke-virtual {v2}, Lwwo;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget v0, p0, Lrxo;->f:I

    invoke-static {v0, v2, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lrxo;->g:Lmwo;

    iget-object v2, v2, Lmwo;->a:Lqwo;

    invoke-virtual {v2}, Lqwo;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lrxo;->h:Lhwo;

    invoke-virtual {v0}, Lhwo;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lrxo;->i:Lzvo;

    if-nez p0, :cond_45

    const/4 p0, 0x0

    goto :goto_49

    :cond_45
    invoke-virtual {p0}, Lzvo;->hashCode()I

    move-result p0

    :goto_49
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BidRequestObject(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lrxo;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", imp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrxo;->b:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", app="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrxo;->c:Lhuo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", device="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrxo;->d:Ljzo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", user="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrxo;->e:Lwwo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", at="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lrxo;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrxo;->g:Lmwo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", regs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrxo;->h:Lhwo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", ext="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lrxo;->i:Lzvo;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
