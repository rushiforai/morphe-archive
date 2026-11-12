.class public final Lcwf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Z

.field public final c:Z

.field public d:I

.field public e:I

.field public final f:Lbwf;


# direct methods
.method public constructor <init>(Lbwf;Z)V
    .registers 4

    invoke-virtual {p1}, Lbwf;->b()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcwf;->a:Ljava/lang/String;

    iput-boolean p2, p0, Lcwf;->b:Z

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcwf;->c:Z

    iput-object p1, p0, Lcwf;->f:Lbwf;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_10

    :cond_f
    const/4 v2, 0x0

    :goto_10
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_18

    return v2

    :cond_18
    check-cast p1, Lcwf;

    iget-object v1, p0, Lcwf;->a:Ljava/lang/String;

    iget-object v3, p1, Lcwf;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    return v2

    :cond_25
    iget-boolean v1, p0, Lcwf;->b:Z

    iget-boolean v3, p1, Lcwf;->b:Z

    if-eq v1, v3, :cond_2c

    return v2

    :cond_2c
    iget-boolean v1, p0, Lcwf;->c:Z

    iget-boolean v3, p1, Lcwf;->c:Z

    if-eq v1, v3, :cond_33

    return v2

    :cond_33
    iget v1, p0, Lcwf;->d:I

    iget v3, p1, Lcwf;->d:I

    if-eq v1, v3, :cond_3a

    return v2

    :cond_3a
    iget p0, p0, Lcwf;->e:I

    iget p1, p1, Lcwf;->e:I

    if-eq p0, p1, :cond_41

    return v2

    :cond_41
    return v0
.end method

.method public final b()I
    .registers 4

    iget-object v0, p0, Lcwf;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lcwf;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lcwf;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Lcwf;->d:I

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget p0, p0, Lcwf;->e:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    const-class v2, Lcwf;

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_16

    return v2

    :cond_16
    invoke-virtual {p0, p1}, Lcwf;->a(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    return v2

    :cond_1d
    check-cast p1, Lcwf;

    iget-object p0, p0, Lcwf;->f:Lbwf;

    iget-object p1, p1, Lcwf;->f:Lbwf;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    return v2

    :cond_2a
    return v0
.end method

.method public final hashCode()I
    .registers 2

    invoke-virtual {p0}, Lcwf;->b()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcwf;->f:Lbwf;

    invoke-virtual {p0}, Lbwf;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
