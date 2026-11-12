.class public final Lwyo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lvyo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:J

.field public final j:J

.field public final k:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lvyo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwyo;->Companion:Lvyo;

    return-void
.end method

.method public constructor <init>(IIIIIIIJJ)V
    .registers 14

    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v1, "aaid"

    iput-object v1, p0, Lwyo;->a:Ljava/lang/String;

    iput p1, p0, Lwyo;->b:I

    iput p2, p0, Lwyo;->c:I

    iput p3, p0, Lwyo;->d:I

    iput p4, p0, Lwyo;->e:I

    iput p5, p0, Lwyo;->f:I

    iput p6, p0, Lwyo;->g:I

    iput p7, p0, Lwyo;->h:I

    iput-wide p8, p0, Lwyo;->i:J

    iput-wide p10, p0, Lwyo;->j:J

    iput-object v0, p0, Lwyo;->k:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IIIIIIIJJLjava/lang/String;)V
    .registers 17

    and-int/lit16 v0, p1, 0x7fe

    const/16 v1, 0x7fe

    if-ne v1, v0, :cond_2b

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 p1, p1, 0x1

    if-nez p1, :cond_12

    const-string p1, "aaid"

    iput-object p1, p0, Lwyo;->a:Ljava/lang/String;

    goto :goto_14

    :cond_12
    iput-object p2, p0, Lwyo;->a:Ljava/lang/String;

    :goto_14
    iput p3, p0, Lwyo;->b:I

    iput p4, p0, Lwyo;->c:I

    iput p5, p0, Lwyo;->d:I

    iput p6, p0, Lwyo;->e:I

    iput p7, p0, Lwyo;->f:I

    iput p8, p0, Lwyo;->g:I

    iput p9, p0, Lwyo;->h:I

    iput-wide p10, p0, Lwyo;->i:J

    iput-wide p12, p0, Lwyo;->j:J

    move-object/from16 p1, p14

    iput-object p1, p0, Lwyo;->k:Ljava/lang/String;

    return-void

    :cond_2b
    sget-object p0, Luyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwyo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwyo;

    iget-object v1, p0, Lwyo;->a:Ljava/lang/String;

    iget-object v3, p1, Lwyo;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget v1, p0, Lwyo;->b:I

    iget v3, p1, Lwyo;->b:I

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget v1, p0, Lwyo;->c:I

    iget v3, p1, Lwyo;->c:I

    if-eq v1, v3, :cond_25

    return v2

    :cond_25
    iget v1, p0, Lwyo;->d:I

    iget v3, p1, Lwyo;->d:I

    if-eq v1, v3, :cond_2c

    return v2

    :cond_2c
    iget v1, p0, Lwyo;->e:I

    iget v3, p1, Lwyo;->e:I

    if-eq v1, v3, :cond_33

    return v2

    :cond_33
    iget v1, p0, Lwyo;->f:I

    iget v3, p1, Lwyo;->f:I

    if-eq v1, v3, :cond_3a

    return v2

    :cond_3a
    iget v1, p0, Lwyo;->g:I

    iget v3, p1, Lwyo;->g:I

    if-eq v1, v3, :cond_41

    return v2

    :cond_41
    iget v1, p0, Lwyo;->h:I

    iget v3, p1, Lwyo;->h:I

    if-eq v1, v3, :cond_48

    return v2

    :cond_48
    iget-wide v3, p0, Lwyo;->i:J

    iget-wide v5, p1, Lwyo;->i:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_51

    return v2

    :cond_51
    iget-wide v3, p0, Lwyo;->j:J

    iget-wide v5, p1, Lwyo;->j:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_5a

    return v2

    :cond_5a
    iget-object p0, p0, Lwyo;->k:Ljava/lang/String;

    iget-object p1, p1, Lwyo;->k:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_65

    return v2

    :cond_65
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lwyo;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lwyo;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lwyo;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lwyo;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lwyo;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lwyo;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lwyo;->g:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lwyo;->h:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-wide v2, p0, Lwyo;->i:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lwyo;->j:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Lwyo;->k:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeviceExt(ifaType="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lwyo;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", osApiLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", googleServiceAvailable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", batteryLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", batteryStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", volumeLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mute="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->g:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", sdcardAvailable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lwyo;->h:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", systemBootedTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lwyo;->i:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", systemBuildTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lwyo;->j:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", romFingerprint="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lwyo;->k:Ljava/lang/String;

    const/16 v1, 0x29

    invoke-static {v0, p0, v1}, Lo18;->p(Ljava/lang/StringBuilder;Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
