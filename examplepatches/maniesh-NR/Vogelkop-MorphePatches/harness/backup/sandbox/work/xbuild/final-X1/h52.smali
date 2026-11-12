.class public final Lh52;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lo29;

.field public final c:Lux1;

.field public final d:Z

.field public final e:Z

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lz92;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh52;->a:Ljava/lang/String;

    iput-object p2, p0, Lh52;->b:Lo29;

    iput-object p3, p0, Lh52;->c:Lux1;

    iput-boolean p4, p0, Lh52;->d:Z

    iput-boolean p5, p0, Lh52;->e:Z

    iput-object p6, p0, Lh52;->f:Ljava/lang/String;

    iput-object p7, p0, Lh52;->g:Ljava/lang/String;

    iput-object p8, p0, Lh52;->h:Ljava/lang/String;

    iput-object p9, p0, Lh52;->i:Ljava/lang/String;

    iput-object p10, p0, Lh52;->j:Lz92;

    return-void
.end method

.method public static a(Lh52;Z)Lh52;
    .registers 13

    iget-object v1, p0, Lh52;->a:Ljava/lang/String;

    iget-object v2, p0, Lh52;->b:Lo29;

    iget-object v3, p0, Lh52;->c:Lux1;

    iget-boolean v4, p0, Lh52;->d:Z

    iget-object v6, p0, Lh52;->f:Ljava/lang/String;

    iget-object v7, p0, Lh52;->g:Ljava/lang/String;

    iget-object v8, p0, Lh52;->h:Ljava/lang/String;

    iget-object v9, p0, Lh52;->i:Ljava/lang/String;

    iget-object v10, p0, Lh52;->j:Lz92;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lh52;

    move v5, p1

    invoke-direct/range {v0 .. v10}, Lh52;-><init>(Ljava/lang/String;Lo29;Lux1;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lz92;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_5e

    instance-of v0, p1, Lh52;

    if-eqz v0, :cond_5c

    check-cast p1, Lh52;

    iget-object v0, p0, Lh52;->a:Ljava/lang/String;

    iget-object v1, p1, Lh52;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lh52;->b:Lo29;

    iget-object v1, p1, Lh52;->b:Lo29;

    if-ne v0, v1, :cond_5c

    iget-object v0, p0, Lh52;->c:Lux1;

    iget-object v1, p1, Lh52;->c:Lux1;

    if-ne v0, v1, :cond_5c

    iget-boolean v0, p0, Lh52;->d:Z

    iget-boolean v1, p1, Lh52;->d:Z

    if-ne v0, v1, :cond_5c

    iget-boolean v0, p0, Lh52;->e:Z

    iget-boolean v1, p1, Lh52;->e:Z

    if-ne v0, v1, :cond_5c

    iget-object v0, p0, Lh52;->f:Ljava/lang/String;

    iget-object v1, p1, Lh52;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lh52;->g:Ljava/lang/String;

    iget-object v1, p1, Lh52;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lh52;->h:Ljava/lang/String;

    iget-object v1, p1, Lh52;->h:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lh52;->i:Ljava/lang/String;

    iget-object v1, p1, Lh52;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object p0, p0, Lh52;->j:Lz92;

    iget-object p1, p1, Lh52;->j:Lz92;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5e

    :cond_5c
    const/4 p0, 0x0

    return p0

    :cond_5e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lh52;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lh52;->b:Lo29;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lh52;->c:Lux1;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-boolean v0, p0, Lh52;->d:Z

    invoke-static {v3, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lh52;->e:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lh52;->f:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v3, p0, Lh52;->g:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v3, p0, Lh52;->h:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v3, p0, Lh52;->i:Ljava/lang/String;

    if-nez v3, :cond_42

    move v3, v2

    goto :goto_46

    :cond_42
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_46
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Lh52;->j:Lz92;

    if-eqz p0, :cond_52

    iget-object p0, p0, Lz92;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_52
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
