.class public final Lyzd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvzd;


# instance fields
.field public final a:I

.field public final b:Ljava/util/ArrayList;

.field public final c:Lp6l;

.field public final d:J


# direct methods
.method public constructor <init>(ILjava/util/ArrayList;Lp6l;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lyzd;->a:I

    iput-object p2, p0, Lyzd;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Lyzd;->c:Lp6l;

    sget-object p2, Ldgm;->b:Lcgm;

    int-to-long p1, p1

    const-wide v0, 0xffffffffL

    and-long/2addr p1, v0

    sget-object p3, Ljgm;->b:Ligm;

    const-wide v0, 0x200000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lyzd;->d:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lyzd;

    if-eqz v0, :cond_1e

    check-cast p1, Lyzd;

    iget v0, p0, Lyzd;->a:I

    iget v1, p1, Lyzd;->a:I

    if-ne v0, v1, :cond_1e

    iget-object v0, p0, Lyzd;->b:Ljava/util/ArrayList;

    iget-object v1, p1, Lyzd;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lyzd;->c:Lp6l;

    iget-object p1, p1, Lyzd;->c:Lp6l;

    if-eq p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lyzd;->d:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lyzd;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lyzd;->b:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-object p0, p0, Lyzd;->c:Lp6l;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
