.class public final Lr2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm2l;


# instance fields
.field public final a:Lq2l;

.field public final b:J


# direct methods
.method public constructor <init>(Lq2l;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr2l;->a:Lq2l;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    int-to-long v0, p1

    sget-object p1, Ljgm;->b:Ligm;

    const-wide v2, 0x8000000000L

    or-long/2addr v0, v2

    iput-wide v0, p0, Lr2l;->b:J

    return-void
.end method


# virtual methods
.method public final b()La26;
    .registers 1

    sget-object p0, Lg4a;->o:Lg4a;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_10

    instance-of v0, p1, Lr2l;

    if-eqz v0, :cond_e

    check-cast p1, Lr2l;

    iget-object p0, p0, Lr2l;->a:Lq2l;

    iget-object p1, p1, Lr2l;->a:Lq2l;

    if-eq p0, p1, :cond_10

    :cond_e
    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lr2l;->b:J

    return-wide v0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lr2l;->a:Lq2l;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
