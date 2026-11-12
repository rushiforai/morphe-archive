.class public final Ltxo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lawo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:Lomj;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lawo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ltxo;->Companion:Lawo;

    new-instance v0, Lomj;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lomj;-><init>(B)V

    sput-object v0, Ltxo;->c:Lomj;

    return-void
.end method

.method public constructor <init>(IJLjava/lang/String;)V
    .registers 9

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-ne v2, v0, :cond_2a

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Ltxo;->a:Ljava/lang/String;

    iput-wide p2, p0, Ltxo;->b:J

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p0

    const-string p1, "Check failed."

    if-lez p0, :cond_26

    invoke-static {p4}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result p0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p4

    if-ne p0, p4, :cond_26

    const-wide/16 v2, 0x0

    cmp-long p0, p2, v2

    if-lez p0, :cond_26

    return-void

    :cond_26
    invoke-static {p1}, Lqp2;->n(Ljava/lang/String;)V

    throw v1

    :cond_2a
    sget-object p0, Lpvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .registers 6

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltxo;->a:Ljava/lang/String;

    iput-wide p2, p0, Ltxo;->b:J

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v0, 0x0

    const-string v1, "Check failed."

    if-lez p0, :cond_21

    invoke-static {p1}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-ne p0, p1, :cond_21

    const-wide/16 p0, 0x0

    cmp-long p0, p2, p0

    if-lez p0, :cond_21

    return-void

    :cond_21
    invoke-static {v1}, Lqp2;->n(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ltxo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ltxo;

    iget-object v1, p0, Ltxo;->a:Ljava/lang/String;

    iget-object v3, p1, Ltxo;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-wide v3, p0, Ltxo;->b:J

    iget-wide p0, p1, Ltxo;->b:J

    cmp-long p0, v3, p0

    if-eqz p0, :cond_20

    return v2

    :cond_20
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ltxo;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Ltxo;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BlockedAd(creativeId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ltxo;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Ltxo;->b:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
