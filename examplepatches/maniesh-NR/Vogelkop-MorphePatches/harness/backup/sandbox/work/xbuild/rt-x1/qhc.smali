.class public final Lqhc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lal3;

.field public final b:I


# direct methods
.method public constructor <init>(Lal3;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqhc;->a:Lal3;

    iput p2, p0, Lqhc;->b:I

    return-void
.end method

.method public static b(Lal3;)Lqhc;
    .registers 3

    invoke-interface {p0}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_16

    move-object v0, p0

    check-cast v0, Lml3;

    invoke-static {v0}, Lalo;->S(Lml3;)Z

    move-result v0

    if-eqz v0, :cond_16

    new-instance v0, Lqhc;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lqhc;-><init>(Lal3;I)V

    return-object v0

    :cond_16
    invoke-interface {p0}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_2c

    move-object v0, p0

    check-cast v0, Lml3;

    invoke-static {v0}, Lalo;->T(Lml3;)Z

    move-result v0

    if-eqz v0, :cond_2c

    new-instance v0, Lqhc;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lqhc;-><init>(Lal3;I)V

    return-object v0

    :cond_2c
    new-instance v0, Lqhc;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lqhc;-><init>(Lal3;I)V

    return-object v0
.end method


# virtual methods
.method public final a()Z
    .registers 3

    iget p0, p0, Lqhc;->b:I

    const/4 v0, 0x1

    if-eq p0, v0, :cond_d

    const/4 v1, 0x3

    if-eq p0, v1, :cond_d

    const/4 v1, 0x4

    if-eq p0, v1, :cond_d

    const/4 p0, 0x0

    return p0

    :cond_d
    return v0
.end method

.method public final c()I
    .registers 4

    iget v0, p0, Lqhc;->b:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 v2, 0x7

    if-ne v0, v2, :cond_c

    const/4 p0, 0x4

    return p0

    :cond_c
    const/16 v2, 0x8

    if-ne v0, v2, :cond_12

    const/4 p0, 0x5

    return p0

    :cond_12
    const/16 v2, 0x9

    if-ne v0, v2, :cond_17

    return v1

    :cond_17
    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lol3;->g()Z

    move-result p0

    if-eqz p0, :cond_21

    const/4 p0, 0x2

    return p0

    :cond_21
    const/4 p0, 0x3

    return p0
.end method

.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 4

    iget v0, p0, Lqhc;->b:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_d

    const p0, 0x7f140393

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_d
    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_1c

    check-cast p0, Lml3;

    invoke-static {p0, p1}, Lalo;->J(Lml3;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1c
    check-cast p0, Lpl3;

    invoke-static {p0}, Lalo;->K(Lpl3;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .registers 4

    iget v0, p0, Lqhc;->b:I

    const/4 v1, 0x2

    const-string v2, ""

    if-eq v0, v1, :cond_1f

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lol3;->g()Z

    move-result v0

    if-nez v0, :cond_1f

    check-cast p0, Lpl3;

    invoke-interface {p0}, Lpl3;->getUrl()Lshf;

    move-result-object p0

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_1e

    return-object v2

    :cond_1e
    return-object p0

    :cond_1f
    return-object v2
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lqhc;

    if-eqz v0, :cond_20

    check-cast p1, Lqhc;

    iget v0, p0, Lqhc;->b:I

    iget v1, p1, Lqhc;->b:I

    if-ne v0, v1, :cond_20

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v0

    iget-object p0, p1, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-nez p0, :cond_20

    :cond_1e
    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lqhc;->b:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
