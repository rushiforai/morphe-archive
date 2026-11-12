.class public final Lc85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsmh;


# instance fields
.field public final a:Lm4l;

.field public final b:Ljava/util/ArrayList;

.field public final c:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lm4l;->Companion:Ll4l;

    return-void
.end method

.method public constructor <init>(Lm4l;Ljava/util/ArrayList;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc85;->a:Lm4l;

    iput-object p2, p0, Lc85;->b:Ljava/util/ArrayList;

    iget p1, p1, Lm4l;->a:I

    sget-object p2, Ldgm;->b:Lcgm;

    int-to-long p1, p1

    const-wide v0, 0xffffffffL

    and-long/2addr p1, v0

    const-wide v0, 0x200000000L

    or-long/2addr p1, v0

    iput-wide p1, p0, Lc85;->c:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lc85;

    if-eqz v0, :cond_1c

    check-cast p1, Lc85;

    iget-object v0, p0, Lc85;->a:Lm4l;

    iget-object v1, p1, Lc85;->a:Lm4l;

    invoke-virtual {v0, v1}, Lm4l;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lc85;->b:Ljava/util/ArrayList;

    iget-object p1, p1, Lc85;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lc85;->c:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lc85;->a:Lm4l;

    invoke-virtual {v0}, Lm4l;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lc85;->b:Ljava/util/ArrayList;

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
