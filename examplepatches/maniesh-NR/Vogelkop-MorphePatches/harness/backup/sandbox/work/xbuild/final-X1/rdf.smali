.class public final Lrdf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqdf;

.field public final b:Z


# direct methods
.method public constructor <init>(Lqdf;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrdf;->a:Lqdf;

    iput-boolean p2, p0, Lrdf;->b:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    instance-of v0, p1, Lrdf;

    if-eqz v0, :cond_14

    check-cast p1, Lrdf;

    iget-object v0, p0, Lrdf;->a:Lqdf;

    iget-object v1, p1, Lrdf;->a:Lqdf;

    if-ne v0, v1, :cond_14

    iget-boolean p0, p0, Lrdf;->b:Z

    iget-boolean p1, p1, Lrdf;->b:Z

    if-eq p0, p1, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lrdf;->a:Lqdf;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lrdf;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
