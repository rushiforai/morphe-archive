.class public final Lqwo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lpwo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lpwo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lqwo;->Companion:Lpwo;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 12

    and-int/lit8 v0, p1, 0x40

    const/4 v1, 0x0

    const/16 v2, 0x40

    if-ne v2, v0, :cond_64

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_10

    const-string p2, "Opera"

    :cond_10
    iput-object p2, p0, Lqwo;->a:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_1b

    sget-object p2, Lrxo;->k:Ljava/lang/String;

    iput-object p2, p0, Lqwo;->b:Ljava/lang/String;

    goto :goto_1d

    :cond_1b
    iput-object p3, p0, Lqwo;->b:Ljava/lang/String;

    :goto_1d
    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_2e

    sget-object p2, Lfcp;->c:Lc30;

    if-eqz p2, :cond_2a

    sget-object p2, Lkn;->a:[Lkn;

    const-string p2, "admob"

    goto :goto_2b

    :cond_2a
    move-object p2, v1

    :goto_2b
    iput-object p2, p0, Lqwo;->c:Ljava/lang/String;

    goto :goto_30

    :cond_2e
    iput-object p4, p0, Lqwo;->c:Ljava/lang/String;

    :goto_30
    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_3f

    sget-object p2, Lfcp;->c:Lc30;

    if-eqz p2, :cond_3b

    iget-object p2, p2, Lc30;->b:Ljava/lang/String;

    goto :goto_3c

    :cond_3b
    move-object p2, v1

    :goto_3c
    iput-object p2, p0, Lqwo;->d:Ljava/lang/String;

    goto :goto_41

    :cond_3f
    iput-object p5, p0, Lqwo;->d:Ljava/lang/String;

    :goto_41
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_50

    sget-object p2, Lfcp;->c:Lc30;

    if-eqz p2, :cond_4c

    const-string p2, "2.14.0.0"

    goto :goto_4d

    :cond_4c
    move-object p2, v1

    :goto_4d
    iput-object p2, p0, Lqwo;->e:Ljava/lang/String;

    goto :goto_52

    :cond_50
    iput-object p6, p0, Lqwo;->e:Ljava/lang/String;

    :goto_52
    and-int/lit8 p1, p1, 0x20

    if-nez p1, :cond_59

    iput-object v1, p0, Lqwo;->f:Ljava/lang/String;

    goto :goto_5b

    :cond_59
    iput-object p7, p0, Lqwo;->f:Ljava/lang/String;

    :goto_5b
    iput-object p8, p0, Lqwo;->g:Ljava/lang/Integer;

    iget-object p0, p0, Lqwo;->f:Ljava/lang/String;

    if-eqz p0, :cond_63

    sget-object p0, Lwjo;->b:Lwjo;

    :cond_63
    return-void

    :cond_64
    sget-object p0, Lowo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 8

    .line 106
    sget-object v0, Lrxo;->k:Ljava/lang/String;

    .line 107
    sget-object v1, Lfcp;->c:Lc30;

    const/4 v2, 0x0

    if-eqz v1, :cond_c

    .line 108
    sget-object v1, Lkn;->a:[Lkn;

    const-string v1, "admob"

    goto :goto_d

    :cond_c
    move-object v1, v2

    .line 109
    :goto_d
    sget-object v3, Lfcp;->c:Lc30;

    if-eqz v3, :cond_14

    .line 110
    iget-object v3, v3, Lc30;->b:Ljava/lang/String;

    goto :goto_15

    :cond_14
    move-object v3, v2

    .line 111
    :goto_15
    sget-object v4, Lfcp;->c:Lc30;

    if-eqz v4, :cond_1b

    .line 112
    const-string v2, "2.14.0.0"

    .line 113
    :cond_1b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v4, "Opera"

    iput-object v4, p0, Lqwo;->a:Ljava/lang/String;

    iput-object v0, p0, Lqwo;->b:Ljava/lang/String;

    iput-object v1, p0, Lqwo;->c:Ljava/lang/String;

    iput-object v3, p0, Lqwo;->d:Ljava/lang/String;

    iput-object v2, p0, Lqwo;->e:Ljava/lang/String;

    iput-object p1, p0, Lqwo;->f:Ljava/lang/String;

    iput-object p2, p0, Lqwo;->g:Ljava/lang/Integer;

    if-eqz p1, :cond_32

    sget-object p0, Lwjo;->b:Lwjo;

    :cond_32
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lqwo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lqwo;

    iget-object v1, p0, Lqwo;->a:Ljava/lang/String;

    iget-object v3, p1, Lqwo;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lqwo;->b:Ljava/lang/String;

    iget-object v3, p1, Lqwo;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lqwo;->c:Ljava/lang/String;

    iget-object v3, p1, Lqwo;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lqwo;->d:Ljava/lang/String;

    iget-object v3, p1, Lqwo;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Lqwo;->e:Ljava/lang/String;

    iget-object v3, p1, Lqwo;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-object v1, p0, Lqwo;->f:Ljava/lang/String;

    iget-object v3, p1, Lqwo;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4e

    return v2

    :cond_4e
    iget-object p0, p0, Lqwo;->g:Ljava/lang/Integer;

    iget-object p1, p1, Lqwo;->g:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_59

    return v2

    :cond_59
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lqwo;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqwo;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lqwo;->c:Ljava/lang/String;

    if-nez v3, :cond_16

    move v3, v2

    goto :goto_1a

    :cond_16
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lqwo;->d:Ljava/lang/String;

    if-nez v3, :cond_22

    move v3, v2

    goto :goto_26

    :cond_22
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_26
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lqwo;->e:Ljava/lang/String;

    if-nez v3, :cond_2e

    move v3, v2

    goto :goto_32

    :cond_2e
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_32
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lqwo;->f:Ljava/lang/String;

    if-nez v3, :cond_3a

    move v3, v2

    goto :goto_3e

    :cond_3a
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3e
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Lqwo;->g:Ljava/lang/Integer;

    if-eqz p0, :cond_48

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_48
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SourceExt(omidpn="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lqwo;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", omidpv="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lqwo;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mediationId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lqwo;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mediationSdkVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lqwo;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mediationAdapterSdkVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lqwo;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", bidTokenMediationId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lqwo;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", auctionType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lqwo;->g:Ljava/lang/Integer;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
