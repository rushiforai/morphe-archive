.class public final Lvj5;
.super Lx1p;
.source "SourceFile"


# instance fields
.field public final p:Ljava/lang/String;

.field public final q:Ljava/util/ArrayList;

.field public final r:Lffb;

.field public final s:Lffb;

.field public final t:Z

.field public final u:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;Lffb;Lffb;ZZ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvj5;->p:Ljava/lang/String;

    iput-object p2, p0, Lvj5;->q:Ljava/util/ArrayList;

    iput-object p3, p0, Lvj5;->r:Lffb;

    iput-object p4, p0, Lvj5;->s:Lffb;

    iput-boolean p5, p0, Lvj5;->t:Z

    iput-boolean p6, p0, Lvj5;->u:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3e

    instance-of v0, p1, Lvj5;

    if-eqz v0, :cond_3c

    check-cast p1, Lvj5;

    iget-object v0, p0, Lvj5;->p:Ljava/lang/String;

    iget-object v1, p1, Lvj5;->p:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lvj5;->q:Ljava/util/ArrayList;

    iget-object v1, p1, Lvj5;->q:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lvj5;->r:Lffb;

    iget-object v1, p1, Lvj5;->r:Lffb;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lvj5;->s:Lffb;

    iget-object v1, p1, Lvj5;->s:Lffb;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-boolean v0, p0, Lvj5;->t:Z

    iget-boolean v1, p1, Lvj5;->t:Z

    if-ne v0, v1, :cond_3c

    iget-boolean p0, p0, Lvj5;->u:Z

    iget-boolean p1, p1, Lvj5;->u:Z

    if-eq p0, p1, :cond_3e

    :cond_3c
    const/4 p0, 0x0

    return p0

    :cond_3e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lvj5;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lvj5;->q:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-object v2, p0, Lvj5;->r:Lffb;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lvj5;->s:Lffb;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lvj5;->t:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lvj5;->u:Z

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
