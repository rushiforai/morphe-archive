.class public final Lrd;
.super Lfe;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:Llxh;

.field public final d:Lrxh;


# direct methods
.method public constructor <init>(IZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lrd;->a:I

    iput-boolean p2, p0, Lrd;->b:Z

    new-instance p1, Llxh;

    const v0, 0x7f0803fe

    invoke-direct {p1, v0}, Llxh;-><init>(I)V

    iput-object p1, p0, Lrd;->c:Llxh;

    if-eqz p2, :cond_17

    const p1, 0x7f140634

    goto :goto_1a

    :cond_17
    const p1, 0x7f140635

    :goto_1a
    new-instance p2, Lrxh;

    invoke-direct {p2, p1}, Lrxh;-><init>(I)V

    iput-object p2, p0, Lrd;->d:Lrxh;

    return-void
.end method


# virtual methods
.method public final a()Lb8h;
    .registers 1

    iget-object p0, p0, Lrd;->c:Llxh;

    return-object p0
.end method

.method public final b()Lpxh;
    .registers 1

    iget-object p0, p0, Lrd;->d:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    instance-of v0, p1, Lrd;

    if-eqz v0, :cond_14

    check-cast p1, Lrd;

    iget v0, p0, Lrd;->a:I

    iget v1, p1, Lrd;->a:I

    if-ne v0, v1, :cond_14

    iget-boolean p0, p0, Lrd;->b:Z

    iget-boolean p1, p1, Lrd;->b:Z

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

    iget v0, p0, Lrd;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lrd;->b:Z

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
