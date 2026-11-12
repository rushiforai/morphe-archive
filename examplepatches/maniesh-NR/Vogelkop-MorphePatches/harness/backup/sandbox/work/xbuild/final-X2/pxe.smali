.class public final Lpxe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZZLjava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lpxe;->a:Z

    iput-boolean p2, p0, Lpxe;->b:Z

    iput-object p3, p0, Lpxe;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lpxe;

    if-eqz v0, :cond_1e

    check-cast p1, Lpxe;

    iget-boolean v0, p0, Lpxe;->a:Z

    iget-boolean v1, p1, Lpxe;->a:Z

    if-ne v0, v1, :cond_1e

    iget-boolean v0, p0, Lpxe;->b:Z

    iget-boolean v1, p1, Lpxe;->b:Z

    if-ne v0, v1, :cond_1e

    iget-object p0, p0, Lpxe;->c:Ljava/lang/String;

    iget-object p1, p1, Lpxe;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lpxe;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lpxe;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lpxe;->c:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
