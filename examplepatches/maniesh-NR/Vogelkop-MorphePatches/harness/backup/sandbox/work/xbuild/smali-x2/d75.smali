.class public final Ld75;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lo65;

.field public final b:Lo65;

.field public final c:Ljava/lang/String;

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Z


# direct methods
.method public constructor <init>(Lo65;Lo65;Ljava/lang/String;ZZZZZI)V
    .registers 13

    and-int/lit8 v0, p9, 0x1

    const/4 v1, -0x1

    const-string v2, "latest"

    if-eqz v0, :cond_c

    new-instance p1, Lo65;

    invoke-direct {p1, v1, v1, v1, v2}, Lo65;-><init>(IIILjava/lang/String;)V

    :cond_c
    and-int/lit8 v0, p9, 0x2

    if-eqz v0, :cond_15

    new-instance p2, Lo65;

    invoke-direct {p2, v1, v1, v1, v2}, Lo65;-><init>(IIILjava/lang/String;)V

    :cond_15
    and-int/lit8 v0, p9, 0x4

    if-eqz v0, :cond_1b

    const-string p3, ""

    :cond_1b
    and-int/lit8 v0, p9, 0x8

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    move p4, v1

    :cond_21
    and-int/lit8 v0, p9, 0x10

    if-eqz v0, :cond_26

    move p5, v1

    :cond_26
    and-int/lit8 v0, p9, 0x20

    if-eqz v0, :cond_2b

    move p6, v1

    :cond_2b
    and-int/lit8 v0, p9, 0x40

    if-eqz v0, :cond_30

    move p7, v1

    :cond_30
    and-int/lit16 v0, p9, 0x80

    if-eqz v0, :cond_35

    move p8, v1

    :cond_35
    and-int/lit16 p9, p9, 0x100

    if-nez p9, :cond_3a

    const/4 v1, 0x1

    :cond_3a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld75;->a:Lo65;

    iput-object p2, p0, Ld75;->b:Lo65;

    iput-object p3, p0, Ld75;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ld75;->d:Z

    iput-boolean p5, p0, Ld75;->e:Z

    iput-boolean p6, p0, Ld75;->f:Z

    iput-boolean p7, p0, Ld75;->g:Z

    iput-boolean p8, p0, Ld75;->h:Z

    iput-boolean v1, p0, Ld75;->i:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ld75;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ld75;

    iget-object v1, p0, Ld75;->a:Lo65;

    iget-object v3, p1, Ld75;->a:Lo65;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ld75;->b:Lo65;

    iget-object v3, p1, Ld75;->b:Lo65;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Ld75;->c:Ljava/lang/String;

    iget-object v3, p1, Ld75;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-boolean v1, p0, Ld75;->d:Z

    iget-boolean v3, p1, Ld75;->d:Z

    if-eq v1, v3, :cond_34

    return v2

    :cond_34
    iget-boolean v1, p0, Ld75;->e:Z

    iget-boolean v3, p1, Ld75;->e:Z

    if-eq v1, v3, :cond_3b

    return v2

    :cond_3b
    iget-boolean v1, p0, Ld75;->f:Z

    iget-boolean v3, p1, Ld75;->f:Z

    if-eq v1, v3, :cond_42

    return v2

    :cond_42
    iget-boolean v1, p0, Ld75;->g:Z

    iget-boolean v3, p1, Ld75;->g:Z

    if-eq v1, v3, :cond_49

    return v2

    :cond_49
    iget-boolean v1, p0, Ld75;->h:Z

    iget-boolean v3, p1, Ld75;->h:Z

    if-eq v1, v3, :cond_50

    return v2

    :cond_50
    iget-boolean p0, p0, Ld75;->i:Z

    iget-boolean p1, p1, Ld75;->i:Z

    if-eq p0, p1, :cond_57

    return v2

    :cond_57
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ld75;->a:Lo65;

    invoke-virtual {v0}, Lo65;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ld75;->b:Lo65;

    invoke-virtual {v2}, Lo65;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ld75;->c:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-boolean v2, p0, Ld75;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld75;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld75;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld75;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ld75;->h:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Ld75;->i:Z

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
