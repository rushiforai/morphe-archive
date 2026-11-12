.class public final Lzzd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvzd;


# instance fields
.field public final a:Lb2l;

.field public final b:I

.field public final c:J


# direct methods
.method public constructor <init>(Lb2l;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzzd;->a:Lb2l;

    iput p2, p0, Lzzd;->b:I

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    sget-object p2, Ldgm;->b:Lcgm;

    int-to-long p1, p1

    const-wide v0, 0xffffffffL

    and-long/2addr p1, v0

    iput-wide p1, p0, Lzzd;->c:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lzzd;

    if-eqz v0, :cond_18

    check-cast p1, Lzzd;

    iget-object v0, p0, Lzzd;->a:Lb2l;

    iget-object v1, p1, Lzzd;->a:Lb2l;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget p0, p0, Lzzd;->b:I

    iget p1, p1, Lzzd;->b:I

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lzzd;->c:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lzzd;->a:Lb2l;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lzzd;->b:I

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
