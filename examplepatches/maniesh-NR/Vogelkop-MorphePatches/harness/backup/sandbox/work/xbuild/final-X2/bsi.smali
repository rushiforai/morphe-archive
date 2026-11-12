.class public final Lbsi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Leri;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Ljava/util/List;

.field public final e:Lx92;

.field public final f:Lqt3;

.field public final g:Z

.field public final h:Z


# direct methods
.method public constructor <init>(Leri;Ljava/lang/String;ILjava/util/List;Lx92;Lqt3;ZZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbsi;->a:Leri;

    iput-object p2, p0, Lbsi;->b:Ljava/lang/String;

    iput p3, p0, Lbsi;->c:I

    iput-object p4, p0, Lbsi;->d:Ljava/util/List;

    iput-object p5, p0, Lbsi;->e:Lx92;

    iput-object p6, p0, Lbsi;->f:Lqt3;

    iput-boolean p7, p0, Lbsi;->g:Z

    iput-boolean p8, p0, Lbsi;->h:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_4a

    instance-of v0, p1, Lbsi;

    if-eqz v0, :cond_48

    check-cast p1, Lbsi;

    iget-object v0, p0, Lbsi;->a:Leri;

    iget-object v1, p1, Lbsi;->a:Leri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, p0, Lbsi;->b:Ljava/lang/String;

    iget-object v1, p1, Lbsi;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget v0, p0, Lbsi;->c:I

    iget v1, p1, Lbsi;->c:I

    if-ne v0, v1, :cond_48

    iget-object v0, p0, Lbsi;->d:Ljava/util/List;

    iget-object v1, p1, Lbsi;->d:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, p0, Lbsi;->e:Lx92;

    iget-object v1, p1, Lbsi;->e:Lx92;

    if-ne v0, v1, :cond_48

    iget-object v0, p0, Lbsi;->f:Lqt3;

    iget-object v1, p1, Lbsi;->f:Lqt3;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-boolean v0, p0, Lbsi;->g:Z

    iget-boolean v1, p1, Lbsi;->g:Z

    if-ne v0, v1, :cond_48

    iget-boolean p0, p0, Lbsi;->h:Z

    iget-boolean p1, p1, Lbsi;->h:Z

    if-eq p0, p1, :cond_4a

    :cond_48
    const/4 p0, 0x0

    return p0

    :cond_4a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lbsi;->a:Leri;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    const/16 v2, 0x1f

    mul-int/2addr v1, v2

    iget-object v3, p0, Lbsi;->b:Ljava/lang/String;

    if-nez v3, :cond_14

    move v3, v0

    goto :goto_18

    :cond_14
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_18
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget v3, p0, Lbsi;->c:I

    if-nez v3, :cond_20

    move v3, v0

    goto :goto_24

    :cond_20
    invoke-static {v3}, Lvep;->A(I)I

    move-result v3

    :goto_24
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lbsi;->d:Ljava/util/List;

    invoke-static {v1, v2, v3}, Lrfp;->f(IILjava/util/List;)I

    move-result v1

    iget-object v3, p0, Lbsi;->e:Lx92;

    if-nez v3, :cond_32

    move v3, v0

    goto :goto_36

    :cond_32
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_36
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    add-int/lit16 v1, v1, 0x4d5

    mul-int/2addr v1, v2

    iget-object v3, p0, Lbsi;->f:Lqt3;

    if-eqz v3, :cond_43

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_43
    add-int/2addr v1, v0

    mul-int/2addr v1, v2

    iget-boolean v0, p0, Lbsi;->g:Z

    invoke-static {v1, v2, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lbsi;->h:Z

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
